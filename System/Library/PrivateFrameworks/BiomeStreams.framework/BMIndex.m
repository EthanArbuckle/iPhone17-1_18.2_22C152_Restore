@interface BMIndex
+ (id)_indexTableSchemaWithName:(id)a3 fields:(id)a4;
+ (id)_viewNameWithStreamIdentifier:(id)a3 indexName:(id)a4;
- (BMIndex)initWithName:(id)a3 fields:(id)a4 streamIdentifier:(id)a5;
- (BMSQLSchema)schema;
- (NSArray)fields;
- (NSString)name;
- (NSString)streamIdentifier;
- (NSString)viewName;
- (id)createTableSQL;
- (id)createViewSQL;
- (id)description;
@end

@implementation BMIndex

- (BMIndex)initWithName:(id)a3 fields:(id)a4 streamIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BMIndex;
  v12 = [(BMIndex *)&v19 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_streamIdentifier, a5);
    uint64_t v14 = [(id)objc_opt_class() _viewNameWithStreamIdentifier:v11 indexName:v9];
    viewName = v13->_viewName;
    v13->_viewName = (NSString *)v14;

    objc_storeStrong((id *)&v13->_fields, a4);
    uint64_t v16 = [(id)objc_opt_class() _indexTableSchemaWithName:v13->_viewName fields:v10];
    schema = v13->_schema;
    v13->_schema = (BMSQLSchema *)v16;
  }
  return v13;
}

+ (id)_viewNameWithStreamIdentifier:(id)a3 indexName:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_opt_new();
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v8 = [v5 componentsSeparatedByString:@"."];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if ([v13 length])
        {
          uint64_t v14 = [v13 substringToIndex:1];
          [v7 appendString:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v15 = objc_msgSend(v6, "componentsSeparatedByString:", @"_", 0);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        v21 = [v20 substringToIndex:1];
        v22 = [v21 uppercaseString];
        [v7 appendString:v22];

        v23 = [v20 substringFromIndex:1];
        [v7 appendString:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v17);
  }

  [v7 appendString:@"IndexView"];
  v24 = (void *)[v7 copy];

  return v24;
}

+ (id)_indexTableSchemaWithName:(id)a3 fields:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = [v12 name];
        uint64_t v14 = BMEventTimestampSQLColumn();
        v15 = [v14 name];
        char v16 = [v13 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [BMSQLColumn alloc];
          uint64_t v18 = [v12 name];
          objc_super v19 = -[BMSQLColumn initWithName:dataType:](v17, "initWithName:dataType:", v18, [v12 dataType]);
          [v6 addObject:v19];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  v20 = BMEventBookmarkSQLColumns();
  [v6 addObjectsFromArray:v20];

  v21 = BMEventTimestampSQLColumn();
  [v6 addObject:v21];

  v22 = [[BMSQLSchema alloc] initWithTableName:v24 columns:v6];

  return v22;
}

- (id)createViewSQL
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v34 = self;
  v4 = self->_fields;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v10 = [v9 name];
        uint64_t v11 = BMEventTimestampSQLColumn();
        v12 = [v11 name];
        char v13 = [v10 isEqualToString:v12];

        if ((v13 & 1) == 0)
        {
          uint64_t v14 = [v9 expression];
          v15 = [v14 lowercaseString];
          [v3 addObject:v15];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v6);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  char v16 = BMEventBookmarkSQLColumns();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v35 + 1) + 8 * j);
        id v22 = [NSString alloc];
        v23 = [v21 name];
        id v24 = [v23 lowercaseString];
        long long v25 = (void *)[v22 initWithFormat:@"\"%@\"", v24];
        [v3 addObject:v25];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v43 count:16];
    }
    while (v18);
  }

  long long v26 = BMEventTimestampSQLColumn();
  long long v27 = [v26 name];
  long long v28 = [v27 lowercaseString];
  [v3 addObject:v28];

  long long v29 = NSString;
  uint64_t v30 = [(NSString *)v34->_viewName lowercaseString];
  long long v31 = [v3 componentsJoinedByString:@","];
  long long v32 = [v29 stringWithFormat:@"CREATE MATERIALIZED VIEW %@ AS SELECT %@ FROM \"%@\"", v30, v31, v34->_streamIdentifier];

  return v32;
}

- (id)createTableSQL
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = self->_fields;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v19 + 1) + 8 * i) name];
        [v3 addObject:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v10 = NSString;
  name = self->_name;
  viewName = self->_viewName;
  char v13 = [v3 componentsJoinedByString:@","];
  uint64_t v14 = [v10 stringWithFormat:@"CREATE INDEX IF NOT EXISTS %@_Index ON %@(%@)", name, viewName, v13];

  v15 = NSString;
  char v16 = [(BMSQLSchema *)self->_schema createTableSQL];
  uint64_t v17 = [v15 stringWithFormat:@"%@;\n%@;", v16, v14];

  return v17;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"<%@ %p> name: %@; fields: %@",
                 objc_opt_class(),
                 self,
                 self->_name,
                 self->_fields);

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)streamIdentifier
{
  return self->_streamIdentifier;
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSArray)fields
{
  return self->_fields;
}

- (BMSQLSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end