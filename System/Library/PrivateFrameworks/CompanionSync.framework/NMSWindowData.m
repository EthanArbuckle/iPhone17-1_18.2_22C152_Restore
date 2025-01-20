@interface NMSWindowData
- (BOOL)_openDBForceRecreate:(BOOL)a3;
- (BOOL)_syncTransaction:(BOOL)a3 block:(id)a4;
- (NMSWindowData)init;
- (NMSWindowData)initWithPath:(id)a3 logFacility:(__CFString *)a4;
- (NMSWindowData)initWithSharedDBForServiceName:(id)a3;
- (NSArray)expiredMessageIDs;
- (NSDate)dateOfNextMessageExpiry;
- (id)popPendingMessage;
- (int)_getSchemaVersion;
- (sqlite3)dbRef;
- (unint64_t)countOfAllMessagesInFlight;
- (unint64_t)countOfPendingMessages;
- (unint64_t)lengthOfAllMessagesInFlight;
- (unint64_t)removeAndReturnLengthOfMessageWithID:(id)a3;
- (unint64_t)removeAndReturnLengthOfMessagesWithIDs:(id)a3;
- (void)_ensureSchema;
- (void)_prepareStatements;
- (void)_withDB:(id)a3;
- (void)addMessageWithID:(id)a3 ofLength:(unint64_t)a4 timeoutTime:(double)a5;
- (void)dealloc;
- (void)removeAllMessages;
@end

@implementation NMSWindowData

- (NMSWindowData)init
{
  v12[2] = *MEMORY[0x263EF8340];
  v3 = NSString;
  v4 = NSTemporaryDirectory();
  v12[0] = v4;
  v5 = objc_opt_new();
  v6 = [v5 UUIDString];
  v12[1] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:2];
  v8 = [v3 pathWithComponents:v7];
  v9 = [v8 stringByAppendingPathExtension:@"sqlitedb"];

  v10 = [(NMSWindowData *)self initWithPath:v9 logFacility:@"com.apple.private.NanoMessagingService"];
  return v10;
}

- (NMSWindowData)initWithPath:(id)a3 logFacility:(__CFString *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NMSWindowData;
  v7 = [(NMSWindowData *)&v17 init];
  if (v7)
  {
    id v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"NMSWindow<%p> sync queue", v7);
    v9 = (const char *)[v8 UTF8String];
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    syncQ = v7->_syncQ;
    v7->_syncQ = (OS_dispatch_queue *)v11;

    uint64_t v13 = [v6 copy];
    path = v7->_path;
    v7->_path = (NSString *)v13;

    if (a4) {
      v7->_loggingFacility = (__CFString *)CFStringCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], a4);
    }
    if ([(NMSWindowData *)v7 _openDBForceRecreate:0])
    {
      v15 = v7;
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_FAULT)) {
        -[NMSWindowData initWithPath:logFacility:]();
      }
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NMSWindowData)initWithSharedDBForServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMSWindowData;
  v5 = [(NMSWindowData *)&v10 init];
  if (!v5)
  {
LABEL_8:
    id v8 = 0;
    goto LABEL_9;
  }
  uint64_t v6 = +[_SYSharedServiceDB sharedInstanceForServiceName:v4];
  sharedDB = v5->_sharedDB;
  v5->_sharedDB = (_SYSharedServiceDB *)v6;

  if (!v5->_sharedDB)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_FAULT)) {
      -[NMSWindowData initWithSharedDBForServiceName:]();
    }
    goto LABEL_8;
  }
  [(NMSWindowData *)v5 _ensureSchema];
  [(NMSWindowData *)v5 _prepareStatements];
  id v8 = v5;
LABEL_9:

  return v8;
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
    v6[2] = __24__NMSWindowData_dealloc__block_invoke;
    v6[3] = &unk_2644229D8;
    v6[4] = self;
    [(NMSWindowData *)self _withDB:v6];
    db = self->_db;
    if (db) {
      sqlite3_close(db);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NMSWindowData;
  [(NMSWindowData *)&v5 dealloc];
}

uint64_t __24__NMSWindowData_dealloc__block_invoke(uint64_t a1)
{
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
  sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 120));
  v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 128);
  return sqlite3_finalize(v2);
}

- (void)_withDB:(id)a3
{
  id v4 = a3;
  sharedDB = self->_sharedDB;
  if (sharedDB)
  {
    [(_SYSharedServiceDB *)sharedDB withDBRef:v4];
  }
  else
  {
    syncQ = self->_syncQ;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __25__NMSWindowData__withDB___block_invoke;
    v7[3] = &unk_2644235B8;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(syncQ, v7);
  }
}

uint64_t __25__NMSWindowData__withDB___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 32));
}

- (BOOL)_syncTransaction:(BOOL)a3 block:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  sharedDB = self->_sharedDB;
  if (sharedDB)
  {
    if (v4) {
      BOOL v8 = [(_SYSharedServiceDB *)sharedDB inExclusiveTransaction:v6];
    }
    else {
      BOOL v8 = [(_SYSharedServiceDB *)sharedDB inTransaction:v6];
    }
    BOOL v10 = v8;
  }
  else
  {
    uint64_t v16 = 0;
    objc_super v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    syncQ = self->_syncQ;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__NMSWindowData__syncTransaction_block___block_invoke;
    void v12[3] = &unk_2644235E0;
    BOOL v15 = v4;
    v12[4] = self;
    v14 = &v16;
    id v13 = v6;
    dispatch_sync(syncQ, v12);
    BOOL v10 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v10;
}

void __40__NMSWindowData__syncTransaction_block___block_invoke(uint64_t a1)
{
  v2 = *(sqlite3 **)(*(void *)(a1 + 32) + 32);
  if (*(unsigned char *)(a1 + 56)) {
    int v3 = ExecuteSQL(v2, "BEGIN EXCLUSIVE TRANSACTION");
  }
  else {
    int v3 = ExecuteSQL(v2, "BEGIN TRANSACTION");
  }
  if (v3)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (!os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  objc_super v5 = *(sqlite3 **)(*(void *)(a1 + 32) + 32);
  if (v4)
  {
    int v6 = ExecuteSQL(v5, "COMMIT TRANSACTION");
    if (!v6) {
      return;
    }
  }
  else
  {
    int v6 = ExecuteSQL(v5, "ROLLBACK TRANSACTION");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (!v6) {
      return;
    }
  }
  if (v6 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (!os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
LABEL_8:
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (int)_getSchemaVersion
{
  if (sqlite3_table_column_metadata(self->_db, 0, "meta", "tstamp", 0, 0, 0, 0, 0)) {
    return 0;
  }
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", -1, &ppStmt, 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
    return 0;
  }
  int v5 = sqlite3_step(ppStmt);
  int v3 = 0;
  if (v5 && v5 != 101)
  {
    if (v5 == 100)
    {
      int v3 = sqlite3_column_int(ppStmt, 0);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
      }
      int v3 = 0;
    }
  }
  sqlite3_finalize(ppStmt);
  return v3;
}

- (BOOL)_openDBForceRecreate:(BOOL)a3
{
  BOOL v3 = a3;
  v33[3] = *MEMORY[0x263EF8340];
  char v31 = 1;
  int v5 = [MEMORY[0x263F08850] defaultManager];
  p_path = (void **)&self->_path;
  int v7 = [v5 fileExistsAtPath:self->_path isDirectory:&v31];

  if (v7) {
    BOOL v8 = v31 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = [MEMORY[0x263F08850] defaultManager];
    BOOL v10 = *p_path;
    id v30 = 0;
    int v11 = [v9 removeItemAtPath:v10 error:&v30];
    id v12 = v30;

    if (!v11)
    {
      _LogInfoForPath(*p_path);
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v24 = (void *)qword_26AB04798;
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        [(NMSWindowData *)(uint64_t)p_path _openDBForceRecreate:v12];
      }
      goto LABEL_44;
    }
  }
  else if (v7)
  {
    goto LABEL_15;
  }
  uint64_t v13 = *MEMORY[0x263F08028];
  v32[0] = *MEMORY[0x263F08060];
  v32[1] = v13;
  v33[0] = @"mobile";
  v33[1] = @"mobile";
  v32[2] = *MEMORY[0x263F08078];
  v33[2] = &unk_26CD338C8;
  v14 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:3];
  BOOL v15 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v16 = *p_path;
  id v29 = 0;
  char v17 = [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:v14 error:&v29];
  id v18 = v29;

  if ((v17 & 1) == 0)
  {
    _LogInfoForPath(*p_path);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    char v19 = (void *)qword_26AB04798;
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      [(NMSWindowData *)(uint64_t)&self->_path _openDBForceRecreate:v18];
    }
  }

LABEL_15:
  id v12 = [*p_path stringByAppendingPathComponent:@"meta.db"];
  if (v3)
  {
    v20 = [MEMORY[0x263F08850] defaultManager];
    id v28 = 0;
    char v21 = [v20 removeItemAtPath:v12 error:&v28];
    id v22 = v28;

    if ((v21 & 1) == 0)
    {
      _LogInfoForPath(v12);
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      v26 = (void *)qword_26AB04798;
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        [(NMSWindowData *)(uint64_t)v12 _openDBForceRecreate:v22];
      }

      goto LABEL_44;
    }
  }
  id v12 = v12;
  p_db = &self->_db;
  if (sqlite3_open_v2((const char *)[v12 fileSystemRepresentation], &self->_db, 4194310, 0) || !*p_db)
  {
    _LogInfoForPath(v12);
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[NMSWindowData _openDBForceRecreate:]();
    }
    if (*p_db)
    {
      sqlite3_close(*p_db);
      *p_db = 0;
    }
    if (!v3)
    {
      BOOL v25 = [(NMSWindowData *)self _openDBForceRecreate:1];
      goto LABEL_45;
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      -[NMSWindowData _openDBForceRecreate:]();
    }
LABEL_44:
    BOOL v25 = 0;
    goto LABEL_45;
  }
  ExecuteSQL(*p_db, "PRAGMA journal_mode=WAL;");
  sqlite3_busy_timeout(self->_db, 60000);
  sqlite3_extended_result_codes(self->_db, 1);
  if (![(NMSWindowData *)self _getSchemaVersion])
  {
    ExecuteSQL(*p_db, "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, tstamp TEXT)");
    ExecuteSQL(*p_db, "CREATE TABLE IF NOT EXISTS in_window (expires REAL, msg_id TEXT, num_bytes INTEGER)");
    ExecuteSQL(*p_db, "CREATE TABLE IF NOT EXISTS msg_queue (pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT, tstamp REAL)");
    ExecuteSQL(*p_db, "CREATE UNIQUE INDEX sent_by_uuid ON in_window (msg_id ASC)");
    ExecuteSQL(*p_db, "CREATE INDEX expiry ON in_window (expires ASC, msg_id)");
    ExecuteSQL(*p_db, "INSERT INTO meta (tstamp) VALUES (datetime('now'))");
  }
  [(NMSWindowData *)self _prepareStatements];
  BOOL v25 = 1;
LABEL_45:

  return v25;
}

- (void)_ensureSchema
{
  sharedDB = self->_sharedDB;
  BOOL v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(_SYSharedServiceDB *)sharedDB updateSchemaForClient:v4 usingBlock:&__block_literal_global_4];
}

uint64_t __30__NMSWindowData__ensureSchema__block_invoke(int a1, sqlite3 *a2, uint64_t a3)
{
  uint64_t result = a3;
  if (!a3)
  {
    ExecuteSQL(a2, "CREATE TABLE IF NOT EXISTS in_window (expires REAL, msg_id TEXT, num_bytes INTEGER)");
    ExecuteSQL(a2, "CREATE TABLE IF NOT EXISTS msg_queue (pk INTEGER PRIMARY KEY AUTOINCREMENT, uuid TEXT, tstamp REAL)");
    ExecuteSQL(a2, "CREATE UNIQUE INDEX sent_by_uuid ON in_window (msg_id ASC)");
    ExecuteSQL(a2, "CREATE INDEX expiry ON in_window (expires ASC, msg_id)");
    return 1;
  }
  return result;
}

- (void)_prepareStatements
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__NMSWindowData__prepareStatements__block_invoke;
  v2[3] = &unk_2644229D8;
  v2[4] = self;
  [(NMSWindowData *)self _withDB:v2];
}

void __35__NMSWindowData__prepareStatements__block_invoke(uint64_t a1, sqlite3 *db)
{
  if (sqlite3_prepare_v2(db, "INSERT INTO in_window (expires, msg_id, num_bytes) VALUES (?, ?, ?)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 48), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT num_bytes FROM in_window WHERE msg_id=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM in_window WHERE msg_id=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 64), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT expires FROM in_window ORDER BY expires LIMIT 1", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT msg_id FROM in_window WHERE expires < ?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT SUM(num_bytes) FROM in_window", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 88), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM in_window", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "INSERT INTO msg_queue (uuid, tstamp) VALUES (?, ?)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 104), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT uuid FROM msg_queue ORDER BY pk ASC LIMIT 1", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "DELETE FROM msg_queue WHERE pk=(SELECT min(pk) FROM msg_queue)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 120), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  if (sqlite3_prepare_v2(db, "SELECT COUNT(*) FROM msg_queue", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 128), 0))
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
}

- (void)removeAllMessages
{
}

uint64_t __34__NMSWindowData_removeAllMessages__block_invoke(int a1, sqlite3 *a2)
{
  int v3 = ExecuteSQL(a2, "DELETE FROM in_window");
  if (v3 && v3 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  int v4 = ExecuteSQL(a2, "DELETE FROM msg_queue");
  if (v4 && v4 != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  return 1;
}

- (void)addMessageWithID:(id)a3 ofLength:(unint64_t)a4 timeoutTime:(double)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__NMSWindowData_addMessageWithID_ofLength_timeoutTime___block_invoke;
  v10[3] = &unk_264423648;
  double v12 = a5;
  v10[4] = self;
  id v11 = v8;
  unint64_t v13 = a4;
  id v9 = v8;
  [(NMSWindowData *)self _withDB:v10];
}

uint64_t __55__NMSWindowData_addMessageWithID_ofLength_timeoutTime___block_invoke(uint64_t a1)
{
  v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 48);
  int v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:*(double *)(a1 + 48)];
  [v3 timeIntervalSince1970];
  sqlite3_bind_double(v2, 1, v4);

  BindString(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48), 2, *(id *)(a1 + 40));
  sqlite3_bind_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48), 3, *(void *)(a1 + 56));
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48)) != 101)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
      __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48));
}

- (unint64_t)removeAndReturnLengthOfMessageWithID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __54__NMSWindowData_removeAndReturnLengthOfMessageWithID___block_invoke;
  v8[3] = &unk_264423670;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(NMSWindowData *)self _syncTransaction:1 block:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __54__NMSWindowData_removeAndReturnLengthOfMessageWithID___block_invoke(uint64_t a1)
{
  BindString(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 1, *(id *)(a1 + 40));
  int v2 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  if ((v2 - 102) > 0xFFFFFFFD)
  {
    if (v2 == 100) {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 0);
    }
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
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BindString(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64), 1, *(id *)(a1 + 40));
    if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64)) != 101)
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
  return 1;
}

- (unint64_t)removeAndReturnLengthOfMessagesWithIDs:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  double v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__NMSWindowData_removeAndReturnLengthOfMessagesWithIDs___block_invoke;
  v8[3] = &unk_264423698;
  id v5 = v4;
  id v9 = v5;
  BOOL v10 = &v11;
  [(NMSWindowData *)self _syncTransaction:1 block:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __56__NMSWindowData_removeAndReturnLengthOfMessagesWithIDs___block_invoke(uint64_t a1, sqlite3 *a2)
{
  id v4 = [*(id *)(a1 + 32) componentsJoinedByString:@"', '"];
  ppStmt = 0;
  id v5 = (id) [[NSString alloc] initWithFormat:@"SELECT SUM(num_bytes) FROM in_window WHERE msg_id IN ('%@')", v4];
  if (!sqlite3_prepare_v2(a2, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
  {
    int v6 = sqlite3_step(ppStmt);
    if ((v6 - 102) <= 0xFFFFFFFD)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        goto LABEL_5;
      }
      goto LABEL_25;
    }
    if (v6 == 100) {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(ppStmt, 0);
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
    int v7 = (void *)[[NSString alloc] initWithFormat:@"DELETE FROM in_window WHERE msg_id IN ('%@')", v4];

    id v5 = v7;
    if (sqlite3_prepare_v2(a2, (const char *)[v5 UTF8String], -1, &ppStmt, 0))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (!os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
    }
    else
    {
      if (sqlite3_step(ppStmt) == 101)
      {
        sqlite3_reset(ppStmt);
        sqlite3_clear_bindings(ppStmt);
        sqlite3_finalize(ppStmt);
        goto LABEL_25;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (!os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR))
      {
LABEL_24:
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
        goto LABEL_25;
      }
    }
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
    goto LABEL_24;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)qword_26AB04798, OS_LOG_TYPE_ERROR)) {
LABEL_5:
  }
    __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1();
LABEL_25:

  return 1;
}

- (NSArray)expiredMessageIDs
{
  int v3 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__NMSWindowData_expiredMessageIDs__block_invoke;
  v8[3] = &unk_2644236C0;
  void v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(NMSWindowData *)self _withDB:v8];
  id v5 = v9;
  int v6 = (NSArray *)v4;

  return v6;
}

uint64_t __34__NMSWindowData_expiredMessageIDs__block_invoke(uint64_t a1)
{
  int v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 80);
  int v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  sqlite3_bind_double(v2, 1, v4);

  while (1)
  {
    int v5 = sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
    if (v5 != 100) {
      break;
    }
    int v6 = objc_msgSend([NSString alloc], "initWithUTF8String:", sqlite3_column_text(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 0));
    [*(id *)(a1 + 40) addObject:v6];
  }
  if (v5 != 101)
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

- (unint64_t)lengthOfAllMessagesInFlight
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__NMSWindowData_lengthOfAllMessagesInFlight__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  v4[5] = &v5;
  [(NMSWindowData *)self _withDB:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __44__NMSWindowData_lengthOfAllMessagesInFlight__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88)) == 100)
  {
    sqlite3_int64 v2 = sqlite3_column_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88), 0);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 & ~(v2 >> 63);
  }
  int v3 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 88);
  return sqlite3_reset(v3);
}

- (unint64_t)countOfAllMessagesInFlight
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__NMSWindowData_countOfAllMessagesInFlight__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  v4[5] = &v5;
  [(NMSWindowData *)self _withDB:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __43__NMSWindowData_countOfAllMessagesInFlight__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96)) == 100) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_column_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 0);
  }
  unint64_t v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 96);
  return sqlite3_reset(v2);
}

- (NSDate)dateOfNextMessageExpiry
{
  uint64_t v5 = 0;
  int v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__6;
  id v9 = __Block_byref_object_dispose__6;
  id v10 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __40__NMSWindowData_dateOfNextMessageExpiry__block_invoke;
  v4[3] = &unk_2644236E8;
  v4[4] = self;
  v4[5] = &v5;
  [(NMSWindowData *)self _withDB:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSDate *)v2;
}

uint64_t __40__NMSWindowData_dateOfNextMessageExpiry__block_invoke(uint64_t a1)
{
  if (sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72)) == 100)
  {
    uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF910]), "initWithTimeIntervalSince1970:", sqlite3_column_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 0));
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    double v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
  uint64_t v5 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 72);
  return sqlite3_reset(v5);
}

- (id)popPendingMessage
{
  return 0;
}

- (unint64_t)countOfPendingMessages
{
  return 0;
}

- (sqlite3)dbRef
{
  return self->_db;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedDB, 0);
  objc_storeStrong((id *)&self->_syncQ, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)initWithPath:logFacility:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_FAULT, "NMSWindowData: unable to create db file via path '%@', returning nil from -init, message windowing will FAIL.", v1, 0xCu);
}

- (void)initWithSharedDBForServiceName:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_fault_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_FAULT, "NMSWindowData: unable to connect to shared DB for service %{public}@", v1, 0xCu);
}

void __40__NMSWindowData__syncTransaction_block___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "SQL Error: %{companionsync:sqlite3err}d", v2, v3, v4, v5, v6);
}

- (void)_openDBForceRecreate:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_21C7C9000, v0, OS_LOG_TYPE_ERROR, "Database '%@' failed to open after second try.", v1, 0xCu);
}

- (void)_openDBForceRecreate:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_21C7C9000, v1, OS_LOG_TYPE_ERROR, "Could not open database: (%@): %{companionsync:sqlite3err}d", v2, 0x12u);
}

- (void)_openDBForceRecreate:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = _SYObfuscate(a3);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_4_1(&dword_21C7C9000, v6, v7, "NMSWindowData: Failed to remove un-openable DB file at '%@': %{public}@", v8, v9, v10, v11, 2u);
}

- (void)_openDBForceRecreate:(void *)a3 .cold.4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = _SYObfuscate(a3);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_1(&dword_21C7C9000, v6, v7, "Failed to create parent folder for messaging transmission window data at '%@'. Error = %{public}@", v8, v9, v10, v11, 2u);
}

- (void)_openDBForceRecreate:(void *)a3 .cold.5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = _SYObfuscate(a3);
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_5_1(&dword_21C7C9000, v6, v7, "Unable to remove obstructing file at path '%@'. Error = %{public}@", v8, v9, v10, v11, 2u);
}

@end