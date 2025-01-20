@interface ASUSQLiteSchema
- (ASUSQLiteSchema)initWithConnection:(id)a3;
- (BOOL)column:(id)a3 existsInTable:(id)a4;
- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4;
- (BOOL)tableExists:(id)a3;
- (int64_t)currentUserVersion;
@end

@implementation ASUSQLiteSchema

- (ASUSQLiteSchema)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASUSQLiteSchema;
  v6 = [(ASUSQLiteSchema *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (BOOL)column:(id)a3 existsInTable:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  connection = self->_connection;
  objc_super v9 = [NSString stringWithFormat:@"PRAGMA table_info(%@);", v7];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __40__ASUSQLiteSchema_column_existsInTable___block_invoke;
  v12[3] = &unk_26522F588;
  v14 = &v15;
  id v10 = v6;
  id v13 = v10;
  [(ASUSQLiteConnection *)connection executeQuery:v9 withResults:v12];

  LOBYTE(connection) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)connection;
}

void __40__ASUSQLiteSchema_column_existsInTable___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__ASUSQLiteSchema_column_existsInTable___block_invoke_2;
  v5[3] = &unk_26522F560;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 enumerateRowsUsingBlock:v5];
}

void __40__ASUSQLiteSchema_column_existsInTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 stringForColumnName:@"name"];
  char v6 = [v7 isEqualToString:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  *a4 = v6;
}

- (int64_t)currentUserVersion
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__ASUSQLiteSchema_currentUserVersion__block_invoke;
  v5[3] = &unk_26522F5B0;
  void v5[4] = &v6;
  -[ASUSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", @"PRAGMA user_version;",
    v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__ASUSQLiteSchema_currentUserVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 firstInt64Value];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __47__ASUSQLiteSchema_migrateToVersion_usingBlock___block_invoke;
  v10[3] = &unk_26522F5D8;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v8 = v6;
  LOBYTE(self) = [(ASUSQLiteConnection *)connection performTransaction:v10 error:0];

  return (char)self;
}

uint64_t __47__ASUSQLiteSchema_migrateToVersion_usingBlock___block_invoke(void *a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [[ASUSQLiteSchemaMigration alloc] initWithConnection:*(void *)(a1[4] + 8)];
  int64_t v3 = ASULogHandleForCategory(1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    long long v4 = [*(id *)(a1[4] + 8) options];
    id v5 = [v4 databasePath];
    uint64_t v6 = a1[6];
    *(_DWORD *)buf = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v6;
    _os_log_impl(&dword_247E53000, v3, OS_LOG_TYPE_DEFAULT, "Migrating %{public}@ to %llu", buf, 0x16u);
  }
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v7 = [(ASUSQLiteSchemaMigration *)v2 success];
  if (!v7)
  {
    uint64_t v9 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = [*(id *)(a1[4] + 8) options];
      int64_t v12 = [v11 databasePath];
      uint64_t v13 = a1[6];
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2048;
      uint64_t v17 = v13;
      _os_log_error_impl(&dword_247E53000, v9, OS_LOG_TYPE_ERROR, "Migrating %{public}@ to %llu failed!", buf, 0x16u);
    }
    goto LABEL_8;
  }
  uint64_t v8 = a1[4];
  if (v8)
  {
    uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %lld", a1[6]);;
    [*(id *)(v8 + 8) executeStatement:v9 error:0];
LABEL_8:
  }
  return v7;
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  connection = self->_connection;
  uint64_t v6 = [NSString stringWithFormat:@"SELECT name FROM sqlite_master where name = '%@'", v4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__ASUSQLiteSchema_tableExists___block_invoke;
  v8[3] = &unk_26522F5B0;
  v8[4] = &v9;
  [(ASUSQLiteConnection *)connection executeQuery:v6 withResults:v8];

  LOBYTE(connection) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return (char)connection;
}

uint64_t __31__ASUSQLiteSchema_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 hasRows];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
}

@end