-- Databricks notebook source
-- MAGIC %sql 
-- MAGIC Show databases

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC CREATE DATABASE restore;

-- COMMAND ----------

-- MAGIC %sql 
-- MAGIC Show databases;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC
-- MAGIC DROP TABLE IF EXISTS dept;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS dept(Deptno INT, Dname STRING, Loc STRING) USING delta;

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40,'OPERATIONS', 'BOSTON');

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC DESCRIBE table dept;

-- COMMAND ----------

DELETE from dept where deptno = 10;

-- COMMAND ----------

SELECT * from dept where deptno = 10; 

-- COMMAND ----------

describe history dept;

-- COMMAND ----------

SELECT * from dept version as of 1; 

-- COMMAND ----------

restore table dept to version as of 1;

-- COMMAND ----------

SELECT * from dept

-- COMMAND ----------

truncate table dept

-- COMMAND ----------

SELECT * from dept

-- COMMAND ----------

describe history dept

-- COMMAND ----------

restore table dept to version as of 1; 

-- COMMAND ----------

SELECT * from dept

-- COMMAND ----------

drop table dept

-- COMMAND ----------

SELECT * from dept

-- COMMAND ----------

-- MAGIC %fs ls /user/hive/warehouse

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS dept(Deptno INT, Dname STRING, Loc STRING) USING delta location '/tushar/dept';
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK'),
(20,'RESEARCH','DALLAS'),
(30, 'SALES', 'CHICAGO'),
(40,'OPERATIONS', 'BOSTON');

-- COMMAND ----------

SELECT * from dept

-- COMMAND ----------

-- MAGIC %fs ls /tushar/dept

-- COMMAND ----------

drop table dept

-- COMMAND ----------

-- MAGIC %md
-- MAGIC #data will still be there after dropping the table

-- COMMAND ----------

-- MAGIC %fs ls /tushar/dept

-- COMMAND ----------

select * from delta.`/tushar/dept`
