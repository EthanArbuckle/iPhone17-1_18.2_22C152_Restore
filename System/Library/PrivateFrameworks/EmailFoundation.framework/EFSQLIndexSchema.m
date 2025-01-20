@interface EFSQLIndexSchema
- (BOOL)unique;
- (EFSQLIndexSchema)initWithName:(id)a3 tableName:(id)a4 indexedColumns:(id)a5 where:(id)a6 unique:(BOOL)a7;
- (EFSQLIndexSchema)initWithTableName:(id)a3 columnNames:(id)a4;
- (EFSQLIndexSchema)initWithTableName:(id)a3 columnNames:(id)a4 where:(id)a5 unique:(BOOL)a6;
- (EFSQLIndexSchema)initWithTableName:(id)a3 indexedColumns:(id)a4;
- (EFSQLIndexSchema)initWithTableName:(id)a3 indexedColumns:(id)a4 where:(id)a5 unique:(BOOL)a6;
- (EFSQLValueExpressable)where;
- (NSArray)indexedColumns;
- (NSString)name;
- (NSString)tableName;
- (id)definitionWithDatabaseName:(id)a3;
@end

@implementation EFSQLIndexSchema

- (EFSQLIndexSchema)initWithName:(id)a3 tableName:(id)a4 indexedColumns:(id)a5 where:(id)a6 unique:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = self;
  v24.super_class = (Class)EFSQLIndexSchema;
  v16 = [(EFSQLIndexSchema *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    name = v16->_name;
    v16->_name = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    tableName = v16->_tableName;
    v16->_tableName = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    indexedColumns = v16->_indexedColumns;
    v16->_indexedColumns = (NSArray *)v21;

    objc_storeStrong((id *)&v16->_where, a6);
    v16->_unique = a7;
  }

  return v16;
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 indexedColumns:(id)a4 where:(id)a5 unique:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [NSString alloc];
  id v14 = objc_msgSend(v11, "ef_mapSelector:", sel_name);
  uint64_t v15 = [v14 componentsJoinedByString:@"_"];
  v16 = (void *)v15;
  uint64_t v17 = &stru_1F0EAE5A8;
  if (v6) {
    uint64_t v17 = @"unique_";
  }
  v18 = (void *)[v13 initWithFormat:@"%@_%@_%@index", v10, v15, v17];

  uint64_t v19 = [(EFSQLIndexSchema *)self initWithName:v18 tableName:v10 indexedColumns:v11 where:v12 unique:v6];
  return v19;
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 indexedColumns:(id)a4
{
  return [(EFSQLIndexSchema *)self initWithTableName:a3 indexedColumns:a4 where:0 unique:0];
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 columnNames:(id)a4 where:(id)a5 unique:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a5;
  id v12 = objc_msgSend(a4, "ef_map:", &__block_literal_global_55);
  id v13 = [(EFSQLIndexSchema *)self initWithTableName:v10 indexedColumns:v12 where:v11 unique:v6];

  return v13;
}

EFSQLIndexedColumnSchema *__63__EFSQLIndexSchema_initWithTableName_columnNames_where_unique___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[EFSQLIndexedColumnSchema alloc] initWithColumnName:v2];

  return v3;
}

- (EFSQLIndexSchema)initWithTableName:(id)a3 columnNames:(id)a4
{
  return [(EFSQLIndexSchema *)self initWithTableName:a3 columnNames:a4 where:0 unique:0];
}

- (id)definitionWithDatabaseName:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [NSString alloc];
    BOOL v6 = [(EFSQLIndexSchema *)self name];
    v7 = (void *)[v5 initWithFormat:@"%@.%@", v4, v6];
  }
  else
  {
    v7 = [(EFSQLIndexSchema *)self name];
  }
  v8 = [(EFSQLIndexSchema *)self indexedColumns];
  v9 = objc_msgSend(v8, "ef_mapSelector:", sel_definition);
  id v10 = [v9 componentsJoinedByString:@", "];

  id v11 = [(EFSQLIndexSchema *)self where];
  id v12 = objc_msgSend(v11, "ef_SQLIsolatedExpression");
  objc_msgSend(v12, "ef_SQLExpression");
  id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    uint64_t v14 = [@" WHERE " stringByAppendingString:v13];

    id v13 = (__CFString *)v14;
  }
  id v15 = [NSString alloc];
  BOOL v16 = [(EFSQLIndexSchema *)self unique];
  uint64_t v17 = [(EFSQLIndexSchema *)self tableName];
  v18 = (void *)v17;
  uint64_t v19 = &stru_1F0EAE5A8;
  v20 = @"UNIQUE ";
  if (!v16) {
    v20 = &stru_1F0EAE5A8;
  }
  if (v13) {
    uint64_t v19 = v13;
  }
  uint64_t v21 = objc_msgSend(v15, "initWithFormat:", @"CREATE %@INDEX IF NOT EXISTS %@ ON %@(%@)%@;",
                  v20,
                  v7,
                  v17,
                  v10,
                  v19);

  return v21;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSArray)indexedColumns
{
  return self->_indexedColumns;
}

- (EFSQLValueExpressable)where
{
  return self->_where;
}

- (BOOL)unique
{
  return self->_unique;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_where, 0);
  objc_storeStrong((id *)&self->_indexedColumns, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end