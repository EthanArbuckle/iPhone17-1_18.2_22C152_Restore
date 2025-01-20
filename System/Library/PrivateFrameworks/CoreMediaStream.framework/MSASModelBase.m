@interface MSASModelBase
- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4;
- (BOOL)dbWasRecreated;
- (MSASModelBase)initWithPersonID:(id)a3 databasePath:(id)a4 currentVersion:(int)a5;
- (NSString)personID;
- (OS_dispatch_queue)dbQueue;
- (OS_dispatch_queue)statementQueue;
- (__CFDictionary)statements;
- (id)dbQueuePersistentDataForKey:(id)a3;
- (id)dbQueuePersistentObjectForKey:(id)a3;
- (id)dbQueuePersistentStringForKey:(id)a3;
- (id)persistentObjectForKey:(id)a3;
- (id)persistentStringForKey:(id)a3;
- (sqlite3)db;
- (sqlite3)dbQueueDB;
- (sqlite3_stmt)statementForString:(id)a3;
- (void)beginTransaction;
- (void)dbQueueBeginTransaction;
- (void)dbQueueDeletePersistentValueWithKey:(id)a3;
- (void)dbQueueEndTransaction;
- (void)dbQueueInitializeDatabasePath:(id)a3 currentVersion:(int)a4;
- (void)dbQueueRollbackTransaction;
- (void)dbQueueSetPersistentData:(id)a3 forKey:(id)a4;
- (void)dbQueueSetPersistentObject:(id)a3 forKey:(id)a4;
- (void)dbQueueSetPersistentString:(id)a3 forKey:(id)a4;
- (void)deletePersistentValueWithKey:(id)a3;
- (void)endTransaction;
- (void)setDbWasRecreated:(BOOL)a3;
- (void)setPersistentObject:(id)a3 forKey:(id)a4;
- (void)setPersistentString:(id)a3 forKey:(id)a4;
- (void)setStatementQueue:(id)a3;
- (void)setStatements:(__CFDictionary *)a3;
- (void)shutDownForDestruction:(BOOL)a3 completionBlock:(id)a4;
@end

@implementation MSASModelBase

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbQueue, 0);
  objc_storeStrong((id *)&self->_statementQueue, 0);
  objc_storeStrong((id *)&self->_personID, 0);
}

- (void)setDbWasRecreated:(BOOL)a3
{
  self->_dbWasRecreated = a3;
}

- (BOOL)dbWasRecreated
{
  return self->_dbWasRecreated;
}

- (OS_dispatch_queue)dbQueue
{
  return self->_dbQueue;
}

- (void)setStatementQueue:(id)a3
{
}

- (OS_dispatch_queue)statementQueue
{
  return self->_statementQueue;
}

- (void)setStatements:(__CFDictionary *)a3
{
  self->_statements = a3;
}

- (__CFDictionary)statements
{
  return self->_statements;
}

- (NSString)personID
{
  return self->_personID;
}

- (sqlite3)dbQueueDB
{
  return self->_db;
}

- (void)dbQueueRollbackTransaction
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Rolling back transaction.", (uint8_t *)&v7, 0xCu);
  }
  v3 = [(MSASModelBase *)self statementForString:@"rollback transaction;"];
  uint64_t v4 = sqlite3_reset(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (!v5)
  {
    uint64_t v6 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v6);
  }
  sqlite3_reset(v3);
}

- (void)dbQueueEndTransaction
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Ending transaction.", (uint8_t *)&v7, 0xCu);
  }
  v3 = [(MSASModelBase *)self statementForString:@"release savepoint save;"];
  uint64_t v4 = sqlite3_reset(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (!v5)
  {
    uint64_t v6 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v6);
  }
  sqlite3_reset(v3);
}

- (void)endTransaction
{
  v3 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__MSASModelBase_endTransaction__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __31__MSASModelBase_endTransaction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueEndTransaction];
}

- (void)dbQueueBeginTransaction
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Beginning transaction.", (uint8_t *)&v7, 0xCu);
  }
  v3 = [(MSASModelBase *)self statementForString:@"savepoint save;"];
  uint64_t v4 = sqlite3_reset(v3);
  int v5 = v4;
  MSSqliteTrapForDBLockError(v4);
  if (!v5)
  {
    uint64_t v6 = sqlite3_step(v3);
    MSSqliteTrapForDBLockError(v6);
  }
  sqlite3_reset(v3);
}

- (void)beginTransaction
{
  v3 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MSASModelBase_beginTransaction__block_invoke;
  block[3] = &unk_1E6C3DA38;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__MSASModelBase_beginTransaction__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueBeginTransaction];
}

- (void)dbQueueDeletePersistentValueWithKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138543618;
    v13 = self;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Deleting persistent value for key %{public}@.", (uint8_t *)&v12, 0x16u);
  }
  int v5 = [(MSASModelBase *)self statementForString:@"delete from Properties where key = ?;"];
  uint64_t v6 = sqlite3_reset(v5);
  int v7 = v6;
  MSSqliteTrapForDBLockError(v6);
  if (v7
    || (v8 = sqlite3_bind_text(v5, 1, (const char *)[v4 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL), int v9 = v8, MSSqliteTrapForDBLockError(v8), v9)|| (v10 = sqlite3_step(v5), v11 = v10, MSSqliteTrapForDBLockError(v10), v11 != 101))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v12 = 138543618;
      v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not delete persistent value for key %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)dbQueueSetPersistentObject:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v13 = 0;
  int v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v13];
  id v8 = v13;
  int v9 = v8;
  if (!v7)
  {
    uint64_t v10 = NSString;
    int v11 = [v8 userInfo];
    int v12 = [v10 stringWithFormat:@"Failed to archive an object. Error: %@ Info: %@", v9, v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = v12;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  [(MSASModelBase *)self dbQueueSetPersistentData:v7 forKey:v6];
}

- (void)dbQueueSetPersistentString:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dataUsingEncoding:4];
  [(MSASModelBase *)self dbQueueSetPersistentData:v7 forKey:v6];
}

- (void)dbQueueSetPersistentData:(id)a3 forKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v20 = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Setting persistent value for key %{public}@.", (uint8_t *)&v20, 0x16u);
    if (v6)
    {
LABEL_3:
      id v8 = [(MSASModelBase *)self statementForString:@"insert or replace into Properties (key, value) values (?, ?);"];
      uint64_t v9 = sqlite3_reset(v8);
      int v10 = v9;
      MSSqliteTrapForDBLockError(v9);
      if (v10) {
        goto LABEL_11;
      }
      uint64_t v11 = sqlite3_bind_text(v8, 1, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      int v12 = v11;
      MSSqliteTrapForDBLockError(v11);
      if (v12) {
        goto LABEL_11;
      }
      unint64_t v13 = [v6 length];
      if (v13 >> 31) {
        __assert_rtn("-[MSASModelBase dbQueueSetPersistentData:forKey:]", "MSASModelBase.m", 384, "dataLength <= INT_MAX");
      }
      uint64_t v14 = sqlite3_bind_blob(v8, 2, (const void *)[v6 bytes], v13, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_10;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  id v8 = [(MSASModelBase *)self statementForString:@"delete from Properties where key = ?;"];
  uint64_t v15 = sqlite3_reset(v8);
  int v16 = v15;
  MSSqliteTrapForDBLockError(v15);
  if (v16) {
    goto LABEL_11;
  }
  uint64_t v14 = sqlite3_bind_text(v8, 1, (const char *)[v7 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
LABEL_10:
  int v17 = v14;
  MSSqliteTrapForDBLockError(v14);
  if (!v17)
  {
    uint64_t v18 = sqlite3_step(v8);
    int v19 = v18;
    MSSqliteTrapForDBLockError(v18);
    sqlite3_reset(v8);
    if (v19 == 101) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
LABEL_11:
  sqlite3_reset(v8);
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v20 = 138543618;
    v21 = self;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not set persistent value for key %{public}@.", (uint8_t *)&v20, 0x16u);
  }
LABEL_14:
}

- (id)dbQueuePersistentObjectForKey:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MSASModelBase *)self dbQueuePersistentDataForKey:v4];
  if (v5)
  {
    id v9 = 0;
    id v6 = [MEMORY[0x1E4F28DC0] MSSafeUnarchiveObjectWithData:v5 outError:&v9];
    id v7 = v9;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v11 = self;
        __int16 v12 = 2114;
        id v13 = v6;
        __int16 v14 = 2114;
        id v15 = v4;
        _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved persistent object %{public}@ for key %{public}@.", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not unarchive persistent object for key %{public}@: %@", buf, 0x20u);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)dbQueuePersistentStringForKey:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(MSASModelBase *)self dbQueuePersistentDataForKey:v4];
  if (v5) {
    id v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else {
    id v6 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138543874;
    id v9 = self;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieved persistent string %{public}@ for key %{public}@.", (uint8_t *)&v8, 0x20u);
  }

  return v6;
}

- (id)dbQueuePersistentDataForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v16 = 138543618;
    int v17 = self;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@: Retrieving persistent value for key: %{public}@", (uint8_t *)&v16, 0x16u);
  }
  int v5 = [(MSASModelBase *)self statementForString:@"select value from Properties where key = ?"];
  id v6 = v4;
  char v7 = 1;
  uint64_t v8 = sqlite3_bind_text(v5, 1, (const char *)[v6 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  int v9 = v8;
  MSSqliteTrapForDBLockError(v8);
  if (v9)
  {
LABEL_4:
    __int16 v10 = 0;
    if (!v5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v13 = sqlite3_step(v5);
  if (v13 == 101)
  {
    __int16 v10 = 0;
  }
  else
  {
    int v14 = v13;
    if (v13 != 100)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v16 = 138543874;
        int v17 = self;
        __int16 v18 = 2114;
        id v19 = v6;
        __int16 v20 = 1024;
        int v21 = v14;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Cannot retrieve persistent value for key %{public}@. sqlite status: %d", (uint8_t *)&v16, 0x1Cu);
      }
      goto LABEL_4;
    }
    id v15 = sqlite3_column_blob(v5, 0);
    __int16 v10 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15, sqlite3_column_bytes(v5, 0));
  }
  char v7 = 0;
  if (v5) {
LABEL_5:
  }
    sqlite3_reset(v5);
LABEL_6:
  if (v7) {
    id v11 = 0;
  }
  else {
    id v11 = v10;
  }

  return v11;
}

- (void)deletePersistentValueWithKey:(id)a3
{
  id v4 = a3;
  int v5 = [(MSASModelBase *)self dbQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__MSASModelBase_deletePersistentValueWithKey___block_invoke;
  v7[3] = &unk_1E6C3DB28;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __46__MSASModelBase_deletePersistentValueWithKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueDeletePersistentValueWithKey:*(void *)(a1 + 40)];
}

- (void)setPersistentObject:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v19 = 0;
  char v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:&v19];
  id v8 = v19;
  int v9 = v8;
  if (!v7)
  {
    __int16 v10 = NSString;
    id v11 = [v8 userInfo];
    __int16 v12 = [v10 stringWithFormat:@"Failed to archive an object. Error: %@ Info: %@", v9, v11];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      int v21 = v12;
      _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  int v13 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MSASModelBase_setPersistentObject_forKey___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v17 = v7;
  id v18 = v6;
  id v14 = v6;
  id v15 = v7;
  dispatch_async(v13, block);
}

uint64_t __44__MSASModelBase_setPersistentObject_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueSetPersistentData:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)persistentObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5291;
  int v16 = __Block_byref_object_dispose__5292;
  id v17 = 0;
  int v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSASModelBase_persistentObjectForKey___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __40__MSASModelBase_persistentObjectForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) dbQueuePersistentObjectForKey:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (void)setPersistentString:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__MSASModelBase_setPersistentString_forKey___block_invoke;
  block[3] = &unk_1E6C3D998;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __44__MSASModelBase_setPersistentString_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueSetPersistentString:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)persistentStringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__5291;
  int v16 = __Block_byref_object_dispose__5292;
  id v17 = 0;
  int v5 = [(MSASModelBase *)self dbQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__MSASModelBase_persistentStringForKey___block_invoke;
  block[3] = &unk_1E6C3D000;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __40__MSASModelBase_persistentStringForKey___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) dbQueuePersistentStringForKey:*(void *)(a1 + 40)];
  return MEMORY[0x1F41817F8]();
}

- (sqlite3_stmt)statementForString:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  if (v4)
  {
    int v5 = [(MSASModelBase *)self statementQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__MSASModelBase_statementForString___block_invoke;
    block[3] = &unk_1E6C3D000;
    block[4] = self;
    id v9 = v4;
    id v10 = &v11;
    dispatch_sync(v5, block);

    id v6 = (sqlite3_stmt *)v12[3];
  }
  else
  {
    id v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __36__MSASModelBase_statementForString___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  CFDictionaryRef v3 = *(const __CFDictionary **)(v2 + 32);
  if (v3)
  {
    Value = CFDictionaryGetValue(v3, *(const void **)(a1 + 40));
    if (Value)
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = Value;
      return;
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(v2 + 16), (const char *)[*(id *)(a1 + 40) UTF8String], -1, &ppStmt, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = sqlite3_errmsg(*(sqlite3 **)(v6 + 16));
      *(_DWORD *)buf = 138543874;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = v7;
      __int16 v14 = 2082;
      id v15 = v8;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not compile SQL query: %{public}@. sqlite error: %{public}s", buf, 0x20u);
    }
  }
  else if (ppStmt)
  {
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a1 + 32) + 32), *(const void **)(a1 + 40), ppStmt);
    int v5 = ppStmt;
    goto LABEL_11;
  }
  int v5 = 0;
LABEL_11:
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

- (void)shutDownForDestruction:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v12 = self;
    __int16 v13 = 1024;
    BOOL v14 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Shutting down. For destruction: %d", buf, 0x12u);
  }
  uint64_t v7 = [(MSASModelBase *)self dbQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke;
  v9[3] = &unk_1E6C3DB00;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

void __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) statementQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke_2;
  block[3] = &unk_1E6C3DA38;
  block[4] = *(void *)(a1 + 32);
  dispatch_sync(v2, block);

  CFDictionaryRef v3 = *(sqlite3 **)(*(void *)(a1 + 32) + 16);
  if (v3)
  {
    if (sqlite3_close(v3) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = sqlite3_errmsg(*(sqlite3 **)(v6 + 16));
      *(_DWORD *)buf = 138543618;
      uint64_t v10 = v6;
      __int16 v11 = 2082;
      __int16 v12 = v7;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Can't shut down. sqlite error: %{public}s. Ignoring.", buf, 0x16u);
    }
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
  }
  BOOL v4 = *(void **)(a1 + 40);
  if (v4)
  {
    int v5 = dispatch_get_global_queue(0, 0);
    dispatch_async(v5, v4);
  }
}

void __56__MSASModelBase_shutDownForDestruction_completionBlock___block_invoke_2(uint64_t a1)
{
  CFDictionaryRef v2 = *(const __CFDictionary **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    CFIndex Count = CFDictionaryGetCount(v2);
    if (Count)
    {
      uint64_t v4 = Count;
      size_t v5 = 8 * Count;
      uint64_t v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      uint64_t v7 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(*(void *)(a1 + 32) + 32), v6, v7);
      if (v4 >= 1)
      {
        id v8 = (sqlite3_stmt **)v7;
        do
        {
          id v9 = *v8++;
          sqlite3_finalize(v9);
          --v4;
        }
        while (v4);
      }
      free(v6);
      free(v7);
    }
    CFRelease(*(CFTypeRef *)(*(void *)(a1 + 32) + 32));
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
}

- (BOOL)dbQueueUpgradeFromDatabaseVersion:(int)a3 currentVersion:(int)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3 >= a4) {
    return 1;
  }
  uint64_t v4 = *(void *)&a4;
  errmsg = 0;
  if (sqlite3_exec(self->_db, "create table if not exists Properties(\n   key             text unique primary key,\n   value           blob\n);\n",
         0,
         0,
         &errmsg))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = self;
      __int16 v20 = 2082;
      int v21 = errmsg;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not create Properties table. Error: %{public}s", buf, 0x16u);
    }
    sqlite3_free(errmsg);
  }
  ppStmt = 0;
  uint64_t v6 = sqlite3_prepare_v2([(MSASModelBase *)self dbQueueDB], "insert or replace into Properties (key, value) values ('version', ?);",
         -1,
         &ppStmt,
         0);
  int v7 = v6;
  MSSqliteTrapForDBLockError(v6);
  if (v7)
  {
    int v8 = 216;
  }
  else
  {
    uint64_t v10 = ppStmt;
    objc_msgSend(NSString, "stringWithFormat:", @"%d", v4);
    id v11 = objc_claimAutoreleasedReturnValue();
    uint64_t v12 = sqlite3_bind_text(v10, 1, (const char *)[v11 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    LODWORD(v10) = v12;
    MSSqliteTrapForDBLockError(v12);

    if (v10)
    {
      int v8 = 218;
    }
    else
    {
      uint64_t v13 = sqlite3_step(ppStmt);
      int v14 = v13;
      MSSqliteTrapForDBLockError(v13);
      if (v14 == 101)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v19 = self;
          __int16 v20 = 1024;
          LODWORD(v21) = v4;
          _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@: Set database version to %d.", buf, 0x12u);
        }
        BOOL v9 = 1;
        goto LABEL_19;
      }
      int v8 = 219;
    }
  }
  MSLogSqliteError([(MSASModelBase *)self dbQueueDB], (uint64_t)self, v8);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v19 = self;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Failed to create properties table.", buf, 0xCu);
  }
  BOOL v9 = 0;
LABEL_19:
  if (ppStmt) {
    sqlite3_finalize(ppStmt);
  }
  return v9;
}

- (void)dbQueueInitializeDatabasePath:(id)a3 currentVersion:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  *(void *)&v38[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = 0;
  p_db = &self->_db;
  BOOL v9 = MEMORY[0x1E4F14500];
  *(void *)&long long v10 = 138543874;
  long long v31 = v10;
  do
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2112;
      *(void *)v38 = v6;
      _os_log_debug_impl(&dword_1DC434000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: Opening database at %@", buf, 0x16u);
    }
    ppStmt = 0;
    id v11 = objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager", v31);
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v12 fileExistsAtPath:v6];

    if (v13
      && sqlite3_open_v2((const char *)[v6 fileSystemRepresentation], &self->_db, 65542, 0))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2112;
        *(void *)v38 = v6;
        int v14 = v9;
        uint64_t v15 = "%{public}@ Cannot open sqlite3 database at path %@. Recreating database.";
        uint32_t v16 = 22;
LABEL_71:
        _os_log_error_impl(&dword_1DC434000, v14, OS_LOG_TYPE_ERROR, v15, buf, v16);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
    id v17 = *p_db;
    if (!*p_db)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        _os_log_impl(&dword_1DC434000, v9, OS_LOG_TYPE_INFO, "%{public}@: Creating new database.", buf, 0xCu);
      }
      __int16 v20 = [v6 stringByDeletingLastPathComponent];
      [v11 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:0 error:0];

      if (sqlite3_open_v2((const char *)[v6 fileSystemRepresentation], &self->_db, 65542, 0))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = self;
          __int16 v37 = 2112;
          *(void *)v38 = v6;
          _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Cannot create sqlite3 database at path %@. Carrying on.", buf, 0x16u);
        }
        *p_db = 0;
        goto LABEL_28;
      }
      id v17 = *p_db;
    }
    errmsg = 0;
    if (sqlite3_exec(v17, "pragma cache_size = -128;", 0, 0, &errmsg) && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2082;
      *(void *)v38 = errmsg;
      _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not set cache size. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (sqlite3_exec(*p_db, "pragma journal_mode = wal;", 0, 0, &errmsg)
      && os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2082;
      *(void *)v38 = errmsg;
      _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not set journal mode. Ignoring. Error: %{public}s", buf, 0x16u);
    }
    if (v7 & 1 | ((v13 & 1) == 0))
    {
      uint64_t v18 = 0xFFFFFFFFLL;
      goto LABEL_17;
    }
    if (sqlite3_prepare_v2(*p_db, "select value from Properties where key = 'version';", -1, &ppStmt, 0))
    {
      MSLogSqliteError(self->_db, (uint64_t)self, 117);
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138543362;
      v36 = self;
      int v14 = v9;
      uint64_t v15 = "%{public}@: Could not compile version check statement. Deleting database and recreating.";
LABEL_70:
      uint32_t v16 = 12;
      goto LABEL_71;
    }
    int v24 = sqlite3_step(ppStmt);
    if (v24)
    {
      if (v24 != 100)
      {
        MSLogSqliteError(self->_db, (uint64_t)self, 126);
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)buf = 138543362;
        v36 = self;
        int v14 = v9;
        uint64_t v15 = "%{public}@: Fatal error: Could not read current version. Deleting database and recreating.";
        goto LABEL_70;
      }
      v25 = MSSqliteStringFromStatementColumn(ppStmt, 0);
      uint64_t v18 = [v25 intValue];
    }
    else
    {
      uint64_t v18 = 0xFFFFFFFFLL;
    }
    if ((int)v18 > (int)v4)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v31;
        v36 = self;
        __int16 v37 = 1024;
        *(_DWORD *)v38 = v18;
        v38[2] = 1024;
        *(_DWORD *)&v38[3] = v4;
        int v14 = v9;
        uint64_t v15 = "%{public}@: Fatal error: database version %d is greater than what the model understands (%d). Deleting dat"
              "abase and recreating.";
        uint32_t v16 = 24;
        goto LABEL_71;
      }
LABEL_21:
      BOOL v19 = 0;
      char v7 = 1;
      goto LABEL_47;
    }
LABEL_17:
    if (v18 == v4)
    {
      char v7 = 0;
LABEL_28:
      BOOL v19 = 1;
      goto LABEL_47;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = v31;
      v36 = self;
      __int16 v37 = 1024;
      *(_DWORD *)v38 = v18;
      v38[2] = 1024;
      *(_DWORD *)&v38[3] = v4;
      _os_log_impl(&dword_1DC434000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Migrating database from version %d to version %d.", buf, 0x18u);
    }
    v32 = 0;
    if (sqlite3_exec(*p_db, "savepoint migration;", 0, 0, &v32))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2082;
        *(void *)v38 = v32;
        _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not begin transaction. Error: %{public}s", buf, 0x16u);
      }
      sqlite3_free(v32);
    }
    BOOL v19 = [(MSASModelBase *)self dbQueueUpgradeFromDatabaseVersion:v18 currentVersion:v4];
    db = self->_db;
    if (v19)
    {
      if (sqlite3_exec(db, "release savepoint migration;", 0, 0, &v32))
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = self;
          __int16 v37 = 2082;
          *(void *)v38 = v32;
          uint64_t v22 = v9;
          id v23 = "%{public}@: Could not end transaction. Error: %{public}s";
LABEL_73:
          _os_log_error_impl(&dword_1DC434000, v22, OS_LOG_TYPE_ERROR, v23, buf, 0x16u);
          goto LABEL_45;
        }
        goto LABEL_45;
      }
    }
    else if (sqlite3_exec(db, "rollback transaction to savepoint migration;", 0, 0, &v32))
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v36 = self;
        __int16 v37 = 2082;
        *(void *)v38 = v32;
        uint64_t v22 = v9;
        id v23 = "%{public}@: Could not roll back transaction. Error: %{public}s";
        goto LABEL_73;
      }
LABEL_45:
      sqlite3_free(v32);
    }
    char v7 = !v19;
LABEL_47:
    if (ppStmt) {
      sqlite3_finalize(ppStmt);
    }
    ppStmt = 0;
    if (v7)
    {
      v26 = *p_db;
      if (!*p_db) {
        goto LABEL_57;
      }
      LODWORD(v32) = 129;
      int v27 = sqlite3_file_control(v26, 0, 101, &v32);
      if (v27)
      {
        MSLogSqliteError(self->_db, (uint64_t)self, 174);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v36 = self;
          __int16 v37 = 1024;
          *(_DWORD *)v38 = v27;
          _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not truncate sqlite database (%d).", buf, 0x12u);
        }
      }
      if (sqlite3_close(*p_db)
        && (MSLogSqliteError(self->_db, (uint64_t)self, 178), os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)))
      {
        *(_DWORD *)buf = 138543362;
        v36 = self;
        _os_log_error_impl(&dword_1DC434000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Could not close sqlite database.", buf, 0xCu);
        if (v27)
        {
LABEL_57:
          [v11 removeItemAtPath:v6 error:0];
          v28 = [v6 stringByAppendingString:@"-shm"];
          [v11 removeItemAtPath:v28 error:0];

          v29 = [v6 stringByAppendingString:@"-wal"];
          [v11 removeItemAtPath:v29 error:0];

          v30 = [v6 stringByAppendingString:@"-journal"];
          [v11 removeItemAtPath:v30 error:0];
        }
      }
      else if (v27)
      {
        goto LABEL_57;
      }
      self->_db = 0;
      self->_dbWasRecreated = 1;
    }
  }
  while (!v19);
  if (*p_db && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v36 = self;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@: Database ready.", buf, 0xCu);
  }
}

- (sqlite3)db
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  CFDictionaryRef v3 = [(MSASModelBase *)self dbQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __19__MSASModelBase_db__block_invoke;
  v6[3] = &unk_1E6C3DA60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  uint64_t v4 = (sqlite3 *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __19__MSASModelBase_db__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (MSASModelBase)initWithPersonID:(id)a3 databasePath:(id)a4 currentVersion:(int)a5
{
  id v9 = a3;
  id v10 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MSASModelBase;
  id v11 = [(MSASModelBase *)&v32 init];
  if (v11)
  {
    uint64_t v12 = NSString;
    int v13 = (objc_class *)objc_opt_class();
    int v14 = NSStringFromClass(v13);
    uint64_t v15 = [v12 stringWithFormat:@"MSASModelBase statement queue - %@", v14];

    id v16 = v15;
    dispatch_queue_t v17 = dispatch_queue_create((const char *)[v16 UTF8String], 0);
    statementQueue = v11->_statementQueue;
    v11->_statementQueue = (OS_dispatch_queue *)v17;

    BOOL v19 = NSString;
    __int16 v20 = (objc_class *)objc_opt_class();
    int v21 = NSStringFromClass(v20);
    uint64_t v22 = [v19 stringWithFormat:@"MSASModelBase db queue - %@", v21];

    id v23 = v22;
    dispatch_queue_t v24 = dispatch_queue_create((const char *)[v23 UTF8String], 0);
    dbQueue = v11->_dbQueue;
    v11->_dbQueue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v11->_personID, a3);
    v11->_statements = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], &initWithPersonID_databasePath_currentVersion__doNothingCallbacks);
    v26 = [(MSASModelBase *)v11 dbQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__MSASModelBase_initWithPersonID_databasePath_currentVersion___block_invoke;
    block[3] = &unk_1E6C3D280;
    v29 = v11;
    id v30 = v10;
    int v31 = a5;
    dispatch_sync(v26, block);
  }
  return v11;
}

uint64_t __62__MSASModelBase_initWithPersonID_databasePath_currentVersion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dbQueueInitializeDatabasePath:*(void *)(a1 + 40) currentVersion:*(unsigned int *)(a1 + 48)];
}

@end