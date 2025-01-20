@interface SQLiteConnection
- (BOOL)_close;
- (BOOL)_executeStatement:(id)a3 error:(id *)a4;
- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)_open;
- (BOOL)_performResetAfterCorruptionError;
- (BOOL)_resetAfterCorruptionError;
- (BOOL)_resetAfterIOError;
- (BOOL)addFunction:(id)a3;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)executeStatement:(id)a3 error:(id *)a4;
- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5;
- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4;
- (BOOL)isInMemoryDatabase;
- (BOOL)performSavepoint:(id)a3;
- (BOOL)removeFunction:(id)a3;
- (BOOL)removeFunctionNamed:(id)a3 withArgumentCount:(int64_t)a4;
- (BOOL)tableExists:(id)a3;
- (BOOL)truncate;
- (NSError)currentError;
- (SQLiteConnection)initWithOptions:(id)a3;
- (SQLiteConnectionDelegate)delegate;
- (SQLiteConnectionOptions)options;
- (id)_prepareStatement:(id)a3 error:(id *)a4;
- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4;
- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4;
- (id)prepareStatement:(id)a3 error:(id *)a4;
- (int64_t)lastChangeCount;
- (void)_finalizeAllStatements;
- (void)_flushAfterTransactionBlocks;
- (void)dealloc;
- (void)dispatchAfterTransaction:(id)a3;
- (void)executePreparedQuery:(id)a3 withResults:(id)a4;
- (void)executeQuery:(id)a3 withResults:(id)a4;
- (void)performTransaction:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SQLiteConnection

- (void)executeQuery:(id)a3 withResults:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, SQLiteQueryResults *, id))a4;
  id v12 = 0;
  v8 = [(SQLiteConnection *)self _verifiedStatementForSQL:v6 error:&v12];
  id v9 = v12;
  v10 = [[SQLitePreparedStatement alloc] initWithConnection:self->_database SQL:v6];
  if (v10) {
    [(NSMapTable *)self->_preparedStatements setObject:v8 forKey:v10];
  }
  if (v8) {
    v11 = [[SQLiteQueryResults alloc] initWithStatement:v8];
  }
  else {
    v11 = 0;
  }
  v7[2](v7, v11, v9);
  [v8 finalizeStatement];
  if (v10) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v10];
  }
}

- (void)performTransaction:(id)a3
{
  v4 = (uint64_t (**)(void))a3;
  int64_t transactionDepth = self->_transactionDepth;
  if (transactionDepth < 1)
  {
    if (![(SQLiteConnection *)self executeStatement:@"BEGIN DEFERRED TRANSACTION" error:0])goto LABEL_12; {
    self->_int64_t transactionDepth = 1;
    }
    self->_transactionWantsRollback = 0;
  }
  else
  {
    self->_int64_t transactionDepth = transactionDepth + 1;
  }
  os_variant_has_internal_content();
  int v6 = v4[2](v4);
  int64_t v7 = self->_transactionDepth;
  int v8 = v6 ^ 1;
  if (self->_transactionWantsRollback) {
    int v8 = 1;
  }
  self->_transactionWantsRollback = v8;
  int64_t v9 = v7 - 1;
  self->_int64_t transactionDepth = v9;
  if (!v9)
  {
    if (v8) {
      CFStringRef v10 = @"ROLLBACK TRANSACTION";
    }
    else {
      CFStringRef v10 = @"COMMIT TRANSACTION";
    }
    [(SQLiteConnection *)self executeStatement:v10 error:0];
    [(SQLiteConnection *)self _flushAfterTransactionBlocks];
  }
LABEL_12:
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  int v8 = (void (**)(id, void *))a5;
  id v17 = 0;
  id v9 = a3;
  CFStringRef v10 = [(SQLiteConnection *)self _verifiedStatementForSQL:v9 error:&v17];
  id v11 = v17;
  id v12 = [[SQLitePreparedStatement alloc] initWithConnection:self->_database SQL:v9];

  if (v12) {
    [(NSMapTable *)self->_preparedStatements setObject:v10 forKey:v12];
  }
  if (!v10)
  {
    BOOL v13 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v8) {
    v8[2](v8, v10);
  }
  id v16 = v11;
  BOOL v13 = [(SQLiteConnection *)self _executeStatement:v10 error:&v16];
  id v14 = v16;

  [v10 finalizeStatement];
  if (v12) {
    [(NSMapTable *)self->_preparedStatements removeObjectForKey:v12];
  }
  id v11 = v14;
  if (a4)
  {
LABEL_11:
    if (!v13) {
      *a4 = v11;
    }
  }
LABEL_13:

  return v13;
}

- (BOOL)executeStatement:(id)a3 error:(id *)a4
{
  return [(SQLiteConnection *)self executeStatement:a3 error:a4 bindings:0];
}

- (id)_verifiedStatementForSQL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(SQLiteConnection *)self _open])
  {
    id v12 = 0;
    int64_t v7 = [(SQLiteConnection *)self _prepareStatement:v6 error:&v12];
    id v8 = v12;
    if (v7)
    {
      if ([(SQLiteConnectionOptions *)self->_options isReadOnly]
        && ([v7 isReadOnly] & 1) == 0)
      {
        uint64_t v10 = +[NSError errorWithDomain:@"SQLiteErrorDomain" code:-7701 userInfo:0];

        [v7 finalizeStatement];
        id v9 = 0;
        id v8 = (id)v10;
      }
      else
      {
        id v9 = v7;
      }
    }
    else
    {
      id v9 = 0;
    }

    if (!a4) {
      goto LABEL_13;
    }
  }
  else
  {
    id v8 = +[NSError errorWithDomain:@"SQLiteErrorDomain" code:-7700 userInfo:0];
    id v9 = 0;
    if (!a4) {
      goto LABEL_13;
    }
  }
  if (!v9) {
    *a4 = v8;
  }
LABEL_13:

  return v9;
}

- (BOOL)_open
{
  if (self->_database) {
    return 1;
  }
  if (qword_10039F950 != -1) {
    dispatch_once(&qword_10039F950, &stru_1003583E8);
  }
  v4 = (void *)qword_100398FC8;
  if (os_log_type_enabled((os_log_t)qword_100398FC8, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    id v6 = objc_opt_class();
    options = self->_options;
    id v8 = v6;
    id v9 = [(SQLiteConnectionOptions *)options databasePath];
    *(_DWORD *)db = 138543618;
    *(void *)&db[4] = v6;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Opening database at path: %{public}@", db, 0x16u);
  }
  *(void *)db = 0;
  char v10 = 1;
  while (1)
  {
    int v11 = sub_100038860((sqlite3 **)db, self->_options);
    BOOL v2 = v11 == 0;
    if (!v11) {
      break;
    }
    if (v11 <= 0x1Au && ((1 << v11) & 0x4000C02) != 0)
    {
      char v13 = [(SQLiteConnection *)self _performResetAfterCorruptionError] & v10;
      char v10 = 0;
      if (v13) {
        continue;
      }
    }
    return v2;
  }
  id v14 = *(sqlite3 **)db;
  self->_database = *(sqlite3 **)db;
  self->_didResetForCorruption = 0;
  sqlite3_create_function(v14, "timestamp", 0, 1, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_1000459D8, 0, 0);
  return v2;
}

- (BOOL)_executeStatement:(id)a3 error:(id *)a4
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014DA4;
  v9[3] = &unk_1003583A0;
  id v6 = a3;
  id v10 = v6;
  BOOL v7 = [(SQLiteConnection *)self _executeWithError:a4 usingBlock:v9];
  if (v7) {
    [v6 reset];
  }

  return v7;
}

- (id)_prepareStatement:(id)a3 error:(id *)a4
{
  uint64_t v10 = 0;
  int v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = sub_100045B60;
  id v14 = sub_100045B70;
  id v15 = 0;
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014D14;
  v9[3] = &unk_1003583C8;
  v9[5] = &v10;
  v9[6] = [v6 UTF8String];
  void v9[4] = self;
  [(SQLiteConnection *)self _executeWithError:a4 usingBlock:v9];
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (BOOL)_executeWithError:(id *)a3 usingBlock:(id)a4
{
  id v6 = (unsigned __int8 (**)(id, unsigned char *))a4;
  char v7 = 0;
  uint64_t v8 = 0;
  do
  {
    unsigned __int8 v15 = 0;
    unsigned int v10 = v6[2](v6, &v15);
    if (v10 <= 0x19)
    {
      switch(v10)
      {
        case 0u:
          goto LABEL_12;
        case 5u:
        case 6u:
          if (v8 < 10)
          {
            usleep(0xF4240u);
            ++v8;
            goto LABEL_8;
          }
          uint64_t v13 = +[NSError errorWithDomain:@"SQLiteErrorDomain" code:-7702 userInfo:0];
          break;
        case 0xAu:
          uint64_t v12 = sub_100038788(self->_database);
          [(SQLiteConnection *)self _resetAfterIOError];
          goto LABEL_19;
        case 0xBu:
          goto LABEL_13;
        default:
          goto LABEL_16;
      }
      goto LABEL_17;
    }
    if (v10 != 100)
    {
      if (v10 == 26)
      {
LABEL_13:
        uint64_t v12 = sub_100038788(self->_database);
        [(SQLiteConnection *)self _resetAfterCorruptionError];
        goto LABEL_19;
      }
      if (v10 == 101)
      {
LABEL_12:
        uint64_t v12 = 0;
        char v7 = 1;
LABEL_18:
        goto LABEL_19;
      }
LABEL_16:
      uint64_t v13 = sub_100038788(self->_database);
LABEL_17:
      uint64_t v12 = (void *)v13;
      goto LABEL_18;
    }
    char v7 = 1;
LABEL_8:
    int v11 = v15;
  }
  while (!v11);
  uint64_t v12 = 0;
LABEL_19:
  if (a3 && (v7 & 1) == 0) {
    *a3 = v12;
  }

  return v7 & 1;
}

- (void)_flushAfterTransactionBlocks
{
  afterTransactionBlocks = self->_afterTransactionBlocks;
  if (afterTransactionBlocks)
  {
    id v4 = [(NSMutableArray *)afterTransactionBlocks copy];
    v5 = self->_afterTransactionBlocks;
    self->_afterTransactionBlocks = 0;

    id v6 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000458E4;
    block[3] = &unk_100358170;
    id v9 = v4;
    id v7 = v4;
    dispatch_async(v6, block);
  }
}

- (SQLiteConnection)initWithOptions:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SQLiteConnection;
  v5 = [(SQLiteConnection *)&v11 init];
  if (v5)
  {
    id v6 = (SQLiteConnectionOptions *)[v4 copy];
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
    if (qword_10039F950 != -1) {
      dispatch_once(&qword_10039F950, &stru_1003583E8);
    }
    v3 = (void *)qword_100398FC8;
    if (os_log_type_enabled((os_log_t)qword_100398FC8, OS_LOG_TYPE_FAULT)) {
      sub_1002C2680((uint64_t)self, v3);
    }
    sqlite3_close_v2(self->_database);
  }
  v4.receiver = self;
  v4.super_class = (Class)SQLiteConnection;
  [(SQLiteConnection *)&v4 dealloc];
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
  id v7 = (void (**)(id, SQLiteQueryResults *, id))a4;
  id v11 = 0;
  uint64_t v8 = [(SQLiteConnection *)self _verifiedStatementForPreparedStatement:v6 error:&v11];
  id v9 = v11;
  if (v8) {
    id v10 = [[SQLiteQueryResults alloc] initWithStatement:v8];
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
  return [(SQLiteConnection *)self executePreparedStatement:a3 error:a4 bindings:0];
}

- (BOOL)executePreparedStatement:(id)a3 error:(id *)a4 bindings:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v15 = 0;
  id v9 = [(SQLiteConnection *)self _verifiedStatementForPreparedStatement:a3 error:&v15];
  id v10 = v15;
  if (v9)
  {
    if (v8) {
      v8[2](v8, v9);
    }
    id v14 = v10;
    BOOL v11 = [(SQLiteConnection *)self _executeStatement:v9 error:&v14];
    id v12 = v14;

    if (v8) {
      [v9 clearBindings];
    }
    id v10 = v12;
  }
  else
  {
    BOOL v11 = 0;
  }
  [v9 reset];
  if (a4 && !v11) {
    *a4 = v10;
  }

  return v11;
}

- (BOOL)finalizePreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v12 = 0;
  id v7 = [(SQLiteConnection *)self _verifiedStatementForPreparedStatement:v6 error:&v12];
  id v8 = v12;
  if (!v7)
  {
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  BOOL v9 = sub_100014DAC([v7 finalizeStatement]);
  if (!v9)
  {
    uint64_t v10 = sub_100038788(self->_database);

    id v8 = (id)v10;
  }
  [(NSMapTable *)self->_preparedStatements removeObjectForKey:v6];
  if (a4)
  {
LABEL_7:
    if (!v9) {
      *a4 = v8;
    }
  }
LABEL_9:

  return v9;
}

- (int64_t)lastChangeCount
{
  if ([(SQLiteConnection *)self _open]) {
    return sqlite3_changes(self->_database);
  }
  else {
    return 0;
  }
}

- (BOOL)performSavepoint:(id)a3
{
  id v4 = (unsigned int (**)(void))a3;
  v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];
  id v7 = [v6 stringByReplacingOccurrencesOfString:@"-" withString:&stru_10036C970];
  id v8 = +[NSString stringWithFormat:@"SP_%@", v7];

  BOOL v9 = +[NSString stringWithFormat:@"SAVEPOINT %@", v8];
  LODWORD(v6) = [(SQLiteConnection *)self executeStatement:v9 error:0];

  if (!v6) {
    goto LABEL_5;
  }
  if (!v4[2](v4))
  {
    id v12 = +[NSString stringWithFormat:@"ROLLBACK TRANSACTION TO SAVEPOINT %@", v8];
    [(SQLiteConnection *)self executeStatement:v12 error:0];

LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  uint64_t v10 = +[NSString stringWithFormat:@"RELEASE SAVEPOINT %@", v8];
  BOOL v11 = [(SQLiteConnection *)self executeStatement:v10 error:0];

LABEL_6:
  return v11;
}

- (id)prepareStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(SQLiteConnection *)self _open])
  {
    id v11 = 0;
    id v7 = [(SQLiteConnection *)self _prepareStatement:v6 error:&v11];
    id v8 = v11;
    if (v7)
    {
      BOOL v9 = [[SQLitePreparedStatement alloc] initWithConnection:self SQL:v6];
      [(NSMapTable *)self->_preparedStatements setObject:v7 forKey:v9];
    }
    else
    {
      BOOL v9 = 0;
    }

    if (!a4) {
      goto LABEL_10;
    }
  }
  else
  {
    id v8 = +[NSError errorWithDomain:@"SQLiteErrorDomain" code:-7700 userInfo:0];
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if (!v9) {
    *a4 = v8;
  }
LABEL_10:

  return v9;
}

- (BOOL)truncate
{
  if ([(SQLiteConnectionOptions *)self->_options isReadOnly] || ![(SQLiteConnection *)self _open]) {
    return 0;
  }
  [(SQLiteConnection *)self _finalizeAllStatements];
  int v6 = 129;
  int v3 = sqlite3_file_control(self->_database, 0, 101, &v6);
  BOOL v4 = v3 == 0;
  if (!v3)
  {
    sqlite3_close(self->_database);
    self->_database = 0;
  }
  return v4;
}

- (BOOL)tableExists:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100045218;
  v6[3] = &unk_100357318;
  id v4 = a3;
  id v7 = v4;
  id v8 = &v9;
  [(SQLiteConnection *)self executeQuery:@"SELECT name FROM sqlite_master where name = ?" withResults:v6];
  LOBYTE(self) = *((unsigned char *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (BOOL)addFunction:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_database)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000453C0;
    v9[3] = &unk_100358378;
    void v9[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    [v10 withUnsafePropertyPointers:v9];
    BOOL v6 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    if (qword_10039F950 != -1) {
      dispatch_once(&qword_10039F950, &stru_1003583E8);
    }
    id v7 = (void *)qword_100398FC8;
    if (os_log_type_enabled((os_log_t)qword_100398FC8, OS_LOG_TYPE_FAULT)) {
      sub_1002C2878((uint64_t)self, v7);
    }
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)removeFunction:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  id v6 = [v4 argumentCount];

  LOBYTE(self) = [(SQLiteConnection *)self removeFunctionNamed:v5 withArgumentCount:v6];
  return (char)self;
}

- (BOOL)removeFunctionNamed:(id)a3 withArgumentCount:(int64_t)a4
{
  int v4 = a4;
  id v6 = a3;
  id v7 = v6;
  database = self->_database;
  if (database)
  {
    BOOL v9 = sqlite3_create_function_v2(database, (const char *)[v6 UTF8String], v4, 1, 0, 0, 0, 0, 0) == 0;
  }
  else
  {
    if (qword_10039F950 != -1) {
      dispatch_once(&qword_10039F950, &stru_1003583E8);
    }
    id v10 = (void *)qword_100398FC8;
    if (os_log_type_enabled((os_log_t)qword_100398FC8, OS_LOG_TYPE_ERROR)) {
      sub_1002C2924((uint64_t)self, v10);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (NSError)currentError
{
  database = self->_database;
  if (database)
  {
    sub_100038788(database);
    database = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  }

  return (NSError *)database;
}

- (BOOL)isInMemoryDatabase
{
  return [(SQLiteConnectionOptions *)self->_options isInMemoryDatabase];
}

- (BOOL)_close
{
  if (!self->_database) {
    return 1;
  }
  if (qword_10039F950 != -1) {
    dispatch_once(&qword_10039F950, &stru_1003583E8);
  }
  int v3 = (void *)qword_100398FC8;
  if (os_log_type_enabled((os_log_t)qword_100398FC8, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    v5 = objc_opt_class();
    options = self->_options;
    id v7 = v5;
    id v8 = [(SQLiteConnectionOptions *)options databasePath];
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Closing database at path: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(SQLiteConnection *)self _finalizeAllStatements];
  if (sqlite3_close(self->_database)) {
    return 0;
  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  self->_afterTransactionBlocks = 0;

  self->_database = 0;
  self->_int64_t transactionDepth = 0;
  BOOL result = 1;
  self->_transactionWantsRollback = 0;
  return result;
}

- (void)_finalizeAllStatements
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v3 = [(NSMapTable *)self->_preparedStatements objectEnumerator];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) finalizeStatement];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(NSMapTable *)self->_preparedStatements removeAllObjects];
  stmt = sqlite3_next_stmt(self->_database, 0);
  if (stmt)
  {
    BOOL v9 = stmt;
    do
    {
      sqlite3_finalize(v9);
      BOOL v9 = sqlite3_next_stmt(self->_database, v9);
    }
    while (v9);
  }
}

- (BOOL)_performResetAfterCorruptionError
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    if (qword_10039F950 != -1) {
      dispatch_once(&qword_10039F950, &stru_1003583E8);
    }
    uint64_t v6 = (void *)qword_100398F98;
    if (os_log_type_enabled((os_log_t)qword_100398F98, OS_LOG_TYPE_ERROR)) {
      sub_1002C29CC(v6);
    }
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    unsigned __int8 v8 = [v7 connectionNeedsResetForCorruption:self];
LABEL_14:
    BOOL v9 = v8;

    return v9;
  }
  if (![(SQLiteConnectionOptions *)self->_options isReadOnly])
  {
    if (qword_10039F950 != -1) {
      dispatch_once(&qword_10039F950, &stru_1003583E8);
    }
    long long v10 = (void *)qword_100398F98;
    if (os_log_type_enabled((os_log_t)qword_100398F98, OS_LOG_TYPE_ERROR)) {
      sub_1002C2A80(v10);
    }
    id v7 = [(SQLiteConnectionOptions *)self->_options databasePath];
    unsigned __int8 v8 = sub_100038A44(v7);
    goto LABEL_14;
  }
  return 0;
}

- (BOOL)_resetAfterCorruptionError
{
  if (self->_didResetForCorruption
    || ([(SQLiteConnectionOptions *)self->_options encryptionKeyId],
        int v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    [(SQLiteConnection *)self _close];
    return [(SQLiteConnection *)self _performResetAfterCorruptionError];
  }
  else
  {
    self->_didResetForCorruption = 1;
    return [(SQLiteConnection *)self _resetAfterIOError];
  }
}

- (BOOL)_resetAfterIOError
{
  if (qword_10039F950 != -1) {
    dispatch_once(&qword_10039F950, &stru_1003583E8);
  }
  int v3 = (void *)qword_100398F98;
  if (os_log_type_enabled((os_log_t)qword_100398F98, OS_LOG_TYPE_ERROR)) {
    sub_1002C2C0C(v3);
  }
  afterTransactionBlocks = self->_afterTransactionBlocks;
  char v5 = afterTransactionBlocks;
  int64_t transactionDepth = self->_transactionDepth;
  if (![(SQLiteConnection *)self _close] || ![(SQLiteConnection *)self _open]) {
    goto LABEL_9;
  }
  if (transactionDepth)
  {
    if (sqlite3_exec(self->_database, "BEGIN DEFERRED TRANSACTION", 0, 0, 0))
    {
LABEL_9:
      [(SQLiteConnection *)self _close];
      unsigned __int8 v7 = [(SQLiteConnection *)self _performResetAfterCorruptionError];
      goto LABEL_10;
    }
    objc_storeStrong((id *)&self->_afterTransactionBlocks, afterTransactionBlocks);
    self->_int64_t transactionDepth = transactionDepth;
    self->_transactionWantsRollback = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    if (qword_10039F950 != -1) {
      dispatch_once(&qword_10039F950, &stru_1003583E8);
    }
    long long v11 = (void *)qword_100398F98;
    if (os_log_type_enabled((os_log_t)qword_100398F98, OS_LOG_TYPE_ERROR)) {
      sub_1002C2B58(v11);
    }
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v7 = [v12 connectionNeedsResetForReopen:self];
  }
  else
  {
    unsigned __int8 v7 = 1;
  }
LABEL_10:

  return v7;
}

- (id)_statementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(NSMapTable *)self->_preparedStatements objectForKey:v6];
  if (v7)
  {
    unsigned __int8 v8 = (void *)v7;
    id v9 = 0;
  }
  else
  {
    char v10 = [v6 SQL];
    id v12 = 0;
    unsigned __int8 v8 = [(SQLiteConnection *)self _prepareStatement:v10 error:&v12];
    id v9 = v12;

    if (v8)
    {
      [(NSMapTable *)self->_preparedStatements setObject:v8 forKey:v6];
    }
    else if (a4)
    {
      id v9 = v9;
      unsigned __int8 v8 = 0;
      *a4 = v9;
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }

  return v8;
}

- (id)_verifiedStatementForPreparedStatement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 connectionPointer] == self)
  {
    if ([(SQLiteConnection *)self _open])
    {
      id v12 = 0;
      id v9 = [(SQLiteConnection *)self _statementForPreparedStatement:v6 error:&v12];
      id v8 = v12;
      if (v9)
      {
        if ([(SQLiteConnectionOptions *)self->_options isReadOnly]
          && ([v9 isReadOnly] & 1) == 0)
        {
          uint64_t v10 = +[NSError errorWithDomain:@"SQLiteErrorDomain" code:-7701 userInfo:0];

          id v7 = 0;
          id v8 = (id)v10;
        }
        else
        {
          id v7 = v9;
        }
      }
      else
      {
        id v7 = 0;
      }

      if (!a4) {
        goto LABEL_16;
      }
    }
    else
    {
      id v8 = +[NSError errorWithDomain:@"SQLiteErrorDomain" code:-7700 userInfo:0];
      id v7 = 0;
      if (!a4) {
        goto LABEL_16;
      }
    }
  }
  else
  {
    +[NSException raise:NSInvalidArgumentException format:@"Statement from a different connection"];
    id v7 = 0;
    id v8 = 0;
    if (!a4) {
      goto LABEL_16;
    }
  }
  if (!v7) {
    *a4 = v8;
  }
LABEL_16:

  return v7;
}

- (SQLiteConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SQLiteConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SQLiteConnectionOptions)options
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