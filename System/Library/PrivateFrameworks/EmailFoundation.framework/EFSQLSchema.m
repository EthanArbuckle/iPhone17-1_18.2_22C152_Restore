@interface EFSQLSchema
- (EFSQLSchema)initWithTables:(id)a3;
- (NSArray)tables;
- (id)definitionWithDatabaseName:(id)a3;
- (id)definitionWithDatabaseName:(id)a3 includeIndexes:(BOOL)a4;
- (id)description;
- (id)indexDefinitionsWithDatabaseName:(id)a3;
- (id)tableForName:(id)a3;
@end

@implementation EFSQLSchema

- (EFSQLSchema)initWithTables:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)EFSQLSchema;
  v5 = [(EFSQLSchema *)&v20 init];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v12 = objc_msgSend(v11, "name", (void)v16);
          [v6 setObject:v11 forKeyedSubscript:v12];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    uint64_t v13 = [v6 copy];
    tablesByName = v5->_tablesByName;
    v5->_tablesByName = (NSDictionary *)v13;
  }
  return v5;
}

- (id)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)EFSQLSchema;
  id v4 = [(EFSQLSchema *)&v8 description];
  v5 = [(NSDictionary *)self->_tablesByName allValues];
  id v6 = (void *)[v3 initWithFormat:@"%@ [%@]", v4, v5];

  return v6;
}

- (NSArray)tables
{
  return [(NSDictionary *)self->_tablesByName allValues];
}

- (id)definitionWithDatabaseName:(id)a3
{
  id v3 = [(EFSQLSchema *)self definitionWithDatabaseName:a3 includeIndexes:1];
  return v3;
}

- (id)definitionWithDatabaseName:(id)a3 includeIndexes:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(NSDictionary *)self->_tablesByName allValues];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __57__EFSQLSchema_definitionWithDatabaseName_includeIndexes___block_invoke;
  v15 = &unk_1E61234D0;
  id v8 = v6;
  id v16 = v8;
  BOOL v17 = a4;
  uint64_t v9 = objc_msgSend(v7, "ef_map:", &v12);

  v10 = objc_msgSend(v9, "componentsJoinedByString:", @"\n\n", v12, v13, v14, v15);

  return v10;
}

id __57__EFSQLSchema_definitionWithDatabaseName_includeIndexes___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 definitionWithDatabaseName:*(void *)(a1 + 32) includeIndexes:*(unsigned __int8 *)(a1 + 40)];
  return v2;
}

- (id)indexDefinitionsWithDatabaseName:(id)a3
{
  id v4 = a3;
  v5 = [(NSDictionary *)self->_tablesByName allValues];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__EFSQLSchema_indexDefinitionsWithDatabaseName___block_invoke;
  v10[3] = &unk_1E61234F8;
  id v6 = v4;
  id v11 = v6;
  id v7 = objc_msgSend(v5, "ef_compactMap:", v10);

  if ([v7 count])
  {
    id v8 = [v7 componentsJoinedByString:@"\n\n"];
  }
  else
  {
    id v8 = &stru_1F0EAE5A8;
  }

  return v8;
}

id __48__EFSQLSchema_indexDefinitionsWithDatabaseName___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 indexDefinitionsWithDatabaseName:*(void *)(a1 + 32)];
  if ([v2 length]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)tableForName:(id)a3
{
  id v3 = [(NSDictionary *)self->_tablesByName objectForKeyedSubscript:a3];
  return v3;
}

- (void).cxx_destruct
{
}

@end