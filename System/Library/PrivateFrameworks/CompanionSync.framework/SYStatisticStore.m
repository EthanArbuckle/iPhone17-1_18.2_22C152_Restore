@interface SYStatisticStore
+ (id)sharedInstance;
+ (id)unpackMessageData:(id)a3;
- (BOOL)_LOCKED_pruneFileTransferLogForServices:(id)a3;
- (BOOL)_LOCKED_pruneMessageLogForServices:(id)a3;
- (BOOL)_openDBFile:(BOOL)a3;
- (BOOL)_tableEmpty:(id)a3;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (SYStatisticStore)init;
- (SYStatisticStore)initWithPath:(id)a3;
- (double)_getMachTimestamp;
- (id)_LOCKED_allServiceNames;
- (id)_keySetForMessageLogTable;
- (id)_openDBIfNecessary;
- (id)_unpackMessageData:(id)a3;
- (id)_unpackMetadata:(id)a3;
- (id)operationQ;
- (int)_closeDB;
- (int)_getSchemaVersion;
- (sqlite3)dbRef;
- (unint64_t)rowIDForPartialMessage:(id)a3;
- (void)_ensureCorrectFileOwnership:(id)a3;
- (void)_getSchemaVersion;
- (void)_initializeFilePresentation;
- (void)_letGoForUnitTests:(id)a3;
- (void)_onQueueAsync:(id)a3;
- (void)_onQueueSync:(id)a3;
- (void)_openDB;
- (void)_pruneOldData;
- (void)_unpackPBRequest:(id)a3 forMessageID:(unsigned __int16)a4 intoDictionary:(id)a5;
- (void)_unpackPBResponse:(id)a3 forMessageID:(unsigned __int16)a4 intoDictionary:(id)a5;
- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3;
- (void)assignIdentifier:(id)a3 toOutgoingMessage:(id)a4;
- (void)confirmDeliveryOfOutgoingFileTransfer:(id)a3;
- (void)confirmDeliveryOfOutgoingMessage:(id)a3;
- (void)dealloc;
- (void)markLastIncomingMessageComplete;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)recordIncomingFileTransferAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 forService:(id)a6;
- (void)recordIncomingMessage:(id)a3 forService:(id)a4;
- (void)recordOutgoingFileTransferAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 error:(id)a6 forService:(id)a7;
- (void)recordOutgoingMessage:(id)a3 forService:(id)a4;
- (void)setFileTransferIdentifier:(id)a3 forOutgoingMessagesWithRowIDs:(id)a4;
- (void)updateLastIncomingMessageWithError:(id)a3;
- (void)updateLastIncomingMessageWithProcessingTime:(double)a3;
- (void)updateOutgoingFileTransferWithIdentifier:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5;
- (void)updateOutgoingMessageWithIdentifier:(id)a3 didReceiveResponse:(BOOL)a4 error:(id)a5;
- (void)updateOutgoingMessageWithIdentifier:(id)a3 forService:(id)a4 sentSuccessfully:(BOOL)a5 sendError:(id)a6;
@end

@implementation SYStatisticStore

+ (id)sharedInstance
{
  return 0;
}

- (SYStatisticStore)init
{
  v3 = +[SYLogs logFolder];
  v4 = [v3 stringByAppendingPathComponent:@"statistics.db"];

  v5 = [(SYStatisticStore *)self initWithPath:v4];
  return v5;
}

- (SYStatisticStore)initWithPath:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SYStatisticStore;
  id v5 = [(SYStatisticStore *)&v18 init];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v8 = dispatch_queue_create("CSStatisticsQueueCore", v7);
    v9 = (void *)*((void *)v5 + 17);
    *((void *)v5 + 17) = v8;

    dispatch_queue_t v10 = dispatch_queue_create_with_target_V2("CSStatisticsQueue", v7, *((dispatch_queue_t *)v5 + 17));
    v11 = (void *)*((void *)v5 + 18);
    *((void *)v5 + 18) = v10;

    v12 = [v4 stringByStandardizingPath];
    uint64_t v13 = [v12 copy];
    v14 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v13;

    [v5 _initializeFilePresentation];
    [v5 _openDB];
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v5 selector:sel__letGoForUnitTests_ name:@"SYUnitTestTearDown" object:0];

    id v16 = v5;
  }

  return (SYStatisticStore *)v5;
}

- (void)dealloc
{
  operations_queue = self->_operations_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__SYStatisticStore_dealloc__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(operations_queue, block);
  [MEMORY[0x263F08830] removeFilePresenter:self];
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SYStatisticStore;
  [(SYStatisticStore *)&v5 dealloc];
}

uint64_t __27__SYStatisticStore_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDB];
}

- (int)_closeDB
{
  db = self->_db;
  if (!db) {
    return 0;
  }
  self->_db = 0;
  sqlite3_finalize(self->_insertIncoming);
  self->_insertIncoming = 0;
  sqlite3_finalize(self->_addProcessingTimeIncoming);
  self->_addProcessingTimeIncoming = 0;
  sqlite3_finalize(self->_addErrorIncoming);
  self->_addErrorIncoming = 0;
  sqlite3_finalize(self->_markCompleteIncoming);
  self->_markCompleteIncoming = 0;
  sqlite3_finalize(self->_insertOutgoing);
  self->_insertOutgoing = 0;
  sqlite3_finalize(self->_updateOutgoingIdentifier);
  self->_updateOutgoingIdentifier = 0;
  sqlite3_finalize(self->_updateOutgoing);
  self->_updateOutgoing = 0;
  sqlite3_finalize(self->_timestampForID);
  self->_timestampForID = 0;
  sqlite3_finalize(self->_reserveRowID);
  self->_reserveRowID = 0;
  sqlite3_finalize(self->_responseReceived);
  self->_responseReceived = 0;
  sqlite3_finalize(self->_requestAcked);
  self->_requestAcked = 0;
  sqlite3_finalize(self->_logFileActivity);
  self->_logFileActivity = 0;
  sqlite3_finalize(self->_updateFileOutgoing);
  self->_updateFileOutgoing = 0;
  int v4 = sqlite3_close(db);
  [MEMORY[0x263F08830] removeFilePresenter:self];
  return v4;
}

- (void)_letGoForUnitTests:(id)a3
{
  operations_queue = self->_operations_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SYStatisticStore__letGoForUnitTests___block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(operations_queue, block);
}

uint64_t __39__SYStatisticStore__letGoForUnitTests___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _closeDB];
}

- (BOOL)_tableEmpty:(id)a3
{
  ppStmt = 0;
  int v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithFormat:@"SELECT COUNT(*) FROM %@", v5];

  id v7 = v6;
  dispatch_queue_t v8 = (const char *)[v7 UTF8String];
  int v9 = strlen(v8);
  int v10 = sqlite3_prepare_v2(self->_db, v8, v9, &ppStmt, 0);
  if (v10)
  {
    if (v10 == 1)
    {
      BOOL v11 = 0;
    }
    else
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        -[SYStatisticStore _tableEmpty:]();
      }
      BOOL v11 = 1;
    }
  }
  else
  {
    int v12 = sqlite3_step(ppStmt);
    BOOL v11 = 1;
    if (v12 && v12 != 101)
    {
      if (v12 == 100)
      {
        BOOL v11 = sqlite3_column_int(ppStmt, 0) == 0;
      }
      else
      {
        if (_stats_log_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
          -[SYStatisticStore _tableEmpty:]();
        }
        BOOL v11 = 1;
      }
    }
    sqlite3_finalize(ppStmt);
  }

  return v11;
}

- (void)_ensureCorrectFileOwnership:(id)a3
{
  memset(&v6, 0, sizeof(v6));
  id v3 = a3;
  if (stat((const char *)objc_msgSend(v3, "fileSystemRepresentation", 0, 0), &v6) == -1) {
    -[SYStatisticStore _ensureCorrectFileOwnership:]();
  }
  if (!v6.st_uid && !geteuid())
  {
    id v4 = v3;
    if (chown((const char *)[v4 fileSystemRepresentation], 0x1F5u, 0x1F5u))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v5 = (void *)_stats_log;
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        -[SYStatisticStore _ensureCorrectFileOwnership:]((uint64_t)v4, v5);
      }
    }
  }
  if ((v6.st_mode & 0x10) == 0) {
    chmod((const char *)[v3 fileSystemRepresentation], 0x1B4u);
  }
}

- (BOOL)_openDBFile:(BOOL)a3
{
  BOOL v3 = a3;
  v47[4] = *MEMORY[0x263EF8340];
  int v32 = 4227074;
  id v5 = (void *)[objc_alloc(NSURL) initFileURLWithPath:self->_path isDirectory:0];
  if (v3)
  {
    v31 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:self];
    id v6 = objc_alloc(NSURL);
    id v7 = [(NSString *)self->_path stringByAppendingString:@"-shm"];
    dispatch_queue_t v8 = (void *)[v6 initFileURLWithPath:v7 isDirectory:0];

    id v9 = objc_alloc(NSURL);
    int v10 = [(NSString *)self->_path stringByAppendingString:@"-wal"];
    BOOL v11 = (void *)[v9 initFileURLWithPath:v10 isDirectory:0];

    int v12 = [MEMORY[0x263F08820] readingIntentWithURL:v5 options:0];
    v47[0] = v12;
    uint64_t v13 = [MEMORY[0x263F08820] writingIntentWithURL:v5 options:1];
    v47[1] = v13;
    v14 = [MEMORY[0x263F08820] writingIntentWithURL:v8 options:1];
    v47[2] = v14;
    v15 = [MEMORY[0x263F08820] writingIntentWithURL:v11 options:1];
    v47[3] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
    objc_super v18 = [(SYStatisticStore *)self presentedItemOperationQueue];
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __32__SYStatisticStore__openDBFile___block_invoke;
    v42[3] = &unk_264424528;
    v42[4] = self;
    id v43 = v5;
    id v44 = v8;
    id v45 = v11;
    dispatch_semaphore_t v46 = v17;
    v19 = v17;
    id v20 = v11;
    id v21 = v8;
    [v31 coordinateAccessWithIntents:v16 queue:v18 byAccessor:v42];

    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    int v32 = 4227078;
  }
  v22 = (void *)[objc_alloc(MEMORY[0x263F08830]) initWithFilePresenter:self];
  v23 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:2];
  v24 = [MEMORY[0x263F08820] readingIntentWithURL:v5 options:0];
  [v23 addObject:v24];

  if (v3)
  {
    v25 = [MEMORY[0x263F08820] writingIntentWithURL:v5 options:0];
    [v23 addObject:v25];
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 1;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  v27 = [(SYStatisticStore *)self presentedItemOperationQueue];
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __32__SYStatisticStore__openDBFile___block_invoke_92;
  v33[3] = &unk_264424550;
  int v36 = v32;
  BOOL v37 = v3;
  v33[4] = self;
  v35 = &v38;
  v28 = v26;
  v34 = v28;
  [v22 coordinateAccessWithIntents:v23 queue:v27 byAccessor:v33];

  dispatch_semaphore_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v29 = *((unsigned char *)v39 + 24) != 0;

  _Block_object_dispose(&v38, 8);
  return v29;
}

void __32__SYStatisticStore__openDBFile___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    id v4 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __32__SYStatisticStore__openDBFile___block_invoke_cold_1((uint64_t)v3, v4);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    int v6 = [v5 fileExistsAtPath:*(void *)(*(void *)(a1 + 32) + 8)];

    if (v6)
    {
      id v7 = [MEMORY[0x263F08850] defaultManager];
      [v7 removeItemAtURL:*(void *)(a1 + 40) error:0];

      dispatch_queue_t v8 = [MEMORY[0x263F08850] defaultManager];
      [v8 removeItemAtURL:*(void *)(a1 + 48) error:0];

      id v9 = [MEMORY[0x263F08850] defaultManager];
      [v9 removeItemAtURL:*(void *)(a1 + 56) error:0];
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

intptr_t __32__SYStatisticStore__openDBFile___block_invoke_92(uint64_t a1)
{
  if (sqlite3_open_v2((const char *)[*(id *)(*(void *)(a1 + 32) + 8) fileSystemRepresentation], (sqlite3 **)(*(void *)(a1 + 32) + 16), *(_DWORD *)(a1 + 56), 0)|| (uint64_t v2 = *(void *)(a1 + 32), !*(void *)(v2 + 16)))
  {
    if (*(unsigned char *)(a1 + 60))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        __32__SYStatisticStore__openDBFile___block_invoke_92_cold_1();
      }
    }
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 16))
    {
      sqlite3_close(*(sqlite3 **)(v2 + 16));
      *(void *)(*(void *)(a1 + 32) + 16) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  [(id)v2 _ensureCorrectFileOwnership:*(void *)(v2 + 8)];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)_getSchemaVersion
{
  ppStmt = 0;
  int v2 = sqlite3_prepare_v2(self->_db, "SELECT COUNT(*) FROM meta", 25, &ppStmt, 0);
  if (v2)
  {
    if (v2 != 1)
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        -[SYStatisticStore _getSchemaVersion]();
      }
    }
    return 0;
  }
  else
  {
    int v4 = sqlite3_step(ppStmt);
    int v3 = 0;
    if (v4 && v4 != 101)
    {
      if (v4 == 100)
      {
        int v3 = sqlite3_column_int(ppStmt, 0);
      }
      else
      {
        if (_stats_log_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
          -[SYStatisticStore _getSchemaVersion]();
        }
        int v3 = 0;
      }
    }
    sqlite3_finalize(ppStmt);
  }
  return v3;
}

- (void)_onQueueAsync:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__15;
  v10[4] = __Block_byref_object_dispose__15;
  id v11 = (id)os_transaction_create();
  operations_queue = self->_operations_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__SYStatisticStore__onQueueAsync___block_invoke;
  block[3] = &unk_264424578;
  block[4] = self;
  id v8 = v4;
  id v9 = v10;
  id v6 = v4;
  dispatch_async(operations_queue, block);

  _Block_object_dispose(v10, 8);
}

void __34__SYStatisticStore__onQueueAsync___block_invoke(void *a1)
{
  if (*(void *)(a1[4] + 16))
  {
    (*(void (**)(void))(a1[5] + 16))();
    uint64_t v2 = *(void *)(a1[6] + 8);
    int v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    id v4 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_21C7C9000, v4, OS_LOG_TYPE_DEFAULT, "Statistics DB closed before an enqueued async block could run.", v5, 2u);
    }
  }
}

- (void)_onQueueSync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  dispatch_suspend((dispatch_object_t)self->_operations_queue);
  preemption_queue = self->_preemption_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __33__SYStatisticStore__onQueueSync___block_invoke;
  v8[3] = &unk_264422E88;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(preemption_queue, v8);
  dispatch_resume((dispatch_object_t)self->_operations_queue);
}

void __33__SYStatisticStore__onQueueSync___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    v1 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v1();
  }
  else
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    uint64_t v2 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v3 = 0;
      _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Statistics DB closed before an enqueued sync block could run.", v3, 2u);
    }
  }
}

- (id)_openDBIfNecessary
{
  uint64_t v2 = self;
  if (!self->_db)
  {
    [(SYStatisticStore *)self _openDB];
    if (!v2->_db) {
      uint64_t v2 = 0;
    }
  }
  int v3 = v2;
  return v3;
}

- (void)_openDB
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = a1;
  id v4 = _SYObfuscate(a2);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "Error creating parent folder: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __27__SYStatisticStore__openDB__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(sqlite3 **)(*(void *)(a1 + 32) + 16);
  if (v2)
  {
    sqlite3_busy_timeout(v2, 60000);
    int v3 = 1;
    sqlite3_extended_result_codes(*(sqlite3 **)(*(void *)(a1 + 32) + 16), 1);
    sqlite3_wal_checkpoint_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), 0, 3, 0, 0);
    sqlite3_wal_hook(*(sqlite3 **)(*(void *)(a1 + 32) + 16), (int (__cdecl *)(void *, sqlite3 *, const char *, int))_SYStatisticsPrune, 0);
    ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "PRAGMA journal_mode=WAL;");
    ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE TABLE IF NOT EXISTS meta (version INTEGER PRIMARY KEY AUTOINCREMENT, timestamp REAL)");
    switch([*(id *)(a1 + 32) _getSchemaVersion])
    {
      case 0u:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE TABLE IF NOT EXISTS message_log (pk INTEGER PRIMARY KEY AUTOINCREMENT, service TEXT, incoming INTEGER, timestamp REAL, delivery_time REAL, type TEXT, identifier TEXT, change_count INTEGER DEFAULT 0, msg_version INTEGER, change_version INTEGER, error TEXT, complete INTEGER DEFAULT 0)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX IF NOT EXISTS msg_by_id ON message_log (identifier ASC, timestamp DESC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        int v3 = 0;
        goto LABEL_4;
      case 1u:
LABEL_4:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN is_request INTEGER DEFAULT 1");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN sync_id TEXT DEFAULT ''");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN request_id TEXT DEFAULT ''");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN vector_clock TEXT DEFAULT ''");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN wants_response INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN got_response INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX msg_by_type ON message_log (type ASC, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX response_by_request ON message_log (request_id ASC, timestamp DESC, identifier ASC, type ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_5;
      case 2u:
LABEL_5:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN wants_delivery_ack INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN delivery_acked INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_6;
      case 3u:
LABEL_6:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN proto_version INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN msg_seqno INTEGER DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_7;
      case 4u:
LABEL_7:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN mach_time REAL DEFAULT 0");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "DROP INDEX msg_by_id");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX msg_by_id ON message_log (identifier ASC, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_8;
      case 5u:
LABEL_8:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN chunk_index INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_9;
      case 6u:
LABEL_9:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX msg_by_service ON message_log (service, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE VIEW receipt_sequence_info AS SELECT msg_seqno, datetime(timestamp, 'localtime'), mach_time, type, identifier, service FROM message_log WHERE incoming=1 ORDER BY service, timestamp ASC");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE VIEW sent_sequence_info AS SELECT msg_seqno, datetime(timestamp, 'localtime'), mach_time, type, identifier, service FROM message_log WHERE incoming=0 ORDER BY service, timestamp ASC");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_10;
      case 7u:
LABEL_10:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN processing_time_ms INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_11;
      case 8u:
LABEL_11:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE TABLE IF NOT EXISTS file_transfer_log (pk INTEGER PRIMARY KEY AUTOINCREMENT, file_url TEXT, service TEXT, incoming INTEGER, timestamp REAL, delivery_time REAL, identifier TEXT, error TEXT, complete INTEGER DEFAULT 0, delivery_acked INTEGER DEFAULT 0, peer_id TEXT, mach_time REAL DEFAULT 0)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX file_transfer_by_service ON file_transfer_log (service, identifier, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN file_transfer_id TEXT DEFAULT NIL");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX file_transfer_messages ON message_log (service, file_transfer_id, timestamp ASC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        goto LABEL_12;
      case 9u:
LABEL_12:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN is_reset_session INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN metadata TEXT");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN rollback INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE message_log ADD COLUMN accepted INTEGER");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        if (v3) {
          goto LABEL_13;
        }
        goto LABEL_14;
      case 0xAu:
LABEL_13:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "DROP INDEX msg_by_id");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX msg_by_id ON message_log (identifier ASC, timestamp DESC)");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "DROP INDEX response_by_request");
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "CREATE INDEX response_by_request ON message_log (request_id ASC, timestamp DESC, identifier ASC, type ASC)");
LABEL_14:
        ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO meta (timestamp) VALUES (datetime('now'))");
        break;
      default:
        break;
    }
    if (sqlite3_table_column_metadata(*(sqlite3 **)(*(void *)(a1 + 32) + 16), 0, "file_transfer_log", "mach_time", 0, 0, 0, 0, 0))
    {
      ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ALTER TABLE file_transfer_log ADD COLUMN mach_time REAL DEFAULT 0");
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO message_log (incoming, timestamp, delivery_time, service, type, identifier, change_count, vector_clock, is_request, sync_id, request_id, error, wants_response, proto_version, msg_seqno, mach_time, chunk_index, is_reset_session, metadata, rollback, accepted) VALUES (1, datetime('now'), ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 24), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v4 = (id)_stats_log;
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_13();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET processing_time_ms=? WHERE pk=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 32), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      int v5 = (id)_stats_log;
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_12();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET error=? WHERE pk=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 40), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v6 = (id)_stats_log;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_11();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET complete=1 WHERE pk=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 48), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      uint64_t v7 = (id)_stats_log;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_10();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO message_log (service, mach_time) VALUES ('reserving row id', ?)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 88), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v8 = (id)_stats_log;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_9();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET incoming=0, timestamp=datetime('now'), service=?, type=?, change_count=?, vector_clock=?, is_request=?, sync_id=?, request_id=?, wants_response=?, wants_delivery_ack=?, proto_version=?, msg_seqno=?, chunk_index=?, is_reset_session=?, metadata=?, rollback=?, accepted=? WHERE pk=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v9 = (id)_stats_log;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_8();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET identifier=?, mach_time=? WHERE pk=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 64), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      int v10 = (id)_stats_log;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_7();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET delivery_time=?, complete=?, got_response=?, error=? WHERE identifier=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v11 = (id)_stats_log;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_6();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT timestamp FROM message_log WHERE identifier=? ORDER BY timestamp DESC LIMIT 1", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      int v12 = (id)_stats_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_5();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET got_response=? WHERE identifier=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 96), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      uint64_t v13 = (id)_stats_log;
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_4();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET delivery_acked=1 WHERE identifier=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 104), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      v14 = (id)_stats_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_3();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "INSERT INTO file_transfer_log (incoming, timestamp, file_url, service, identifier, peer_id, mach_time, delivery_time) VALUES (?, datetime('now'), ?, ?, ?, ?, ?, ?)", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      v15 = (id)_stats_log;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_2();
      }
    }
    if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE file_transfer_log SET delivery_time=?, complete=?, error=? WHERE identifier=?", -1, (sqlite3_stmt **)(*(void *)(a1 + 32) + 120), 0))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      id v16 = (id)_stats_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __27__SYStatisticStore__openDB__block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    dispatch_semaphore_t v17 = _stats_log;
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_DEFAULT, "Statistics DB closed before an enqueued async block could run.", buf, 2u);
    }
  }
}

- (double)_getMachTimestamp
{
  if (_getMachTimestamp_onceToken != -1) {
    dispatch_once(&_getMachTimestamp_onceToken, &__block_literal_global_17);
  }
  return *(double *)&_getMachTimestamp___scale * (double)mach_absolute_time();
}

double __37__SYStatisticStore__getMachTimestamp__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 * 0.000000001 / (double)v1;
  _getMachTimestamp___scale = *(void *)&result;
  return result;
}

- (id)_keySetForMessageLogTable
{
  if (_keySetForMessageLogTable_onceToken != -1) {
    dispatch_once(&_keySetForMessageLogTable_onceToken, &__block_literal_global_166);
  }
  uint64_t v2 = (void *)_keySetForMessageLogTable___keyset;
  return v2;
}

void __45__SYStatisticStore__keySetForMessageLogTable__block_invoke()
{
  v4[20] = *MEMORY[0x263EF8340];
  unint64_t v0 = NSDictionary;
  v4[0] = @"Duration";
  v4[1] = @"Service";
  v4[2] = @"Type";
  v4[3] = @"Identifier";
  v4[4] = @"ChangeCount";
  v4[5] = @"VectorClock";
  v4[6] = @"IsRequest";
  v4[7] = @"SyncID";
  v4[8] = @"RequestIdentifier";
  v4[9] = @"Error";
  v4[10] = @"WantsResponse";
  v4[11] = @"GotResponse";
  v4[12] = @"ChunkIndex";
  v4[13] = @"WantsDeliveryAck";
  v4[14] = @"ProtocolVersion";
  v4[15] = @"MessageSequenceNumber";
  v4[16] = @"IsResetSyncSession";
  v4[17] = @"SessionMetadata";
  v4[18] = @"WantsRollback";
  v4[19] = @"RequestAccepted";
  unint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:20];
  uint64_t v2 = [v0 sharedKeySetForKeys:v1];
  int v3 = (void *)_keySetForMessageLogTable___keyset;
  _keySetForMessageLogTable___keyset = v2;
}

- (id)_unpackMetadata:(id)a3
{
  id v3 = a3;
  id v4 = +[SYSession unarchiveMetadata:v3];
  int v5 = [MEMORY[0x263F08900] dataWithJSONObject:v4 options:0 error:0];
  if (v5)
  {
    id v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  }
  else
  {
    id v6 = [v4 description];
  }

  return v6;
}

- (void)_unpackPBRequest:(id)a3 forMessageID:(unsigned __int16)a4 intoDictionary:(id)a5
{
  int v6 = a4;
  id v51 = a3;
  id v8 = a5;
  id v9 = (objc_class *)objc_opt_class();
  int v10 = NSStringFromClass(v9);
  [v8 setObject:v10 forKeyedSubscript:@"Type"];

  if (!v12 & v11)
  {
    switch(v6)
    {
      case 'e':
        goto LABEL_9;
      case 'f':
        id v13 = v51;
        v14 = [v13 sessionID];
        [v8 setObject:v14 forKeyedSubscript:@"SyncID"];

        v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isResetSync"));
        [v8 setObject:v15 forKeyedSubscript:@"IsResetSyncSession"];

        [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsResponse"];
        if ([v13 hasMetadata])
        {
          id v16 = [v13 metadata];
          dispatch_semaphore_t v17 = [(SYStatisticStore *)self _unpackMetadata:v16];
          objc_super v18 = @"SessionMetadata";
LABEL_27:
          [v8 setObject:v17 forKeyedSubscript:v18];
        }
        goto LABEL_28;
      case 'g':
        id v13 = v51;
        id v21 = [v13 sessionID];
        [v8 setObject:v21 forKeyedSubscript:@"SyncID"];

        v22 = NSNumber;
        v23 = [v13 changes];
        v24 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
        [v8 setObject:v24 forKeyedSubscript:@"ChangeCount"];

        [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsResponse"];
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v13, "index"));
LABEL_24:
        int v36 = (void *)v25;
        BOOL v37 = @"ChunkIndex";
        goto LABEL_25;
      case 'h':
        id v13 = v51;
        uint64_t v19 = [v13 sessionID];
LABEL_13:
        dispatch_semaphore_t v26 = (void *)v19;
        v27 = @"SyncID";
        goto LABEL_14;
      case 'i':
        id v13 = v51;
        v28 = [v13 sessionID];
        [v8 setObject:v28 forKeyedSubscript:@"SyncID"];

        if ([v13 hasError])
        {
          BOOL v29 = [v13 error];
          v30 = [v29 description];
          [v8 setObject:v30 forKeyedSubscript:@"Error"];
        }
        if (![v13 hasRollback]) {
          goto LABEL_20;
        }
        dispatch_semaphore_t v26 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "rollback"));
        v27 = @"WantsRollback";
LABEL_14:
        [v8 setObject:v26 forKeyedSubscript:v27];

LABEL_20:
        [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsResponse"];
        goto LABEL_28;
      default:
        if (v6 != 0x7FFF) {
          goto LABEL_30;
        }
LABEL_9:
        id v20 = [v51 header];
        if (!v20) {
          goto LABEL_30;
        }
        goto LABEL_29;
    }
  }
  switch(v6)
  {
    case 1:
    case 5:
      id v13 = v51;
      uint64_t v19 = [v13 syncID];
      goto LABEL_13;
    case 2:
      id v13 = v51;
      v31 = [v13 syncID];
      [v8 setObject:v31 forKeyedSubscript:@"SyncID"];

      int v32 = NSNumber;
      v33 = [v13 allObjects];
      v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "count"));
      [v8 setObject:v34 forKeyedSubscript:@"ChangeCount"];

      goto LABEL_20;
    case 3:
      id v13 = v51;
      v35 = [v13 syncID];
      [v8 setObject:v35 forKeyedSubscript:@"SyncID"];

      if (![v13 hasEstimatedChangeCount]) {
        goto LABEL_28;
      }
      int v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "estimatedChangeCount"));
      BOOL v37 = @"ChangeCount";
      break;
    case 4:
      id v13 = v51;
      uint64_t v38 = [v13 syncID];
      [v8 setObject:v38 forKeyedSubscript:@"SyncID"];

      v39 = NSNumber;
      uint64_t v40 = [v13 objects];
      char v41 = objc_msgSend(v39, "numberWithUnsignedInteger:", objc_msgSend(v40, "count"));
      [v8 setObject:v41 forKeyedSubscript:@"ChangeCount"];

      [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsResponse"];
      uint64_t v25 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "chunkIndex"));
      goto LABEL_24;
    case 6:
      v42 = NSNumber;
      id v13 = v51;
      id v16 = [v13 changes];
      dispatch_semaphore_t v17 = objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
      objc_super v18 = @"ChangeCount";
      goto LABEL_27;
    default:
      JUMPOUT(0);
  }
LABEL_25:
  [v8 setObject:v36 forKeyedSubscript:v37];

LABEL_28:
  id v20 = [v13 header];

  if (v20)
  {
LABEL_29:
    id v43 = NSNumber;
    double Current = CFAbsoluteTimeGetCurrent();
    [v20 timestamp];
    dispatch_semaphore_t v46 = [v43 numberWithDouble:Current - v45];
    [v8 setObject:v46 forKeyedSubscript:@"Duration"];

    v47 = [v20 state];
    v48 = [v47 jsonRepresentation];
    [v8 setObject:v48 forKeyedSubscript:@"VectorClock"];

    v49 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "version"));
    [v8 setObject:v49 forKeyedSubscript:@"ProtocolVersion"];

    v50 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v20, "sequenceNumber"));
    [v8 setObject:v50 forKeyedSubscript:@"MessageSequenceNumber"];
  }
LABEL_30:
}

- (void)_unpackPBResponse:(id)a3 forMessageID:(unsigned __int16)a4 intoDictionary:(id)a5
{
  int v6 = a4;
  id v46 = a3;
  id v8 = a5;
  id v9 = (objc_class *)objc_opt_class();
  int v10 = NSStringFromClass(v9);
  [v8 setObject:v10 forKeyedSubscript:@"Type"];

  switch(v6)
  {
    case 'e':
      id v11 = v46;
      id v12 = v11;
      id v13 = NSNumber;
      goto LABEL_17;
    case 'f':
      id v25 = v46;
      dispatch_semaphore_t v26 = [v25 sessionID];
      [v8 setObject:v26 forKeyedSubscript:@"SyncID"];

      if ([v25 hasMetadata])
      {
        v27 = [v25 metadata];
        v28 = [(SYStatisticStore *)self _unpackMetadata:v27];
        [v8 setObject:v28 forKeyedSubscript:@"SessionMetadata"];
      }
      if (![v25 hasError]) {
        goto LABEL_27;
      }
      BOOL v29 = v25;
      goto LABEL_20;
    case 'g':
      id v12 = v46;
      v30 = [v12 sessionID];
      [v8 setObject:v30 forKeyedSubscript:@"SyncID"];

      uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v12, "index"));
LABEL_15:
      v14 = (void *)v17;
      v15 = @"ChunkIndex";
      goto LABEL_18;
    case 'h':
      id v12 = v46;
      v31 = [v12 sessionID];
      [v8 setObject:v31 forKeyedSubscript:@"SyncID"];

      [v8 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsResponse"];
      id v13 = NSNumber;
      id v11 = v12;
LABEL_17:
      v14 = objc_msgSend(v13, "numberWithBool:", objc_msgSend(v11, "accepted"));
      v15 = @"RequestAccepted";
LABEL_18:
      [v8 setObject:v14 forKeyedSubscript:v15];

      if (![v12 hasError]) {
        goto LABEL_27;
      }
      BOOL v29 = v12;
LABEL_20:
      id v21 = [v29 error];
      int v32 = [v21 description];
      [v8 setObject:v32 forKeyedSubscript:@"Error"];

      break;
    case 'i':
      id v33 = v46;
      v34 = [v33 sessionID];
      [v8 setObject:v34 forKeyedSubscript:@"SyncID"];

      if ([v33 hasError])
      {
        v35 = [v33 error];
        int v36 = [v35 description];
        [v8 setObject:v36 forKeyedSubscript:@"Error"];
      }
      if (![v33 hasDidRollback]) {
        goto LABEL_27;
      }
      id v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v33, "didRollback"));
      v24 = @"WantsRollback";
LABEL_25:
      [v8 setObject:v21 forKeyedSubscript:v24];
      break;
    default:
      switch(v6)
      {
        case 1:
          id v18 = v46;
          uint64_t v19 = [v18 requestSyncID];
          [v8 setObject:v19 forKeyedSubscript:@"SyncID"];

          if (![v18 hasError]) {
            goto LABEL_27;
          }
          id v20 = [v18 error];
          id v21 = [v20 description];

          if ([v18 hasInProgressSyncID])
          {
            v22 = [v18 inProgressSyncID];
            uint64_t v23 = [v21 stringByAppendingFormat:@" InProgressSyncID=%@", v22];

            id v21 = (void *)v23;
          }
          v24 = @"Error";
          goto LABEL_25;
        case 2:
        case 5:
          id v12 = v46;
          v14 = [v12 syncID];
          v15 = @"SyncID";
          goto LABEL_18;
        case 4:
          id v12 = v46;
          id v16 = [v12 syncID];
          [v8 setObject:v16 forKeyedSubscript:@"SyncID"];

          uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "chunkIndex"));
          goto LABEL_15;
        default:
          goto LABEL_29;
      }
  }

LABEL_27:
  BOOL v37 = [v46 header];

  if (v37)
  {
    uint64_t v38 = NSNumber;
    double Current = CFAbsoluteTimeGetCurrent();
    [v37 timestamp];
    char v41 = [v38 numberWithDouble:Current - v40];
    [v8 setObject:v41 forKeyedSubscript:@"Duration"];

    v42 = [v37 state];
    id v43 = [v42 jsonRepresentation];
    [v8 setObject:v43 forKeyedSubscript:@"VectorClock"];

    id v44 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v37, "version"));
    [v8 setObject:v44 forKeyedSubscript:@"ProtocolVersion"];

    double v45 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v37, "sequenceNumber"));
    [v8 setObject:v45 forKeyedSubscript:@"MessageSequenceNumber"];
  }
LABEL_29:
}

- (id)_unpackMessageData:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263EFF9A0];
  int v6 = [(SYStatisticStore *)self _keySetForMessageLogTable];
  uint64_t v7 = [v5 dictionaryWithSharedKeySet:v6];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v4;
    [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IsRequest"];
    id v9 = [v8 idsIdentifier];

    if (v9)
    {
      int v10 = [v8 idsIdentifier];
      [v7 setObject:v10 forKeyedSubscript:@"Identifier"];
    }
    id v11 = [v8 pbRequest];

    if (v11)
    {
      id v12 = [v8 pbRequest];
      -[SYStatisticStore _unpackPBRequest:forMessageID:intoDictionary:](self, "_unpackPBRequest:forMessageID:intoDictionary:", v12, [v8 messageID], v7);
    }
    id v13 = [v8 extraIDSOptions];
    v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F49F90]];
    int v15 = [v14 BOOLValue];

    if (v15) {
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsDeliveryAck"];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v4;
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IsRequest"];
      uint64_t v17 = [v16 idsIdentifier];

      if (v17)
      {
        id v18 = [v16 idsIdentifier];
        [v7 setObject:v18 forKeyedSubscript:@"Identifier"];
      }
      uint64_t v19 = [v16 pbRequest];

      if (v19)
      {
        id v20 = [v16 pbRequest];
        -[SYStatisticStore _unpackPBRequest:forMessageID:intoDictionary:](self, "_unpackPBRequest:forMessageID:intoDictionary:", v20, [v16 messageID], v7);
      }
      id v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v16, "expectsResponse"));
      [v7 setObject:v21 forKeyedSubscript:@"WantsResponse"];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v4;
        [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"IsRequest"];
        uint64_t v23 = [v22 request];
        v24 = [v23 idsIdentifier];

        if (v24)
        {
          id v25 = [v23 idsIdentifier];
          [v7 setObject:v25 forKeyedSubscript:@"RequestIdentifier"];
        }
        dispatch_semaphore_t v26 = [v22 pbResponse];

        if (v26)
        {
          v27 = [v22 pbResponse];
          -[SYStatisticStore _unpackPBResponse:forMessageID:intoDictionary:](self, "_unpackPBResponse:forMessageID:intoDictionary:", v27, [v23 messageID], v7);
        }
        v28 = [v22 extraIDSOptions];
        BOOL v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F49F90]];
        int v30 = [v29 BOOLValue];

        if (v30) {
          [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"WantsDeliveryAck"];
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_30;
        }
        id v31 = v4;
        [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"IsRequest"];
        int v32 = [v31 idsIdentifier];

        if (v32)
        {
          id v33 = [v31 idsIdentifier];
          [v7 setObject:v33 forKeyedSubscript:@"Identifier"];
        }
        v34 = [v31 requestIDSIdentifier];

        if (v34)
        {
          v35 = [v31 requestIDSIdentifier];
          [v7 setObject:v35 forKeyedSubscript:@"RequestIdentifier"];
        }
        int v36 = [v31 pbResponse];

        if (v36)
        {
          BOOL v37 = [v31 pbResponse];
          -[SYStatisticStore _unpackPBResponse:forMessageID:intoDictionary:](self, "_unpackPBResponse:forMessageID:intoDictionary:", v37, [v31 messageID], v7);
        }
      }
    }
  }

LABEL_30:
  return v7;
}

- (void)recordIncomingMessage:(id)a3 forService:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SYStatisticStore *)self _unpackMessageData:a3];
  id v8 = [v7 objectForKeyedSubscript:@"RequestIdentifier"];

  if (v8)
  {
    id v9 = [v7 objectForKeyedSubscript:@"RequestIdentifier"];
    [(SYStatisticStore *)self updateOutgoingMessageWithIdentifier:v9 didReceiveResponse:1 error:0];
  }
  [(SYStatisticStore *)self _getMachTimestamp];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke;
  v13[3] = &unk_2644245A0;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  uint64_t v16 = v10;
  id v11 = v6;
  id v12 = v7;
  [(SYStatisticStore *)self _onQueueAsync:v13];
}

sqlite3_int64 __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Duration"];
  [v3 doubleValue];
  sqlite3_bind_double(v2, 1, v4);

  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24), 2, *(id *)(a1 + 48));
  int v5 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Type"];
  BindString_0(v5, 3, v6);

  uint64_t v7 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v8 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Identifier"];
  BindString_0(v7, 4, v8);

  id v9 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  uint64_t v10 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ChangeCount"];
  sqlite3_bind_int(v9, 5, [v10 intValue]);

  id v11 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"VectorClock"];
  BindString_0(v11, 6, v12);

  id v13 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IsRequest"];
  sqlite3_bind_int(v13, 7, [v14 BOOLValue]);

  id v15 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  uint64_t v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SyncID"];
  BindString_0(v15, 8, v16);

  uint64_t v17 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RequestIdentifier"];
  BindString_0(v17, 9, v18);

  uint64_t v19 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Error"];
  BindString_0(v19, 10, v20);

  id v21 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"WantsResponse"];
  sqlite3_bind_int(v21, 11, [v22 BOOLValue]);

  uint64_t v23 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ProtocolVersion"];
  sqlite3_bind_int(v23, 12, [v24 intValue]);

  id v25 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  dispatch_semaphore_t v26 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"MessageSequenceNumber"];
  sqlite3_bind_int64(v25, 13, [v26 longLongValue]);

  sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24), 14, *(double *)(a1 + 56));
  v27 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  v28 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"ChunkIndex"];
  sqlite3_bind_int(v27, 15, [v28 intValue]);

  BOOL v29 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  int v30 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"IsResetSyncSession"];
  sqlite3_bind_int(v29, 16, [v30 BOOLValue]);

  id v31 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  int v32 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"SessionMetadata"];
  id v33 = [v32 description];
  BindString_0(v31, 17, v33);

  v34 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  v35 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"WantsRollback"];
  sqlite3_bind_int(v34, 18, [v35 BOOLValue]);

  int v36 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 24);
  BOOL v37 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"RequestAccepted"];
  sqlite3_bind_int(v36, 19, [v37 BOOLValue]);

  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 24));
  sqlite3_int64 result = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 32) + 16));
  *(void *)(*(void *)(a1 + 32) + 128) = result;
  return result;
}

- (void)updateLastIncomingMessageWithProcessingTime:(double)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke;
  v3[3] = &unk_264422A88;
  *(double *)&v3[5] = a3;
  v3[4] = self;
  [(SYStatisticStore *)self _onQueueAsync:v3];
}

uint64_t __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 32)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 32));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 32));
}

- (void)updateLastIncomingMessageWithError:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke;
  v6[3] = &unk_264422990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYStatisticStore *)self _onQueueAsync:v6];
}

uint64_t __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 40)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 40));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 40));
}

- (void)markLastIncomingMessageComplete
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke;
  v2[3] = &unk_264422AB0;
  v2[4] = self;
  [(SYStatisticStore *)self _onQueueAsync:v2];
}

uint64_t __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 48));
}

- (void)recordOutgoingMessage:(id)a3 forService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000;
    uint64_t v20 = -1;
    [(SYStatisticStore *)self _getMachTimestamp];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke;
    v16[3] = &unk_2644243E0;
    v16[6] = v8;
    v16[4] = self;
    v16[5] = &v17;
    [(SYStatisticStore *)self _onQueueSync:v16];
    if (v18[3] != -1)
    {
      id v9 = objc_msgSend(NSNumber, "numberWithLongLong:");
      objc_setAssociatedObject(v6, "CompanionSync.StatisticStore.ReservedRowID", v9, (void *)1);

      uint64_t v10 = [(SYStatisticStore *)self _unpackMessageData:v6];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_179;
      v12[3] = &unk_2644245C8;
      v12[4] = self;
      id v13 = v7;
      id v11 = v10;
      id v14 = v11;
      id v15 = &v17;
      [(SYStatisticStore *)self _onQueueAsync:v12];
    }
    _Block_object_dispose(&v17, 8);
  }
}

uint64_t __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88)) - 102) > 0xFFFFFFFD)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 32) + 16));
  }
  else
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 88));
}

uint64_t __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_179(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 1, *(id *)(a1 + 40));
  uint64_t v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v3 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"Type"];
  BindString_0(v2, 2, v3);

  id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v5 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ChangeCount"];
  sqlite3_bind_int(v4, 3, [v5 intValue]);

  id v6 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"VectorClock"];
  BindString_0(v6, 4, v7);

  uint64_t v8 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v9 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"IsRequest"];
  sqlite3_bind_int(v8, 5, [v9 BOOLValue]);

  uint64_t v10 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v11 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"SyncID"];
  BindString_0(v10, 6, v11);

  id v12 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v13 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"RequestIdentifier"];
  BindString_0(v12, 7, v13);

  id v14 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v15 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"WantsResponse"];
  sqlite3_bind_int(v14, 8, [v15 BOOLValue]);

  uint64_t v16 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  uint64_t v17 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"WantsDeliveryAck"];
  sqlite3_bind_int(v16, 9, [v17 BOOLValue]);

  id v18 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  uint64_t v19 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ProtocolVersion"];
  sqlite3_bind_int(v18, 10, [v19 intValue]);

  uint64_t v20 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v21 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"MessageSequenceNumber"];
  sqlite3_bind_int64(v20, 11, [v21 longLongValue]);

  id v22 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  uint64_t v23 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"ChunkIndex"];
  sqlite3_bind_int(v22, 12, [v23 intValue]);

  v24 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  id v25 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"IsResetSyncSession"];
  sqlite3_bind_int(v24, 13, [v25 BOOLValue]);

  dispatch_semaphore_t v26 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  v27 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"SessionMetadata"];
  v28 = [v27 description];
  BindString_0(v26, 14, v28);

  BOOL v29 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  int v30 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"WantsRollback"];
  sqlite3_bind_int(v29, 15, [v30 BOOLValue]);

  id v31 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 56);
  int v32 = [*(id *)(a1 + 48) objectForKeyedSubscript:@"RequestAccepted"];
  sqlite3_bind_int(v31, 16, [v32 BOOLValue]);

  sqlite3_bind_int64(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56), 17, *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_179_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 56));
}

- (void)assignIdentifier:(id)a3 toOutgoingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_getAssociatedObject(v7, "CompanionSync.StatisticStore.ReservedRowID");
  if (v8
    || ([(SYStatisticStore *)self recordOutgoingMessage:v7 forService:@"<unknown>"], objc_getAssociatedObject(v7, "CompanionSync.StatisticStore.ReservedRowID"), (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = [v8 longLongValue];
    [(SYStatisticStore *)self _getMachTimestamp];
    uint64_t v11 = v10;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke;
    v12[3] = &unk_2644245F0;
    v12[4] = self;
    id v13 = v6;
    uint64_t v14 = v11;
    uint64_t v15 = v9;
    [(SYStatisticStore *)self _onQueueAsync:v12];
  }
}

uint64_t __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 64));
}

- (void)updateOutgoingMessageWithIdentifier:(id)a3 forService:(id)a4 sentSuccessfully:(BOOL)a5 sendError:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke;
  v13[3] = &unk_264424618;
  v13[4] = self;
  id v14 = v9;
  BOOL v16 = a5;
  id v15 = v10;
  id v11 = v10;
  id v12 = v9;
  [(SYStatisticStore *)self _onQueueAsync:v13];
}

uint64_t __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke(uint64_t a1)
{
  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 1, *(id *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_2();
    }
  }
  double v2 = sqlite3_column_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80), 0);
  double v3 = 0.0;
  if (v2 > 0.0) {
    double v3 = CFAbsoluteTimeGetCurrent() - v2;
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
  sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 80));
  sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 1, v3);
  sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 2, *(unsigned __int8 *)(a1 + 56));
  sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 3, 0);
  id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 72);
  id v5 = [*(id *)(a1 + 48) localizedDescription];
  BindString_0(v4, 4, v5);

  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 5, *(id *)(a1 + 40));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
}

- (void)updateOutgoingMessageWithIdentifier:(id)a3 didReceiveResponse:(BOOL)a4 error:(id)a5
{
  id v7 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke;
  v9[3] = &unk_264422940;
  BOOL v11 = a4;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(SYStatisticStore *)self _onQueueAsync:v9];
}

uint64_t __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 96));
}

- (void)confirmDeliveryOfOutgoingMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke;
  v6[3] = &unk_264422990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYStatisticStore *)self _onQueueAsync:v6];
}

uint64_t __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke(uint64_t a1)
{
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 104));
}

- (void)recordIncomingFileTransferAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 forService:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(SYStatisticStore *)self _getMachTimestamp];
  uint64_t v15 = v14;
  BOOL v16 = [v11 objectForKeyedSubscript:@"EnqueuedAt"];
  if (v16)
  {
    uint64_t v17 = objc_opt_new();
    [v17 timeIntervalSinceDate:v16];
    uint64_t v19 = v18;
  }
  else
  {
    uint64_t v19 = 0;
  }
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke;
  v24[3] = &unk_264424640;
  v24[4] = self;
  id v25 = v10;
  id v26 = v13;
  id v27 = v12;
  id v28 = v11;
  uint64_t v29 = v15;
  uint64_t v30 = v19;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v23 = v10;
  [(SYStatisticStore *)self _onQueueAsync:v24];
}

uint64_t __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke(uint64_t a1)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 1, 1);
  double v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 112);
  double v3 = [*(id *)(a1 + 40) absoluteString];
  BindString_0(v2, 2, v3);

  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 3, *(id *)(a1 + 48));
  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 4, *(id *)(a1 + 56));
  id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 112);
  id v5 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"PeerID"];
  BindString_0(v4, 5, v5);

  sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 6, *(double *)(a1 + 72));
  sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 7, *(double *)(a1 + 80));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
}

- (void)recordOutgoingFileTransferAtURL:(id)a3 metadata:(id)a4 identifier:(id)a5 error:(id)a6 forService:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  [(SYStatisticStore *)self _getMachTimestamp];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke;
  v20[3] = &unk_264424668;
  v20[4] = self;
  id v21 = v11;
  id v22 = v14;
  id v23 = v13;
  id v24 = v12;
  uint64_t v25 = v15;
  id v16 = v12;
  id v17 = v13;
  id v18 = v14;
  id v19 = v11;
  [(SYStatisticStore *)self _onQueueAsync:v20];
}

uint64_t __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke(uint64_t a1)
{
  sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 1, 0);
  double v2 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 112);
  double v3 = [*(id *)(a1 + 40) absoluteString];
  BindString_0(v2, 2, v3);

  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 3, *(id *)(a1 + 48));
  BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 4, *(id *)(a1 + 56));
  id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 112);
  id v5 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"PeerID"];
  BindString_0(v4, 5, v5);

  sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112), 6, *(double *)(a1 + 72));
  if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112)) - 102) <= 0xFFFFFFFD)
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke_cold_1();
    }
  }
  sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
  return sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 112));
}

- (void)updateOutgoingFileTransferWithIdentifier:(id)a3 sentSuccessfully:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke;
  v12[3] = &unk_264424618;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(SYStatisticStore *)self _onQueueAsync:v12];
}

void __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "SELECT timestamp FROM file_transfer_log WHERE identifier=? ORDER BY timestamp DESC LIMIT 1", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke_cold_3();
    }
  }
  else
  {
    BindString_0(ppStmt, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_2();
      }
    }
    double v2 = sqlite3_column_double(ppStmt, 0);
    double v3 = 0.0;
    if (v2 > 0.0) {
      double v3 = CFAbsoluteTimeGetCurrent() - v2;
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
    sqlite3_bind_double(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 1, v3);
    sqlite3_bind_int(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 2, *(unsigned __int8 *)(a1 + 56));
    id v4 = *(sqlite3_stmt **)(*(void *)(a1 + 32) + 72);
    id v5 = [*(id *)(a1 + 48) localizedDescription];
    BindString_0(v4, 3, v5);

    BindString_0(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72), 4, *(id *)(a1 + 40));
    if ((sqlite3_step(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72)) - 102) <= 0xFFFFFFFD)
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_1();
      }
    }
    sqlite3_reset(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
    sqlite3_clear_bindings(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 72));
  }
}

- (void)confirmDeliveryOfOutgoingFileTransfer:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__SYStatisticStore_confirmDeliveryOfOutgoingFileTransfer___block_invoke;
  v6[3] = &unk_264422990;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(SYStatisticStore *)self _onQueueAsync:v6];
}

void __58__SYStatisticStore_confirmDeliveryOfOutgoingFileTransfer___block_invoke(uint64_t a1)
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "UPDATE message_log SET delivery_acked=1 WHERE identifier=?", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1();
    }
  }
  else
  {
    BindString_0(ppStmt, 1, *(id *)(a1 + 40));
    if ((sqlite3_step(ppStmt) - 102) <= 0xFFFFFFFD)
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1();
      }
    }
    sqlite3_reset(ppStmt);
    sqlite3_clear_bindings(ppStmt);
    sqlite3_finalize(ppStmt);
  }
}

- (unint64_t)rowIDForPartialMessage:(id)a3
{
  double v3 = objc_getAssociatedObject(a3, "CompanionSync.StatisticStore.ReservedRowID");
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (void)setFileTransferIdentifier:(id)a3 forOutgoingMessagesWithRowIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke;
  v10[3] = &unk_264422BF8;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  [(SYStatisticStore *)self _onQueueAsync:v10];
}

void __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v3 = *(void *)(a1 + 32);
  [*(id *)(a1 + 40) _getMachTimestamp];
  id v5 = objc_msgSend(v2, "initWithFormat:", @"UPDATE message_log SET identifier='FileTransfer:%@', file_transfer_id='%@', mach_time='%f' WHERE pk IN ("), v3, v3, v4;
  id v6 = *(void **)(a1 + 48);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_2;
  v10[3] = &unk_264424690;
  id v7 = v5;
  id v11 = v7;
  id v12 = *(id *)(a1 + 48);
  [v6 enumerateIndexesUsingBlock:v10];
  [v7 appendString:@""]);
  id v8 = *(sqlite3 **)(*(void *)(a1 + 40) + 16);
  id v9 = v7;
  if (ExecuteSQL_2(v8, (char *)[v9 UTF8String]))
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_cold_1();
    }
  }
}

unint64_t __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_2(uint64_t a1, unint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"'%lu'", a2);
  unint64_t result = [*(id *)(a1 + 40) lastIndex];
  if (result > a2)
  {
    id v5 = *(void **)(a1 + 32);
    return [v5 appendString:@", "];
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presenterOperationQueue, 0);
  objc_storeStrong((id *)&self->_operations_queue, 0);
  objc_storeStrong((id *)&self->_preemption_queue, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)_initializeFilePresentation
{
  uint64_t v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
  presenterOperationQueue = self->_presenterOperationQueue;
  self->_presenterOperationQueue = v3;

  operations_queue = self->_operations_queue;
  id v5 = self->_presenterOperationQueue;
  [(NSOperationQueue *)v5 setUnderlyingQueue:operations_queue];
}

- (NSURL)presentedItemURL
{
  id v2 = (void *)[objc_alloc(NSURL) initFileURLWithPath:self->_path isDirectory:0];
  return (NSURL *)v2;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_presenterOperationQueue;
}

- (void)accommodatePresentedItemDeletionWithCompletionHandler:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  if (self->_db)
  {
    if ([(SYStatisticStore *)self _closeDB])
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        -[SYStatisticStore(NSFilePresentation) accommodatePresentedItemDeletionWithCompletionHandler:]();
      }
    }
    self->_db = 0;
  }
  v4[2](v4, 0);
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  id v7 = [a3 URLByAppendingPathComponent:@"statistics.db"];
  uint64_t v4 = [v7 absoluteURL];
  id v5 = [v4 path];
  path = self->_path;
  self->_path = v5;
}

- (sqlite3)dbRef
{
  return self->_db;
}

- (id)operationQ
{
  return self->_preemption_queue;
}

+ (id)unpackMessageData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[SYStatisticStore sharedInstance];
  id v5 = [v4 _unpackMessageData:v3];

  return v5;
}

- (id)_LOCKED_allServiceNames
{
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "SELECT DISTINCT service FROM message_log", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      -[SYStatisticStore(DatabaseTidying) _LOCKED_allServiceNames]();
    }
    id v2 = 0;
  }
  else
  {
    id v3 = objc_opt_new();
    while (1)
    {
      int v4 = sqlite3_step(ppStmt);
      if (v4 != 100) {
        break;
      }
      id v5 = sqlite3_column_text(ppStmt, 0);
      if (v5)
      {
        uint64_t v6 = [NSString stringWithUTF8String:v5];
        if (v6)
        {
          id v7 = (void *)v6;
          [v3 addObject:v6];
        }
      }
    }
    if (!v4 || v4 == 101) {
      goto LABEL_19;
    }
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      -[SYStatisticStore(DatabaseTidying) _LOCKED_allServiceNames]();
    }
    if ([v3 count])
    {
LABEL_19:
      sqlite3_finalize(ppStmt);
      id v2 = v3;
    }
    else
    {
      id v2 = 0;
    }
  }
  return v2;
}

- (BOOL)_LOCKED_pruneMessageLogForServices:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "DELETE FROM message_log WHERE service=? ORDER BY pk DESC LIMIT -1 OFFSET 250", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:]();
    }
    ExecuteSQL_2(self->_db, "ROLLBACK");
    BOOL v5 = 0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          BindString_0(ppStmt, 1, *(id *)(*((void *)&v13 + 1) + 8 * i));
          int v11 = sqlite3_step(ppStmt);
          if (v11 && v11 != 101)
          {
            if (_stats_log_pred != -1) {
              _os_once();
            }
            if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
              -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:]();
            }
            BOOL v5 = 0;
            goto LABEL_22;
          }
          sqlite3_reset(ppStmt);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 1;
LABEL_22:

    sqlite3_finalize(ppStmt);
  }

  return v5;
}

- (BOOL)_LOCKED_pruneFileTransferLogForServices:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_db, "DELETE FROM file_transfer_log WHERE service=? ORDER BY pk DESC LIMIT -1 OFFSET 250", -1, &ppStmt, 0))
  {
    if (_stats_log_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
      -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:]();
    }
    ExecuteSQL_2(self->_db, "ROLLBACK");
    BOOL v5 = 0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          BindString_0(ppStmt, 1, *(id *)(*((void *)&v13 + 1) + 8 * i));
          int v11 = sqlite3_step(ppStmt);
          if (v11 && v11 != 101)
          {
            if (_stats_log_pred != -1) {
              _os_once();
            }
            if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
              -[SYStatisticStore(DatabaseTidying) _LOCKED_pruneMessageLogForServices:]();
            }
            BOOL v5 = 0;
            goto LABEL_22;
          }
          sqlite3_reset(ppStmt);
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v5 = 1;
LABEL_22:

    sqlite3_finalize(ppStmt);
  }

  return v5;
}

- (void)_pruneOldData
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke;
  v2[3] = &unk_264422AB0;
  v2[4] = self;
  [(SYStatisticStore *)self _onQueueAsync:v2];
}

void __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_LOCKED_allServiceNames");
  if (v2)
  {
    if (ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "BEGIN EXCLUSIVE TRANSACTION"))
    {
      if (_stats_log_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
        __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_2();
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "_LOCKED_pruneMessageLogForServices:", v2) {
           && objc_msgSend(*(id *)(a1 + 32), "_LOCKED_pruneFileTransferLogForServices:", v2))
    }
    {
      if (ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "COMMIT"))
      {
        if (_stats_log_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)_stats_log, OS_LOG_TYPE_ERROR)) {
          __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_1();
        }
      }
    }
    else
    {
      ExecuteSQL_2(*(sqlite3 **)(*(void *)(a1 + 32) + 16), "ROLLBACK");
    }
  }
}

- (void)_tableEmpty:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error checking for empty table - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

- (void)_ensureCorrectFileOwnership:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  int v4 = *__error();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "Error chowning path %{public}@, error: %d", (uint8_t *)&v5, 0x12u);
}

- (uint64_t)_ensureCorrectFileOwnership:.cold.2()
{
  return _os_assumes_log();
}

void __32__SYStatisticStore__openDBFile___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_ERROR, "Error coordinating deletion of existing DB: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __32__SYStatisticStore__openDBFile___block_invoke_92_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to open statistics DB - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

- (void)_getSchemaVersion
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error fetching schema version - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_6()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_7()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_8()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_9()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_10()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_11()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_12()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __27__SYStatisticStore__openDB__block_invoke_cold_13()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3(&dword_21C7C9000, v0, v1, "SQL Error preparing statement \"%{public}s\" - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, 2u);
}

void __53__SYStatisticStore_recordIncomingMessage_forService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error inserting incoming message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __64__SYStatisticStore_updateLastIncomingMessageWithProcessingTime___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error adding processing time to incoming message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __55__SYStatisticStore_updateLastIncomingMessageWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to add error to incoming message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __51__SYStatisticStore_markLastIncomingMessageComplete__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error marking incoming message as complete - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error reserving db row for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __53__SYStatisticStore_recordOutgoingMessage_forService___block_invoke_179_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error inserting outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __55__SYStatisticStore_assignIdentifier_toOutgoingMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error recording identifier for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error updating outgoing message for ID - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __94__SYStatisticStore_updateOutgoingMessageWithIdentifier_forService_sentSuccessfully_sendError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error finding timestamp for ID - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __81__SYStatisticStore_updateOutgoingMessageWithIdentifier_didReceiveResponse_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error while updating response state for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __53__SYStatisticStore_confirmDeliveryOfOutgoingMessage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error while recording delivery confirmation for outgoing message - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __83__SYStatisticStore_recordIncomingFileTransferAtURL_metadata_identifier_forService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error while recording incoming file transfer - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __89__SYStatisticStore_recordOutgoingFileTransferAtURL_metadata_identifier_error_forService___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error while recording outgoing file transfer - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __84__SYStatisticStore_updateOutgoingFileTransferWithIdentifier_sentSuccessfully_error___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Error while updating outgoing file transfer for send-success notification - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __76__SYStatisticStore_setFileTransferIdentifier_forOutgoingMessagesWithRowIDs___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1(&dword_21C7C9000, v0, v1, "Error bulk-updating identifiers (statement = \"%{public}@\") - %{companionsync:sqlite3err, public}d");
}

void __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Prune transaction failed to commit - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

void __50__SYStatisticStore_DatabaseTidying___pruneOldData__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_6(&dword_21C7C9000, v0, v1, "Failed to create transaction for DB prune - %{companionsync:sqlite3err, public}d", v2, v3, v4, v5, v6);
}

@end