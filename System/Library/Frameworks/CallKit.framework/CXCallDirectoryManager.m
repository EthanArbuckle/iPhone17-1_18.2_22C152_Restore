@interface CXCallDirectoryManager
+ (CXCallDirectoryManager)sharedInstance;
- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3 timeout:(double)a4;
- (CXCallDirectoryManager)init;
- (NSXPCConnection)defaultConnection;
- (NSXPCConnection)maintenanceConnection;
- (OS_dispatch_queue)queue;
- (id)defaultConnectionRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3 timeout:(double)a4;
- (id)maintenanceConnectionRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)cleanUpLiveLookupDataWithCompletionHandler:(id)a3;
- (void)compactStoreWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)firstIdentificationEntryForEnabledExtensionWithPhoneNumber:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5;
- (void)getEnabledStatusForExtensionWithIdentifier:(NSString *)identifier completionHandler:(void *)completion;
- (void)getExtensionsWithCompletionHandler:(id)a3;
- (void)getLastUpdatedCallDirectoryInfoWithCompletionHandler:(id)a3;
- (void)openSettingsWithCompletionHandler:(void *)completion;
- (void)reloadExtensionWithIdentifier:(NSString *)identifier completionHandler:(void *)completion;
- (void)setDefaultConnection:(id)a3;
- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setMaintenanceConnection:(id)a3;
- (void)setPrioritizedExtensionIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setQueue:(id)a3;
- (void)synchronizeExtensionsWithCompletionHandler:(id)a3;
@end

@implementation CXCallDirectoryManager

- (CXCallDirectoryManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CXCallDirectoryManager;
  v2 = [(CXCallDirectoryManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.calldirectorymanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

void __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  id v5 = *(id *)(a1 + 48);
  dispatch_queue_t v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:*(void *)(a1 + 40) cacheOnly:*(unsigned __int8 *)(a1 + 56) reply:*(void *)(a1 + 48)];
}

- (id)defaultConnectionRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallDirectoryManager *)self defaultConnection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (NSXPCConnection)defaultConnection
{
  defaultConnection = self->_defaultConnection;
  if (!defaultConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CallKit.CallDirectory"];
    id v5 = self->_defaultConnection;
    self->_defaultConnection = v4;

    objc_super v6 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callDirectoryManagerDefaultHostInterface");
    [(NSXPCConnection *)self->_defaultConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke;
    v10[3] = &unk_1E5CADED0;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_defaultConnection setInterruptionHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke_2;
    v8[3] = &unk_1E5CADED0;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_defaultConnection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_defaultConnection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    defaultConnection = self->_defaultConnection;
  }

  return defaultConnection;
}

- (void)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [(CXCallDirectoryManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke;
  v13[3] = &unk_1E5CAE698;
  id v14 = v8;
  id v15 = v9;
  v13[4] = self;
  BOOL v16 = a4;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (CXCallDirectoryManager)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CXCallDirectoryManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return (CXCallDirectoryManager *)v2;
}

uint64_t __40__CXCallDirectoryManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_defaultConnection invalidate];
  [(NSXPCConnection *)self->_maintenanceConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXCallDirectoryManager;
  [(CXCallDirectoryManager *)&v3 dealloc];
}

void __43__CXCallDirectoryManager_defaultConnection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Default connection interrupted for call directory manager %@", buf, 0xCu);
  }

  objc_super v3 = [WeakRetained queue];

  if (v3)
  {
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke_6;
    block[3] = &unk_1E5CADD30;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
}

uint64_t __43__CXCallDirectoryManager_defaultConnection__block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) invalidate];
}

void __43__CXCallDirectoryManager_defaultConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Default connection invalidated for call directory manager %@", buf, 0xCu);
  }

  objc_super v3 = [WeakRetained queue];

  if (v3)
  {
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CXCallDirectoryManager_defaultConnection__block_invoke_7;
    block[3] = &unk_1E5CADD30;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
}

void __43__CXCallDirectoryManager_defaultConnection__block_invoke_7(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

- (NSXPCConnection)maintenanceConnection
{
  maintenanceConnection = self->_maintenanceConnection;
  if (!maintenanceConnection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.CallKit.CallDirectoryMaintenance"];
    id v5 = self->_maintenanceConnection;
    self->_maintenanceConnection = v4;

    objc_super v6 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callDirectoryManagerMaintenanceHostInterface");
    [(NSXPCConnection *)self->_maintenanceConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke;
    v10[3] = &unk_1E5CADED0;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_maintenanceConnection setInterruptionHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_2;
    v8[3] = &unk_1E5CADED0;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_maintenanceConnection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_maintenanceConnection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    maintenanceConnection = self->_maintenanceConnection;
  }

  return maintenanceConnection;
}

void __47__CXCallDirectoryManager_maintenanceConnection__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Maintenance connection interrupted for call directory manager %@", buf, 0xCu);
  }

  objc_super v3 = [WeakRetained queue];

  if (v3)
  {
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_8;
    block[3] = &unk_1E5CADD30;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
}

uint64_t __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
}

void __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = WeakRetained;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Maintenance connection invalidated for call directory manager %@", buf, 0xCu);
  }

  objc_super v3 = [WeakRetained queue];

  if (v3)
  {
    id v4 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_9;
    block[3] = &unk_1E5CADD30;
    block[4] = WeakRetained;
    dispatch_async(v4, block);
  }
}

void __47__CXCallDirectoryManager_maintenanceConnection__block_invoke_9(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (id)maintenanceConnectionRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallDirectoryManager *)self maintenanceConnection];
  objc_super v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)reloadExtensionWithIdentifier:(NSString *)identifier completionHandler:(void *)completion
{
  objc_super v6 = identifier;
  id v7 = completion;
  uint64_t v8 = (void (**)(void, void))v7;
  if (v6)
  {
    id v9 = [(CXCallDirectoryManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E5CAE648;
    block[4] = self;
    v13 = v8;
    id v12 = v6;
    dispatch_async(v9, block);
  }
  else if (v7)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

void __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5CAE2B0;
  id v8 = *(id *)(a1 + 48);
  objc_super v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_11;
  v5[3] = &unk_1E5CAE2B0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 reloadExtensionWithIdentifier:v4 reply:v5];
}

void __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_11(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getEnabledStatusForExtensionWithIdentifier:(NSString *)identifier completionHandler:(void *)completion
{
  id v6 = identifier;
  id v7 = completion;
  id v8 = (void (**)(void, void, void))v7;
  if (v6)
  {
    id v9 = [(CXCallDirectoryManager *)self queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke;
    block[3] = &unk_1E5CAE648;
    block[4] = self;
    v13 = v8;
    id v12 = v6;
    dispatch_async(v9, block);
  }
  else if (v7)
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_callDirectoryManagerErrorWithCode:", 1);
    ((void (**)(void, void, void *))v8)[2](v8, 0, v10);
  }
}

void __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5CAE2B0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_13;
  v5[3] = &unk_1E5CAE670;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 getEnabledStatusForExtensionWithIdentifier:v4 reply:v5];
}

void __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __87__CXCallDirectoryManager_getEnabledStatusForExtensionWithIdentifier_completionHandler___block_invoke_13(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setEnabled:(BOOL)a3 forExtensionWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(CXCallDirectoryManager *)self queue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke;
  v13[3] = &unk_1E5CAE698;
  id v14 = v8;
  id v15 = v9;
  BOOL v16 = a3;
  v13[4] = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);
}

void __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5CAE2B0;
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_15;
  v6[3] = &unk_1E5CAE2B0;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v3 setEnabled:v4 forExtensionWithIdentifier:v5 reply:v6];
}

void __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __82__CXCallDirectoryManager_setEnabled_forExtensionWithIdentifier_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)firstIdentificationEntryForEnabledExtensionWithPhoneNumber:(id)a3 cacheOnly:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v16[0] = v8;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __113__CXCallDirectoryManager_firstIdentificationEntryForEnabledExtensionWithPhoneNumber_cacheOnly_completionHandler___block_invoke;
  v13[3] = &unk_1E5CAE6C0;
  id v14 = v8;
  id v15 = v9;
  id v11 = v8;
  id v12 = v9;
  [(CXCallDirectoryManager *)self firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:v10 cacheOnly:v6 completionHandler:v13];
}

void __113__CXCallDirectoryManager_firstIdentificationEntryForEnabledExtensionWithPhoneNumber_cacheOnly_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = [a2 objectForKeyedSubscript:v5];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

void __117__CXCallDirectoryManager_firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers_cacheOnly_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)synchronizeExtensionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCallDirectoryManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 maintenanceConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 synchronizeExtensionsWithReply:*(void *)(a1 + 40)];
}

void __69__CXCallDirectoryManager_synchronizeExtensionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)fetchLiveBlockingInfoForHandle:(id)a3 timeout:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (_os_feature_enabled_impl())
  {
    id v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "fetchLiveBlockingInfoForHandle: %@", buf, 0xCu);
    }

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    id v9 = [(CXCallDirectoryManager *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke;
    v15[3] = &unk_1E5CAE738;
    v15[4] = self;
    v10 = v8;
    BOOL v16 = v10;
    id v17 = v6;
    v18 = &v19;
    dispatch_sync(v9, v15);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (dispatch_semaphore_wait(v10, v11))
    {
      id v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryManager fetchLiveBlockingInfoForHandle:timeout:](v12);
      }
    }
  }
  BOOL v13 = *((unsigned char *)v20 + 24) != 0;
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_2;
  v8[3] = &unk_1E5CAE6E8;
  v2 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20;
  v5[3] = &unk_1E5CAE710;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  [v3 fetchLiveBlockingInfoForHandle:v4 reply:v5];
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = CXDefaultLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109120;
      v8[1] = a2;
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "fetchLiveBlockingInfoForHandle blocked=%d", (uint8_t *)v8, 8u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(id)a3 timeout:(double)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  if (_os_feature_enabled_impl())
  {
    uint64_t v7 = CXDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_1A6E3A000, v7, OS_LOG_TYPE_DEFAULT, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber: %@", buf, 0xCu);
    }

    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    uint64_t v9 = [(CXCallDirectoryManager *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke;
    v15[3] = &unk_1E5CAE738;
    v15[4] = self;
    v10 = v8;
    BOOL v16 = v10;
    id v17 = v6;
    v18 = &v19;
    dispatch_sync(v9, v15);

    dispatch_time_t v11 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    if (dispatch_semaphore_wait(v10, v11))
    {
      id v12 = CXDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CXCallDirectoryManager firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:timeout:](v12);
      }
    }
  }
  id v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v13;
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke(uint64_t a1)
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_2;
  v8[3] = &unk_1E5CAE6E8;
  v2 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22;
  v5[3] = &unk_1E5CAE760;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  [v3 firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:v4 reply:v5];
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = CXDefaultLog();
  dispatch_semaphore_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber blocked=%@", (uint8_t *)&v11, 0xCu);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v5;
    dispatch_semaphore_t v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)openSettingsWithCompletionHandler:(void *)completion
{
  uint64_t v4 = completion;
  id v5 = [(CXCallDirectoryManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 launchCallDirectorySettingsWithReply:*(void *)(a1 + 40)];
}

void __60__CXCallDirectoryManager_openSettingsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)compactStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCallDirectoryManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 maintenanceConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 compactStoreWithReply:*(void *)(a1 + 40)];
}

void __60__CXCallDirectoryManager_compactStoreWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cleanUpLiveLookupDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallDirectoryManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 maintenanceConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 cleanUpLiveLookupDataWithReply:*(void *)(a1 + 40)];
}

void __69__CXCallDirectoryManager_cleanUpLiveLookupDataWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getExtensionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallDirectoryManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 getExtensionsWithReply:*(void *)(a1 + 40)];
}

void __61__CXCallDirectoryManager_getExtensionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setPrioritizedExtensionIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CXCallDirectoryManager *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke;
  block[3] = &unk_1E5CAE648;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5CAE2B0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_24;
  v5[3] = &unk_1E5CAE2B0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 setPrioritizedExtensionIdentifiers:v4 reply:v5];
}

void __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __79__CXCallDirectoryManager_setPrioritizedExtensionIdentifiers_completionHandler___block_invoke_24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)getLastUpdatedCallDirectoryInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCallDirectoryManager *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5CADD78;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E5CAE2B0;
  v2 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 defaultConnectionRemoteObjectProxyWithErrorHandler:v4];
  [v3 getLastUpdatedCallDirectoryInfoWithReply:*(void *)(a1 + 40)];
}

void __79__CXCallDirectoryManager_getLastUpdatedCallDirectoryInfoWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)setQueue:(id)a3
{
}

- (void)setDefaultConnection:(id)a3
{
}

- (void)setMaintenanceConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maintenanceConnection, 0);
  objc_storeStrong((id *)&self->_defaultConnection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __74__CXCallDirectoryManager_reloadExtensionWithIdentifier_completionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "error %@", v2, v3, v4, v5, v6);
}

- (void)fetchLiveBlockingInfoForHandle:(os_log_t)log timeout:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Timeout occured waiting for LiveLookup Blocking information", v1, 2u);
}

void __65__CXCallDirectoryManager_fetchLiveBlockingInfoForHandle_timeout___block_invoke_20_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "fetchLiveBlockingInfoForHandle error=%@", v2, v3, v4, v5, v6);
}

- (void)firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber:(os_log_t)log timeout:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A6E3A000, log, OS_LOG_TYPE_ERROR, "Timeout occured waiting for LiveLookup BlockedBy information", v1, 2u);
}

void __92__CXCallDirectoryManager_firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber_timeout___block_invoke_22_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0(&dword_1A6E3A000, v0, v1, "firstEnabledLiveBlockingExtensionIdentifierForPhoneNumber error=%@", v2, v3, v4, v5, v6);
}

@end