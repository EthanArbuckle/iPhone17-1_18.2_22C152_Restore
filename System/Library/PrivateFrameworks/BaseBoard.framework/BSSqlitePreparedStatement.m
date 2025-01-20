@interface BSSqlitePreparedStatement
+ (id)_newPreparedStatementForDatabaseConnection:(void *)a3 withSQLQuery:;
- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5;
- (BSSqlitePreparedStatement)init;
- (id)_initWithDatabaseConnection:(void *)a1;
- (void)dealloc;
@end

@implementation BSSqlitePreparedStatement

- (id)_initWithDatabaseConnection:(void *)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__initWithDatabaseConnection_, a1, @"BSSqlitePreparedStatement.m", 68, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];
    }
    v9.receiver = a1;
    v9.super_class = (Class)BSSqlitePreparedStatement;
    v5 = (id *)objc_msgSendSuper2(&v9, sel_init);
    v6 = v5;
    if (v5) {
      objc_storeWeak(v5 + 1, v4);
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BSSqlitePreparedStatement)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"BSSqlitePreparedStatement.m" lineNumber:76 description:@"init is not allowed"];

  return (BSSqlitePreparedStatement *)-[BSSqlitePreparedStatement _initWithDatabaseConnection:](self, 0);
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_dbConnection, 0);
  v3.receiver = self;
  v3.super_class = (Class)BSSqlitePreparedStatement;
  [(BSSqlitePreparedStatement *)&v3 dealloc];
}

+ (id)_newPreparedStatementForDatabaseConnection:(void *)a3 withSQLQuery:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = self;
  if (!v4)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, @"BSSqlitePreparedStatement.m", 87, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:sel__newPreparedStatementForDatabaseConnection_withSQLQuery_, v6, @"BSSqlitePreparedStatement.m", 88, @"Invalid parameter not satisfying: %@", @"sqlQuery" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__BSSqlitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke;
  v13[3] = &unk_1E54456E0;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  id v15 = v8;
  v16 = &v17;
  -[BSSqliteDatabaseConnection performSyncWithDatabase:]((uint64_t)v8, (uint64_t)v13);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __85__BSSqlitePreparedStatement__newPreparedStatementForDatabaseConnection_withSQLQuery___block_invoke(uint64_t a1, sqlite3 *a2)
{
  id v4 = (char *)[*(id *)(a1 + 32) UTF8String];
  pzTail = 0;
  ppStmt = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v4 || !*v4)
  {
LABEL_18:
    if ([v5 count] == 1)
    {
      uint64_t v18 = [v5 objectAtIndex:0];
      uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    else
    {
      v21 = [_BSSqlitePreparedCompoundStatement alloc];
      id v22 = *(id *)(a1 + 40);
      id v23 = v5;
      if (v21)
      {
        v21 = (_BSSqlitePreparedCompoundStatement *)-[BSSqlitePreparedStatement _initWithDatabaseConnection:](v21, v22);
        if (v21)
        {
          uint64_t v24 = [v23 copy];
          statements = v21->_statements;
          v21->_statements = (NSArray *)v24;
        }
      }

      uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
      v20 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v21;
    }

    goto LABEL_25;
  }
  while (1)
  {
    int v6 = strlen(v4);
    if (sqlite3_prepare_v2(a2, v4, v6, &ppStmt, (const char **)&pzTail)) {
      break;
    }
    v16 = [_BSSqlitePreparedSimpleStatement alloc];
    v12 = -[_BSSqlitePreparedSimpleStatement _initWithDatabaseConnection:statement:]((id *)&v16->super.super.isa, *(void **)(a1 + 40), ppStmt);
    [v5 addObject:v12];
LABEL_12:

    id v4 = pzTail;
    if (!pzTail || !*pzTail) {
      goto LABEL_18;
    }
  }
  if (pzTail > v4)
  {
    id v7 = [NSString alloc];
    id v8 = (void *)[v7 initWithBytes:v4 length:pzTail - v4 encoding:4];
    id v9 = [_BSSqliteDeferredPreparedSimpleStatement alloc];
    id v10 = *(id *)(a1 + 40);
    v11 = v8;
    v12 = v11;
    if (v9)
    {
      if (!v11)
      {
        uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
        [v17 handleFailureInMethod:sel_initWithDatabaseConnection_deferredSql_, v9, @"BSSqlitePreparedStatement.m", 343, @"Invalid parameter not satisfying: %@", @"sql" object file lineNumber description];
      }
      v13 = -[_BSSqlitePreparedSimpleStatement _initWithDatabaseConnection:statement:]((id *)&v9->super.super.super.isa, v10, 0);
      if (v13)
      {
        uint64_t v14 = [v12 copy];
        id v15 = v13[3];
        v13[3] = (id)v14;
      }
    }
    else
    {
      v13 = 0;
    }

    [v5 addObject:v13];
    goto LABEL_12;
  }
  if (!pzTail || !*pzTail) {
    goto LABEL_18;
  }
LABEL_25:
}

- (BOOL)executeWithBindings:(id)a3 resultRowHandler:(id)a4 error:(id *)a5
{
  id v7 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  [v7 handleFailureInMethod:a2 object:self file:@"BSSqlitePreparedStatement.m" lineNumber:136 description:@"Abstract class implementation should never be called"];

  return 0;
}

- (void).cxx_destruct
{
}

@end