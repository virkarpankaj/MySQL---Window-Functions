-- Window Fuunctions

--  group by method
select ordernumber, avg(quantityordered) as avg_value
from orderdetails
group by orderNumber
order by orderNumber ;

-- Window Function
-- over entire table   == avg of quantity ordered of whole column  = sum of all qty/no of rows
--  same value for all rows

select ordernumber,  avg(quantityordered) over() 
from orderdetails;

select distinct(ordernumber),  avg(quantityordered)  over (partition by ordernumber) as avg_value 
from orderdetails;

select distinct(productcode),  avg(quantityordered) over( partition by productcode)
from orderdetails;

### Various Window Functions
-- 1. Row Number()
select row_number() over()  as Row_num,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select row_number() over(partition by orderNumber)  as Row_num,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 2. Rank  ##ORDER BY
select rank() over() as Ranking,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select rank() over(order by quantityOrdered) as Ranking,
ordernumber, productcode, quantityordered, priceEach, orderLineNumber
from orderdetails;

-- 3. Dense Rank  - consecutive ranking   ##ORDER BY
select dense_rank() over(order by quantityOrdered) as dense_ranking,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 4. Percent Rank   - Percentile 
select percent_rank() over(partition by quantityOrdered  order by orderNumber) as percentile_rank,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 5.  Cume_dist   -- row/total_no_row
select cume_dist() over(partition by quantityOrdered  order by orderNumber ) as cumulative_dist,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 6. grouping entire table 
select ntile(4) over() as ntiles,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select row_number() over() as row_no, 
ntile(4) over() as ntiles,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 7. Lag  - finds previous value
select lag(quantityOrdered,2) over() as prev_values,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select lag(quantityOrdered,1) over(partition by orderNumber) as prev_values,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 8. Lead  - finds leading value
select lead(quantityOrdered,2) over() as next_value,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select lead(quantityOrdered,1) over(partition by orderNumber) as next_value,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 9.First value
select first_value(quantityordered) over() as firstvalue,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select first_value(quantityordered) over(partition by priceEach) as firstvalue,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 10. Last Value
select last_value(quantityordered) over() as lastvalue,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select last_value(quantityordered) over(partition by ordernumber) as lastvalue,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

-- 11. Nth Value
select nth_value(quantityordered,2) over() as nvalue,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;

select nth_value(quantityordered,2) over(partition by priceEach) as nvalue,
ordernumber, productcode, quantityordered, priceEach,orderLineNumber
from orderdetails;
