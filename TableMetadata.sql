/*Query utilizes built-in metadata tables for SQL Server and extracts metadata for User tables in Database*/
SELECT 
	obj.name AS 'TableName',
	ac.name AS 'ColumnName',
	types.name AS 'DataType',
	ac.precision,
	ac.scale,
	ac.collation_name,
	ac.is_nullable
FROM sys.all_columns AS ac
INNER JOIN sys.objects AS obj
ON ac.object_id = obj.object_id
AND obj.type_desc = 'USER_TABLE'
LEFT JOIN sys.types AS types
ON types.user_type_id = ac.user_type_id