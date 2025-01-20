@interface MSASDaemonModel
+ (id)defaultModel;
- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4;
- (MSASDaemonModel)init;
- (id)earliestNextActivityDate;
- (id)nextActivityDateByPersonID;
- (void)clearAllNextActivityDates;
- (void)setNextActivityDate:(id)a3 forPersonID:(id)a4;
@end

@implementation MSASDaemonModel

- (void)clearAllNextActivityDates
{
  v3 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MSASDaemonModel_clearAllNextActivityDates__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

void __44__MSASDaemonModel_clearAllNextActivityDates__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Clearing out all next activity dates.", (uint8_t *)&v6, 0xCu);
  }
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"delete from NextActivity;"];
  uint64_t v3 = sqlite3_step(v2);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4 != 101) {
    MSLogSqliteError((sqlite3 *)[*(id *)(a1 + 32) dbQueueDB], *(void *)(a1 + 32), 163);
  }
  if (v2) {
    sqlite3_reset(v2);
  }
}

- (void)setNextActivityDate:(id)a3 forPersonID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__MSASDaemonModel_setNextActivityDate_forPersonID___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __51__MSASDaemonModel_setNextActivityDate_forPersonID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    int v18 = 138543874;
    uint64_t v19 = v15;
    __int16 v20 = 2114;
    uint64_t v21 = v16;
    __int16 v22 = 2112;
    uint64_t v23 = v17;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Setting next activity date %{public}@ for personID %@.", (uint8_t *)&v18, 0x20u);
  }
  v2 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = (sqlite3_stmt *)[v2 statementForString:@"insert or replace into NextActivity (personID, nextActivity) values (?, ?);"];
    uint64_t v4 = sqlite3_reset(v3);
    int v5 = v4;
    MSSqliteTrapForDBLockError(v4);
    if (v5) {
      return sqlite3_reset(v3);
    }
    uint64_t v6 = sqlite3_bind_text(v3, 1, (const char *)[*(id *)(a1 + 48) UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    int v7 = v6;
    MSSqliteTrapForDBLockError(v6);
    if (v7) {
      return sqlite3_reset(v3);
    }
    [*(id *)(a1 + 40) timeIntervalSinceReferenceDate];
    uint64_t v9 = sqlite3_bind_double(v3, 2, v8);
  }
  else
  {
    uint64_t v3 = (sqlite3_stmt *)[v2 statementForString:@"delete from NextActivity where personID = ?;"];
    uint64_t v10 = sqlite3_reset(v3);
    int v11 = v10;
    MSSqliteTrapForDBLockError(v10);
    if (v11) {
      return sqlite3_reset(v3);
    }
    uint64_t v9 = sqlite3_bind_text(v3, 1, (const char *)[*(id *)(a1 + 48) UTF8String], -1, 0);
  }
  int v12 = v9;
  MSSqliteTrapForDBLockError(v9);
  if (!v12)
  {
    uint64_t v13 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v13);
  }
  return sqlite3_reset(v3);
}

- (id)nextActivityDateByPersonID
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5139;
  int v11 = __Block_byref_object_dispose__5140;
  id v12 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__MSASDaemonModel_nextActivityDateByPersonID__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__MSASDaemonModel_nextActivityDateByPersonID__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v12 = *(void **)(a1 + 32);
    int v15 = 138543362;
    uint64_t v16 = v12;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving next activity date by personID.", (uint8_t *)&v15, 0xCu);
  }
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select personID, nextActivity from NextActivity;"];
  uint64_t v3 = sqlite3_reset(v2);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4) {
    goto LABEL_11;
  }
  while (1)
  {
    int v5 = sqlite3_step(v2);
    if (v5 != 100) {
      break;
    }
    uint64_t v6 = MSSqliteStringFromStatementColumn(v2, 0);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v2, 1));
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v7 forKey:v6];
  }
  if (v5 != 101)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void **)(a1 + 32);
      v14 = sqlite3_errmsg((sqlite3 *)[v13 dbQueueDB]);
      int v15 = 138543618;
      uint64_t v16 = v13;
      __int16 v17 = 2082;
      uint64_t v18 = (uint64_t)v14;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Error retrieving next activity date by personID. sqlite error: %{public}s", (uint8_t *)&v15, 0x16u);
    }
LABEL_11:
    sqlite3_reset(v2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;

    return;
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    double v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = v9;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...retrieved %ld entries.", (uint8_t *)&v15, 0x16u);
  }
}

- (id)earliestNextActivityDate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__5139;
  int v11 = __Block_byref_object_dispose__5140;
  id v12 = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving next activity date.", buf, 0xCu);
  }
  uint64_t v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__MSASDaemonModel_earliestNextActivityDate__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __43__MSASDaemonModel_earliestNextActivityDate__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = (sqlite3_stmt *)[*(id *)(a1 + 32) statementForString:@"select nextActivity from NextActivity order by nextActivity asc limit 1;"];
  uint64_t v3 = sqlite3_reset(v2);
  int v4 = v3;
  MSSqliteTrapForDBLockError(v3);
  if (v4)
  {
LABEL_2:
    sqlite3_reset(v2);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;

    return;
  }
  int v7 = sqlite3_step(v2);
  if (v7 != 101)
  {
    if (v7 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v11 = *(void **)(a1 + 32);
        int v14 = 138543618;
        uint64_t v15 = v11;
        __int16 v16 = 2082;
        __int16 v17 = sqlite3_errmsg((sqlite3 *)[v11 dbQueueDB]);
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot retrieve next activity date. sqlite error: %{public}s", (uint8_t *)&v14, 0x16u);
      }
      goto LABEL_2;
    }
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v2, 0));
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  sqlite3_reset(v2);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = *(const char **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v14 = 138543618;
    uint64_t v15 = v12;
    __int16 v16 = 2114;
    __int16 v17 = v13;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: ...retrieved date: %{public}@", (uint8_t *)&v14, 0x16u);
  }
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  *(void *)&v15[5] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)MSASDaemonModel;
  BOOL v6 = [(MSASModelBase *)&v11 dbQueueUpgradeFromDatabaseVersion:*(void *)&a3 currentVersion:*(void *)&a4];
  if (a3 < 0)
  {
    errmsg = 0;
    if (sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create table if not exists NextActivity(\n   personID              text unique primary key,\n   nextActivity          float\n);",
           0,
           0,
           &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = self;
        __int16 v14 = 2082;
        *(void *)uint64_t v15 = errmsg;
        int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "%{public}@: Could not create daemon model tables. Error: %{public}s";
LABEL_12:
        _os_log_error_impl(&dword_1DC434000, v7, OS_LOG_TYPE_ERROR, v8, buf, 0x16u);
      }
    }
    else
    {
      if (!sqlite3_exec([(MSASModelBase *)self dbQueueDB], "create index if not exists NextActivityByDate on NextActivity (nextActivity asc);",
              0,
              0,
              &errmsg))
      {
        if (!sqlite3_exec([(MSASModelBase *)self dbQueueDB], "analyze;", 0, 0, &errmsg)) {
          return 1;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v13 = self;
          __int16 v14 = 2082;
          *(void *)uint64_t v15 = errmsg;
          _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not analyze database indexes. Ignoring. Error: %{public}s", buf, 0x16u);
        }
        BOOL v6 = 1;
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v13 = self;
        __int16 v14 = 2082;
        *(void *)uint64_t v15 = errmsg;
        int v7 = MEMORY[0x1E4F14500];
        uint64_t v8 = "%{public}@: Could not create index. Error: %{public}s";
        goto LABEL_12;
      }
    }
LABEL_17:
    sqlite3_free(errmsg);
    return v6;
  }
  if (a3 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = self;
      __int16 v14 = 1024;
      *(_DWORD *)uint64_t v15 = a3;
      v15[2] = 1024;
      *(_DWORD *)&v15[3] = 2;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot upgrade from database version %d to %d. Recreating database.", buf, 0x18u);
    }
    return 0;
  }
  return v6;
}

- (MSASDaemonModel)init
{
  uint64_t v3 = MSPathAlbumSharingDaemonPersistentStore();
  v6.receiver = self;
  v6.super_class = (Class)MSASDaemonModel;
  int v4 = [(MSASModelBase *)&v6 initWithPersonID:0 databasePath:v3 currentVersion:2];

  return v4;
}

+ (id)defaultModel
{
  if (defaultModel_onceToken != -1) {
    dispatch_once(&defaultModel_onceToken, &__block_literal_global_5169);
  }
  v2 = (void *)defaultModel_model;
  return v2;
}

uint64_t __31__MSASDaemonModel_defaultModel__block_invoke()
{
  defaultModel_model = objc_alloc_init(MSASDaemonModel);
  return MEMORY[0x1F41817F8]();
}

@end