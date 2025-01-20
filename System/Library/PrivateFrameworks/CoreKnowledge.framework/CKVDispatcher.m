@interface CKVDispatcher
+ (id)sharedInstance;
- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CKVDispatcher)init;
- (CKVDispatcher)initWithQueue:(id)a3 adminServiceProvider:(id)a4 taskManager:(id)a5;
- (NSXPCListener)adminServiceListener;
- (NSXPCListener)donateServiceListener;
- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4;
- (void)handleBridgeActivityUpdate:(id)a3;
- (void)handleDarwinNotificationEventWithName:(id)a3 completion:(id)a4;
- (void)handleDistributedNotificationEventWithName:(id)a3 completion:(id)a4;
- (void)registerXPCActivities;
- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4;
- (void)runMigration:(id)a3;
- (void)setupXPCListeners;
@end

@implementation CKVDispatcher

- (void)handleDarwinNotificationEventWithName:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if ([v6 isEqualToString:@"com.apple.assistant.siri_settings_did_change"])
  {
    taskManager = self->_taskManager;
    uint64_t v9 = 1;
    uint64_t v10 = 2;
LABEL_15:
    [(CKVTaskManager *)taskManager handleTask:v9 reason:v10 shouldDefer:0 completion:v7];
    goto LABEL_16;
  }
  if ([v6 isEqualToString:@"__ABDataBaseChangedByOtherProcessNotification"])
  {
    taskManager = self->_taskManager;
    uint64_t v9 = 2;
    uint64_t v10 = 4;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"INVoocabularyChangedNotification"])
  {
    taskManager = self->_taskManager;
    uint64_t v9 = 1;
    uint64_t v10 = 3;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"com.apple.homekit.sync-data-cache-updated"])
  {
    taskManager = self->_taskManager;
    uint64_t v9 = 4;
    uint64_t v10 = 6;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:@"com.apple.proactive.PersonalizationPortrait.namedEntitiesInvalidated"])
  {
    taskManager = self->_taskManager;
    uint64_t v9 = 7;
    uint64_t v10 = 12;
    goto LABEL_15;
  }
  if ([v6 isEqualToString:*MEMORY[0x1E4F4E2F0]])
  {
    v11 = self->_taskManager;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__CKVDispatcher_handleDarwinNotificationEventWithName_completion___block_invoke;
    v13[3] = &unk_1E5CF9DD0;
    v14 = v7;
    [(CKVTaskManager *)v11 handleTask:101 reason:8 shouldDefer:0 completion:v13];
  }
  else
  {
    if ([v6 isEqualToString:@"com.apple.icloud.fmip.siri_data_changed"])
    {
      taskManager = self->_taskManager;
      uint64_t v9 = 10;
      uint64_t v10 = 18;
      goto LABEL_15;
    }
    if ([v6 isEqualToString:@"com.apple.CascadeSets.DonateNow"])
    {
      v12 = CKLogContextVocabulary;
      if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[CKVDispatcher handleDarwinNotificationEventWithName:completion:]";
        __int16 v17 = 2112;
        v18 = @"com.apple.CascadeSets.DonateNow";
        _os_log_impl(&dword_1A77B3000, v12, OS_LOG_TYPE_INFO, "%s Ignoring notification: %@ on this platform", buf, 0x16u);
      }
    }
    if (v7) {
      v7[2](v7);
    }
  }
LABEL_16:
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donateServiceListener, 0);
  objc_storeStrong((id *)&self->_taskManager, 0);
  objc_storeStrong((id *)&self->_adminServiceProvider, 0);
  objc_storeStrong((id *)&self->_adminServiceListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSXPCListener)adminServiceListener
{
  return self->_adminServiceListener;
}

- (NSXPCListener)donateServiceListener
{
  return self->_donateServiceListener;
}

- (void)runMaintenanceWithShouldDefer:(id)a3 completion:(id)a4
{
  id v6 = a4;
  taskManager = self->_taskManager;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke;
  v9[3] = &unk_1E5CF9DD0;
  id v10 = v6;
  id v8 = v6;
  [(CKVTaskManager *)taskManager handleTask:102 reason:14 shouldDefer:a3 completion:v9];
}

void __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke(uint64_t a1)
{
  v2 = [getSEMDispatcherClass() sharedInstance];
  v3 = [v2 administrator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke_2;
  v4[3] = &unk_1E5CF9AF0;
  id v5 = *(id *)(a1 + 32);
  [v3 triggerMaintenance:0 completion:v4];
}

uint64_t __58__CKVDispatcher_runMaintenanceWithShouldDefer_completion___block_invoke_2(uint64_t a1)
{
  if (!+[CKVAssistantSettingsBridge isCustomerInstall])
  {
    v2 = +[CKVSnapshotManager sharedInstance];
    [v2 cleanup];
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)runMigration:(id)a3
{
  id v4 = a3;
  taskManager = self->_taskManager;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CKVDispatcher_runMigration___block_invoke;
  v7[3] = &unk_1E5CF9DD0;
  id v8 = v4;
  id v6 = v4;
  [(CKVTaskManager *)taskManager handleTask:103 reason:1 shouldDefer:0 completion:v7];
}

void __30__CKVDispatcher_runMigration___block_invoke(uint64_t a1)
{
  v2 = [getSEMDispatcherClass() sharedInstance];
  v3 = [v2 administrator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __30__CKVDispatcher_runMigration___block_invoke_2;
  v4[3] = &unk_1E5CF9AF0;
  id v5 = *(id *)(a1 + 32);
  [v3 triggerMaintenance:0 completion:v4];
}

uint64_t __30__CKVDispatcher_runMigration___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handleDistributedNotificationEventWithName:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(void))a4;
  if (([v10 isEqualToString:@"com.apple.LaunchServices.applicationRegistered"] & 1) != 0
    || [v10 isEqualToString:@"com.apple.LaunchServices.applicationUnregistered"])
  {
    taskManager = self->_taskManager;
    uint64_t v8 = 3;
    uint64_t v9 = 5;
LABEL_7:
    [(CKVTaskManager *)taskManager handleTask:v8 reason:v9 shouldDefer:0 completion:v6];
    goto LABEL_8;
  }
  if (([v10 isEqualToString:@"ABDatabaseChangedExternallyNotificationPriv"] & 1) != 0
    || [v10 isEqualToString:@"ABDistributedDatabaseChangedNotificationPriv"])
  {
    taskManager = self->_taskManager;
    uint64_t v8 = 2;
    uint64_t v9 = 4;
    goto LABEL_7;
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_8:
}

uint64_t __66__CKVDispatcher_handleDarwinNotificationEventWithName_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)handleBridgeActivityUpdate:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F71F60]])
  {
    taskManager = self->_taskManager;
    [(CKVTaskManager *)taskManager handleTask:11 reason:19 shouldDefer:0 completion:0];
  }
}

- (BOOL)_adminServiceShouldAcceptNewConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 valueForEntitlement:@"com.apple.siri.vocabulary.admin"];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFD82730];
    [v4 setExportedInterface:v6];

    v7 = [(CKVAdminServiceProvider *)self->_adminServiceProvider adminService];
    [v4 setExportedObject:v7];

    [v4 resume];
    uint64_t v8 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v8;
      int v13 = 136315394;
      v14 = "-[CKVDispatcher _adminServiceShouldAcceptNewConnection:]";
      __int16 v15 = 1024;
      int v16 = [v4 processIdentifier];
      id v10 = "%s New connection established to process with pid=(%d)";
LABEL_6:
      _os_log_impl(&dword_1A77B3000, v9, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0x12u);
    }
  }
  else
  {
    v11 = (void *)CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = v11;
      int v13 = 136315394;
      v14 = "-[CKVDispatcher _adminServiceShouldAcceptNewConnection:]";
      __int16 v15 = 1024;
      int v16 = [v4 processIdentifier];
      id v10 = "%s Connecting process with pid=(%d) is not entitled for vocabulary admin service - rejecting connection.";
      goto LABEL_6;
    }
  }

  return v5 != 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_adminServiceListener == v6)
  {
    BOOL v9 = [(CKVDispatcher *)self _adminServiceShouldAcceptNewConnection:v7];
  }
  else
  {
    uint64_t v8 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      v12 = "-[CKVDispatcher listener:shouldAcceptNewConnection:]";
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_error_impl(&dword_1A77B3000, v8, OS_LOG_TYPE_ERROR, "%s Unrecognized listener passed to delegate: %@", (uint8_t *)&v11, 0x16u);
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_listenerWithMachServiceName:(id)a3 delegate:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F29290];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)[[v5 alloc] initWithMachServiceName:v7];

  [v8 setDelegate:v6];
  [v8 resume];
  return v8;
}

- (void)setupXPCListeners
{
  v3 = [(CKVDispatcher *)self _listenerWithMachServiceName:@"com.apple.siriknowledged.vocabulary.admin" delegate:self];
  adminServiceListener = self->_adminServiceListener;
  self->_adminServiceListener = v3;
}

- (void)registerXPCActivities
{
  CKVRegisterPostOSInstallMigrationActivity();
  CKVRegisterIndexMaintenanceActivity();
}

- (CKVDispatcher)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"init unsupported" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CKVDispatcher)initWithQueue:(id)a3 adminServiceProvider:(id)a4 taskManager:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CKVDispatcher;
  v12 = [(CKVDispatcher *)&v17 init];
  p_isa = (id *)&v12->super.isa;
  if (!v12
    || (objc_storeStrong((id *)&v12->_queue, a3),
        objc_storeStrong(p_isa + 3, a4),
        objc_storeStrong(p_isa + 4, a5),
        p_isa[3])
    && p_isa[4])
  {
    v14 = p_isa;
  }
  else
  {
    uint64_t v15 = CKLogContextVocabulary;
    if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v19 = "-[CKVDispatcher initWithQueue:adminServiceProvider:taskManager:]";
      _os_log_error_impl(&dword_1A77B3000, v15, OS_LOG_TYPE_ERROR, "%s Invalid parameters", buf, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

void __31__CKVDispatcher_sharedInstance__block_invoke()
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v0 = CKLogContextVocabulary;
  if (os_log_type_enabled((os_log_t)CKLogContextVocabulary, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    v12 = "+[CKVDispatcher sharedInstance]_block_invoke";
    _os_log_impl(&dword_1A77B3000, v0, OS_LOG_TYPE_INFO, "%s Starting up...", (uint8_t *)&v11, 0xCu);
  }
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("CKVocabulary Dispatcher", v1);

  if (KVInitializeModularFilesystemLayout())
  {
    v3 = +[CKVTaskManager defaultManager];
    id v4 = [CKVAdminServiceFactory alloc];
    id v5 = [getSEMDispatcherClass() sharedInstance];
    id v6 = [v5 administrator];
    id v7 = [(CKVAdminServiceFactory *)v4 initWithQueue:v2 semAdministrator:v6 taskManager:v3];

    uint64_t v8 = [v3 donateTaskProvider];
    [v8 setupBridgeListenersWithHandler:&__block_literal_global_58];

    id v9 = [[CKVDispatcher alloc] initWithQueue:v2 adminServiceProvider:v7 taskManager:v3];
    id v10 = (void *)sharedInstance_sharedInstance;
    sharedInstance_sharedInstance = (uint64_t)v9;
  }
}

uint64_t __31__CKVDispatcher_sharedInstance__block_invoke_55(uint64_t a1, uint64_t a2)
{
  return [(id)sharedInstance_sharedInstance handleBridgeActivityUpdate:a2];
}

@end