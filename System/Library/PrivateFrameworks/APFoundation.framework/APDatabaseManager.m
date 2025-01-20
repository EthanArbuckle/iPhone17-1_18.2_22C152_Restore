@interface APDatabaseManager
+ (id)mainDatabase;
- (APDatabaseManager)init;
- (APDeviceLockedTask)deviceLockedTask;
- (APInMemoryTTLCache)tableCache;
- (APUnfairLock)lock;
- (BOOL)_bindParameters:(id)a3 toStatement:(sqlite3_stmt *)a4;
- (BOOL)_executeQueryFromString:(id)a3;
- (BOOL)_isConnectionOpen;
- (BOOL)_isConnectionValidWithErrorDescription:(id)a3;
- (BOOL)_setUserVersion:(int64_t)a3;
- (BOOL)_updateVersionForPath:(id)a3;
- (BOOL)classCDataAvaliable;
- (BOOL)executeQuery:(id)a3 withParameters:(id)a4;
- (BOOL)executeQueryFromString:(id)a3;
- (BOOL)openConnectionIfFileExistsToDatabaseWithName:(id)a3;
- (BOOL)openDatabaseConnectionWithName:(id)a3;
- (BOOL)setUpDatabaseWithPath:(id)a3;
- (BOOL)setUpMainDatabase;
- (NSString)dbName;
- (id)_executePragmaSelectQuery:(id)a3;
- (id)_userVersion;
- (id)executeSelectNumberQuery:(id)a3 withParameters:(id)a4;
- (id)executeSelectQuery:(id)a3 forTable:(id)a4 withParameters:(id)a5;
- (id)executeSelectQuery:(id)a3 forTable:(id)a4 withParameters:(id)a5 groupedByColumn:(id)a6;
- (id)executeSelectStringsQuery:(id)a3 withParameters:(id)a4;
- (id)getCursorForQuery:(id)a3 parameters:(id)a4;
- (id)getTableForClass:(Class)a3;
- (int)openConnectionResult;
- (int64_t)currentVersion;
- (int64_t)executeInsertQuery:(id)a3 withParameters:(id)a4;
- (sqlite3)database;
- (sqlite3_stmt)_prepareStatementForQuery:(id)a3;
- (void)_openDBConnectionCanRepeat:(BOOL)a3 databasePath:(id)a4;
- (void)beginTransaction;
- (void)closeDatabaseConnection;
- (void)commitTransaction;
- (void)incrementalVacuumIfNeeded;
- (void)setClassCDataAvaliable:(BOOL)a3;
- (void)setCurrentVersion:(int64_t)a3;
- (void)setDatabase:(sqlite3 *)a3;
- (void)setDbName:(id)a3;
- (void)setDeviceLockedTask:(id)a3;
- (void)setLock:(id)a3;
- (void)setOpenConnectionResult:(int)a3;
- (void)setTableCache:(id)a3;
@end

@implementation APDatabaseManager

+ (id)mainDatabase
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F28B50] isPromotedContentDaemon])
  {
    v3 = +[APUniversalSingleton sharedInstance];
    v4 = [v3 mainDatabase];
    if (!v4)
    {
      id v5 = a1;
      objc_sync_enter(v5);
      v4 = [v3 mainDatabase];
      if (!v4)
      {
        v4 = objc_alloc_init(APDatabaseManager);
        v6 = +[APDatabasePath pathForName:@"APDatabase"];
        if (+[APDeviceLockedTask deviceUnlockedSinceBoot])
        {
          [(APDatabaseManager *)v4 setClassCDataAvaliable:1];
          [(APDatabaseManager *)v4 _openDBConnectionCanRepeat:1 databasePath:v6];
        }
        else
        {
          v7 = APLogForCategory(0xBuLL);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            id v20 = (id)objc_opt_class();
            id v8 = v20;
            _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@]: APDatabase connection delayed until first unlock.", buf, 0xCu);
          }
          v9 = [APDeviceLockedTask alloc];
          uint64_t v13 = MEMORY[0x1E4F143A8];
          uint64_t v14 = 3221225472;
          v15 = sub_1D70DD6AC;
          v16 = &unk_1E6A6B8A0;
          v10 = v4;
          v17 = v10;
          id v18 = v6;
          v11 = [(APDeviceLockedTask *)v9 initWithHandler:&v13];
          -[APDatabaseManager setDeviceLockedTask:](v10, "setDeviceLockedTask:", v11, v13, v14, v15, v16);
        }
        [v3 setMainDatabase:v4];
      }
      objc_sync_exit(v5);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (APDatabaseManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)APDatabaseManager;
  v2 = [(APDatabaseManager *)&v7 init];
  if (v2)
  {
    v3 = [[APUnfairLock alloc] initWithOptions:1];
    lock = v2->_lock;
    v2->_lock = v3;

    dbName = v2->_dbName;
    v2->_dbName = (NSString *)@"N/A";

    v2->_currentVersion = -1;
    v2->_openConnectionResult = -1;
    v2->_classCDataAvaliable = 0;
  }
  return v2;
}

- (BOOL)openDatabaseConnectionWithName:(id)a3
{
  id v4 = a3;
  id v5 = +[APDatabasePath pathForName:v4];
  [(APDatabaseManager *)self _openDBConnectionCanRepeat:1 databasePath:v5];
  if ([(APDatabaseManager *)self setUpDatabaseWithPath:v5])
  {
    BOOL v6 = [(APDatabaseManager *)self _isConnectionOpen];
  }
  else
  {
    APDatabaseError(430, 0xFFFFFFFFLL, [(APDatabaseManager *)self currentVersion], v4, @"SetUp failed after opening connection with name.", 0);
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)openConnectionIfFileExistsToDatabaseWithName:(id)a3
{
  id v4 = +[APDatabasePath pathForName:a3];
  id v5 = [v4 databaseFilePath];
  BOOL v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v6 fileExistsAtPath:v5])
  {
    [(APDatabaseManager *)self _openDBConnectionCanRepeat:1 databasePath:v4];
    BOOL v7 = [(APDatabaseManager *)self _isConnectionOpen];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)closeDatabaseConnection
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(APDatabaseManager *)self lock];
  [v3 lock];
  database = self->_database;
  if (database)
  {
    sqlite3_close(database);
    self->_database = 0;
  }
  [(APDatabaseManager *)self setDbName:@"N/A"];
  [(APDatabaseManager *)self setCurrentVersion:-1];
  [(APDatabaseManager *)self setOpenConnectionResult:0xFFFFFFFFLL];
  [v3 unlock];
  [(APDatabaseManager *)self setTableCache:0];
  id v5 = APLogForCategory(0xBuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138477827;
    id v8 = (id)objc_opt_class();
    id v6 = v8;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database connection closed sucessfully.", (uint8_t *)&v7, 0xCu);
  }
}

- (id)executeSelectQuery:(id)a3 forTable:(id)a4 withParameters:(id)a5
{
  id v8 = a3;
  id v27 = a4;
  id v9 = a5;
  v10 = [(APDatabaseManager *)self lock];
  [v10 lock];
  v11 = [(APDatabaseManager *)self _prepareStatementForQuery:v8];
  if (v11)
  {
    v12 = v11;
    if ([(APDatabaseManager *)self _bindParameters:v9 toStatement:v11])
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if (sqlite3_step(v12) == 100)
      {
        v24 = v10;
        id v25 = v9;
        id v26 = v8;
        do
        {
          uint64_t v14 = objc_msgSend(objc_alloc((Class)objc_msgSend(v27, "rowClass", v24, v25, v26)), "initWithTable:", v27);
          int v15 = sqlite3_column_count(v12);
          if (v15 >= 1)
          {
            int v16 = v15;
            for (int i = 0; i != v16; ++i)
            {
              if (sqlite3_column_type(v12, i) != 5)
              {
                id v18 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(v12, i));
                switch([v14 typeForColumnName:v18])
                {
                  case 0:
                    uint64_t v19 = objc_msgSend(objc_alloc(NSNumber), "initWithInteger:", sqlite3_column_int(v12, i));
                    goto LABEL_16;
                  case 1:
                    uint64_t v19 = objc_msgSend(objc_alloc(NSNumber), "initWithLong:", sqlite3_column_int64(v12, i));
                    goto LABEL_16;
                  case 2:
                    uint64_t v19 = objc_msgSend(objc_alloc(NSNumber), "initWithDouble:", sqlite3_column_double(v12, i));
                    goto LABEL_16;
                  case 3:
                    uint64_t v19 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v12, i));
                    goto LABEL_16;
                  case 4:
                    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(v12, i));
                    goto LABEL_16;
                  case 5:
                    uint64_t v19 = objc_msgSend(objc_alloc(NSNumber), "initWithBool:", sqlite3_column_int(v12, i) != 0);
                    goto LABEL_16;
                  case 6:
                    id v20 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                    uint64_t v21 = sqlite3_column_blob(v12, i);
                    uint64_t v19 = objc_msgSend(v20, "initWithBytes:length:", v21, sqlite3_column_bytes(v12, i));
LABEL_16:
                    v22 = (void *)v19;
                    [v14 setValue:v19 forColumnName:v18];

                    break;
                  default:
                    break;
                }
              }
            }
          }
          [v13 addObject:v14];
        }
        while (sqlite3_step(v12) == 100);
        id v9 = v25;
        id v8 = v26;
        v10 = v24;
      }
    }
    else
    {
      id v13 = 0;
    }
    sqlite3_finalize(v12);
  }
  else
  {
    id v13 = 0;
  }
  [v10 unlock];

  return v13;
}

- (id)getCursorForQuery:(id)a3 parameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  id v9 = [(APDatabaseManager *)self _prepareStatementForQuery:v7];

  if (v9)
  {
    if ([(APDatabaseManager *)self _bindParameters:v6 toStatement:v9])
    {
      [v8 unlock];
      v10 = [[APDatabaseCursor alloc] initWithStatement:v9 lock:v8];
      goto LABEL_6;
    }
    sqlite3_finalize(v9);
  }
  [v8 unlock];
  v10 = 0;
LABEL_6:

  return v10;
}

- (id)getTableForClass:(Class)a3
{
  id v5 = [(APDatabaseManager *)self tableCache];
  id v6 = NSStringFromClass(a3);
  uint64_t v7 = [v5 getObjectForIdentifier:v6];
  if (v7)
  {
    id v8 = (void *)v7;
    [v5 recentlyAccessedObject:v7];
  }
  else
  {
    id v9 = objc_alloc_init(a3);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = (void *)[[a3 alloc] initWithDatabaseManager:self];
      if (v8)
      {
        [v5 setObject:v8];
      }
      else
      {
        uint64_t v13 = [(APDatabaseManager *)self currentVersion];
        uint64_t v14 = [(APDatabaseManager *)self dbName];
        APDatabaseError(432, 0xFFFFFFFFLL, v13, v14, &stru_1F2EA2540, 0);
      }
    }
    else
    {
      uint64_t v11 = [(APDatabaseManager *)self currentVersion];
      v12 = [(APDatabaseManager *)self dbName];
      APDatabaseError(431, 0xFFFFFFFFLL, v11, v12, &stru_1F2EA2540, 0);

      id v8 = 0;
    }
  }

  return v8;
}

- (id)executeSelectQuery:(id)a3 forTable:(id)a4 withParameters:(id)a5 groupedByColumn:(id)a6
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v36 = a4;
  id v11 = a5;
  id v37 = a6;
  v12 = [(APDatabaseManager *)self lock];
  [v12 lock];
  uint64_t v13 = [(APDatabaseManager *)self _prepareStatementForQuery:v10];
  if (v13)
  {
    uint64_t v14 = v13;
    if ([(APDatabaseManager *)self _bindParameters:v11 toStatement:v13])
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (sqlite3_step(v14) == 100)
      {
        v34 = v12;
        id v35 = v10;
        unint64_t v16 = 0x1E4F28000uLL;
        do
        {
          v17 = objc_msgSend(objc_alloc((Class)objc_msgSend(v36, "rowClass")), "initWithTable:", v36);
          int v18 = sqlite3_column_count(v14);
          if (v18 < 1)
          {
            uint64_t v21 = @"N/A";
          }
          else
          {
            int v19 = v18;
            int v20 = 0;
            uint64_t v21 = @"N/A";
            do
            {
              if (sqlite3_column_type(v14, v20) != 5)
              {
                v22 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_name(v14, v20));
                switch([v17 typeForColumnName:v22])
                {
                  case 0:
                    uint64_t v23 = objc_msgSend(objc_alloc(*(Class *)(v16 + 3792)), "initWithInteger:", sqlite3_column_int(v14, v20));
                    goto LABEL_17;
                  case 1:
                    uint64_t v23 = objc_msgSend(objc_alloc(*(Class *)(v16 + 3792)), "initWithLong:", sqlite3_column_int64(v14, v20));
                    goto LABEL_17;
                  case 2:
                    uint64_t v23 = objc_msgSend(objc_alloc(*(Class *)(v16 + 3792)), "initWithDouble:", sqlite3_column_double(v14, v20));
                    goto LABEL_17;
                  case 3:
                    objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v14, v20));
                    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    [v17 setValue:v24 forColumnName:v22];
                    if ([v22 isEqualToString:v37])
                    {
                      v24 = v24;

                      uint64_t v21 = v24;
                    }
                    goto LABEL_18;
                  case 4:
                    uint64_t v23 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", sqlite3_column_double(v14, v20));
                    goto LABEL_17;
                  case 5:
                    uint64_t v23 = objc_msgSend(objc_alloc(*(Class *)(v16 + 3792)), "initWithBool:", sqlite3_column_int(v14, v20) != 0);
                    goto LABEL_17;
                  case 6:
                    id v25 = objc_alloc(MEMORY[0x1E4F1C9B8]);
                    id v26 = sqlite3_column_blob(v14, v20);
                    int v27 = sqlite3_column_bytes(v14, v20);
                    v28 = v26;
                    unint64_t v16 = 0x1E4F28000;
                    uint64_t v23 = [v25 initWithBytes:v28 length:v27];
LABEL_17:
                    v24 = (__CFString *)v23;
                    [v17 setValue:v23 forColumnName:v22];
LABEL_18:

                    break;
                  default:
                    break;
                }
              }
              ++v20;
            }
            while (v19 != v20);
          }
          v29 = [v15 objectForKey:v21];
          if (v29)
          {
            v30 = v29;
            v31 = (void *)[v29 mutableCopy];
            [v31 addObject:v17];
            v32 = [MEMORY[0x1E4F1C978] arrayWithArray:v31];

            [v15 setObject:v32 forKey:v21];
            unint64_t v16 = 0x1E4F28000;
          }
          else
          {
            v38[0] = v17;
            v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
            [v15 setObject:v32 forKey:v21];
          }
        }
        while (sqlite3_step(v14) == 100);
        id v10 = v35;
        v12 = v34;
      }
    }
    else
    {
      id v15 = 0;
    }
    sqlite3_finalize(v14);
    [v12 unlock];
  }
  else
  {
    [v12 unlock];
    id v15 = 0;
  }

  return v15;
}

- (id)executeSelectStringsQuery:(id)a3 withParameters:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  id v9 = [(APDatabaseManager *)self _prepareStatementForQuery:v6];
  if (v9)
  {
    id v10 = v9;
    if ([(APDatabaseManager *)self _bindParameters:v7 toStatement:v9])
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      while (sqlite3_step(v10) == 100)
      {
        v12 = objc_msgSend(NSString, "stringWithUTF8String:", sqlite3_column_text(v10, 0));
        [v11 addObject:v12];
      }
    }
    else
    {
      id v11 = 0;
    }
    sqlite3_finalize(v10);
  }
  else
  {
    id v11 = 0;
  }
  [v8 unlock];

  return v11;
}

- (BOOL)executeQuery:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  id v9 = [(APDatabaseManager *)self _prepareStatementForQuery:v7];

  if (v9)
  {
    if ([(APDatabaseManager *)self _bindParameters:v6 toStatement:v9])
    {
      uint64_t v10 = sqlite3_step(v9);
      BOOL v12 = v10 == 9 || (v10 & 0xFFFFFFFE) == 100;
      if ((v10 - 100) >= 2)
      {
        uint64_t v13 = v10;
        if (v10 != 9)
        {
          uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"Execute query error: %s", sqlite3_errstr(v10));
          uint64_t v15 = [(APDatabaseManager *)self currentVersion];
          unint64_t v16 = [(APDatabaseManager *)self dbName];
          APDatabaseError(433, v13, v15, v16, v14, 0);
        }
      }
    }
    else
    {
      BOOL v12 = 0;
    }
    sqlite3_finalize(v9);
  }
  else
  {
    BOOL v12 = 0;
  }
  [v8 unlock];

  return v12;
}

- (int64_t)executeInsertQuery:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  id v9 = [(APDatabaseManager *)self _prepareStatementForQuery:v7];

  if (v9)
  {
    if ([(APDatabaseManager *)self _bindParameters:v6 toStatement:v9])
    {
      uint64_t v10 = sqlite3_step(v9);
      if ((v10 - 100) < 2 || (uint64_t v11 = v10, v10 == 9))
      {
        sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_database);
LABEL_9:
        sqlite3_finalize(v9);
        goto LABEL_10;
      }
      uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"Execute insert query error: %s", sqlite3_errstr(v10));
      uint64_t v14 = [(APDatabaseManager *)self currentVersion];
      uint64_t v15 = [(APDatabaseManager *)self dbName];
      APDatabaseError(434, v11, v14, v15, v13, 0);
    }
    sqlite3_int64 insert_rowid = -1;
    goto LABEL_9;
  }
  sqlite3_int64 insert_rowid = -1;
LABEL_10:
  [v8 unlock];

  return insert_rowid;
}

- (BOOL)setUpMainDatabase
{
  v3 = +[APDatabasePath pathForName:@"APDatabase"];
  LOBYTE(self) = [(APDatabaseManager *)self setUpDatabaseWithPath:v3];

  return (char)self;
}

- (BOOL)setUpDatabaseWithPath:(id)a3
{
  id v4 = a3;
  id v5 = [(APDatabaseManager *)self lock];
  [v5 lock];
  BOOL v6 = [(APDatabaseManager *)self _isConnectionValidWithErrorDescription:@"No connection on Set Up DB with path."];
  [v5 unlock];
  if (v6)
  {
    int v7 = 3;
    while (1)
    {
      if (v7 == 1)
      {
        uint64_t v8 = [(APDatabaseManager *)self currentVersion];
        id v9 = [(APDatabaseManager *)self dbName];
        APDatabaseError(443, 0xFFFFFFFFLL, v8, v9, @"Reacreating Database File.", 0);

        [(APDatabaseManager *)self closeDatabaseConnection];
        +[APDatabaseFileUtilities removeDatabaseAtPath:v4];
        [(APDatabaseManager *)self _openDBConnectionCanRepeat:1 databasePath:v4];
      }
      if ([(APDatabaseManager *)self _updateVersionForPath:v4]) {
        break;
      }
      if (!--v7)
      {
        [(APDatabaseManager *)self closeDatabaseConnection];
        BOOL v10 = 0;
        goto LABEL_9;
      }
    }
  }
  BOOL v10 = 1;
LABEL_9:

  return v10;
}

- (void)beginTransaction
{
  id v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  if ([(APDatabaseManager *)self _isConnectionValidWithErrorDescription:@"No connection on begin transaction."])
  {
    uint64_t v3 = sqlite3_exec(self->_database, "BEGIN EXCLUSIVE TRANSACTION", 0, 0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Execute begin transaction error: %s", sqlite3_errstr(v3));
      uint64_t v6 = [(APDatabaseManager *)self currentVersion];
      int v7 = [(APDatabaseManager *)self dbName];
      APDatabaseError(436, v4, v6, v7, v5, 0);
    }
  }
  [v8 unlock];
}

- (void)commitTransaction
{
  id v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  if ([(APDatabaseManager *)self _isConnectionValidWithErrorDescription:@"No connection on commit transaction."])
  {
    uint64_t v3 = sqlite3_exec(self->_database, "COMMIT TRANSACTION", 0, 0, 0);
    if (v3)
    {
      uint64_t v4 = v3;
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"Execute commit transaction error: %s", sqlite3_errstr(v3));
      uint64_t v6 = [(APDatabaseManager *)self currentVersion];
      int v7 = [(APDatabaseManager *)self dbName];
      APDatabaseError(437, v4, v6, v7, v5, 0);
    }
  }
  [v8 unlock];
}

- (void)incrementalVacuumIfNeeded
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(APDatabaseManager *)self lock];
  [v3 lock];
  if ([(APDatabaseManager *)self _isConnectionValidWithErrorDescription:@"No connection on incremental vacuum."])
  {
    uint64_t v4 = [(APDatabaseManager *)self _executePragmaSelectQuery:@"PRAGMA freelist_count"];
    id v5 = [(APDatabaseManager *)self _executePragmaSelectQuery:@"PRAGMA page_count"];
    uint64_t v6 = v5;
    if (v4 && v5)
    {
      [v5 doubleValue];
      double v8 = v7 * 0.05;
      [v4 doubleValue];
      double v10 = v9;
      double v11 = fmax(v8, 256.0);
      BOOL v12 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = objc_opt_class();
        id v14 = v13;
        [v4 doubleValue];
        double v16 = v15;
        [v6 doubleValue];
        double v18 = v16 / v17;
        int v19 = @"WILL NOT";
        *(_DWORD *)id v26 = 138478339;
        *(void *)&v26[4] = v13;
        if (v10 >= v11) {
          int v19 = @"WILL";
        }
        *(_WORD *)&v26[12] = 2048;
        *(double *)&v26[14] = v18;
        __int16 v27 = 2112;
        v28 = v19;
        _os_log_impl(&dword_1D70B2000, v12, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database has %f free pages, %@. vacuum.", v26, 0x20u);
      }
      if (v10 >= v11)
      {
        int v20 = APLogForCategory(0xBuLL);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v21 = objc_opt_class();
          *(_DWORD *)id v26 = 138477827;
          *(void *)&v26[4] = v21;
          id v22 = v21;
          _os_log_impl(&dword_1D70B2000, v20, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database vacuuming started.", v26, 0xCu);
        }
        [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA incremental_vacuum"];
        uint64_t v23 = APLogForCategory(0xBuLL);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = objc_opt_class();
          *(_DWORD *)id v26 = 138477827;
          *(void *)&v26[4] = v24;
          id v25 = v24;
          _os_log_impl(&dword_1D70B2000, v23, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database vacuuming complete.", v26, 0xCu);
        }
      }
    }
    objc_msgSend(v3, "unlock", *(_OWORD *)v26);
  }
  else
  {
    [v3 unlock];
  }
}

- (BOOL)executeQueryFromString:(id)a3
{
  id v4 = a3;
  id v5 = [(APDatabaseManager *)self lock];
  [v5 lock];
  if ([(APDatabaseManager *)self _isConnectionValidWithErrorDescription:@"No connection on execute query from string."])
  {
    BOOL v6 = [(APDatabaseManager *)self _executeQueryFromString:v4];
  }
  else
  {
    BOOL v6 = 0;
  }
  [v5 unlock];

  return v6;
}

- (id)executeSelectNumberQuery:(id)a3 withParameters:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(APDatabaseManager *)self lock];
  [v8 lock];
  double v9 = [(APDatabaseManager *)self _prepareStatementForQuery:v7];

  if (v9)
  {
    if ([(APDatabaseManager *)self _bindParameters:v6 toStatement:v9]
      && sqlite3_step(v9) == 100)
    {
      double v10 = objc_msgSend(NSNumber, "numberWithDouble:", sqlite3_column_double(v9, 0));
    }
    else
    {
      double v10 = 0;
    }
    sqlite3_finalize(v9);
  }
  else
  {
    double v10 = 0;
  }
  [v8 unlock];

  return v10;
}

- (BOOL)_updateVersionForPath:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(APDatabaseManager *)self lock];
  [v5 lock];
  id v6 = [(APDatabaseManager *)self _userVersion];
  id v7 = v6;
  if (v6)
  {
    -[APDatabaseManager setCurrentVersion:](self, "setCurrentVersion:", (int)[v6 intValue]);
    double v8 = [[APDatabaseMigration alloc] initWithDatabasePath:v4];
    uint64_t v9 = [(APDatabaseMigration *)v8 lastVersion];
    uint64_t v10 = [v7 integerValue];
    double v11 = APLogForCategory(0x11uLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10 == v9)
    {
      if (v12)
      {
        uint64_t v13 = objc_opt_class();
        id v14 = v13;
        *(_DWORD *)buf = 138478083;
        v47 = v13;
        __int16 v48 = 2050;
        uint64_t v49 = [v7 integerValue];
        _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database up to date version %{public}ld.", buf, 0x16u);
      }
      [v5 unlock];
      BOOL v15 = 1;
    }
    else
    {
      if (v12)
      {
        double v18 = objc_opt_class();
        id v19 = v18;
        *(_DWORD *)buf = 138478339;
        v47 = v18;
        __int16 v48 = 2050;
        uint64_t v49 = [v7 integerValue];
        __int16 v50 = 2048;
        uint64_t v51 = v9;
        _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Start Database migration from v%{public}ld to v%ld.", buf, 0x20u);
      }
      int v20 = -[APDatabaseMigration getMigrationQueriesFromVersion:](v8, "getMigrationQueriesFromVersion:", [v7 intValue]);
      if (v20)
      {
        v39 = v8;
        id v40 = v4;
        [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA locking_mode = EXCLUSIVE"];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        v38 = v20;
        id v21 = v20;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          unsigned int v24 = 0;
          uint64_t v25 = *(void *)v42;
          while (2)
          {
            uint64_t v26 = 0;
            unsigned int v27 = v24 + v23;
            do
            {
              if (*(void *)v42 != v25) {
                objc_enumerationMutation(v21);
              }
              if (![(APDatabaseManager *)self _executeQueryFromString:*(void *)(*((void *)&v41 + 1) + 8 * v26)])
              {
                v31 = [NSString stringWithFormat:@"Migration failed from version %d, Query number: %d", objc_msgSend(v7, "intValue"), v26 + v24];
                uint64_t v32 = [(APDatabaseManager *)self currentVersion];
                v33 = [(APDatabaseManager *)self dbName];
                APDatabaseError(438, 0xFFFFFFFFLL, v32, v33, v31, 0);

                [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA locking_mode = NORMAL"];
                [v5 unlock];

                BOOL v15 = 0;
                goto LABEL_22;
              }
              ++v26;
            }
            while (v23 != v26);
            uint64_t v23 = [v21 countByEnumeratingWithState:&v41 objects:v45 count:16];
            unsigned int v24 = v27;
            if (v23) {
              continue;
            }
            break;
          }
        }

        [(APDatabaseManager *)self setCurrentVersion:v9];
        [(APDatabaseManager *)self _setUserVersion:v9];
        [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA locking_mode = NORMAL"];
        v28 = APLogForCategory(0x11uLL);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v29 = objc_opt_class();
          *(_DWORD *)buf = 138478083;
          v47 = v29;
          __int16 v48 = 2048;
          uint64_t v49 = v9;
          id v30 = v29;
          _os_log_impl(&dword_1D70B2000, v28, OS_LOG_TYPE_DEFAULT, "[%{private}@]: Database migration complete v%ld.", buf, 0x16u);
        }
        [v5 unlock];
        BOOL v15 = 1;
LABEL_22:
        double v8 = v39;
        id v4 = v40;
        int v20 = v38;
      }
      else
      {
        v34 = [NSString stringWithFormat:@"Migration queries is nil, from version %d", objc_msgSend(v7, "intValue")];
        uint64_t v35 = [(APDatabaseManager *)self currentVersion];
        id v36 = [(APDatabaseManager *)self dbName];
        APDatabaseError(438, 0xFFFFFFFFLL, v35, v36, v34, 0);

        [v5 unlock];
        BOOL v15 = 0;
      }
    }
  }
  else
  {
    uint64_t v16 = [(APDatabaseManager *)self currentVersion];
    double v17 = [(APDatabaseManager *)self dbName];
    APDatabaseError(438, 0xFFFFFFFFLL, v16, v17, @"Error getting current version.", 0);

    [v5 unlock];
    BOOL v15 = 0;
  }

  return v15;
}

- (id)_userVersion
{
  return [(APDatabaseManager *)self _executePragmaSelectQuery:@"PRAGMA user_version"];
}

- (BOOL)_setUserVersion:(int64_t)a3
{
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"PRAGMA user_version = %ld", a3);
  id v5 = [(APDatabaseManager *)self _prepareStatementForQuery:v4];
  if (!v5) {
    goto LABEL_5;
  }
  id v6 = v5;
  uint64_t v7 = sqlite3_step(v5);
  if (v7 != 101)
  {
    uint64_t v9 = v7;
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"Set user version error: %s", sqlite3_errstr(v7));
    uint64_t v11 = [(APDatabaseManager *)self currentVersion];
    BOOL v12 = [(APDatabaseManager *)self dbName];
    APDatabaseError(439, v9, v11, v12, v10, 0);

LABEL_5:
    BOOL v8 = 0;
    goto LABEL_6;
  }
  sqlite3_finalize(v6);
  BOOL v8 = 1;
LABEL_6:

  return v8;
}

- (id)_executePragmaSelectQuery:(id)a3
{
  id v4 = [(APDatabaseManager *)self _prepareStatementForQuery:a3];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sqlite3_step(v4);
    if (v6 == 100)
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", sqlite3_column_int(v5, 0));
    }
    else
    {
      uint64_t v8 = v6;
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Execute Pragma Select Query error: %s", sqlite3_errstr(v6));
      uint64_t v10 = [(APDatabaseManager *)self currentVersion];
      uint64_t v11 = [(APDatabaseManager *)self dbName];
      APDatabaseError(433, v8, v10, v11, v9, 0);

      uint64_t v7 = 0;
    }
    sqlite3_finalize(v5);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)_openDBConnectionCanRepeat:(BOOL)a3 databasePath:(id)a4
{
  BOOL v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = APLogForCategory(0xBuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v10 = [v6 databaseName];
    *(_DWORD *)buf = 138478083;
    v34 = v8;
    __int16 v35 = 2113;
    id v36 = v10;
    _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@]: %{private}@ request to open connection.", buf, 0x16u);
  }
  uint64_t v11 = [v6 databaseName];
  [(APDatabaseManager *)self setDbName:v11];

  BOOL v12 = [v6 databaseFilePath];
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = (const char *)[v12 UTF8String];
    BOOL v15 = [(APDatabaseManager *)self lock];
    [v15 lock];
    if (self->_database)
    {
      uint64_t v16 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        double v17 = objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v34 = v17;
        id v18 = v17;
        _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "[%{private}@]: Open database called when connection is already open.", buf, 0xCu);
      }
      [v15 unlock];
    }
    else
    {
      uint64_t v20 = sqlite3_open(v14, &self->_database);
      [(APDatabaseManager *)self setOpenConnectionResult:v20];
      [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA foreign_keys = ON"];
      if (+[APSystemInternal isAppleInternalInstall]) {
        sqlite3_extended_result_codes(self->_database, 1);
      }
      [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA journal_mode = WAL"];
      [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA synchronous = NORMAL"];
      [(APDatabaseManager *)self _executeQueryFromString:@"PRAGMA auto_vacuum = INCREMENTAL"];
      sqlite3_busy_timeout(self->_database, 500);
      [v15 unlock];
      if (v20)
      {
        id v21 = objc_msgSend(NSString, "stringWithFormat:", @"Open connection query error: %s", sqlite3_errstr(v20));
        uint64_t v22 = [(APDatabaseManager *)self currentVersion];
        uint64_t v23 = [(APDatabaseManager *)self dbName];
        APDatabaseError(440, v20, v22, v23, v21, 0);

        [(APDatabaseManager *)self closeDatabaseConnection];
        if (v20 == 14 || v20 == 11)
        {
          +[APDatabaseFileUtilities removeDatabaseAtPath:v6];
          uint64_t v24 = [(APDatabaseManager *)self currentVersion];
          uint64_t v25 = [(APDatabaseManager *)self dbName];
          APDatabaseError(443, 0xFFFFFFFFLL, v24, v25, @"Reacreating Database File on open connection.", 0);
        }
        if (v4) {
          [(APDatabaseManager *)self _openDBConnectionCanRepeat:0 databasePath:v6];
        }
      }
      else
      {
        uint64_t v26 = APLogForCategory(0xBuLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v27 = objc_opt_class();
          id v28 = v27;
          uint64_t v29 = [(APDatabaseManager *)self dbName];
          *(_DWORD *)buf = 138478083;
          v34 = v27;
          __int16 v35 = 2113;
          id v36 = v29;
          _os_log_impl(&dword_1D70B2000, v26, OS_LOG_TYPE_DEFAULT, "[%{private}@]: %{private}@ connection opened sucessfully.", buf, 0x16u);
        }
        id v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v31 = dispatch_queue_create("com.apple.ap.db-table-cache.queue", v30);

        uint64_t v32 = [[APInMemoryTTLCache alloc] initWithExpirationInterval:v31 flushQueue:1800.0];
        [(APDatabaseManager *)self setTableCache:v32];
      }
    }
  }
  else
  {
    uint64_t v19 = [(APDatabaseManager *)self currentVersion];
    BOOL v15 = [(APDatabaseManager *)self dbName];
    APDatabaseError(444, 0xFFFFFFFFLL, v19, v15, @"No Database path when trying to open connection.", 0);
  }
}

- (sqlite3_stmt)_prepareStatementForQuery:(id)a3
{
  id v4 = a3;
  if ([(APDatabaseManager *)self _isConnectionValidWithErrorDescription:@"No connection on prepare statement."])
  {
    ppStmt = 0;
    uint64_t v5 = sqlite3_prepare_v2(self->_database, (const char *)[v4 UTF8String], -1, &ppStmt, 0);
    if (!v5)
    {
      uint64_t v10 = ppStmt;
      goto LABEL_6;
    }
    uint64_t v6 = v5;
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Prepare statement error: %s", sqlite3_errstr(v5));
    uint64_t v8 = [(APDatabaseManager *)self currentVersion];
    id v9 = [(APDatabaseManager *)self dbName];
    APDatabaseError(441, v6, v8, v9, v7, 0);
  }
  uint64_t v10 = 0;
LABEL_6:

  return v10;
}

- (BOOL)_bindParameters:(id)a3 toStatement:(sqlite3_stmt *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (!v5)
  {
LABEL_34:
    BOOL v40 = 1;
    goto LABEL_50;
  }
  uint64_t v6 = v5;
  int v7 = 1;
  uint64_t v8 = *(void *)v48;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v48 != v8) {
      objc_enumerationMutation(obj);
    }
    uint64_t v10 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
    uint64_t v11 = [v10 value];

    if (v11) {
      break;
    }
    sqlite3_bind_null(a4, v7 + v9);
LABEL_32:
    if (v6 == ++v9)
    {
      uint64_t v6 = [obj countByEnumeratingWithState:&v47 objects:v53 count:16];
      v7 += v9;
      if (!v6) {
        goto LABEL_34;
      }
      goto LABEL_3;
    }
  }
  switch([v10 type])
  {
    case 0:
      BOOL v12 = [v10 value];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v14 = [v10 value];
        uint64_t v15 = sqlite3_bind_int(a4, v7 + v9, [v14 intValue]);
        if (v15)
        {
          uint64_t v16 = v15;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Integer error: %s", sqlite3_errstr(v15));
          uint64_t v37 = LABEL_30:;
          uint64_t v38 = [(APDatabaseManager *)self currentVersion];
          v39 = [(APDatabaseManager *)self dbName];
          APDatabaseError(442, v16, v38, v39, v37, 0);

          goto LABEL_31;
        }
        goto LABEL_31;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      break;
    case 1:
      double v17 = [v10 value];
      objc_opt_class();
      char v18 = objc_opt_isKindOfClass();

      if (v18)
      {
        id v14 = [v10 value];
        uint64_t v19 = sqlite3_bind_int64(a4, v7 + v9, [v14 longValue]);
        if (v19)
        {
          uint64_t v16 = v19;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Integer64 error: %s", sqlite3_errstr(v19));
          goto LABEL_30;
        }
LABEL_31:

        goto LABEL_32;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      break;
    case 2:
      uint64_t v20 = [v10 value];
      objc_opt_class();
      char v21 = objc_opt_isKindOfClass();

      if (v21)
      {
        id v14 = [v10 value];
        [v14 doubleValue];
        uint64_t v23 = sqlite3_bind_double(a4, v7 + v9, v22);
        if (v23)
        {
          uint64_t v16 = v23;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Real error: %s", sqlite3_errstr(v23));
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      break;
    case 3:
      uint64_t v24 = [v10 value];
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if (v25)
      {
        id v14 = [v10 value];
        uint64_t v26 = sqlite3_bind_text(a4, v7 + v9, (const char *)[v14 UTF8String], -1, 0);
        if (v26)
        {
          uint64_t v16 = v26;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Text error: %s", sqlite3_errstr(v26));
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      break;
    case 4:
      unsigned int v27 = [v10 value];
      objc_opt_class();
      char v28 = objc_opt_isKindOfClass();

      if (v28)
      {
        id v14 = [v10 value];
        [v14 timeIntervalSince1970];
        uint64_t v30 = sqlite3_bind_double(a4, v7 + v9, v29);
        if (v30)
        {
          uint64_t v16 = v30;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Date error: %s", sqlite3_errstr(v30));
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      break;
    case 5:
      dispatch_queue_t v31 = [v10 value];
      objc_opt_class();
      char v32 = objc_opt_isKindOfClass();

      if (v32)
      {
        id v14 = [v10 value];
        uint64_t v33 = sqlite3_bind_int(a4, v7 + v9, [v14 intValue]);
        if (v33)
        {
          uint64_t v16 = v33;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Bool error: %s", sqlite3_errstr(v33));
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        goto LABEL_49;
      }
      break;
    case 6:
      v34 = [v10 value];
      objc_opt_class();
      char v35 = objc_opt_isKindOfClass();

      if (v35)
      {
        id v14 = [v10 value];
        uint64_t v36 = sqlite3_bind_blob(a4, v7 + v9, (const void *)[v14 bytes], objc_msgSend(v14, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
        if (v36)
        {
          uint64_t v16 = v36;
          objc_msgSend(NSString, "stringWithFormat:", @"Bind Blob error: %s", sqlite3_errstr(v36));
          goto LABEL_30;
        }
        goto LABEL_31;
      }
      long long v41 = APLogForCategory(0xBuLL);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        break;
      }
LABEL_49:

      BOOL v40 = 0;
LABEL_50:

      return v40;
    default:
      goto LABEL_32;
  }
  long long v42 = objc_opt_class();
  *(_DWORD *)buf = 138477827;
  uint64_t v52 = v42;
  id v43 = v42;
  _os_log_impl(&dword_1D70B2000, v41, OS_LOG_TYPE_ERROR, "[%{private}@]: Error - Bind parameter column type class type mismatch.", buf, 0xCu);

  goto LABEL_49;
}

- (BOOL)_executeQueryFromString:(id)a3
{
  errmsg = 0;
  uint64_t v4 = sqlite3_exec(self->_database, (const char *)[a3 UTF8String], 0, 0, &errmsg);
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Execute Query From String error: %s", sqlite3_errstr(v4));
    uint64_t v7 = [(APDatabaseManager *)self currentVersion];
    uint64_t v8 = [(APDatabaseManager *)self dbName];
    APDatabaseError(433, v5, v7, v8, v6, 0);

    sqlite3_free(errmsg);
  }
  return v5 == 0;
}

- (BOOL)_isConnectionOpen
{
  v2 = self;
  uint64_t v3 = [(APDatabaseManager *)self lock];
  [v3 lock];
  LOBYTE(v2) = v2->_database != 0;
  [v3 unlock];

  return (char)v2;
}

- (BOOL)_isConnectionValidWithErrorDescription:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[APSystemInternal isAppleInternalInstall])
  {
    uint64_t v5 = NSString;
    if ([(APDatabaseManager *)self classCDataAvaliable]) {
      uint64_t v6 = @"YES";
    }
    else {
      uint64_t v6 = @"NO";
    }
    uint64_t v7 = [v5 stringWithFormat:@"%@", v6];
    uint64_t v8 = NSString;
    if (+[APDeviceLockedTask deviceUnlockedSinceBoot]) {
      uint64_t v9 = @"YES";
    }
    else {
      uint64_t v9 = @"NO";
    }
    uint64_t v10 = [v8 stringWithFormat:@"%@", v9];
    v22[0] = @"ClassCDataAvaliable";
    v22[1] = @"DeviceUnlockedSinceBoot";
    v23[0] = v7;
    v23[1] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (self->_database)
  {
    uint64_t v12 = [(APDatabaseManager *)self openConnectionResult];
    if (!v12)
    {
      BOOL v20 = 1;
      goto LABEL_16;
    }
    uint64_t v13 = v12;
    int64_t v14 = [(APDatabaseManager *)self currentVersion];
    uint64_t v15 = [(APDatabaseManager *)self dbName];
    uint64_t v16 = 445;
    uint64_t v17 = v13;
    uint64_t v18 = v14;
  }
  else
  {
    int64_t v19 = [(APDatabaseManager *)self currentVersion];
    uint64_t v15 = [(APDatabaseManager *)self dbName];
    uint64_t v16 = 435;
    uint64_t v17 = 0xFFFFFFFFLL;
    uint64_t v18 = v19;
  }
  APDatabaseError(v16, v17, v18, v15, v4, v11);

  BOOL v20 = 0;
LABEL_16:

  return v20;
}

- (sqlite3)database
{
  return self->_database;
}

- (void)setDatabase:(sqlite3 *)a3
{
  self->_database = a3;
}

- (APUnfairLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (APDeviceLockedTask)deviceLockedTask
{
  return self->_deviceLockedTask;
}

- (void)setDeviceLockedTask:(id)a3
{
}

- (APInMemoryTTLCache)tableCache
{
  return self->_tableCache;
}

- (void)setTableCache:(id)a3
{
}

- (NSString)dbName
{
  return self->_dbName;
}

- (void)setDbName:(id)a3
{
}

- (int64_t)currentVersion
{
  return self->_currentVersion;
}

- (void)setCurrentVersion:(int64_t)a3
{
  self->_currentVersion = a3;
}

- (int)openConnectionResult
{
  return self->_openConnectionResult;
}

- (void)setOpenConnectionResult:(int)a3
{
  self->_openConnectionResult = a3;
}

- (BOOL)classCDataAvaliable
{
  return self->_classCDataAvaliable;
}

- (void)setClassCDataAvaliable:(BOOL)a3
{
  self->_classCDataAvaliable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbName, 0);
  objc_storeStrong((id *)&self->_tableCache, 0);
  objc_storeStrong((id *)&self->_deviceLockedTask, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end