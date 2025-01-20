@interface LCFDatabaseColumnConnection
- (BOOL)doQueryEachStep:(id)a3 statementStepHandler:(id)a4;
- (BOOL)doQueryExec:(id)a3;
- (BOOL)writeFeatures:(id)a3 featureValueType:(int64_t)a4;
- (NSArray)nameTypesCache;
- (NSString)databaseName;
- (NSString)databaseNamePath;
- (NSString)tableName;
- (NSURL)databaseBaseURL;
- (id)init:(id)a3 databaseName:(id)a4 tableName:(id)a5;
- (id)query;
- (void)ensureDatabaseTable;
- (void)setNameTypesCache:(id)a3;
@end

@implementation LCFDatabaseColumnConnection

- (id)init:(id)a3 databaseName:(id)a4 tableName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)LCFDatabaseColumnConnection;
  v12 = [(LCFDatabaseColumnConnection *)&v17 init];
  if (v12)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v12->_databaseBaseURL, a3);
    objc_storeStrong((id *)&v12->_databaseName, a4);
    objc_storeStrong((id *)&v12->_tableName, a5);
    v13 = [(NSURL *)v12->_databaseBaseURL path];
    uint64_t v14 = [v13 stringByAppendingPathComponent:v12->_databaseName];
    databaseNamePath = v12->_databaseNamePath;
    v12->_databaseNamePath = (NSString *)v14;

    [(LCFDatabaseColumnConnection *)v12 ensureDatabaseTable];
  }

  return v12;
}

- (void)ensureDatabaseTable
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F08850] defaultManager];
  v4 = [(NSURL *)self->_databaseBaseURL path];
  if (([v3 fileExistsAtPath:v4] & 1) == 0) {
    [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];
  }
  p_databaseNamePath = &self->_databaseNamePath;
  v6 = [(NSString *)self->_databaseNamePath UTF8String];
  ppDb = 0;
  if (sqlite3_open(v6, &ppDb))
  {
    v7 = LCFLogDatabaseColumnConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseColumnConnection, OS_LOG_TYPE_ERROR)) {
      [(LCFDatabaseConnection *)(uint64_t)p_databaseNamePath ensureDatabaseTable];
    }
  }
  else
  {
    sqlite3_exec(ppDb, "BEGIN", 0, 0, 0);
    uint64_t v14 = LCFLogDatabaseColumnConnection;
    if (os_log_type_enabled((os_log_t)LCFLogDatabaseColumnConnection, OS_LOG_TYPE_INFO))
    {
      v15 = *p_databaseNamePath;
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      _os_log_impl(&dword_25459C000, v14, OS_LOG_TYPE_INFO, "sqlite3_open succeeded %@", buf, 0xCu);
    }
    *(void *)buf = 0;
    v16 = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (ID INTEGER PRIMARY KEY AUTOINCREMENT, ColumnName TEXT, Type INTEGER)", self->_tableName];
    objc_super v17 = ppDb;
    id v18 = v16;
    if (sqlite3_exec(v17, (const char *)[v18 UTF8String], 0, 0, (char **)buf))
    {
      v19 = LCFLogDatabaseColumnConnection;
      if (os_log_type_enabled((os_log_t)LCFLogDatabaseColumnConnection, OS_LOG_TYPE_ERROR)) {
        [(LCFDatabaseConnection *)(uint64_t)v18 ensureDatabaseTable];
      }
    }
    sqlite3_exec(ppDb, "COMMIT", 0, 0, 0);
    sqlite3_close(ppDb);
  }
}

- (BOOL)doQueryEachStep:(id)a3 statementStepHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, sqlite3_stmt *))a4;
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  if ([v8 fileExistsAtPath:self->_databaseNamePath])
  {
    uint64_t v9 = [(NSString *)self->_databaseNamePath UTF8String];
    ppDb = 0;
    if (!sqlite3_open(v9, &ppDb))
    {
      uint64_t v12 = 0;
      sqlite3_prepare_v2(ppDb, (const char *)[v6 UTF8String], -1, &v12, 0);
      while (1)
      {
        int v10 = sqlite3_step(v12);
        if (v10 != 100) {
          break;
        }
        v7[2](v7, v12);
      }
      if (v10 != 101) {
        -[LCFDatabaseColumnConnection doQueryEachStep:statementStepHandler:]();
      }
      sqlite3_close(ppDb);
    }
  }

  return 1;
}

- (BOOL)doQueryExec:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08850] defaultManager];
  if ([v5 fileExistsAtPath:self->_databaseNamePath]
    && (id v6 = [(NSString *)self->_databaseNamePath UTF8String], ppDb = 0, !sqlite3_open(v6, &ppDb)))
  {
    sqlite3_exec(ppDb, "BEGIN", 0, 0, 0);
    v19 = 0;
    uint64_t v9 = ppDb;
    id v10 = v4;
    int v11 = sqlite3_exec(v9, (const char *)objc_msgSend(v10, "UTF8String", 0), 0, 0, &v19);
    BOOL v7 = v11 == 0;
    if (v11)
    {
      uint64_t v12 = LCFLogDatabaseConnection;
      if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR)) {
        [(LCFDatabaseConnection *)(uint64_t)v10 ensureDatabaseTable];
      }
    }
    sqlite3_exec(ppDb, "COMMIT", 0, 0, 0);
    sqlite3_close(ppDb);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)writeFeatures:(id)a3 featureValueType:(int64_t)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(LCFDatabaseColumnConnection *)self query];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v13 = [v12 featureName];
        int v14 = [v13 isEqualToString:v6];

        if (v14)
        {
          uint64_t v21 = [v12 featureValueType];
          BOOL v20 = v21 == a4;
          if (v21 != a4)
          {
            uint64_t v22 = (void *)LCFLogDatabaseConnection;
            if (os_log_type_enabled((os_log_t)LCFLogDatabaseConnection, OS_LOG_TYPE_ERROR))
            {
              uint64_t v24 = v22;
              uint64_t v25 = [v12 featureValueType];
              *(_DWORD *)buf = 138412802;
              id v31 = v6;
              __int16 v32 = 2048;
              uint64_t v33 = v25;
              __int16 v34 = 2048;
              int64_t v35 = a4;
              _os_log_error_impl(&dword_25459C000, v24, OS_LOG_TYPE_ERROR, "Wrong type is asked %@ %ld %ld", buf, 0x20u);
            }
            BOOL v20 = 0;
          }
          uint64_t v18 = v7;
          goto LABEL_15;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v36 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  uint64_t v15 = NSString;
  tableName = self->_tableName;
  uint64_t v17 = [NSNumber numberWithInteger:a4];
  uint64_t v18 = [v15 stringWithFormat:@"INSERT INTO %@ (ColumnName, Type) VALUES('%@', %@)", tableName, v6, v17];

  [(LCFDatabaseColumnConnection *)self doQueryExec:v18];
  nameTypesCache = self->_nameTypesCache;
  self->_nameTypesCache = 0;

  BOOL v20 = 1;
LABEL_15:

  return v20;
}

- (id)query
{
  p_nameTypesCache = &self->_nameTypesCache;
  nameTypesCache = self->_nameTypesCache;
  if (nameTypesCache)
  {
    id v4 = nameTypesCache;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = [NSString stringWithFormat:@"SELECT * FROM %@", self->_tableName];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __36__LCFDatabaseColumnConnection_query__block_invoke;
    v9[3] = &unk_2653B0030;
    id v4 = (NSArray *)v6;
    uint64_t v10 = v4;
    [(LCFDatabaseColumnConnection *)self doQueryEachStep:v7 statementStepHandler:v9];
    objc_storeStrong((id *)p_nameTypesCache, v6);
  }
  return v4;
}

void __36__LCFDatabaseColumnConnection_query__block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  v2 = a2;
  id v4 = sqlite3_column_text(a2, 1);
  LODWORD(v2) = sqlite3_column_int(v2, 2);
  v5 = [LCFFetureValueNameType alloc];
  id v6 = [NSString stringWithUTF8String:v4];
  id v7 = [(LCFFetureValueNameType *)v5 init:v6 featureValueType:(int)v2];

  [*(id *)(a1 + 32) addObject:v7];
}

- (NSURL)databaseBaseURL
{
  return self->_databaseBaseURL;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (NSString)databaseNamePath
{
  return self->_databaseNamePath;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (NSArray)nameTypesCache
{
  return self->_nameTypesCache;
}

- (void)setNameTypesCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameTypesCache, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_databaseNamePath, 0);
  objc_storeStrong((id *)&self->_databaseName, 0);
  objc_storeStrong((id *)&self->_databaseBaseURL, 0);
}

- (void)doQueryEachStep:statementStepHandler:.cold.1()
{
}

@end