@interface MSPerformanceLogger
+ (id)sharedLogger;
+ (void)nukeCompletionBlock:(id)a3;
- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4;
- (MSPerformanceLogger)init;
- (void)_logSqliteErrorLine:(int)a3;
- (void)dbQueueDiscardOperation:(id)a3 itemGUID:(id)a4;
- (void)discardOperation:(id)a3 itemGUID:(id)a4;
- (void)startOperation:(id)a3 itemGUID:(id)a4;
- (void)stopOperation:(id)a3 itemGUID:(id)a4;
- (void)summarizeOperation:(id)a3 itemGUID:(id)a4 formatBlock:(id)a5;
@end

@implementation MSPerformanceLogger

- (void)summarizeOperation:(id)a3 itemGUID:(id)a4 formatBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = MSPlatform();
  if (objc_opt_respondsToSelector())
  {
    v12 = MSPlatform();
    int v13 = [v12 isPerformanceLoggingEnabled];

    if (v13)
    {
      v14 = [MEMORY[0x1E4F1C9C8] date];
      v15 = [(MSASModelBase *)self dbQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MSPerformanceLogger_summarizeOperation_itemGUID_formatBlock___block_invoke;
      block[3] = &unk_1E6C3D530;
      block[4] = self;
      id v18 = v8;
      id v19 = v9;
      id v20 = v14;
      id v21 = v10;
      id v16 = v14;
      dispatch_async(v15, block);
    }
  }
  else
  {
  }
}

uint64_t __63__MSPerformanceLogger_summarizeOperation_itemGUID_formatBlock___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select event, timestamp from PerfLog where operation = ? and GUID = ? order by rowid asc;"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, *(id *)(a1 + 40));
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    v5 = (sqlite3 *)[*(id *)(a1 + 32) dbQueueDB];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 178;
  }
  else
  {
    uint64_t v8 = MSSqliteBindStringOrNull(v2, 2, *(id *)(a1 + 48));
    int v9 = v8;
    MSSqliteTrapForDBLockError(v8);
    if (!v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void *)(a1 + 48);
        *(_DWORD *)v36 = 138543618;
        *(void *)&v36[4] = v11;
        *(_WORD *)&v36[12] = 2114;
        *(void *)&v36[14] = v12;
        _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Summarizing %{public}@ - %{public}@", v36, 0x16u);
      }
      int v13 = 0;
      int v14 = 0;
      double v15 = 0.0;
      double v16 = 0.0;
      while (1)
      {
        v17 = v13;
        int v18 = sqlite3_step(v2);
        if (v18 != 100) {
          break;
        }
        id v19 = MSSqliteStringFromStatementColumn(v2, 0);
        uint64_t v20 = MSSqliteDateFromTimeIntervalStatementColumn(v2, 1);
        int v13 = (void *)v20;
        if (!v19)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v32 = *(void *)(a1 + 40);
            uint64_t v33 = *(void *)(a1 + 48);
            *(_DWORD *)v36 = 138543618;
            *(void *)&v36[4] = v32;
            *(_WORD *)&v36[12] = 2114;
            *(void *)&v36[14] = v33;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ Perf log entry missing event indicator. Aborting.", v36, 0x16u);
          }

          id v19 = 0;
          goto LABEL_44;
        }
        if (!v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
          {
            uint64_t v24 = *(void *)(a1 + 40);
            uint64_t v25 = *(void *)(a1 + 48);
            *(_DWORD *)v36 = 138543618;
            *(void *)&v36[4] = v24;
            *(_WORD *)&v36[12] = 2114;
            *(void *)&v36[14] = v25;
            _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ Perf log entry missing facility indicator. Aborting.", v36, 0x16u);
          }
          goto LABEL_44;
        }
        if ([v19 isEqualToString:@"start"])
        {
          if (v14)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = *(void *)(a1 + 40);
              uint64_t v27 = *(void *)(a1 + 48);
              *(_DWORD *)v36 = 138543618;
              *(void *)&v36[4] = v26;
              *(_WORD *)&v36[12] = 2114;
              *(void *)&v36[14] = v27;
              v28 = MEMORY[0x1E4F14500];
              v29 = "%{public}@ - %{public}@ Unexpected start event. Aborting.";
              goto LABEL_40;
            }
            goto LABEL_43;
          }
          if (v17)
          {
            [v13 timeIntervalSinceDate:v17];
            double v16 = v16 + v21;
          }
          int v14 = 1;
        }
        else
        {
          if (![v19 isEqualToString:@"stop"])
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              uint64_t v34 = *(void *)(a1 + 40);
              uint64_t v35 = *(void *)(a1 + 48);
              *(_DWORD *)v36 = 138543874;
              *(void *)&v36[4] = v34;
              *(_WORD *)&v36[12] = 2114;
              *(void *)&v36[14] = v35;
              *(_WORD *)&v36[22] = 2114;
              v37 = v19;
              _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %{public}@ Unknown event type “%{public}@”. Aborting.", v36, 0x20u);
            }
            goto LABEL_43;
          }
          if (v14 != 1)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              uint64_t v30 = *(void *)(a1 + 40);
              uint64_t v31 = *(void *)(a1 + 48);
              *(_DWORD *)v36 = 138543618;
              *(void *)&v36[4] = v30;
              *(_WORD *)&v36[12] = 2114;
              *(void *)&v36[14] = v31;
              v28 = MEMORY[0x1E4F14500];
              v29 = "%{public}@ - %{public}@ Unexpected stop event. Aborting.";
LABEL_40:
              _os_log_impl(&dword_1DC434000, v28, OS_LOG_TYPE_INFO, v29, v36, 0x16u);
            }
LABEL_43:

LABEL_44:
            goto LABEL_45;
          }
          if (v17)
          {
            [v13 timeIntervalSinceDate:v17];
            int v14 = 0;
            double v15 = v15 + v22;
          }
          else
          {
            int v14 = 0;
          }
        }
      }
      if (v18 == 101)
      {
        if (v14 == 1 && v13)
        {
          [*(id *)(a1 + 56) timeIntervalSinceDate:v13];
          double v15 = v15 + v23;
        }
        (*(void (**)(double, double))(*(void *)(a1 + 64) + 16))(v15, v16);
      }
      else
      {
        [*(id *)(a1 + 32) _logSqliteErrorLine:232];
      }
LABEL_45:

      if (v2) {
        goto LABEL_6;
      }
      return objc_msgSend(*(id *)(a1 + 32), "dbQueueDiscardOperation:itemGUID:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(_OWORD *)v36, *(void *)&v36[16]);
    }
    v5 = (sqlite3 *)[*(id *)(a1 + 32) dbQueueDB];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 179;
  }
  MSLogSqliteError(v5, v6, v7);
  if (v2) {
LABEL_6:
  }
    sqlite3_reset(v2);
  return objc_msgSend(*(id *)(a1 + 32), "dbQueueDiscardOperation:itemGUID:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(_OWORD *)v36, *(void *)&v36[16]);
}

- (void)discardOperation:(id)a3 itemGUID:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v6;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %{public}@ Discarding measurements.", buf, 0x16u);
  }
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__MSPerformanceLogger_discardOperation_itemGUID___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __49__MSPerformanceLogger_discardOperation_itemGUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueDiscardOperation:*(void *)(a1 + 40) itemGUID:*(void *)(a1 + 48)];
}

- (void)dbQueueDiscardOperation:(id)a3 itemGUID:(id)a4
{
  id v14 = a4;
  id v6 = a3;
  id v7 = [(MSASModelBase *)self statementForString:@"delete from PerfLog where operation = ? and GUID = ?;"];
  uint64_t v8 = MSSqliteBindStringOrNull(v7, 1, v6);

  MSSqliteTrapForDBLockError(v8);
  if (v8)
  {
    uint64_t v9 = 149;
  }
  else
  {
    uint64_t v10 = MSSqliteBindStringOrNull(v7, 2, v14);
    int v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (v11)
    {
      uint64_t v9 = 150;
    }
    else
    {
      uint64_t v12 = sqlite3_step(v7);
      int v13 = v12;
      MSSqliteTrapForDBLockError(v12);
      if (v13 == 101) {
        goto LABEL_8;
      }
      uint64_t v9 = 151;
    }
  }
  [(MSPerformanceLogger *)self _logSqliteErrorLine:v9];
LABEL_8:
  if (v7) {
    sqlite3_reset(v7);
  }
}

- (void)stopOperation:(id)a3 itemGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = MSPlatform();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = MSPlatform();
    int v10 = [v9 isPerformanceLoggingEnabled];

    if (v10)
    {
      int v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = [(MSASModelBase *)self dbQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __46__MSPerformanceLogger_stopOperation_itemGUID___block_invoke;
      v14[3] = &unk_1E6C3D9C0;
      v14[4] = self;
      id v15 = v6;
      id v16 = v7;
      id v17 = v11;
      id v13 = v11;
      dispatch_async(v12, v14);
    }
  }
  else
  {
  }
}

void __46__MSPerformanceLogger_stopOperation_itemGUID___block_invoke(id *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (sqlite3_stmt *)[a1[4] statementForString:@"insert into PerfLog (operation, GUID, event, timestamp) values (?, ?, ?, ?);"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, a1[5]);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
    id v5 = a1[4];
    uint64_t v6 = 134;
LABEL_13:
    [v5 _logSqliteErrorLine:v6];
    goto LABEL_14;
  }
  uint64_t v7 = MSSqliteBindStringOrNull(v2, 2, a1[6]);
  int v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8)
  {
    id v5 = a1[4];
    uint64_t v6 = 135;
    goto LABEL_13;
  }
  uint64_t v9 = sqlite3_bind_text(v2, 3, "stop", -1, 0);
  int v10 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (v10)
  {
    id v5 = a1[4];
    uint64_t v6 = 136;
    goto LABEL_13;
  }
  [a1[7] timeIntervalSinceReferenceDate];
  uint64_t v12 = sqlite3_bind_double(v2, 4, v11);
  int v13 = v12;
  MSSqliteTrapForDBLockError(v12);
  if (v13)
  {
    id v5 = a1[4];
    uint64_t v6 = 137;
    goto LABEL_13;
  }
  uint64_t v14 = sqlite3_step(v2);
  int v15 = v14;
  MSSqliteTrapForDBLockError(v14);
  if (v15 != 101)
  {
    id v5 = a1[4];
    uint64_t v6 = 138;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v16 = a1[5];
    id v17 = a1[6];
    int v18 = 138543618;
    id v19 = v16;
    __int16 v20 = 2114;
    id v21 = v17;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Stop %{public}@ - %{public}@", (uint8_t *)&v18, 0x16u);
  }
LABEL_14:
  if (v2) {
    sqlite3_reset(v2);
  }
}

- (void)startOperation:(id)a3 itemGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = MSPlatform();
  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = MSPlatform();
    int v10 = [v9 isPerformanceLoggingEnabled];

    if (v10)
    {
      double v11 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v12 = [(MSASModelBase *)self dbQueue];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47__MSPerformanceLogger_startOperation_itemGUID___block_invoke;
      v14[3] = &unk_1E6C3D9C0;
      v14[4] = self;
      id v15 = v6;
      id v16 = v7;
      id v17 = v11;
      id v13 = v11;
      dispatch_async(v12, v14);
    }
  }
  else
  {
  }
}

void __47__MSPerformanceLogger_startOperation_itemGUID___block_invoke(id *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = (sqlite3_stmt *)[a1[4] statementForString:@"insert into PerfLog (operation, GUID, event, timestamp) values (?, ?, ?, ?);"];
  uint64_t v3 = MSSqliteBindStringOrNull(v2, 1, a1[5]);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4) {
    goto LABEL_8;
  }
  uint64_t v5 = MSSqliteBindStringOrNull(v2, 2, a1[6]);
  int v6 = v5;
  MSSqliteTrapForDBLockError(v5);
  if (v6) {
    goto LABEL_8;
  }
  uint64_t v7 = sqlite3_bind_text(v2, 3, "start", -1, 0);
  int v8 = v7;
  MSSqliteTrapForDBLockError(v7);
  if (v8
    || ([a1[7] timeIntervalSinceReferenceDate],
        uint64_t v10 = sqlite3_bind_double(v2, 4, v9),
        int v11 = v10,
        MSSqliteTrapForDBLockError(v10),
        v11)
    || (v12 = sqlite3_step(v2), int v13 = v12, MSSqliteTrapForDBLockError(v12), v13 != 101))
  {
LABEL_8:
    [a1[4] _logSqliteErrorLine:122];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v14 = a1[5];
    id v15 = a1[6];
    int v16 = 138543618;
    id v17 = v14;
    __int16 v18 = 2114;
    id v19 = v15;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Start %{public}@ - %{public}@", (uint8_t *)&v16, 0x16u);
  }
  if (v2) {
    sqlite3_reset(v2);
  }
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)MSPerformanceLogger;
  BOOL v7 = -[MSASModelBase dbQueueUpgradeFromDatabaseVersion:currentVersion:](&v12, sel_dbQueueUpgradeFromDatabaseVersion_currentVersion_);
  if (!v7) {
    return v7;
  }
  if (a3 < 0)
  {
    errmsg = 0;
    if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "pragma journal_mode = wal;", 0, 0, &errmsg)
      && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)id v14 = self;
      *(_WORD *)&v14[8] = 2082;
      id v15 = errmsg;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not set journal mode. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists PerfLog (\n   rowid       integer primary key asc autoincrement,\n   operation   text,\n   GUID        text,\n   event       text,\n   timestamp   float);",
           0,
           0,
           &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)id v14 = errmsg;
        int v8 = MEMORY[0x1E4F14500];
        double v9 = "Could not create performance log. Error: %{public}s";
LABEL_18:
        _os_log_error_impl(&dword_1DC434000, v8, OS_LOG_TYPE_ERROR, v9, buf, 0xCu);
      }
    }
    else if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists PerfLogByGUID on PerfLog (GUID asc, operation asc);", {
                0,
    }
                0,
                &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)id v14 = errmsg;
        int v8 = MEMORY[0x1E4F14500];
        double v9 = "Could not create performance log index. Error: %{public}s";
        goto LABEL_18;
      }
    }
    else
    {
      if (!sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg)) {
        return v7;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        *(void *)id v14 = errmsg;
        int v8 = MEMORY[0x1E4F14500];
        double v9 = "Could not analyze performance log database. Ignoring. Error: %{public}s";
        goto LABEL_18;
      }
    }
    sqlite3_free(errmsg);
    return v7;
  }
  if (a3 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)id v14 = a3;
    *(_WORD *)&v14[4] = 1024;
    *(_DWORD *)&v14[6] = a4;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Cannot migrate performance log database from version %d to %d. Recreating.", buf, 0xEu);
  }
  return v7;
}

- (MSPerformanceLogger)init
{
  uint64_t v3 = MSPathPerfDB();
  v6.receiver = self;
  v6.super_class = (Class)MSPerformanceLogger;
  int v4 = [(MSASModelBase *)&v6 initWithPersonID:0 databasePath:v3 currentVersion:0];

  return v4;
}

- (void)_logSqliteErrorLine:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v5 = 136446722;
    objc_super v6 = "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/coremediastream/MSPerformanceLogger.m";
    __int16 v7 = 1024;
    int v8 = a3;
    __int16 v9 = 2082;
    uint64_t v10 = sqlite3_errmsg([(MSASModelBase *)self dbQueueDB]);
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}s:%d: SQL operation failed: %{public}s", (uint8_t *)&v5, 0x1Cu);
  }
}

+ (void)nukeCompletionBlock:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  int v5 = (void *)logger;
  if (logger)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__MSPerformanceLogger_nukeCompletionBlock___block_invoke;
    v9[3] = &unk_1E6C3D508;
    id v10 = v3;
    [v5 shutDownForDestruction:1 completionBlock:v9];
  }
  else
  {
    objc_super v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    __int16 v7 = MSPathPerfDB();
    [v6 removeItemAtPath:v7 error:0];

    if (v4)
    {
      int v8 = dispatch_get_global_queue(0, 0);
      dispatch_async(v8, v4);
    }
  }
}

void __43__MSPerformanceLogger_nukeCompletionBlock___block_invoke(uint64_t a1)
{
  v2 = (void *)logger;
  logger = 0;

  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = MSPathPerfDB();
  [v3 removeItemAtPath:v4 error:0];

  int v5 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_super v6 = dispatch_get_global_queue(0, 0);
    dispatch_async(v6, v5);
  }
}

+ (id)sharedLogger
{
  v2 = MSPlatform();
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_5;
  }
  id v3 = MSPlatform();
  int v4 = [v3 isPerformanceLoggingEnabled];

  int v5 = (void *)logger;
  if (v4 && !logger)
  {
    objc_super v6 = objc_alloc_init(MSPerformanceLogger);
    v2 = (void *)logger;
    logger = (uint64_t)v6;
LABEL_5:

    int v5 = (void *)logger;
  }
  return v5;
}

@end