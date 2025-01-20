@interface ABCAdministrator
+ (id)sharedInstance;
- (ABCAdministrator)init;
- (ABCConfigurationManager)configurationManager;
- (ABCPersistentStoreController)storeController;
- (AutoBugCaptureCacheDelete)cacheDeleteHandler;
- (CloudKitUploadController)ckUploadController;
- (DiagnosticCaseManager)caseManager;
- (DiagnosticExtensionController)diagExtensionController;
- (DiagnosticLiaison)diagnosticLiaison;
- (DiagnosticStorageManager)storageManager;
- (id)autoBugCaptureConfig;
- (id)getDiagnosticLiaison;
- (id)internalStateDictionary;
- (int)autoBugCaptureState;
- (void)administrativelyDiableAutoBugCapture;
- (void)administrativelyEnableAutoBugCapture;
- (void)continueStartingAutoBugCapture;
- (void)deregisterIDS;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)persistentStoreControllerReadyForUse:(id)a3;
- (void)prepareLogArchiveDirectory:(id)a3 uid:(id)a4 gid:(id)a5;
- (void)registerIDS;
- (void)scheduleDiagnosticsMaintenanceActivity;
- (void)setAutoBugCaptureState:(int)a3;
- (void)setCacheDeleteHandler:(id)a3;
- (void)setCaseManager:(id)a3;
- (void)setCkUploadController:(id)a3;
- (void)setConfigurationManager:(id)a3;
- (void)setDiagExtensionController:(id)a3;
- (void)setDiagnosticLiaison:(id)a3;
- (void)setStorageManager:(id)a3;
- (void)setStoreController:(id)a3;
- (void)shutdown;
- (void)startAutoBugCaptureAdministrative:(BOOL)a3;
- (void)startAutoBugCaptureAdministrative:(BOOL)a3 parameters:(id)a4;
- (void)startEssentialServices;
- (void)startUploadTaskScheduler;
- (void)startup;
- (void)stopAutoBugCapture:(BOOL)a3;
- (void)stopEssentialServices;
- (void)stopUploadTaskScheduler;
@end

@implementation ABCAdministrator

+ (id)sharedInstance
{
  if (sharedInstance_sharedInstancePred != -1) {
    dispatch_once(&sharedInstance_sharedInstancePred, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_sharedInstance_2;

  return v2;
}

uint64_t __34__ABCAdministrator_sharedInstance__block_invoke()
{
  if (IDSBAASignerErrorDomain_block_invoke_oncePred != -1) {
    dispatch_once(&IDSBAASignerErrorDomain_block_invoke_oncePred, &__block_literal_global_6);
  }
  sharedInstance_sharedInstance_2 = objc_alloc_init(ABCAdministrator);

  return MEMORY[0x270F9A758]();
}

uint64_t __34__ABCAdministrator_sharedInstance__block_invoke_2()
{
  dispatch_semaphore_t v0 = dispatch_semaphore_create(0);
  v1 = (void *)waitFirstUnlock;
  waitFirstUnlock = (uint64_t)v0;

  v2 = MEMORY[0x263EF83A0];

  return notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &firstUnlockToken, v2, &__block_literal_global_10);
}

uint64_t __34__ABCAdministrator_sharedInstance__block_invoke_3()
{
  dispatch_semaphore_signal((dispatch_semaphore_t)waitFirstUnlock);
  int v0 = firstUnlockToken;

  return notify_cancel(v0);
}

- (ABCAdministrator)init
{
  v7.receiver = self;
  v7.super_class = (Class)ABCAdministrator;
  v2 = [(ABCAdministrator *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.autobugcapture.administration", v3);
    adminQueue = v2->adminQueue;
    v2->adminQueue = (OS_dispatch_queue *)v4;

    v2->_autoBugCaptureState = 1;
  }
  return v2;
}

- (void)persistentStoreControllerReadyForUse:(id)a3
{
  adminQueue = self->adminQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ABCAdministrator_persistentStoreControllerReadyForUse___block_invoke;
  block[3] = &unk_263FC2DC0;
  block[4] = self;
  dispatch_async(adminQueue, block);
}

uint64_t __57__ABCAdministrator_persistentStoreControllerReadyForUse___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueStartingAutoBugCapture];
}

- (void)startEssentialServices
{
  v3 = objc_alloc_init(ABCConfigurationManager);
  [(ABCAdministrator *)self setConfigurationManager:v3];

  [(ABCAdministrator *)self registerIDS];
  dispatch_queue_t v4 = adminLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "Initializing AutoBugCapture XPC service", buf, 2u);
  }

  v5 = objc_alloc_init(DiagnosticsTransport);
  diagTransport = self->diagTransport;
  self->diagTransport = v5;

  objc_super v7 = [(ABCAdministrator *)self configurationManager];
  [v7 addObserver:self forKeyPath:@"autoBugCaptureEnabled" options:1 context:0];

  v8 = adminLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Initializing CacheDelete handlers", v10, 2u);
  }

  v9 = [[AutoBugCaptureCacheDelete alloc] initWithStorageManager:0];
  [(ABCAdministrator *)self setCacheDeleteHandler:v9];
}

- (void)stopEssentialServices
{
  [(ABCAdministrator *)self deregisterIDS];
  if (self->diagTransport)
  {
    v3 = adminLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Stopping AutoBugCapture XPC services", buf, 2u);
    }

    [(DiagnosticsTransport *)self->diagTransport shutdown];
    diagTransport = self->diagTransport;
    self->diagTransport = 0;
  }
  v5 = [(ABCAdministrator *)self configurationManager];
  [v5 removeObserver:self forKeyPath:@"autoBugCaptureEnabled" context:0];

  [(ABCAdministrator *)self setConfigurationManager:0];
  v6 = [(ABCAdministrator *)self cacheDeleteHandler];

  if (v6)
  {
    objc_super v7 = adminLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Stopping CacheDelete handlers", v8, 2u);
    }

    [(ABCAdministrator *)self setCacheDeleteHandler:0];
  }
}

- (id)getDiagnosticLiaison
{
  v3 = [(ABCAdministrator *)self diagnosticLiaison];

  if (!v3)
  {
    dispatch_queue_t v4 = objc_alloc_init(DiagnosticLiaison);
    [(ABCAdministrator *)self setDiagnosticLiaison:v4];
  }

  return [(ABCAdministrator *)self diagnosticLiaison];
}

- (void)registerIDS
{
  v3 = [(ABCAdministrator *)self configurationManager];
  int v4 = [v3 autoBugCaptureAvailable];

  if (v4)
  {
    id v5 = [(ABCAdministrator *)self getDiagnosticLiaison];
    [v5 registerAdministrativeTransports];
  }
}

- (void)deregisterIDS
{
  v3 = [(ABCAdministrator *)self diagnosticLiaison];

  if (v3)
  {
    int v4 = [(ABCAdministrator *)self diagnosticLiaison];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __33__ABCAdministrator_deregisterIDS__block_invoke;
    v5[3] = &unk_263FC2DC0;
    v5[4] = self;
    [v4 unregisterAllTransports:v5];
  }
}

uint64_t __33__ABCAdministrator_deregisterIDS__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDiagnosticLiaison:0];
}

- (void)scheduleDiagnosticsMaintenanceActivity
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v4[3] = 0;
  adminQueue = self->adminQueue;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __58__ABCAdministrator_scheduleDiagnosticsMaintenanceActivity__block_invoke;
  v3[3] = &unk_263FC3808;
  v3[4] = self;
  v3[5] = v4;
  +[ABCPeriodicMaintenanceActivity registerPeriodicActivityWithIdentifier:@"Administrator.DailyCleanup" queue:adminQueue activity:v3];
  _Block_object_dispose(v4, 8);
}

uint64_t __58__ABCAdministrator_scheduleDiagnosticsMaintenanceActivity__block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  [*(id *)(*(void *)(a1 + 32) + 80) cleanupDiagnosticCaseStorage];
  [*(id *)(*(void *)(a1 + 32) + 80) cleanupDiagnosticCaseSummary];
  [*(id *)(*(void *)(a1 + 32) + 80) cleanupUploadRecord];
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) statsManager];
  [v2 cleanupDiagnosticCaseUsage];

  v3 = *(void **)(*(void *)(a1 + 32) + 64);

  return [v3 updateAverageCasesPerDay];
}

- (void)startUploadTaskScheduler
{
  BOOL v3 = [(ABCConfigurationManager *)self->_configurationManager cloudKitEnabled];
  int v4 = adminLogHandle();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Scheduling periodic upload tasks", buf, 2u);
    }

    uploadController = self->_uploadController;
    if (uploadController)
    {
      [(CloudKitUploadController *)uploadController registerCloudKitUploadActivities];
      return;
    }
    id v5 = adminLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      objc_super v7 = "No log upload controller allocated. Cannot schedule periodic upload tasks!";
      v8 = v10;
      goto LABEL_10;
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v9 = 0;
    objc_super v7 = "CloudKit uploading is not enabled";
    v8 = (uint8_t *)&v9;
LABEL_10:
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
  }
}

- (void)stopUploadTaskScheduler
{
  v2 = adminLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Unscheduling periodic upload tasks", v3, 2u);
  }

  +[CloudKitUploadController unregisterCloudKitUploadActivities];
}

- (void)administrativelyEnableAutoBugCapture
{
  if (!self->_autoBugCaptureAdministrativelyEnabled)
  {
    self->_autoBugCaptureAdministrativelyEnabled = 1;
    BOOL v3 = adminLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Administratively enabling AutoBugCapture", v4, 2u);
    }

    [(ABCAdministrator *)self startAutoBugCaptureAdministrative:1];
  }
}

- (void)administrativelyDiableAutoBugCapture
{
  if (self->_autoBugCaptureAdministrativelyEnabled)
  {
    self->_autoBugCaptureAdministrativelyEnabled = 0;
    BOOL v3 = adminLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Administratively disabling AutoBugCapture", v6, 2u);
    }

    int v4 = [(ABCAdministrator *)self storageManager];
    [v4 purgeAttachmentsForAllCases];

    id v5 = [(ABCAdministrator *)self caseManager];
    [v5 resetDiagnosticCaseStorage];

    [(ABCAdministrator *)self stopAutoBugCapture:1];
  }
}

- (void)startAutoBugCaptureAdministrative:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = adminLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Preparing to start AutoBugCapture...", (uint8_t *)v16, 2u);
  }

  int v6 = MKBDeviceUnlockedSinceBoot();
  objc_super v7 = adminLogHandle();
  v8 = v7;
  if (v6 == 1)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16[0]) = 0;
      __int16 v9 = "Device is ready for AutoBugCapture";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_209DBA000, v10, v11, v9, (uint8_t *)v16, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_DEFAULT, "Device not yet ready. Waiting for first unlock...", (uint8_t *)v16, 2u);
    }

    dispatch_semaphore_wait((dispatch_semaphore_t)waitFirstUnlock, 0xFFFFFFFFFFFFFFFFLL);
    int v12 = MKBDeviceUnlockedSinceBoot();
    if (v12 != 1)
    {
      int v13 = v12;
      v14 = adminLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v16[0] = 67109120;
        v16[1] = v13;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "Unexpected first-unlock event, %d", (uint8_t *)v16, 8u);
      }
    }
    v8 = adminLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      __int16 v9 = "Device is now ready for AutoBugCapture";
      v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_14;
    }
  }

  v15 = [(ABCAdministrator *)self autoBugCaptureConfig];
  [(ABCAdministrator *)self startAutoBugCaptureAdministrative:v3 parameters:v15];
}

- (void)startAutoBugCaptureAdministrative:(BOOL)a3 parameters:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  objc_super v7 = adminLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Starting AutoBugCapture with parameters: %@", buf, 0xCu);
  }

  if ([(ABCAdministrator *)self autoBugCaptureState] <= 1)
  {
    [(ABCAdministrator *)self setAutoBugCaptureState:2];
    v8 = [(ABCConfigurationManager *)self->_configurationManager logArchivePath];
    __int16 v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ABCConfigurationManager logArchiveUID](self->_configurationManager, "logArchiveUID"));
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[ABCConfigurationManager logArchiveGID](self->_configurationManager, "logArchiveGID"));
    [(ABCAdministrator *)self prepareLogArchiveDirectory:v8 uid:v9 gid:v10];

    os_log_type_t v11 = adminLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "Initializing persistent storage", buf, 2u);
    }

    int v12 = [ABCPersistentStoreController alloc];
    int v13 = [(ABCAdministrator *)self configurationManager];
    v14 = [v13 databaseContainerPath];
    v15 = [(ABCPersistentStoreController *)v12 initWithDirectory:v14];
    [(ABCAdministrator *)self setStoreController:v15];

    v16 = [(ABCAdministrator *)self storeController];
    [v16 setDelegate:self];

    uint64_t v17 = [(ABCAdministrator *)self getDiagnosticLiaison];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __65__ABCAdministrator_startAutoBugCaptureAdministrative_parameters___block_invoke;
    v18[3] = &unk_263FC3830;
    BOOL v19 = a3;
    v18[4] = self;
    [v17 registerAutoBugCaptureTransports:v18];
  }
}

void __65__ABCAdministrator_startAutoBugCaptureAdministrative_parameters___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = adminLogHandle();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "ABC administratively enabled. Enabling ABC on remote devices.", v4, 2u);
    }

    BOOL v3 = [*(id *)(a1 + 32) diagnosticLiaison];
    [v3 remotelyEnableAutoBugCapture:&__block_literal_global_28];
  }
}

void __65__ABCAdministrator_startAutoBugCaptureAdministrative_parameters___block_invoke_26()
{
  int v0 = adminLogHandle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_209DBA000, v0, OS_LOG_TYPE_DEBUG, "Finished remotely enabling ABC.", v1, 2u);
  }
}

- (void)continueStartingAutoBugCapture
{
  if ([(ABCAdministrator *)self autoBugCaptureState] == 2)
  {
    BOOL v3 = adminLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Initializing case management", v34, 2u);
    }

    int v4 = [DiagnosticCaseManager alloc];
    id v5 = [(ABCAdministrator *)self storeController];
    id v6 = [v5 workspace];
    objc_super v7 = [(ABCAdministrator *)self diagnosticLiaison];
    v8 = [(DiagnosticCaseManager *)v4 initWithWorkspace:v6 liaison:v7];
    [(ABCAdministrator *)self setCaseManager:v8];

    __int16 v9 = [(ABCAdministrator *)self caseManager];
    [v9 forceCloseDiagnosticCaseStorage];

    v10 = adminLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Initializing diagnostic extension controller", v34, 2u);
    }

    os_log_type_t v11 = objc_alloc_init(DiagnosticExtensionController);
    [(ABCAdministrator *)self setDiagExtensionController:v11];

    int v12 = adminLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "Initializing storage management", v34, 2u);
    }

    int v13 = [DiagnosticStorageManager alloc];
    v14 = [(ABCAdministrator *)self storeController];
    v15 = [(ABCConfigurationManager *)self->_configurationManager logArchivePath];
    v16 = [(DiagnosticStorageManager *)v13 initWithPersistentStoreController:v14 logArchiveDirectory:v15];
    [(ABCAdministrator *)self setStorageManager:v16];

    uint64_t v17 = [(ABCAdministrator *)self storageManager];
    v18 = [(ABCAdministrator *)self caseManager];
    [v18 setStorageDelegate:v17];

    BOOL v19 = [(ABCAdministrator *)self cacheDeleteHandler];

    v20 = adminLogHandle();
    id v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEFAULT, "Configuring CacheDelete handler with storage management", v34, 2u);
      }

      uint64_t v22 = [(ABCAdministrator *)self storageManager];
      v23 = [(ABCAdministrator *)self cacheDeleteHandler];
      [v23 setStorageManager:v22];

      id v21 = [(ABCAdministrator *)self cacheDeleteHandler];
      [v21 initCacheDeletePurgeMonitor];
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "CacheDelete handler is unexpectedly nil", v34, 2u);
    }

    v24 = [(ABCAdministrator *)self configurationManager];
    int v25 = [v24 cloudKitEnabled];

    v26 = adminLogHandle();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, "Initializing CloudKit upload controller", v34, 2u);
      }

      v28 = [CloudKitUploadController alloc];
      v29 = [(ABCAdministrator *)self storeController];
      v30 = [v29 workspace];
      v31 = [(CloudKitUploadController *)v28 initWithWorkspace:v30];
      uploadController = self->_uploadController;
      self->_uploadController = v31;

      [(ABCAdministrator *)self startUploadTaskScheduler];
    }
    else
    {
      if (v27)
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, "CloudKit upload is disabled - not initializing", v34, 2u);
      }

      [(ABCAdministrator *)self stopUploadTaskScheduler];
    }
    v33 = adminLogHandle();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_209DBA000, v33, OS_LOG_TYPE_DEFAULT, "Completed startup of all AutoBugCapture services", v34, 2u);
    }

    [(ABCAdministrator *)self setAutoBugCaptureState:3];
  }
}

- (void)stopAutoBugCapture:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = adminLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Stopping AutoBugCapture services", buf, 2u);
  }

  [(ABCAdministrator *)self setAutoBugCaptureState:4];
  id v6 = adminLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "Stopping XPC services", v20, 2u);
  }

  [(DiagnosticsTransport *)self->diagTransport shutdown];
  diagTransport = self->diagTransport;
  self->diagTransport = 0;

  v8 = adminLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v19 = 0;
    _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "Stopping persistent storage", v19, 2u);
  }

  __int16 v9 = [(ABCAdministrator *)self storeController];
  [v9 shutdown];

  [(ABCAdministrator *)self setStoreController:0];
  if (v3)
  {
    v10 = [(ABCAdministrator *)self diagnosticLiaison];
    [v10 remotelyDisableAutoBugCapture:&__block_literal_global_33];

    [(ABCAdministrator *)self stopUploadTaskScheduler];
  }
  os_log_type_t v11 = adminLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Stopping case management", v18, 2u);
  }

  [(ABCAdministrator *)self setCaseManager:0];
  int v12 = adminLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "Stopping storage management", v17, 2u);
  }

  [(ABCAdministrator *)self setStorageManager:0];
  int v13 = adminLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "Stopping diagnostic extension controller", v16, 2u);
  }

  [(ABCAdministrator *)self setDiagExtensionController:0];
  v14 = adminLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "Stopping CacheDelete handlers", v15, 2u);
  }

  [(ABCAdministrator *)self setCacheDeleteHandler:0];
  [(ABCAdministrator *)self setAutoBugCaptureState:1];
}

- (void)prepareLogArchiveDirectory:(id)a3 uid:(id)a4 gid:(id)a5
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [MEMORY[0x263F08850] defaultManager];
  char v66 = 0;
  int v11 = [v10 fileExistsAtPath:v7 isDirectory:&v66];
  if (v66) {
    char v12 = v11;
  }
  else {
    char v12 = 0;
  }
  if (v11)
  {
    if (v66)
    {
      id v13 = 0;
      goto LABEL_21;
    }
    id v65 = 0;
    int v14 = [v10 removeItemAtPath:v7 error:&v65];
    id v15 = v65;
    if (v14)
    {
      v16 = adminLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v74 = v7;
        uint64_t v17 = "Successfully removed file at %@";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
LABEL_15:
        _os_log_impl(&dword_209DBA000, v18, v19, v17, buf, 0xCu);
      }
    }
    else
    {
      v16 = adminLogHandle();
      BOOL v20 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v15)
      {
        if (v20)
        {
          id v21 = [v15 localizedFailureReason];
          *(_DWORD *)buf = 138412546;
          id v74 = v7;
          __int16 v75 = 2112;
          v76 = v21;
          _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_ERROR, "Failed to remove file at %@. (%@)", buf, 0x16u);
        }
        goto LABEL_16;
      }
      if (v20)
      {
        *(_DWORD *)buf = 138412290;
        id v74 = v7;
        uint64_t v17 = "Failed to remove file at %@";
        v18 = v16;
        os_log_type_t v19 = OS_LOG_TYPE_ERROR;
        goto LABEL_15;
      }
    }
LABEL_16:
  }
  if ((v12 & 1) == 0)
  {
    uint64_t v22 = *MEMORY[0x263F08050];
    v71[0] = *MEMORY[0x263F08078];
    v71[1] = v22;
    v72[0] = &unk_26BDF58A0;
    v72[1] = v8;
    v71[2] = *MEMORY[0x263F08018];
    v72[2] = v9;
    v23 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:3];
    id v64 = 0;
    int v24 = [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:v23 error:&v64];
    id v13 = v64;
    if (!v24)
    {
      v41 = adminLogHandle();
      BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v13)
      {
        if (v42)
        {
          v43 = [v13 localizedFailureReason];
          *(_DWORD *)buf = 138412546;
          id v74 = v7;
          __int16 v75 = 2112;
          v76 = v43;
          _os_log_impl(&dword_209DBA000, v41, OS_LOG_TYPE_ERROR, "Failed to create log archive directory at %@. (%@)", buf, 0x16u);
        }
      }
      else
      {
        if (v42)
        {
          *(_DWORD *)buf = 138412290;
          id v74 = v7;
          _os_log_impl(&dword_209DBA000, v41, OS_LOG_TYPE_ERROR, "Failed to create log archive directory at %@", buf, 0xCu);
        }
        id v13 = 0;
      }
      goto LABEL_58;
    }

LABEL_21:
    int v25 = [v10 attributesOfItemAtPath:v7 error:0];
    v23 = v25;
    if (!v25)
    {
LABEL_59:

      goto LABEL_60;
    }
    v61 = v10;
    id v26 = v13;
    id v27 = v9;
    uint64_t v28 = [v25 filePosixPermissions];
    v29 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08050]];
    uint64_t v30 = *MEMORY[0x263F08018];
    v31 = [v23 objectForKeyedSubscript:*MEMORY[0x263F08018]];
    v59 = v29;
    id v60 = v8;
    int v32 = [v29 isEqual:v8];
    int v33 = [v31 isEqual:v27];
    int v34 = [&unk_26BDF58A0 shortValue];
    uint64_t v35 = v34;
    if (v32) {
      BOOL v36 = v33 == 0;
    }
    else {
      BOOL v36 = 1;
    }
    uint64_t v58 = v28;
    BOOL v37 = !v36 && v28 == v34;
    id v9 = v27;
    id v13 = v26;
    if (!v37)
    {
      v57 = v31;
      v38 = storageLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v38, OS_LOG_TYPE_DEFAULT, "Log archive directory path requires repairing...", buf, 2u);
      }

      if (v32)
      {
        if (v33)
        {
          v39 = 0;
          v31 = v57;
          v40 = v61;
        }
        else
        {
          uint64_t v69 = v30;
          id v70 = v9;
          v45 = [NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
          id v63 = 0;
          v40 = v61;
          int v46 = [v61 setAttributes:v45 ofItemAtPath:v7 error:&v63];
          v39 = v63;

          v47 = adminLogHandle();
          v48 = v47;
          if (v46)
          {
            v31 = v57;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              int v49 = [v9 shortValue];
              *(_DWORD *)buf = 67109120;
              LODWORD(v74) = v49;
              _os_log_impl(&dword_209DBA000, v48, OS_LOG_TYPE_DEFAULT, "Repaired group ownership to %d", buf, 8u);
            }
          }
          else
          {
            v31 = v57;
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            {
              v50 = [v39 localizedFailureReason];
              *(_DWORD *)buf = 138412546;
              id v74 = v7;
              __int16 v75 = 2112;
              v76 = v50;
              _os_log_impl(&dword_209DBA000, v48, OS_LOG_TYPE_ERROR, "Unable to fix group for %@: %@", buf, 0x16u);

              v31 = v57;
            }
          }
        }
        if (v58 == v35)
        {
          v44 = v39;
        }
        else
        {
          uint64_t v67 = *MEMORY[0x263F08078];
          v68 = &unk_26BDF58A0;
          v51 = [NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
          v62 = v39;
          int v52 = [v40 setAttributes:v51 ofItemAtPath:v7 error:&v62];
          v44 = v62;

          v53 = adminLogHandle();
          v54 = v53;
          if (v52)
          {
            v31 = v57;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              int v55 = [&unk_26BDF58A0 shortValue];
              *(_DWORD *)buf = 67109120;
              LODWORD(v74) = v55;
              _os_log_impl(&dword_209DBA000, v54, OS_LOG_TYPE_DEFAULT, "Repaired permission to %od", buf, 8u);
            }
          }
          else
          {
            v31 = v57;
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v56 = [v44 localizedFailureReason];
              *(_DWORD *)buf = 138412546;
              id v74 = v7;
              __int16 v75 = 2112;
              v76 = v56;
              _os_log_impl(&dword_209DBA000, v54, OS_LOG_TYPE_ERROR, "Unable to fix permission for %@: %@", buf, 0x16u);

              v31 = v57;
            }
          }
        }
      }
      else
      {
        v44 = adminLogHandle();
        v31 = v57;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v74 = v7;
          _os_log_impl(&dword_209DBA000, v44, OS_LOG_TYPE_ERROR, "Incorrect ownership for %@. (Log collection may not work correctly)", buf, 0xCu);
        }
      }
    }
    v41 = v59;
    id v8 = v60;
    v10 = v61;
LABEL_58:

    goto LABEL_59;
  }
  id v13 = 0;
LABEL_60:
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = *MEMORY[0x263F081B8];
  int v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  if ([v8 isEqualToString:@"autoBugCaptureEnabled"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_5;
    }
    char v12 = v11;
    int v14 = adminLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v22) = [v12 BOOLValue];
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEFAULT, "KVO: autoBugCaptureEnabled is %d", buf, 8u);
    }

    int v15 = [v12 BOOLValue];
    adminQueue = self->adminQueue;
    if (v15)
    {
      uint64_t v17 = v20;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v18 = __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke;
    }
    else
    {
      uint64_t v17 = v19;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v18 = __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    }
    v17[2] = v18;
    v17[3] = &unk_263FC2DC0;
    v17[4] = self;
    dispatch_async(adminQueue, v17);
  }
  else
  {
    char v12 = adminLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = [v9 objectForKeyedSubscript:v10];
      *(_DWORD *)buf = 138412546;
      id v22 = v8;
      __int16 v23 = 2112;
      int v24 = v13;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "KVO: unknown keypath (%@) observed with value %@", buf, 0x16u);
    }
  }

LABEL_5:
}

uint64_t __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) administrativelyEnableAutoBugCapture];
}

uint64_t __67__ABCAdministrator_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) administrativelyDiableAutoBugCapture];
}

- (void)startup
{
  adminQueue = self->adminQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__ABCAdministrator_startup__block_invoke;
  block[3] = &unk_263FC2DC0;
  block[4] = self;
  dispatch_async(adminQueue, block);
}

uint64_t __27__ABCAdministrator_startup__block_invoke(uint64_t a1)
{
  v2 = adminLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEFAULT, "Starting up daemon", v7, 2u);
  }

  [*(id *)(a1 + 32) startEssentialServices];
  [*(id *)(a1 + 32) startMaintenanceServices];
  BOOL v3 = [*(id *)(a1 + 32) configurationManager];
  int v4 = [v3 autoBugCaptureEnabled];

  id v5 = *(void **)(a1 + 32);
  if (v4) {
    return [v5 startAutoBugCaptureAdministrative:0];
  }
  else {
    return [v5 stopUploadTaskScheduler];
  }
}

- (void)shutdown
{
  adminQueue = self->adminQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__ABCAdministrator_shutdown__block_invoke;
  block[3] = &unk_263FC2DC0;
  block[4] = self;
  dispatch_async(adminQueue, block);
}

uint64_t __28__ABCAdministrator_shutdown__block_invoke(uint64_t a1)
{
  v2 = adminLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEFAULT, "Shutting down daemon", v4, 2u);
  }

  [*(id *)(a1 + 32) stopAutoBugCapture:0];
  [*(id *)(a1 + 32) stopMaintenanceServices];
  return [*(id *)(a1 + 32) stopEssentialServices];
}

- (id)autoBugCaptureConfig
{
  return 0;
}

- (id)internalStateDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v4 = objc_msgSend(NSNumber, "numberWithInt:", -[ABCAdministrator autoBugCaptureState](self, "autoBugCaptureState") > 1);
  [v3 setObject:v4 forKeyedSubscript:@"serviceEnabled"];

  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[ABCAdministrator autoBugCaptureState](self, "autoBugCaptureState"));
  [v3 setObject:v5 forKeyedSubscript:@"serviceState"];

  id v6 = NSNumber;
  id v7 = [(ABCAdministrator *)self configurationManager];
  id v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "arbitratorDailyCountLimit"));
  [v3 setObject:v8 forKeyedSubscript:@"dailyCaseLimit"];

  id v9 = [(ABCAdministrator *)self configurationManager];
  LODWORD(v7) = [v9 disableAPIRateLimit];

  if (v7)
  {
    [v3 setObject:&unk_26BDF58B8 forKeyedSubscript:@"apiRateLimit"];
    [v3 setObject:&unk_26BDF58B8 forKeyedSubscript:@"apiLimitWindow"];
  }
  else
  {
    uint64_t v10 = NSNumber;
    int v11 = [(ABCAdministrator *)self configurationManager];
    [v11 apiRateLimit];
    char v12 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v12 forKeyedSubscript:@"apiRateLimit"];

    id v13 = NSNumber;
    int v14 = [(ABCAdministrator *)self configurationManager];
    [v14 apiLimitWindow];
    int v15 = objc_msgSend(v13, "numberWithDouble:");
    [v3 setObject:v15 forKeyedSubscript:@"apiLimitWindow"];
  }
  v16 = NSNumber;
  uint64_t v17 = [(ABCAdministrator *)self configurationManager];
  v18 = objc_msgSend(v16, "numberWithBool:", objc_msgSend(v17, "cloudKitEnabled"));
  [v3 setObject:v18 forKeyedSubscript:@"ckEnabled"];

  os_log_type_t v19 = [(ABCAdministrator *)self configurationManager];
  LODWORD(v17) = [v19 cloudKitEnabled];

  if (v17)
  {
    BOOL v20 = [(ABCAdministrator *)self configurationManager];
    if ([v20 cloudKitSandboxEnvironment]) {
      id v21 = @"Sandbox";
    }
    else {
      id v21 = @"Production";
    }
    [v3 setObject:v21 forKeyedSubscript:@"ckEnvironment"];

    id v22 = [(ABCAdministrator *)self configurationManager];
    __int16 v23 = [v22 cloudKitContainerIdentifier];
    [v3 setObject:v23 forKeyedSubscript:@"ckContainerID"];

    int v24 = [(ABCAdministrator *)self configurationManager];
    uint64_t v25 = [v24 cloudKitInvernessService];
    [v3 setObject:v25 forKeyedSubscript:@"ckInvernessID"];

    id v26 = NSNumber;
    id v27 = [(ABCAdministrator *)self configurationManager];
    [v27 cloudKitTimeoutIntervalForResource];
    uint64_t v28 = objc_msgSend(v26, "numberWithDouble:");
    [v3 setObject:v28 forKeyedSubscript:@"ckTimeoutForResource"];

    v29 = NSNumber;
    uint64_t v30 = [(ABCAdministrator *)self configurationManager];
    [v30 cloudKitTimeoutIntervalForRequest];
    v31 = objc_msgSend(v29, "numberWithDouble:");
    [v3 setObject:v31 forKeyedSubscript:@"ckTimeoutForRequest"];

    int v32 = NSNumber;
    int v33 = [(ABCAdministrator *)self configurationManager];
    int v34 = objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "cloudKitFallbackMaximumLogCount"));
    [v3 setObject:v34 forKeyedSubscript:@"ckUploadFallbackCount"];

    uint64_t v35 = NSNumber;
    BOOL v36 = [(ABCAdministrator *)self configurationManager];
    BOOL v37 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v36, "maxCaseSummaryPerSubmission"));
    [v3 setObject:v37 forKeyedSubscript:@"ckSummaryMaxPerSubmission"];

    v38 = NSNumber;
    v39 = [(ABCAdministrator *)self configurationManager];
    v40 = objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "submittedCaseSummaryRetentionDays"));
    [v3 setObject:v40 forKeyedSubscript:@"ckSummarySubRetDays"];

    v41 = NSNumber;
    BOOL v42 = [(ABCAdministrator *)self configurationManager];
    v43 = objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "unsubmittedCaseSummaryRetentionDays"));
    [v3 setObject:v43 forKeyedSubscript:@"ckSummaryUnsubRetDays"];
  }
  v44 = NSNumber;
  v45 = [(ABCAdministrator *)self configurationManager];
  int v46 = objc_msgSend(v44, "numberWithBool:", objc_msgSend(v45, "submitToDiagnosticPipeline"));
  [v3 setObject:v46 forKeyedSubscript:@"dpSubmission"];

  v47 = NSNumber;
  v48 = [(ABCAdministrator *)self configurationManager];
  [v48 diagnosticPipelineSubmissionRate];
  int v49 = objc_msgSend(v47, "numberWithDouble:");
  [v3 setObject:v49 forKeyedSubscript:@"dpSubmissionRate"];

  v50 = [(ABCAdministrator *)self configurationManager];
  LODWORD(v48) = [v50 arbitratorDisableDampening];

  if (v48) {
    [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"overrideDisableDampening"];
  }
  v51 = [(ABCAdministrator *)self configurationManager];
  int v52 = objc_msgSend(v51, "disable_internal_build");
  [v3 setObject:v52 forKeyedSubscript:@"overrideDisableInternalBuild"];

  v53 = [(ABCAdministrator *)self configurationManager];
  v54 = objc_msgSend(v53, "carrier_seed_flag");
  [v3 setObject:v54 forKeyedSubscript:@"overrideCarrierSeed"];

  int v55 = [(ABCAdministrator *)self configurationManager];
  v56 = objc_msgSend(v55, "seed_flag");
  [v3 setObject:v56 forKeyedSubscript:@"overrideSeedBuild"];

  v57 = [(ABCAdministrator *)self configurationManager];
  uint64_t v58 = objc_msgSend(v57, "vendor_flag");
  [v3 setObject:v58 forKeyedSubscript:@"overrideVendorBuild"];

  v59 = [(ABCAdministrator *)self configurationManager];
  id v60 = objc_msgSend(v59, "npi_flag");
  [v3 setObject:v60 forKeyedSubscript:@"overrideNPI"];

  v61 = +[SystemProperties sharedInstance];
  v62 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v61, "internalBuild"));
  [v3 setObject:v62 forKeyedSubscript:@"internalBuild"];

  id v63 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v61, "carrierBuild"));
  [v3 setObject:v63 forKeyedSubscript:@"carrierBuild"];

  id v64 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v61, "vendorBuild"));
  [v3 setObject:v64 forKeyedSubscript:@"vendorBuild"];

  id v65 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v61, "customerBuild"));
  [v3 setObject:v65 forKeyedSubscript:@"customerBuild"];

  char v66 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v61, "seedBuild"));
  [v3 setObject:v66 forKeyedSubscript:@"seedBuild"];

  uint64_t v67 = NSNumber;
  v68 = [(ABCAdministrator *)self configurationManager];
  uint64_t v69 = objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "isAutomatedDeviceGroup"));
  [v3 setObject:v69 forKeyedSubscript:@"automatedDeviceGroup"];

  id v70 = NSNumber;
  v71 = [(ABCAdministrator *)self configurationManager];
  v72 = objc_msgSend(v70, "numberWithBool:", objc_msgSend(v71, "hasAppleEmail"));
  [v3 setObject:v72 forKeyedSubscript:@"hasAppleEmail"];

  v73 = NSNumber;
  id v74 = [(ABCAdministrator *)self configurationManager];
  __int16 v75 = objc_msgSend(v73, "numberWithBool:", objc_msgSend(v74, "isCarryDevice"));
  [v3 setObject:v75 forKeyedSubscript:@"carryDevice"];

  v76 = [(ABCAdministrator *)self caseManager];
  [v76 addToInternalStateDictionary:v3];

  return v3;
}

- (CloudKitUploadController)ckUploadController
{
  return self->_uploadController;
}

- (void)setCkUploadController:(id)a3
{
}

- (int)autoBugCaptureState
{
  return self->_autoBugCaptureState;
}

- (void)setAutoBugCaptureState:(int)a3
{
  self->_autoBugCaptureState = a3;
}

- (DiagnosticExtensionController)diagExtensionController
{
  return self->_diagExtensionController;
}

- (void)setDiagExtensionController:(id)a3
{
}

- (AutoBugCaptureCacheDelete)cacheDeleteHandler
{
  return self->_cacheDeleteHandler;
}

- (void)setCacheDeleteHandler:(id)a3
{
}

- (DiagnosticCaseManager)caseManager
{
  return self->_caseManager;
}

- (void)setCaseManager:(id)a3
{
}

- (DiagnosticStorageManager)storageManager
{
  return self->_storageManager;
}

- (void)setStorageManager:(id)a3
{
}

- (ABCPersistentStoreController)storeController
{
  return self->_storeController;
}

- (void)setStoreController:(id)a3
{
}

- (ABCConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
}

- (DiagnosticLiaison)diagnosticLiaison
{
  return self->_diagnosticLiaison;
}

- (void)setDiagnosticLiaison:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLiaison, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_storeController, 0);
  objc_storeStrong((id *)&self->_storageManager, 0);
  objc_storeStrong((id *)&self->_caseManager, 0);
  objc_storeStrong((id *)&self->_cacheDeleteHandler, 0);
  objc_storeStrong((id *)&self->_diagExtensionController, 0);
  objc_storeStrong((id *)&self->diagTransport, 0);
  objc_storeStrong((id *)&self->diagCollectionTransport, 0);
  objc_storeStrong((id *)&self->adminQueue, 0);

  objc_storeStrong((id *)&self->_uploadController, 0);
}

@end