@interface AVTCoreDataStoreServer
+ (BOOL)resetSyncShouldPreserveContentForReason:(unint64_t)a3;
- (AVTAvatarRecordChangeTracker)changeTracker;
- (AVTAvatarsDaemonServer)daemonServer;
- (AVTBlockScheduler)blockScheduler;
- (AVTCoreDataCloudKitMirroringHandler)mirroringHandler;
- (AVTCoreDataPersistentStoreLocalConfiguration)configuration;
- (AVTCoreDataRemoteChangesObserver)remoteChangesObserver;
- (AVTCoreDataStoreMaintenance)storeMaintenance;
- (AVTCoreDataStoreServer)initWithEnvironment:(id)a3 imageHandlingDelegate:(id)a4;
- (AVTCoreDataStoreServer)initWithLocalBackend:(id)a3 configuration:(id)a4 migratorProvider:(id)a5 pushSupport:(id)a6 mirroringHandler:(id)a7 schedulingAuthority:(id)a8 remoteChangesObserver:(id)a9 stickerChangeObserver:(id)a10 changeTracker:(id)a11 daemonServer:(id)a12 storeMaintenance:(id)a13 backgroundQueue:(id)a14 environment:(id)a15 imageHandlingDelegate:(id)a16;
- (AVTCoreEnvironment)environment;
- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate;
- (AVTPushNotificationsSupport)pushNotificationsSupport;
- (AVTStickerChangeObserver)stickerChangeObserver;
- (AVTStoreBackend)backend;
- (AVTSyncSchedulingAuthority)schedulingAuthority;
- (AVTUILogger)logger;
- (BOOL)processInternalSettingsChanges:(id)a3;
- (BOOL)setupCompleted;
- (NSXPCStoreServer)server;
- (OS_dispatch_queue)backgroundQueue;
- (id)migrationActivityCompletion;
- (id)migratorProvider;
- (id)userRequestedBackupActivityCompletion;
- (void)clientDidCheckInForServer:(id)a3;
- (void)completeMigrationActivityIfNeeded;
- (void)completeUserRequestedBackupActivityIfNeeded;
- (void)deleteStickerRecents;
- (void)didReceivePushNotification:(id)a3;
- (void)migrate;
- (void)mirroringHandler:(id)a3 didResetSyncWithReason:(unint64_t)a4;
- (void)mirroringHandler:(id)a3 willResetSyncWithReason:(unint64_t)a4;
- (void)scheduleExportWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 completion:(id)a5;
- (void)scheduleImportDiscretionary:(BOOL)a3 completionBlock:(id)a4;
- (void)scheduleImportExportIfRequiredWithPostImportHandler:(id)a3 completion:(id)a4;
- (void)scheduleMigrationThen:(id)a3;
- (void)scheduleSetupThen:(id)a3;
- (void)scheduleUpdateThumbnails;
- (void)setImageHandlingDelegate:(id)a3;
- (void)setMigrationActivityCompletion:(id)a3;
- (void)setServer:(id)a3;
- (void)setSetupCompleted:(BOOL)a3;
- (void)setUserRequestedBackupActivityCompletion:(id)a3;
- (void)setupThen:(id)a3;
- (void)startListening;
- (void)updateThumbnails;
@end

@implementation AVTCoreDataStoreServer

- (AVTCoreDataStoreServer)initWithEnvironment:(id)a3 imageHandlingDelegate:(id)a4
{
  id v5 = a3;
  id v35 = a4;
  v6 = [v5 serialQueueProvider];
  v7 = ((void (**)(void, const char *))v6)[2](v6, "com.apple.AvatarUI.AVTCoreDataStoreServer.backgroundQueue");

  v8 = [v5 storeLocation];
  v9 = +[AVTCoreDataPersistentStoreConfiguration localConfigurationWithStoreLocation:v8 environment:v5];

  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke;
  v41[3] = &unk_2647C42D8;
  id v42 = v5;
  id v10 = v5;
  v38 = (void *)MEMORY[0x22A660070](v41);
  v34 = [[AVTCoreDataStoreBackend alloc] initWithConfiguration:v9 environment:v10];
  v11 = [AVTStickerUserDefaultsBackend alloc];
  v12 = [v10 serialQueueProvider];
  v13 = ((void (**)(void, const char *))v12)[2](v12, "com.apple.AvatarUI.AVTCoreDataStoreServer.stickerBackend");
  v14 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v33 = [(AVTStickerUserDefaultsBackend *)v11 initWithWorkQueue:v13 environment:v10 userDefaults:v14];

  v32 = [[AVTStickerChangeObserver alloc] initWithStickerBackend:v33 environment:v10];
  v15 = [AVTPushNotificationsSupport alloc];
  v16 = objc_alloc_init(AVTPushNotificationsConnectionFactory);
  v31 = [(AVTPushNotificationsSupport *)v15 initWithEnvironment:v10 connectionFactory:v16];

  v30 = +[AVTCoreDataCloudKitMirroringConfiguration createMirroringHandlerWithEnvironment:v10];
  v17 = [AVTSyncSchedulingAuthority alloc];
  v18 = [v10 logger];
  v28 = [(AVTSyncSchedulingAuthority *)v17 initWithLogger:v18];

  v29 = objc_alloc_init(AVTPassthroughEventCoalescer);
  v25 = [[AVTCoreDataRemoteChangesObserver alloc] initWithConfiguration:v9 workQueue:v7 coalescer:v29 environment:v10];
  v26 = [[AVTCoreDataChangeTracker alloc] initWithConfiguration:v9 environment:v10];
  v19 = [AVTCoreDataStoreMaintenance alloc];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke_2;
  v39[3] = &unk_2647C4300;
  id v40 = v9;
  id v27 = v9;
  v20 = [(AVTCoreDataStoreMaintenance *)v19 initWithEnvironment:v10 managedObjectContextFactory:v39];
  v21 = [AVTAvatarsDaemonServer alloc];
  v22 = [v10 logger];
  v23 = [(AVTAvatarsDaemonServer *)v21 initWithLogger:v22];

  v37 = [(AVTCoreDataStoreServer *)self initWithLocalBackend:v34 configuration:v27 migratorProvider:v38 pushSupport:v31 mirroringHandler:v30 schedulingAuthority:v28 remoteChangesObserver:v25 stickerChangeObserver:v32 changeTracker:v26 daemonServer:v23 storeMaintenance:v20 backgroundQueue:v7 environment:v10 imageHandlingDelegate:v35];
  return v37;
}

AVTStoreBackendMigrator *__68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke(uint64_t a1)
{
  v1 = [[AVTStoreBackendMigrator alloc] initWithEnvironment:*(void *)(a1 + 32)];

  return v1;
}

uint64_t __68__AVTCoreDataStoreServer_initWithEnvironment_imageHandlingDelegate___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) createManagedObjectContext];
}

- (AVTCoreDataStoreServer)initWithLocalBackend:(id)a3 configuration:(id)a4 migratorProvider:(id)a5 pushSupport:(id)a6 mirroringHandler:(id)a7 schedulingAuthority:(id)a8 remoteChangesObserver:(id)a9 stickerChangeObserver:(id)a10 changeTracker:(id)a11 daemonServer:(id)a12 storeMaintenance:(id)a13 backgroundQueue:(id)a14 environment:(id)a15 imageHandlingDelegate:(id)a16
{
  id v46 = a3;
  id v45 = a4;
  id v47 = a5;
  id v36 = a6;
  id v44 = a6;
  id v37 = a7;
  id v43 = a7;
  id v42 = a8;
  id v41 = a9;
  id v40 = a10;
  id v39 = a11;
  id v21 = a12;
  id v22 = a13;
  id v23 = a14;
  id v24 = a15;
  id v25 = a16;
  v48.receiver = self;
  v48.super_class = (Class)AVTCoreDataStoreServer;
  v26 = [(AVTCoreDataStoreServer *)&v48 init];
  id v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_backend, a3);
    uint64_t v28 = [v24 logger];
    logger = v27->_logger;
    v27->_logger = (AVTUILogger *)v28;

    uint64_t v30 = [v24 scheduler];
    blockScheduler = v27->_blockScheduler;
    v27->_blockScheduler = (AVTBlockScheduler *)v30;

    objc_storeStrong((id *)&v27->_configuration, a4);
    uint64_t v32 = [v47 copy];
    id migratorProvider = v27->_migratorProvider;
    v27->_id migratorProvider = (id)v32;

    objc_storeStrong((id *)&v27->_pushNotificationsSupport, v36);
    [(AVTPushNotificationsSupport *)v27->_pushNotificationsSupport setDelegate:v27];
    objc_storeStrong((id *)&v27->_schedulingAuthority, a8);
    objc_storeStrong((id *)&v27->_mirroringHandler, v37);
    [(AVTCoreDataCloudKitMirroringHandler *)v27->_mirroringHandler setDelegate:v27];
    objc_storeStrong((id *)&v27->_remoteChangesObserver, a9);
    objc_storeStrong((id *)&v27->_stickerChangeObserver, a10);
    objc_storeStrong((id *)&v27->_changeTracker, a11);
    objc_storeStrong((id *)&v27->_daemonServer, a12);
    [(AVTAvatarsDaemonServer *)v27->_daemonServer setDelegate:v27];
    objc_storeStrong((id *)&v27->_storeMaintenance, a13);
    objc_storeStrong((id *)&v27->_backgroundQueue, a14);
    objc_storeStrong((id *)&v27->_environment, a15);
    objc_storeStrong((id *)&v27->_imageHandlingDelegate, a16);
    [(AVTStickerChangeObserver *)v27->_stickerChangeObserver setImageHandlingDelegate:v25];
  }

  return v27;
}

- (void)setImageHandlingDelegate:(id)a3
{
  id v5 = (AVTPBackendImageHandlingDelegate *)a3;
  if (self->_imageHandlingDelegate != v5)
  {
    objc_storeStrong((id *)&self->_imageHandlingDelegate, a3);
    [(AVTStickerChangeObserver *)self->_stickerChangeObserver setImageHandlingDelegate:v5];
  }
}

- (void)startListening
{
  if (AVTIsRunningAsSetupUser())
  {
    v20 = [(AVTCoreDataStoreServer *)self logger];
    [v20 logAvatarsdExitingWithReason:@"Cancelling due to running as Setup User"];

    exit(0);
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke;
  v28[3] = &unk_2647C3760;
  v28[4] = self;
  if (![(AVTCoreDataStoreServer *)self processInternalSettingsChanges:v28])
  {
    v3 = [(AVTCoreDataStoreServer *)self logger];
    [v3 logStartingServer];

    v4 = [(AVTCoreDataStoreServer *)self configuration];
    id v27 = 0;
    id v5 = [v4 createStoreServerWithError:&v27];
    id v6 = v27;
    [(AVTCoreDataStoreServer *)self setServer:v5];

    v7 = [(AVTCoreDataStoreServer *)self server];

    if (v7)
    {
      v8 = [(AVTCoreDataStoreServer *)self server];
      [v8 startListening];

      v9 = [(AVTCoreDataStoreServer *)self daemonServer];
      [v9 startListening];

      id v10 = [(AVTCoreDataStoreServer *)self pushNotificationsSupport];
      [v10 startListeningToPushNotifications];

      objc_initWeak(&location, self);
      v11 = [(AVTCoreDataStoreServer *)self remoteChangesObserver];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_2;
      v24[3] = &unk_2647C3238;
      objc_copyWeak(&v25, &location);
      [v11 addChangesHandler:v24];

      v12 = [(AVTCoreDataStoreServer *)self remoteChangesObserver];
      [v12 startObservingChanges];

      v13 = [(AVTCoreDataStoreServer *)self mirroringHandler];
      v14 = [(AVTCoreDataStoreServer *)self environment];
      v15 = [v14 notificationCenter];
      [v13 startObservingResetSyncWithNotificationCenter:v15];

      v16 = +[AVTBackgroundActivitySchedulerFactory schedulerForPostInstallMigrationActivity];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_4;
      v23[3] = &unk_2647C4350;
      v23[4] = self;
      [v16 scheduleWithBlock:v23];
      v17 = +[AVTBackgroundActivitySchedulerFactory schedulerForUserRequestedBackupActivity];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_7;
      v22[3] = &unk_2647C4350;
      v22[4] = self;
      [v17 scheduleWithBlock:v22];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_11;
      v21[3] = &unk_2647C3760;
      v21[4] = self;
      [(AVTCoreDataStoreServer *)self scheduleSetupThen:v21];

      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else
    {
      v18 = [(AVTCoreDataStoreServer *)self logger];
      v19 = [v6 description];
      [v18 logErrorStartingServer:v19];
    }
  }
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) logger];
  [v1 logAvatarsdExitingWithReason:@"Completed Internal Settings changes"];

  exit(0);
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((*((unsigned int (**)(uint64_t, void *, void *))AVTAnyTransactionHasChangesFromAuthor + 2))((uint64_t)AVTAnyTransactionHasChangesFromAuthor, v5, @"AvatarUIClient"))
  {
    v7 = [WeakRetained logger];
    [v7 logChangesRequireExport];

    v8 = [WeakRetained schedulingAuthority];
    [v8 madeLocalChanges];

    [WeakRetained scheduleExportWithManagedObjectContext:v11 discretionary:0 completion:&__block_literal_global_9];
  }
  if ((*((unsigned int (**)(uint64_t, void *, void *))AVTAnyTransactionHasChangesFromOtherThanAuthor + 2))((uint64_t)AVTAnyTransactionHasChangesFromOtherThanAuthor, v5, @"AvatarUIClient"))
  {
    v9 = [WeakRetained logger];
    [v9 logChangesRequireThumbnailUpdate];

    id v10 = [WeakRetained storeMaintenance];
    [v10 storeDidChange];

    [WeakRetained scheduleUpdateThumbnails];
    [WeakRetained deleteStickerRecents];
  }
  if ((!AVTUIHasDisplayedSplashScreen_once()
     || !AVTUIHasDisplayedAnimojiSplashScreen_once()
     || !AVTUIHasDisplayedCameraEffectsSplashScreen_once()
     || (AVTUIHasDisplayedPaddleView_once() & 1) == 0)
    && (*((unsigned int (**)(uint64_t, void *))AVTAnyTransactionHasAvatarChange + 2))((uint64_t)AVTAnyTransactionHasAvatarChange, v5))
  {
    AVTUISetHasDisplayedSplashScreen(1);
    AVTUISetHasDisplayedAnimojiSplashScreen(1);
    AVTUISetHasDisplayedCameraEffectsSplashScreen(1);
    AVTUISetHasDisplayedPaddleView(1);
  }
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) logger];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_5;
  v6[3] = &unk_2647C4328;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 performingMigrationXPCActivity:v6];
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) blockScheduler];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_6;
  v5[3] = &unk_2647C31E8;
  id v3 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v3;
  v4 = objc_msgSend(*(id *)(a1 + 32), "backgroundQueue", v5[0], 3221225472, __40__AVTCoreDataStoreServer_startListening__block_invoke_6, &unk_2647C31E8, v6);
  [v2 performBlock:v5 afterDelay:v4 onQueue:0.0];
}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) setMigrationActivityCompletion:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);

  return [v2 completeMigrationActivityIfNeeded];
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) logger];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_8;
  v6[3] = &unk_2647C4328;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v5 = v3;
  [v4 performingUserRequestedBackupActivity:v6];
}

void __40__AVTCoreDataStoreServer_startListening__block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) blockScheduler];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_9;
  v5[3] = &unk_2647C31E8;
  id v3 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = v3;
  v4 = objc_msgSend(*(id *)(a1 + 32), "backgroundQueue", v5[0], 3221225472, __40__AVTCoreDataStoreServer_startListening__block_invoke_9, &unk_2647C31E8, v6);
  [v2 performBlock:v5 afterDelay:v4 onQueue:0.0];
}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_9(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserRequestedBackupActivityCompletion:*(void *)(a1 + 40)];
  uint64_t result = [*(id *)(a1 + 32) setupCompleted];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __40__AVTCoreDataStoreServer_startListening__block_invoke_10;
    v4[3] = &unk_2647C3760;
    v4[4] = v3;
    return [v3 scheduleImportExportIfRequiredWithPostImportHandler:0 completion:v4];
  }
  return result;
}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) completeUserRequestedBackupActivityIfNeeded];
}

uint64_t __40__AVTCoreDataStoreServer_startListening__block_invoke_11(uint64_t a1)
{
  [*(id *)(a1 + 32) completeMigrationActivityIfNeeded];
  [*(id *)(a1 + 32) completeUserRequestedBackupActivityIfNeeded];
  v2 = *(void **)(a1 + 32);

  return [v2 importSetupUserDataIfNeeded];
}

- (void)completeMigrationActivityIfNeeded
{
  id v3 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  dispatch_assert_queue_V2(v3);

  if ([(AVTCoreDataStoreServer *)self setupCompleted])
  {
    v4 = [(AVTCoreDataStoreServer *)self migrationActivityCompletion];

    if (v4)
    {
      id v5 = [(AVTCoreDataStoreServer *)self logger];
      [v5 logMigrationXPCActivityFinished];

      uint64_t v6 = [(AVTCoreDataStoreServer *)self migrationActivityCompletion];
      v6[2](v6, 1);

      [(AVTCoreDataStoreServer *)self setMigrationActivityCompletion:0];
    }
  }
}

- (void)completeUserRequestedBackupActivityIfNeeded
{
  id v3 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  dispatch_assert_queue_V2(v3);

  if ([(AVTCoreDataStoreServer *)self setupCompleted])
  {
    v4 = [(AVTCoreDataStoreServer *)self userRequestedBackupActivityCompletion];

    if (v4)
    {
      id v5 = [(AVTCoreDataStoreServer *)self logger];
      [v5 logUserRequestedBackupXPCActivityFinished];

      uint64_t v6 = [(AVTCoreDataStoreServer *)self userRequestedBackupActivityCompletion];
      v6[2](v6, 1);

      [(AVTCoreDataStoreServer *)self setUserRequestedBackupActivityCompletion:0];
    }
  }
}

- (void)scheduleSetupThen:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = [(AVTCoreDataStoreServer *)self blockScheduler];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke;
  v10[3] = &unk_2647C3848;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  v9 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v6 performBlock:v10 afterDelay:v9 onQueue:0.0];
}

void __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke_2;
  v3[3] = &unk_2647C31E8;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 setupThen:v3];
}

uint64_t __44__AVTCoreDataStoreServer_scheduleSetupThen___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setupThen:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTCoreDataStoreServer *)self logger];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke;
  v7[3] = &unk_2647C4328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 settingUpStore:v7];
}

void __36__AVTCoreDataStoreServer_setupThen___block_invoke(uint64_t a1)
{
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_2;
  v18[3] = &unk_2647C31E8;
  v2 = *(void **)(a1 + 40);
  v18[4] = *(void *)(a1 + 32);
  id v19 = v2;
  id v3 = (void *)MEMORY[0x22A660070](v18);
  id v4 = [*(id *)(a1 + 32) configuration];
  id v17 = 0;
  char v5 = [v4 setupIfNeeded:&v17];
  id v6 = v17;

  id v7 = (void *)os_transaction_create();
  id v8 = [*(id *)(a1 + 32) configuration];
  v9 = [*(id *)(a1 + 32) backgroundQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_3;
  v15[3] = &unk_2647C4378;
  id v16 = v7;
  id v10 = v7;
  [v8 updateBackupInclusionStatusOnQueue:v9 completionHandler:v15];

  id v11 = *(void **)(a1 + 32);
  if (v5)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_4;
    v14[3] = &unk_2647C36A8;
    v14[4] = v11;
    [v11 scheduleImportExportIfRequiredWithPostImportHandler:v14 completion:v3];
  }
  else
  {
    id v12 = [v11 logger];
    v13 = [v6 description];
    [v12 logErrorSettingUpStore:v13];
  }
}

uint64_t __36__AVTCoreDataStoreServer_setupThen___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSetupCompleted:1];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __36__AVTCoreDataStoreServer_setupThen___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) logger];
  [v4 logSetupSchedulingMigrationCheck];

  char v5 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__AVTCoreDataStoreServer_setupThen___block_invoke_5;
  v7[3] = &unk_2647C31E8;
  v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v5 scheduleMigrationThen:v7];
}

uint64_t __36__AVTCoreDataStoreServer_setupThen___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) updateThumbnails];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)scheduleImportExportIfRequiredWithPostImportHandler:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke;
  v16[3] = &unk_2647C43F0;
  v16[4] = self;
  char v19 = 1;
  id v8 = v7;
  id v17 = v8;
  id v9 = v6;
  id v18 = v9;
  id v10 = (void (**)(void, void))MEMORY[0x22A660070](v16);
  id v11 = [(AVTCoreDataStoreServer *)self schedulingAuthority];
  int v12 = [v11 importRequired];

  if (v12)
  {
    v13 = [(AVTCoreDataStoreServer *)self logger];
    [v13 logSetupSchedulingImport];

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_4;
    v14[3] = &unk_2647C4418;
    v15 = v10;
    [(AVTCoreDataStoreServer *)self scheduleImportDiscretionary:1 completionBlock:v14];
  }
  else
  {
    v10[2](v10, 0);
  }
}

void __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_2;
  v7[3] = &unk_2647C43C8;
  v7[4] = *(void *)(a1 + 32);
  id v4 = v3;
  id v8 = v4;
  char v10 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 40);
  char v5 = (void (**)(void))MEMORY[0x22A660070](v7);
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void (**)(void)))(v6 + 16))(v6, v5);
  }
  else {
    v5[2](v5);
  }
}

void __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) schedulingAuthority];
  int v3 = [v2 exportRequired];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) configuration];
      id v5 = [v7 createManagedObjectContext];
    }
    id v8 = [*(id *)(a1 + 32) logger];
    [v8 logSetupSchedulingExport];

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 56);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_3;
    v11[3] = &unk_2647C43A0;
    id v12 = *(id *)(a1 + 48);
    [v9 scheduleExportWithManagedObjectContext:v5 discretionary:v10 completion:v11];
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v6();
  }
}

uint64_t __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__AVTCoreDataStoreServer_scheduleImportExportIfRequiredWithPostImportHandler_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)scheduleMigrationThen:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  uint64_t v6 = [(AVTCoreDataStoreServer *)self blockScheduler];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __48__AVTCoreDataStoreServer_scheduleMigrationThen___block_invoke;
  v10[3] = &unk_2647C3848;
  v10[4] = self;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v6 performBlock:v10 afterDelay:v9 onQueue:0.0];
}

uint64_t __48__AVTCoreDataStoreServer_scheduleMigrationThen___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) migrate];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)migrate
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = [(AVTCoreDataStoreServer *)self logger];
  [v3 logCheckingIfMigrationNeeded];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(AVTCoreDataStoreServer *)self configuration];
  id v5 = [v4 migratableSources];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 migrationNeeded])
        {
          if (!v8)
          {
            id v12 = [(AVTCoreDataStoreServer *)self migratorProvider];
            id v8 = v12[2]();
          }
          v13 = [(AVTCoreDataStoreServer *)self backend];
          [v8 migrateContentFromSource:v11 toDestination:v13 error:0];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }
}

- (void)scheduleImportDiscretionary:(BOOL)a3 completionBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(AVTCoreDataStoreServer *)self logger];
  [v7 logSchedulingImport];

  id v8 = (void *)os_transaction_create();
  uint64_t v9 = [(AVTCoreDataStoreServer *)self blockScheduler];
  uint64_t v13 = MEMORY[0x263EF8330];
  BOOL v16 = a3;
  id v14 = v8;
  id v15 = v6;
  id v10 = v8;
  id v11 = v6;
  id v12 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v9 performBlock:&v13 afterDelay:v12 onQueue:1.0];
}

void __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) configuration];
  int v3 = [v2 createManagedObjectContext];

  id v4 = [*(id *)(a1 + 32) mirroringHandler];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
  id v6 = [*(id *)(a1 + 32) backgroundQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke_2;
  v8[3] = &unk_2647C4440;
  v8[4] = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v4 importChangesWithManagedObjectContext:v7 discretionary:v5 workQueue:v6 completionHandler:v8];
}

uint64_t __70__AVTCoreDataStoreServer_scheduleImportDiscretionary_completionBlock___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = [*(id *)(a1 + 32) schedulingAuthority];
    [v3 importDidCompleteSuccessfully];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v4();
}

- (BOOL)processInternalSettingsChanges:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = (void *)os_transaction_create();
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke;
  v23[3] = &unk_2647C3760;
  v23[4] = self;
  id v6 = (void (**)(void))MEMORY[0x22A660070](v23);
  if (AVTUIWipeLocalDatabase())
  {
    AVTUISetWipeLocalDatabase(0);
    v6[2](v6);
    v4[2](v4);
LABEL_9:
    BOOL v14 = 1;
    goto LABEL_10;
  }
  if (AVTUIWipeCloudKitContainer())
  {
    id v7 = [(AVTCoreDataStoreServer *)self logger];
    [v7 logWillResetZone];

    AVTUISetWipeCloudKitContainer(0);
    id v8 = [(AVTCoreDataStoreServer *)self configuration];
    id v22 = 0;
    char v9 = [v8 setupIfNeeded:&v22];
    id v10 = v22;

    if (v9)
    {
      id v11 = [(AVTCoreDataStoreServer *)self configuration];
      uint64_t v12 = [v11 createManagedObjectContext];

      uint64_t v13 = [(AVTCoreDataStoreServer *)self mirroringHandler];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke_2;
      v18[3] = &unk_2647C4490;
      v18[4] = self;
      v20 = v6;
      id v19 = v5;
      id v21 = v4;
      [v13 resetZoneWithManagedObjectContext:v12 completionHandler:v18];

      id v10 = (id)v12;
    }
    else
    {
      id v15 = [(AVTCoreDataStoreServer *)self logger];
      BOOL v16 = [v10 description];
      [v15 logErrorSettingUpStore:v16];

      v4[2](v4);
    }

    goto LABEL_9;
  }
  BOOL v14 = 0;
LABEL_10:

  return v14;
}

void __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) configuration];
  [v2 tearDownAndEraseAllContent:0];

  int v3 = [*(id *)(a1 + 32) environment];
  id v5 = [v3 imageStoreLocation];

  id v4 = [*(id *)(a1 + 32) imageHandlingDelegate];
  [v4 clearContentAtLocation:v5];
}

void __57__AVTCoreDataStoreServer_processInternalSettingsChanges___block_invoke_2(void *a1, uint64_t a2, void *a3)
{
  id v5 = (void *)a1[4];
  id v6 = a3;
  id v7 = [v5 logger];
  id v8 = [v6 description];

  [v7 logDidResetZoneWithSuccess:a2 error:v8];
  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
    char v9 = *(void (**)(void))(a1[7] + 16);
    v9();
  }
}

- (void)scheduleExportWithManagedObjectContext:(id)a3 discretionary:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)os_transaction_create();
  id v11 = [(AVTCoreDataStoreServer *)self mirroringHandler];
  uint64_t v12 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __90__AVTCoreDataStoreServer_scheduleExportWithManagedObjectContext_discretionary_completion___block_invoke;
  v15[3] = &unk_2647C44B8;
  id v16 = v10;
  id v17 = v8;
  void v15[4] = self;
  id v13 = v10;
  id v14 = v8;
  [v11 scheduleExportChangesWithManagedObjectContext:v9 discretionary:v5 workQueue:v12 completionHandler:v15];
}

void __90__AVTCoreDataStoreServer_scheduleExportWithManagedObjectContext_discretionary_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    BOOL v5 = [*(id *)(a1 + 32) schedulingAuthority];
    [v5 exportDidCompleteSuccessfully];
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)updateThumbnails
{
  int v3 = [(AVTCoreDataStoreServer *)self logger];
  [v3 logUpdatingThumbnails];

  id v5 = [(AVTCoreDataStoreServer *)self imageHandlingDelegate];
  id v4 = [(AVTCoreDataStoreServer *)self changeTracker];
  [v5 updateThumbnailsForChangesWithTracker:v4 recordProvider:0];
}

- (void)scheduleUpdateThumbnails
{
  int v3 = (void *)os_transaction_create();
  id v4 = [(AVTCoreDataStoreServer *)self logger];
  [v4 logSchedulingUpdateThumbnails];

  id v5 = [(AVTCoreDataStoreServer *)self blockScheduler];
  uint64_t v8 = MEMORY[0x263EF8330];
  id v9 = v3;
  id v6 = v3;
  id v7 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v5 performBlock:&v8 afterDelay:v7 onQueue:1.0];
}

uint64_t __50__AVTCoreDataStoreServer_scheduleUpdateThumbnails__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateThumbnails];
}

- (void)deleteStickerRecents
{
  int v3 = (void *)os_transaction_create();
  id v4 = [(AVTCoreDataStoreServer *)self logger];
  [v4 logDeletingStickerRecents];

  id v5 = [(AVTCoreDataStoreServer *)self stickerChangeObserver];
  id v6 = [(AVTCoreDataStoreServer *)self changeTracker];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __46__AVTCoreDataStoreServer_deleteStickerRecents__block_invoke;
  v8[3] = &unk_2647C4378;
  id v9 = v3;
  id v7 = v3;
  [v5 processChangesForChangeTracker:v6 completionHandler:v8];
}

- (void)didReceivePushNotification:(id)a3
{
  id v4 = (void *)os_transaction_create();
  id v5 = [(AVTCoreDataStoreServer *)self blockScheduler];
  uint64_t v8 = MEMORY[0x263EF8330];
  id v9 = v4;
  id v6 = v4;
  id v7 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v5 performBlock:&v8 afterDelay:v7 onQueue:0.0];
}

void __53__AVTCoreDataStoreServer_didReceivePushNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) schedulingAuthority];
  [v2 didReceivePushNotification];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __53__AVTCoreDataStoreServer_didReceivePushNotification___block_invoke_2;
  v4[3] = &unk_2647C3960;
  int v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 scheduleImportDiscretionary:1 completionBlock:v4];
}

+ (BOOL)resetSyncShouldPreserveContentForReason:(unint64_t)a3
{
  BOOL result = AVTUIPreserveContentOnAccountChange();
  if (a3 == 4) {
    return 0;
  }
  return result;
}

- (void)mirroringHandler:(id)a3 willResetSyncWithReason:(unint64_t)a4
{
  if ([(id)objc_opt_class() resetSyncShouldPreserveContentForReason:a4])
  {
    id v5 = [(AVTCoreDataStoreServer *)self configuration];
    id v10 = 0;
    char v6 = [v5 copyStorageAside:&v10];
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      uint64_t v8 = [(AVTCoreDataStoreServer *)self logger];
      id v9 = [v7 description];
      [v8 logErrorCopyingStorageAside:v9];
    }
  }
}

- (void)mirroringHandler:(id)a3 didResetSyncWithReason:(unint64_t)a4
{
  char v6 = (void *)os_transaction_create();
  id v7 = [(AVTCoreDataStoreServer *)self blockScheduler];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke;
  v10[3] = &unk_2647C3568;
  id v11 = v6;
  unint64_t v12 = a4;
  v10[4] = self;
  id v8 = v6;
  id v9 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v7 performBlock:v10 afterDelay:v9 onQueue:0.0];
}

void __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) schedulingAuthority];
  [v2 didResetSync];

  int v3 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke_2;
  v7[3] = &unk_2647C44E0;
  uint64_t v4 = *(void *)(a1 + 48);
  v7[4] = v3;
  void v7[5] = v4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke_3;
  v5[3] = &unk_2647C3760;
  id v6 = *(id *)(a1 + 40);
  [v3 scheduleImportExportIfRequiredWithPostImportHandler:v7 completion:v5];
}

void __66__AVTCoreDataStoreServer_mirroringHandler_didResetSyncWithReason___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = a2;
  if ([(id)objc_opt_class() resetSyncShouldPreserveContentForReason:*(void *)(a1 + 40)])
  {
    uint64_t v4 = [*(id *)(a1 + 32) configuration];
    id v5 = [v4 copiedAsideMigratableSource];

    id v6 = [*(id *)(a1 + 32) migratorProvider];
    id v7 = v6[2]();

    id v8 = [*(id *)(a1 + 32) backend];
    id v13 = 0;
    char v9 = [v7 migrateContentFromSource:v5 toDestination:v8 error:&v13];
    id v10 = v13;

    if ((v9 & 1) == 0)
    {
      id v11 = [*(id *)(a1 + 32) logger];
      unint64_t v12 = [v10 description];
      [v11 logErrorMergingCopiedAsideContent:v12];
    }
  }
  v3[2](v3);
}

- (void)clientDidCheckInForServer:(id)a3
{
  uint64_t v4 = (void *)os_transaction_create();
  id v5 = [(AVTCoreDataStoreServer *)self blockScheduler];
  uint64_t v8 = MEMORY[0x263EF8330];
  id v9 = v4;
  id v6 = v4;
  id v7 = [(AVTCoreDataStoreServer *)self backgroundQueue];
  [v5 performBlock:&v8 afterDelay:v7 onQueue:0.0];
}

void __52__AVTCoreDataStoreServer_clientDidCheckInForServer___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) setupCompleted])
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __52__AVTCoreDataStoreServer_clientDidCheckInForServer___block_invoke_2;
    v3[3] = &unk_2647C3760;
    v2 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    [v2 scheduleImportExportIfRequiredWithPostImportHandler:0 completion:v3];
  }
}

- (AVTPBackendImageHandlingDelegate)imageHandlingDelegate
{
  return self->_imageHandlingDelegate;
}

- (AVTStoreBackend)backend
{
  return self->_backend;
}

- (AVTCoreEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTBlockScheduler)blockScheduler
{
  return self->_blockScheduler;
}

- (AVTCoreDataPersistentStoreLocalConfiguration)configuration
{
  return self->_configuration;
}

- (id)migratorProvider
{
  return self->_migratorProvider;
}

- (NSXPCStoreServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (OS_dispatch_queue)backgroundQueue
{
  return self->_backgroundQueue;
}

- (AVTPushNotificationsSupport)pushNotificationsSupport
{
  return self->_pushNotificationsSupport;
}

- (AVTCoreDataCloudKitMirroringHandler)mirroringHandler
{
  return self->_mirroringHandler;
}

- (AVTSyncSchedulingAuthority)schedulingAuthority
{
  return self->_schedulingAuthority;
}

- (AVTCoreDataRemoteChangesObserver)remoteChangesObserver
{
  return self->_remoteChangesObserver;
}

- (AVTStickerChangeObserver)stickerChangeObserver
{
  return self->_stickerChangeObserver;
}

- (AVTAvatarRecordChangeTracker)changeTracker
{
  return self->_changeTracker;
}

- (AVTAvatarsDaemonServer)daemonServer
{
  return self->_daemonServer;
}

- (AVTCoreDataStoreMaintenance)storeMaintenance
{
  return self->_storeMaintenance;
}

- (BOOL)setupCompleted
{
  return self->_setupCompleted;
}

- (void)setSetupCompleted:(BOOL)a3
{
  self->_setupCompleted = a3;
}

- (id)migrationActivityCompletion
{
  return self->_migrationActivityCompletion;
}

- (void)setMigrationActivityCompletion:(id)a3
{
}

- (id)userRequestedBackupActivityCompletion
{
  return self->_userRequestedBackupActivityCompletion;
}

- (void)setUserRequestedBackupActivityCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userRequestedBackupActivityCompletion, 0);
  objc_storeStrong(&self->_migrationActivityCompletion, 0);
  objc_storeStrong((id *)&self->_storeMaintenance, 0);
  objc_storeStrong((id *)&self->_daemonServer, 0);
  objc_storeStrong((id *)&self->_changeTracker, 0);
  objc_storeStrong((id *)&self->_stickerChangeObserver, 0);
  objc_storeStrong((id *)&self->_remoteChangesObserver, 0);
  objc_storeStrong((id *)&self->_schedulingAuthority, 0);
  objc_storeStrong((id *)&self->_mirroringHandler, 0);
  objc_storeStrong((id *)&self->_pushNotificationsSupport, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong(&self->_migratorProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_blockScheduler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_backend, 0);

  objc_storeStrong((id *)&self->_imageHandlingDelegate, 0);
}

@end