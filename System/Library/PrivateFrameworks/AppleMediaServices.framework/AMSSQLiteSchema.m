@interface AMSSQLiteSchema
- (AMSSQLiteSchema)initWithConnection:(id)a3;
- (BOOL)column:(id)a3 existsInTable:(id)a4;
- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4;
- (BOOL)tableExists:(id)a3;
- (int64_t)currentUserVersion;
- (void)_setUserVersion:(int64_t)a3;
@end

@implementation AMSSQLiteSchema

uint64_t __37__AMSSQLiteSchema_currentUserVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 firstInt64Value];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void).cxx_destruct
{
}

- (AMSSQLiteSchema)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSSQLiteSchema;
  v6 = [(AMSSQLiteSchema *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (int64_t)currentUserVersion
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  connection = self->_connection;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AMSSQLiteSchema_currentUserVersion__block_invoke;
  v5[3] = &unk_1E55A6AB0;
  v5[4] = &v6;
  -[AMSSQLiteConnection executeQuery:withResults:](connection, "executeQuery:withResults:", @"PRAGMA user_version;",
    v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
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
  uint64_t v9 = [NSString stringWithFormat:@"PRAGMA table_info(%@);", v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __40__AMSSQLiteSchema_column_existsInTable___block_invoke;
  v12[3] = &unk_1E55A6A88;
  v14 = &v15;
  id v10 = v6;
  id v13 = v10;
  [(AMSSQLiteConnection *)connection executeQuery:v9 withResults:v12];

  LOBYTE(connection) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)connection;
}

void __40__AMSSQLiteSchema_column_existsInTable___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__AMSSQLiteSchema_column_existsInTable___block_invoke_2;
  v5[3] = &unk_1E55A6A60;
  long long v4 = *(_OWORD *)(a1 + 32);
  id v3 = (id)v4;
  long long v6 = v4;
  [a2 enumerateRowsUsingBlock:v5];
}

void __40__AMSSQLiteSchema_column_existsInTable___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 stringForColumnName:@"name"];
  char v6 = [v7 isEqualToString:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  *a4 = v6;
}

- (BOOL)migrateToVersion:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__AMSSQLiteSchema_migrateToVersion_usingBlock___block_invoke;
  v10[3] = &unk_1E55A6AD8;
  v10[4] = self;
  id v8 = v6;
  id v11 = v8;
  v12 = &v14;
  int64_t v13 = a3;
  [(AMSSQLiteConnection *)connection performTransaction:v10];
  LOBYTE(a3) = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return a3;
}

uint64_t __47__AMSSQLiteSchema_migrateToVersion_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [[AMSSQLiteSchemaMigration alloc] initWithConnection:*(void *)(*(void *)(a1 + 32) + 8)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(AMSSQLiteSchemaMigration *)v2 success];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) _setUserVersion:*(void *)(a1 + 56)];
  }
  else
  {
    id v3 = +[AMSLogConfig sharedConfig];
    if (!v3)
    {
      id v3 = +[AMSLogConfig sharedConfig];
    }
    long long v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = [(AMSSQLiteSchemaMigration *)v2 error];
      int v9 = 138543618;
      uint64_t v10 = v5;
      __int16 v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to run database migration. Error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return v7;
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  connection = self->_connection;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__AMSSQLiteSchema_tableExists___block_invoke;
  v8[3] = &unk_1E55A66D0;
  id v6 = v4;
  id v9 = v6;
  uint64_t v10 = &v11;
  [(AMSSQLiteConnection *)connection executeQuery:@"SELECT name FROM sqlite_master where name = '?'" withResults:v8];
  LOBYTE(connection) = *((unsigned char *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)connection;
}

void __31__AMSSQLiteSchema_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (void)_setUserVersion:(int64_t)a3
{
  objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %lld;", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AMSSQLiteConnection *)self->_connection executeStatement:v4 error:0];
}

@end