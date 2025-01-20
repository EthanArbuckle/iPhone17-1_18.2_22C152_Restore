@interface SGSqliteDatabase
+ (BOOL)isInMemoryPath:(id)a3;
+ (SGSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4;
+ (id)corruptionMarkerFilename;
+ (id)corruptionMarkerPathForPath:(id)a3;
+ (id)inMemoryPath;
+ (id)randomlyNamedInMemoryPathWithBaseName:(id)a3;
+ (id)sqliteDatabaseInMemoryWithError:(id *)a3;
+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 double:(double)a5;
+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 int64:(int64_t)a5;
+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 int:(int)a5;
+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 nsdata:(id)a5;
+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 nsstring:(id)a5;
+ (int)bindParamToNull:(sqlite3_stmt *)a3 name:(const char *)a4;
+ (void)truncateDatabaseAtPath:(id)a3;
- (BOOL)_abortDueToSqliteError:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_ABORT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_ABORT_ROLLBACK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_AUTH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_AUTH_USER:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_BUSY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_BUSY_RECOVERY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_BUSY_SNAPSHOT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CANTOPEN:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CANTOPEN_CONVPATH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CANTOPEN_FULLPATH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CANTOPEN_ISDIR:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CANTOPEN_NOTEMPDIR:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_CHECK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_COMMITHOOK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_FOREIGNKEY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_FUNCTION:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_NOTNULL:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_PRIMARYKEY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_ROWID:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_TRIGGER:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_UNIQUE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CONSTRAINT_VTAB:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CORRUPT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_CORRUPT_VTAB:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_EMPTY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_ERROR:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_FORMAT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_FULL:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_INTERNAL:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_INTERRUPT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_ACCESS:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_AUTH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_BLOCKED:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_CLOSE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_CONVPATH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_DELETE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_DELETE_NOENT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_DIR_CLOSE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_DIR_FSYNC:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_FSTAT:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_FSYNC:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_GETTEMPPATH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_LOCK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_MMAP:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_NOMEM:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_RDLOCK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_READ:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_SEEK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_SHMLOCK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_SHMMAP:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_SHMOPEN:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_SHMSIZE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_SHORT_READ:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_TRUNCATE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_UNLOCK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_VNODE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_IOERR_WRITE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_LOCKED:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_LOCKED_SHAREDCACHE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_MISMATCH:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_MISUSE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOLFS:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOMEM:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOTADB:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOTFOUND:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOTICE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_NOTICE_RECOVER_WAL:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_PERM:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_PROTOCOL:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_RANGE:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_READONLY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_READONLY_CANTLOCK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_READONLY_DBMOVED:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_READONLY_RECOVERY:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_READONLY_ROLLBACK:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_SCHEMA:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_TOOBIG:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_WARNING:(id)a3 onError:(id)a4;
- (BOOL)_handle_SQLITE_WARNING_AUTOINDEX:(id)a3 onError:(id)a4;
- (BOOL)_handle_UNKNOWN_ERROR:(id)a3 onError:(id)a4;
- (BOOL)_handle_sqlite_error_code:(int)a3 error:(id)a4 onError:(id)a5;
- (BOOL)_prepQuery:(id)a3 onPrep:(id)a4 onError:(id)a5;
- (BOOL)createSnapshot:(id)a3;
- (BOOL)frailReadTransaction:(id)a3;
- (BOOL)frailWriteTransaction:(id)a3;
- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6;
- (BOOL)hasColumnOnTable:(id)a3 named:(id)a4;
- (BOOL)hasIndexNamed:(id)a3;
- (BOOL)hasTableNamed:(id)a3;
- (BOOL)isInMemory;
- (BOOL)prepAndRunNonDataQueries:(id)a3 onError:(id)a4;
- (BOOL)prepAndRunQuery:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6;
- (BOOL)prepAndRunSQL:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6;
- (BOOL)runQuery:(id)a3 onRow:(id)a4 onError:(id)a5;
- (BOOL)setUserVersion:(unsigned int)a3;
- (NSString)filename;
- (SGSqliteDatabase)initWithFilename:(id)a3 withProtection:(BOOL)a4 sharedLock:(id)a5 error:(id *)a6;
- (id)corruptionMarkerPath;
- (id)dbErrorWithCode:(unint64_t)a3 sqliteReturnValue:(int)a4 lastErrno:(int)a5 query:(id)a6;
- (id)description;
- (id)freeSpace;
- (id)languageForFTSTable:(id)a3;
- (id)selectColumns:(id)a3 fromTable:(id)a4 whereClause:(id)a5 onPrep:(id)a6 onError:(id)a7;
- (id)tablesWithColumnNamed:(id)a3;
- (int64_t)lastInsertRowId;
- (int64_t)maxIdForTable:(id)a3;
- (sqlite3)handle;
- (unint64_t)_pagesToVacuum;
- (unint64_t)freelistCount;
- (unint64_t)numberOfRowsInTable:(id)a3;
- (unint64_t)pageCount;
- (unint64_t)vacuumMode;
- (unsigned)userVersion;
- (void)_prepAndRunQuery:(id)a3 columns:(id)a4 dictionary:(id)a5 onError:(id)a6;
- (void)closePermanently;
- (void)insertOrReplaceIntoTable:(id)a3 dictionary:(id)a4 onError:(id)a5;
- (void)optimize:(unint64_t)a3;
- (void)performIntegrityCheck;
- (void)placeCorruptionMarker;
- (void)readTransaction:(id)a3;
- (void)runWithWriteLockAcquired:(id)a3;
- (void)updateTable:(id)a3 dictionary:(id)a4 whereClause:(id)a5 onError:(id)a6;
- (void)vacuum;
- (void)writeTransaction:(id)a3;
@end

@implementation SGSqliteDatabase

- (BOOL)runQuery:(id)a3 onRow:(id)a4 onError:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = mach_absolute_time();
  sharedWriterLock = self->_sharedWriterLock;
  if (sharedWriterLock)
  {
    if (![(SGSqliteDatabaseSharedLock *)sharedWriterLock writeTransactionDepth])
    {
      id v13 = v8;
      if (!sqlite3_stmt_readonly((sqlite3_stmt *)[v13 stmt]))
      {
        v14 = sgLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          int v26 = 136315138;
          double v27 = COERCE_DOUBLE(sqlite3_sql((sqlite3_stmt *)[v13 stmt]));
          _os_log_fault_impl(&dword_1CA650000, v14, OS_LOG_TYPE_FAULT, "Write statement should be run in a write transaction: %s", (uint8_t *)&v26, 0xCu);
        }

        if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
          abort();
        }
      }
    }
  }
  char v15 = [(SGSqliteDatabaseImpl *)self->_impl runQuery:v8 onRow:v9 onError:v10];
  unint64_t lastBusyWaitEnded = self->_lastBusyWaitEnded;
  if (runQuery_onRow_onError__onceToken != -1) {
    dispatch_once(&runQuery_onRow_onError__onceToken, &__block_literal_global_101_15872);
  }
  unint64_t v17 = lastBusyWaitEnded - v11;
  if (lastBusyWaitEnded < v11) {
    unint64_t v17 = 0;
  }
  double v18 = (double)(v17 * runQuery_onRow_onError__machTimebaseInfo / *(unsigned int *)algn_1EB9F013C)
      / 1000000000.0;
  if (v18 > 0.5 && os_variant_has_internal_diagnostics())
  {
    v19 = sqlite3_sql((sqlite3_stmt *)[v8 stmt]);
    v20 = sgLogHandle();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
    if (v19)
    {
      if (v21)
      {
        int v26 = 134218242;
        double v27 = v18 * 1000.0;
        __int16 v28 = 2080;
        v29 = v19;
        v22 = "This query was delayed %0.2f ms waiting for db file locked by another sqlite connection: %s";
        v23 = v20;
        uint32_t v24 = 22;
LABEL_18:
        _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v26, v24);
      }
    }
    else if (v21)
    {
      int v26 = 134217984;
      double v27 = v18 * 1000.0;
      v22 = "This query was delayed %0.2f ms waiting for db file locked by another sqlite connection -- unknown SQL";
      v23 = v20;
      uint32_t v24 = 12;
      goto LABEL_18;
    }
  }
  return v15;
}

void __55__SGSqliteDatabase_prepAndRunSQL_onPrep_onRow_onError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  if (v4)
  {
    (*(void (**)(void))(v4 + 16))();
    id v3 = v5;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) runQuery:v3 onRow:*(void *)(a1 + 48) onError:*(void *)(a1 + 56)];
}

- (BOOL)prepAndRunSQL:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v14 = (void *)MEMORY[0x1CB79B230]();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __55__SGSqliteDatabase_prepAndRunSQL_onPrep_onRow_onError___block_invoke;
  v19[3] = &unk_1E65B8780;
  id v15 = v11;
  v23 = &v24;
  v19[4] = self;
  id v20 = v15;
  id v16 = v12;
  id v21 = v16;
  id v17 = v13;
  id v22 = v17;
  [(SGSqliteDatabase *)self _prepQuery:v10 onPrep:v19 onError:v17];

  LOBYTE(self) = *((unsigned char *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return (char)self;
}

- (BOOL)_prepQuery:(id)a3 onPrep:(id)a4 onError:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"SGSqliteDatabase.m", 668, @"Invalid parameter not satisfying: %@", @"query" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
LABEL_5:
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"SGSqliteDatabase.m", 669, @"Invalid parameter not satisfying: %@", @"onPrep" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v10) {
    goto LABEL_5;
  }
LABEL_3:
  char v12 = [(SGSqliteDatabaseImpl *)self->_impl prepQuery:v9 onPrep:v10 onError:v11];

  return v12;
}

- (void)readTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedWriterLock, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

- (void)optimize:(unint64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __29__SGSqliteDatabase_optimize___block_invoke;
  v3[3] = &unk_1E65BF9C0;
  v3[4] = self;
  v3[5] = a3;
  [(SGSqliteDatabase *)self runWithWriteLockAcquired:v3];
}

void __29__SGSqliteDatabase_optimize___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1CB79B230]();
  id v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA optimize(%llX)", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) prepAndRunSQL:v3 onPrep:0 onRow:0 onError:0];
}

- (void)vacuum
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self->_usesDataProtection && [MEMORY[0x1E4F93B10] lockState] - 1 <= 1)
  {
    id v3 = sgLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "Will not vacuum db %@ due to device lock state", (uint8_t *)&buf, 0xCu);
    }

    return;
  }
  unint64_t v4 = [(SGSqliteDatabase *)self _pagesToVacuum];
  id v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "Called to vacuum %tu pages", (uint8_t *)&buf, 0xCu);
  }

  if (v4)
  {
    unint64_t v6 = [(SGSqliteDatabase *)self vacuumMode];
    unint64_t v7 = v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__15751;
      v41 = __Block_byref_object_dispose__15752;
      id v42 = 0;
      if (v6 == 2) {
        goto LABEL_11;
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __26__SGSqliteDatabase_vacuum__block_invoke;
      v33[3] = &unk_1E65C0728;
      v33[4] = self;
      v33[5] = &buf;
      [(SGSqliteDatabase *)self runWithWriteLockAcquired:v33];
      if (!*(void *)(*((void *)&buf + 1) + 40))
      {
        if (v7)
        {
LABEL_11:
          id v8 = sgLogHandle();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            id v9 = [NSNumber numberWithUnsignedInteger:(v4 + 499) / 0x1F4];
            *(_DWORD *)v34 = 134218498;
            v35 = (SGSqliteDatabase *)v4;
            __int16 v36 = 2112;
            *(void *)v37 = v9;
            *(_WORD *)&v37[8] = 2112;
            *(void *)&v37[10] = self;
            _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "performing INCREMENTAL VACUUM to free %lu pages with %@ iterations for db: %@", v34, 0x20u);
          }
          if (v4 + 499 >= 0x1F4)
          {
            uint64_t v10 = 0;
            if ((v4 + 499) / 0x1F4 <= 1) {
              unint64_t v11 = 1;
            }
            else {
              unint64_t v11 = (v4 + 499) / 0x1F4;
            }
            unint64_t v29 = v11;
            unint64_t v12 = v4;
            while (1)
            {
              if (v12 >= 0x1F4) {
                uint64_t v13 = 500;
              }
              else {
                uint64_t v13 = v12;
              }
              v14 = sgLogHandle();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v34 = 134218496;
                v35 = (SGSqliteDatabase *)v13;
                __int16 v36 = 1024;
                *(_DWORD *)v37 = v10;
                *(_WORD *)&v37[4] = 2048;
                *(void *)&v37[6] = v4;
                _os_log_impl(&dword_1CA650000, v14, OS_LOG_TYPE_INFO, "Performing incremental vacuum for %tu pages on iteration %d for total pages to free %tu", v34, 0x1Cu);
              }

              id v15 = objc_msgSend([NSString alloc], "initWithFormat:", @"PRAGMA incremental_vacuum(%lu)", v13);
              v30[0] = MEMORY[0x1E4F143A8];
              v30[1] = 3221225472;
              v30[2] = __26__SGSqliteDatabase_vacuum__block_invoke_200;
              v30[3] = &unk_1E65BFD88;
              v30[4] = self;
              id v16 = v15;
              id v31 = v16;
              [(SGSqliteDatabase *)self runWithWriteLockAcquired:v30];
              id v17 = +[SGXPCActivityManager sharedInstance];
              double v18 = [v17 activityForActivityId:1];

              v12 -= v13;
              if (v18)
              {
                xpc_activity_state_t state = xpc_activity_get_state(v18);
                id v20 = sgLogHandle();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  id v21 = [NSNumber numberWithLong:state];
                  id v22 = [NSNumber numberWithInt:v10];
                  *(_DWORD *)v34 = 138412802;
                  v35 = (SGSqliteDatabase *)v18;
                  __int16 v36 = 2112;
                  *(void *)v37 = v21;
                  *(_WORD *)&v37[8] = 2112;
                  *(void *)&v37[10] = v22;
                  _os_log_impl(&dword_1CA650000, v20, OS_LOG_TYPE_INFO, "We have a vacuum activity %@ with activity state %@ after %@ batches", v34, 0x20u);
                }
                if (xpc_activity_should_defer(v18)) {
                  break;
                }
              }

              if (v29 == ++v10) {
                goto LABEL_37;
              }
            }
            BOOL v24 = xpc_activity_set_state(v18, 3);
            v25 = sgLogHandle();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v26 = [NSNumber numberWithInt:v10];
              char v27 = [NSNumber numberWithUnsignedInteger:v4 - v12];
              __int16 v28 = [NSNumber numberWithBool:v24];
              *(_DWORD *)v34 = 138412802;
              v35 = v26;
              __int16 v36 = 2112;
              *(void *)v37 = v27;
              *(_WORD *)&v37[8] = 2112;
              *(void *)&v37[10] = v28;
              _os_log_impl(&dword_1CA650000, v25, OS_LOG_TYPE_DEFAULT, "We got back that we should defer the vacuuming activity after %@ iterations and having vacuumed %@ pages with deferral success %@", v34, 0x20u);
            }
          }
          goto LABEL_37;
        }
        v23 = sgLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v34 = 138412290;
          v35 = self;
          _os_log_impl(&dword_1CA650000, v23, OS_LOG_TYPE_INFO, "performing FULL VACUUM to make INCREMENTAL effected for db: %@", v34, 0xCu);
        }

        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __26__SGSqliteDatabase_vacuum__block_invoke_192;
        v32[3] = &unk_1E65BEF88;
        v32[4] = self;
        [(SGSqliteDatabase *)self runWithWriteLockAcquired:v32];
      }
LABEL_37:
      _Block_object_dispose(&buf, 8);
    }
  }
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__SGSqliteDatabase_vacuum__block_invoke_2;
  v2[3] = &unk_1E65C0610;
  return [*(id *)(a1 + 32) prepAndRunSQL:@"PRAGMA auto_vacuum=2" onPrep:0 onRow:0 onError:v2];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_192(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __26__SGSqliteDatabase_vacuum__block_invoke_2_196;
  v3[3] = &unk_1E65C0660;
  v3[4] = v1;
  return [v1 prepAndRunSQL:@"VACUUM" onPrep:0 onRow:0 onError:v3];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_200(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__SGSqliteDatabase_vacuum__block_invoke_2_201;
  v4[3] = &unk_1E65C0660;
  v4[4] = v2;
  return [v2 prepAndRunSQL:v1 onPrep:0 onRow:0 onError:v4];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_2_201(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "failed to incremental vacuum db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_2_196(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "failed to vacuum db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E4F93C10];
}

uint64_t __26__SGSqliteDatabase_vacuum__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEFAULT, "failed to set auto_vacuum to INCREMENTAL for db: %@. error: %@", (uint8_t *)&v8, 0x16u);
  }

  return *MEMORY[0x1E4F93C10];
}

- (unint64_t)vacuumMode
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __30__SGSqliteDatabase_vacuumMode__block_invoke;
  v5[3] = &unk_1E65C03F8;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__SGSqliteDatabase_vacuumMode__block_invoke_2;
  v4[3] = &unk_1E65C0610;
  v4[4] = self;
  void v4[5] = &v6;
  [(SGSqliteDatabase *)self prepAndRunSQL:@"PRAGMA auto_vacuum" onPrep:0 onRow:v5 onError:v4];
  unint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __30__SGSqliteDatabase_vacuumMode__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __30__SGSqliteDatabase_vacuumMode__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  id v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "failed to get auto-vacuum mode from db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  return *MEMORY[0x1E4F93C10];
}

- (unint64_t)_pagesToVacuum
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(SGSqliteDatabase *)self pageCount];
  unint64_t v4 = [(SGSqliteDatabase *)self freelistCount];
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 134218240;
    unint64_t v9 = v3;
    __int16 v10 = 2048;
    unint64_t v11 = v4;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "Calculating pages to vacuum -- pageCount %tu freeCount %tu", (uint8_t *)&v8, 0x16u);
  }

  unint64_t result = 0;
  if (v4)
  {
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t result = 0;
      if (v3)
      {
        if (v3 != 0x7FFFFFFFFFFFFFFFLL)
        {
          if ((double)(v3 - v4) / (double)v3 <= 0.85 || v4 > 0x3FF)
          {
            return (unint64_t)((double)v4 * 0.8);
          }
          else
          {
            int v7 = sgLogHandle();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            {
              int v8 = 134218240;
              unint64_t v9 = v3;
              __int16 v10 = 2048;
              unint64_t v11 = v4;
              _os_log_impl(&dword_1CA650000, v7, OS_LOG_TYPE_INFO, "not enough pages to vacuum: pageCount: %lu; freeCount: %lu",
                (uint8_t *)&v8,
                0x16u);
            }

            return 0;
          }
        }
      }
    }
  }
  return result;
}

- (unint64_t)freelistCount
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SGSqliteDatabase_freelistCount__block_invoke;
  v5[3] = &unk_1E65C03F8;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__SGSqliteDatabase_freelistCount__block_invoke_2;
  v4[3] = &unk_1E65C0610;
  v4[4] = self;
  void v4[5] = &v6;
  [(SGSqliteDatabase *)self prepAndRunSQL:@"PRAGMA freelist_count" onPrep:0 onRow:v5 onError:v4];
  unint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __33__SGSqliteDatabase_freelistCount__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __33__SGSqliteDatabase_freelistCount__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "failed to get freelist_count from db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  return *MEMORY[0x1E4F93C10];
}

- (unint64_t)pageCount
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __29__SGSqliteDatabase_pageCount__block_invoke;
  v5[3] = &unk_1E65C03F8;
  v5[4] = &v6;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__SGSqliteDatabase_pageCount__block_invoke_2;
  v4[3] = &unk_1E65C0610;
  v4[4] = self;
  void v4[5] = &v6;
  [(SGSqliteDatabase *)self prepAndRunSQL:@"PRAGMA page_count" onPrep:0 onRow:v5 onError:v4];
  unint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __29__SGSqliteDatabase_pageCount__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

uint64_t __29__SGSqliteDatabase_pageCount__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = sgLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_1CA650000, v4, OS_LOG_TYPE_DEFAULT, "failed to get page_count from db: %@. error: %@", (uint8_t *)&v7, 0x16u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  return *MEMORY[0x1E4F93C10];
}

- (void)performIntegrityCheck
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __41__SGSqliteDatabase_performIntegrityCheck__block_invoke_2;
  v2[3] = &unk_1E65C0660;
  void v2[4] = self;
  [(SGSqliteDatabase *)self prepAndRunSQL:@"PRAGMA integrity_check" onPrep:0 onRow:&__block_literal_global_168 onError:v2];
}

uint64_t __41__SGSqliteDatabase_performIntegrityCheck__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)NSString;
  id v4 = a2;
  uint64_t v5 = (void *)[[v3 alloc] initWithFormat:@"Error: failed to run integrity_check on %@: %@", *(void *)(a1 + 32), v4];

  id v6 = v5;
  puts((const char *)[v6 UTF8String]);

  return *MEMORY[0x1E4F93C10];
}

uint64_t __41__SGSqliteDatabase_performIntegrityCheck__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v2 = [a2 getNSStringForColumn:0];
  id v3 = (id) [[NSString alloc] initWithFormat:@"%@", v2];
  puts((const char *)[v3 UTF8String]);

  id v4 = (unsigned __int8 *)MEMORY[0x1E4F93C08];
  return *v4;
}

- (id)languageForFTSTable:(id)a3
{
  return (id)[(SGSqliteDatabaseImpl *)self->_impl languageForFTSTable:a3];
}

- (unint64_t)numberOfRowsInTable:(id)a3
{
  return [(SGSqliteDatabaseImpl *)self->_impl numberOfRowsInTable:a3];
}

- (BOOL)hasIndexNamed:(id)a3
{
  return [(SGSqliteDatabaseImpl *)self->_impl hasIndexNamed:a3];
}

- (BOOL)hasColumnOnTable:(id)a3 named:(id)a4
{
  return [(SGSqliteDatabaseImpl *)self->_impl hasColumnOnTable:a3 named:a4];
}

- (id)tablesWithColumnNamed:(id)a3
{
  return (id)[(SGSqliteDatabaseImpl *)self->_impl tablesWithColumnNamed:a3];
}

- (BOOL)hasTableNamed:(id)a3
{
  return [(SGSqliteDatabaseImpl *)self->_impl hasTableNamed:a3];
}

- (int64_t)maxIdForTable:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __34__SGSqliteDatabase_maxIdForTable___block_invoke;
  v9[3] = &unk_1E65C0388;
  id v5 = v4;
  id v10 = v5;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__SGSqliteDatabase_maxIdForTable___block_invoke_2;
  v8[3] = &unk_1E65C03F8;
  v8[4] = &v11;
  [(SGSqliteDatabase *)self prepAndRunSQL:@"SELECT seq FROM sqlite_sequence WHERE name = :tableName" onPrep:v9 onRow:v8 onError:0];
  int64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __34__SGSqliteDatabase_maxIdForTable___block_invoke(uint64_t a1, void *a2)
{
  return [a2 bindNamedParam:":tableName" toNSString:*(void *)(a1 + 32)];
}

uint64_t __34__SGSqliteDatabase_maxIdForTable___block_invoke_2(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 getIntegerForColumn:0];
  return *MEMORY[0x1E4F93C10];
}

- (BOOL)setUserVersion:(unsigned int)a3
{
  return [(SGSqliteDatabaseImpl *)self->_impl setUserVersion:*(void *)&a3];
}

- (unsigned)userVersion
{
  return [(SGSqliteDatabaseImpl *)self->_impl userVersion];
}

- (BOOL)createSnapshot:(id)a3
{
  return [(SGSqliteDatabaseImpl *)self->_impl createSnapshot:a3];
}

- (id)description
{
  id v3 = [NSString alloc];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(SGSqliteDatabaseImpl *)self->_impl filename];
  int v7 = (void *)[v3 initWithFormat:@"[%@: %@ <%p>]", v5, v6, -[SGSqliteDatabaseImpl handle](self->_impl, "handle")];

  return v7;
}

- (BOOL)frailReadTransaction:(id)a3
{
  return [(SGSqliteDatabaseImpl *)self->_impl frailReadTransaction:a3];
}

- (BOOL)frailWriteTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SGSqliteDatabase_frailWriteTransaction___block_invoke;
  v7[3] = &unk_1E65B8DB0;
  __int16 v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(SGSqliteDatabase *)self runWithWriteLockAcquired:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __42__SGSqliteDatabase_frailWriteTransaction___block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 8) frailWriteTransaction:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)writeTransaction:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__SGSqliteDatabase_writeTransaction___block_invoke;
  v6[3] = &unk_1E65C0440;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SGSqliteDatabase *)self runWithWriteLockAcquired:v6];
}

uint64_t __37__SGSqliteDatabase_writeTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) writeTransaction:*(void *)(a1 + 40)];
}

- (id)selectColumns:(id)a3 fromTable:(id)a4 whereClause:(id)a5 onPrep:(id)a6 onError:(id)a7
{
  return (id)[(SGSqliteDatabaseImpl *)self->_impl selectColumns:a3 fromTable:a4 whereClause:a5 onPrep:a6 onError:a7];
}

- (void)insertOrReplaceIntoTable:(id)a3 dictionary:(id)a4 onError:(id)a5
{
  id v19 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v12 = [v9 allKeys];
  if (![v12 count])
  {
    double v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"SGSqliteDatabase.m" lineNumber:785 description:@"insertOrReplaceIntoTable:dictionary: requires nonempty dictionary"];
  }
  char v13 = (void *)MEMORY[0x1CB79B230]();
  id v14 = [NSString alloc];
  id v15 = objc_msgSend(v12, "_pas_componentsJoinedByString:", @",");
  id v16 = qmarksSeparatedByCommas([v12 count]);
  id v17 = (void *)[v14 initWithFormat:@"INSERT OR REPLACE INTO %@ (%@) VALUES (%@)", v19, v15, v16];

  [(SGSqliteDatabase *)self _prepAndRunQuery:v17 columns:v12 dictionary:v9 onError:v10];
}

- (void)updateTable:(id)a3 dictionary:(id)a4 whereClause:(id)a5 onError:(id)a6
{
  id v24 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)MEMORY[0x1CB79B230]();
  id v15 = [v11 allKeys];
  if (![v15 count])
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2 object:self file:@"SGSqliteDatabase.m" lineNumber:772 description:@"updateTable:dictionary:whereClause: requires nonempty dictionary"];
  }
  id v16 = (void *)MEMORY[0x1CB79B230]();
  id v17 = [NSString alloc];
  double v18 = objc_msgSend(v15, "_pas_componentsJoinedByString:", @"=?,");
  uint64_t v19 = [v18 stringByAppendingString:@"=?"];
  id v20 = (void *)v19;
  if (v12)
  {
    id v21 = [@" WHERE " stringByAppendingString:v12];
    id v22 = (void *)[v17 initWithFormat:@"UPDATE %@ SET %@%@", v24, v20, v21];
  }
  else
  {
    id v22 = (void *)[v17 initWithFormat:@"UPDATE %@ SET %@%@", v24, v19, &stru_1F24EEF20];
  }

  [(SGSqliteDatabase *)self _prepAndRunQuery:v22 columns:v15 dictionary:v11 onError:v13];
}

- (BOOL)prepAndRunNonDataQueries:(id)a3 onError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!-[SGSqliteDatabase prepAndRunSQL:onPrep:onRow:onError:](self, "prepAndRunSQL:onPrep:onRow:onError:", *(void *)(*((void *)&v15 + 1) + 8 * i), 0, 0, v7, (void)v15))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (void)_prepAndRunQuery:(id)a3 columns:(id)a4 dictionary:(id)a5 onError:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __64__SGSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke;
  v14[3] = &unk_1E65BFF28;
  id v15 = v10;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  [(SGSqliteDatabase *)self prepAndRunSQL:a3 onPrep:v14 onRow:0 onError:a6];
}

void __64__SGSqliteDatabase__prepAndRunQuery_columns_dictionary_onError___block_invoke(uint64_t a1, void *a2)
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = (void *)MEMORY[0x1CB79B230]();
      id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
      id v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v6];
      id v8 = [MEMORY[0x1E4F1CA98] null];
      int v9 = [v7 isEqual:v8];

      if (v9)
      {
        [v3 bindParamToNull:++v4];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v3 bindParam:++v4 toNSString:v7];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v3 bindParam:++v4 toNSData:v7];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v10 = v7;
              id v11 = (const char *)[v10 objCType];
              if (!strcmp(v11, "d") || !strcmp(v11, "f")) {
                [v3 bindParam:++v4 toDoubleAsNSNumber:v10];
              }
              else {
                [v3 bindParam:++v4 toInt64AsNSNumber:v10];
              }
            }
            else
            {
              if (![v7 conformsToProtocol:&unk_1F2538780])
              {
                id v14 = (void *)MEMORY[0x1E4F1CA00];
                id v21 = @"type";
                id v15 = [(id)objc_opt_class() description];
                id v22 = v15;
                id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
                long long v17 = @"Could not insert this type into sqlite";
                goto LABEL_21;
              }
              id v20 = 0;
              id v12 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v20];
              id v13 = v20;
              if (v13)
              {
                id v18 = v13;
                id v14 = (void *)MEMORY[0x1E4F1CA00];
                v23[0] = @"type";
                id v15 = [(id)objc_opt_class() description];
                v23[1] = @"error";
                v24[0] = v15;
                v24[1] = v18;
                id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:2];
                long long v17 = @"Could not securely code this type into SQLite";
LABEL_21:
                id v19 = [v14 exceptionWithName:@"TypeError" reason:v17 userInfo:v16];

                objc_exception_throw(v19);
              }
              [v3 bindParam:++v4 toNSData:v12];
            }
          }
        }
      }
    }
    while ([*(id *)(a1 + 32) count] > v4);
  }
}

- (BOOL)prepAndRunQuery:(id)a3 onPrep:(id)a4 onRow:(id)a5 onError:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke;
  v17[3] = &unk_1E65BA898;
  id v18 = v10;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke_2;
  v15[3] = &unk_1E65B8758;
  id v16 = v11;
  id v12 = v11;
  id v13 = v10;
  LOBYTE(a6) = [(SGSqliteDatabase *)self prepAndRunSQL:a3 onPrep:v17 onRow:v15 onError:a6];

  return (char)a6;
}

uint64_t __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke(uint64_t result, id a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = [a2 stmt];
    unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
    return v4(v2, v3);
  }
  return result;
}

uint64_t __57__SGSqliteDatabase_prepAndRunQuery_onPrep_onRow_onError___block_invoke_2(uint64_t a1, id a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return *MEMORY[0x1E4F93C08];
  }
  uint64_t v3 = [a2 stmt];
  unint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __43__SGSqliteDatabase_runQuery_onRow_onError___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&runQuery_onRow_onError__machTimebaseInfo);
}

- (BOOL)isInMemory
{
  return [(SGSqliteDatabaseImpl *)self->_impl isInMemory];
}

- (NSString)filename
{
  return (NSString *)[(SGSqliteDatabaseImpl *)self->_impl filename];
}

- (sqlite3)handle
{
  unint64_t v4 = (sqlite3 *)[(SGSqliteDatabaseImpl *)self->_impl handle];
  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SGSqliteDatabase.m" lineNumber:619 description:@"sqlite handle unexpected nil"];
  }
  return v4;
}

- (int64_t)lastInsertRowId
{
  return [(SGSqliteDatabaseImpl *)self->_impl lastInsertRowId];
}

- (void)closePermanently
{
}

- (void)runWithWriteLockAcquired:(id)a3
{
  sharedWriterLock = self->_sharedWriterLock;
  if (sharedWriterLock) {
    [(SGSqliteDatabaseSharedLock *)sharedWriterLock runWithLockAcquired:a3];
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (SGSqliteDatabase)initWithFilename:(id)a3 withProtection:(BOOL)a4 sharedLock:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  if (!v11)
  {
    v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2, self, @"SGSqliteDatabase.m", 328, @"Invalid parameter not satisfying: %@", @"filename" object file lineNumber description];
  }
  v54.receiver = self;
  v54.super_class = (Class)SGSqliteDatabase;
  id v13 = [(SGSqliteDatabase *)&v54 init];
  p_isa = (id *)&v13->super.isa;
  if (!v13) {
    goto LABEL_46;
  }
  if (v8) {
    uint64_t v15 = 1376262;
  }
  else {
    uint64_t v15 = 3473414;
  }
  v13->_usesDataProtection = v8;
  id v16 = [[SGSqliteDatabaseImpl alloc] initWithFilename:v11 flags:v15 error:a6 sgDb:v13];
  id v17 = p_isa[1];
  p_isa[1] = v16;

  if (!p_isa[1]) {
    goto LABEL_34;
  }
  objc_storeStrong(p_isa + 3, a5);
  id v18 = (sqlite3 *)[p_isa[1] handle];
  if (sqlite3_db_config(v18, 1001, 0, 96, 64) == 5)
  {
    id v19 = sgLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_fault_impl(&dword_1CA650000, v19, OS_LOG_TYPE_FAULT, "Unable to change SQLite lookaside configuration.", buf, 2u);
    }

    if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
      abort();
    }
  }
  function_uint64_t v2 = sqlite3_create_function_v2(v18, "hasInhumanTag", 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))hasInhumanTag, 0, 0, 0);
  if (function_v2)
  {
    uint64_t v21 = function_v2;
    id v22 = sgLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      int v68 = v21;
      _os_log_error_impl(&dword_1CA650000, v22, OS_LOG_TYPE_ERROR, "Could not install hasInhumanTag() sqlite function (rc = %i)", buf, 8u);
    }

    if (a6)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      v65 = @"sqliteCode";
      id v24 = [NSNumber numberWithInt:v21];
      v66 = v24;
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v26 = &v66;
      char v27 = &v65;
LABEL_32:
      v37 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
      v38 = v23;
      uint64_t v39 = 5;
LABEL_33:
      *a6 = [v38 errorWithDomain:@"SGSqliteDatabaseError" code:v39 userInfo:v37];

LABEL_34:
      a6 = 0;
      goto LABEL_47;
    }
    goto LABEL_47;
  }
  uint64_t v28 = sqlite3_create_function_v2(v18, "tagsHaveEscapedTag", 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))tagsHaveEscapedTag, 0, 0, 0);
  if (!v28)
  {
    uint64_t v31 = sqlite3_create_function_v2(v18, "delimitedString", 2, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))delimitedString, 0, 0, 0);
    if (v31)
    {
      uint64_t v32 = v31;
      v33 = sgLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v68 = v32;
        _os_log_error_impl(&dword_1CA650000, v33, OS_LOG_TYPE_ERROR, "Could not install delimitedString() sqlite function (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        v61 = @"sqliteCode";
        id v24 = [NSNumber numberWithInt:v32];
        v62 = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v62;
        char v27 = &v61;
        goto LABEL_32;
      }
      goto LABEL_47;
    }
    uint64_t v34 = sqlite3_create_function_v2(v18, "firstStringAfterPrefix", 1, 2049, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))firstStringAfterPrefix, 0, 0, 0);
    if (v34)
    {
      uint64_t v35 = v34;
      __int16 v36 = sgLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v68 = v35;
        _os_log_error_impl(&dword_1CA650000, v36, OS_LOG_TYPE_ERROR, "Could not install firstStringAfterPrefix() sqlite function (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        v59 = @"sqliteCode";
        id v24 = [NSNumber numberWithInt:v35];
        v60 = v24;
        v25 = (void *)MEMORY[0x1E4F1C9E8];
        uint64_t v26 = &v60;
        char v27 = &v59;
        goto LABEL_32;
      }
      goto LABEL_47;
    }
    uint64_t busy = sqlite3_busy_timeout(v18, 300000);
    if (busy)
    {
      uint64_t v41 = busy;
      id v42 = sgLogHandle();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v68 = v41;
        _os_log_error_impl(&dword_1CA650000, v42, OS_LOG_TYPE_ERROR, "Sqlite could not install busy timeout. (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        uint64_t v43 = (void *)MEMORY[0x1E4F28C58];
        v57 = @"sqliteCode";
        id v24 = [NSNumber numberWithInt:v41];
        v58 = v24;
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        v38 = v43;
        uint64_t v39 = 2;
        goto LABEL_33;
      }
      goto LABEL_47;
    }
    uint64_t v44 = sqlite3_busy_handler(v18, (int (__cdecl *)(void *, int))wrappedBusyCallbackForTiming, p_isa);
    if (v44)
    {
      uint64_t v45 = v44;
      v46 = sgLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v68 = v45;
        _os_log_error_impl(&dword_1CA650000, v46, OS_LOG_TYPE_ERROR, "Sqlite could not install busy handler. (rc = %i)", buf, 8u);
      }

      if (a6)
      {
        v47 = (void *)MEMORY[0x1E4F28C58];
        v55 = @"sqliteCode";
        v48 = [NSNumber numberWithInt:v45];
        v56 = v48;
        v49 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
        *a6 = [v47 errorWithDomain:@"SGSqliteDatabaseError" code:6 userInfo:v49];

        goto LABEL_34;
      }
      goto LABEL_47;
    }
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __69__SGSqliteDatabase_initWithFilename_withProtection_sharedLock_error___block_invoke;
    v52[3] = &unk_1E65BEF88;
    v53 = p_isa;
    [v53 runWithWriteLockAcquired:v52];

LABEL_46:
    a6 = p_isa;
    goto LABEL_47;
  }
  uint64_t v29 = v28;
  uint64_t v30 = sgLogHandle();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 67109120;
    int v68 = v29;
    _os_log_error_impl(&dword_1CA650000, v30, OS_LOG_TYPE_ERROR, "Could not install tagsHaveEscapedTag() sqlite function (rc = %i)", buf, 8u);
  }

  if (a6)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    v63 = @"sqliteCode";
    id v24 = [NSNumber numberWithInt:v29];
    v64 = v24;
    v25 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v26 = &v64;
    char v27 = &v63;
    goto LABEL_32;
  }
LABEL_47:

  return (SGSqliteDatabase *)a6;
}

uint64_t __69__SGSqliteDatabase_initWithFilename_withProtection_sharedLock_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) prepAndRunSQL:@"PRAGMA auto_vacuum=INCREMENTAL" onPrep:0 onRow:0 onError:&__block_literal_global_15895];
}

uint64_t __69__SGSqliteDatabase_initWithFilename_withProtection_sharedLock_error___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEFAULT, "unable to set auto_vacuum to INCREMENTAL: %@", (uint8_t *)&v5, 0xCu);
  }

  return *MEMORY[0x1E4F93C10];
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 nsdata:(id)a5
{
  id v7 = a5;
  int v8 = _indexForBindParam(a3, (char *)a4);
  LODWORD(a4) = sqlite3_bind_nsdata(a3, v8, v7);

  return (int)a4;
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 nsstring:(id)a5
{
  id v7 = a5;
  int v8 = _indexForBindParam(a3, (char *)a4);
  id v9 = v7;
  id v10 = (const char *)[v9 UTF8String];

  return sqlite3_bind_text(a3, v8, v10, -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 double:(double)a5
{
  int v7 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_double(a3, v7, a5);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 int64:(int64_t)a5
{
  int v7 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_int64(a3, v7, a5);
}

+ (int)bindParam:(sqlite3_stmt *)a3 name:(const char *)a4 int:(int)a5
{
  int v7 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_int(a3, v7, a5);
}

+ (int)bindParamToNull:(sqlite3_stmt *)a3 name:(const char *)a4
{
  int v5 = _indexForBindParam(a3, (char *)a4);
  return sqlite3_bind_null(a3, v5);
}

+ (void)truncateDatabaseAtPath:(id)a3
{
}

+ (id)randomlyNamedInMemoryPathWithBaseName:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  int v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  int v7 = [@"file:" stringByAppendingString:v3];
  int v8 = [v7 stringByAppendingString:v6];
  id v9 = [v8 stringByAppendingString:@"?mode=memory&cache=shared"];

  return v9;
}

+ (id)inMemoryPath
{
  return @":memory:";
}

+ (BOOL)isInMemoryPath:(id)a3
{
  id v3 = a3;
  if ([v3 containsString:@":memory:"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 containsString:@"mode=memory"];
  }

  return v4;
}

+ (id)sqliteDatabaseInMemoryWithError:(id *)a3
{
  id v3 = [[SGSqliteDatabase alloc] initWithFilename:@":memory:" withProtection:0 sharedLock:0 error:a3];
  return v3;
}

+ (SGSqliteDatabase)sqliteDatabaseWithFilename:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [[SGSqliteDatabase alloc] initWithFilename:v5 withProtection:0 sharedLock:0 error:a4];

  return v6;
}

- (BOOL)_handle_sqlite_error_code:(int)a3 error:(id)a4 onError:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 > 530)
  {
    if (a3 > 2569)
    {
      if (a3 > 4873)
      {
        if (a3 > 6153)
        {
          if (a3 <= 6665)
          {
            if (a3 == 6154)
            {
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_MMAP:v8 onError:v9];
              goto LABEL_146;
            }
            if (a3 == 6410)
            {
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_GETTEMPPATH:v8 onError:v9];
              goto LABEL_146;
            }
          }
          else
          {
            switch(a3)
            {
              case 6666:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_CONVPATH:v8 onError:v9];
                goto LABEL_146;
              case 6922:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_VNODE:v8 onError:v9];
                goto LABEL_146;
              case 7178:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_AUTH:v8 onError:v9];
                goto LABEL_146;
            }
          }
        }
        else if (a3 <= 5385)
        {
          if (a3 == 4874)
          {
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_SHMSIZE:v8 onError:v9];
            goto LABEL_146;
          }
          if (a3 == 5130)
          {
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_SHMLOCK:v8 onError:v9];
            goto LABEL_146;
          }
        }
        else
        {
          switch(a3)
          {
            case 5386:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_SHMMAP:v8 onError:v9];
              goto LABEL_146;
            case 5642:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_SEEK:v8 onError:v9];
              goto LABEL_146;
            case 5898:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_DELETE_NOENT:v8 onError:v9];
              goto LABEL_146;
          }
        }
      }
      else if (a3 > 3593)
      {
        if (a3 <= 4105)
        {
          if (a3 == 3594)
          {
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_CHECKRESERVEDLOCK:v8 onError:v9];
            goto LABEL_146;
          }
          if (a3 == 3850)
          {
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_LOCK:v8 onError:v9];
            goto LABEL_146;
          }
        }
        else
        {
          switch(a3)
          {
            case 4106:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_CLOSE:v8 onError:v9];
              goto LABEL_146;
            case 4362:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_DIR_CLOSE:v8 onError:v9];
              goto LABEL_146;
            case 4618:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_SHMOPEN:v8 onError:v9];
              goto LABEL_146;
          }
        }
      }
      else if (a3 <= 2825)
      {
        if (a3 == 2570)
        {
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_DELETE:v8 onError:v9];
          goto LABEL_146;
        }
        if (a3 == 2579)
        {
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_ROWID:v8 onError:v9];
          goto LABEL_146;
        }
      }
      else
      {
        switch(a3)
        {
          case 2826:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_BLOCKED:v8 onError:v9];
            goto LABEL_146;
          case 3082:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_NOMEM:v8 onError:v9];
            goto LABEL_146;
          case 3338:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_ACCESS:v8 onError:v9];
            goto LABEL_146;
        }
      }
    }
    else if (a3 > 1289)
    {
      if (a3 > 1810)
      {
        if (a3 <= 2066)
        {
          if (a3 == 1811)
          {
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_TRIGGER:v8 onError:v9];
            goto LABEL_146;
          }
          if (a3 == 2058)
          {
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_UNLOCK:v8 onError:v9];
            goto LABEL_146;
          }
        }
        else
        {
          switch(a3)
          {
            case 2067:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_UNIQUE:v8 onError:v9];
              goto LABEL_146;
            case 2314:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_RDLOCK:v8 onError:v9];
              goto LABEL_146;
            case 2323:
              BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_VTAB:v8 onError:v9];
              goto LABEL_146;
          }
        }
      }
      else if (a3 <= 1545)
      {
        if (a3 == 1290)
        {
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_DIR_FSYNC:v8 onError:v9];
          goto LABEL_146;
        }
        if (a3 == 1299)
        {
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_NOTNULL:v8 onError:v9];
          goto LABEL_146;
        }
      }
      else
      {
        switch(a3)
        {
          case 1546:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_TRUNCATE:v8 onError:v9];
            goto LABEL_146;
          case 1555:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_PRIMARYKEY:v8 onError:v9];
            goto LABEL_146;
          case 1802:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_FSTAT:v8 onError:v9];
            goto LABEL_146;
        }
      }
    }
    else if (a3 > 786)
    {
      if (a3 <= 1033)
      {
        if (a3 == 787)
        {
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_FOREIGNKEY:v8 onError:v9];
          goto LABEL_146;
        }
        if (a3 == 1032)
        {
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_READONLY_DBMOVED:v8 onError:v9];
          goto LABEL_146;
        }
      }
      else
      {
        switch(a3)
        {
          case 1034:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_FSYNC:v8 onError:v9];
            goto LABEL_146;
          case 1038:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN_CONVPATH:v8 onError:v9];
            goto LABEL_146;
          case 1043:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_FUNCTION:v8 onError:v9];
            goto LABEL_146;
        }
      }
    }
    else if (a3 <= 775)
    {
      if (a3 == 531)
      {
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_COMMITHOOK:v8 onError:v9];
        goto LABEL_146;
      }
      if (a3 == 539)
      {
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOTICE_RECOVER_ROLLBACK:v8 onError:v9];
        goto LABEL_146;
      }
    }
    else
    {
      switch(a3)
      {
        case 776:
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_READONLY_ROLLBACK:v8 onError:v9];
          goto LABEL_146;
        case 778:
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_WRITE:v8 onError:v9];
          goto LABEL_146;
        case 782:
          BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN_FULLPATH:v8 onError:v9];
          goto LABEL_146;
      }
    }
LABEL_143:
    if (a3 >= 0x100) {
      BOOL v10 = [(SGSqliteDatabase *)self _handle_sqlite_error_code:a3 error:v8 onError:v9];
    }
    else {
      BOOL v10 = [(SGSqliteDatabase *)self _handle_UNKNOWN_ERROR:v8 onError:v9];
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_ERROR:v8 onError:v9];
        break;
      case 2:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_INTERNAL:v8 onError:v9];
        break;
      case 3:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_PERM:v8 onError:v9];
        break;
      case 4:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_ABORT:v8 onError:v9];
        break;
      case 5:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_BUSY:v8 onError:v9];
        break;
      case 6:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_LOCKED:v8 onError:v9];
        break;
      case 7:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOMEM:v8 onError:v9];
        break;
      case 8:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_READONLY:v8 onError:v9];
        break;
      case 9:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_INTERRUPT:v8 onError:v9];
        break;
      case 10:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:v8 onError:v9];
        break;
      case 11:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CORRUPT:v8 onError:v9];
        break;
      case 12:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOTFOUND:v8 onError:v9];
        break;
      case 13:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_FULL:v8 onError:v9];
        break;
      case 14:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN:v8 onError:v9];
        break;
      case 15:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_PROTOCOL:v8 onError:v9];
        break;
      case 16:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_EMPTY:v8 onError:v9];
        break;
      case 17:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_SCHEMA:v8 onError:v9];
        break;
      case 18:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_TOOBIG:v8 onError:v9];
        break;
      case 19:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT:v8 onError:v9];
        break;
      case 20:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_MISMATCH:v8 onError:v9];
        break;
      case 21:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_MISUSE:v8 onError:v9];
        break;
      case 22:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOLFS:v8 onError:v9];
        break;
      case 23:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_AUTH:v8 onError:v9];
        break;
      case 24:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_FORMAT:v8 onError:v9];
        break;
      case 25:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_RANGE:v8 onError:v9];
        break;
      case 26:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOTADB:v8 onError:v9];
        break;
      case 27:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOTICE:v8 onError:v9];
        break;
      case 28:
        BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_WARNING:v8 onError:v9];
        break;
      default:
        switch(a3)
        {
          case 261:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_BUSY_RECOVERY:v8 onError:v9];
            break;
          case 262:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_LOCKED_SHAREDCACHE:v8 onError:v9];
            break;
          case 263:
          case 265:
          case 268:
          case 269:
          case 271:
          case 272:
          case 273:
          case 274:
          case 276:
          case 277:
          case 278:
          case 280:
          case 281:
          case 282:
            goto LABEL_143;
          case 264:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_READONLY_RECOVERY:v8 onError:v9];
            break;
          case 266:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_READ:v8 onError:v9];
            break;
          case 267:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CORRUPT_VTAB:v8 onError:v9];
            break;
          case 270:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN_NOTEMPDIR:v8 onError:v9];
            break;
          case 275:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CONSTRAINT_CHECK:v8 onError:v9];
            break;
          case 279:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_AUTH_USER:v8 onError:v9];
            break;
          case 283:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_NOTICE_RECOVER_WAL:v8 onError:v9];
            break;
          case 284:
            BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_WARNING_AUTOINDEX:v8 onError:v9];
            break;
          default:
            switch(a3)
            {
              case 516:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_ABORT_ROLLBACK:v8 onError:v9];
                break;
              case 517:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_BUSY_SNAPSHOT:v8 onError:v9];
                break;
              case 520:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_READONLY_CANTLOCK:v8 onError:v9];
                break;
              case 522:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR_SHORT_READ:v8 onError:v9];
                break;
              case 526:
                BOOL v10 = [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN_ISDIR:v8 onError:v9];
                break;
              default:
                goto LABEL_143;
            }
            break;
        }
        break;
    }
  }
LABEL_146:
  BOOL v11 = v10;

  return v11;
}

- (BOOL)_handle_SQLITE_AUTH_USER:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_WARNING_AUTOINDEX:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_ROLLBACK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOTICE_RECOVER_WAL:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_ROWID:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_VTAB:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_UNIQUE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_TRIGGER:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_PRIMARYKEY:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_NOTNULL:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FUNCTION:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_FOREIGNKEY:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_COMMITHOOK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT_CHECK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_ABORT_ROLLBACK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_READONLY_DBMOVED:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_READONLY_ROLLBACK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_READONLY_CANTLOCK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_READONLY_RECOVERY:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_BUSY_SNAPSHOT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_BUSY_RECOVERY:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_LOCKED_SHAREDCACHE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_WARNING:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOTICE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_RANGE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_FORMAT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_AUTH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOLFS:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_MISUSE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_MISMATCH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CONSTRAINT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_TOOBIG:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_SCHEMA:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_EMPTY:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_PROTOCOL:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOTFOUND:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_INTERRUPT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_READONLY:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOMEM:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_LOCKED:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_BUSY:(id)a3 onError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v9 = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "exiting due to repeated SQLITE_BUSY", v9, 2u);
  }

  SGDExit(5);
}

- (BOOL)_handle_SQLITE_ABORT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_PERM:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_INTERNAL:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_ERROR:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_AUTH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_VNODE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_CONVPATH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_GETTEMPPATH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_MMAP:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_DELETE_NOENT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_SEEK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_SHMMAP:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_SHMLOCK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_SHMOPEN:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_DIR_CLOSE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_CLOSE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_LOCK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_CHECKRESERVEDLOCK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_ACCESS:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_NOMEM:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_BLOCKED:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_DELETE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_RDLOCK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_UNLOCK:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_FSTAT:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_TRUNCATE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_DIR_FSYNC:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_FSYNC:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_WRITE:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_READ:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_IOERR_SHMSIZE:(id)a3 onError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 userInfo];
  id v9 = [v8 objectForKeyedSubscript:@"sql"];
  int v10 = [v9 containsString:@"PRAGMA journal_mode"];

  if (v10)
  {
    id v13 = sgLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v14 = 0;
      _os_log_error_impl(&dword_1CA650000, v13, OS_LOG_TYPE_ERROR, "suggestd exiting due to lack of disk space while setting journal_mode.", v14, 2u);
    }

    SGDExit(2);
  }
  BOOL v11 = [(SGSqliteDatabase *)self _handle_SQLITE_IOERR:v6 onError:v7];

  return v11;
}

- (BOOL)_handle_SQLITE_IOERR:(id)a3 onError:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F93B10];
  id v8 = a4;
  unsigned int v9 = [v7 lockState];
  if (v9 > 3) {
    int v10 = 0;
  }
  else {
    int v10 = off_1E65C0580[v9];
  }
  BOOL v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEFAULT, "SGSqliteDatabase IOERR (device lock state %@): %@", (uint8_t *)&v14, 0x16u);
  }

  BOOL v12 = [(SGSqliteDatabase *)self _abortDueToSqliteError:v6 onError:v8];
  return v12;
}

- (BOOL)_handle_SQLITE_CANTOPEN_CONVPATH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CANTOPEN_FULLPATH:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CANTOPEN_ISDIR:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CANTOPEN_NOTEMPDIR:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_CANTOPEN:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CANTOPEN:(id)a3 onError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (*__error() == 28) {
    [(SGSqliteDatabase *)self _handle_SQLITE_FULL:v6 onError:v7];
  }
  BOOL v8 = [(SGSqliteDatabase *)self _abortDueToSqliteError:v6 onError:v7];

  return v8;
}

- (BOOL)_handle_SQLITE_IOERR_SHORT_READ:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_CORRUPT:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_NOTADB:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _handle_SQLITE_CORRUPT:a3 onError:a4];
}

- (BOOL)_handle_SQLITE_CORRUPT_VTAB:(id)a3 onError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "suggestd exiting due to corrupt SQL vtable.", v9, 2u);
  }

  SGDExit(4);
}

- (BOOL)_handle_SQLITE_CORRUPT:(id)a3 onError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(SGSqliteDatabase *)self isInMemory]) {
    [(SGSqliteDatabase *)self placeCorruptionMarker];
  }
  BOOL v8 = [(SGSqliteDatabase *)self _abortDueToSqliteError:v6 onError:v7];

  return v8;
}

- (BOOL)_handle_SQLITE_FULL:(id)a3 onError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sgLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)unsigned int v9 = 0;
    _os_log_error_impl(&dword_1CA650000, v7, OS_LOG_TYPE_ERROR, "suggestd exiting due to lack of disk space", v9, 2u);
  }

  SGDExit(2);
}

- (BOOL)_handle_UNKNOWN_ERROR:(id)a3 onError:(id)a4
{
  return [(SGSqliteDatabase *)self _abortDueToSqliteError:a3 onError:a4];
}

- (BOOL)_abortDueToSqliteError:(id)a3 onError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6)
  {
    BOOL v11 = (void *)MEMORY[0x1E4F1CA00];
    BOOL v12 = [v5 domain];
    id v13 = [v5 userInfo];
    int v14 = [v13 objectForKeyedSubscript:@"reason"];
    uint64_t v15 = [v5 userInfo];
    id v16 = [v11 exceptionWithName:v12 reason:v14 userInfo:v15];

    objc_exception_throw(v16);
  }
  id v7 = (uint64_t (**)(void, void))v6;
  BOOL v8 = (void *)MEMORY[0x1CB79B230]();
  BOOL v9 = (((uint64_t (**)(void, id))v7)[2](v7, v5) & 1) == 0;

  return v9;
}

- (void)placeCorruptionMarker
{
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  char v4 = sgLogHandle();
  id v5 = v4;
  if (has_internal_diagnostics)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v5, OS_LOG_TYPE_ERROR, "db corruption detected, leaving behind marker so we recover", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "db corruption detected, leaving behind marker so we recover", v8, 2u);
  }

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v7 = [(SGSqliteDatabase *)self corruptionMarkerPath];
  [v6 createFileAtPath:v7 contents:0 attributes:0];
}

- (id)corruptionMarkerPath
{
  id v2 = [(SGSqliteDatabase *)self filename];
  id v3 = +[SGSqliteDatabase corruptionMarkerPathForPath:v2];

  return v3;
}

- (BOOL)handleError:(int64_t)a3 sqliteError:(int)a4 forQuery:(id)a5 onError:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  id v11 = a5;
  BOOL v12 = objc_opt_new();
  [v12 setErrorCode:v7];
  id v13 = [MEMORY[0x1E4F93728] sharedInstance];
  [v13 trackScalarForMessage:v12];

  id v14 = [NSString alloc];
  uint64_t v15 = *MEMORY[0x1E4F5DEF0];
  id v16 = [v12 key];
  id v17 = (void *)[v14 initWithFormat:@"%@.%@", v15, v16];

  uint64_t v18 = [v12 dictionaryRepresentation];
  AnalyticsSendEvent();

  id v19 = [(SGSqliteDatabase *)self dbErrorWithCode:a3 sqliteReturnValue:v7 lastErrno:0 query:v11];

  id v20 = sgLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    id v24 = v19;
    _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "SQLite error: %@", buf, 0xCu);
  }

  BOOL v21 = [(SGSqliteDatabase *)self _handle_sqlite_error_code:v7 error:v19 onError:v10];
  return v21;
}

- (id)dbErrorWithCode:(unint64_t)a3 sqliteReturnValue:(int)a4 lastErrno:(int)a5 query:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = (void *)MEMORY[0x1CB79B230]();
  if ((unint64_t)[v10 length] >= 0x65)
  {
    BOOL v12 = [v10 substringToIndex:100];
    uint64_t v13 = [v12 stringByAppendingString:@"..."];

    id v10 = (id)v13;
  }
  id v14 = [NSString alloc];
  uint64_t v15 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_errmsg(-[SGSqliteDatabase handle](self, "handle")));
  id v16 = (void *)[v14 initWithFormat:@"Error(%d): %@", v7, v15];

  if (v10)
  {
    uint64_t v17 = [v16 stringByAppendingFormat:@" (SQL: %@)", v10];

    id v16 = (void *)v17;
  }
  if (a3 != 1 && !a5)
  {
    int v29 = 0;
    if (sqlite3_file_control([(SGSqliteDatabase *)self handle], 0, 4, &v29)) {
      goto LABEL_11;
    }
    a5 = v29;
  }
  if (a5)
  {
    uint64_t v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a5 userInfo:0];
    uint64_t v19 = [v16 stringByAppendingFormat:@". May be due to previous POSIX error %@", v18];

    id v16 = (void *)v19;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v18 = 0;
LABEL_12:
  id v20 = [(SGSqliteDatabase *)self freeSpace];
  if (v20)
  {
    BOOL v21 = objc_opt_new();
    [v21 setNumberStyle:1];
    [v21 setUsesGroupingSeparator:1];
    [v21 setGroupingSeparator:@","];
    [v21 setUsesSignificantDigits:1];
    [v21 setMinimumSignificantDigits:1];
    [v21 setMaximumSignificantDigits:1];
    id v22 = [v21 stringFromNumber:v20];
    uint64_t v23 = [v16 stringByAppendingFormat:@". Free space (rounded to 1 significant digit): %@ bytes", v22];

    id v16 = (void *)v23;
  }
  id v24 = objc_opt_new();
  uint64_t v25 = v24;
  if (v10) {
    [v24 setObject:v10 forKeyedSubscript:@"sql"];
  }
  if (v18) {
    [v25 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
  }
  [v25 setObject:v16 forKeyedSubscript:@"reason"];
  uint64_t v26 = [NSNumber numberWithInt:v7];
  [v25 setObject:v26 forKeyedSubscript:@"sqliteCode"];

  char v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"SGSqliteDatabaseError" code:a3 userInfo:v25];

  return v27;
}

- (id)freeSpace
{
  if ([(SGSqliteDatabase *)self isInMemory])
  {
    id v3 = 0;
    goto LABEL_8;
  }
  char v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v5 = [(SGSqliteDatabase *)self filename];
  uint64_t v16 = 0;
  id v6 = [v4 attributesOfFileSystemForPath:v5 error:&v16];
  uint64_t v7 = v16;

  if (v7)
  {
    BOOL v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "Cannot calculate free space", buf, 2u);
    }
  }
  else
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F283A0]];
    if (v10)
    {
      BOOL v8 = v10;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v8 = v8;
        id v3 = v8;
        goto LABEL_7;
      }
      BOOL v12 = sgLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_error_impl(&dword_1CA650000, v12, OS_LOG_TYPE_ERROR, "Free space attribute is not an NSNumber", v13, 2u);
      }
    }
    else
    {
      id v11 = sgLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v14 = 0;
        _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "Free space attribute is missing", v14, 2u);
      }

      BOOL v8 = 0;
    }
  }
  id v3 = 0;
LABEL_7:

LABEL_8:
  return v3;
}

+ (id)corruptionMarkerPathForPath:(id)a3
{
  id v3 = a3;
  char v4 = (void *)MEMORY[0x1CB79B230]();
  id v5 = [v3 stringByDeletingLastPathComponent];
  id v6 = +[SGSqliteDatabase corruptionMarkerFilename];
  uint64_t v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

+ (id)corruptionMarkerFilename
{
  return @"sg_db_corruption_marker";
}

@end