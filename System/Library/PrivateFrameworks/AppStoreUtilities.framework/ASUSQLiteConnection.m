@interface ASUSQLiteConnection
- (ASUSQLiteConnection)initWithOptions:(id)a3;
- (ASUSQLiteConnectionDelegate)delegate;
- (ASUSQLiteConnectionOptions)options;
- (BOOL)_open;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)performSavepoint:(id)a3;
- (BOOL)performTransaction:(id)a3 error:(id *)a4;
- (BOOL)tableExists:(id)a3;
- (id)_prepareStatement:(void *)a3 error:;
- (id)_verifiedStatementForPreparedStatement:(void *)a3 error:;
- (id)_verifiedStatementForSQL:(void *)a3 error:;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int64_t)lastChangeCount;
- (uint64_t)_close;
- (uint64_t)_executeStatement:(void *)a3 error:;
- (uint64_t)_executeWithError:(void *)a3 usingBlock:;
- (uint64_t)_resetAfterCorruptionError;
- (void)dealloc;
- (void)dispatchAfterTransaction:(id)a3;
- (void)executePreparedQuery:(id)a3 withResults:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ASUSQLiteConnection

- (ASUSQLiteConnection)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASUSQLiteConnection;
  v5 = [(ASUSQLiteConnection *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (ASUSQLiteConnectionOptions *)v6;

    uint64_t v8 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSMapTable *)v8;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (self->_database)
  {
    v3 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      id v4 = [(ASUSQLiteConnectionOptions *)self->_options databasePath];
      *(_DWORD *)buf = 138543362;
      v7 = v4;
      _os_log_fault_impl(&dword_247E53000, v3, OS_LOG_TYPE_FAULT, "Connection taken down HARD, please call close before deallocating: %{public}@", buf, 0xCu);
    }
    sqlite3_close_v2(self->_database);
  }
  v5.receiver = self;
  v5.super_class = (Class)ASUSQLiteConnection;
  [(ASUSQLiteConnection *)&v5 dealloc];
}

- (uint64_t)_close
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 16))
    {
      long long v10 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      v2 = objc_msgSend(*(id *)(result + 32), "objectEnumerator", 0);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3)
      {
        uint64_t v4 = v3;
        uint64_t v5 = *(void *)v11;
        do
        {
          uint64_t v6 = 0;
          do
          {
            if (*(void *)v11 != v5) {
              objc_enumerationMutation(v2);
            }
            [*(id *)(*((void *)&v10 + 1) + 8 * v6++) finalizeStatement];
          }
          while (v4 != v6);
          uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v4);
      }

      [*(id *)(v1 + 32) removeAllObjects];
      stmt = sqlite3_next_stmt(*(sqlite3 **)(v1 + 16), 0);
      if (stmt)
      {
        uint64_t v8 = stmt;
        do
        {
          sqlite3_finalize(v8);
          uint64_t v8 = sqlite3_next_stmt(*(sqlite3 **)(v1 + 16), v8);
        }
        while (v8);
      }
      if (sqlite3_close(*(sqlite3 **)(v1 + 16)))
      {
        return 0;
      }
      else
      {
        v9 = *(void **)(v1 + 8);
        *(void *)(v1 + 8) = 0;

        *(void *)(v1 + 16) = 0;
        *(void *)(v1 + 40) = 0;
        result = 1;
        *(unsigned char *)(v1 + 48) = 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      uint64_t v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;
    }
    v7 = (void *)[v10 copy];
    uint64_t v8 = self->_afterTransactionBlocks;
    v9 = (void *)MEMORY[0x24C56DA60]();
    [(NSMutableArray *)v8 addObject:v9];
  }
  else
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (void)executePreparedQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id *, id))a4;
  id v11 = 0;
  uint64_t v8 = -[ASUSQLiteConnection _verifiedStatementForPreparedStatement:error:]((id *)&self->super.isa, v6, &v11);
  id v9 = v11;
  if (v8) {
    id v10 = -[ASUSQLiteQueryResults initWithStatement:]((id *)[ASUSQLiteQueryResults alloc], v8);
  }
  else {
    id v10 = 0;
  }
  v7[2](v7, v10, v9);
  [v8 clearBindings];
  [v8 reset];
}

- (id)_verifiedStatementForPreparedStatement:(void *)a3 error:
{
  uint64_t v5 = a2;
  id v6 = v5;
  if (a1)
  {
    if (v5) {
      v7 = v5[1];
    }
    else {
      v7 = 0;
    }
    if (v7 == a1)
    {
      if (-[ASUSQLiteConnection _open]((uint64_t)a1))
      {
        id v9 = v6;
        uint64_t v10 = [a1[4] objectForKey:v9];
        if (v10)
        {
          id v11 = (void *)v10;
          id v12 = 0;
          id v13 = 0;
        }
        else
        {
          if (v6) {
            uint64_t v15 = v9[2];
          }
          else {
            uint64_t v15 = 0;
          }
          v16 = v15;
          id v18 = 0;
          id v11 = -[ASUSQLiteConnection _prepareStatement:error:]((uint64_t)a1, v16, &v18);
          id v13 = v18;

          if (v11)
          {
            [a1[4] setObject:v11 forKey:v9];
            id v12 = 0;
          }
          else
          {
            id v12 = v13;
            id v13 = v12;
          }
        }

        id v8 = v12;
        if (v11)
        {
          if ([a1[7] isReadOnly] && (objc_msgSend(v11, "isReadOnly") & 1) == 0)
          {
            uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:2 userInfo:0];

            a1 = 0;
            id v8 = (id)v17;
          }
          else
          {
            a1 = v11;
          }
        }
        else
        {
          a1 = 0;
        }

        if (a3)
        {
LABEL_11:
          if (!a1) {
            *a3 = v8;
          }
        }
LABEL_13:

        goto LABEL_14;
      }
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:1 userInfo:0];
    }
    else
    {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"Statement from a different connection"];
      id v8 = 0;
    }
    a1 = 0;
    if (a3) {
      goto LABEL_11;
    }
    goto LABEL_13;
  }
LABEL_14:

  return a1;
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return [(ASUSQLiteConnection *)self executePreparedStatement:a3 error:a4 bindings:0];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  id v8 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v9 = -[ASUSQLiteConnection _verifiedStatementForPreparedStatement:error:]((id *)&self->super.isa, a3, &v15);
  id v10 = v15;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
    id v14 = v10;
    char v11 = -[ASUSQLiteConnection _executeStatement:error:]((uint64_t)self, v9, &v14);
    id v12 = v14;

    if (v8) {
      [v9 clearBindings];
    }
    id v10 = v12;
  }
  else
  {
    char v11 = 0;
  }
  [v9 reset];
  if (a4 && (v11 & 1) == 0) {
    *a4 = v10;
  }

  return v11;
}

- (uint64_t)_executeStatement:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__ASUSQLiteConnection__executeStatement_error___block_invoke;
    v10[3] = &unk_26522FD98;
    id v7 = v5;
    id v11 = v7;
    uint64_t v8 = -[ASUSQLiteConnection _executeWithError:usingBlock:](a1, a3, v10);
    if (v8) {
      [v7 reset];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  v12[4] = *(id *)MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id *, id))a4;
  v12[0] = 0;
  uint64_t v8 = -[ASUSQLiteConnection _verifiedStatementForSQL:error:]((id *)&self->super.isa, v6, v12);
  id v9 = v12[0];
  id v10 = -[ASUSQLitePreparedStatement initWithConnection:SQL:]([ASUSQLitePreparedStatement alloc], (uint64_t)self->_database, v6);
  if (v10) {
    [(NSMapTable *)self->_preparedStatements setObject:v8 forKey:v10];
  }
  if (v8) {
    id v11 = -[ASUSQLiteQueryResults initWithStatement:]((id *)[ASUSQLiteQueryResults alloc], v8);
  }
  else {
    id v11 = 0;
  }
  v7[2](v7, v11, v9);
  [v8 finalizeStatement];
  if (v10) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v10];
  }
}

- (id)_verifiedStatementForSQL:(void *)a3 error:
{
  id v5 = a2;
  if (a1)
  {
    if (-[ASUSQLiteConnection _open]((uint64_t)a1))
    {
      id v10 = 0;
      id v6 = -[ASUSQLiteConnection _prepareStatement:error:]((uint64_t)a1, v5, &v10);
      id v7 = v10;
      if (v6)
      {
        if ([a1[7] isReadOnly] && (objc_msgSend(v6, "isReadOnly") & 1) == 0)
        {
          uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:2 userInfo:0];

          [v6 finalizeStatement];
          a1 = 0;
          id v7 = (id)v8;
        }
        else
        {
          a1 = v6;
        }
      }
      else
      {
        a1 = 0;
      }

      if (a3)
      {
LABEL_12:
        if (!a1) {
          *a3 = v7;
        }
      }
    }
    else
    {
      id v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:1 userInfo:0];
      a1 = 0;
      if (a3) {
        goto LABEL_12;
      }
    }
  }

  return a1;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return [(ASUSQLiteConnection *)self executeStatement:a3 error:a4 bindings:0];
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v17 = 0;
  id v9 = a3;
  id v10 = -[ASUSQLiteConnection _verifiedStatementForSQL:error:]((id *)&self->super.isa, v9, &v17);
  id v11 = v17;
  id v12 = -[ASUSQLitePreparedStatement initWithConnection:SQL:]([ASUSQLitePreparedStatement alloc], (uint64_t)self->_database, v9);

  if (v12) {
    [(NSMapTable *)self->_preparedStatements setObject:v10 forKey:v12];
  }
  if (!v10)
  {
    char v13 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v8) {
    v8[2](v8, v10);
  }
  id v16 = v11;
  char v13 = -[ASUSQLiteConnection _executeStatement:error:]((uint64_t)self, v10, &v16);
  id v14 = v16;

  [v10 finalizeStatement];
  if (v12) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v12];
  }
  id v11 = v14;
  if (a4)
  {
LABEL_11:
    if ((v13 & 1) == 0) {
      *a4 = v11;
    }
  }
LABEL_13:

  return v13;
}

- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  id v7 = -[ASUSQLiteConnection _verifiedStatementForPreparedStatement:error:]((id *)&self->super.isa, v6, &v12);
  id v8 = v12;
  if (!v7)
  {
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = ASUSQLiteCreateErrorForResultCode([v7 finalizeStatement]);

  BOOL v10 = v9 == 0;
  [(NSMapTable *)self->_preparedStatements removeObjectForKey:v6];
  id v8 = (id)v9;
  if (a4) {
LABEL_3:
  }
    *a4 = v8;
LABEL_4:

  return v10;
}

- (int64_t)lastChangeCount
{
  if (-[ASUSQLiteConnection _open]((uint64_t)self)) {
    return sqlite3_changes(self->_database);
  }
  else {
    return 0;
  }
}

- (BOOL)_open
{
  if (!a1) {
    return 0;
  }
  BOOL v2 = 1;
  if (!*(void *)(a1 + 16))
  {
    db = 0;
    char v3 = 1;
    while (1)
    {
      int v4 = ASUSQLiteOpenDatabaseAndApplyOptions(&db, *(void **)(a1 + 56));
      BOOL v2 = v4 == 0;
      if (!v4) {
        break;
      }
      if (v4 <= 0x1Au && ((1 << v4) & 0x4000C02) != 0)
      {
        char v6 = v3 & -[ASUSQLiteConnection _resetAfterCorruptionError](a1);
        char v3 = 0;
        if (v6) {
          continue;
        }
      }
      return v2;
    }
    id v7 = db;
    *(void *)(a1 + 16) = db;
    sqlite3_create_function(v7, "timestamp", 0, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_timeIntervalSinceReferenceDate, 0, 0);
  }
  return v2;
}

- (BOOL)performSavepoint:(id)a3
{
  int v4 = (unsigned int (**)(void))a3;
  id v5 = NSString;
  char v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];
  id v8 = [v7 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26FC18F88];
  uint64_t v9 = [v5 stringWithFormat:@"SP_%@", v8];

  BOOL v10 = [NSString stringWithFormat:@"SAVEPOINT %@", v9];
  LODWORD(v7) = [(ASUSQLiteConnection *)self executeStatement:v10 error:0];

  if (!v7) {
    goto LABEL_5;
  }
  if (!v4[2](v4))
  {
    char v13 = [NSString stringWithFormat:@"ROLLBACK TRANSACTION TO SAVEPOINT %@", v9];
    [(ASUSQLiteConnection *)self executeStatement:v13 error:0];

LABEL_5:
    BOOL v12 = 0;
    goto LABEL_6;
  }
  id v11 = [NSString stringWithFormat:@"RELEASE SAVEPOINT %@", v9];
  BOOL v12 = [(ASUSQLiteConnection *)self executeStatement:v11 error:0];

LABEL_6:
  return v12;
}

- (BOOL)performTransaction:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v6 = (uint64_t (**)(void))a3;
  v23[0] = 0;
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (![(ASUSQLiteConnection *)self executeStatement:@"BEGIN DEFERRED TRANSACTION" error:v23])goto LABEL_26; {
    self->_int64_t transactionDepth = 1;
    }
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_int64_t transactionDepth = transactionDepth + 1;
    if (self->_transactionWantsRollback)
    {
      if (a4)
      {
        id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:6 userInfo:0];
LABEL_24:
        BOOL v10 = 0;
        *a4 = v8;
        goto LABEL_27;
      }
      goto LABEL_26;
    }
  }
  os_variant_has_internal_content();
  int v9 = v6[2](v6);
  BOOL v10 = v9;
  int64_t v11 = self->_transactionDepth;
  int v12 = v9 ^ 1;
  if (self->_transactionWantsRollback) {
    int v12 = 1;
  }
  self->_transactionWantsRollback = v12;
  int64_t v13 = v11 - 1;
  self->_int64_t transactionDepth = v13;
  if (!v13)
  {
    if (v12)
    {
      if (v23[0]) {
        id v14 = 0;
      }
      else {
        id v14 = v23;
      }
      [(ASUSQLiteConnection *)self executeStatement:@"ROLLBACK TRANSACTION" error:v14];
    }
    else
    {
      [(ASUSQLiteConnection *)self executeStatement:@"COMMIT TRANSACTION" error:v23];
    }
    afterTransactionBlocks = self->_afterTransactionBlocks;
    if (afterTransactionBlocks)
    {
      id v16 = (void *)[(NSMutableArray *)afterTransactionBlocks copy];
      id v17 = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = 0;

      id v18 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __51__ASUSQLiteConnection__flushAfterTransactionBlocks__block_invoke;
      block[3] = &unk_26522FA68;
      id v25 = v16;
      id v19 = v16;
      dispatch_async(v18, block);
    }
  }
  if (a4) {
    char v20 = v10;
  }
  else {
    char v20 = 1;
  }
  if ((v20 & 1) == 0)
  {
    if (v23[0])
    {
      id v8 = v23[0];
      goto LABEL_24;
    }
    id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:0 userInfo:0];
    *a4 = v21;

LABEL_26:
    BOOL v10 = 0;
  }
LABEL_27:

  return v10;
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = 0;
  if (-[ASUSQLiteConnection _open]((uint64_t)self))
  {
    id v7 = -[ASUSQLiteConnection _prepareStatement:error:]((uint64_t)self, v6, &v10);
    if (v7)
    {
      id v8 = -[ASUSQLitePreparedStatement initWithConnection:SQL:]([ASUSQLitePreparedStatement alloc], (uint64_t)self, v6);
      [(NSMapTable *)self->_preparedStatements setObject:v7 forKey:v8];
    }
    else
    {
      id v8 = 0;
    }

    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:1 userInfo:0];
    id v8 = 0;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v8) {
    *a4 = v10;
  }
LABEL_10:

  return v8;
}

- (id)_prepareStatement:(void *)a3 error:
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__2;
    id v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    uint64_t v7 = [v5 UTF8String];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __47__ASUSQLiteConnection__prepareStatement_error___block_invoke;
    v10[3] = &unk_26522FDC0;
    v10[5] = &v11;
    v10[6] = v7;
    void v10[4] = a1;
    -[ASUSQLiteConnection _executeWithError:usingBlock:](a1, a3, v10);
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)tableExists:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __35__ASUSQLiteConnection_tableExists___block_invoke;
  v7[3] = &unk_26522F770;
  id v5 = v4;
  id v8 = v5;
  int v9 = &v10;
  [(ASUSQLiteConnection *)self executeQuery:@"SELECT name FROM sqlite_master where name = ?" withResults:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __35__ASUSQLiteConnection_tableExists___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 bindString:v3 atPosition:1];
  LOBYTE(v3) = [v4 hasRows];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (uint64_t)_executeWithError:(void *)a3 usingBlock:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!a1)
  {
    uint64_t v17 = 0;
    goto LABEL_31;
  }
  uint64_t v6 = 0;
  unsigned __int8 v7 = 0;
  do
  {
    id v8 = (void *)MEMORY[0x24C56D840]();
    buf[0] = 0;
    int v9 = v5[2](v5, buf);
    if (v9 <= 0x19u)
    {
      switch((char)v9)
      {
        case 0:
          goto LABEL_13;
        case 5:
        case 6:
          if (v6 < 10)
          {
            usleep(0xF4240u);
            ++v6;
            goto LABEL_9;
          }
          uint64_t v12 = [MEMORY[0x263F087E8] errorWithDomain:@"ASUSQLiteErrorDomain" code:3 userInfo:0];
          break;
        case 10:
          uint64_t v11 = ASUSQLiteCreateErrorForResultCode(v9);
          char v13 = ASULogHandleForCategory(1);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            id v19 = objc_opt_class();
            char v20 = *(void **)(a1 + 56);
            id v21 = v19;
            v22 = [v20 databasePath];
            *(_DWORD *)buf = 138412546;
            v32 = v19;
            __int16 v33 = 2114;
            v34 = v22;
            _os_log_error_impl(&dword_247E53000, v13, OS_LOG_TYPE_ERROR, "[%@]: Reopening database after IO error: %{public}@", buf, 0x16u);
          }
          id v14 = *(void **)(a1 + 8);
          id v15 = v14;
          uint64_t v16 = *(void *)(a1 + 40);
          if (!-[ASUSQLiteConnection _close](a1) || !-[ASUSQLiteConnection _open](a1)) {
            goto LABEL_22;
          }
          if (!v16) {
            goto LABEL_33;
          }
          if (sqlite3_exec(*(sqlite3 **)(a1 + 16), "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
          {
LABEL_22:
            -[ASUSQLiteConnection _resetAfterCorruptionError](a1);
          }
          else
          {
            objc_storeStrong((id *)(a1 + 8), v14);
            *(void *)(a1 + 40) = v16;
            *(unsigned char *)(a1 + 48) = 1;
LABEL_33:
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
            char v24 = objc_opt_respondsToSelector();

            if (v24)
            {
              id v25 = ASULogHandleForCategory(1);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                v27 = objc_opt_class();
                v28 = *(void **)(a1 + 56);
                id v30 = v27;
                v29 = [v28 databasePath];
                *(_DWORD *)buf = 138412546;
                v32 = v27;
                __int16 v33 = 2114;
                v34 = v29;
                _os_log_error_impl(&dword_247E53000, v25, OS_LOG_TYPE_ERROR, "[%@]: Asking delegate to reset database after reopen: %{public}@", buf, 0x16u);
              }
              id v26 = objc_loadWeakRetained((id *)(a1 + 24));
              [v26 connectionNeedsResetForReopen:a1];
            }
          }

          goto LABEL_27;
        case 11:
          goto LABEL_14;
        default:
          goto LABEL_24;
      }
      goto LABEL_25;
    }
    if (v9 != 100)
    {
      if (v9 == 26)
      {
LABEL_14:
        uint64_t v11 = ASUSQLiteCreateErrorForResultCode(v9);
        -[ASUSQLiteConnection _resetAfterCorruptionError](a1);
        goto LABEL_27;
      }
      if (v9 == 101)
      {
LABEL_13:
        uint64_t v11 = 0;
        unsigned __int8 v7 = 1;
LABEL_26:
        goto LABEL_27;
      }
LABEL_24:
      uint64_t v12 = ASUSQLiteCreateErrorForResultCode(v9);
LABEL_25:
      uint64_t v11 = (void *)v12;
      goto LABEL_26;
    }
    unsigned __int8 v7 = 1;
LABEL_9:
    int v10 = buf[0];
  }
  while (!v10);
  uint64_t v11 = 0;
LABEL_27:
  if (a2 && (v7 & 1) == 0) {
    *a2 = v11;
  }

  uint64_t v17 = v7;
LABEL_31:

  return v17;
}

uint64_t __47__ASUSQLiteConnection__executeStatement_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) step];
}

- (uint64_t)_resetAfterCorruptionError
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  BOOL v2 = (id *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      uint64_t v12 = *(void **)(a1 + 56);
      id v13 = v11;
      id v14 = [v12 databasePath];
      int v19 = 138412546;
      char v20 = v11;
      __int16 v21 = 2114;
      v22 = v14;
      _os_log_error_impl(&dword_247E53000, v5, OS_LOG_TYPE_ERROR, "[%@]: Asking delegate to reset database after corruption: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v6 = objc_loadWeakRetained(v2);
    uint64_t v7 = [v6 connectionNeedsResetForCorruption:a1];
LABEL_10:
    uint64_t v8 = v7;

    return v8;
  }
  if (([*(id *)(a1 + 56) isReadOnly] & 1) == 0)
  {
    int v9 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      uint64_t v16 = *(void **)(a1 + 56);
      id v17 = v15;
      id v18 = [v16 databasePath];
      int v19 = 138412546;
      char v20 = v15;
      __int16 v21 = 2114;
      v22 = v18;
      _os_log_error_impl(&dword_247E53000, v9, OS_LOG_TYPE_ERROR, "[%@]: Deleting database after corruption: %{public}@", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v6 = [*(id *)(a1 + 56) databasePath];
    -[ASUSQLiteConnection _close](a1);
    uint64_t v7 = ASUSQLiteDeleteDatabase(v6, 0);
    goto LABEL_10;
  }
  return 0;
}

void __51__ASUSQLiteConnection__flushAfterTransactionBlocks__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v6 + 1) + 8 * v5) + 16))(*(void *)(*((void *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

uint64_t __47__ASUSQLiteConnection__prepareStatement_error___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  uint64_t v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), *(const char **)(a1 + 48), -1, &ppStmt, 0);
  if (v2 - 100 < 2 || v2 == 0)
  {
    uint64_t v4 = [ASUSQLiteStatement alloc];
    uint64_t v5 = [(ASUSQLiteStatement *)v4 initWithStatement:ppStmt onConnection:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    long long v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  else
  {
    sqlite3_finalize(ppStmt);
  }
  return v2;
}

- (ASUSQLiteConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASUSQLiteConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASUSQLiteConnectionOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

@end