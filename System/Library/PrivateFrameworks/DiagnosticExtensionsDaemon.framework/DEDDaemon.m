@interface DEDDaemon
+ (id)sharedInstance;
- (BOOL)embeddedInApp;
- (BOOL)observesOperations;
- (DEDConfiguration)config;
- (DEDController)controller;
- (DEDDaemon)init;
- (DEDDiagnosticCollector)_diagnosticCollector;
- (NSArray)cachedExtensionsForThisDevice;
- (NSOperationQueue)backgroundOpQueue;
- (NSOperationQueue)userInitiatedOpQueue;
- (id)_controller;
- (id)_extensionsForSession:(id)a3;
- (id)attachmentHandler;
- (id)diagnosticCollector;
- (int64_t)transportType;
- (void)_logOperations;
- (void)_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5 runSetup:(BOOL)a6;
- (void)_streamOperationStatus;
- (void)_syncSessionStatusWithSession:(id)a3 withIdentifiers:(BOOL)a4;
- (void)_syncSessionStatusWithSessionID:(id)a3 withIdentifiers:(BOOL)a4;
- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5;
- (void)adoptFiles:(id)a3 forSession:(id)a4;
- (void)cancelSession:(id)a3;
- (void)commitSession:(id)a3;
- (void)finallyStartDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)getSessionStateWithSession:(id)a3;
- (void)getSessionStatusWithSession:(id)a3;
- (void)listAvailableExtensionsForSession:(id)a3;
- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5;
- (void)pingSession:(id)a3;
- (void)scheduleNotificationForSession:(id)a3;
- (void)setBackgroundOpQueue:(id)a3;
- (void)setCachedExtensionsForThisDevice:(id)a3;
- (void)setConfig:(id)a3;
- (void)setController:(id)a3;
- (void)setEmbeddedInApp:(BOOL)a3;
- (void)setUserInitiatedOpQueue:(id)a3;
- (void)set_diagnosticCollector:(id)a3;
- (void)setupDeferredDiagnosticsWithExtensionInfo:(id)a3;
- (void)start;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6;
- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)syncSessionStatusWithSession:(id)a3;
- (void)teardownDeferredDiagnosticsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5;
- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5;
- (void)unscheduleNotificationForSession:(id)a3;
- (void)warmUpCaches;
@end

@implementation DEDDaemon

- (DEDDaemon)init
{
  v15.receiver = self;
  v15.super_class = (Class)DEDDaemon;
  v2 = [(DEDDaemon *)&v15 init];
  if (v2)
  {
    v3 = +[DEDConfiguration sharedInstance];
    [(DEDDaemon *)v2 setConfig:v3];

    id v4 = objc_alloc_init(MEMORY[0x263F08A48]);
    [v4 setQualityOfService:9];
    v5 = NSString;
    v6 = [(DEDDaemon *)v2 config];
    v7 = [v6 identifier];
    v8 = [v5 stringWithFormat:@"%@.ded-daemon-bkgd-queue", v7];
    [v4 setName:v8];

    [(DEDDaemon *)v2 setBackgroundOpQueue:v4];
    id v9 = objc_alloc_init(MEMORY[0x263F08A48]);

    [v9 setQualityOfService:25];
    v10 = NSString;
    v11 = [(DEDDaemon *)v2 config];
    v12 = [v11 identifier];
    v13 = [v10 stringWithFormat:@"%@.ded-daemon-uinit-queue", v12];
    [v9 setName:v13];

    [(DEDDaemon *)v2 setUserInitiatedOpQueue:v9];
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once_2 != -1) {
    dispatch_once(&sharedInstance_once_2, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_shared_1;
  return v2;
}

uint64_t __27__DEDDaemon_sharedInstance__block_invoke()
{
  sharedInstance_shared_1 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)start
{
  v3 = [(DEDDaemon *)self _controller];
  [(DEDDaemon *)self setController:v3];

  if ([(DEDDaemon *)self embeddedInApp])
  {
    id v4 = [(DEDDaemon *)self controller];
    [v4 configureForEmbedded:1];
  }
  v5 = [(DEDDaemon *)self controller];
  [v5 configureForDaemon];

  v6 = [(DEDDaemon *)self controller];
  [v6 configureWorkerDelegate:self];

  v7 = [(DEDDaemon *)self controller];
  [v7 start];

  +[DEDAnalytics didStartDaemon];
  +[DEDDeferredExtensionInfo checkIn];
  [MEMORY[0x263F3A098] checkIn];
  +[DEDCollectionNotification beginListeningForNotification];
  v8 = +[DEDHomeKitManager sharedInstance];
  [v8 start];

  id v9 = +[DEDRapportManager sharedInstance];
  [v9 start];

  +[DEDDirectoriesCleanup run];
  [(DEDDaemon *)self warmUpCaches];
}

- (void)warmUpCaches
{
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x263F086D0];
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __25__DEDDaemon_warmUpCaches__block_invoke;
  v10 = &unk_26453A9F0;
  objc_copyWeak(&v11, &location);
  id v4 = [v3 blockOperationWithBlock:&v7];
  v5 = objc_msgSend(NSString, "stringWithFormat:", @"warmUpCaches", v7, v8, v9, v10);
  [v4 setName:v5];

  v6 = [(DEDDaemon *)self backgroundOpQueue];
  [v6 addOperation:v4];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __25__DEDDaemon_warmUpCaches__block_invoke(uint64_t a1)
{
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Warming up caches", v8, 2u);
  }

  v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);
  v5 = [WeakRetained diagnosticCollector];
  v6 = [v5 availableDiagnosticExtensions];
  id v7 = objc_loadWeakRetained(v3);
  [v7 setCachedExtensionsForThisDevice:v6];
}

- (void)finallyStartDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315906;
    v13 = "-[DEDDaemon finallyStartDiagnosticWithIdentifier:parameters:session:]";
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_debug_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v12, 0x2Au);
  }

  [(DEDDaemon *)self _startDiagnosticWithIdentifier:v8 parameters:v9 session:v10 runSetup:0];
}

- (void)setupDeferredDiagnosticsWithExtensionInfo:(id)a3
{
  id v4 = a3;
  v5 = Log_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDDaemon setupDeferredDiagnosticsWithExtensionInfo:](v4, v5);
  }

  v6 = [(DEDDaemon *)self diagnosticCollector];
  [v6 prepareItemsWithDeferredExtensionInfo:v4];
}

- (void)teardownDeferredDiagnosticsWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 136315906;
    __int16 v14 = "-[DEDDaemon teardownDeferredDiagnosticsWithIdentifier:parameters:session:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_debug_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v13, 0x2Au);
  }

  int v12 = [(DEDDaemon *)self diagnosticCollector];
  [v12 cleanupItemsWithIdentifier:v8 parameters:v9 session:v10];
}

- (int64_t)transportType
{
  return 1;
}

- (void)pingSession:(id)a3
{
  id v4 = a3;
  v5 = Log_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DEDDaemon pingSession:](v5);
  }

  v6 = [(DEDDaemon *)self controller];
  id v7 = [v6 sessionForIdentifier:v4];

  [v7 pong];
}

- (void)listAvailableExtensionsForSession:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = Log_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v21 = "-[DEDDaemon listAvailableExtensionsForSession:]";
    __int16 v22 = 2114;
    id v23 = v4;
    _os_log_impl(&dword_21FE04000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s] [%{public}@]", buf, 0x16u);
  }

  id v6 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-show-extensions-%@", v4];
  [v6 UTF8String];
  id v7 = (void *)os_transaction_create();
  objc_initWeak((id *)buf, self);
  id v8 = (void *)MEMORY[0x263F086D0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__DEDDaemon_listAvailableExtensionsForSession___block_invoke;
  v15[3] = &unk_26453AE08;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  id v17 = v10;
  objc_copyWeak(&v19, (id *)buf);
  id v11 = v4;
  id v18 = v11;
  int v12 = [v8 blockOperationWithBlock:v15];
  int v13 = [NSString stringWithFormat:@"show-extensions(%@)", v11];
  [v12 setName:v13];

  __int16 v14 = [(DEDDaemon *)self userInitiatedOpQueue];
  [v14 addOperation:v12];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __47__DEDDaemon_listAvailableExtensionsForSession___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v10 = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Running [%{public}@]", (uint8_t *)&v10, 0xCu);
  }

  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = [WeakRetained controller];
  id v7 = [v6 sessionForIdentifier:*(void *)(a1 + 48)];

  id v8 = objc_loadWeakRetained(v4);
  id v9 = [v8 _extensionsForSession:v7];

  [v7 supportsDiagnostics:v9];
}

- (id)_extensionsForSession:(id)a3
{
  id v4 = [(DEDDaemon *)self cachedExtensionsForThisDevice];

  if (v4)
  {
    v5 = [(DEDDaemon *)self cachedExtensionsForThisDevice];
  }
  else
  {
    id v6 = [(DEDDaemon *)self diagnosticCollector];
    v5 = [v6 availableDiagnosticExtensions];
  }
  return v5;
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 deferRunUntil:(id)a5 session:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = Log_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[DEDDaemon startDiagnosticWithIdentifier:parameters:deferRunUntil:session:]();
  }

  __int16 v15 = Log_0();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v20 = 138412546;
    id v21 = v10;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_INFO, "will collect %@, deferred until %@", (uint8_t *)&v20, 0x16u);
  }

  id v16 = [[DEDExtensionIdentifier alloc] initWithString:v10];
  id v17 = [DEDDeferredExtensionInfo alloc];
  +[DEDDeferredExtensionInfo recommendedGracePeriodForDate:v12];
  id v18 = -[DEDDeferredExtensionInfo initWithBugSessionIdentifier:dedIdentifier:runOnDate:withGracePeriod:](v17, "initWithBugSessionIdentifier:dedIdentifier:runOnDate:withGracePeriod:", v13, v16, v12);

  [(DEDDeferredExtensionInfo *)v18 setParameters:v11];
  [(DEDDeferredExtensionInfo *)v18 schedule];
  [v12 timeIntervalSinceNow];
  +[DEDAnalytics extensionDidScheduleExtensionWithIdentifier:v10 delay:(unint64_t)v19];
  [(DEDDaemon *)self setupDeferredDiagnosticsWithExtensionInfo:v18];
}

- (void)startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5
{
}

- (void)_startDiagnosticWithIdentifier:(id)a3 parameters:(id)a4 session:(id)a5 runSetup:(BOOL)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = Log_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v40 = "-[DEDDaemon _startDiagnosticWithIdentifier:parameters:session:runSetup:]";
    __int16 v41 = 2114;
    id v42 = v11;
    __int16 v43 = 2114;
    id v44 = v9;
    _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}s] [%{public}@] [%{public}@]", buf, 0x20u);
  }

  +[DEDAnalytics didStartExtensionWithIdentifier:v9];
  id v13 = [MEMORY[0x263EFF910] date];
  objc_initWeak((id *)buf, self);
  id v14 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-collect-%@-%@", v11, v9];
  [v14 UTF8String];
  __int16 v15 = (void *)os_transaction_create();
  id v16 = [[DEDExtensionIdentifier alloc] initWithString:v9];
  id v17 = (void *)MEMORY[0x263F086D0];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke;
  v29[3] = &unk_26453AE58;
  id v18 = v15;
  id v30 = v18;
  id v19 = v14;
  id v31 = v19;
  objc_copyWeak(&v37, (id *)buf);
  id v20 = v11;
  id v32 = v20;
  id v21 = v9;
  id v33 = v21;
  id v27 = v10;
  id v34 = v27;
  BOOL v38 = a6;
  __int16 v22 = v16;
  v35 = v22;
  id v23 = v13;
  id v36 = v23;
  uint64_t v24 = [v17 blockOperationWithBlock:v29];
  v25 = [NSString stringWithFormat:@"collect(%@-%@)", v20, v21];
  [v24 setName:v25];

  v26 = [(DEDDaemon *)self backgroundOpQueue];
  [v26 addOperation:v24];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);
}

void __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Running [%{public}@]", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v5 = [WeakRetained controller];
  id v6 = [v5 sessionForIdentifier:*(void *)(a1 + 48)];

  id v7 = objc_loadWeakRetained((id *)(a1 + 88));
  id v8 = [v7 diagnosticCollector];

  id v9 = [v8 extensionForIdentifier:*(void *)(a1 + 56)];
  int v10 = [v9 requiresDataClassBAccessToRun];
  BOOL v11 = +[DEDUtils isDataClassBAvailable];
  id v12 = Log_0();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    id v13 = [v9 identifier];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v13;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v11;
    _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_INFO, "[%{public}@] requires Data Class B [%i] is available [%i]", buf, 0x18u);
  }
  char v14 = v10 ^ 1 | v11;
  __int16 v15 = Log_0();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14)
  {
    if (v16)
    {
      uint64_t v17 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_INFO, "starting _startDiagnosticWithIdentifier operation for [%{public}@]", buf, 0xCu);
    }

    if ([v6 shouldCollectDiagnosticWithId:*(void *)(a1 + 56)])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v70 = __Block_byref_object_copy__1;
      v71 = __Block_byref_object_dispose__1;
      id v72 = 0;
      id v18 = objc_loadWeakRetained((id *)(a1 + 88));
      v51 = [v18 attachmentHandler];

      id v19 = *(void **)(a1 + 64);
      id v20 = +[DEDConstants DEDExtensionCompressOnAttach];
      v53 = [v19 objectForKeyedSubscript:v20];

      if (v53)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v51, "setCompressOnAttach:", objc_msgSend(v53, "BOOLValue"));
        }
      }
      if (*(unsigned char *)(a1 + 96)) {
        [v8 prepareItemsWithIdentifier:*(void *)(a1 + 56) parameters:*(void *)(a1 + 64) session:*(void *)(a1 + 48)];
      }
      id v21 = *(void **)(a1 + 64);
      __int16 v22 = +[DEDConstants DEDExtensionHostAppKey];
      id v23 = [v21 objectForKeyedSubscript:v22];
      if ([v23 isEqualToString:@"Feedback Assistant"])
      {
      }
      else
      {
        v26 = [*(id *)(a1 + 64) allKeys];
        int v27 = [v26 containsObject:@"annotated"];

        if (!v27)
        {
          id v32 = [*(id *)(a1 + 72) extensionIdentifier];
          uint64_t v33 = [v8 collectItemsWithIdentifier:v32 parameters:*(void *)(a1 + 64)];
          goto LABEL_29;
        }
      }
      v28 = [*(id *)(a1 + 72) extensionIdentifier];
      v29 = [v8 collectAnnotatedGroupWithIdentifier:v28 parameters:*(void *)(a1 + 64)];

      if (v29)
      {
        id v30 = [v29 items];
LABEL_30:
        if (![v30 count])
        {
          id v34 = Log_0();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v36 = *(void *)(a1 + 48);
            uint64_t v35 = *(void *)(a1 + 56);
            *(_DWORD *)v65 = 138543618;
            uint64_t v66 = v35;
            __int16 v67 = 2114;
            uint64_t v68 = v36;
            _os_log_impl(&dword_21FE04000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ returned no files for bug session %{public}@", v65, 0x16u);
          }

          uint64_t v37 = *(void *)(a1 + 56);
          BOOL v38 = [MEMORY[0x263EFF910] date];
          [v38 timeIntervalSinceDate:*(void *)(a1 + 80)];
          +[DEDAnalytics extensionWithIdentifier:v37 didCompleteWithFileCount:0 bytesCollected:0 duration:(unint64_t)v39 errorCode:3];
        }
        v40 = [v6 diskAccessQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_108;
        block[3] = &unk_26453AE30;
        id v55 = v8;
        id v56 = *(id *)(a1 + 72);
        id v57 = *(id *)(a1 + 56);
        id v58 = *(id *)(a1 + 64);
        id v49 = v30;
        id v59 = v49;
        id v48 = v51;
        id v60 = v48;
        id v61 = *(id *)(a1 + 48);
        char v64 = v10;
        id v50 = v29;
        v52 = v40;
        id v62 = v50;
        v63 = buf;
        dispatch_sync(v40, block);
        if (*(void *)(*(void *)&buf[8] + 40))
        {
          __int16 v41 = [MEMORY[0x263EFF910] date];
          [v41 timeIntervalSinceDate:*(void *)(a1 + 80)];
          double v43 = v42;
          uint64_t v44 = *(void *)(a1 + 56);
          uint64_t v45 = [*(id *)(*(void *)&buf[8] + 40) attachmentItems];
          uint64_t v46 = [v45 count];
          v47 = [*(id *)(*(void *)&buf[8] + 40) totalFileSize];
          +[DEDAnalytics extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:](DEDAnalytics, "extensionWithIdentifier:didCompleteWithFileCount:bytesCollected:duration:errorCode:", v44, v46, [v47 unsignedIntegerValue], (unint64_t)v43, 0);

          [v6 finishedDiagnosticWithIdentifier:*(void *)(a1 + 56) result:*(void *)(*(void *)&buf[8] + 40)];
        }
        else
        {
          __int16 v41 = Log_0();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_cold_1(v41);
          }
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_39;
      }
      id v31 = Log_0();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_21FE04000, v31, OS_LOG_TYPE_INFO, "Annotated Group returned is nil. Will try attachmentForParameters:", v65, 2u);
      }

      id v32 = [*(id *)(a1 + 72) extensionIdentifier];
      uint64_t v33 = [v8 collectItemsWithIdentifier:v32 parameters:*(void *)(a1 + 64)];
LABEL_29:
      id v30 = (void *)v33;

      v29 = 0;
      goto LABEL_30;
    }
    uint64_t v24 = Log_0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_21FE04000, v24, OS_LOG_TYPE_DEFAULT, "Aborting collection of [%{public}@]", buf, 0xCu);
    }

    [v6 didTerminateDiagnosticExtension:*(void *)(a1 + 56) info:*(void *)(a1 + 64)];
  }
  else
  {
    if (v16)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v15, OS_LOG_TYPE_INFO, "Data Class B is required and not available.", buf, 2u);
    }

    [v6 scheduleDiagnosticCollectionForClassBAccessWithIdentifier:*(void *)(a1 + 56) parameters:*(void *)(a1 + 64)];
  }
LABEL_39:
}

void __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_108(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = +[DEDDevice currentDevice];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) extensionIdentifier];
  v5 = [v3 extensionForIdentifier:v4];
  id v6 = [v5 name];

  id v7 = v6;
  if (!v6) {
    id v7 = *(void **)(a1 + 48);
  }
  id v8 = v7;

  id v9 = *(void **)(a1 + 56);
  int v10 = +[DEDConstants DEDAddEmptyFile];
  BOOL v11 = [v9 objectForKeyedSubscript:v10];
  if (v11)
  {
    id v12 = *(void **)(a1 + 56);
    id v13 = +[DEDConstants DEDAddEmptyFile];
    char v14 = [v12 objectForKeyedSubscript:v13];
    char v15 = [v14 BOOLValue] ^ 1;
  }
  else
  {
    char v15 = 1;
  }

  uint64_t v16 = [*(id *)(a1 + 64) count];
  uint64_t v17 = *(void **)(a1 + 72);
  if (v16 || (v15 & 1) != 0)
  {
    uint64_t v18 = [v17 processAttachments:*(void *)(a1 + 64) withSessionIdentifier:*(void *)(a1 + 80) extension:*(void *)(a1 + 48) shouldAddClassBDataProtection:*(unsigned __int8 *)(a1 + 104) annotatedGroup:*(void *)(a1 + 88)];
  }
  else
  {
    uint64_t v18 = [v17 createEmptyMessageFileForDE:*(void *)(a1 + 48) extensionName:v8 withSessionIdentifier:*(void *)(a1 + 80) device:v2];
  }
  id v19 = (void *)v18;
  id v20 = [MEMORY[0x263F3A078] createWithName:v8 rootURL:v18];
  id v21 = [*(id *)(a1 + 40) extensionIdentifier];
  uint64_t v22 = +[DEDAttachmentGroup groupWithDEGroup:v20 identifier:v21];
  uint64_t v23 = *(void *)(*(void *)(a1 + 96) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  uint64_t v25 = [v2 identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) setDeviceID:v25];

  [*(id *)(a1 + 32) cleanupItemsWithIdentifier:*(void *)(a1 + 48) parameters:*(void *)(a1 + 56) session:*(void *)(a1 + 80)];
  v26 = Log_0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = *(void *)(a1 + 48);
    v28 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) rootURL];
    v29 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) attachmentItems];
    int v33 = 138543874;
    uint64_t v34 = v27;
    __int16 v35 = 2114;
    uint64_t v36 = v28;
    __int16 v37 = 2048;
    uint64_t v38 = [v29 count];
    _os_log_impl(&dword_21FE04000, v26, OS_LOG_TYPE_INFO, "[%{public}@] attached ded group [%{public}@] with item count %lu", (uint8_t *)&v33, 0x20u);
  }
  id v30 = Log_0();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v31 = *(void *)(a1 + 48);
    id v32 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    int v33 = 138543618;
    uint64_t v34 = v31;
    __int16 v35 = 2114;
    uint64_t v36 = v32;
    _os_log_impl(&dword_21FE04000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ attached ded group %{public}@", (uint8_t *)&v33, 0x16u);
  }
}

- (void)terminateExtension:(id)a3 info:(id)a4 session:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = Log_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[DEDDaemon terminateExtension:info:session:]";
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_debug_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", location, 0x2Au);
  }

  objc_initWeak((id *)location, self);
  id v12 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-terminate-%@", v8];
  [v12 UTF8String];
  id v13 = (void *)os_transaction_create();
  char v14 = (void *)MEMORY[0x263F086D0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __45__DEDDaemon_terminateExtension_info_session___block_invoke;
  v22[3] = &unk_26453AE80;
  id v15 = v13;
  id v23 = v15;
  id v16 = v8;
  id v24 = v16;
  objc_copyWeak(&v27, (id *)location);
  id v17 = v10;
  id v25 = v17;
  id v18 = v9;
  id v26 = v18;
  id v19 = [v14 blockOperationWithBlock:v22];
  id v20 = [NSString stringWithFormat:@"terminate(%@-%@)", v17, v16];
  [v19 setName:v20];

  id v21 = [(DEDDaemon *)self backgroundOpQueue];
  [v21 addOperation:v19];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)location);
}

void __45__DEDDaemon_terminateExtension_info_session___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "starting _terminateExtension operation for [%{public}@]", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = [WeakRetained attachmentHandler];

  id v6 = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = [v6 controller];
  id v8 = [v7 sessionForIdentifier:*(void *)(a1 + 48)];

  if ([v8 isRunningDE:*(void *)(a1 + 40)])
  {
    id v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "DE collection has not finished will defer removal", buf, 2u);
    }
  }
  else if (v8)
  {
    id v10 = [v8 diskAccessQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__DEDDaemon_terminateExtension_info_session___block_invoke_118;
    block[3] = &unk_26453A830;
    id v13 = *(id *)(a1 + 40);
    id v14 = v5;
    id v15 = *(id *)(a1 + 48);
    dispatch_sync(v10, block);

    [v8 didTerminateDiagnosticExtension:*(void *)(a1 + 40) info:*(void *)(a1 + 56)];
  }
  else
  {
    BOOL v11 = Log_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __45__DEDDaemon_terminateExtension_info_session___block_invoke_cold_1();
    }

    [v5 removeDEFiles:*(void *)(a1 + 40) withSessionIdentifier:*(void *)(a1 + 48)];
  }
}

uint64_t __45__DEDDaemon_terminateExtension_info_session___block_invoke_118(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "removing files for DE [%{public}@]", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) removeDEFiles:*(void *)(a1 + 32) withSessionIdentifier:*(void *)(a1 + 48)];
}

- (void)adoptFiles:(id)a3 forSession:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = Log_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DEDDaemon adoptFiles:forSession:]();
  }

  objc_initWeak(&location, self);
  id v9 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-adopt-%@", v7];
  [v9 UTF8String];
  id v10 = (void *)os_transaction_create();
  BOOL v11 = (void *)MEMORY[0x263F086D0];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  id v20 = __35__DEDDaemon_adoptFiles_forSession___block_invoke;
  id v21 = &unk_26453AEA8;
  id v12 = v10;
  id v22 = v12;
  objc_copyWeak(&v25, &location);
  id v13 = v7;
  id v23 = v13;
  id v14 = v6;
  id v24 = v14;
  id v15 = [v11 blockOperationWithBlock:&v18];
  id v16 = [NSString stringWithFormat:@"adopt(%@)", v13, v18, v19, v20, v21];
  [v15 setName:v16];

  uint64_t v17 = [(DEDDaemon *)self userInitiatedOpQueue];
  [v17 addOperation:v15];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __35__DEDDaemon_adoptFiles_forSession___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained attachmentHandler];

  [v4 setCompressOnAttach:0];
  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 controller];
  id v25 = [v6 sessionForIdentifier:*(void *)(a1 + 40)];

  id v24 = [MEMORY[0x263EFF980] array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v7 = a1;
  id obj = *(id *)(a1 + 48);
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v13 = [v4 identifierForAdoptingFile:v12];
        if (v13)
        {
          id v14 = [objc_alloc(MEMORY[0x263F3A080]) initWithPathURL:v12];
          uint64_t v35 = v14;
          id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
          id v16 = [v4 processAttachments:v15 withSessionIdentifier:*(void *)(v7 + 40) extension:v13 shouldAddClassBDataProtection:0 annotatedGroup:0];

          if (v16)
          {
            uint64_t v17 = [MEMORY[0x263F3A078] createWithName:v13 rootURL:v16];
            uint64_t v18 = +[DEDAttachmentGroup groupWithDEGroup:v17 identifier:v13];
            [v25 didAdoptGroup:v18];
          }
          else
          {
            uint64_t v19 = Log_0();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              __35__DEDDaemon_adoptFiles_forSession___block_invoke_cold_1(v33, v12, &v34, v19);
            }

            [v24 addObject:v12];
          }
        }
        else
        {
          id v14 = Log_0();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            __int16 v37 = v12;
            _os_log_error_impl(&dword_21FE04000, v14, OS_LOG_TYPE_ERROR, "Could not build identifier for adopted file [%{public}@]", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v9);
  }

  if ([v24 count])
  {
    id v20 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *(void *)(v7 + 48);
    __int16 v31 = @"failed";
    uint64_t v32 = v21;
    id v22 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v23 = [v20 errorWithDomain:@"DEDErrorDomain" code:100 userInfo:v22];
  }
  else
  {
    id v23 = 0;
  }
  [v25 didAdoptFilesWithError:v23];
}

- (void)commitSession:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(DEDDaemon *)self controller];
  id v6 = [v5 sessionForIdentifier:v4];

  if (v6)
  {
    uint64_t v7 = [NSString stringWithFormat:@"finish(%@)", v4];
    uint64_t v8 = [(DEDDaemon *)self backgroundOpQueue];
    uint64_t v9 = [v8 operations];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __27__DEDDaemon_commitSession___block_invoke;
    v24[3] = &unk_26453AED0;
    uint64_t v10 = v7;
    id v25 = v10;
    BOOL v11 = objc_msgSend(v9, "ded_findWithBlock:", v24);

    if (v11)
    {
      id v12 = Log_0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v4;
        id v13 = "Already finishing [%{public}@]";
LABEL_11:
        _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
      }
    }
    else if ([v6 readyToFinish])
    {
      id v12 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-commits-%@", v4];
      [v12 UTF8String];
      id v14 = (void *)os_transaction_create();
      objc_initWeak((id *)buf, self);
      id v15 = (void *)MEMORY[0x263F086D0];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __27__DEDDaemon_commitSession___block_invoke_143;
      v19[3] = &unk_26453AF20;
      id v16 = v14;
      id v20 = v16;
      id v21 = v4;
      id v22 = v6;
      objc_copyWeak(&v23, (id *)buf);
      uint64_t v17 = [v15 blockOperationWithBlock:v19];
      [v17 setName:v10];
      uint64_t v18 = [(DEDDaemon *)self backgroundOpQueue];
      [v18 addOperation:v17];

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      id v12 = Log_0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v27 = v4;
        id v13 = "Not ready to finish [%{public}@]";
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  uint64_t v10 = Log_0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v27 = v4;
    _os_log_impl(&dword_21FE04000, v10, OS_LOG_TYPE_DEFAULT, "Session is nil for identifier [%{public}@]. Cannot commit", buf, 0xCu);
  }
LABEL_13:
}

uint64_t __27__DEDDaemon_commitSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __27__DEDDaemon_commitSession___block_invoke_143(id *a1)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[5];
    *(_DWORD *)buf = 138543362;
    id v44 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Starting commit operation for [%{public}@]", buf, 0xCu);
  }

  uint64_t v4 = objc_opt_new();
  id v5 = [a1[6] identifier];
  id v6 = [v4 directoryForBugSessionIdentifier:v5];

  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v8 = [WeakRetained _extensionsForSession:a1[6]];

  id v9 = objc_loadWeakRetained(a1 + 7);
  uint64_t v10 = [v9 attachmentHandler];

  [v10 extensionsWithFilesAttachedToSessionWithID:a1[5] allExtensions:v8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v11);
        }
        if ([*(id *)(*((void *)&v38 + 1) + 8 * i) requiresDataClassBAccessToRun])
        {
          char v16 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  char v16 = 1;
LABEL_13:

  BOOL v17 = +[DEDUtils isDataClassBAvailable];
  uint64_t v18 = Log_0();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if ((v16 & 1) != 0 || v17)
  {
    if (v19)
    {
      id v25 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v44 = v25;
      _os_log_impl(&dword_21FE04000, v18, OS_LOG_TYPE_DEFAULT, "Calling finisher for [%{public}@]", buf, 0xCu);
    }

    id v26 = [a1[6] finisher];
    id v27 = a1[6];
    uint64_t v28 = [v27 config];
    [v26 finishSession:v27 withConfiguration:v28];

    long long v29 = Log_0();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v44 = v30;
      _os_log_impl(&dword_21FE04000, v29, OS_LOG_TYPE_DEFAULT, "Did call finisher for [%{public}@]", buf, 0xCu);
    }

    id v24 = [MEMORY[0x263F3A0A0] findAllfiles:v6];
    uint64_t v31 = [MEMORY[0x263F3A0A0] getDirectorySize:v6];
    uint64_t v32 = [MEMORY[0x263EFF910] date];
    [a1[6] setUploadStartTime:v32];

    uint64_t v33 = [v24 count];
    uint64_t v34 = [a1[6] config];
    +[DEDAnalytics finisherDidStartWithFileCount:expectedByteUploadCount:finishingMove:](DEDAnalytics, "finisherDidStartWithFileCount:expectedByteUploadCount:finishingMove:", v33, v31, [v34 finishingMove]);

    [a1[6] didCommit];
  }
  else
  {
    if (v19)
    {
      id v20 = a1[5];
      *(_DWORD *)buf = 138543362;
      id v44 = v20;
      _os_log_impl(&dword_21FE04000, v18, OS_LOG_TYPE_DEFAULT, "Device is locked while finishing session that requires access to Class B data [%{public}@]", buf, 0xCu);
    }

    id v21 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd.commit-%@", a1[5]];
    id v22 = (const char *)[v21 UTF8String];
    id v23 = (void *)*MEMORY[0x263EF8188];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __27__DEDDaemon_commitSession___block_invoke_148;
    handler[3] = &unk_26453AEF8;
    id v36 = v21;
    id v37 = a1[5];
    id v24 = v21;
    xpc_activity_register(v22, v23, handler);
  }
}

void __27__DEDDaemon_commitSession___block_invoke_148(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    id v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      xpc_activity_state_t v10 = *(void *)(a1 + 32);
      int v12 = 138543362;
      xpc_activity_state_t v13 = v10;
      _os_log_impl(&dword_21FE04000, v9, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_RUN [%{public}@]", (uint8_t *)&v12, 0xCu);
    }

    uint64_t v8 = +[DEDDaemon sharedInstance];
    [v8 commitSession:*(void *)(a1 + 40)];
  }
  else
  {
    xpc_activity_state_t v5 = state;
    if (state)
    {
      uint64_t v8 = Log_0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        int v12 = 134218242;
        xpc_activity_state_t v13 = v5;
        __int16 v14 = 2114;
        uint64_t v15 = v11;
        _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "[%lu] not handled for activity [%{public}@]", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      id v6 = Log_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        xpc_activity_state_t v7 = *(void *)(a1 + 32);
        int v12 = 138543362;
        xpc_activity_state_t v13 = v7;
        _os_log_impl(&dword_21FE04000, v6, OS_LOG_TYPE_DEFAULT, "XPC_ACTIVITY_STATE_CHECK_IN [%{public}@]", (uint8_t *)&v12, 0xCu);
      }

      uint64_t v8 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263EF82A0], 0);
      xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x263EF82B0], 1);
      xpc_dictionary_set_string(v8, (const char *)*MEMORY[0x263EF8280], (const char *)*MEMORY[0x263EF8290]);
      xpc_activity_set_criteria(v3, v8);
    }
  }
}

- (void)cancelSession:(id)a3
{
  id v3 = Log_0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    -[DEDDaemon cancelSession:](v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)scheduleNotificationForSession:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DEDDaemon *)self controller];
  uint64_t v6 = [v5 sessionForIdentifier:v4];

  uint64_t v7 = Log_0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "Daemon received notification request for bug session: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  if ([v6 readyToNotify])
  {
    uint64_t v8 = Log_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "Ready to notify user", (uint8_t *)&v9, 2u);
    }

    [v6 presentNotificationOnFilingDevice];
  }
}

- (void)unscheduleNotificationForSession:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DEDDaemon *)self controller];
  id v6 = [v5 sessionForIdentifier:v4];

  [v6 clearNotificationOnFilingDevice];
}

- (void)addSessionData:(id)a3 withFilename:(id)a4 forSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(DEDDaemon *)self controller];
  int v12 = [v11 sessionForIdentifier:v10];

  xpc_activity_state_t v13 = NSString;
  __int16 v14 = [v12 identifier];
  uint64_t v15 = [v13 stringWithFormat:@"com.apple.diagnosticextensionsd-send-data-%@-%@", v10, v14];

  id v16 = v15;
  [v16 UTF8String];
  BOOL v17 = (void *)os_transaction_create();
  uint64_t v18 = (void *)MEMORY[0x263F086D0];
  uint64_t v28 = MEMORY[0x263EF8330];
  uint64_t v29 = 3221225472;
  id v30 = __52__DEDDaemon_addSessionData_withFilename_forSession___block_invoke;
  uint64_t v31 = &unk_26453AF48;
  id v19 = v17;
  id v32 = v19;
  id v20 = v12;
  id v33 = v20;
  id v21 = v8;
  id v34 = v21;
  id v22 = v9;
  id v35 = v22;
  id v23 = [v18 blockOperationWithBlock:&v28];
  id v24 = NSString;
  id v25 = [v20 identifier];
  id v26 = [v24 stringWithFormat:@"send-data(%@-%@)", v10, v25, v28, v29, v30, v31];

  [v23 setName:v26];
  id v27 = [(DEDDaemon *)self backgroundOpQueue];
  [v27 addOperation:v23];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }
}

uint64_t __52__DEDDaemon_addSessionData_withFilename_forSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _addSessionData:*(void *)(a1 + 48) filename:*(void *)(a1 + 56)];
}

- (void)getSessionStateWithSession:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-get-status-%@", v4];
  [v5 UTF8String];
  id v6 = (void *)os_transaction_create();
  uint64_t v7 = (void *)MEMORY[0x263F086D0];
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __40__DEDDaemon_getSessionStateWithSession___block_invoke;
  BOOL v17 = &unk_26453AE08;
  id v8 = v6;
  id v18 = v8;
  id v9 = v5;
  id v19 = v9;
  objc_copyWeak(&v21, &location);
  id v10 = v4;
  id v20 = v10;
  uint64_t v11 = [v7 blockOperationWithBlock:&v14];
  int v12 = [NSString stringWithFormat:@"getState(%@)", v10, v14, v15, v16, v17];
  [v11 setName:v12];

  xpc_activity_state_t v13 = [(DEDDaemon *)self userInitiatedOpQueue];
  [v13 addOperation:v11];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke(id *a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__DEDDaemon_getSessionStateWithSession___block_invoke_2;
  v2[3] = &unk_26453AE08;
  id v3 = a1[4];
  id v4 = a1[5];
  objc_copyWeak(&v6, a1 + 7);
  id v5 = a1[6];
  _os_activity_initiate(&dword_21FE04000, "Getting session state", OS_ACTIVITY_FLAG_DEFAULT, v2);

  objc_destroyWeak(&v6);
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = DEDSessionStateLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v16 = 138543362;
    uint64_t v17 = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "Running [%{public}@]", (uint8_t *)&v16, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained controller];
  uint64_t v7 = *(void *)(a1 + 48);
  id v6 = (uint64_t *)(a1 + 48);
  id v8 = [v5 sessionForIdentifier:v7];

  id v9 = DEDSessionStateLog();
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_3();
    }

    id v10 = [v8 stateInfo];
    uint64_t v11 = [v8 state];
    int v12 = DEDSessionStateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *v6;
      if ((unint64_t)(v11 + 1) > 9) {
        uint64_t v14 = "Unknown";
      }
      else {
        uint64_t v14 = off_26453B008[v11 + 1];
      }
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2082;
      id v19 = v14;
      _os_log_impl(&dword_21FE04000, v12, OS_LOG_TYPE_DEFAULT, "Did get session state for session [%{public}@], state [%{public}s]", (uint8_t *)&v16, 0x16u);
    }

    uint64_t v15 = DEDSessionStateLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_2();
    }

    [v8 didGetState:v11 info:v10];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_1();
  }
}

- (void)getSessionStatusWithSession:(id)a3
{
}

- (void)syncSessionStatusWithSession:(id)a3
{
}

- (void)_syncSessionStatusWithSessionID:(id)a3 withIdentifiers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(DEDDaemon *)self controller];
  id v8 = [v7 sessionForIdentifier:v6];

  if (v8)
  {
    [(DEDDaemon *)self _syncSessionStatusWithSession:v8 withIdentifiers:v4];
  }
  else
  {
    id v9 = Log_0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[DEDDaemon _syncSessionStatusWithSessionID:withIdentifiers:]((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)_syncSessionStatusWithSession:(id)a3 withIdentifiers:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  uint64_t v7 = [v6 identifier];
  id v8 = NSString;
  id v9 = [v6 identifier];
  uint64_t v10 = [v8 stringWithFormat:@"com.apple.diagnosticextensionsd-status-%@", v9];

  id v11 = v10;
  [v11 UTF8String];
  uint64_t v12 = (void *)os_transaction_create();
  uint64_t v13 = (void *)MEMORY[0x263F086D0];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke;
  v22[3] = &unk_26453AFE8;
  id v14 = v12;
  id v23 = v14;
  id v15 = v6;
  id v24 = v15;
  objc_copyWeak(&v26, &location);
  id v16 = v7;
  id v25 = v16;
  BOOL v27 = a4;
  uint64_t v17 = [v13 blockOperationWithBlock:v22];
  __int16 v18 = NSString;
  id v19 = [v15 identifier];
  uint64_t v20 = [v18 stringWithFormat:@"getStatus(%@)", v19];
  [v17 setName:v20];

  id v21 = [(DEDDaemon *)self userInitiatedOpQueue];
  [v21 addOperation:v17];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  v2 = Log_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = [*(id *)(a1 + 40) identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_INFO, "starting _syncSessionStatusWithSession operation for session [%{public}@]", (uint8_t *)&buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = [WeakRetained attachmentHandler];

  id v6 = [*(id *)(a1 + 40) knownExtensions];
  uint64_t v7 = [v6 allValues];

  if (!v7 || ![v7 count])
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 56));
    id v9 = [v8 diagnosticCollector];
    uint64_t v10 = [v9 availableDiagnosticExtensions];

    uint64_t v7 = (void *)v10;
  }
  queue = [*(id *)(a1 + 40) diskAccessQueue];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__1;
  v54 = __Block_byref_object_dispose__1;
  id v55 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_166;
  block[3] = &unk_26453AF70;
  p_long long buf = &buf;
  id v30 = v5;
  id v46 = v30;
  id v47 = *(id *)(a1 + 48);
  id v33 = v7;
  id v48 = v33;
  dispatch_sync(queue, block);
  id v11 = *(void **)(*((void *)&buf + 1) + 40);
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_2;
  v43[3] = &unk_26453A4D0;
  id v44 = *(id *)(a1 + 40);
  id v32 = objc_msgSend(v11, "ded_rejectItemsPassingTest:", v43);
  uint64_t v12 = [*(id *)(a1 + 40) ongoingExtensionCollectionOperations];
  uint64_t v13 = [*(id *)(a1 + 40) scheduledDeferredExtensionCollectionOperations];
  if ([v12 count] || objc_msgSend(v13, "count"))
  {
    id v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v33, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v15 = v33;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v20 = [v19 identifier];
          [v14 setObject:v19 forKey:v20];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v16);
    }
  }
  else
  {
    id v14 = 0;
  }
  if ([v12 count])
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_3;
    v37[3] = &unk_26453AF98;
    id v38 = v14;
    id v21 = objc_msgSend(v12, "ded_mapWithBlock:", v37);
  }
  else
  {
    id v21 = (void *)MEMORY[0x263EFFA68];
  }
  if ([v13 count])
  {
    id v22 = +[DEDDeferredExtensionInfo allInfo];
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_4;
    v34[3] = &unk_26453AFC0;
    id v23 = v22;
    id v35 = v23;
    id v36 = v14;
    id v24 = objc_msgSend(v13, "ded_mapWithBlock:", v34);
    uint64_t v25 = [v21 arrayByAddingObjectsFromArray:v24];

    id v21 = (void *)v25;
  }
  id v26 = Log_0();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_cold_1((uint64_t)v32, (uint64_t)v21, v26);
  }

  int v27 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v28 = *(void **)(a1 + 40);
  if (v27)
  {
    uint64_t v29 = [v28 allExtensionIdentifiers];
    [v28 hasCollected:v32 isCollecting:v21 identifiers:v29];
  }
  else
  {
    [v28 hasCollected:v32 isCollecting:v21];
  }

  _Block_object_dispose(&buf, 8);
}

uint64_t __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_166(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) collectedGroupsWithSessionIdentifier:*(void *)(a1 + 40) matchingExtensions:*(void *)(a1 + 48)];
  return MEMORY[0x270F9A758]();
}

uint64_t __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 extensionID];
  int v4 = [*(id *)(a1 + 32) isRunningDE:v3];
  uint64_t v5 = v4 | [*(id *)(a1 + 32) shouldCollectDiagnosticWithId:v3] ^ 1;

  return v5;
}

id __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [[DEDExtensionIdentifier alloc] initWithString:v3];

  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [(DEDExtensionIdentifier *)v4 extensionIdentifier];
  uint64_t v7 = [v5 objectForKey:v6];
  id v8 = (void *)[v7 copy];

  [v8 setDedExtensionIdentifier:v4];
  return v8;
}

id __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  int v4 = [v3 dedIdentifier];

  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = [v4 extensionIdentifier];
  uint64_t v7 = [v5 objectForKey:v6];
  id v8 = (void *)[v7 copy];

  [v8 setDedExtensionIdentifier:v4];
  return v8;
}

- (void)loadTextDataForExtensions:(id)a3 localization:(id)a4 sessionID:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = Log_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v22 = [v8 valueForKeyPath:@"identifier"];
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[DEDDaemon loadTextDataForExtensions:localization:sessionID:]";
    __int16 v33 = 2112;
    id v34 = v22;
    __int16 v35 = 2112;
    id v36 = v9;
    __int16 v37 = 2112;
    id v38 = v10;
    _os_log_debug_impl(&dword_21FE04000, v11, OS_LOG_TYPE_DEBUG, "%s %@, $@, %@, %@", location, 0x2Au);
  }
  objc_initWeak((id *)location, self);
  id v12 = [NSString stringWithFormat:@"com.apple.diagnosticextensionsd-load-extension-text-%@", v10];
  [v12 UTF8String];
  uint64_t v13 = (void *)os_transaction_create();
  id v14 = (void *)MEMORY[0x263F086D0];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  uint64_t v25 = __62__DEDDaemon_loadTextDataForExtensions_localization_sessionID___block_invoke;
  id v26 = &unk_26453AE80;
  id v15 = v13;
  id v27 = v15;
  id v16 = v8;
  id v28 = v16;
  objc_copyWeak(&v31, (id *)location);
  id v17 = v9;
  id v29 = v17;
  id v18 = v10;
  id v30 = v18;
  id v19 = [v14 blockOperationWithBlock:&v23];
  uint64_t v20 = [NSString stringWithFormat:@"loadExtensionText(%@)", v18, v23, v24, v25, v26];
  [v19 setName:v20];

  id v21 = [(DEDDaemon *)self userInitiatedOpQueue];
  [v21 addOperation:v19];

  if ([(DEDDaemon *)self observesOperations]) {
    [(DEDDaemon *)self _logOperations];
  }

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)location);
}

void __62__DEDDaemon_loadTextDataForExtensions_localization_sessionID___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        id v9 = objc_msgSend(WeakRetained, "diagnosticCollector", (void)v13);
        [v9 loadExtensionTextDataInExtension:v7 localization:*(void *)(a1 + 48)];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  id v10 = objc_loadWeakRetained((id *)(a1 + 64));
  id v11 = [v10 controller];
  id v12 = [v11 sessionForIdentifier:*(void *)(a1 + 56)];

  [v12 didLoadTextDataForExtensions:*(void *)(a1 + 40) localization:*(void *)(a1 + 48)];
}

- (id)diagnosticCollector
{
  uint64_t v3 = [(DEDDaemon *)self _diagnosticCollector];

  if (!v3)
  {
    uint64_t v4 = objc_alloc_init(DEDDiagnosticCollector);
    [(DEDDaemon *)self set_diagnosticCollector:v4];
  }
  return [(DEDDaemon *)self _diagnosticCollector];
}

- (id)attachmentHandler
{
  id v2 = objc_alloc_init(DEDAttachmentHandler);
  return v2;
}

- (id)_controller
{
  id v2 = objc_alloc_init(DEDController);
  return v2;
}

- (BOOL)observesOperations
{
  return 1;
}

- (void)_streamOperationStatus
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__DEDDaemon__streamOperationStatus__block_invoke;
  block[3] = &unk_26453A5C0;
  void block[4] = self;
  dispatch_after(v3, MEMORY[0x263EF83A0], block);
}

uint64_t __35__DEDDaemon__streamOperationStatus__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _logOperations];
  id v2 = *(void **)(a1 + 32);
  return [v2 _streamOperationStatus];
}

- (void)_logOperations
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = a1;
  uint64_t v4 = [a2 backgroundOpQueue];
  uint64_t v5 = [v4 name];
  uint64_t v6 = [a2 backgroundOpQueue];
  uint64_t v7 = [v6 operations];
  id v8 = [v7 valueForKeyPath:@"name"];
  int v10 = 138412546;
  id v11 = v5;
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_21FE04000, v3, v9, "%@ operations %@", (uint8_t *)&v10);
}

void __27__DEDDaemon__logOperations__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) config];
  os_log_t v1 = os_log_create((const char *)[v3 loggingSubsystem], "ded-op-watch");
  id v2 = (void *)_logOperations_opDebugLog;
  _logOperations_opDebugLog = (uint64_t)v1;
}

- (DEDConfiguration)config
{
  return (DEDConfiguration *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSOperationQueue)backgroundOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBackgroundOpQueue:(id)a3
{
}

- (NSOperationQueue)userInitiatedOpQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUserInitiatedOpQueue:(id)a3
{
}

- (BOOL)embeddedInApp
{
  return self->_embeddedInApp;
}

- (void)setEmbeddedInApp:(BOOL)a3
{
  self->_embeddedInApp = a3;
}

- (NSArray)cachedExtensionsForThisDevice
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCachedExtensionsForThisDevice:(id)a3
{
}

- (DEDDiagnosticCollector)_diagnosticCollector
{
  return (DEDDiagnosticCollector *)objc_getProperty(self, a2, 48, 1);
}

- (void)set_diagnosticCollector:(id)a3
{
}

- (DEDController)controller
{
  return (DEDController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->__diagnosticCollector, 0);
  objc_storeStrong((id *)&self->_cachedExtensionsForThisDevice, 0);
  objc_storeStrong((id *)&self->_userInitiatedOpQueue, 0);
  objc_storeStrong((id *)&self->_backgroundOpQueue, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)setupDeferredDiagnosticsWithExtensionInfo:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 dedIdentifier];
  uint64_t v5 = [v4 extensionIdentifier];
  uint64_t v6 = [a1 parameters];
  uint64_t v7 = [a1 bugSessionIdentifier];
  int v8 = 136315906;
  uint64_t v9 = "-[DEDDaemon setupDeferredDiagnosticsWithExtensionInfo:]";
  __int16 v10 = 2112;
  id v11 = v5;
  __int16 v12 = 2112;
  long long v13 = v6;
  __int16 v14 = 2112;
  long long v15 = v7;
  _os_log_debug_impl(&dword_21FE04000, a2, OS_LOG_TYPE_DEBUG, "%s %@ %@ %@", (uint8_t *)&v8, 0x2Au);
}

- (void)pingSession:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_21FE04000, log, OS_LOG_TYPE_DEBUG, "... daemon does work here, then responds back through bug session ...", v1, 2u);
}

- (void)startDiagnosticWithIdentifier:parameters:deferRunUntil:session:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  id v3 = "-[DEDDaemon startDiagnosticWithIdentifier:parameters:deferRunUntil:session:]";
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_21FE04000, v0, v1, "%s %@", (uint8_t *)&v2);
}

void __72__DEDDaemon__startDiagnosticWithIdentifier_parameters_session_runSetup___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_21FE04000, log, OS_LOG_TYPE_FAULT, "could not crate ded group", v1, 2u);
}

void __45__DEDDaemon_terminateExtension_info_session___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "_terminateExtension called while session is nil for identifier [%{public}@]", v2, v3, v4, v5, v6);
}

- (void)adoptFiles:forSession:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[DEDDaemon adoptFiles:forSession:]";
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_2(&dword_21FE04000, v0, v1, "%s %@", (uint8_t *)&v2);
}

void __35__DEDDaemon_adoptFiles_forSession___block_invoke_cold_1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 path];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_21FE04000, a4, OS_LOG_TYPE_ERROR, "Could not copy adopted file: %@", a1, 0xCu);
}

- (void)cancelSession:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_21FE04000, v0, v1, "No session for session id [%{public}@]. Cannot sync state", v2, v3, v4, v5, v6);
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_2_2(&dword_21FE04000, v1, (uint64_t)v1, "Session [%{public}@], state info [%{public}@]", v2);
}

void __40__DEDDaemon_getSessionStateWithSession___block_invoke_2_cold_3()
{
  OUTLINED_FUNCTION_3_0(*MEMORY[0x263EF8340]);
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_21FE04000, v0, OS_LOG_TYPE_DEBUG, "Getting session state for session [%{public}@]", v1, 0xCu);
}

- (void)_syncSessionStatusWithSessionID:(uint64_t)a3 withIdentifiers:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__DEDDaemon__syncSessionStatusWithSession_withIdentifiers___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  OUTLINED_FUNCTION_2_2(&dword_21FE04000, a3, (uint64_t)a3, "has collected %@ ongoing %@", (uint8_t *)&v3);
}

@end