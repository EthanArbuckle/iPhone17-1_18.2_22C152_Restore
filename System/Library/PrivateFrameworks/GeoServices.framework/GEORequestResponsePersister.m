@interface GEORequestResponsePersister
- (BOOL)_checkDbIsWriteable:(id *)a3;
- (BOOL)_pruneDBToDefaultAge:(id *)a3;
- (BOOL)_pruneDBToDefaultSize:(id *)a3;
- (BOOL)_pruneDBToSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)_pruneEntriesOlderThan:(id)a3 error:(id *)a4;
- (BOOL)_runAllPruners:(id *)a3;
- (BOOL)pruneDBToDefaultAge:(id *)a3;
- (BOOL)pruneDBToDefaultSize:(id *)a3;
- (BOOL)pruneDBToSize:(unint64_t)a3 error:(id *)a4;
- (BOOL)pruneEntriesOlderThan:(id)a3 error:(id *)a4;
- (BOOL)runAllPruners:(id *)a3;
- (id)enumerateAllEntriesWithBlock:(id)a3;
- (id)enumerateEntriesInRange:(id)a3 withBlock:(id)a4;
- (id)enumerateEntriesOfType:(int)a3 inRange:(id)a4 withBlock:(id)a5;
- (id)enumerateEntriesOfType:(int)a3 withBlock:(id)a4;
- (id)findRequest:(id)a3 withBlock:(id)a4;
- (id)findResponse:(id)a3 withBlock:(id)a4;
- (id)initWritable:(BOOL)a3;
- (unint64_t)getTotalSize:(id *)a3;
- (unsigned)_restoreOrphanedEntries:(id *)a3;
- (unsigned)restoreOrphanedEntries:(id *)a3;
- (void)_persistEvent:(id)a3;
- (void)_reschedulePruner;
- (void)dealloc;
- (void)persistRequestTask:(id)a3 url:(id)a4 request:(id)a5;
- (void)persistResponseTask:(id)a3 error:(id)a4;
- (void)persistResponseTask:(id)a3 response:(id)a4;
- (void)persistResponseTaskCanceled:(id)a3;
@end

@implementation GEORequestResponsePersister

- (id)initWritable:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEORequestResponsePersister;
  v4 = [(GEORequestResponsePersister *)&v18 init];
  if (v4)
  {
    v5 = +[GEOFilePaths urlFor:35];
    if (v3) {
      +[GEOSQLiteDB defaultPragmas];
    }
    else {
    v6 = +[GEOSQLiteDB defaultReadOnlyPragmas];
    }
    v7 = (void *)[v6 mutableCopy];

    [v7 setObject:@"normal" forKeyedSubscript:@"locking_mode"];
    v8 = [GEOSQLiteDB alloc];
    v9 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", "Persister");
    BOOL v10 = !v3;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __44__GEORequestResponsePersister_initWritable___block_invoke;
    v15[3] = &unk_1E53EA9C0;
    BOOL v17 = v3;
    v11 = v4;
    v16 = v11;
    uint64_t v12 = [(GEOSQLiteDB *)v8 initWithQueueName:"com.apple.geo.RR.Persister" log:v9 databaseFileURL:v5 sqliteFlags:v10 pragmas:v7 setupBlock:v15];
    db = v11->_db;
    v11->_db = (GEOSQLiteDB *)v12;
  }
  return v4;
}

uint64_t __44__GEORequestResponsePersister_initWritable___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend(v3, "user_version") == 2)
  {
    v4 = 0;
  }
  else if (*(unsigned char *)(a1 + 40))
  {
    v4 = "DROP TABLE logs";
  }
  else
  {
    v4 = 0;
  }
  v5 = GEOFindOrCreateLog("com.apple.Maps.RequestResponse", "Persister");
  id v6 = v3;
  id v7 = v5;
  int function_v2 = sqlite3_create_function_v2((sqlite3 *)[v6 sqliteDB], "logs_ExternalResources_Delete", 1, 1, v6, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))_logs_ExternalResources_Delete_sqlite, 0, 0, 0);
  if (function_v2)
  {
    int v9 = function_v2;
    BOOL v10 = v7;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v18 = v9;
      __int16 v19 = 2082;
      v20 = sqlite3_errmsg((sqlite3 *)[v6 sqliteDB]);
      _os_log_fault_impl(&dword_188D96000, v10, OS_LOG_TYPE_FAULT, "create fn failed %d %{public}s", buf, 0x12u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!objc_msgSend(v6, "createTable:withDrop:", "CREATE TABLE IF NOT EXISTS logs(   timestamp INT NOT NULL,    type INT NOT NULL,    appid TEXT NOT NULL,    identifier TEXT NOT NULL,    url TEXT,    size INT NOT NULL,    data TEXT NOT NULL,    errorMessage TEXT   );",
                        v4))
  {
LABEL_14:

    goto LABEL_15;
  }
  int v11 = sqlite3_exec((sqlite3 *)[v6 sqliteDB], "CREATE TRIGGER IF NOT EXISTS logs_delete_ext    AFTER DELETE ON logs    FOR EACH ROW WHEN NOT logs_ExternalResources_Delete(OLD.data)    BEGIN        SELECT RAISE(ROLLBACK, 'logs_ExternalResources_Delete returned NO, this should not happen');    END;",
          0,
          0,
          0);
  if (v11)
  {
    int v12 = v11;
    v13 = v7;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v18 = v12;
      __int16 v19 = 2082;
      v20 = sqlite3_errmsg((sqlite3 *)[v6 sqliteDB]);
      _os_log_error_impl(&dword_188D96000, v13, OS_LOG_TYPE_ERROR, "create trigger failed: %d %{public}s", buf, 0x12u);
    }
    goto LABEL_13;
  }
  if (!objc_msgSend(v6, "prepareStatement:forKey:", "INSERT INTO logs    (timestamp, type, appid, identifier, url, size, data, errorMessage)    VALUES (@timestamp, @type, @appid, @identifier, @url, @size, @data, @errorMessage);",
                        @"AddValue")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "INSERT INTO logs    (timestamp, type, appid, identifier, url, size, data, errorMessage)    VALUES (@timestamp, @type, @appid, @identifier, @url, @size, @data, @errorMessage);",
                        @"RestoreValue")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE timestamp >= @begin AND timestamp <= @end    ORDER BY timestamp, type ASC;",
                        @"FindValuesBetween")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE type = @type    ORDER BY timestamp ASC;",
                        @"FindValuesOfType")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE type == @type AND timestamp >= @begin AND timestamp <= @end    ORDER BY timestamp ASC;",
                        @"FindValuesBetweenOfType")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE url NOTNULL AND identifier = @identifier    ORDER BY timestamp ASC;",
                        @"FindRequestById")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT timestamp, type, appid, identifier, url, size, data, errorMessage    FROM logs    WHERE url ISNULL AND identifier = @identifier    ORDER BY timestamp ASC;",
                        @"FindResponseById")
    || !objc_msgSend(v6, "prepareStatement:forKey:", "SELECT SUM(size)    FROM logs;",
                        @"GetTotalSize")
    || (objc_msgSend(v6, "prepareStatement:forKey:", "DELETE FROM logs    WHERE timestamp < @timestamp;",
          @"DeleteOlderThan") & 1) == 0)
  {
    goto LABEL_14;
  }
  int v16 = objc_msgSend(v6, "prepareStatement:forKey:", "SELECT data    FROM logs;",
          @"logs_ExternalResources_Enumerate");

  if (v16)
  {
    objc_msgSend(v6, "setUser_version:", 2);
    [*(id *)(a1 + 32) _reschedulePruner];
    uint64_t v14 = 1;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v14 = 0;
LABEL_16:

  return v14;
}

- (void)dealloc
{
  pruneTimer = self->_pruneTimer;
  if (pruneTimer) {
    dispatch_source_cancel(pruneTimer);
  }
  db = self->_db;
  if (db)
  {
    v5 = [(GEOSQLiteDB *)db isolationQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__GEORequestResponsePersister_dealloc__block_invoke;
    block[3] = &unk_1E53D79D8;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  v6.receiver = self;
  v6.super_class = (Class)GEORequestResponsePersister;
  [(GEORequestResponsePersister *)&v6 dealloc];
}

uint64_t __38__GEORequestResponsePersister_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) tearDown];
}

- (BOOL)_checkDbIsWriteable:(id *)a3
{
  int v4 = [(GEOSQLiteDB *)self->_db sqliteFlags];
  unsigned int v5 = v4;
  if (a3 && (v4 & 2) == 0)
  {
    *a3 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-13 reason:@"DB was not opened in read/write mode"];
  }
  return (v5 >> 1) & 1;
}

- (void)_reschedulePruner
{
  pruneTimer = self->_pruneTimer;
  if (!pruneTimer)
  {
    objc_initWeak(&location, self);
    int v4 = [(GEOSQLiteDB *)self->_db isolationQueue];
    objc_copyWeak(&v8, &location);
    unsigned int v5 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();
    objc_super v6 = self->_pruneTimer;
    self->_pruneTimer = v5;

    dispatch_activate((dispatch_object_t)self->_pruneTimer);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    pruneTimer = self->_pruneTimer;
  }
  dispatch_time_t v7 = dispatch_time(0, 20000000000);
  dispatch_source_set_timer(pruneTimer, v7, 0xFFFFFFFFFFFFFFFFLL, 0x2540BE400uLL);
}

void __48__GEORequestResponsePersister__reschedulePruner__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _runAllPruners:0];
}

- (void)_persistEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(GEORequestResponsePersister *)self _checkDbIsWriteable:0])
  {
    if (![v4 hasTimestamp] || !objc_msgSend(v4, "timestamp")) {
      [v4 setTimestamp:(unint64_t)CFAbsoluteTimeGetCurrent()];
    }
    unsigned int v5 = [v4 data];
    db = self->_db;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__GEORequestResponsePersister__persistEvent___block_invoke;
    v14[3] = &unk_1E53D99F0;
    v14[4] = self;
    id v15 = v4;
    id v16 = v5;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__GEORequestResponsePersister__persistEvent___block_invoke_2;
    v12[3] = &unk_1E53E33C0;
    v12[4] = self;
    id v13 = v16;
    id v7 = v16;
    [(GEOSQLiteDB *)db executeAsync:v14 errorHandler:v12];
    [(GEORequestResponsePersister *)self _reschedulePruner];
  }
  else
  {
    id v8 = externalFileBaseURL(self->_db);
    int v9 = [MEMORY[0x1E4F29128] UUID];
    BOOL v10 = [v9 UUIDString];
    id v7 = [v8 URLByAppendingPathComponent:v10];

    int v11 = [(GEOSQLiteDB *)self->_db log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_error_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Failed to write log entry to \"%@\": db is not writable", buf, 0xCu);
    }
  }
}

void __45__GEORequestResponsePersister__persistEvent___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v22 = [*(id *)(a1 + 40) timestamp];
  int v3 = [*(id *)(a1 + 40) requestType];
  id v4 = [*(id *)(a1 + 40) appId];
  unsigned int v5 = [*(id *)(a1 + 40) eventId];
  objc_super v6 = [*(id *)(a1 + 40) url];
  uint64_t v7 = [*(id *)(a1 + 48) length];
  id v8 = *(void **)(a1 + 48);
  int v9 = [*(id *)(a1 + 40) error];
  id v10 = v2;
  id v11 = v4;
  id v12 = v5;
  id v13 = v6;
  id v14 = v8;
  id v15 = v9;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__78;
  v34[4] = __Block_byref_object_dispose__78;
  id v35 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __AddValue_block_invoke_0;
  v23[3] = &unk_1E53EAAD8;
  id v16 = v10;
  v30 = v34;
  uint64_t v31 = v22;
  id v24 = v16;
  int v33 = v3;
  id v17 = v11;
  id v25 = v17;
  id v18 = v12;
  id v26 = v18;
  id v19 = v13;
  id v27 = v19;
  uint64_t v32 = v7;
  id v20 = v14;
  id v28 = v20;
  id v21 = v15;
  id v29 = v21;
  [v16 executeStatement:@"AddValue" statementBlock:v23];

  _Block_object_dispose(v34, 8);
}

void __45__GEORequestResponsePersister__persistEvent___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = externalFileBaseURL(*(void **)(*(void *)(a1 + 32) + 8));
  int v3 = [MEMORY[0x1E4F29128] UUID];
  id v4 = [v3 UUIDString];
  unsigned int v5 = [v2 URLByAppendingPathComponent:v4];

  if (v5)
  {
    objc_super v6 = *(void **)(a1 + 40);
    id v10 = 0;
    char v7 = [v6 writeToURL:v5 options:0 error:&v10];
    id v8 = v10;
    if ((v7 & 1) == 0)
    {
      int v9 = [*(id *)(*(void *)(a1 + 32) + 8) log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v12 = v5;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_error_impl(&dword_188D96000, v9, OS_LOG_TYPE_ERROR, "Failed to write log entry to \"%@\": %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }
}

- (void)persistRequestTask:(id)a3 url:(id)a4 request:(id)a5
{
  id v22 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_alloc_init(GEORRRequestResponseEvent);
  id v11 = getMetrics(v22);
  id v12 = v11;
  if (v11)
  {
    __int16 v13 = [v11 fetchStartDate];
    [v13 timeIntervalSinceReferenceDate];
    [(GEORRRequestResponseEvent *)v10 setTimestamp:(unint64_t)v14];
  }
  uint64_t v15 = [v22 dataTask];
  id v16 = [v15 requestCounterTicket];
  uint64_t v17 = [v16 appId];
  id v18 = (void *)v17;
  if (v17) {
    id v19 = (__CFString *)v17;
  }
  else {
    id v19 = @"<unknown>";
  }
  [(GEORRRequestResponseEvent *)v10 setAppId:v19];

  [(GEORRRequestResponseEvent *)v10 setEventType:1];
  -[GEORRRequestResponseEvent setRequestType:](v10, "setRequestType:", [v22 requestTypeCode]);
  id v20 = [v9 absoluteString];

  [(GEORRRequestResponseEvent *)v10 setUrl:v20];
  id v21 = eventId(v22);
  [(GEORRRequestResponseEvent *)v10 setEventId:v21];

  [(GEORRRequestResponseEvent *)v10 setEncoded:v8];
  [(GEORequestResponsePersister *)self _persistEvent:v10];
}

- (void)persistResponseTask:(id)a3 response:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  char v7 = objc_alloc_init(GEORRRequestResponseEvent);
  id v8 = getMetrics(v18);
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 responseEndDate];
    [v10 timeIntervalSinceReferenceDate];
    [(GEORRRequestResponseEvent *)v7 setTimestamp:(unint64_t)v11];
  }
  id v12 = [v18 dataTask];
  __int16 v13 = [v12 requestCounterTicket];
  uint64_t v14 = [v13 appId];
  uint64_t v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = @"<unknown>";
  }
  [(GEORRRequestResponseEvent *)v7 setAppId:v16];

  [(GEORRRequestResponseEvent *)v7 setEventType:2];
  -[GEORRRequestResponseEvent setRequestType:](v7, "setRequestType:", [v18 requestTypeCode]);
  uint64_t v17 = eventId(v18);
  [(GEORRRequestResponseEvent *)v7 setEventId:v17];

  [(GEORRRequestResponseEvent *)v7 setEncoded:v6];
  [(GEORequestResponsePersister *)self _persistEvent:v7];
}

- (void)persistResponseTask:(id)a3 error:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  char v7 = objc_alloc_init(GEORRRequestResponseEvent);
  id v8 = getMetrics(v19);
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 responseEndDate];
    [v10 timeIntervalSinceReferenceDate];
    [(GEORRRequestResponseEvent *)v7 setTimestamp:(unint64_t)v11];
  }
  id v12 = [v19 dataTask];
  __int16 v13 = [v12 requestCounterTicket];
  uint64_t v14 = [v13 appId];
  uint64_t v15 = (void *)v14;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  else {
    id v16 = @"<unknown>";
  }
  [(GEORRRequestResponseEvent *)v7 setAppId:v16];

  [(GEORRRequestResponseEvent *)v7 setEventType:2];
  -[GEORRRequestResponseEvent setRequestType:](v7, "setRequestType:", [v19 requestTypeCode]);
  uint64_t v17 = eventId(v19);
  [(GEORRRequestResponseEvent *)v7 setEventId:v17];

  id v18 = [v6 debugDescription];

  [(GEORRRequestResponseEvent *)v7 setError:v18];
  [(GEORequestResponsePersister *)self _persistEvent:v7];
}

- (void)persistResponseTaskCanceled:(id)a3
{
  id v15 = a3;
  id v4 = objc_alloc_init(GEORRRequestResponseEvent);
  unsigned int v5 = getMetrics(v15);
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 responseEndDate];
    [v7 timeIntervalSinceReferenceDate];
    [(GEORRRequestResponseEvent *)v4 setTimestamp:(unint64_t)v8];
  }
  id v9 = [v15 dataTask];
  id v10 = [v9 requestCounterTicket];
  uint64_t v11 = [v10 appId];
  id v12 = (void *)v11;
  if (v11) {
    __int16 v13 = (__CFString *)v11;
  }
  else {
    __int16 v13 = @"<unknown>";
  }
  [(GEORRRequestResponseEvent *)v4 setAppId:v13];

  [(GEORRRequestResponseEvent *)v4 setEventType:2];
  -[GEORRRequestResponseEvent setRequestType:](v4, "setRequestType:", [v15 requestTypeCode]);
  uint64_t v14 = eventId(v15);
  [(GEORRRequestResponseEvent *)v4 setEventId:v14];

  [(GEORRRequestResponseEvent *)v4 setError:@"Canceled"];
  [(GEORequestResponsePersister *)self _persistEvent:v4];
}

- (id)enumerateAllEntriesWithBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__78;
  id v16 = __Block_byref_object_dispose__78;
  id v17 = 0;
  db = self->_db;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__GEORequestResponsePersister_enumerateAllEntriesWithBlock___block_invoke;
  v9[3] = &unk_1E53EA9E8;
  v9[4] = self;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [(GEOSQLiteDB *)db executeSync:v9];
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __60__GEORequestResponsePersister_enumerateAllEntriesWithBlock___block_invoke(void *a1)
{
  uint64_t v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = +[GEORequestResponsePersistedEvent enumeratorBlockHelper:v1];
  FindValuesBetween(v2, &obj, 0, 0x7FFFFFFFFFFFFFFFLL, v4);
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (id)enumerateEntriesInRange:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__78;
  id v21 = __Block_byref_object_dispose__78;
  id v22 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__GEORequestResponsePersister_enumerateEntriesInRange_withBlock___block_invoke;
  v13[3] = &unk_1E53EAA10;
  v13[4] = self;
  id v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [(GEOSQLiteDB *)db executeSync:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __65__GEORequestResponsePersister_enumerateEntriesInRange_withBlock___block_invoke(void *a1)
{
  id v4 = (void *)a1[5];
  unsigned int v5 = *(void **)(a1[4] + 8);
  uint64_t v6 = *(void *)(a1[7] + 8);
  double v8 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  id obj = v8;
  if (v4)
  {
    uint64_t v1 = [v4 startDate];
    [v1 timeIntervalSinceReferenceDate];
    uint64_t v10 = (uint64_t)v9;
    id v11 = (void *)a1[5];
    if (v11)
    {
      v2 = [v11 endDate];
      [v2 timeIntervalSinceReferenceDate];
      char v12 = 0;
      uint64_t v14 = (uint64_t)v13;
    }
    else
    {
      uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      char v12 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    char v12 = 1;
  }
  id v15 = +[GEORequestResponsePersistedEvent enumeratorBlockHelper:a1[6]];
  FindValuesBetween(v5, &obj, v10, v14, v15);
  objc_storeStrong(v7, obj);

  if ((v12 & 1) == 0) {
  if (v4)
  }
}

- (id)enumerateEntriesOfType:(int)a3 withBlock:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__78;
  uint64_t v19 = __Block_byref_object_dispose__78;
  id v20 = 0;
  db = self->_db;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__GEORequestResponsePersister_enumerateEntriesOfType_withBlock___block_invoke;
  v11[3] = &unk_1E53EAA38;
  v11[4] = self;
  double v13 = &v15;
  int v14 = a3;
  id v8 = v6;
  id v12 = v8;
  [(GEOSQLiteDB *)db executeSync:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

void __64__GEORequestResponsePersister_enumerateEntriesOfType_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  unsigned int v5 = *(void **)(v2 + 40);
  uint64_t v3 = (id *)(v2 + 40);
  id v4 = v5;
  int v6 = *(_DWORD *)(a1 + 56);
  id v7 = +[GEORequestResponsePersistedEvent enumeratorBlockHelper:*(void *)(a1 + 40)];
  id v8 = v1;
  id v9 = v7;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__78;
  id v22 = __Block_byref_object_dispose__78;
  id v23 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __FindValuesOfType_block_invoke;
  v13[3] = &unk_1E53D9DA8;
  id v10 = v8;
  int v17 = v6;
  id v14 = v10;
  id v16 = &v18;
  id v11 = v9;
  id v15 = v11;
  [v10 statementForKey:@"FindValuesOfType" statementBlock:v13];
  id v12 = (void *)v19[5];
  if (v12) {
    id v4 = v12;
  }

  _Block_object_dispose(&v18, 8);
  objc_storeStrong(v3, v4);
}

- (id)enumerateEntriesOfType:(int)a3 inRange:(id)a4 withBlock:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__78;
  id v24 = __Block_byref_object_dispose__78;
  id v25 = 0;
  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__GEORequestResponsePersister_enumerateEntriesOfType_inRange_withBlock___block_invoke;
  v15[3] = &unk_1E53EAA60;
  void v15[4] = self;
  uint64_t v18 = &v20;
  int v19 = a3;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  [(GEOSQLiteDB *)db executeSync:v15];
  id v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v13;
}

void __72__GEORequestResponsePersister_enumerateEntriesOfType_inRange_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v7 = *(void **)(v4 + 40);
  unsigned int v5 = (id *)(v4 + 40);
  id v6 = v7;
  int v8 = *(_DWORD *)(a1 + 64);
  if (v2)
  {
    id v21 = [*(id *)(a1 + 40) startDate];
    [v21 timeIntervalSinceReferenceDate];
    uint64_t v10 = (uint64_t)v9;
    id v11 = *(void **)(a1 + 40);
    if (v11)
    {
      uint64_t v20 = [v11 endDate];
      [v20 timeIntervalSinceReferenceDate];
      char v22 = 0;
      uint64_t v13 = (uint64_t)v12;
    }
    else
    {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      char v22 = 1;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    char v22 = 1;
  }
  id v14 = +[GEORequestResponsePersistedEvent enumeratorBlockHelper:*(void *)(a1 + 48)];
  id v15 = v3;
  id v16 = v14;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  int v33 = __Block_byref_object_copy__78;
  v34 = __Block_byref_object_dispose__78;
  id v35 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __FindValuesBetweenOfType_block_invoke;
  v23[3] = &unk_1E53D9EC0;
  id v17 = v15;
  int v29 = v8;
  id v24 = v17;
  id v26 = &v30;
  uint64_t v27 = v10;
  uint64_t v28 = v13;
  id v18 = v16;
  id v25 = v18;
  [v17 statementForKey:@"FindValuesBetweenOfType" statementBlock:v23];
  int v19 = (void *)v31[5];
  if (v19) {
    id v6 = v19;
  }

  _Block_object_dispose(&v30, 8);
  objc_storeStrong(v5, v6);

  if ((v22 & 1) == 0) {
  if (v2)
  }
}

- (id)findRequest:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__78;
  id v21 = __Block_byref_object_dispose__78;
  id v22 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__GEORequestResponsePersister_findRequest_withBlock___block_invoke;
  v13[3] = &unk_1E53EAA10;
  void v13[4] = self;
  id v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [(GEOSQLiteDB *)db executeSync:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __53__GEORequestResponsePersister_findRequest_withBlock___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[5];
  uint64_t v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v6 = *(void **)(v3 + 40);
  uint64_t v4 = (id *)(v3 + 40);
  id v5 = v6;
  id v7 = +[GEORequestResponsePersistedEvent enumeratorBlockHelper:a1[6]];
  id v8 = v2;
  id v9 = v1;
  id v10 = v7;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__78;
  id v24 = __Block_byref_object_dispose__78;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __FindRequestById_block_invoke;
  v15[3] = &unk_1E53D9D08;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  uint64_t v19 = &v20;
  id v13 = v10;
  id v18 = v13;
  [v11 statementForKey:@"FindRequestById" statementBlock:v15];
  id v14 = (void *)v21[5];
  if (v14) {
    id v5 = v14;
  }

  _Block_object_dispose(&v20, 8);
  objc_storeStrong(v4, v5);
}

- (id)findResponse:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__78;
  id v21 = __Block_byref_object_dispose__78;
  id v22 = 0;
  db = self->_db;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__GEORequestResponsePersister_findResponse_withBlock___block_invoke;
  v13[3] = &unk_1E53EAA10;
  void v13[4] = self;
  id v16 = &v17;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  [(GEOSQLiteDB *)db executeSync:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__GEORequestResponsePersister_findResponse_withBlock___block_invoke(void *a1)
{
  uint64_t v1 = (void *)a1[5];
  uint64_t v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v6 = *(void **)(v3 + 40);
  uint64_t v4 = (id *)(v3 + 40);
  id v5 = v6;
  id v7 = +[GEORequestResponsePersistedEvent enumeratorBlockHelper:a1[6]];
  id v8 = v2;
  id v9 = v1;
  id v10 = v7;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__78;
  id v24 = __Block_byref_object_dispose__78;
  id v25 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __FindResponseById_block_invoke;
  v15[3] = &unk_1E53D9D08;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  uint64_t v19 = &v20;
  id v13 = v10;
  id v18 = v13;
  [v11 statementForKey:@"FindResponseById" statementBlock:v15];
  id v14 = (void *)v21[5];
  if (v14) {
    id v5 = v14;
  }

  _Block_object_dispose(&v20, 8);
  objc_storeStrong(v4, v5);
}

- (unint64_t)getTotalSize:(id *)a3
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__78;
  id v16 = __Block_byref_object_dispose__78;
  id v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  db = self->_db;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__GEORequestResponsePersister_getTotalSize___block_invoke;
  v7[3] = &unk_1E53D89E8;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = &v12;
  [(GEOSQLiteDB *)db executeSync:v7];
  if (a3) {
    *a3 = (id) v13[5];
  }
  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __44__GEORequestResponsePersister_getTotalSize___block_invoke(void *a1)
{
  uint64_t v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  uint64_t TotalSize = GetTotalSize(v2, &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(void *)(*(void *)(a1[5] + 8) + 24) = TotalSize;
}

- (BOOL)runAllPruners:(id *)a3
{
  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:")) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__78;
  id v13 = __Block_byref_object_dispose__78;
  id v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__GEORequestResponsePersister_runAllPruners___block_invoke;
  v8[3] = &unk_1E53D7C00;
  v8[4] = self;
  v8[5] = &v9;
  [(GEOSQLiteDB *)db executeSync:v8];
  if (a3) {
    *a3 = (id) v10[5];
  }
  BOOL v6 = v10[5] != 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __45__GEORequestResponsePersister_runAllPruners___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  [v1 _runAllPruners:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (BOOL)_runAllPruners:(id *)a3
{
  BOOL v5 = -[GEORequestResponsePersister _pruneDBToDefaultAge:](self, "_pruneDBToDefaultAge:");
  return v5 & [(GEORequestResponsePersister *)self _pruneDBToDefaultSize:a3];
}

- (BOOL)pruneEntriesOlderThan:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(GEORequestResponsePersister *)self _checkDbIsWriteable:a4])
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x3032000000;
    id v16 = __Block_byref_object_copy__78;
    id v17 = __Block_byref_object_dispose__78;
    id v18 = 0;
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__GEORequestResponsePersister_pruneEntriesOlderThan_error___block_invoke;
    v10[3] = &unk_1E53D7BD8;
    v10[4] = self;
    id v11 = v6;
    uint64_t v12 = &v13;
    [(GEOSQLiteDB *)db executeSync:v10];
    if (a4) {
      *a4 = (id) v14[5];
    }
    BOOL v8 = v14[5] != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

void __59__GEORequestResponsePersister_pruneEntriesOlderThan_error___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v1 = a1[5];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _pruneEntriesOlderThan:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)pruneDBToDefaultAge:(id *)a3
{
  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:")) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__78;
  uint64_t v13 = __Block_byref_object_dispose__78;
  id v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__GEORequestResponsePersister_pruneDBToDefaultAge___block_invoke;
  v8[3] = &unk_1E53D7C00;
  v8[4] = self;
  v8[5] = &v9;
  [(GEOSQLiteDB *)db executeSync:v8];
  if (a3) {
    *a3 = (id) v10[5];
  }
  BOOL v6 = v10[5] != 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __51__GEORequestResponsePersister_pruneDBToDefaultAge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  [v1 _pruneDBToDefaultAge:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (BOOL)_pruneDBToDefaultAge:(id *)a3
{
  BOOL v5 = [MEMORY[0x1E4F1C9C8] now];
  BOOL v6 = objc_msgSend(v5, "dateByAddingTimeInterval:", -GEOConfigGetDouble(GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitAge, (uint64_t)off_1E9113EF8));

  LOBYTE(a3) = [(GEORequestResponsePersister *)self _pruneEntriesOlderThan:v6 error:a3];
  return (char)a3;
}

- (BOOL)_pruneEntriesOlderThan:(id)a3 error:(id *)a4
{
  db = self->_db;
  [a3 timeIntervalSinceReferenceDate];

  return DeleteOlderThan(db, a4, (uint64_t)v6);
}

- (BOOL)pruneDBToDefaultSize:(id *)a3
{
  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:")) {
    return 0;
  }
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__78;
  uint64_t v13 = __Block_byref_object_dispose__78;
  id v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__GEORequestResponsePersister_pruneDBToDefaultSize___block_invoke;
  v8[3] = &unk_1E53D7C00;
  v8[4] = self;
  v8[5] = &v9;
  [(GEOSQLiteDB *)db executeSync:v8];
  if (a3) {
    *a3 = (id) v10[5];
  }
  BOOL v6 = v10[5] != 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __52__GEORequestResponsePersister_pruneDBToDefaultSize___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v2 + 40);
  [v1 _pruneDBToDefaultSize:&obj];
  objc_storeStrong((id *)(v2 + 40), obj);
}

- (BOOL)_pruneDBToDefaultSize:(id *)a3
{
  uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_MapsRequestResponseLoggingPersistedLimitBytes, (uint64_t)off_1E9113EE8);

  return [(GEORequestResponsePersister *)self _pruneDBToSize:UInteger error:a3];
}

- (BOOL)pruneDBToSize:(unint64_t)a3 error:(id *)a4
{
  if (![(GEORequestResponsePersister *)self _checkDbIsWriteable:a4]) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__78;
  uint64_t v15 = __Block_byref_object_dispose__78;
  id v16 = 0;
  db = self->_db;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__GEORequestResponsePersister_pruneDBToSize_error___block_invoke;
  v10[3] = &unk_1E53DA520;
  void v10[5] = &v11;
  v10[6] = a3;
  v10[4] = self;
  [(GEOSQLiteDB *)db executeSync:v10];
  if (a4) {
    *a4 = (id) v12[5];
  }
  BOOL v8 = v12[5] != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __51__GEORequestResponsePersister_pruneDBToSize_error___block_invoke(void *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _pruneDBToSize:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)_pruneDBToSize:(unint64_t)a3 error:(id *)a4
{
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t TotalSize = 0;
  uint64_t TotalSize = GetTotalSize(self->_db, a4);
  if (v16[3] >= a3)
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x2020000000;
    uint64_t v14 = 0;
    db = self->_db;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__GEORequestResponsePersister__pruneDBToSize_error___block_invoke;
    v10[3] = &unk_1E53EAA88;
    v10[4] = &v11;
    void v10[5] = &v15;
    v10[6] = a3;
    FindValuesBetween(db, a4, 0, 0x7FFFFFFFFFFFFFFFLL, v10);
    uint64_t v8 = v12[3];
    if (v8 >= 1) {
      DeleteOlderThan(self->_db, a4, v8);
    }
    _Block_object_dispose(&v11, 8);
  }
  _Block_object_dispose(&v15, 8);
  return 1;
}

BOOL __52__GEORequestResponsePersister__pruneDBToSize_error___block_invoke(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *(void *)(*(void *)(a1[4] + 8) + 24) = a2;
  unint64_t v7 = a1[6];
  uint64_t v8 = *(void *)(a1[5] + 8);
  unint64_t v9 = *(void *)(v8 + 24);
  if (v9 >= v7) {
    *(void *)(v8 + 24) = v9 - a7;
  }
  return v9 >= v7;
}

- (unsigned)restoreOrphanedEntries:(id *)a3
{
  if (!-[GEORequestResponsePersister _checkDbIsWriteable:](self, "_checkDbIsWriteable:")) {
    return 0;
  }
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__78;
  uint64_t v13 = __Block_byref_object_dispose__78;
  id v14 = 0;
  db = self->_db;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__GEORequestResponsePersister_restoreOrphanedEntries___block_invoke;
  v8[3] = &unk_1E53D89E8;
  v8[4] = self;
  v8[5] = &v15;
  void v8[6] = &v9;
  [(GEOSQLiteDB *)db executeSync:v8];
  if (a3) {
    *a3 = (id) v10[5];
  }
  unsigned int v6 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __54__GEORequestResponsePersister_restoreOrphanedEntries___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  int v4 = [v2 _restoreOrphanedEntries:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_DWORD *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (unsigned)_restoreOrphanedEntries:(id *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  v50 = externalFileBaseURL(self->_db);
  if (v50)
  {
    int v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v41 = [v4 enumeratorAtURL:v50 includingPropertiesForKeys:0 options:21 errorHandler:0];

    if (v41)
    {
      v54 = [MEMORY[0x1E4F1CA48] array];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v5 = v41;
      uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v72 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v62;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v62 != v7) {
              objc_enumerationMutation(v5);
            }
            uint64_t v9 = [*(id *)(*((void *)&v61 + 1) + 8 * i) lastPathComponent];
            [v54 addObject:v9];
          }
          uint64_t v6 = [v5 countByEnumeratingWithState:&v61 objects:v72 count:16];
        }
        while (v6);
      }

      if ([v54 count])
      {
        db = self->_db;
        v59[0] = MEMORY[0x1E4F143A8];
        v59[1] = 3221225472;
        v59[2] = __55__GEORequestResponsePersister__restoreOrphanedEntries___block_invoke;
        v59[3] = &unk_1E53EAAB0;
        id v11 = v54;
        id v60 = v11;
        uint64_t v12 = db;
        uint64_t v13 = v59;
        uint64_t v65 = 0;
        v66 = &v65;
        uint64_t v67 = 0x3032000000;
        v68 = __Block_byref_object_copy__78;
        v69 = __Block_byref_object_dispose__78;
        id v70 = 0;
        *(void *)&long long buf = MEMORY[0x1E4F143A8];
        *((void *)&buf + 1) = 3221225472;
        v74 = __logs_ExternalResources_Enumerate_block_invoke;
        v75 = &unk_1E53D7C78;
        id v14 = v12;
        v76 = v14;
        uint64_t v15 = v13;
        id v77 = v15;
        v78 = &v65;
        BOOL v16 = [(GEOSQLiteDB *)v14 statementForKey:@"logs_ExternalResources_Enumerate" statementBlock:&buf];
        if (a3)
        {
          uint64_t v17 = (void *)v66[5];
          if (v17) {
            *a3 = v17;
          }
        }

        _Block_object_dispose(&v65, 8);
        if (v16 && [v11 count])
        {
          int v18 = [(GEOSQLiteDB *)self->_db log];
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = [v11 count];
            LODWORD(buf) = 134349056;
            *(void *)((char *)&buf + 4) = v19;
            _os_log_impl(&dword_188D96000, v18, OS_LOG_TYPE_INFO, "Restoring %{public}llu files which were no longer referenced by the database", (uint8_t *)&buf, 0xCu);
          }

          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id obj = v11;
          uint64_t v51 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
          if (v51)
          {
            unsigned int v42 = 0;
            uint64_t v49 = *(void *)v56;
LABEL_20:
            uint64_t v20 = 0;
            while (1)
            {
              if (*(void *)v56 != v49) {
                objc_enumerationMutation(obj);
              }
              id v21 = [v50 URLByAppendingPathComponent:*(void *)(*((void *)&v55 + 1) + 8 * v20)];
              if (!v21) {
                goto LABEL_35;
              }
              uint64_t v22 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v21 options:0 error:0];
              if (![v22 length]) {
                goto LABEL_29;
              }
              id v23 = [[GEORRRequestResponseEvent alloc] initWithData:v22];
              id v24 = v23;
              if (!v23) {
                break;
              }
              id v25 = self->_db;
              uint64_t v48 = [(GEORRRequestResponseEvent *)v23 timestamp];
              int v47 = [(GEORRRequestResponseEvent *)v24 requestType];
              id v26 = [(GEORRRequestResponseEvent *)v24 appId];
              uint64_t v27 = [(GEORRRequestResponseEvent *)v24 eventId];
              uint64_t v28 = [(GEORRRequestResponseEvent *)v24 url];
              v52 = [(GEORRRequestResponseEvent *)v24 data];
              uint64_t v29 = [v52 length];
              uint64_t v30 = [(GEORRRequestResponseEvent *)v24 error];
              uint64_t v31 = v25;
              id v32 = v26;
              id v33 = v27;
              id v44 = v28;
              id v45 = v21;
              id v46 = v30;
              uint64_t v65 = 0;
              v66 = &v65;
              uint64_t v67 = 0x3032000000;
              v68 = __Block_byref_object_copy__78;
              v69 = __Block_byref_object_dispose__78;
              id v70 = 0;
              *(void *)&long long buf = MEMORY[0x1E4F143A8];
              *((void *)&buf + 1) = 3221225472;
              v74 = __RestoreValue_block_invoke;
              v75 = &unk_1E53EAAD8;
              v34 = v31;
              v82 = &v65;
              uint64_t v83 = v48;
              v76 = v34;
              int v85 = v47;
              id v35 = v32;
              id v77 = v35;
              v36 = (uint64_t *)v33;
              v78 = v36;
              id v37 = v44;
              id v79 = v37;
              uint64_t v84 = v29;
              id v38 = v45;
              id v80 = v38;
              id v39 = v46;
              id v81 = v39;
              LOBYTE(v48) = [(GEOSQLiteDB *)v34 executeStatement:@"RestoreValue" statementBlock:&buf];

              _Block_object_dispose(&v65, 8);
              if ((v48 & 1) == 0) {
                break;
              }

              ++v42;
LABEL_30:

              if (v51 == ++v20)
              {
                uint64_t v51 = [obj countByEnumeratingWithState:&v55 objects:v71 count:16];
                if (v51) {
                  goto LABEL_20;
                }
                goto LABEL_36;
              }
            }

LABEL_29:
            [(GEOSQLiteDB *)self->_db deleteExternalResourceAtURL:v21 error:0];
            goto LABEL_30;
          }
LABEL_35:
          unsigned int v42 = 0;
LABEL_36:
        }
        else
        {
          unsigned int v42 = 0;
        }
      }
      else
      {
        unsigned int v42 = 0;
      }
    }
    else
    {
      unsigned int v42 = 0;
    }
  }
  else
  {
    unsigned int v42 = 0;
  }

  return v42;
}

uint64_t __55__GEORequestResponsePersister__restoreOrphanedEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [a2 lastPathComponent];
  [v2 removeObject:v3];

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pruneTimer, 0);

  objc_storeStrong((id *)&self->_db, 0);
}

@end