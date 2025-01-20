@interface ASUSQLiteDatabaseStoreSchema
- (ASUSQLiteDatabaseStoreSchema)initWithConnection:(id)a3 schemaName:(id)a4 tableNames:(id)a5;
- (BOOL)column:(id)a3 existsInTable:(id)a4;
- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4;
- (BOOL)migrateToVersion:(int64_t)a3 usingMapping:(id)a4;
- (BOOL)tableExists:(id)a3;
- (int64_t)currentSchemaVersion;
- (uint64_t)_migrateToVersion:(void *)a3 usingMapping:(int)a4 isReattempt:;
@end

@implementation ASUSQLiteDatabaseStoreSchema

- (ASUSQLiteDatabaseStoreSchema)initWithConnection:(id)a3 schemaName:(id)a4 tableNames:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ASUSQLiteDatabaseStoreSchema;
  v12 = [(ASUSQLiteDatabaseStoreSchema *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_schemaName, a4);
    uint64_t v14 = [v11 copy];
    tableNames = v13->_tableNames;
    v13->_tableNames = (NSArray *)v14;

    connection = v13->_connection;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __73__ASUSQLiteDatabaseStoreSchema_initWithConnection_schemaName_tableNames___block_invoke;
    v18[3] = &unk_26522F728;
    v19 = v13;
    [(ASUSQLiteConnection *)connection performTransaction:v18 error:0];
  }
  return v13;
}

uint64_t __73__ASUSQLiteDatabaseStoreSchema_initWithConnection_schemaName_tableNames___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) executeStatement:@"PRAGMA user_version = 1;" error:0];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "executeStatement:error:", @"CREATE TABLE IF NOT EXISTS schema_version (schema_name TEXT, schema_version INTEGER DEFAULT 0, PRIMARY KEY(schema_name));",
    0);
  return 1;
}

- (int64_t)currentSchemaVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__ASUSQLiteDatabaseStoreSchema_currentSchemaVersion__block_invoke;
  v5[3] = &unk_26522F770;
  v5[4] = self;
  v5[5] = &v6;
  [(ASUSQLiteConnection *)connection executeQuery:@"SELECT schema_version FROM schema_version WHERE schema_name = ?" withResults:v5];
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__ASUSQLiteDatabaseStoreSchema_currentSchemaVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  uint64_t v5 = [v4 firstInt64Value];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v8 = [NSString stringWithFormat:@"PRAGMA table_info(%@)", v7];
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke;
  v12[3] = &unk_26522F588;
  uint64_t v14 = &v15;
  id v10 = v6;
  id v13 = v10;
  [(ASUSQLiteConnection *)connection executeQuery:v8 withResults:v12];
  LOBYTE(connection) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)connection;
}

void __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke_2;
  v5[3] = &unk_26522F560;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 enumerateRowsUsingBlock:v5];
}

void __53__ASUSQLiteDatabaseStoreSchema_column_existsInTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 stringForColumnName:@"name"];
  char v6 = [v7 isEqualToString:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  *a4 = v6;
}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke;
  v10[3] = &unk_26522F5D8;
  v10[4] = self;
  id v11 = v6;
  int64_t v12 = a3;
  id v8 = v6;
  LOBYTE(self) = [(ASUSQLiteConnection *)connection performSavepoint:v10];

  return (char)self;
}

uint64_t __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke(void *a1)
{
  v2 = [[ASUSQLiteDatabaseStoreMigrator alloc] initWithConnection:*(void *)(a1[4] + 8) tableNames:*(void *)(a1[4] + 24)];
  (*(void (**)(void))(a1[5] + 16))();
  if ([(ASUSQLiteDatabaseStoreMigrator *)v2 success])
  {
    uint64_t v3 = a1[4];
    long long v4 = *(void **)(v3 + 8);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke_2;
    v8[3] = &unk_26522F8D8;
    uint64_t v5 = a1[6];
    v8[4] = v3;
    v8[5] = v5;
    uint64_t v6 = [v4 executeStatement:@"INSERT OR REPLACE INTO schema_version (schema_name, schema_version) VALUES (?, ?)", 0, v8 error bindings];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __60__ASUSQLiteDatabaseStoreSchema_migrateToVersion_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  [v4 bindInt64:*(void *)(a1 + 40) atPosition:2];
}

- (BOOL)migrateToVersion:(int64_t)a3 usingMapping:(id)a4
{
  return -[ASUSQLiteDatabaseStoreSchema _migrateToVersion:usingMapping:isReattempt:]((uint64_t)self, a3, a4, 0);
}

- (uint64_t)_migrateToVersion:(void *)a3 usingMapping:(int)a4 isReattempt:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a3;
  if (a1)
  {
    uint64_t v8 = [(id)a1 currentSchemaVersion];
    if (v8 < a2)
    {
      while (1)
      {
        id v21 = 0;
        uint64_t v22 = -1;
        v7[2](v7, v8, &v22, &v21);
        uint64_t v9 = v22;
        if (v22 <= v8 || v22 > a2) {
          break;
        }
        if (!v21)
        {
          id v13 = ASULogHandleForCategory(1);
          if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 134218240;
          uint64_t v24 = v8;
          __int16 v25 = 2048;
          uint64_t v26 = v22;
          uint64_t v15 = "No migration block provided to migrate schema version %lli -> %lli";
          goto LABEL_32;
        }
        char v11 = objc_msgSend((id)a1, "migrateToVersion:usingBlock:", v22);
        int64_t v12 = ASULogHandleForCategory(1);
        id v13 = v12;
        if ((v11 & 1) == 0)
        {
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            goto LABEL_20;
          }
          *(_DWORD *)buf = 134218240;
          uint64_t v24 = v8;
          __int16 v25 = 2048;
          uint64_t v26 = v22;
          uint64_t v15 = "Database migration function failed for %lli => %lli";
          goto LABEL_32;
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          uint64_t v24 = v8;
          __int16 v25 = 2048;
          uint64_t v26 = v22;
          _os_log_impl(&dword_247E53000, v13, OS_LOG_TYPE_DEFAULT, "Database migration function succeeded for %lli => %lli", buf, 0x16u);
        }

        uint64_t v8 = v22;
        if (v8 >= a2) {
          goto LABEL_21;
        }
      }
      uint64_t v14 = ASULogHandleForCategory(1);
      id v13 = v14;
      if (v9 != -1)
      {
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_20;
        }
        *(_DWORD *)buf = 134218240;
        uint64_t v24 = v22;
        __int16 v25 = 2048;
        uint64_t v26 = v8;
        uint64_t v15 = "Invalid version %lli provided; currentVersion: %lli";
LABEL_32:
        _os_log_error_impl(&dword_247E53000, v13, OS_LOG_TYPE_ERROR, v15, buf, 0x16u);
        goto LABEL_20;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v24 = v22;
        _os_log_impl(&dword_247E53000, v13, OS_LOG_TYPE_DEFAULT, "Version mapping not provided for %lli", buf, 0xCu);
      }
LABEL_20:
    }
LABEL_21:
    if (v8 == a2)
    {
      a1 = 1;
    }
    else if (a4)
    {
      v16 = ASULogHandleForCategory(1);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_247E53000, v16, OS_LOG_TYPE_DEFAULT, "Not reattempting to reset schema", buf, 2u);
      }

      a1 = 0;
    }
    else
    {
      uint64_t v17 = *(void **)(a1 + 8);
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __75__ASUSQLiteDatabaseStoreSchema__migrateToVersion_usingMapping_isReattempt___block_invoke;
      v19[3] = &unk_26522FD50;
      v19[4] = a1;
      objc_super v20 = v7;
      a1 = [v17 performTransaction:v19 error:0];
    }
  }

  return a1;
}

uint64_t __75__ASUSQLiteDatabaseStoreSchema__migrateToVersion_usingMapping_isReattempt___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) migrateToVersion:0 usingBlock:&__block_literal_global_0])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v2 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v15;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v15 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
          uint64_t v13 = 0;
          uint64_t v8 = [@"DROP TABLE IF EXISTS " stringByAppendingString:v7];
          if (([*(id *)(*(void *)(a1 + 32) + 8) executeStatement:v8 error:&v13] & 1) == 0)
          {
            int64_t v12 = ASULogHandleForCategory(1);
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v19 = v13;
              _os_log_error_impl(&dword_247E53000, v12, OS_LOG_TYPE_ERROR, "Failed to drop table: %{public}@", buf, 0xCu);
            }

            return 0;
          }

          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }

    uint64_t v9 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_247E53000, v9, OS_LOG_TYPE_DEFAULT, "Successfully reset schema; requesting migration from version 0",
        buf,
        2u);
    }

    return -[ASUSQLiteDatabaseStoreSchema _migrateToVersion:usingMapping:isReattempt:](*(void *)(a1 + 32), 0, *(void *)(a1 + 40), 1);
  }
  else
  {
    char v11 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_247E53000, v11, OS_LOG_TYPE_ERROR, "Failed to set schema version back to 0; rolling back transaction",
        buf,
        2u);
    }

    return 0;
  }
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  int64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__ASUSQLiteDatabaseStoreSchema_tableExists___block_invoke;
  v8[3] = &unk_26522F770;
  id v6 = v4;
  id v9 = v6;
  id v10 = &v11;
  [(ASUSQLiteConnection *)connection executeQuery:@"SELECT name FROM sqlite_master where name = ?" withResults:v8];
  LOBYTE(connection) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connection;
}

void __44__ASUSQLiteDatabaseStoreSchema_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableNames, 0);
  objc_storeStrong((id *)&self->_schemaName, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end