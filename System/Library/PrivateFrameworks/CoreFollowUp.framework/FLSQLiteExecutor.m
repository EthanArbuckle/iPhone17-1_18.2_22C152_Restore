@interface FLSQLiteExecutor
+ (id)_databaseQueue;
+ (void)performBlock:(id)a3;
+ (void)performBlockAndWait:(id)a3;
- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)_handleDatabaseFailureError:(id *)a3;
- (BOOL)_unsafe_openDatabase:(id *)a3;
- (BOOL)openDatabase:(id *)a3;
- (BOOL)performQuery:(id)a3;
- (BOOL)performQuery:(id)a3 error:(id *)a4;
- (BOOL)performQuery:(id)a3 rowHandler:(id)a4;
- (BOOL)shouldAutomaticallyMigrate;
- (FLSQLiteExecutor)initWithDatabasePath:(id)a3;
- (NSString)databasePath;
- (id)_currentDataBaseError;
- (int)_executeQuery:(id)a3;
- (int)_unsafe_createDataBase;
- (int64_t)performInsertQuery:(id)a3;
- (int64_t)performInsertQuery:(id)a3 error:(id *)a4;
- (sqlite3)database;
- (sqlite3_stmt)_prepareStatementForQuery:(id)a3 error:(id *)a4;
- (void)_printStatement:(sqlite3_stmt *)a3;
- (void)_stepThroughRowsWithQuery:(id)a3 statement:(sqlite3_stmt *)a4;
- (void)_unsafe_closeDatabase;
- (void)_unsafe_wipeDatabase;
- (void)closeDatabase;
- (void)commitTransaction;
- (void)openTransaction;
- (void)performTransactionBlockAndWait:(id)a3;
- (void)rollbackTransaction;
- (void)setShouldAutomaticallyMigrate:(BOOL)a3;
- (void)wipeDatabase;
@end

@implementation FLSQLiteExecutor

- (BOOL)performQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  if ([(FLSQLiteExecutor *)self _unsafe_openDatabase:&v13]
    && (v7 = [(FLSQLiteExecutor *)self _prepareStatementForQuery:v6 error:a4]) != 0)
  {
    v8 = v7;
    v9 = [v6 bindHandler];

    if (v9)
    {
      v10 = [v6 bindHandler];
      ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8);
    }
    [(FLSQLiteExecutor *)self _printStatement:v8];
    [(FLSQLiteExecutor *)self _stepThroughRowsWithQuery:v6 statement:v8];
    BOOL v11 = [(FLSQLiteExecutor *)self _finalizeStatement:v8 error:a4];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_stepThroughRowsWithQuery:(id)a3 statement:(sqlite3_stmt *)a4
{
  id v5 = a3;
  while (sqlite3_step(a4) == 100)
  {
    id v6 = [v5 rowHandler];

    if (v6)
    {
      char v8 = 0;
      v7 = [v5 rowHandler];
      ((void (**)(void, sqlite3_stmt *, char *))v7)[2](v7, a4, &v8);

      if (v8) {
        break;
      }
    }
  }
}

- (void)_printStatement:(sqlite3_stmt *)a3
{
  v3 = sqlite3_expanded_sql(a3);
  if (v3)
  {
    v4 = v3;
    id v5 = _FLLogSystemQuery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing query: %s", (uint8_t *)&v6, 0xCu);
    }

    sqlite3_free(v4);
  }
}

- (sqlite3_stmt)_prepareStatementForQuery:(id)a3 error:(id *)a4
{
  ppStmt = 0;
  database = self->_database;
  id v7 = [a3 queryString];
  LODWORD(database) = sqlite3_prepare_v2(database, (const char *)[v7 UTF8String], -1, &ppStmt, 0);

  if (!database) {
    return ppStmt;
  }
  [(FLSQLiteExecutor *)self _handleDatabaseFailureError:a4];
  return 0;
}

- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v6 = sqlite3_finalize(a3);
  if (v6)
  {
    [(FLSQLiteExecutor *)self _handleDatabaseFailureError:a4];
  }
  else
  {
    int v7 = sqlite3_changes(self->_database);
    char v8 = _FLLogSystemQuery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Rows changed: %d", (uint8_t *)v10, 8u);
    }
  }
  return v6 == 0;
}

+ (void)performBlockAndWait:(id)a3
{
  id v3 = a3;
  v4 = (void *)os_transaction_create();
  id v5 = [(id)objc_opt_class() _databaseQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003800;
  v8[3] = &unk_10001C6E8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, v8);
}

- (BOOL)_unsafe_openDatabase:(id *)a3
{
  id v5 = [(id)objc_opt_class() _databaseQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_database) {
    return 1;
  }
  uint64_t v7 = [(FLSQLiteExecutor *)self _unsafe_createDataBase];
  if (!v7)
  {
    [(FLSQLiteExecutor *)self performQuery:@"pragma foreign_keys=on" rowHandler:0];
    if ([(FLSQLiteExecutor *)self shouldAutomaticallyMigrate])
    {
      BOOL v11 = [[FLStoreMigrator alloc] initWithExecutor:self];
      [(FLStoreMigrator *)v11 migrateSchemeIfNecessary];
    }
    else
    {
      _FLLogSystemQuery();
      BOOL v11 = (FLStoreMigrator *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, &v11->super, OS_LOG_TYPE_DEFAULT, "Migration was suppressed...", v12, 2u);
      }
    }

    return 1;
  }
  if (a3)
  {
    uint64_t v8 = FLErrorDomain;
    CFStringRef v13 = @"FLSQLErrorCode";
    id v9 = +[NSNumber numberWithInt:v7];
    v14 = v9;
    id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    *a3 = +[NSError errorWithDomain:v8 code:1664 userInfo:v10];
  }
  return 0;
}

+ (id)_databaseQueue
{
  if (qword_100022E60 != -1) {
    dispatch_once(&qword_100022E60, &stru_10001C728);
  }
  v2 = (void *)qword_100022E58;

  return v2;
}

- (FLSQLiteExecutor)initWithDatabasePath:(id)a3
{
  id v5 = a3;
  id v6 = [(FLSQLiteExecutor *)self init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databasePath, a3);
    v7->_shouldAutomaticallyMigrate = 1;
  }

  return v7;
}

- (sqlite3)database
{
  return self->_database;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

+ (void)performBlock:(id)a3
{
  id v3 = a3;
  v4 = (void *)os_transaction_create();
  id v5 = [(id)objc_opt_class() _databaseQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003970;
  v8[3] = &unk_10001C6E8;
  id v9 = v4;
  id v10 = v3;
  id v6 = v4;
  id v7 = v3;
  dispatch_async(v5, v8);
}

- (void)performTransactionBlockAndWait:(id)a3
{
  v4 = (void (**)(void))a3;
  [(FLSQLiteExecutor *)self openTransaction];
  v4[2](v4);

  [(FLSQLiteExecutor *)self commitTransaction];
}

- (void)openTransaction
{
}

- (void)commitTransaction
{
  if ([(FLSQLiteExecutor *)self _executeQuery:@"COMMIT TRANSACTION"])
  {
    [(FLSQLiteExecutor *)self rollbackTransaction];
  }
}

- (void)rollbackTransaction
{
}

- (int)_executeQuery:(id)a3
{
  id v4 = a3;
  id v5 = _FLLogSystemQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Executing query: %@", buf, 0xCu);
  }

  errmsg = 0;
  database = self->_database;
  id v7 = v4;
  int v8 = sqlite3_exec(database, (const char *)[v7 UTF8String], 0, 0, &errmsg);
  if (errmsg)
  {
    id v9 = _FLLogSystemQuery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v13 = v7;
      __int16 v14 = 2080;
      v15 = errmsg;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "SQL Exec %@ failed with error %s.", buf, 0x16u);
    }

    sqlite3_free(errmsg);
  }

  return v8;
}

- (int64_t)performInsertQuery:(id)a3
{
  id v4 = +[FLSQLiteQuery queryWithString:a3];
  int64_t v5 = [(FLSQLiteExecutor *)self performInsertQuery:v4 error:0];

  return v5;
}

- (BOOL)performQuery:(id)a3
{
  return [(FLSQLiteExecutor *)self performQuery:a3 rowHandler:0];
}

- (BOOL)performQuery:(id)a3 rowHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[FLSQLiteQuery queryWithString:a3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_100003D3C;
  v10[3] = &unk_10001C750;
  id v11 = v6;
  id v8 = v6;
  [v7 setRowHandler:v10];
  LOBYTE(self) = [(FLSQLiteExecutor *)self performQuery:v7 error:0];

  return (char)self;
}

- (int64_t)performInsertQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(FLSQLiteExecutor *)self _unsafe_openDatabase:a4]) {
    goto LABEL_9;
  }
  id v7 = [(FLSQLiteExecutor *)self _prepareStatementForQuery:v6 error:a4];
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = v7;
  id v9 = [v6 bindHandler];

  if (v9)
  {
    id v10 = [v6 bindHandler];
    ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8);
  }
  [(FLSQLiteExecutor *)self _printStatement:v8];
  int64_t v11 = sqlite3_step(v8) == 101 ? sqlite3_last_insert_rowid(self->_database) : -1;
  if (![(FLSQLiteExecutor *)self _finalizeStatement:v8 error:a4]) {
LABEL_9:
  }
    int64_t v11 = -1;

  return v11;
}

- (BOOL)_handleDatabaseFailureError:(id *)a3
{
  int64_t v5 = [(FLSQLiteExecutor *)self _currentDataBaseError];
  if (v5)
  {
    id v6 = _FLLogSystemQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Database error detected: %@", (uint8_t *)&v12, 0xCu);
    }

    if (a3) {
      *a3 = v5;
    }
  }
  id v7 = [v5 userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"FLSQLErrorCode"];
  unint64_t v9 = (unint64_t)[v8 integerValue];

  if (v9 <= 0x1A)
  {
    if (((1 << v9) & 0x5000800) != 0)
    {
      id v10 = _FLLogSystemQuery();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Database corruption detected: %@", (uint8_t *)&v12, 0xCu);
      }

      [(FLSQLiteExecutor *)self _unsafe_closeDatabase];
      [(FLSQLiteExecutor *)self _unsafe_wipeDatabase];
    }
    else if (((1 << v9) & 0x4400) != 0)
    {
      [(FLSQLiteExecutor *)self _unsafe_closeDatabase];
    }
  }

  return v5 != 0;
}

- (id)_currentDataBaseError
{
  uint64_t v3 = sqlite3_errcode(self->_database);
  if (v3 == 101 || (int)v3 < 1)
  {
    id v10 = 0;
  }
  else
  {
    uint64_t v5 = v3;
    id v6 = +[NSString stringWithUTF8String:sqlite3_errmsg(self->_database)];
    uint64_t v7 = FLErrorDomain;
    v12[0] = NSLocalizedFailureErrorKey;
    v12[1] = @"FLSQLErrorCode";
    v13[0] = v6;
    id v8 = +[NSNumber numberWithInt:v5];
    v13[1] = v8;
    unint64_t v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    id v10 = +[NSError errorWithDomain:v7 code:1664 userInfo:v9];
  }

  return v10;
}

- (BOOL)openDatabase:(id *)a3
{
  uint64_t v13 = 0;
  __int16 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_1000037D0;
  int64_t v11 = sub_1000037B8;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004290;
  v6[3] = &unk_10001C778;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  +[FLSQLiteExecutor performBlockAndWait:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  char v4 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (int)_unsafe_createDataBase
{
  uint64_t v3 = [(id)objc_opt_class() _databaseQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = _FLLogSystemQuery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    databasePath = self->_databasePath;
    int v20 = 138412290;
    v21 = (FLSQLiteExecutor *)databasePath;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Attempting to open database at path: %@", (uint8_t *)&v20, 0xCu);
  }

  id v6 = [(NSString *)self->_databasePath stringByDeletingLastPathComponent];
  if (v6)
  {
    uint64_t v7 = +[NSFileManager defaultManager];
    unsigned __int8 v8 = [v7 fileExistsAtPath:v6];

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = _FLLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100010574(v9);
      }

      id v10 = +[NSFileManager defaultManager];
      [v10 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
    }
  }
  int v11 = sqlite3_open_v2([(NSString *)self->_databasePath UTF8String], &self->_database, 4194310, 0);
  id v12 = _FLLogSystemQuery();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      __int16 v14 = self->_databasePath;
      int v20 = 138412546;
      v21 = self;
      __int16 v22 = 2112;
      v23 = v14;
      uint64_t v15 = "%@: Failed to open file at path %@";
      char v16 = v12;
      uint32_t v17 = 22;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v20, v17);
    }
  }
  else if (v13)
  {
    v18 = self->_databasePath;
    int v20 = 138412290;
    v21 = (FLSQLiteExecutor *)v18;
    uint64_t v15 = "Database opened at path: %@";
    char v16 = v12;
    uint32_t v17 = 12;
    goto LABEL_13;
  }

  return v11;
}

- (void)wipeDatabase
{
  uint64_t v3 = _FLLogSystemQuery();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    databasePath = self->_databasePath;
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = databasePath;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to wipe database at path: %@", buf, 0xCu);
  }

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000461C;
  v5[3] = &unk_10001C7A0;
  v5[4] = self;
  +[FLSQLiteExecutor performBlockAndWait:v5];
}

- (void)_unsafe_wipeDatabase
{
  [(FLSQLiteExecutor *)self _unsafe_closeDatabase];
  uint64_t v3 = +[NSFileManager defaultManager];
  databasePath = self->_databasePath;
  p_databasePath = (uint64_t *)&self->_databasePath;
  id v9 = 0;
  unsigned __int8 v6 = [v3 removeItemAtPath:databasePath error:&v9];
  id v7 = v9;

  if (v6)
  {
    unsigned __int8 v8 = _FLLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000105B8(p_databasePath, v8);
    }
  }
  else
  {
    unsigned __int8 v8 = _FLLogSystemQuery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to wipe database with error: %@", buf, 0xCu);
    }
  }
}

- (void)closeDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000047B4;
  v2[3] = &unk_10001C7A0;
  v2[4] = self;
  +[FLSQLiteExecutor performBlockAndWait:v2];
}

- (void)_unsafe_closeDatabase
{
  uint64_t v3 = [(id)objc_opt_class() _databaseQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_database)
  {
    char v4 = _FLLogSystemQuery();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      databasePath = self->_databasePath;
      int v8 = 138412290;
      id v9 = databasePath;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Closing database at path: %@", (uint8_t *)&v8, 0xCu);
    }

    int v6 = sqlite3_close(self->_database);
    id v7 = _FLLogSystemQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 67109120;
      LODWORD(v9) = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Closed database with result: %d", (uint8_t *)&v8, 8u);
    }

    self->_database = 0;
  }
}

- (BOOL)shouldAutomaticallyMigrate
{
  return self->_shouldAutomaticallyMigrate;
}

- (void)setShouldAutomaticallyMigrate:(BOOL)a3
{
  self->_shouldAutomaticallyMigrate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end