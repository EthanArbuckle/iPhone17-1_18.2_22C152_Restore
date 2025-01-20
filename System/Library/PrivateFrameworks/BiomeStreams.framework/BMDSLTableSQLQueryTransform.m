@interface BMDSLTableSQLQueryTransform
+ (BOOL)supportsSecureCoding;
- (BMDSLTableSQLQueryTransform)initWithCoder:(id)a3;
- (BMDSLTableSQLQueryTransform)initWithName:(id)a3 version:(unsigned int)a4 SQL:(id)a5 tableNames:(id)a6 schema:(id)a7;
- (BMDSLTableSQLQueryTransform)initWithSQL:(id)a3 tableNames:(id)a4 schema:(id)a5;
- (BMTableSchema)schema;
- (NSArray)tableNames;
- (NSString)SQL;
- (id)transformInput:(id)a3 combinedState:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BMDSLTableSQLQueryTransform

- (BMDSLTableSQLQueryTransform)initWithName:(id)a3 version:(unsigned int)a4 SQL:(id)a5 tableNames:(id)a6 schema:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (a4 == 1)
  {
    v23.receiver = self;
    v23.super_class = (Class)BMDSLTableSQLQueryTransform;
    v15 = [(BMDSLBaseCodable *)&v23 initWithName:a3 version:1];
    if (v15)
    {
      uint64_t v16 = [v12 copy];
      SQL = v15->_SQL;
      v15->_SQL = (NSString *)v16;

      objc_storeStrong((id *)&v15->_schema, a7);
      uint64_t v18 = [v13 copy];
      tableNames = v15->_tableNames;
      v15->_tableNames = (NSArray *)v18;
    }
    self = v15;
    v20 = self;
  }
  else
  {
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[BMDSLTableSQLQueryTransform initWithName:version:SQL:tableNames:schema:](a4, v21);
    }

    v20 = 0;
  }

  return v20;
}

- (BMDSLTableSQLQueryTransform)initWithSQL:(id)a3 tableNames:(id)a4 schema:(id)a5
{
  return [(BMDSLTableSQLQueryTransform *)self initWithName:@"tableSQLExpression" version:1 SQL:a3 tableNames:a4 schema:a5];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)BMDSLTableSQLQueryTransform;
  id v4 = a3;
  [(BMDSLBaseCodable *)&v8 encodeWithCoder:v4];
  v5 = [(BMDSLTableSQLQueryTransform *)self SQL];
  [v4 encodeObject:v5 forKey:@"SQL"];

  v6 = [(BMDSLTableSQLQueryTransform *)self tableNames];
  [v4 encodeObject:v6 forKey:@"tableNames"];

  v7 = [(BMDSLTableSQLQueryTransform *)self schema];
  [v4 encodeObject:v7 forKey:@"schema"];
}

- (BMDSLTableSQLQueryTransform)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BMDSLTableSQLQueryTransform;
  v5 = [(BMDSLBaseCodable *)&v12 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SQL"];
    v7 = [MEMORY[0x1E4F4FA28] allowed];
    objc_super v8 = [v4 decodeObjectOfClasses:v7 forKey:@"tableNames"];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"schema"];
    v10 = [(BMDSLBaseCodable *)v5 name];
    v5 = [(BMDSLTableSQLQueryTransform *)v5 initWithName:v10 version:[(BMDSLBaseCodable *)v5 version] SQL:v6 tableNames:v8 schema:v9];
  }
  return v5;
}

- (id)transformInput:(id)a3 combinedState:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4FAA8]) initWithURL:0];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v36;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v36 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
      id v14 = [v13 rows];
      uint64_t v15 = [v14 count];

      if (v15)
      {
        uint64_t v16 = [(BMDSLTableSQLQueryTransform *)self tableNames];
        v17 = [v16 objectAtIndexedSubscript:v10 + v12];

        id v34 = 0;
        [v6 addTable:v13 named:v17 error:&v34];
        id v18 = v34;
        if (v18)
        {
          id v20 = v18;
          v31 = __biome_log_for_category();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            -[BMDSLTableSQLQueryTransform transformInput:combinedState:](v6);
          }
          goto LABEL_23;
        }
        v19 = [v13 rows];
        id v33 = 0;
        [v6 upsertRows:v19 error:&v33];
        id v20 = v33;

        if (v20)
        {
          v31 = __biome_log_for_category();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            [(BMDSLTableSQLQueryTransform *)v39 transformInput:&v40 combinedState:v31];
          }
LABEL_23:

          v30 = 0;
          objc_super v23 = v7;
          goto LABEL_27;
        }
      }
      if (v9 == ++v12)
      {
        uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
        v10 += v12;
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([v6 openDB])
  {
    v21 = [v6 db];
    v22 = [(BMDSLTableSQLQueryTransform *)self SQL];
    objc_super v23 = [v21 executeQuery:v22];

    v24 = [(BMDSLTableSQLQueryTransform *)self schema];
    v25 = objc_opt_new();
    if ([v23 next])
    {
      do
      {
        v26 = objc_opt_new();
        if ((int)[v23 columnCount] >= 1)
        {
          uint64_t v27 = 0;
          do
          {
            v28 = [v23 objectForColumnIndex:v27];
            [v26 addObject:v28];

            uint64_t v27 = (v27 + 1);
          }
          while ((int)v27 < (int)[v23 columnCount]);
        }
        v29 = (void *)[objc_alloc(MEMORY[0x1E4F4FA80]) initWithValues:v26];
        [v25 addObject:v29];
      }
      while (([v23 next] & 1) != 0);
    }
    v30 = (void *)[objc_alloc(MEMORY[0x1E4F4FA98]) initWithRows:v25 schema:v24];
    [v6 closeDB];
  }
  else
  {
    objc_super v23 = __biome_log_for_category();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BMDSLTableSQLQueryTransform transformInput:combinedState:](v6);
    }
    v30 = 0;
  }
LABEL_27:

  return v30;
}

- (NSArray)tableNames
{
  return self->_tableNames;
}

- (NSString)SQL
{
  return self->_SQL;
}

- (BMTableSchema)schema
{
  return self->_schema;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schema, 0);
  objc_storeStrong((id *)&self->_SQL, 0);

  objc_storeStrong((id *)&self->_tableNames, 0);
}

- (void)initWithName:(int)a1 version:(NSObject *)a2 SQL:tableNames:schema:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "Unexpected version %u. Failed to initialize BMDSLTableSQLQueryTransform", (uint8_t *)v2, 8u);
}

- (void)transformInput:(void *)a1 combinedState:.cold.1(void *a1)
{
  v1 = [a1 db];
  v2 = [v1 lastError];
  uint64_t v3 = [v2 description];
  OUTLINED_FUNCTION_0(&dword_18E67D000, v4, v5, "BMTableStore: unable to open database: %@", v6, v7, v8, v9, 2u);
}

- (void)transformInput:(void *)a3 combinedState:(NSObject *)a4 .cold.2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 db];
  uint64_t v8 = [v7 lastError];
  uint64_t v9 = [v8 description];
  *(_DWORD *)a1 = 138412290;
  *a3 = v9;
  _os_log_fault_impl(&dword_18E67D000, a4, OS_LOG_TYPE_FAULT, "BMTableStore: unable to add rows to database: %@", a1, 0xCu);
}

- (void)transformInput:(void *)a1 combinedState:.cold.3(void *a1)
{
  v1 = [a1 db];
  v2 = [v1 lastError];
  uint64_t v3 = [v2 description];
  OUTLINED_FUNCTION_0(&dword_18E67D000, v4, v5, "BMTableStore: unable to add table to database: %@", v6, v7, v8, v9, 2u);
}

@end