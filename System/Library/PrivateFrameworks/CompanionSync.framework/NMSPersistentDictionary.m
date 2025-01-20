@interface NMSPersistentDictionary
- (NMSPersistentDictionary)init;
- (NMSPersistentDictionary)initWithPath:(id)a3 objectClass:(Class)a4 loggingFacility:(__CFString *)a5;
- (NMSPersistentDictionary)initWithSharedDBForService:(id)a3 objectClass:(Class)a4;
- (id)_dataFromObject:(id)a3;
- (id)_objectFromData:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectWithOldestExpirationDate:(id *)a3;
- (unint64_t)_checkSchemaVersion;
- (void)_ensureDBSchema;
- (void)_openDBForceRecreate:(BOOL)a3;
- (void)_prepareStatements;
- (void)_withDB:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsSortedByEnqueueDate:(id)a3;
- (void)enumerateObjectsSortedByExpirationDate:(id)a3;
- (void)lock;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)resetObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKey:(id)a4 expires:(id)a5;
- (void)unlock;
@end

@implementation NMSPersistentDictionary

- (NMSPersistentDictionary)init
{
  return 0;
}

- (NMSPersistentDictionary)initWithPath:(id)a3 objectClass:(Class)a4 loggingFacility:(__CFString *)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NMSPersistentDictionary;
  v9 = [(NMSPersistentDictionary *)&v16 init];
  if (v9)
  {
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    lock = v9->_lock;
    v9->_lock = (OS_dispatch_semaphore *)v10;

    uint64_t v12 = [v8 copy];
    path = v9->_path;
    v9->_path = (NSString *)v12;

    v9->_objectClass = a4;
    if (a5) {
      v9->_loggingFacility = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a5);
    }
    [(NMSPersistentDictionary *)v9 _openDBForceRecreate:0];
    v14 = v9;
  }

  return v9;
}

- (NMSPersistentDictionary)initWithSharedDBForService:(id)a3 objectClass:(Class)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NMSPersistentDictionary;
  v7 = [(NMSPersistentDictionary *)&v14 init];
  if (v7)
  {
    uint64_t v8 = +[_SYSharedServiceDB sharedInstanceForServiceName:v6];
    sharedDB = v7->_sharedDB;
    v7->_sharedDB = (_SYSharedServiceDB *)v8;

    if (!v7->_sharedDB)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[NMSPersistentDictionary initWithSharedDBForService:objectClass:]();
      }
    }
    v7->_objectClass = a4;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(1);
    lock = v7->_lock;
    v7->_lock = (OS_dispatch_semaphore *)v10;

    [(NMSPersistentDictionary *)v7 _ensureDBSchema];
    [(NMSPersistentDictionary *)v7 _prepareStatements];
    uint64_t v12 = v7;
  }

  return v7;
}

- (void)dealloc
{
  loggingFacility = self->_loggingFacility;
  if (loggingFacility) {
    CFRelease(loggingFacility);
  }
  if (self->_db || self->_sharedDB)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__NMSPersistentDictionary_dealloc__block_invoke;
    v6[3] = &unk_2644229D8;
    v6[4] = self;
    [(NMSPersistentDictionary *)self _withDB:v6];
    db = self->_db;
    if (db) {
      sqlite3_close(db);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NMSPersistentDictionary;
  [(NMSPersistentDictionary *)&v5 dealloc];
}

uint64_t __34__NMSPersistentDictionary_dealloc__block_invoke(uint64_t a1)
{
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
  v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 104);
  return sqlite3_finalize(v2);
}

- (void)lock
{
  if (!self->_sharedDB) {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_lock, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)unlock
{
  if (!self->_sharedDB) {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lock);
  }
}

- (void)_withDB:(id)a3
{
  sharedDB = self->_sharedDB;
  if (sharedDB) {
    [(_SYSharedServiceDB *)sharedDB withDBRef:a3];
  }
  else {
    (*((void (**)(id, sqlite3 *))a3 + 2))(a3, self->_db);
  }
}

- (unint64_t)_checkSchemaVersion
{
  ppStmt = 0;
  if (!sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", -1, &ppStmt, 0))
  {
    int v3 = sqlite3_step(ppStmt);
    if (v3 != 101)
    {
      if (v3 == 100)
      {
        unint64_t v2 = sqlite3_column_int(ppStmt, 0);
LABEL_15:
        sqlite3_reset(ppStmt);
        sqlite3_finalize(ppStmt);
        return v2;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
    unint64_t v2 = 0;
    goto LABEL_15;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
  }
  return 0;
}

- (void)_openDBForceRecreate:(BOOL)a3
{
  BOOL v3 = a3;
  v28[3] = *MEMORY[0x263EF8340];
  p_path = (uint64_t *)&self->_path;
  id v6 = self->_path;
  v7 = [MEMORY[0x263F08850] defaultManager];
  char v8 = [v7 fileExistsAtPath:v6];

  if ((v8 & 1) == 0)
  {
    id v12 = [(NSString *)v6 stringByDeletingLastPathComponent];
    uint64_t v14 = *MEMORY[0x263F08028];
    v27[0] = *MEMORY[0x263F08060];
    v27[1] = v14;
    v28[0] = @"mobile";
    v28[1] = @"mobile";
    v27[2] = *MEMORY[0x263F08078];
    v28[2] = &unk_26CD338F8;
    v15 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:3];
    objc_super v16 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    char v17 = [v16 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:v15 error:&v26];
    id v18 = v26;

    if ((v17 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v19 = (void *)qword_26AB04798;
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[NMSPersistentDictionary _openDBForceRecreate:].cold.5(v19, v18);
      }
    }

    goto LABEL_18;
  }
  if (v3)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v9 = qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[NMSPersistentDictionary _openDBForceRecreate:].cold.4(v9);
    }
    dispatch_semaphore_t v10 = [MEMORY[0x263F08850] defaultManager];
    id v25 = 0;
    char v11 = [v10 removeItemAtPath:v6 error:&v25];
    id v12 = v25;

    if ((v11 & 1) == 0)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v13 = (void *)qword_26AB04798;
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        -[NMSPersistentDictionary _openDBForceRecreate:](v13, v12);
      }
    }
LABEL_18:
  }
  v20 = v6;
  p_db = &self->_db;
  int v22 = sqlite3_open_v2([(NSString *)v20 fileSystemRepresentation], &self->_db, 4194310, 0);
  if (!v22 && *p_db)
  {
    ExecuteSQL_1(*p_db, "PRAGMA journal_mode=WAL;");
    sqlite3_busy_timeout(self->_db, 60000);
    sqlite3_extended_result_codes(self->_db, 1);
    ExecuteSQL_1(self->_db, "CREATE TABLE IF NOT EXISTS meta (v INTEGER PRIMARY KEY AUTOINCREMENT, t TEXT)");
    unint64_t v24 = [(NMSPersistentDictionary *)self _checkSchemaVersion];
    if (v24 != 1)
    {
      if (v24)
      {
LABEL_38:
        [(NMSPersistentDictionary *)self _prepareStatements];
        goto LABEL_39;
      }
      ExecuteSQL_1(*p_db, "CREATE TABLE kvs (k0 TEXT, d0 REAL, v0 BLOB)");
      ExecuteSQL_1(*p_db, "CREATE UNIQUE INDEX k0 ON kvs (k0)");
      ExecuteSQL_1(*p_db, "CREATE INDEX d0 ON kvs (d0)");
      ExecuteSQL_1(*p_db, "INSERT INTO meta (t) VALUES (datetime('now'))");
    }
    ExecuteSQL_1(*p_db, "ALTER TABLE kvs ADD COLUMN d1 REAL DEFAULT 0");
    ExecuteSQL_1(*p_db, "CREATE INDEX d1 ON kvs (d1)");
    ExecuteSQL_1(*p_db, "INSERT INTO meta (t) VALUES (datetime('now'))");
    goto LABEL_38;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v23 = qword_26AB04798;
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
    [(NMSPersistentDictionary *)p_path _openDBForceRecreate:v23];
  }
  if (*p_db)
  {
    sqlite3_close(*p_db);
    *p_db = 0;
  }
  if (v3)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[NMSPersistentDictionary _openDBForceRecreate:]();
    }
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"Could not open DB"];
  }
  else
  {
    [(NMSPersistentDictionary *)self _openDBForceRecreate:1];
  }
LABEL_39:
}

- (void)_ensureDBSchema
{
  sharedDB = self->_sharedDB;
  BOOL v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(_SYSharedServiceDB *)sharedDB updateSchemaForClient:v4 usingBlock:&__block_literal_global_8];
}

uint64_t __42__NMSPersistentDictionary__ensureDBSchema__block_invoke(int a1, sqlite3 *a2, uint64_t a3)
{
  if (a3 != 1)
  {
    uint64_t result = a3;
    if (a3) {
      return result;
    }
    ExecuteSQL_1(a2, "CREATE TABLE kvs (k0 TEXT, d0 REAL, v0 BLOB)");
    ExecuteSQL_1(a2, "CREATE UNIQUE INDEX k0 ON kvs (k0)");
    ExecuteSQL_1(a2, "CREATE INDEX d0 ON kvs (d0)");
  }
  ExecuteSQL_1(a2, "ALTER TABLE kvs ADD COLUMN d1 REAL DEFAULT 0");
  ExecuteSQL_1(a2, "CREATE INDEX d1 ON kvs (d1)");
  return 2;
}

- (void)_prepareStatements
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __45__NMSPersistentDictionary__prepareStatements__block_invoke;
  v2[3] = &unk_2644229D8;
  v2[4] = self;
  [(NMSPersistentDictionary *)self _withDB:v2];
}

void __45__NMSPersistentDictionary__prepareStatements__block_invoke(uint64_t a1, sqlite3 *db)
{
  if (sqlite3_prepare_v2(db, "INSERT OR REPLACE INTO kvs (k0, d0, v0, d1) VALUES (?, ?, ?, ?)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 64), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "UPDATE kvs SET v0 = ? WHERE k0 = ?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT v0 FROM kvs WHERE k0 = ?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM kvs WHERE k0 = ?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM kvs", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 88), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT k0, d0, v0 FROM kvs ORDER BY d0 ASC", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT k0, d0, v0, d1 FROM kvs ORDER BY d1 ASC", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 104), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (id)_objectFromData:(id)a3
{
  if (a3)
  {
    id v4 = (objc_class *)MEMORY[0x263F08928];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initForReadingFromData:v5 error:0];

    v7 = (void *)[objc_alloc(self->_objectClass) initWithCoder:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_dataFromObject:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x263F08910];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initRequiringSecureCoding:1];
  [v4 encodeWithCoder:v5];

  id v6 = [v5 encodedData];

  return v6;
}

- (void)setObject:(id)a3 forKey:(id)a4 expires:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = objc_opt_new();
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__NMSPersistentDictionary_setObject_forKey_expires___block_invoke;
  v16[3] = &unk_264423D98;
  v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v8;
  id v20 = v11;
  id v12 = v11;
  id v13 = v8;
  id v14 = v10;
  id v15 = v9;
  [(NMSPersistentDictionary *)self _withDB:v16];
}

void __52__NMSPersistentDictionary_setObject_forKey_expires___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64), 1, *(id *)(a1 + 40));
  unint64_t v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 64);
  [*(id *)(a1 + 48) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(v2, 2, v3);
  id v4 = [*(id *)(a1 + 32) _dataFromObject:*(void *)(a1 + 56)];
  BindData_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64), 3, v4);
  id v5 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 64);
  [*(id *)(a1 + 64) timeIntervalSinceReferenceDate];
  sqlite3_bind_double(v5, 4, v6);
  int v7 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
  if (v7 && v7 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__12;
  id v15 = __Block_byref_object_dispose__12;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__NMSPersistentDictionary_objectForKey___block_invoke;
  v8[3] = &unk_264423958;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(NMSPersistentDictionary *)self _withDB:v8];
  double v6 = [(NMSPersistentDictionary *)self _objectFromData:v12[5]];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __40__NMSPersistentDictionary_objectForKey___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 1, *(id *)(a1 + 40));
  int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  if (v2 != 101)
  {
    if (v2 == 100)
    {
      uint64_t v3 = ReadData_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 0);
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      id v5 = *(void **)(v4 + 40);
      *(void *)(v4 + 40) = v3;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__NMSPersistentDictionary_removeObjectForKey___block_invoke;
  v6[3] = &unk_2644236C0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NMSPersistentDictionary *)self _withDB:v6];
}

uint64_t __46__NMSPersistentDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80)) != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
}

- (void)resetObject:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = [(NMSPersistentDictionary *)self _dataFromObject:a3];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__NMSPersistentDictionary_resetObject_forKey___block_invoke;
  v10[3] = &unk_2644237B0;
  v10[4] = self;
  id v11 = v7;
  id v12 = v6;
  id v8 = v6;
  id v9 = v7;
  [(NMSPersistentDictionary *)self _withDB:v10];
}

uint64_t __46__NMSPersistentDictionary_resetObject_forKey___block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72)) != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
}

- (void)removeAllObjects
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __43__NMSPersistentDictionary_removeAllObjects__block_invoke;
  v2[3] = &unk_2644229D8;
  v2[4] = self;
  [(NMSPersistentDictionary *)self _withDB:v2];
}

uint64_t __43__NMSPersistentDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88)) != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88));
}

- (void)enumerateObjectsSortedByExpirationDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __66__NMSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke;
  v6[3] = &unk_264423DC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NMSPersistentDictionary *)self _withDB:v6];
}

uint64_t __66__NMSPersistentDictionary_enumerateObjectsSortedByExpirationDate___block_invoke(uint64_t a1)
{
  while (1)
  {
    int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
    if (v2 != 100) {
      break;
    }
    uint64_t v3 = ReadString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
    id v4 = ReadDate_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 1);
    id v5 = ReadData_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 2);
    id v6 = [*(id *)(a1 + 32) _objectFromData:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (v2 && v2 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
}

- (id)objectWithOldestExpirationDate:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__12;
  id v17 = __Block_byref_object_dispose__12;
  id v18 = 0;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__12;
  id v11 = __Block_byref_object_dispose__12;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__NMSPersistentDictionary_objectWithOldestExpirationDate___block_invoke;
  v6[3] = &unk_264423DE8;
  v6[4] = &v13;
  void v6[5] = &v7;
  [(NMSPersistentDictionary *)self enumerateObjectsSortedByExpirationDate:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  id v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __58__NMSPersistentDictionary_objectWithOldestExpirationDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, unsigned char *a5)
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v12 = v8;

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v9;

  *a5 = 1;
}

- (void)enumerateObjectsSortedByEnqueueDate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__NMSPersistentDictionary_enumerateObjectsSortedByEnqueueDate___block_invoke;
  v6[3] = &unk_264423DC0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NMSPersistentDictionary *)self _withDB:v6];
}

uint64_t __63__NMSPersistentDictionary_enumerateObjectsSortedByEnqueueDate___block_invoke(uint64_t a1)
{
  while (1)
  {
    int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
    if (v2 != 100) {
      break;
    }
    uint64_t v3 = ReadString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
    id v4 = ReadDate_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104), 1);
    id v5 = ReadData_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104), 2);
    id v6 = ReadDate_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104), 3);
    id v7 = [*(id *)(a1 + 32) _objectFromData:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (v2 && v2 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  return sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDB, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithSharedDBForService:objectClass:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v0, v1, "Failed to get shared DB for service %{public}@", v2);
}

- (void)_openDBForceRecreate:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v0, v1, "Database %@ open has failed after second try.", v2);
}

- (void)_openDBForceRecreate:(os_log_t)log .cold.2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "Could not open database (%@): %{companionsync:sqlite3err}d", (uint8_t *)&v4, 0x12u);
}

- (void)_openDBForceRecreate:(void *)a1 .cold.3(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = _SYObfuscate(a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v3, v5, "Error removing existing DB: %{public}@", v6);
}

- (void)_openDBForceRecreate:(os_log_t)log .cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_21C7C9000, log, OS_LOG_TYPE_ERROR, "First open attempt failed, removing & recreating DB", v1, 2u);
}

- (void)_openDBForceRecreate:(void *)a1 .cold.5(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = _SYObfuscate(a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v3, v5, "Error creating parent directory: %{public}@", v6);
}

@end