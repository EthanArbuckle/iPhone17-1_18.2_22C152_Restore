@interface BMSQLSchema
- (BMSQLSchema)initWithTableName:(id)a3 columns:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)columns;
- (NSString)tableName;
- (id)createTableSQL;
- (id)description;
- (id)insertSQL;
- (unint64_t)hash;
@end

@implementation BMSQLSchema

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);

  objc_storeStrong((id *)&self->_tableName, 0);
}

- (BMSQLSchema)initWithTableName:(id)a3 columns:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMSQLSchema;
  v8 = [(BMSQLSchema *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    tableName = v8->_tableName;
    v8->_tableName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_columns, a4);
  }

  return v8;
}

- (id)createTableSQL
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  objc_msgSend(v3, "appendFormat:", @"CREATE TABLE IF NOT EXISTS \"%@\"(\n"), self->_tableName;
  v4 = [(BMSQLSchema *)self columns];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [(BMSQLSchema *)self columns];
      v8 = [v7 objectAtIndexedSubscript:v6];

      [v3 appendString:@"\t"];
      uint64_t v9 = [v8 name];
      [v3 appendFormat:@"\"%@\"", v9];

      v10 = BMSQLDataTypeToString([v8 dataType]);
      [v3 appendFormat:@" %@", v10];

      if ([v8 requestOnly]) {
        [v3 appendString:@" HIDDEN"];
      }
      v11 = [(BMSQLSchema *)self columns];
      uint64_t v12 = [v11 count] - 1;

      if (v6 != v12) {
        [v3 appendString:@","];
      }
      [v3 appendString:@"\n"];

      ++v6;
      v13 = [(BMSQLSchema *)self columns];
      unint64_t v14 = [v13 count];
    }
    while (v6 < v14);
  }
  [v3 appendString:@""]);
  v15 = (void *)[v3 copy];

  return v15;
}

- (id)insertSQL
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20 = self;
  uint64_t v5 = self->_columns;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v11 = [NSString alloc];
        uint64_t v12 = [v10 name];
        v13 = (void *)[v11 initWithFormat:@"\"%@\"", v12];
        [v3 addObject:v13];

        [v4 addObject:@"?"];
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  id v14 = [NSString alloc];
  tableName = v20->_tableName;
  v16 = [v3 componentsJoinedByString:@","];
  v17 = [v4 componentsJoinedByString:@","];
  v18 = (void *)[v14 initWithFormat:@"INSERT INTO %@ (%@) VALUES (%@)", tableName, v16, v17];

  return v18;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(BMSQLSchema *)self createTableSQL];
  uint64_t v6 = (void *)[v3 initWithFormat:@"<%@ %p> sql: '%@'", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSString *)self->_tableName hash];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_columns;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 ^= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v8++), "hash", (void)v10);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    tableName = self->_tableName;
    uint64_t v7 = [v5 tableName];
    if ([(NSString *)tableName isEqual:v7])
    {
      columns = self->_columns;
      uint64_t v9 = [v5 columns];
      char v10 = [(NSArray *)columns isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)tableName
{
  return self->_tableName;
}

@end