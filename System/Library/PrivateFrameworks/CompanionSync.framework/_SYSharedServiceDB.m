@interface _SYSharedServiceDB
+ (id)sharedInstanceForServiceName:(id)a3;
+ (void)_releaseSharedInstanceForServiceName:(id)a3;
+ (void)initialize;
+ (void)pairingStorePathWasReset;
- (BOOL)_LOCKED_createOrOpenDBForServiceName:(id)a3 error:(id *)a4;
- (BOOL)_LOCKED_ensureDBExists;
- (BOOL)_LOCKED_hasSchemaVersionForClient:(id)a3;
- (BOOL)_addSkipBackupAttributeToItemAtPath:(id)a3 error:(id *)a4;
- (BOOL)_ensureParentExists:(id)a3 error:(id *)a4;
- (BOOL)_runTransactionBlock:(id)a3 exclusive:(BOOL)a4;
- (BOOL)inExclusiveTransaction:(id)a3;
- (BOOL)inTransaction:(id)a3;
- (NSString)_dbPath;
- (_SYSharedServiceDB)initWithServiceName:(id)a3;
- (int64_t)_LOCKED_getClientVersion:(id)a3;
- (int64_t)schemaVersionForClient:(id)a3;
- (void)_LOCKED_ensureDBExists;
- (void)_LOCKED_ensureSchemaVersionsTableInDB:(sqlite3 *)a3;
- (void)_LOCKED_runSchemaUpdate:(id)a3 forClientNamed:(id)a4;
- (void)_LOCKED_setVersion:(int64_t)a3 forClient:(id)a4;
- (void)_ensureSchemaVersionsTable;
- (void)dealloc;
- (void)setSchemaVersion:(int64_t)a3 forClient:(id)a4;
- (void)updateSchemaForClient:(id)a3 usingBlock:(id)a4;
- (void)withDBRef:(id)a3;
@end

@implementation _SYSharedServiceDB

- (void)withDBRef:(id)a3
{
  v5 = (void (**)(id, sqlite3 *))a3;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)os_transaction_create();
  if ([(_SYSharedServiceDB *)self _LOCKED_ensureDBExists]) {
    v5[2](v5, self->_db);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_LOCKED_ensureDBExists
{
  if (self->_db) {
    return 1;
  }
  p_name = (uint64_t *)&self->_name;
  name = self->_name;
  id v11 = 0;
  BOOL v2 = [(_SYSharedServiceDB *)self _LOCKED_createOrOpenDBForServiceName:name error:&v11];
  id v6 = v11;
  if (v2)
  {
    schemaSetupCallbacks = self->_schemaSetupCallbacks;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __44___SYSharedServiceDB__LOCKED_ensureDBExists__block_invoke;
    v10[3] = &unk_264422A00;
    v10[4] = self;
    [(NSMutableDictionary *)schemaSetupCallbacks enumerateKeysAndObjectsUsingBlock:v10];
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v8 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      [(_SYSharedServiceDB *)p_name _LOCKED_ensureDBExists];
    }
  }

  return v2;
}

- (void)_LOCKED_ensureDBExists
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Failed to open shared DB for service %{public}@: %@", (uint8_t *)&v4, 0x16u);
}

- (BOOL)_LOCKED_createOrOpenDBForServiceName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = SYServiceDataPath();
  uint64_t v8 = [v7 stringByAppendingPathComponent:v6];

  v9 = [v8 stringByAppendingPathExtension:@"db"];

  if (![(_SYSharedServiceDB *)self _ensureParentExists:v9 error:a4]) {
    goto LABEL_11;
  }
  p_db = &self->_db;
  int v11 = sqlite3_open_v2((const char *)[v9 fileSystemRepresentation], &self->_db, 4194310, 0);
  if (!v11 && *p_db)
  {
    sqlite3_exec(*p_db, "PRAGMA journal_mode=WAL;", 0, 0, 0);
    sqlite3_busy_timeout(self->_db, 10000);
    BOOL v13 = 1;
    sqlite3_extended_result_codes(self->_db, 1);
    sqlite3_wal_checkpoint_v2(self->_db, 0, 3, 0, 0);
    sqlite3_wal_hook(self->_db, (int (__cdecl *)(void *, sqlite3 *, const char *, int))_SYAutoTruncateHook, 0);
    [(_SYSharedServiceDB *)self _LOCKED_ensureSchemaVersionsTableInDB:self->_db];
    goto LABEL_12;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v12 = qword_26AB04798;
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    -[_SYSharedServiceDB _LOCKED_createOrOpenDBForServiceName:error:](v11, v12);
  }
  if (*p_db)
  {
    sqlite3_close(*p_db);
    *p_db = 0;
  }
  if (a4)
  {
    NSErrorFromSQLiteError(v11);
    BOOL v13 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    BOOL v13 = 0;
  }
LABEL_12:

  return v13;
}

- (BOOL)_ensureParentExists:(id)a3 error:(id *)a4
{
  v22[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x263F08028];
  v21[0] = *MEMORY[0x263F08060];
  v21[1] = v7;
  v22[0] = @"mobile";
  v22[1] = @"mobile";
  v21[2] = *MEMORY[0x263F08078];
  v22[2] = &unk_26CD33880;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];
  id v9 = 0;
  uint64_t v10 = *MEMORY[0x263F07F70];
  while (1)
  {

    int v11 = [MEMORY[0x263F08850] defaultManager];
    v12 = [v6 stringByDeletingLastPathComponent];
    id v20 = 0;
    char v13 = [v11 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:v8 error:&v20];
    id v9 = v20;

    if (v13)
    {
LABEL_5:
      if (!v9) {
        goto LABEL_9;
      }
LABEL_6:
      if (a4) {
        *a4 = v9;
      }
      goto LABEL_14;
    }
    v14 = [v9 domain];
    if (![v14 isEqualToString:v10]) {
      break;
    }
    uint64_t v15 = [v9 code];

    if (v15 != 516) {
      goto LABEL_5;
    }
  }

  if (v9) {
    goto LABEL_6;
  }
LABEL_9:
  v16 = [v6 stringByDeletingLastPathComponent];
  BOOL v17 = [(_SYSharedServiceDB *)self _addSkipBackupAttributeToItemAtPath:v16 error:a4];

  if (!v17)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v18 = (void *)qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[_SYSharedServiceDB _ensureParentExists:error:](a4, v18);
    }
  }
LABEL_14:

  return v9 == 0;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    id v2 = (id)[v3 addObserverForName:@"SYDeviceTargetedNewDeviceNotification" object:0 queue:0 usingBlock:&__block_literal_global_0];
  }
}

+ (void)pairingStorePathWasReset
{
  GetServiceInstanceTable();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
  id v2 = (void *)MEMORY[0x21D4B1560]();
  [v3 removeAllObjects];
  os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
}

+ (id)sharedInstanceForServiceName:(id)a3
{
  id v3 = a3;
  int v4 = GetServiceInstanceTable();
  os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
  uint64_t v5 = [v4 objectForKey:v3];
  if (!v5)
  {
    uint64_t v5 = [[_SYWeakServiceDBRef alloc] initWithServiceName:v3];
    if (v5) {
      [v4 setObject:v5 forKey:v3];
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
  id v6 = [(_SYWeakServiceDBRef *)v5 db];

  return v6;
}

- (_SYSharedServiceDB)initWithServiceName:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SYSharedServiceDB;
  id v6 = [(_SYSharedServiceDB *)&v12 init];
  uint64_t v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = objc_opt_new();
    schemaSetupCallbacks = v7->_schemaSetupCallbacks;
    v7->_schemaSetupCallbacks = (NSMutableDictionary *)v8;

    uint64_t v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  db = self->_db;
  if (db)
  {
    sqlite3_close(db);
    self->_db = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_SYSharedServiceDB;
  [(_SYSharedServiceDB *)&v4 dealloc];
}

- (BOOL)_addSkipBackupAttributeToItemAtPath:(id)a3 error:(id *)a4
{
  id v5 = [NSURL fileURLWithPath:a3];
  LOBYTE(a4) = [v5 setResourceValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263EFF6B0] error:a4];

  return (char)a4;
}

- (BOOL)_LOCKED_hasSchemaVersionForClient:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_db, "SELECT count(*) FROM _clients WHERE name=?", -1, &ppStmt, 0);
  if (v5)
  {
    if (v5 != 1)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[_SYSharedServiceDB _LOCKED_hasSchemaVersionForClient:]();
      }
    }
    BOOL v6 = 0;
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
    int v7 = sqlite3_step(ppStmt);
    BOOL v6 = 0;
    if (v7 && v7 != 101)
    {
      if (v7 == 100)
      {
        BOOL v6 = sqlite3_column_int(ppStmt, 0) != 0;
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          -[_SYSharedServiceDB _LOCKED_hasSchemaVersionForClient:]();
        }
        BOOL v6 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (int64_t)_LOCKED_getClientVersion:(id)a3
{
  id v4 = a3;
  ppStmt = 0;
  int v5 = sqlite3_prepare_v2(self->_db, "SELECT schema_version FROM _clients WHERE name=?", -1, &ppStmt, 0);
  if (v5)
  {
    int64_t v6 = 0;
    if (v5 != 1)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[_SYSharedServiceDB _LOCKED_getClientVersion:]();
      }
      int64_t v6 = 0;
    }
  }
  else
  {
    sqlite3_bind_text(ppStmt, 1, (const char *)[v4 UTF8String], -1, 0);
    int v7 = sqlite3_step(ppStmt);
    int64_t v6 = 0;
    if (v7 && v7 != 101)
    {
      if (v7 == 100)
      {
        int64_t v6 = sqlite3_column_int(ppStmt, 0);
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
          -[_SYSharedServiceDB _LOCKED_getClientVersion:]();
        }
        int64_t v6 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v6;
}

- (void)_LOCKED_setVersion:(int64_t)a3 forClient:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  ppStmt = 0;
  if ([(_SYSharedServiceDB *)self _LOCKED_hasSchemaVersionForClient:v6]) {
    int v7 = "UPDATE _clients SET schema_version=?, tstamp=datetime('now') WHERE name=?";
  }
  else {
    int v7 = "INSERT INTO _clients (schema_version, name, tstamp) VALUES (?, ?, datetime('now'))";
  }
  if (sqlite3_prepare_v2(self->_db, v7, -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[_SYSharedServiceDB _LOCKED_setVersion:forClient:]();
    }
  }
  else
  {
    sqlite3_bind_int(ppStmt, 1, v4);
    sqlite3_bind_text(ppStmt, 2, (const char *)[v6 UTF8String], -1, 0);
    int v8 = sqlite3_step(ppStmt);
    if (v8 && v8 != 101)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[_SYSharedServiceDB _LOCKED_setVersion:forClient:]();
      }
    }
    sqlite3_finalize(ppStmt);
  }
}

- (void)_LOCKED_ensureSchemaVersionsTableInDB:(sqlite3 *)a3
{
  int64_t v5 = [(_SYSharedServiceDB *)self _LOCKED_getClientVersion:@"self"];
  if (!v5)
  {
    sqlite3_exec(a3, "CREATE TABLE IF NOT EXISTS _clients (name TEXT, schema_version TEXT, tstamp TEXT)", 0, 0, 0);
    int64_t v5 = 1;
  }
  [(_SYSharedServiceDB *)self _LOCKED_setVersion:v5 forClient:@"self"];
}

- (void)_ensureSchemaVersionsTable
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48___SYSharedServiceDB__ensureSchemaVersionsTable__block_invoke;
  v2[3] = &unk_2644229D8;
  v2[4] = self;
  [(_SYSharedServiceDB *)self withDBRef:v2];
}

- (int64_t)schemaVersionForClient:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)os_transaction_create();
  if ([(_SYSharedServiceDB *)self _LOCKED_ensureDBExists]) {
    int64_t v7 = [(_SYSharedServiceDB *)self _LOCKED_getClientVersion:v4];
  }
  else {
    int64_t v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (void)setSchemaVersion:(int64_t)a3 forClient:(id)a4
{
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)os_transaction_create();
  if ([(_SYSharedServiceDB *)self _LOCKED_ensureDBExists]) {
    [(_SYSharedServiceDB *)self _LOCKED_setVersion:a3 forClient:v7];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_LOCKED_runSchemaUpdate:(id)a3 forClientNamed:(id)a4
{
  uint64_t v10 = (uint64_t (**)(id, sqlite3 *, int64_t))a3;
  id v6 = a4;
  id v7 = (void *)os_transaction_create();
  int64_t v8 = [(_SYSharedServiceDB *)self _LOCKED_getClientVersion:v6];
  uint64_t v9 = v10[2](v10, self->_db, v8);
  if (v9 != v8) {
    [(_SYSharedServiceDB *)self _LOCKED_setVersion:v9 forClient:v6];
  }
}

- (void)updateSchemaForClient:(id)a3 usingBlock:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  id v7 = (void *)os_transaction_create();
  if (self->_db)
  {
    [(_SYSharedServiceDB *)self _LOCKED_runSchemaUpdate:v6 forClientNamed:v9];
  }
  else
  {
    int64_t v8 = (void *)MEMORY[0x21D4B17C0](v6);
    [(NSMutableDictionary *)self->_schemaSetupCallbacks setObject:v8 forKeyedSubscript:v9];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)_runTransactionBlock:(id)a3 exclusive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = (unsigned int (**)(id, sqlite3 *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v8 = (void *)os_transaction_create();
  if (![(_SYSharedServiceDB *)self _LOCKED_ensureDBExists])
  {
    os_unfair_lock_unlock(&self->_lock);

LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  errmsg = 0;
  if (v4) {
    id v9 = "BEGIN EXCLUSIVE TRANSACTION";
  }
  else {
    id v9 = "BEGIN TRANSACTION";
  }
  uint64_t v10 = sqlite3_exec(self->_db, v9, 0, 0, &errmsg);
  BOOL v11 = v10 == 0;
  if (v10)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    objc_super v12 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[_SYSharedServiceDB _runTransactionBlock:exclusive:]((const char **)&errmsg, v10, v12);
    }
    if (errmsg)
    {
      sqlite3_free(errmsg);
      errmsg = 0;
    }
    goto LABEL_12;
  }
  if (!v6[2](v6, self->_db))
  {
LABEL_23:
    int v16 = sqlite3_exec(self->_db, "ROLLBACK TRANSACTION", 0, 0, &errmsg);
    if (!v16) {
      goto LABEL_29;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    BOOL v17 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR))
    {
      v18 = "non-exclusive";
      if (v4) {
        v18 = "exclusive";
      }
      *(_DWORD *)buf = 136315650;
      v24 = v18;
      if (errmsg) {
        v19 = errmsg;
      }
      else {
        v19 = "[nil]";
      }
      __int16 v25 = 1024;
      int v26 = v16;
      __int16 v27 = 2082;
      v28 = v19;
      _os_log_error_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_ERROR, "Failed to rollback %s transaction: %{companionsync:sqlite3err}d (%{public}s)", buf, 0x1Cu);
    }
    if (errmsg)
    {
      sqlite3_free(errmsg);
      errmsg = 0;
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
LABEL_29:
      os_unfair_lock_unlock(p_lock);
    }
    goto LABEL_14;
  }
  int v14 = sqlite3_exec(self->_db, "COMMIT TRANSACTION", 0, 0, &errmsg);
  if (v14)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v15 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR))
    {
      id v20 = "non-exclusive";
      if (v4) {
        id v20 = "exclusive";
      }
      *(_DWORD *)buf = 136315650;
      v24 = v20;
      if (errmsg) {
        v21 = errmsg;
      }
      else {
        v21 = "[nil]";
      }
      __int16 v25 = 1024;
      int v26 = v14;
      __int16 v27 = 2082;
      v28 = v21;
      _os_log_error_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_ERROR, "Failed to commit %s transaction: %{companionsync:sqlite3err}d (%{public}s)", buf, 0x1Cu);
    }
    if (errmsg)
    {
      sqlite3_free(errmsg);
      errmsg = 0;
    }
    goto LABEL_23;
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_lock);

LABEL_15:
  return v11;
}

- (BOOL)inTransaction:(id)a3
{
  return [(_SYSharedServiceDB *)self _runTransactionBlock:a3 exclusive:0];
}

- (BOOL)inExclusiveTransaction:(id)a3
{
  return [(_SYSharedServiceDB *)self _runTransactionBlock:a3 exclusive:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schemaSetupCallbacks, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)_releaseSharedInstanceForServiceName:(id)a3
{
  id v5 = a3;
  id v3 = GetServiceInstanceTable();
  os_unfair_lock_lock((os_unfair_lock_t)&__tableLock);
  BOOL v4 = (void *)MEMORY[0x21D4B1560]();
  [v3 removeObjectForKey:v5];
  os_unfair_lock_unlock((os_unfair_lock_t)&__tableLock);
}

- (NSString)_dbPath
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  int64_t v8 = __Block_byref_object_copy_;
  id v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46___SYSharedServiceDB_UnitTestHelpers___dbPath__block_invoke;
  v4[3] = &unk_264422A28;
  v4[4] = &v5;
  [(_SYSharedServiceDB *)self withDBRef:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

- (void)_ensureParentExists:(void *)a1 error:(void *)a2 .cold.1(void **a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *a1;
  id v3 = a2;
  BOOL v4 = _SYObfuscate(v2);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "Failed to set do-not-backup property on persistent data folder: %{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)_LOCKED_hasSchemaVersionForClient:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Error checking inclusion of client %{public}@: %{companionsync:sqlite3err}d");
}

- (void)_LOCKED_getClientVersion:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Error fetching schema version for %{public}@: %{companionsync:sqlite3err}d");
}

- (void)_LOCKED_setVersion:forClient:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Error setting schema version for %{public}@: %{companionsync:sqlite3err}d");
}

- (void)_LOCKED_createOrOpenDBForServiceName:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_ERROR, "Failed to open SQLite DB: %{companionsync:sqlite3err}d", (uint8_t *)v2, 8u);
}

- (void)_runTransactionBlock:(NSObject *)a3 exclusive:.cold.1(const char **a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    uint64_t v3 = "[nil]";
  }
  LODWORD(v4) = 67109378;
  HIDWORD(v4) = a2;
  LOWORD(v5) = 2082;
  *(void *)((char *)&v5 + 2) = v3;
  OUTLINED_FUNCTION_1(&dword_21C7C9000, a2, a3, "Failure to begin transaction: %{companionsync:sqlite3err}d (%{public}s)", v4, (void)v5, WORD4(v5), *MEMORY[0x263EF8340]);
}

@end