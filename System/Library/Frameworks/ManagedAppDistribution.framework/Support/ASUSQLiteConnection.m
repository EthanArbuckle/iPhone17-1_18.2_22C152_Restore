@interface ASUSQLiteConnection
- (ASUSQLiteConnection)initWithOptions:(id)a3;
- (ASUSQLiteConnectionDelegate)delegate;
- (ASUSQLiteConnectionOptions)options;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)open;
- (BOOL)performSavepoint:(id)a3;
- (BOOL)performTransaction:(id)a3 error:(id *)a4;
- (BOOL)tableExists:(id)a3;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int64_t)lastChangeCount;
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
    v6 = (ASUSQLiteConnectionOptions *)[v4 copy];
    options = v5->_options;
    v5->_options = v6;

    uint64_t v8 = +[NSMapTable strongToStrongObjectsMapTable];
    preparedStatements = v5->_preparedStatements;
    v5->_preparedStatements = (NSMapTable *)v8;
  }
  return v5;
}

- (void)dealloc
{
  if (self->_database)
  {
    v3 = ASULogHandleForCategory(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_10016FBA8((uint64_t)self, v3);
    }

    sqlite3_close_v2(self->_database);
  }
  v4.receiver = self;
  v4.super_class = (Class)ASUSQLiteConnection;
  [(ASUSQLiteConnection *)&v4 dealloc];
}

- (void)dispatchAfterTransaction:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_transactionDepth)
  {
    if (!self->_afterTransactionBlocks)
    {
      v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      afterTransactionBlocks = self->_afterTransactionBlocks;
      self->_afterTransactionBlocks = v5;
    }
    id v7 = [v10 copy];
    uint64_t v8 = self->_afterTransactionBlocks;
    id v9 = objc_retainBlock(v7);
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
  id v7 = (void (**)(id, id *, id))a4;
  id v11 = 0;
  uint64_t v8 = sub_10016DF6C((id *)&self->super.isa, v6, &v11);
  id v9 = v11;
  if (v8) {
    id v10 = sub_10016FF5C((id *)[ASUSQLiteQueryResults alloc], v8);
  }
  else {
    id v10 = 0;
  }
  v7[2](v7, v10, v9);
  [v8 clearBindings];
  [v8 reset];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4
{
  return [(ASUSQLiteConnection *)self executePreparedStatement:a3 error:a4 bindings:0];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v9 = sub_10016DF6C((id *)&self->super.isa, a3, &v15);
  id v10 = v15;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
    id v14 = v10;
    char v11 = sub_10016E1EC((uint64_t)self, v9, &v14);
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

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id *, id))a4;
  id v12 = 0;
  uint64_t v8 = sub_10016E478((id *)&self->super.isa, v6, &v12);
  id v9 = v12;
  id v10 = sub_100166A5C([ASUSQLitePreparedStatement alloc], (uint64_t)self->_database, v6);
  if (v10) {
    [(NSMapTable *)self->_preparedStatements setObject:v8 forKey:v10];
  }
  if (v8) {
    char v11 = sub_10016FF5C((id *)[ASUSQLiteQueryResults alloc], v8);
  }
  else {
    char v11 = 0;
  }
  v7[2](v7, v11, v9);
  [v8 finalizeStatement];
  if (v10) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v10];
  }
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
  id v10 = sub_10016E478((id *)&self->super.isa, v9, &v17);
  id v11 = v17;
  id v12 = sub_100166A5C([ASUSQLitePreparedStatement alloc], (uint64_t)self->_database, v9);

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
  char v13 = sub_10016E1EC((uint64_t)self, v10, &v16);
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
  id v7 = sub_10016DF6C((id *)&self->super.isa, v6, &v12);
  id v8 = v12;
  if (!v7)
  {
    BOOL v10 = 0;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v9 = ASUSQLiteCreateErrorForResultCode((int)[v7 finalizeStatement]);

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
  if (-[ASUSQLiteConnection open]_0((uint64_t)self)) {
    return sqlite3_changes(self->_database);
  }
  else {
    return 0;
  }
}

- (BOOL)open
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
        char v6 = sub_10016F568(a1) & v3;
        char v3 = 0;
        if (v6) {
          continue;
        }
      }
      return v2;
    }
    id v7 = db;
    *(void *)(a1 + 16) = db;
    sqlite3_create_function(v7, "timestamp", 0, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_10016F8D4, 0, 0);
  }
  return v2;
}

- (BOOL)performSavepoint:(id)a3
{
  int v4 = (unsigned int (**)(void))a3;
  v5 = +[NSUUID UUID];
  char v6 = [v5 UUIDString];
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10064C4E8];
  id v8 = +[NSString stringWithFormat:@"SP_%@", v7];

  uint64_t v9 = +[NSString stringWithFormat:@"SAVEPOINT %@", v8];
  LODWORD(v6) = [(ASUSQLiteConnection *)self executeStatement:v9 error:0];

  if (!v6) {
    goto LABEL_5;
  }
  if (!v4[2](v4))
  {
    id v12 = +[NSString stringWithFormat:@"ROLLBACK TRANSACTION TO SAVEPOINT %@", v8];
    [(ASUSQLiteConnection *)self executeStatement:v12 error:0];

LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  BOOL v10 = +[NSString stringWithFormat:@"RELEASE SAVEPOINT %@", v8];
  BOOL v11 = [(ASUSQLiteConnection *)self executeStatement:v10 error:0];

LABEL_6:
  return v11;
}

- (BOOL)performTransaction:(id)a3 error:(id *)a4
{
  char v6 = (uint64_t (**)(id, ASUSQLiteConnection *))a3;
  v18[0] = 0;
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (![(ASUSQLiteConnection *)self executeStatement:@"BEGIN DEFERRED TRANSACTION" error:v18])goto LABEL_25; {
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
        id v8 = +[NSError errorWithDomain:@"ASUSQLiteErrorDomain" code:6 userInfo:0];
LABEL_23:
        BOOL v10 = 0;
        *a4 = v8;
        goto LABEL_26;
      }
      goto LABEL_25;
    }
  }
  os_variant_has_internal_content();
  int v9 = v6[2](v6, self);
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
      if (v18[0]) {
        id v14 = 0;
      }
      else {
        id v14 = v18;
      }
      [(ASUSQLiteConnection *)self executeStatement:@"ROLLBACK TRANSACTION" error:v14];
    }
    else
    {
      [(ASUSQLiteConnection *)self executeStatement:@"COMMIT TRANSACTION" error:v18];
    }
    sub_10016EDD0((uint64_t)self);
  }
  if (a4) {
    char v15 = v10;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    if (v18[0])
    {
      id v8 = v18[0];
      goto LABEL_23;
    }
    id v16 = +[NSError errorWithDomain:@"ASUSQLiteErrorDomain" code:0 userInfo:0];
    *a4 = v16;

LABEL_25:
    BOOL v10 = 0;
  }
LABEL_26:

  return v10;
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v10 = 0;
  if (-[ASUSQLiteConnection open]_0((uint64_t)self))
  {
    id v7 = sub_10016EFA8((uint64_t)self, v6, &v10);
    if (v7)
    {
      id v8 = sub_100166A5C([ASUSQLitePreparedStatement alloc], (uint64_t)self, v6);
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
    +[NSError errorWithDomain:@"ASUSQLiteErrorDomain" code:1 userInfo:0];
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

- (BOOL)tableExists:(id)a3
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10016F1D4;
  v6[3] = &unk_100635CE0;
  id v4 = a3;
  id v7 = v4;
  id v8 = &v9;
  [(ASUSQLiteConnection *)self executeQuery:@"SELECT name FROM sqlite_master where name = ?" withResults:v6];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
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
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_preparedStatements, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_afterTransactionBlocks, 0);
}

@end