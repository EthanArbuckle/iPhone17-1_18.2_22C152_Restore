@interface EDDiagnosticInfoGatherer
+ (OS_os_log)log;
- (BOOL)_compressDatabaseAtURL:(id)a3 intoDirectoryURL:(id)a4;
- (BOOL)_compressDirectoryAtURL:(id)a3 intoArchiveWithURL:(id)a4;
- (BOOL)_copyDatabaseFromURL:(id)a3 intoDatabaseAtURL:(id)a4;
- (BOOL)_copyFromDatabase:(sqlite3 *)a3 intoDatabase:(sqlite3 *)a4;
- (EDDiagnosticInfoGatherer)initWithFetchController:(id)a3 remoteClientsProvider:(id)a4 persistence:(id)a5;
- (EDFetchController)fetchController;
- (EDPersistence)persistence;
- (EDServerRemoteClientsProvider)remoteClientsProvider;
- (EFScheduler)gathererQueue;
- (EMDiagnosticInfoProvidingXPC)diagnosticInfoProvider;
- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(id)a3;
- (void)_createDiagnosticsJSONForMessagesWithObjectIDs:(id)a3 directoryURL:(id)a4;
- (void)_downloadMessagesWithObjectIDs:(id)a3 directoryURL:(id)a4 completionPromise:(id)a5;
- (void)databaseStatisticsWithCompletionHandler:(id)a3;
- (void)fetchControllerStatusWithCompletionHandler:(id)a3;
- (void)gatherDiagnosticsWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)registerDiagnosticInfoProvider:(id)a3 completionHandler:(id)a4;
- (void)searchableIndexDatabaseStatisticsWithCompletionHandler:(id)a3;
- (void)setDiagnosticInfoProvider:(id)a3;
- (void)setGathererQueue:(id)a3;
- (void)setPersistence:(id)a3;
- (void)setRemoteClientsProvider:(id)a3;
@end

@implementation EDDiagnosticInfoGatherer

- (EDDiagnosticInfoGatherer)initWithFetchController:(id)a3 remoteClientsProvider:(id)a4 persistence:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EDDiagnosticInfoGatherer;
  v12 = [(EDDiagnosticInfoGatherer *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fetchController, a3);
    objc_storeStrong((id *)&v13->_remoteClientsProvider, a4);
    objc_storeStrong((id *)&v13->_persistence, a5);
    uint64_t v14 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.daemon.EDDiagnosticInfoGatherer" qualityOfService:25];
    gathererQueue = v13->_gathererQueue;
    v13->_gathererQueue = (EFScheduler *)v14;
  }
  return v13;
}

- (void)registerDiagnosticInfoProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (void (**)(id, id))a4;
  objc_storeStrong((id *)&self->_diagnosticInfoProvider, a3);
  id v9 = objc_alloc_init(MEMORY[0x1E4F60D40]);
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __77__EDDiagnosticInfoGatherer_registerDiagnosticInfoProvider_completionHandler___block_invoke;
  uint64_t v14 = &unk_1E6C00E78;
  objc_copyWeak(&v15, &location);
  [v9 addCancelationBlock:&v11];
  id v10 = +[EDDiagnosticInfoGatherer log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v18 = v7;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Registered EMDiagnosticInfoProviding: <%p>", buf, 0xCu);
  }

  v8[2](v8, v9);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__EDDiagnosticInfoGatherer_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_32 != -1) {
    dispatch_once(&log_onceToken_32, block);
  }
  v2 = (void *)log_log_32;

  return (OS_os_log *)v2;
}

void __31__EDDiagnosticInfoGatherer_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_32;
  log_log_32 = (uint64_t)v1;
}

void __77__EDDiagnosticInfoGatherer_registerDiagnosticInfoProvider_completionHandler___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    id v3 = WeakRetained;

    WeakRetained = v3;
  }
}

- (void)fetchControllerStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = [(EDDiagnosticInfoGatherer *)self gathererQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__EDDiagnosticInfoGatherer_fetchControllerStatusWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __71__EDDiagnosticInfoGatherer_fetchControllerStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) fetchController];
  id v3 = [v2 diagnosticInformation];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)gatherDiagnosticsWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[EDDiagnosticInfoGatherer log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v29 = a3;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Gathering diagnostics with options: %lx...", buf, 0xCu);
  }

  id v8 = (void *)MEMORY[0x1E4F1CB10];
  id v9 = NSTemporaryDirectory();
  id v10 = [v8 fileURLWithPath:v9 isDirectory:1];
  uint64_t v11 = [v10 URLByAppendingPathComponent:@"DiagnosticLogs"];

  uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v27 = 0;
  char v13 = [v12 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&v27];
  id v14 = v27;

  if ((v13 & 1) == 0)
  {
    id v15 = +[EDDiagnosticInfoGatherer log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [v11 path];
      [(EDDiagnosticInfoGatherer *)v16 gatherDiagnosticsWithOptions:buf completionHandler:v15];
    }
  }
  objc_super v17 = (void *)[objc_alloc(MEMORY[0x1E4F60F20]) initWithFileURL:v11 readOnly:0];
  id v18 = [(EDDiagnosticInfoGatherer *)self gathererQueue];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke;
  v22[3] = &unk_1E6C00EE8;
  v22[4] = self;
  id v19 = v17;
  id v23 = v19;
  unint64_t v26 = a3;
  id v20 = v11;
  id v24 = v20;
  id v21 = v6;
  id v25 = v21;
  [v18 performBlock:v22];
}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v18 = [MEMORY[0x1E4F1CA48] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v2 = [*(id *)(a1 + 32) remoteClientsProvider];
  id v3 = [v2 remoteClients];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v8 = [v7 diagnosticInfoGatherer];
        id v9 = [v8 diagnosticInfoProvider];

        if (v9)
        {
          id v10 = [v7 clientResumer];

          if (v10)
          {
            uint64_t v11 = [v7 clientResumer];
            [v11 resumeForUpdates];
          }
          uint64_t v12 = [MEMORY[0x1E4F60E18] promise];
          uint64_t v13 = *(void *)(a1 + 64);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_2;
          v22[3] = &unk_1E6C00EA0;
          uint64_t v14 = *(void *)(a1 + 40);
          v22[4] = *(void *)(a1 + 32);
          id v23 = *(id *)(a1 + 48);
          id v15 = v12;
          id v24 = v15;
          [v9 provideDiagnosticsAt:v14 options:v13 completion:v22];
          v16 = [v15 future];
          [v18 addObject:v16];
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v4);
  }

  objc_super v17 = [MEMORY[0x1E4F60D70] combine:v18];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_3;
  v19[3] = &unk_1E6C007D8;
  id v21 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 40);
  [v17 always:v19];
  [v17 addFailureBlock:&__block_literal_global_20];
}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  [*(id *)(a1 + 32) _copySearchIndexerDatabaseIntoDirectoryURL:*(void *)(a1 + 40)];
  if ([v8 count])
  {
    [*(id *)(a1 + 32) _downloadMessagesWithObjectIDs:v8 directoryURL:*(void *)(a1 + 40) completionPromise:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _createDiagnosticsJSONForMessagesWithObjectIDs:v8 directoryURL:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = *(void **)(a1 + 48);
    id v7 = [MEMORY[0x1E4F1CA98] null];
    [v6 finishWithResult:v7 error:v5];
  }
}

uint64_t __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[EDDiagnosticInfoGatherer log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_4_cold_1((uint64_t)v2, v3);
  }
}

- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v6 = [v5 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:0 error:0];
  id v7 = [v6 URLByAppendingPathComponent:@"Mail"];
  id v8 = [v7 URLByAppendingPathComponent:@"SearchIndexer"];
  id v9 = [v8 URLByAppendingPathComponent:@"database"];

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [v10 temporaryDirectory];
  uint64_t v12 = NSString;
  uint64_t v13 = arc4random();
  uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", @"%08x%08x", v13, arc4random());
  id v15 = [v11 URLByAppendingPathComponent:v14];

  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v16 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:0];

  objc_super v17 = [v15 URLByAppendingPathComponent:@"SearchIndexer-database" isDirectory:0];
  if ([(EDDiagnosticInfoGatherer *)self _copyDatabaseFromURL:v9 intoDatabaseAtURL:v17])
  {
    if ([(EDDiagnosticInfoGatherer *)self _compressDatabaseAtURL:v17 intoDirectoryURL:v4])
    {
      id v18 = +[EDDiagnosticInfoGatherer log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "Added Search Indexer database.", buf, 2u);
      }
    }
    else
    {
      id v18 = +[EDDiagnosticInfoGatherer log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[EDDiagnosticInfoGatherer _copySearchIndexerDatabaseIntoDirectoryURL:](v18);
      }
    }
  }
  else
  {
    id v18 = +[EDDiagnosticInfoGatherer log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[EDDiagnosticInfoGatherer _copySearchIndexerDatabaseIntoDirectoryURL:](v18);
    }
  }

  id v19 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v19 removeItemAtURL:v15 error:0];
}

- (BOOL)_compressDatabaseAtURL:(id)a3 intoDirectoryURL:(id)a4
{
  id v6 = a3;
  id v21 = a4;
  id v20 = [v6 lastPathComponent];
  id v7 = [v6 URLByDeletingLastPathComponent];
  id v8 = [v20 stringByAppendingString:@".aar"];
  id v9 = [v21 URLByAppendingPathComponent:v8 isDirectory:0];
  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v11 = [v10 temporaryDirectory];
  uint64_t v12 = NSString;
  uint64_t v13 = arc4random();
  uint64_t v14 = objc_msgSend(v12, "stringWithFormat:", @"%08x%08x.aar", v13, arc4random());
  id v15 = [v11 URLByAppendingPathComponent:v14];

  BOOL v16 = [(EDDiagnosticInfoGatherer *)self _compressDirectoryAtURL:v7 intoArchiveWithURL:v15];
  if (v16)
  {
    objc_super v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v17 moveItemAtURL:v15 toURL:v9 error:0];
  }
  id v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v18 removeItemAtURL:v15 error:0];

  return v16;
}

- (BOOL)_compressDirectoryAtURL:(id)a3 intoArchiveWithURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = AAFileStreamOpenWithPath((const char *)[v6 fileSystemRepresentation], 1537, 0x1A4u);
  id v8 = AACompressionOutputStreamOpen(v7, 0x801u, 0x100000uLL, 0, 0);
  id v9 = AAEncodeArchiveOutputStreamOpen(v8, 0, 0, 0, 0);
  id v10 = AAFieldKeySetCreateWithString("FLG,MTM,CTM,DAT,SH5");
  id v11 = v5;
  uint64_t v12 = AAPathListCreateWithDirectoryContents((const char *)[v11 fileSystemRepresentation], 0, &__block_literal_global_42_0, (AAEntryMessageProc)entryMessageProc, 0, 0);
  id v13 = v11;
  int v14 = AAArchiveStreamWritePathList(v9, v12, v10, (const char *)[v13 fileSystemRepresentation], 0, 0, 0, 0);
  AAArchiveStreamClose(v9);
  AAByteStreamClose(v8);
  AAByteStreamClose(v7);
  AAFieldKeySetDestroy(v10);
  AAPathListDestroy(v12);

  return v14 == 0;
}

uint64_t __71__EDDiagnosticInfoGatherer__compressDirectoryAtURL_intoArchiveWithURL___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2 == 11)
  {
    id v3 = [NSString stringWithCString:a3 encoding:4];
    id v4 = +[EDDiagnosticInfoGatherer log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1DB39C000, v4, OS_LOG_TYPE_INFO, "Adding '%@'", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (BOOL)_copyDatabaseFromURL:(id)a3 intoDatabaseAtURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    ppDb = 0;
    if (!sqlite3_open_v2((const char *)[v6 fileSystemRepresentation], &ppDb, 524289, 0))
    {
      id v11 = 0;
      if (!sqlite3_open_v2((const char *)[v8 fileSystemRepresentation], &v11, 524294, 0))
      {
        BOOL v9 = [(EDDiagnosticInfoGatherer *)self _copyFromDatabase:ppDb intoDatabase:v11];
        sqlite3_close_v2(v11);
        sqlite3_close_v2(ppDb);
        sqlite3_sleep(10);
        goto LABEL_7;
      }
      sqlite3_close(ppDb);
    }
    BOOL v9 = 0;
  }
LABEL_7:

  return v9;
}

- (BOOL)_copyFromDatabase:(sqlite3 *)a3 intoDatabase:(sqlite3 *)a4
{
  id v4 = sqlite3_backup_init(a4, "main", a3, "main");
  if (v4)
  {
    while (1)
    {
      do
        int v5 = sqlite3_backup_step(v4, 5);
      while (!v5);
      if ((v5 - 5) > 1) {
        break;
      }
      sqlite3_sleep(100);
    }
    sqlite3_backup_finish(v4);
  }
  return v4 != 0;
}

- (void)_createDiagnosticsJSONForMessagesWithObjectIDs:(id)a3 directoryURL:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  id v7 = [(EDDiagnosticInfoGatherer *)self persistence];
  uint64_t v8 = [v7 messagePersistence];
  BOOL v9 = [v12 allObjects];
  id v10 = [v8 diagnosticsForForMessageObjectIDs:v9];

  if (v10)
  {
    id v11 = objc_msgSend(v6, "ef_URLByAppendingTimestampedPathComponent:withExtension:", @"messages", @"json");
    [v10 writeToURL:v11 options:0 error:0];
  }
}

- (void)_downloadMessagesWithObjectIDs:(id)a3 directoryURL:(id)a4 completionPromise:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(EDDiagnosticInfoGatherer *)self gathererQueue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke;
  v15[3] = &unk_1E6BFFA78;
  id v12 = v8;
  id v16 = v12;
  objc_super v17 = self;
  id v13 = v9;
  id v18 = v13;
  id v14 = v10;
  id v19 = v14;
  [v11 performBlock:v15];
}

void __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke(id *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = +[EDDiagnosticInfoGatherer log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [a1[4] count];
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = v3;
    _os_log_impl(&dword_1DB39C000, v2, OS_LOG_TYPE_DEFAULT, "Download %lu message objects ids", buf, 0xCu);
  }

  id v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
  uint64_t v17 = [MEMORY[0x1E4F60278] uniqueRequestID];
  id v18 = [MEMORY[0x1E4F60250] optionsWithRequestedRepresentationType:*MEMORY[0x1E4F5FCB0] networkUsage:2];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = a1[4];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v25;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v24 + 1) + 8 * v6);
        id v8 = [MEMORY[0x1E4F60E18] promise];
        id v9 = [v8 future];
        [v19 addObject:v9];

        id v10 = [a1[5] persistence];
        id v11 = [v10 messagePersistence];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_52;
        v20[3] = &unk_1E6C00F30;
        id v21 = a1[6];
        uint64_t v22 = v7;
        id v12 = v8;
        id v23 = v12;
        id v13 = (id)[v11 requestContentForMessageObjectID:v7 requestID:v17 options:v18 delegate:0 completionHandler:v20];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v4);
  }

  id v14 = [MEMORY[0x1E4F60D70] combine:v19];
  id v15 = [v14 map:&__block_literal_global_63];

  [a1[7] finishWithFuture:v15];
}

void __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_52(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = a3;
  if (v5)
  {
    uint64_t v7 = [v5 contentURL];
    id v8 = NSString;
    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [*(id *)(a1 + 40) globalMessageID];
    id v11 = [v7 URLByDeletingPathExtension];
    id v12 = [v11 lastPathComponent];
    id v13 = [v8 stringWithFormat:@"Message-%lld-%@", v10, v12];
    id v14 = objc_msgSend(v9, "ef_URLByAppendingTimestampedPathComponent:withExtension:", v13, @"eml");

    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v25 = 0;
    LODWORD(v13) = [v15 copyItemAtURL:v7 toURL:v14 error:&v25];
    id v16 = v25;

    if (v13)
    {
      uint64_t v17 = +[EDDiagnosticInfoGatherer log];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v27 = v14;
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, "Dumped raw eml at %{public}@", buf, 0xCu);
      }
      id v18 = v6;
    }
    else
    {
      id v20 = +[EDDiagnosticInfoGatherer log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v23 = [v7 path];
        long long v24 = objc_msgSend(v16, "ef_publicDescription");
        *(_DWORD *)buf = 138543874;
        long long v27 = v23;
        __int16 v28 = 2114;
        unint64_t v29 = v14;
        __int16 v30 = 2114;
        uint64_t v31 = v24;
        _os_log_error_impl(&dword_1DB39C000, v20, OS_LOG_TYPE_ERROR, "Error copying the url at %{public}@ to %{public}@. Error: %{public}@", buf, 0x20u);
      }
      id v18 = v16;
      uint64_t v17 = v6;
    }
  }
  else
  {
    uint64_t v7 = +[EDDiagnosticInfoGatherer log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v19 = [v6 ef_publicDescription];
      __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_52_cold_1(v19, buf, v7);
    }
    id v18 = v6;
  }

  id v21 = *(void **)(a1 + 48);
  uint64_t v22 = [MEMORY[0x1E4F1CA98] null];
  [v21 finishWithResult:v22 error:v18];
}

id __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_60()
{
  v0 = [MEMORY[0x1E4F1CA98] null];

  return v0;
}

- (void)databaseStatisticsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(EDDiagnosticInfoGatherer *)self gathererQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68__EDDiagnosticInfoGatherer_databaseStatisticsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __68__EDDiagnosticInfoGatherer_databaseStatisticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistence];
  id v3 = [v2 persistenceStatistics];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)searchableIndexDatabaseStatisticsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(EDDiagnosticInfoGatherer *)self gathererQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__EDDiagnosticInfoGatherer_searchableIndexDatabaseStatisticsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BFFBC8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [v5 performBlock:v7];
}

void __83__EDDiagnosticInfoGatherer_searchableIndexDatabaseStatisticsWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) persistence];
  id v3 = [v2 searchableIndexStatistics];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (EMDiagnosticInfoProvidingXPC)diagnosticInfoProvider
{
  return self->_diagnosticInfoProvider;
}

- (void)setDiagnosticInfoProvider:(id)a3
{
}

- (EDServerRemoteClientsProvider)remoteClientsProvider
{
  return self->_remoteClientsProvider;
}

- (void)setRemoteClientsProvider:(id)a3
{
}

- (EDFetchController)fetchController
{
  return self->_fetchController;
}

- (EFScheduler)gathererQueue
{
  return self->_gathererQueue;
}

- (void)setGathererQueue:(id)a3
{
}

- (EDPersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_gathererQueue, 0);
  objc_storeStrong((id *)&self->_fetchController, 0);
  objc_storeStrong((id *)&self->_remoteClientsProvider, 0);

  objc_storeStrong((id *)&self->_diagnosticInfoProvider, 0);
}

- (void)gatherDiagnosticsWithOptions:(uint8_t *)buf completionHandler:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Error creating directory at %{public}@, error: %{public}@", buf, 0x16u);
}

void __75__EDDiagnosticInfoGatherer_gatherDiagnosticsWithOptions_completionHandler___block_invoke_4_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB39C000, a2, OS_LOG_TYPE_ERROR, "Error gathering diagnostics: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to compress Search Indexer database.", v1, 2u);
}

- (void)_copySearchIndexerDatabaseIntoDirectoryURL:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Failed to copy Search Indexer database.", v1, 2u);
}

void __90__EDDiagnosticInfoGatherer__downloadMessagesWithObjectIDs_directoryURL_completionPromise___block_invoke_52_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Error requesting representation: %{public}@", buf, 0xCu);
}

@end