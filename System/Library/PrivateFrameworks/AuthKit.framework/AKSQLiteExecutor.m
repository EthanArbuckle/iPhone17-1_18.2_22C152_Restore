@interface AKSQLiteExecutor
+ (id)_databaseQueue;
+ (void)performBlock:(id)a3;
+ (void)performBlockAndWait:(id)a3;
- (AKSQLiteExecutor)initWithDatabasePath:(id)a3 migrationController:(id)a4;
- (AKSQLiteMigration)migrator;
- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4;
- (BOOL)_handleDatabaseFailureError:(id *)a3;
- (BOOL)_unsafe_openDatabase:(id *)a3;
- (BOOL)openDatabase:(id *)a3;
- (BOOL)performQuery:(id)a3;
- (BOOL)performQuery:(id)a3 error:(id *)a4;
- (BOOL)performQuery:(id)a3 rowHandler:(id)a4;
- (BOOL)shouldAutomaticallyMigrate;
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
- (void)_unsafe_wipeDatabase:(id *)a3;
- (void)closeDatabase;
- (void)commitTransaction;
- (void)dealloc;
- (void)openTransaction;
- (void)performTransactionBlockAndWait:(id)a3;
- (void)rollbackTransaction;
- (void)setMigrator:(id)a3;
- (void)setShouldAutomaticallyMigrate:(BOOL)a3;
- (void)wipeDatabase:(id *)a3;
@end

@implementation AKSQLiteExecutor

- (AKSQLiteExecutor)initWithDatabasePath:(id)a3 migrationController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(AKSQLiteExecutor *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_databasePath, a3);
    v10->_shouldAutomaticallyMigrate = 1;
    objc_storeStrong((id *)&v10->_migrator, a4);
  }

  return v10;
}

- (void)dealloc
{
  [(AKSQLiteExecutor *)self closeDatabase];
  v3.receiver = self;
  v3.super_class = (Class)AKSQLiteExecutor;
  [(AKSQLiteExecutor *)&v3 dealloc];
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
  +[NSXPCConnection beginTransaction];
  v4 = [(id)objc_opt_class() _databaseQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100095900;
  block[3] = &unk_100228040;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (void)performBlockAndWait:(id)a3
{
  id v3 = a3;
  +[NSXPCConnection beginTransaction];
  v4 = [(id)objc_opt_class() _databaseQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000959FC;
  block[3] = &unk_100228040;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

+ (id)_databaseQueue
{
  if (qword_100272508 != -1) {
    dispatch_once(&qword_100272508, &stru_10022A408);
  }
  v2 = (void *)qword_100272500;

  return v2;
}

- (void)performTransactionBlockAndWait:(id)a3
{
  v4 = (void (**)(void))a3;
  [(AKSQLiteExecutor *)self openTransaction];
  v4[2](v4);

  [(AKSQLiteExecutor *)self commitTransaction];
}

- (void)openTransaction
{
}

- (void)commitTransaction
{
  if ([(AKSQLiteExecutor *)self _executeQuery:@"COMMIT TRANSACTION"])
  {
    [(AKSQLiteExecutor *)self rollbackTransaction];
  }
}

- (void)rollbackTransaction
{
}

- (int)_executeQuery:(id)a3
{
  id v4 = a3;
  id v5 = _AKLogSystemQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018B7A8();
  }

  errmsg = 0;
  database = self->_database;
  id v7 = v4;
  int v8 = sqlite3_exec(database, (const char *)[v7 UTF8String], 0, 0, &errmsg);
  if (errmsg)
  {
    v9 = _AKLogSystemQuery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018B730();
    }

    sqlite3_free(errmsg);
  }

  return v8;
}

- (int64_t)performInsertQuery:(id)a3
{
  id v4 = +[AKSQLiteQuery queryWithString:a3];
  int64_t v5 = [(AKSQLiteExecutor *)self performInsertQuery:v4 error:0];

  return v5;
}

- (BOOL)performQuery:(id)a3
{
  return [(AKSQLiteExecutor *)self performQuery:a3 rowHandler:0];
}

- (BOOL)performQuery:(id)a3 rowHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[AKSQLiteQuery queryWithString:a3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100095DC4;
  v10[3] = &unk_10022A430;
  id v11 = v6;
  id v8 = v6;
  [v7 setRowHandler:v10];
  LOBYTE(self) = [(AKSQLiteExecutor *)self performQuery:v7 error:0];

  return (char)self;
}

- (BOOL)performQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v13 = 0;
  if (![(AKSQLiteExecutor *)self _unsafe_openDatabase:&v13]) {
    goto LABEL_5;
  }
  id v7 = [(AKSQLiteExecutor *)self _prepareStatementForQuery:v6 error:a4];
  if (!v7) {
    goto LABEL_5;
  }
  id v8 = v7;
  v9 = [v6 bindHandler];

  if (!v9
    || ([v6 bindHandler],
        v10 = (void (**)(void, void))objc_claimAutoreleasedReturnValue(),
        ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8),
        v10,
        ([v6 bindingFailure] & 1) == 0))
  {
    [(AKSQLiteExecutor *)self _printStatement:v8];
    [(AKSQLiteExecutor *)self _stepThroughRowsWithQuery:v6 statement:v8];
    BOOL v11 = [(AKSQLiteExecutor *)self _finalizeStatement:v8 error:a4];
  }
  else
  {
LABEL_5:
    BOOL v11 = 0;
  }

  return v11;
}

- (int64_t)performInsertQuery:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(AKSQLiteExecutor *)self _unsafe_openDatabase:a4]) {
    goto LABEL_9;
  }
  id v7 = [(AKSQLiteExecutor *)self _prepareStatementForQuery:v6 error:a4];
  if (!v7) {
    goto LABEL_9;
  }
  id v8 = v7;
  v9 = [v6 bindHandler];

  if (v9)
  {
    v10 = [v6 bindHandler];
    ((void (**)(void, sqlite3_stmt *))v10)[2](v10, v8);

    if ([v6 bindingFailure]) {
      goto LABEL_9;
    }
  }
  [(AKSQLiteExecutor *)self _printStatement:v8];
  int64_t v11 = sqlite3_step(v8) == 101 ? sqlite3_last_insert_rowid(self->_database) : -1;
  if (![(AKSQLiteExecutor *)self _finalizeStatement:v8 error:a4]) {
LABEL_9:
  }
    int64_t v11 = -1;

  return v11;
}

- (void)_printStatement:(sqlite3_stmt *)a3
{
  id v3 = sqlite3_expanded_sql(a3);
  if (v3)
  {
    id v4 = v3;
    int64_t v5 = _AKLogSystemQuery();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10018B810();
    }

    sqlite3_free(v4);
  }
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
      id v7 = [v5 rowHandler];
      ((void (**)(void, sqlite3_stmt *, char *))v7)[2](v7, a4, &v8);

      if (v8) {
        break;
      }
    }
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
  [(AKSQLiteExecutor *)self _handleDatabaseFailureError:a4];
  return 0;
}

- (BOOL)_finalizeStatement:(sqlite3_stmt *)a3 error:(id *)a4
{
  int v6 = sqlite3_finalize(a3);
  if (v6)
  {
    [(AKSQLiteExecutor *)self _handleDatabaseFailureError:a4];
  }
  else
  {
    int v7 = sqlite3_changes(self->_database);
    char v8 = _AKLogSystemQuery();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10018B878(v7, v8);
    }
  }
  return v6 == 0;
}

- (BOOL)_handleDatabaseFailureError:(id *)a3
{
  id v5 = [(AKSQLiteExecutor *)self _currentDataBaseError];
  if (v5)
  {
    int v6 = _AKLogSystemQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10018B958();
    }

    if (a3) {
      *a3 = v5;
    }
  }
  int v7 = [v5 userInfo];
  char v8 = [v7 objectForKeyedSubscript:@"AKSQLErrorCode"];
  unint64_t v9 = (unint64_t)[v8 integerValue];

  if (v9 <= 0x1A)
  {
    if (((1 << v9) & 0x5000800) != 0)
    {
      v10 = _AKLogSystemQuery();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10018B8F0();
      }

      [(AKSQLiteExecutor *)self _unsafe_closeDatabase];
      [(AKSQLiteExecutor *)self _unsafe_wipeDatabase:0];
    }
    else if (((1 << v9) & 0x4400) != 0)
    {
      [(AKSQLiteExecutor *)self _unsafe_closeDatabase];
    }
  }

  return v5 != 0;
}

- (id)_currentDataBaseError
{
  uint64_t v3 = sqlite3_errcode(self->_database);
  if (v3 == 101 || (int)v3 < 1)
  {
    v10 = 0;
  }
  else
  {
    uint64_t v5 = v3;
    int v6 = +[NSString stringWithUTF8String:sqlite3_errmsg(self->_database)];
    uint64_t v7 = AKSQLErrorDomain;
    v12[0] = NSLocalizedFailureErrorKey;
    v12[1] = @"AKSQLErrorCode";
    v13[0] = v6;
    char v8 = +[NSNumber numberWithInt:v5];
    v13[1] = v8;
    unint64_t v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v10 = +[NSError errorWithDomain:v7 code:-6001 userInfo:v9];
  }

  return v10;
}

- (BOOL)openDatabase:(id *)a3
{
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10000F950;
  int64_t v11 = sub_10000F7F8;
  id v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000965B8;
  v6[3] = &unk_10022A458;
  v6[4] = self;
  v6[5] = &v13;
  v6[6] = &v7;
  +[AKSQLiteExecutor performBlockAndWait:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  char v4 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

- (BOOL)_unsafe_openDatabase:(id *)a3
{
  uint64_t v5 = [(id)objc_opt_class() _databaseQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_database) {
    return 1;
  }
  uint64_t v7 = [(AKSQLiteExecutor *)self _unsafe_createDataBase];
  if (!v7)
  {
    [(AKSQLiteExecutor *)self performQuery:@"pragma foreign_keys=on" rowHandler:0];
    if (self->_shouldAutomaticallyMigrate)
    {
      migrator = self->_migrator;
      if (migrator)
      {
        [(AKSQLiteMigration *)migrator setExecutor:self];
        [(AKSQLiteMigration *)self->_migrator migrateSchemaIfNecessary];
      }
      else
      {
        id v12 = _AKLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10018B9C0(v12);
        }
      }
    }
    return 1;
  }
  if (a3)
  {
    uint64_t v8 = AKSQLErrorDomain;
    CFStringRef v13 = @"AKSQLErrorCode";
    uint64_t v9 = +[NSNumber numberWithInt:v7];
    v14 = v9;
    v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    *a3 = +[NSError errorWithDomain:v8 code:-6001 userInfo:v10];
  }
  return 0;
}

- (int)_unsafe_createDataBase
{
  uint64_t v3 = [(id)objc_opt_class() _databaseQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = _AKLogSystemQuery();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10018BBC0();
  }

  uint64_t v5 = [(NSString *)self->_databasePath stringByDeletingLastPathComponent];
  if (v5)
  {
    int v6 = +[NSFileManager defaultManager];
    unsigned __int8 v7 = [v6 fileExistsAtPath:v5];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10018BB7C(v8);
      }

      uint64_t v9 = +[NSFileManager defaultManager];
      id v17 = 0;
      unsigned __int8 v10 = [v9 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v17];
      id v11 = v17;

      if ((v10 & 1) == 0)
      {
        id v12 = _AKLogSystem();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10018BAE8(v11, v12);
        }
      }
    }
  }
  int v13 = sqlite3_open_v2([(NSString *)self->_databasePath UTF8String], &self->_database, 6, 0);
  v14 = _AKLogSystemQuery();
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10018BA70();
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    sub_10018BA04();
  }

  return v13;
}

- (void)wipeDatabase:(id *)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned __int8 v10 = sub_10000F950;
  id v11 = sub_10000F7F8;
  id v12 = 0;
  uint64_t v5 = _AKLogSystemQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10018BC2C();
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100096AB0;
  v6[3] = &unk_10022A480;
  v6[4] = self;
  v6[5] = &v7;
  +[AKSQLiteExecutor performBlockAndWait:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  _Block_object_dispose(&v7, 8);
}

- (void)_unsafe_wipeDatabase:(id *)a3
{
  [(AKSQLiteExecutor *)self _unsafe_closeDatabase];
  uint64_t v5 = +[NSFileManager defaultManager];
  databasePath = self->_databasePath;
  id v10 = 0;
  unsigned __int8 v7 = [v5 removeItemAtPath:databasePath error:&v10];
  id v8 = v10;

  if (v7)
  {
    uint64_t v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_10018BC98();
    }
  }
  else
  {
    if (a3) {
      *a3 = v8;
    }
    uint64_t v9 = _AKLogSystemQuery();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10018BD04();
    }
  }
}

- (void)closeDatabase
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100096C58;
  v2[3] = &unk_100226FB8;
  v2[4] = self;
  +[AKSQLiteExecutor performBlockAndWait:v2];
}

- (void)_unsafe_closeDatabase
{
  uint64_t v3 = [(id)objc_opt_class() _databaseQueue];
  dispatch_assert_queue_V2(v3);

  if (self->_database)
  {
    char v4 = _AKLogSystemQuery();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10018BDE4();
    }

    int v5 = sqlite3_close(self->_database);
    int v6 = _AKLogSystemQuery();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10018BD6C(v5, v6);
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

- (AKSQLiteMigration)migrator
{
  return self->_migrator;
}

- (void)setMigrator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_migrator, 0);

  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end