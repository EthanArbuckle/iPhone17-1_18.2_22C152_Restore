@interface FPDServer
+ (id)appSupportPath;
+ (id)homeDirectory;
+ (id)personaCloudStoragePath;
- (BOOL)isPastBuddy;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (Class)fpckTaskClass;
- (Class)fpdPurgerClass;
- (Class)fpfsClass;
- (Class)fpfsSQLBackupManagerClass;
- (Class)fpfsSQLRestoreManagerClass;
- (FPDActionOperationEngine)operationEngine;
- (FPDAppMonitor)appMonitor;
- (FPDCacheDeleteService)cacheDelete;
- (FPDExtensionManager)extensionManager;
- (FPDPresenterManager)presenterManager;
- (FPDServer)init;
- (FPDSpotlightDaemonClient)spotlightDaemonClient;
- (FPDTelemetryService)telemetry;
- (FPDVolumeManager)volumeManager;
- (NSXPCListener)listener;
- (void)_computeUnlockedStatusAndSetup;
- (void)_finishSetup;
- (void)_initSignals;
- (void)_monitorUnlockedStatus;
- (void)_setup;
- (void)_startXPCListener;
- (void)exitWithCode:(int)a3;
- (void)handleExitSignal:(int)a3;
- (void)localeDidChange;
- (void)materializeURL:(id)a3 completion:(id)a4;
- (void)migrateLegacyFPFSLocations;
- (void)purge;
- (void)setFpckTaskClass:(Class)a3;
- (void)setFpdPurgerClass:(Class)a3;
- (void)setFpfsClass:(Class)a3;
- (void)setFpfsSQLBackupManagerClass:(Class)a3;
- (void)setFpfsSQLRestoreManagerClass:(Class)a3;
- (void)setListener:(id)a3;
- (void)signalProviderChanges;
- (void)signalProviderChangesWithLowPriority;
- (void)start;
@end

@implementation FPDServer

uint64_t __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeUnlockedStatusAndSetup];
}

- (FPDExtensionManager)extensionManager
{
  return self->_extensionManager;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_sync((dispatch_queue_t)self->_makeSureSetupEnqueued, &__block_literal_global_115);
  setupQueue = self->_setupQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  dispatch_sync(setupQueue, block);
  if (self->_isUnlocked)
  {
    v9 = [v7 valueForEntitlement:@"application-identifier"];
    if (([v9 isEqualToString:@"com.apple.BackupAgent"] & 1) != 0
      || ([v9 isEqualToString:@"com.apple.backupd"] & 1) != 0
      || self->_isPastBuddy)
    {
      uint64_t v21 = FPDDaemonXPCInterface();
      [v7 setExportedInterface:v21];
      v10 = objc_alloc_init(FPDXPCServicer);
      [(FPDXPCServicer *)v10 setServer:self];
      [(FPDXPCServicer *)v10 setConnection:v7];
      id location = 0;
      objc_initWeak(&location, v7);
      id from = 0;
      objc_initWeak(&from, v10);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_126;
      v24[3] = &unk_1E6A74518;
      objc_copyWeak(&v25, &location);
      objc_copyWeak(&v26, &from);
      [v7 setInvalidationHandler:v24];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2_127;
      v22[3] = &unk_1E6A74010;
      objc_copyWeak(&v23, &location);
      [v7 setInterruptionHandler:v22];
      [v7 setExportedObject:v10];
      v11 = (void *)MEMORY[0x1E4F25DB0];
      v12 = fp_default_log();
      [v11 setupWithLog:v12 forConnection:v7];

      [v7 resume];
      v13 = fp_current_or_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = v6;
        int v15 = [v7 processIdentifier];
        [v7 processIdentifier];
        v16 = FPExecutableNameForProcessIdentifier();
        *(_DWORD *)buf = 67109378;
        int v31 = v15;
        __int16 v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_1D744C000, v13, OS_LOG_TYPE_INFO, "[INFO] New connection from pid %d [%@]", buf, 0x12u);

        id v6 = v14;
      }

      objc_destroyWeak(&v23);
      objc_destroyWeak(&v26);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      BOOL v17 = 1;
      v18 = (void *)v21;
    }
    else
    {
      v20 = fp_current_or_default_log();
      v18 = v20;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        -[FPDServer listener:shouldAcceptNewConnection:]();
        BOOL v17 = 0;
        v18 = v20;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
  }
  else
  {
    v9 = fp_current_or_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[FPDServer listener:shouldAcceptNewConnection:]();
    }
    BOOL v17 = 0;
  }

  return v17;
}

- (void)signalProviderChanges
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] posting provider changes notification", v2, v3, v4, v5, v6);
}

- (void)_computeUnlockedStatusAndSetup
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] [SIMULATED] Not instantiating file providers due to forced buddy state, stop forcing it with: 'fileproviderctl control exit_buddy_state'.", v2, v3, v4, v5, v6);
}

- (FPDActionOperationEngine)operationEngine
{
  return self->_operationEngine;
}

- (FPDAppMonitor)appMonitor
{
  return self->_appMonitor;
}

- (FPDServer)init
{
  v40.receiver = self;
  v40.super_class = (Class)FPDServer;
  uint64_t v2 = [(FPDServer *)&v40 init];
  uint64_t v3 = v2;
  if (v2)
  {
    [(FPDServer *)v2 _initSignals];
    uint64_t v4 = [[FPDActionOperationEngine alloc] initWithServer:v3];
    operationEngine = v3->_operationEngine;
    v3->_operationEngine = v4;

    uint8_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("setup-queue", v6);
    setupQueue = v3->_setupQueue;
    v3->_setupQueue = (OS_dispatch_queue *)v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("setup-enqueue", v9);
    makeSureSetupEnqueued = v3->_makeSureSetupEnqueued;
    v3->_makeSureSetupEnqueued = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("finishing-setup-queue", v12);
    afterSetupWorkQueue = v3->_afterSetupWorkQueue;
    v3->_afterSetupWorkQueue = (OS_dispatch_queue *)v13;

    dispatch_group_t v15 = dispatch_group_create();
    fileProviderManagerIsReadyGroup = v3->_fileProviderManagerIsReadyGroup;
    v3->_fileProviderManagerIsReadyGroup = (OS_dispatch_group *)v15;

    uint64_t v17 = +[FPDCacheDeleteService sharedInstance];
    cacheDelete = v3->_cacheDelete;
    v3->_cacheDelete = (FPDCacheDeleteService *)v17;

    v19 = objc_alloc_init(FPDTelemetryService);
    telemetry = v3->_telemetry;
    v3->_telemetry = v19;

    uint64_t v21 = [[FPDVolumeManager alloc] initWithServer:v3];
    volumeManager = v3->_volumeManager;
    v3->_volumeManager = v21;

    id v23 = [[FPDAppMonitor alloc] initWithServer:v3];
    appMonitor = v3->_appMonitor;
    v3->_appMonitor = v23;

    objc_msgSend(@"com.apple.fileprovider.providers-changed", "fp_libnotifyPerUserNotificationName");
    id v25 = objc_claimAutoreleasedReturnValue();
    notify_register_check((const char *)[v25 UTF8String], &v3->_providerChangeNotificationToken);

    id v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v27 = dispatch_queue_create("signalProviderChangesQueue", v26);

    v28 = +[FPDConfigurationStore defaultStore];
    double v29 = (double)(int)[v28 lowPrioritySignalProviderChangesIntervalSeconds];

    uint64_t v30 = [objc_alloc(MEMORY[0x1E4F25D50]) initWithName:@"signalProviderChanges" queue:v27 minFireInterval:v29];
    signalProviderChangesPacer = v3->_signalProviderChangesPacer;
    v3->_signalProviderChangesPacer = (FPPacer *)v30;

    id location = 0;
    objc_initWeak(&location, v3);
    __int16 v32 = v3->_signalProviderChangesPacer;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __17__FPDServer_init__block_invoke;
    v37 = &unk_1E6A74010;
    objc_copyWeak(&v38, &location);
    [(FPPacer *)v32 setEventBlock:&v34];
    [(FPPacer *)v3->_signalProviderChangesPacer resume];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __17__FPDServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained signalProviderChanges];
}

- (void)signalProviderChangesWithLowPriority
{
}

- (void)_initSignals
{
  signal(13, (void (__cdecl *)(int))1);
  signal(1, (void (__cdecl *)(int))1);
  signal(30, (void (__cdecl *)(int))1);
  signal(31, (void (__cdecl *)(int))1);
  signal(3, (void (__cdecl *)(int))1);
  signal(15, (void (__cdecl *)(int))1);
  signal(2, (void (__cdecl *)(int))1);
  uint64_t v3 = (const dispatch_source_type_s *)MEMORY[0x1E4F14480];
  uint64_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14480], 2uLL, 0, 0);
  sigIntSrc = self->_sigIntSrc;
  self->_sigIntSrc = v4;

  uint8_t v6 = (OS_dispatch_source *)dispatch_source_create(v3, 3uLL, 0, 0);
  sigQuitSrc = self->_sigQuitSrc;
  self->_sigQuitSrc = v6;

  v8 = (OS_dispatch_source *)dispatch_source_create(v3, 0xFuLL, 0, 0);
  sigTermSrc = self->_sigTermSrc;
  self->_sigTermSrc = v8;

  dispatch_queue_t v10 = self->_sigIntSrc;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __25__FPDServer__initSignals__block_invoke;
  block[3] = &unk_1E6A73FE8;
  block[4] = self;
  v11 = v10;
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_source_set_event_handler(v11, v12);

  dispatch_queue_t v13 = self->_sigQuitSrc;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __25__FPDServer__initSignals__block_invoke_2;
  v20[3] = &unk_1E6A73FE8;
  v20[4] = self;
  id v14 = v13;
  dispatch_block_t v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v20);
  dispatch_source_set_event_handler(v14, v15);

  v16 = self->_sigTermSrc;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __25__FPDServer__initSignals__block_invoke_3;
  v19[3] = &unk_1E6A73FE8;
  v19[4] = self;
  uint64_t v17 = v16;
  dispatch_block_t v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
  dispatch_source_set_event_handler(v17, v18);

  dispatch_resume((dispatch_object_t)self->_sigIntSrc);
  dispatch_resume((dispatch_object_t)self->_sigQuitSrc);
  dispatch_resume((dispatch_object_t)self->_sigTermSrc);
}

uint64_t __25__FPDServer__initSignals__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExitSignal:2];
}

uint64_t __25__FPDServer__initSignals__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExitSignal:3];
}

uint64_t __25__FPDServer__initSignals__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExitSignal:15];
}

- (void)materializeURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 path];
  v9 = [(FPDExtensionManager *)self->_extensionManager domainForURL:v6 reason:0];
  dispatch_queue_t v10 = v9;
  if (v9)
  {
    v11 = [v9 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__FPDServer_materializeURL_completion___block_invoke;
    block[3] = &unk_1E6A73E38;
    id v15 = v10;
    id v16 = v6;
    id v17 = v7;
    dispatch_async(v11, block);

    dispatch_block_t v12 = v15;
  }
  else
  {
    dispatch_queue_t v13 = fp_current_or_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[FPDServer materializeURL:completion:]();
    }

    dispatch_block_t v12 = FPInvalidURLError();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }
}

void __39__FPDServer_materializeURL_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) defaultBackend];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = +[FPDRequest requestForSelf];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__FPDServer_materializeURL_completion___block_invoke_2;
  v6[3] = &unk_1E6A735F8;
  id v7 = *(id *)(a1 + 48);
  id v5 = (id)[v2 startProvidingItemAtURL:v3 readerID:@"materializeURL" readingOptions:0 request:v4 completionHandler:v6];
}

void __39__FPDServer_materializeURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__FPDServer_materializeURL_completion___block_invoke_2_cold_1(v3, v4);
    }

    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (void)handleExitSignal:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = fp_current_or_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    dispatch_queue_t v10 = strsignal(a3);
    _os_log_impl(&dword_1D744C000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] starting exit sequence because of received signal (%s)", (uint8_t *)&v9, 0xCu);
  }

  id v6 = (FPDServer *)[(FPDServer *)self exitWithCode:0];
  [(FPDServer *)v6 exitWithCode:v8];
}

- (void)exitWithCode:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a3;
    _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] exiting with code %d...", (uint8_t *)v5, 8u);
  }

  exit(a3);
}

- (void)_setup
{
  OUTLINED_FUNCTION_4();
  _os_log_fault_impl(&dword_1D744C000, v0, OS_LOG_TYPE_FAULT, "[CRIT] There is no need to call setupFileProviderManager twice!", v1, 2u);
}

uint64_t __19__FPDServer__setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) providersDidChange];
}

uint64_t __19__FPDServer__setup__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 144) loadAdditionalVolumesWithCompletion:&__block_literal_global_6];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _finishSetup];
}

- (void)purge
{
  extensionManager = self->_extensionManager;
  [(FPDServer *)self fpdPurgerClass];
  id v3 = (id)objc_opt_new();
  [(FPDExtensionManager *)extensionManager purge:v3];
}

- (void)_finishSetup
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] registering task to auto-delete old trashed items", v2, v3, v4, v5, v6);
}

void __25__FPDServer__finishSetup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_INFO, "[INFO] remove trashed items older than 30 days", buf, 2u);
    }

    uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-2592000.0];
    uint8_t v6 = [*(id *)(a1 + 32) extensionManager];
    SEL v7 = [v6 providerWithIdentifier:@"com.apple.FileProvider.LocalStorage" reason:0];
    int v8 = [v7 asAppExtensionBackedProvider];

    if (v8)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        int v9 = fp_current_or_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __25__FPDServer__finishSetup__block_invoke_cold_2();
        }
      }
      dispatch_queue_t v10 = +[FPDRequest requestForSelf];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __25__FPDServer__finishSetup__block_invoke_75;
      v19[3] = &unk_1E6A73FE8;
      v20 = v3;
      [v8 removeTrashedItemsOlderThanDate:v5 request:v10 completionHandler:v19];

      uint64_t v11 = v20;
    }
    else
    {
      uint64_t v11 = fp_current_or_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __25__FPDServer__finishSetup__block_invoke_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
      }
    }
  }
}

void __25__FPDServer__finishSetup__block_invoke_75(uint64_t a1)
{
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __25__FPDServer__finishSetup__block_invoke_75_cold_2();
  }

  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    uint64_t v3 = fp_current_or_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __25__FPDServer__finishSetup__block_invoke_75_cold_1();
    }
  }
}

- (void)_startXPCListener
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t section = __fp_create_section();
  uint64_t v3 = fp_current_or_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    pid_t v6 = getpid();
    FPOSVersion();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    int v8 = FPVersion();
    *(_DWORD *)buf = 134218754;
    uint64_t v11 = section;
    __int16 v12 = 1024;
    pid_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v8;
    _os_log_debug_impl(&dword_1D744C000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx starting up, welcome, pid:%d, os:%@, version:%@", buf, 0x26u);
  }
  uint64_t v4 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.FileProvider"];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
  __fp_leave_section_Debug();
}

- (void)_monitorUnlockedStatus
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)firstUnlockNotificationCallback, @"com.apple.mobile.keybagd.first_unlock", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F9AA18];
  CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)pastBuddyNotificationCallback, v5, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (BOOL)isPastBuddy
{
  return self->_isPastBuddy;
}

- (void)localeDidChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v6 = [v3 localeIdentifier];

  if (([v6 isEqualToString:self->_locale] & 1) == 0)
  {
    uint64_t v4 = fp_current_or_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      locale = self->_locale;
      *(_DWORD *)buf = 138412546;
      int v8 = locale;
      __int16 v9 = 2112;
      id v10 = v6;
      _os_log_impl(&dword_1D744C000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] current local did change (%@ -> %@), exiting...", buf, 0x16u);
    }

    [(FPDServer *)self exitWithCode:0];
  }
}

- (void)start
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_1D744C000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx starting file provider server", v1, 0xCu);
}

void __18__FPDServer_start__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startXPCListener];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __18__FPDServer_start__block_invoke_2;
  v6[3] = &unk_1E6A744F0;
  uint64_t v4 = *(void *)(a1 + 40);
  void v6[4] = v2;
  v6[5] = v4;
  dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v6);
  dispatch_async(v3, v5);
}

uint64_t __18__FPDServer_start__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __18__FPDServer_start__block_invoke_2_cold_1(&v4, v2);
  }

  [*(id *)(a1 + 32) _monitorUnlockedStatus];
  [*(id *)(a1 + 32) _computeUnlockedStatusAndSetup];
  return __fp_leave_section_Debug();
}

- (void)migrateLegacyFPFSLocations
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] Not migrating: sokoban is off", v2, v3, v4, v5, v6);
}

void __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_126(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setExportedObject:0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 invalidate];
}

void __48__FPDServer_listener_shouldAcceptNewConnection___block_invoke_2_127(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

+ (id)homeDirectory
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_homeDirectory");
  id v3 = [v2 path];

  return v3;
}

+ (id)personaCloudStoragePath
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_cloudStorageDirectory");
  id v3 = [v2 path];

  return v3;
}

+ (id)appSupportPath
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fp_supportDirectory");
  id v3 = [v2 path];

  return v3;
}

- (FPDCacheDeleteService)cacheDelete
{
  return self->_cacheDelete;
}

- (FPDTelemetryService)telemetry
{
  return self->_telemetry;
}

- (FPDVolumeManager)volumeManager
{
  return self->_volumeManager;
}

- (FPDPresenterManager)presenterManager
{
  return self->_presenterManager;
}

- (Class)fpfsClass
{
  return self->_fpfsClass;
}

- (void)setFpfsClass:(Class)a3
{
}

- (Class)fpfsSQLBackupManagerClass
{
  return self->_fpfsSQLBackupManagerClass;
}

- (void)setFpfsSQLBackupManagerClass:(Class)a3
{
}

- (Class)fpfsSQLRestoreManagerClass
{
  return self->_fpfsSQLRestoreManagerClass;
}

- (void)setFpfsSQLRestoreManagerClass:(Class)a3
{
}

- (Class)fpckTaskClass
{
  return self->_fpckTaskClass;
}

- (void)setFpckTaskClass:(Class)a3
{
}

- (Class)fpdPurgerClass
{
  return self->_fpdPurgerClass;
}

- (void)setFpdPurgerClass:(Class)a3
{
}

- (FPDSpotlightDaemonClient)spotlightDaemonClient
{
  return self->_spotlightDaemonClient;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_spotlightDaemonClient, 0);
  objc_storeStrong((id *)&self->_fpdPurgerClass, 0);
  objc_storeStrong((id *)&self->_fpckTaskClass, 0);
  objc_storeStrong((id *)&self->_fpfsSQLRestoreManagerClass, 0);
  objc_storeStrong((id *)&self->_fpfsSQLBackupManagerClass, 0);
  objc_storeStrong((id *)&self->_fpfsClass, 0);
  objc_storeStrong((id *)&self->_presenterManager, 0);
  objc_storeStrong((id *)&self->_extensionManager, 0);
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_volumeManager, 0);
  objc_storeStrong((id *)&self->_operationEngine, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_bubble, 0);
  objc_storeStrong((id *)&self->_signalProviderChangesPacer, 0);
  objc_storeStrong((id *)&self->_telemetry, 0);
  objc_storeStrong((id *)&self->_cacheDelete, 0);
  objc_storeStrong((id *)&self->_machServerQueue, 0);
  objc_storeStrong((id *)&self->_fileProviderManagerIsReadyGroup, 0);
  objc_storeStrong((id *)&self->_afterSetupWorkQueue, 0);
  objc_storeStrong((id *)&self->_setupQueue, 0);
  objc_storeStrong((id *)&self->_makeSureSetupEnqueued, 0);
  objc_storeStrong((id *)&self->_machSrc, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_sigQuitSrc, 0);
  objc_storeStrong((id *)&self->_sigIntSrc, 0);
}

- (void)materializeURL:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_4(&dword_1D744C000, v0, v1, "[ERROR] no provider domain for path: %@", v2, v3, v4, v5, v6);
}

void __39__FPDServer_materializeURL_completion___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1D744C000, a2, OS_LOG_TYPE_ERROR, "[ERROR] materialization failed: %@", v4, 0xCu);
}

void __25__FPDServer__finishSetup__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __25__FPDServer__finishSetup__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] can't set activity state to CONTINUE, process might be killed before completion of maintenance task", v2, v3, v4, v5, v6);
}

void __25__FPDServer__finishSetup__block_invoke_75_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] can't set activity state to DONE", v2, v3, v4, v5, v6);
}

void __25__FPDServer__finishSetup__block_invoke_75_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1D744C000, v0, v1, "[DEBUG] task to remove old trashed items complete", v2, v3, v4, v5, v6);
}

void __18__FPDServer_start__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx continue startup in utility", (uint8_t *)&v3, 0xCu);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] denying connection because the device is locked", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_5(&dword_1D744C000, v0, v1, "[ERROR] denying connection because the device is not set up", v2, v3, v4, v5, v6);
}

@end