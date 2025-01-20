@interface PDSQLiteDatabase
+ (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 resultCode:(int *)a5 error:(id *)a6;
- (BOOL)_enableDisableForeignKeys:(BOOL)a3 error:(id *)a4;
- (BOOL)_executeSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7;
- (BOOL)_executeSQL:(id)a3 error:(id *)a4;
- (BOOL)_executeSQL:(id)a3 error:(id *)a4 retryIfBusy:(BOOL)a5;
- (BOOL)_integerValueForPragma:(id)a3 databaseName:(id)a4 value:(int64_t *)a5 error:(id *)a6;
- (BOOL)_prepareStatementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6;
- (BOOL)_setPragma:(id)a3 integerValue:(int64_t)a4 withDatabaseName:(id)a5 error:(id *)a6;
- (BOOL)_verifyDatabaseOpenAndReturnError:(id *)a3;
- (BOOL)attachDatabaseWithName:(id)a3 fileURL:(id)a4 error:(id *)a5;
- (BOOL)detachDatabaseWithName:(id)a3 error:(id *)a4;
- (BOOL)disableForeignKeys:(id *)a3;
- (BOOL)enableForeignKeys:(id *)a3;
- (BOOL)enableIncrementalAutovacuumWithError:(id *)a3;
- (BOOL)executeSQL:(id)a3 error:(id *)a4;
- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5;
- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6;
- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4;
- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6;
- (BOOL)incrementalVacuumDatabaseIfNeeded:(id)a3 error:(id *)a4;
- (BOOL)isDatabaseWithNameAttached:(id)a3;
- (BOOL)isOpen;
- (BOOL)performTransaction:(id *)a3 usingBlock:(id)a4;
- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5;
- (BOOL)setUserVersion:(int64_t)a3 error:(id *)a4;
- (BOOL)setUserVersion:(int64_t)a3 withDatabaseName:(id)a4 error:(id *)a5;
- (BOOL)tableWithName:(id)a3 containsColumnWithName:(id)a4;
- (BOOL)validateForeignKeysForTable:(id)a3 databaseName:(id)a4 error:(id *)a5;
- (NSURL)fileURL;
- (PDSQLiteDatabase)initWithDatabaseURL:(id)a3;
- (id).cxx_construct;
- (id)getLastErrorWithResultCode:(int)a3;
- (id)initMemoryDatabase;
- (id)lastInsertRowID;
- (int)_openForWriting:(BOOL)a3 error:(id *)a4;
- (int)openForReadingWithError:(id *)a3;
- (int)openWithError:(id *)a3;
- (int)totalChangesCount;
- (int64_t)userVersion:(id *)a3;
- (int64_t)userVersionWithDatabaseName:(id)a3 error:(id *)a4;
- (sqlite3_stmt)_statementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5;
- (void)_assertNoActiveStatements;
- (void)_resetStatement:(sqlite3_stmt *)a3 finalize:(BOOL)a4;
- (void)accessDatabaseUsingBlock:(id)a3;
- (void)clearStatementCache;
- (void)close;
- (void)dealloc;
- (void)onCommit:(id)a3 orRollback:(id)a4;
- (void)onRowUpdate:(id)a3;
- (void)performUpdateBlock:(id)a3 changeType:(int64_t)a4;
- (void)releaseMemory;
- (void)requireRollback;
- (void)truncate;
@end

@implementation PDSQLiteDatabase

- (BOOL)enableIncrementalAutovacuumWithError:(id *)a3
{
  id v30 = 0;
  uint64_t v31 = 0;
  unsigned __int8 v5 = [(PDSQLiteDatabase *)self _integerValueForPragma:@"AUTO_VACUUM" databaseName:0 value:&v31 error:&v30];
  id v6 = v30;
  v7 = v6;
  if ((v5 & 1) == 0)
  {
    CLSInitLog();
    v9 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = (uint64_t)v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to get value for pragma 'AUTO_VACUUM': %{public}@", buf, 0xCu);
      if (a3) {
        goto LABEL_6;
      }
    }
    else if (a3)
    {
LABEL_6:
      id v10 = v7;
LABEL_7:
      v7 = v10;
      BOOL v8 = 0;
      *a3 = v10;
      goto LABEL_27;
    }
    BOOL v8 = 0;
    goto LABEL_27;
  }
  if (v31 != 2)
  {
    id v29 = v6;
    unsigned __int8 v11 = [(PDSQLiteDatabase *)self _setPragma:@"AUTO_VACUUM" integerValue:2 withDatabaseName:0 error:&v29];
    id v12 = v29;

    if (v11)
    {
      id v27 = 0;
      uint64_t v28 = 2500;
      unsigned __int8 v13 = [(PDSQLiteDatabase *)self _integerValueForPragma:@"CACHE_SPILL" databaseName:0 value:&v28 error:&v27];
      id v14 = v27;
      if ((v13 & 1) == 0)
      {
        CLSInitLog();
        v15 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = (uint64_t)v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Failed to retrieve base value for CACHE_SPILL when enabling incremental autovacuum: %{public}@", buf, 0xCu);
        }
      }
      uint64_t v16 = v28 & (v28 >> 63);
      id v26 = v14;
      unsigned __int8 v17 = [(PDSQLiteDatabase *)self _setPragma:@"CACHE_SPILL" integerValue:v16 withDatabaseName:0 error:&v26];
      id v18 = v26;

      if ((v17 & 1) == 0)
      {
        CLSInitLog();
        v19 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v33 = v16;
          __int16 v34 = 2114;
          id v35 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Failed to set %lld for CACHE_SPILL when enabling incremental autovacuum: %{public}@", buf, 0x16u);
        }
      }
      BOOL v8 = [(PDSQLiteDatabase *)self _executeSQL:@"VACUUM;" error:a3];
      id v25 = v18;
      unsigned __int8 v20 = [(PDSQLiteDatabase *)self _setPragma:@"CACHE_SPILL" integerValue:v28 withDatabaseName:0 error:&v25];
      id v21 = v25;

      if ((v20 & 1) == 0)
      {
        CLSInitLog();
        v22 = CLSLogDatabase;
        if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v33 = (uint64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Failed to reset base value for CACHE_SPILL when enabling incremental autovacuum: %{public}@", buf, 0xCu);
        }
      }

      goto LABEL_26;
    }
    CLSInitLog();
    v23 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v33 = (uint64_t)v12;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to set value for pragma 'AUTO_VACUUM': %{public}@", buf, 0xCu);
      if (a3) {
        goto LABEL_21;
      }
    }
    else if (a3)
    {
LABEL_21:
      id v10 = v12;
      goto LABEL_7;
    }
    BOOL v8 = 0;
LABEL_26:
    v7 = v12;
    goto LABEL_27;
  }
  BOOL v8 = 1;
LABEL_27:

  return v8;
}

- (PDSQLiteDatabase)initWithDatabaseURL:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = v4;
  if (v4 && ([v4 isFileURL] & 1) == 0)
  {

    self = 0;
    +[NSException raise:NSInvalidArgumentException format:@"Invalid database URL"];
  }
  v12.receiver = self;
  v12.super_class = (Class)PDSQLiteDatabase;
  id v6 = [(PDSQLiteDatabase *)&v12 init];
  if (v6)
  {
    v7 = (NSURL *)[v5 copy];
    fileURL = v6->_fileURL;
    v6->_fileURL = v7;

    uint64_t v9 = objc_opt_new();
    tableColumnNameCache = v6->_tableColumnNameCache;
    v6->_tableColumnNameCache = (NSMutableDictionary *)v9;
  }
  return v6;
}

- (int)_openForWriting:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  fileURL = self->_fileURL;
  if (fileURL)
  {
    BOOL v8 = [(NSURL *)fileURL path];
  }
  else
  {
    BOOL v8 = @":memory:";
  }
  uint64_t v9 = v8;
  uint64_t v33 = v9;
  id v10 = (const char *)[(__CFString *)v9 fileSystemRepresentation];
  if (v5) {
    int v11 = 3145734;
  }
  else {
    int v11 = 3145729;
  }
  p_db = &self->_db;
  unsigned int busy = sqlite3_open_v2(v10, &self->_db, v11, 0);
  if (busy)
  {
    id v14 = @"opening database";
  }
  else
  {
    unsigned int busy = sub_1000097A0(*p_db, "PRAGMA cache_size=-128", 0, 0, 0);
    if (busy)
    {
      id v14 = @"setting cache_size";
    }
    else
    {
      unsigned int busy = sqlite3_busy_timeout(*p_db, 60000);
      if (!busy)
      {
        if (v5)
        {
          unsigned int busy = sub_1000097A0(*p_db, "PRAGMA journal_mode = WAL", 0, 0, 0);
          if (busy)
          {
            id v14 = @"setting journal_mode";
            goto LABEL_13;
          }
          unsigned int busy = sub_1000097A0(*p_db, "PRAGMA foreign_keys = ON", 0, 0, 0);
          if (busy)
          {
            id v14 = @"enabling foreign keys";
            goto LABEL_13;
          }
        }
        unsigned int v34 = ![(PDSQLiteDatabase *)self enableIncrementalAutovacuumWithError:a4];
        goto LABEL_21;
      }
      id v14 = @"setting busy timeout";
    }
  }
LABEL_13:
  v15 = *p_db;
  uint64_t v16 = v14;
  uint64_t v17 = sqlite3_extended_errcode(v15);
  id v18 = +[NSString stringWithCString:sqlite3_errmsg(v15) encoding:4];
  v19 = v16;
  unsigned __int8 v20 = objc_opt_new();
  id v21 = +[NSNumber numberWithInt:v17];
  [v20 setObject:v21 forKey:@"extended_error_code"];

  if (v18)
  {
    [v20 setObject:v18 forKey:@"error_message"];
    CFStringRef v22 = v18;
  }
  else
  {
    [v20 setObject:@"missing error message" forKey:@"error_message"];
    CFStringRef v22 = &stru_1001F6580;
  }
  unsigned int v34 = busy;
  v23 = +[NSMutableString stringWithFormat:@"A SQLite error occurred: (%d) %@", v17, v22];
  [v20 setObject:v19 forKey:@"context"];
  [v23 appendFormat:@" <%@>", v19];
  [v20 setObject:v23 forKey:NSLocalizedDescriptionKey];
  v24 = +[NSError errorWithDomain:@"com.apple.SQLite" code:v17 userInfo:v20];

  id v25 = v24;
  *(void *)buf = v25;
  v40[0] = NSUnderlyingErrorKey;
  v40[1] = NSLocalizedDescriptionKey;
  id v26 = [v25 localizedDescription];
  uint64_t v9 = v33;
  id v27 = +[NSString stringWithFormat:@"SQLite error: %@", v26];
  *(void *)&buf[8] = v27;
  uint64_t v28 = +[NSDictionary dictionaryWithObjects:buf forKeys:v40 count:2];

  id v29 = +[NSError errorWithDomain:@"com.apple.progressd.SQLite" code:4 userInfo:v28];

  if (a4) {
    *a4 = v29;
  }
  CLSInitLog();
  id v30 = CLSLogDatabase;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    v32 = [v29 localizedDescription];
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = busy;
    __int16 v36 = 2114;
    v37 = v33;
    __int16 v38 = 2112;
    v39 = v32;
    _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Error %{public}@: [%d, %{public}@] (%@)", buf, 0x26u);
  }
  [(PDSQLiteDatabase *)self close];

LABEL_21:
  return v34;
}

- (BOOL)_integerValueForPragma:(id)a3 databaseName:(id)a4 value:(int64_t *)a5 error:(id *)a6
{
  id v10 = a3;
  int v11 = sub_100003970(a4);
  objc_super v12 = +[NSString stringWithFormat:@"PRAGMA %@%@;", v11, v10];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000B8DC;
  v14[3] = &unk_1001F2DC0;
  v14[4] = &v15;
  v14[5] = a5;
  [(PDSQLiteDatabase *)self _executeSQL:v12 cache:0 error:a6 bindingHandler:0 enumerationHandler:v14];
  LOBYTE(a6) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)a6;
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return [(PDSQLiteDatabase *)self _executeSQL:a3 cache:1 error:a4 bindingHandler:a5 enumerationHandler:a6];
}

- (BOOL)_executeSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 bindingHandler:(id)a6 enumerationHandler:(id)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([(PDSQLiteDatabase *)self _verifyDatabaseOpenAndReturnError:a5])
  {
    if (!self->_isHandlingTransactionEnd)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100008B20;
      v17[3] = &unk_1001F2D98;
      id v18 = v13;
      id v19 = v14;
      unsigned __int8 v20 = a5;
      BOOL v15 = [(PDSQLiteDatabase *)self _prepareStatementForSQL:v12 cache:v10 error:a5 usingBlock:v17];

      goto LABEL_5;
    }
    +[NSError cls_assignError:a5 code:100 description:@"Attempt to execute SQL within a commit or rollback block."];
  }
  BOOL v15 = 0;
LABEL_5:

  return v15;
}

- (sqlite3_stmt)_statementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if ([(PDSQLiteDatabase *)self _verifyDatabaseOpenAndReturnError:a5])
  {
    ppStmt = 0;
    if (!v6
      || (uint64_t v9 = self->_statementCache) == 0
      || (BOOL v10 = (sqlite3_stmt *)CFDictionaryGetValue(v9, v8), (ppStmt = v10) == 0))
    {
      do
      {
        *(void *)pzTail = 0;
        db = self->_db;
        id v13 = v8;
        uint64_t v14 = sqlite3_prepare_v2(db, (const char *)[v13 UTF8String], (int)objc_msgSend(v13, "length"), &ppStmt, (const char **)pzTail);
        uint64_t v15 = v14;
      }
      while ((v14 - 5) < 2);
      if (v14)
      {
        CLSInitLog();
        uint64_t v16 = CLSLogDatabase;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v50 = sqlite3_errmsg(self->_db);
          *(_DWORD *)pzTail = 138412802;
          *(void *)&pzTail[4] = v13;
          __int16 v54 = 1024;
          int v55 = v15;
          __int16 v56 = 2080;
          v57 = v50;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Could not prepare statement: %@: [%d, %s]", pzTail, 0x1Cu);
        }

        uint64_t v17 = [(PDSQLiteDatabase *)self getLastErrorWithResultCode:v15];
      }
      else
      {
        if (v6)
        {
          statementCache = self->_statementCache;
          if (!statementCache)
          {
            statementCache = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, (const CFDictionaryValueCallBacks *)&unk_10023C7C8);
            self->_statementCache = statementCache;
          }
          if (ppStmt) {
            CFDictionarySetValue(statementCache, v13, ppStmt);
          }
        }
        uint64_t v17 = 0;
      }
      if (a5) {
        *a5 = v17;
      }

      BOOL v10 = ppStmt;
      if (ppStmt)
      {
        if (!v6)
        {
          unint64_t v19 = 0x9DDFEA08EB382D69 * (((8 * ppStmt) + 8) ^ ((unint64_t)ppStmt >> 32));
          unint64_t v20 = 0x9DDFEA08EB382D69 * (((unint64_t)ppStmt >> 32) ^ (v19 >> 47) ^ v19);
          id v21 = (id *)(0x9DDFEA08EB382D69 * (v20 ^ (v20 >> 47)));
          unint64_t value = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            uint8x8_t v23 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              a5 = (id *)(0x9DDFEA08EB382D69 * (v20 ^ (v20 >> 47)));
              if ((unint64_t)v21 >= value) {
                a5 = (id *)((unint64_t)v21 % value);
              }
            }
            else
            {
              a5 = (id *)((value - 1) & (unint64_t)v21);
            }
            v24 = (uint64_t ***)self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[(void)a5];
            if (v24)
            {
              for (i = *v24; i; i = (uint64_t **)*i)
              {
                unint64_t v26 = (unint64_t)i[1];
                if ((id *)v26 == v21)
                {
                  if (i[2] == (uint64_t *)ppStmt) {
                    goto LABEL_95;
                  }
                }
                else
                {
                  if (v23.u32[0] > 1uLL)
                  {
                    if (v26 >= value) {
                      v26 %= value;
                    }
                  }
                  else
                  {
                    v26 &= value - 1;
                  }
                  if ((id *)v26 != a5) {
                    break;
                  }
                }
              }
            }
          }
          id v27 = operator new(0x18uLL);
          *id v27 = 0;
          v27[1] = v21;
          v27[2] = v10;
          float v28 = (float)(self->_activeStatements.__table_.__p2_.__value_ + 1);
          float v29 = self->_activeStatements.__table_.__p3_.__value_;
          if (value && (float)(v29 * (float)value) >= v28)
          {
LABEL_85:
            v46 = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_;
            v47 = (void **)v46[(void)a5];
            if (v47)
            {
              *id v27 = *v47;
            }
            else
            {
              *id v27 = self->_activeStatements.__table_.__p1_.__value_.__next_;
              self->_activeStatements.__table_.__p1_.__value_.__next_ = v27;
              v46[(void)a5] = &self->_activeStatements.__table_.__p1_;
              if (!*v27)
              {
LABEL_94:
                ++self->_activeStatements.__table_.__p2_.__value_;
                BOOL v10 = ppStmt;
                goto LABEL_95;
              }
              unint64_t v48 = *(void *)(*v27 + 8);
              if ((value & (value - 1)) != 0)
              {
                if (v48 >= value) {
                  v48 %= value;
                }
              }
              else
              {
                v48 &= value - 1;
              }
              v47 = &self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[v48];
            }
            *v47 = v27;
            goto LABEL_94;
          }
          BOOL v30 = 1;
          if (value >= 3) {
            BOOL v30 = (value & (value - 1)) != 0;
          }
          unint64_t v31 = v30 | (2 * value);
          unint64_t v32 = vcvtps_u32_f32(v28 / v29);
          if (v31 <= v32) {
            int8x8_t prime = (int8x8_t)v32;
          }
          else {
            int8x8_t prime = (int8x8_t)v31;
          }
          if (*(void *)&prime == 1)
          {
            int8x8_t prime = (int8x8_t)2;
          }
          else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
          {
            int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
            unint64_t value = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          if (*(void *)&prime > value) {
            goto LABEL_51;
          }
          if (*(void *)&prime < value)
          {
            unint64_t v40 = vcvtps_u32_f32((float)self->_activeStatements.__table_.__p2_.__value_/ self->_activeStatements.__table_.__p3_.__value_);
            if (value < 3
              || (uint8x8_t v41 = (uint8x8_t)vcnt_s8((int8x8_t)value), v41.i16[0] = vaddlv_u8(v41), v41.u32[0] > 1uLL))
            {
              unint64_t v40 = std::__next_prime(v40);
            }
            else
            {
              uint64_t v42 = 1 << -(char)__clz(v40 - 1);
              if (v40 >= 2) {
                unint64_t v40 = v42;
              }
            }
            if (*(void *)&prime <= v40) {
              int8x8_t prime = (int8x8_t)v40;
            }
            if (*(void *)&prime >= value)
            {
              unint64_t value = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
            }
            else
            {
              if (prime)
              {
LABEL_51:
                if (*(void *)&prime >> 61) {
                  sub_10004C318();
                }
                unsigned int v34 = (void **)operator new(8 * *(void *)&prime);
                id v35 = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_;
                self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_ = v34;
                if (v35) {
                  operator delete(v35);
                }
                uint64_t v36 = 0;
                self->_activeStatements.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
                do
                  self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[v36++] = 0;
                while (*(void *)&prime != v36);
                next = self->_activeStatements.__table_.__p1_.__value_.__next_;
                if (next)
                {
                  unint64_t v38 = next[1];
                  uint8x8_t v39 = (uint8x8_t)vcnt_s8(prime);
                  v39.i16[0] = vaddlv_u8(v39);
                  if (v39.u32[0] > 1uLL)
                  {
                    if (v38 >= *(void *)&prime) {
                      v38 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v38 &= *(void *)&prime - 1;
                  }
                  self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[v38] = &self->_activeStatements.__table_.__p1_;
                  v43 = (void *)*next;
                  if (*next)
                  {
                    do
                    {
                      unint64_t v44 = v43[1];
                      if (v39.u32[0] > 1uLL)
                      {
                        if (v44 >= *(void *)&prime) {
                          v44 %= *(void *)&prime;
                        }
                      }
                      else
                      {
                        v44 &= *(void *)&prime - 1;
                      }
                      if (v44 != v38)
                      {
                        v45 = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_;
                        if (!v45[v44])
                        {
                          v45[v44] = next;
                          goto LABEL_76;
                        }
                        void *next = *v43;
                        void *v43 = *(void *)self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[v44];
                        *(void *)self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[v44] = v43;
                        v43 = next;
                      }
                      unint64_t v44 = v38;
LABEL_76:
                      next = v43;
                      v43 = (void *)*v43;
                      unint64_t v38 = v44;
                    }
                    while (v43);
                  }
                }
                unint64_t value = (unint64_t)prime;
                goto LABEL_80;
              }
              v51 = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_;
              self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_ = 0;
              if (v51) {
                operator delete(v51);
              }
              unint64_t value = 0;
              self->_activeStatements.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
            }
          }
LABEL_80:
          if ((value & (value - 1)) != 0)
          {
            if ((unint64_t)v21 >= value) {
              a5 = (id *)((unint64_t)v21 % value);
            }
            else {
              a5 = v21;
            }
          }
          else
          {
            a5 = (id *)((value - 1) & (unint64_t)v21);
          }
          goto LABEL_85;
        }
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }
LABEL_95:

  return v10;
}

- (BOOL)performTransactionWithType:(int64_t)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8 = (uint64_t (**)(id, id *))a5;
  if (![(PDSQLiteDatabase *)self _verifyDatabaseOpenAndReturnError:a4]) {
    goto LABEL_41;
  }
  BOOL isInTransaction = self->_isInTransaction;
  if (self->_isInTransaction)
  {
    int64_t transactionType = self->_transactionType;
    if (transactionType >= a3) {
      goto LABEL_22;
    }
    CFStringRef v11 = @"DEFERRED";
    if (a3 == 1) {
      id v12 = @"IMMEDIATE";
    }
    else {
      id v12 = @"DEFERRED";
    }
    if (a3 == 2) {
      id v12 = @"EXCLUSIVE";
    }
    if (transactionType == 1) {
      CFStringRef v11 = @"IMMEDIATE";
    }
    if (transactionType == 2) {
      CFStringRef v13 = @"EXCLUSIVE";
    }
    else {
      CFStringRef v13 = v11;
    }
    uint64_t v14 = v12;
    +[NSException raise:NSInvalidArgumentException, @"Cannot perform %@ transaction inside an existing %@ transaction", v14, v13 format];
  }
  else
  {
    id v15 = objc_alloc((Class)NSString);
    CFStringRef v16 = @"DEFERRED";
    if (a3 == 1) {
      CFStringRef v16 = @"IMMEDIATE";
    }
    if (a3 == 2) {
      CFStringRef v16 = @"EXCLUSIVE";
    }
    uint64_t v14 = (__CFString *)[v15 initWithFormat:@"BEGIN %@ TRANSACTION", v16];
    BOOL v17 = [(PDSQLiteDatabase *)self _executeSQL:v14 error:a4 retryIfBusy:1];
    self->_BOOL isInTransaction = v17;
    if (!v17)
    {

      goto LABEL_41;
    }
    self->_int64_t transactionType = a3;
  }

  if (self->_isInTransaction)
  {
LABEL_22:
    id v42 = 0;
    int v18 = v8[2](v8, &v42);
    id v19 = v42;
    unint64_t v20 = v19;
    if (a4) {
      char v21 = v18;
    }
    else {
      char v21 = 1;
    }
    if ((v21 & 1) == 0) {
      *a4 = v19;
    }

    if (isInTransaction) {
      goto LABEL_52;
    }
    if (v18) {
      LOBYTE(v18) = !self->_requiresRollback;
    }
    [(PDSQLiteDatabase *)self _assertNoActiveStatements];
    if (v18)
    {
      unsigned int v22 = [(PDSQLiteDatabase *)self _executeSQL:@"COMMIT;" error:a4];
      self->_isHandlingTransactionEnd = 1;
      if (v22)
      {
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        uint8x8_t v23 = self->_onCommitBlocks;
        id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v24)
        {
          uint64_t v25 = *(void *)v39;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v39 != v25) {
                objc_enumerationMutation(v23);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v38 + 1) + 8 * i) + 16))();
            }
            id v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v38 objects:v44 count:16];
          }
          while (v24);
        }
        int v18 = 1;
LABEL_51:

        self->_isHandlingTransactionEnd = 0;
        onCommitBlocks = self->_onCommitBlocks;
        self->_onCommitBlocks = 0;

        onRollbackBlocks = self->_onRollbackBlocks;
        self->_onRollbackBlocks = 0;

        *(_WORD *)&self->_BOOL isInTransaction = 0;
LABEL_52:
        BOOL v27 = v18 != 0;
        goto LABEL_53;
      }
    }
    else
    {
      self->_isHandlingTransactionEnd = 1;
    }
    [(PDSQLiteDatabase *)self _executeSQL:@"ROLLBACK;" error:a4];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint8x8_t v23 = self->_onRollbackBlocks;
    id v28 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v28)
    {
      uint64_t v29 = *(void *)v35;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(v23);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v34 + 1) + 8 * (void)j) + 16))();
        }
        id v28 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v28);
    }
    int v18 = 0;
    goto LABEL_51;
  }
LABEL_41:
  BOOL v27 = 0;
LABEL_53:

  return v27;
}

- (BOOL)_executeSQL:(id)a3 error:(id *)a4 retryIfBusy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  if ([(PDSQLiteDatabase *)self _verifyDatabaseOpenAndReturnError:a4])
  {
    int v18 = 0;
    db = self->_db;
    id v10 = v8;
    CFStringRef v11 = (const char *)[v10 UTF8String];
    if (v5) {
      uint64_t v12 = sub_1000097A0(db, v11, 0, 0, (char **)&v18);
    }
    else {
      uint64_t v12 = ((uint64_t (*)(sqlite3 *, const char *, void, void, void **))_sqlite3_exec)(db, v11, 0, 0, &v18);
    }
    uint64_t v13 = v12;
    BOOL v14 = v12 == 0;
    if (v12)
    {
      id v15 = v18;
      if (!v18) {
        id v15 = (void *)sqlite3_errmsg(self->_db);
      }
      CLSInitLog();
      CFStringRef v16 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v20 = v10;
        __int16 v21 = 1024;
        int v22 = v13;
        __int16 v23 = 2082;
        id v24 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Could not execute SQL: %@: [%d, %{public}s]", buf, 0x1Cu);
      }
      if (a4)
      {
        *a4 = [(PDSQLiteDatabase *)self getLastErrorWithResultCode:v13];
      }
      if (v18) {
        sqlite3_free(v18);
      }
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_verifyDatabaseOpenAndReturnError:(id *)a3
{
  db = self->_db;
  if (!db) {
    +[NSError cls_assignError:a3 code:2 description:@"Database connection is closed"];
  }
  return db != 0;
}

- (BOOL)_prepareStatementForSQL:(id)a3 cache:(BOOL)a4 error:(id *)a5 usingBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  CFStringRef v11 = (uint64_t (**)(id, sqlite3_stmt *, id *))a6;
  uint64_t v12 = [(PDSQLiteDatabase *)self _statementForSQL:v10 cache:v8 error:a5];
  if (v12)
  {
    v18[0] = 0;
    char v14 = v11[2](v11, v12, v18);
    id v15 = v18[0];
    if ((v14 & 1) == 0) {
      +[NSError cls_assignError:a5 fromError:v15];
    }

    BOOL v16 = v14;
    [(PDSQLiteDatabase *)self _resetStatement:v12 finalize:v8 ^ 1];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (void)_resetStatement:(sqlite3_stmt *)a3 finalize:(BOOL)a4
{
  if (a4)
  {
    sqlite3_finalize(a3);
  }
  else
  {
    sqlite3_reset(a3);
    sqlite3_clear_bindings(a3);
  }
  unint64_t value = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value) {
    return;
  }
  unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * a3) + 8) ^ ((unint64_t)a3 >> 32));
  unint64_t v8 = 0x9DDFEA08EB382D69 * (((unint64_t)a3 >> 32) ^ (v7 >> 47) ^ v7);
  unint64_t v9 = 0x9DDFEA08EB382D69 * (v8 ^ (v8 >> 47));
  uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v11 = v9;
    if (v9 >= value) {
      unint64_t v11 = v9 % value;
    }
  }
  else
  {
    unint64_t v11 = (value - 1) & v9;
  }
  uint64_t v12 = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_;
  uint64_t v13 = (void **)v12[v11];
  if (!v13) {
    return;
  }
  isa = (PDSQLiteDatabase *)*v13;
  if (!*v13) {
    return;
  }
  unint64_t v15 = value - 1;
  while (1)
  {
    unint64_t db = (unint64_t)isa->_db;
    if (db == v9) {
      break;
    }
    if (v10.u32[0] > 1uLL)
    {
      if (db >= value) {
        db %= value;
      }
    }
    else
    {
      db &= v15;
    }
    if (db != v11) {
      return;
    }
LABEL_20:
    isa = (PDSQLiteDatabase *)isa->super.isa;
    if (!isa) {
      return;
    }
  }
  if (*(sqlite3_stmt **)&isa->_isInTransaction != a3) {
    goto LABEL_20;
  }
  BOOL v17 = (PDSQLiteDatabase *)isa->super.isa;
  if (v10.u32[0] > 1uLL)
  {
    if (v9 >= value) {
      v9 %= value;
    }
  }
  else
  {
    v9 &= v15;
  }
  int v18 = (PDSQLiteDatabase *)v12[v9];
  do
  {
    id v19 = v18;
    int v18 = (PDSQLiteDatabase *)v18->super.isa;
  }
  while (v18 != isa);
  if (v19 == (PDSQLiteDatabase *)&self->_activeStatements.__table_.__p1_) {
    goto LABEL_39;
  }
  unint64_t v20 = (unint64_t)v19->_db;
  if (v10.u32[0] > 1uLL)
  {
    if (v20 >= value) {
      v20 %= value;
    }
  }
  else
  {
    v20 &= v15;
  }
  if (v20 == v9)
  {
LABEL_41:
    if (v17)
    {
      unint64_t v21 = (unint64_t)v17->_db;
      goto LABEL_43;
    }
  }
  else
  {
LABEL_39:
    if (!v17) {
      goto LABEL_40;
    }
    unint64_t v21 = (unint64_t)v17->_db;
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v22 = (unint64_t)v17->_db;
      if (v21 >= value) {
        unint64_t v22 = v21 % value;
      }
    }
    else
    {
      unint64_t v22 = v21 & v15;
    }
    if (v22 != v9)
    {
LABEL_40:
      v12[v9] = 0;
      BOOL v17 = (PDSQLiteDatabase *)isa->super.isa;
      goto LABEL_41;
    }
LABEL_43:
    if (v10.u32[0] > 1uLL)
    {
      if (v21 >= value) {
        v21 %= value;
      }
    }
    else
    {
      v21 &= v15;
    }
    if (v21 != v9)
    {
      self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_[v21] = v19;
      BOOL v17 = (PDSQLiteDatabase *)isa->super.isa;
    }
  }
  v19->super.isa = (Class)v17;
  isa->super.isa = 0;
  --self->_activeStatements.__table_.__p2_.__value_;

  operator delete(isa);
}

- (int)totalChangesCount
{
  return sqlite3_total_changes(self->_db);
}

+ (BOOL)_stepStatement:(sqlite3_stmt *)a3 hasRow:(BOOL *)a4 resultCode:(int *)a5 error:(id *)a6
{
  if (a4) {
    *a4 = 0;
  }
  if (!a3) {
    return 1;
  }
  while (1)
  {
    int v10 = sqlite3_step(a3);
    int v11 = v10;
    if (v10 == 9)
    {
      if (a5) {
        *a5 = 9;
      }
      goto LABEL_22;
    }
    if (v10 == 101) {
      return 1;
    }
    if (v10 == 100) {
      break;
    }
    int v12 = v10;
    if (v10 - 7 <= 0xFFFFFFFD)
    {
      if (a5) {
        *a5 = v10;
      }
      CLSInitLog();
      uint64_t v13 = CLSLogDatabase;
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
      if (v12 == 19)
      {
        if (v14)
        {
          int v18 = sqlite3_sql(a3);
          id v19 = sqlite3_db_handle(a3);
          int v22 = 136315650;
          __int16 v23 = v18;
          __int16 v24 = 1024;
          int v25 = 19;
          __int16 v26 = 2082;
          BOOL v27 = sqlite3_errmsg(v19);
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Constraint violation during statement step: %s [%d, %{public}s]", (uint8_t *)&v22, 0x1Cu);
        }
      }
      else if (v14)
      {
        unint64_t v20 = sqlite3_sql(a3);
        unint64_t v21 = sqlite3_db_handle(a3);
        int v22 = 136315650;
        __int16 v23 = v20;
        __int16 v24 = 1024;
        int v25 = v12;
        __int16 v26 = 2080;
        BOOL v27 = sqlite3_errmsg(v21);
        _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Step failed: %s: [%d, %s]", (uint8_t *)&v22, 0x1Cu);
      }

LABEL_22:
      if (!a6) {
        return 0;
      }
      BOOL v16 = sqlite3_db_handle(a3);
      sub_10004B248(v16, v11);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      BOOL result = 0;
      *a6 = v17;
      return result;
    }
  }
  BOOL result = 1;
  if (a4) {
    *a4 = 1;
  }
  return result;
}

- (void)onRowUpdate:(id)a3
{
  id v7 = a3;
  if (self->_db)
  {
    id v4 = objc_retainBlock(v7);
    id updateBlock = self->_updateBlock;
    self->_id updateBlock = v4;

    unint64_t db = self->_db;
    if (v7) {
      sqlite3_update_hook(db, (void (__cdecl *)(void *, int, const char *, const char *, sqlite3_int64))sub_10004B764, self);
    }
    else {
      sqlite3_update_hook(db, 0, 0);
    }
  }
}

- (BOOL)_executeSQL:(id)a3 error:(id *)a4
{
  return [(PDSQLiteDatabase *)self _executeSQL:a3 error:a4 retryIfBusy:0];
}

- (void)_assertNoActiveStatements
{
  for (i = self->_activeStatements.__table_.__p1_.__value_.__next_; i; i = (void *)*i)
  {
    v3 = (sqlite3_stmt *)i[2];
    CLSInitLog();
    id v4 = CLSLogDatabase;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      BOOL v5 = sqlite3_sql(v3);
      *(_DWORD *)buf = 134218242;
      if (v5) {
        BOOL v6 = v5;
      }
      else {
        BOOL v6 = "<unknown sql>";
      }
      unint64_t v8 = v3;
      __int16 v9 = 2082;
      int v10 = v6;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Transaction finished with active outstanding statement: %p %{public}s", buf, 0x16u);
    }
  }
}

- (int)openWithError:(id *)a3
{
  return [(PDSQLiteDatabase *)self _openForWriting:1 error:a3];
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 1065353216;
  return self;
}

- (id)initMemoryDatabase
{
  return [(PDSQLiteDatabase *)self initWithDatabaseURL:0];
}

- (void)dealloc
{
  if (self->_db) {
    [(PDSQLiteDatabase *)self close];
  }
  v3.receiver = self;
  v3.super_class = (Class)PDSQLiteDatabase;
  [(PDSQLiteDatabase *)&v3 dealloc];
}

- (int)openForReadingWithError:(id *)a3
{
  return [(PDSQLiteDatabase *)self _openForWriting:0 error:a3];
}

- (BOOL)enableForeignKeys:(id *)a3
{
  return [(PDSQLiteDatabase *)self _enableDisableForeignKeys:1 error:a3];
}

- (BOOL)disableForeignKeys:(id *)a3
{
  return [(PDSQLiteDatabase *)self _enableDisableForeignKeys:0 error:a3];
}

- (BOOL)_enableDisableForeignKeys:(BOOL)a3 error:(id *)a4
{
  if (self->_isInTransaction)
  {
    CLSInitLog();
    BOOL v5 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Foreign keys cannot be turned on or off while inside a transaction", buf, 2u);
    }
    +[NSError cls_assignError:a4 code:2 format:@"Foreign keys cannot be turned on or off while inside a transaction"];
    return 0;
  }
  else
  {
    BOOL v7 = a3;
    CFStringRef v9 = @"OFF";
    if (a3) {
      CFStringRef v9 = @"ON";
    }
    int v10 = +[NSString stringWithFormat:@"PRAGMA foreign_keys = %@", v9];
    unint64_t db = self->_db;
    id v12 = v10;
    uint64_t v13 = sub_1000097A0(db, (const char *)[v12 UTF8String], 0, 0, 0);
    BOOL v6 = v13 == 0;
    if (v13)
    {
      CFStringRef v14 = @"disabling";
      if (v7) {
        CFStringRef v14 = @"enabling";
      }
      unint64_t v15 = +[NSString stringWithFormat:@"%@ foreign keys", v14];
      +[NSError cls_assignError:a4, 100, @"Error %@: [%d]", v15, v13 code format];
      CLSInitLog();
      BOOL v16 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v19 = v15;
        __int16 v20 = 1024;
        int v21 = v13;
        _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Error %{public}@: [%d]", buf, 0x12u);
      }
    }
  }
  return v6;
}

- (void)releaseMemory
{
  [(PDSQLiteDatabase *)self clearStatementCache];
  unint64_t db = self->_db;

  sqlite3_db_release_memory(db);
}

- (void)close
{
  [(PDSQLiteDatabase *)self clearStatementCache];
  unint64_t db = self->_db;
  if (db)
  {
    if (sqlite3_close(db))
    {
      CLSInitLog();
      id v4 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "failed to close database!", v5, 2u);
      }
    }
    [(NSMutableDictionary *)self->_tableColumnNameCache removeAllObjects];
    self->_unint64_t db = 0;
  }
}

- (void)clearStatementCache
{
  statementCache = self->_statementCache;
  if (statementCache)
  {
    CFRelease(statementCache);
    self->_statementCache = 0;
  }

  [(PDSQLiteDatabase *)self _assertNoActiveStatements];
}

- (void)truncate
{
  [(PDSQLiteDatabase *)self clearStatementCache];
  unint64_t db = self->_db;
  if (db)
  {
    int v6 = 13;
    if (sqlite3_file_control(db, 0, 101, &v6))
    {
      CLSInitLog();
      id v4 = CLSLogDatabase;
      if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)BOOL v5 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to truncate database!", v5, 2u);
      }
    }
  }
}

- (BOOL)isOpen
{
  return self->_db != 0;
}

- (void)accessDatabaseUsingBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (self->_db) {
    v4[2]();
  }
}

- (id)getLastErrorWithResultCode:(int)a3
{
  unint64_t db = self->_db;
  if (db)
  {
    sub_10004B248(db, a3);
    unint64_t db = (sqlite3 *)objc_claimAutoreleasedReturnValue();
  }

  return db;
}

- (BOOL)performTransaction:(id *)a3 usingBlock:(id)a4
{
  return [(PDSQLiteDatabase *)self performTransactionWithType:0 error:a3 usingBlock:a4];
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4
{
  return [(PDSQLiteDatabase *)self executeSQL:a3 error:a4 bindingHandler:0 enumerationHandler:0];
}

- (BOOL)executeSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5
{
  return [(PDSQLiteDatabase *)self executeSQL:a3 error:a4 bindingHandler:a5 enumerationHandler:0];
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4 bindingHandler:(id)a5 enumerationHandler:(id)a6
{
  return [(PDSQLiteDatabase *)self _executeSQL:a3 cache:0 error:a4 bindingHandler:a5 enumerationHandler:a6];
}

- (BOOL)executeUncachedSQL:(id)a3 error:(id *)a4
{
  return [(PDSQLiteDatabase *)self executeUncachedSQL:a3 error:a4 bindingHandler:0 enumerationHandler:0];
}

- (BOOL)setUserVersion:(int64_t)a3 error:(id *)a4
{
  return [(PDSQLiteDatabase *)self setUserVersion:a3 withDatabaseName:&stru_1001F6580 error:a4];
}

- (int64_t)userVersion:(id *)a3
{
  return [(PDSQLiteDatabase *)self userVersionWithDatabaseName:&stru_1001F6580 error:a3];
}

- (BOOL)setUserVersion:(int64_t)a3 withDatabaseName:(id)a4 error:(id *)a5
{
  return [(PDSQLiteDatabase *)self _setPragma:@"user_version" integerValue:a3 withDatabaseName:a4 error:a5];
}

- (int64_t)userVersionWithDatabaseName:(id)a3 error:(id *)a4
{
  int64_t v5 = -1;
  [(PDSQLiteDatabase *)self _integerValueForPragma:@"user_version" databaseName:a3 value:&v5 error:a4];
  return v5;
}

- (id)lastInsertRowID
{
  sqlite3_int64 insert_rowid = sqlite3_last_insert_rowid(self->_db);

  return +[NSNumber numberWithLongLong:insert_rowid];
}

- (BOOL)_setPragma:(id)a3 integerValue:(int64_t)a4 withDatabaseName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  int v11 = sub_100003970(a5);
  id v12 = +[NSString stringWithFormat:@"PRAGMA %@%@=%lld", v11, v10, a4];

  LOBYTE(a6) = [(PDSQLiteDatabase *)self _executeSQL:v12 error:a6];
  return (char)a6;
}

- (void)onCommit:(id)a3 orRollback:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (!self->_isHandlingTransactionEnd)
  {
    if (v16)
    {
      onCommitBlocks = self->_onCommitBlocks;
      unint64_t v8 = v16;
      if (!onCommitBlocks)
      {
        CFStringRef v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        id v10 = self->_onCommitBlocks;
        self->_onCommitBlocks = v9;

        onCommitBlocks = self->_onCommitBlocks;
        unint64_t v8 = v16;
      }
      id v11 = objc_retainBlock(v8);
      [(NSMutableArray *)onCommitBlocks addObject:v11];
    }
    if (v6)
    {
      onRollbackBlocks = self->_onRollbackBlocks;
      if (!onRollbackBlocks)
      {
        uint64_t v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        CFStringRef v14 = self->_onRollbackBlocks;
        self->_onRollbackBlocks = v13;

        onRollbackBlocks = self->_onRollbackBlocks;
      }
      id v15 = objc_retainBlock(v6);
      [(NSMutableArray *)onRollbackBlocks addObject:v15];
    }
  }
}

- (void)requireRollback
{
  if (self->_isInTransaction) {
    self->_requiresRollback = 1;
  }
}

- (void)performUpdateBlock:(id)a3 changeType:(int64_t)a4
{
  id v7 = a3;
  id updateBlock = (void (**)(id, id, int64_t))self->_updateBlock;
  if (updateBlock) {
    updateBlock[2](updateBlock, v7, a4);
  }
}

- (BOOL)validateForeignKeysForTable:(id)a3 databaseName:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_100003970(v9);
  if (v8) {
    +[NSString stringWithFormat:@"PRAGMA %@foreign_key_check(%@)", v10, v8];
  }
  else {
  id v11 = +[NSString stringWithFormat:@"PRAGMA %@foreign_key_check", v10];
  }

  uint64_t v17 = 0;
  int v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10004BB48;
  v16[3] = &unk_1001F2DE8;
  v16[4] = &v17;
  if ([(PDSQLiteDatabase *)self _executeSQL:v11 cache:0 error:a5 bindingHandler:0 enumerationHandler:v16])
  {
    BOOL v12 = *((unsigned char *)v18 + 24) == 0;
  }
  else
  {
    CLSInitLog();
    uint64_t v13 = CLSLogDatabase;
    if (os_log_type_enabled(CLSLogDatabase, OS_LOG_TYPE_ERROR))
    {
      id v15 = *a5;
      *(_DWORD *)buf = 138543362;
      id v22 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to validate foreign keys: %{public}@", buf, 0xCu);
    }
    BOOL v12 = 0;
  }
  _Block_object_dispose(&v17, 8);

  return v12;
}

- (BOOL)incrementalVacuumDatabaseIfNeeded:(id)a3 error:(id *)a4
{
  id v6 = (__CFString *)a3;
  uint64_t v12 = 0;
  if (![(PDSQLiteDatabase *)self _integerValueForPragma:@"FREELIST_COUNT" databaseName:v6 value:&v12 error:a4])goto LABEL_8; {
  if (!v12)
  }
  {
LABEL_9:
    BOOL v9 = 1;
    goto LABEL_10;
  }
  uint64_t v11 = 0;
  if (![(PDSQLiteDatabase *)self _integerValueForPragma:@"PAGE_SIZE" databaseName:v6 value:&v11 error:a4])
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  if (v12 <= 0x200000 / v11) {
    goto LABEL_9;
  }
  CFStringRef v7 = @"main";
  if (v6) {
    CFStringRef v7 = v6;
  }
  id v8 = +[NSString stringWithFormat:@"PRAGMA %@.incremental_vacuum(%lld)", v7, v12 - 0x200000 / v11];
  BOOL v9 = [(PDSQLiteDatabase *)self _executeSQL:v8 error:a4];

LABEL_10:
  return v9;
}

- (BOOL)attachDatabaseWithName:(id)a3 fileURL:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (![v8 length]) {
    +[NSException raise:NSInvalidArgumentException format:@"Invalid database name"];
  }
  if (([v9 isFileURL] & 1) == 0) {
    +[NSException raise:NSInvalidArgumentException format:@"Invalid database URL"];
  }
  attachedDatabaseURLsByName = self->_attachedDatabaseURLsByName;
  if (attachedDatabaseURLsByName)
  {
    uint64_t v11 = [(NSMutableDictionary *)attachedDatabaseURLsByName objectForKeyedSubscript:v8];
    uint64_t v12 = v11;
    if (v11)
    {
      LOBYTE(v13) = [v11 isEqual:v9];
      if (v13)
      {
        id v14 = 0;
      }
      else
      {
        id v14 = +[NSError errorWithDomain:@"com.apple.progressd.SQLite" code:2 userInfo:0];
      }

      if (!a5) {
        goto LABEL_14;
      }
LABEL_13:
      *a5 = v14;
      goto LABEL_14;
    }
  }
  else
  {
    id v15 = +[NSMutableDictionary dictionary];
    id v16 = self->_attachedDatabaseURLsByName;
    self->_attachedDatabaseURLsByName = v15;
  }
  id v17 = v9;
  int v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ATTACH DATABASE \"%s\" AS %@", [v17 fileSystemRepresentation], v8);
  id v20 = 0;
  unsigned int v13 = [(PDSQLiteDatabase *)self _executeSQL:v18 error:&v20 retryIfBusy:1];
  id v14 = v20;
  if (v13) {
    [(NSMutableDictionary *)self->_attachedDatabaseURLsByName setObject:v17 forKeyedSubscript:v8];
  }

  if (a5) {
    goto LABEL_13;
  }
LABEL_14:

  return v13;
}

- (BOOL)detachDatabaseWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PDSQLiteDatabase *)self isDatabaseWithNameAttached:v6])
  {
    CFStringRef v7 = +[NSString stringWithFormat:@"DETACH DATABASE %@", v6];
    BOOL v8 = [(PDSQLiteDatabase *)self _executeSQL:v7 error:a4];
    if (v8) {
      [(NSMutableDictionary *)self->_attachedDatabaseURLsByName removeObjectForKey:v6];
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)isDatabaseWithNameAttached:(id)a3
{
  objc_super v3 = [(NSMutableDictionary *)self->_attachedDatabaseURLsByName objectForKeyedSubscript:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)tableWithName:(id)a3 containsColumnWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_db && [v6 length] && objc_msgSend(v7, "length"))
  {
    BOOL v8 = [v6 stringByAppendingFormat:@".%@", v7];
    id v9 = [(NSMutableDictionary *)self->_tableColumnNameCache objectForKey:v8];
    id v10 = v9;
    if (v9)
    {
      LOBYTE(v11) = [v9 BOOLValue];
    }
    else
    {
      uint64_t v11 = sqlite3_table_column_metadata(self->_db, 0, (const char *)[v6 UTF8String], (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 0, 0, 0, 0, 0) == 0;
      tableColumnNameCache = self->_tableColumnNameCache;
      unsigned int v13 = +[NSNumber numberWithBool:v11];
      [(NSMutableDictionary *)tableColumnNameCache setObject:v13 forKey:v8];
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_tableColumnNameCache, 0);
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_onRollbackBlocks, 0);
  objc_storeStrong((id *)&self->_onCommitBlocks, 0);
  next = self->_activeStatements.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      BOOL v4 = (void *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  unint64_t value = self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_;
  self->_activeStatements.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }

  objc_storeStrong((id *)&self->_attachedDatabaseURLsByName, 0);
}

@end