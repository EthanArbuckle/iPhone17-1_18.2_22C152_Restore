@interface AXAssetsService
- (AXAssetsService)init;
- (id)_serviceProxy;
- (id)xpcConnection;
- (void)_destroyXPCConnection;
- (void)componentCacheChanged;
- (void)dealloc;
- (void)deleteCompactResourceIfNeededForIdentifier:(id)a3;
- (void)downloadTTSResourceForVoiceId:(id)a3;
- (void)informSiriVoiceSubscriptionsWithVoiceId:(id)a3 addition:(BOOL)a4;
- (void)refreshAssetCatalogForPolicy:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5;
- (void)restartTTSResourceMigration;
- (void)runFirstBootTasks:(BOOL)a3;
- (void)runFirstUnlockTasks;
- (void)updateAssetForPolicy:(id)a3;
- (void)updateTTSResourcesForActionType:(unint64_t)a3;
@end

@implementation AXAssetsService

- (AXAssetsService)init
{
  v7.receiver = self;
  v7.super_class = (Class)AXAssetsService;
  v2 = [(AXAssetsService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AXAssetsService", v3);
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)_destroyXPCConnection
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = AXLogAssetLoader();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_1DC53F000, v3, OS_LOG_TYPE_DEFAULT, "AXAssetsService being deallocated: %@", buf, 0xCu);
  }

  [(AXAssetsService *)self _destroyXPCConnection];
  v4.receiver = self;
  v4.super_class = (Class)AXAssetsService;
  [(AXAssetsService *)&v4 dealloc];
}

- (id)xpcConnection
{
  objc_initWeak(&location, self);
  xpcConnectionQueue = self->_xpcConnectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__AXAssetsService_xpcConnection__block_invoke;
  block[3] = &unk_1E6C423B0;
  block[4] = self;
  objc_copyWeak(&v7, &location);
  dispatch_sync(xpcConnectionQueue, block);
  objc_super v4 = self->_xpcConnection;
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  return v4;
}

void __32__AXAssetsService_xpcConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.accessibility.axassetsd.service" options:4096];
    v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3684B90];
    [v2 setRemoteObjectInterface:v3];

    [v2 setExportedInterface:0];
    [v2 setExportedObject:0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __32__AXAssetsService_xpcConnection__block_invoke_2;
    v11[3] = &unk_1E6C42388;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    [v2 setInterruptionHandler:v11];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    v8 = __32__AXAssetsService_xpcConnection__block_invoke_5;
    v9 = &unk_1E6C42388;
    objc_copyWeak(&v10, (id *)(a1 + 40));
    [v2 setInvalidationHandler:&v6];
    objc_msgSend(v2, "resume", v6, v7, v8, v9);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v2;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
  }
}

void __32__AXAssetsService_xpcConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = AXLogAssetLoader();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    id v4 = WeakRetained;
    _os_log_impl(&dword_1DC53F000, v2, OS_LOG_TYPE_DEFAULT, "Connection to service interrupted. client: %@", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained _destroyXPCConnection];
}

void __32__AXAssetsService_xpcConnection__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = AXLogAssetLoader();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __32__AXAssetsService_xpcConnection__block_invoke_5_cold_1((uint64_t)WeakRetained, v2);
  }

  [WeakRetained _destroyXPCConnection];
}

- (id)_serviceProxy
{
  v2 = [(AXAssetsService *)self xpcConnection];
  int v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_5];

  return v3;
}

void __32__AXAssetsService__serviceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = AXLogAssetLoader();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __32__AXAssetsService__serviceProxy__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)refreshAssetCatalogForPolicy:(id)a3 withOverrideTimeout:(id)a4 forceCatalogRefresh:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v11 = [(AXAssetsService *)self _serviceProxy];
  id v10 = [v9 assetType];

  [v11 refreshAssetCatalogForAssetType:v10 withOverrideTimeout:v8 forceCatalogRefresh:v5];
}

- (void)updateAssetForPolicy:(id)a3
{
  id v4 = a3;
  id v6 = [(AXAssetsService *)self _serviceProxy];
  BOOL v5 = [v4 assetType];

  [v6 updateAssetForAssetType:v5];
}

- (void)runFirstBootTasks:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AXAssetsService *)self _serviceProxy];
  [v4 runFirstBootTasks:v3];
}

- (void)runFirstUnlockTasks
{
  id v2 = [(AXAssetsService *)self _serviceProxy];
  [v2 runFirstUnlockTasks];
}

- (void)informSiriVoiceSubscriptionsWithVoiceId:(id)a3 addition:(BOOL)a4
{
  BOOL v4 = a4;
  v11[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(AXAssetsService *)self _serviceProxy];
  v10[0] = @"kAXVoiceId";
  v10[1] = @"kAXVoiceSubscriptionAddition";
  v11[0] = v6;
  id v8 = [NSNumber numberWithBool:v4];
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  [v7 invokeSimpleTaskById:@"AXInformSiriVoiceSubscriptionsSimpleTask" arguments:v9];
}

- (void)downloadTTSResourceForVoiceId:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(AXAssetsService *)self _serviceProxy];
  uint64_t v7 = @"kAXVoiceId";
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [v5 invokeSimpleTaskById:@"AXDownloadTTSResourceTask" arguments:v6];
}

- (void)updateTTSResourcesForActionType:(unint64_t)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(AXAssetsService *)self _serviceProxy];
  uint64_t v7 = @"kAXActionType";
  BOOL v5 = [NSNumber numberWithUnsignedInteger:a3];
  v8[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v4 invokeSimpleTaskById:@"AXUpdateResourcesSimpleTask" arguments:v6];
}

- (void)deleteCompactResourceIfNeededForIdentifier:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(AXAssetsService *)self _serviceProxy];
  uint64_t v7 = @"kAXVoiceId";
  v8[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  [v5 invokeSimpleTaskById:@"AXDeleteCompactResourceSimpleTask" arguments:v6];
}

- (void)restartTTSResourceMigration
{
  id v2 = [(AXAssetsService *)self _serviceProxy];
  [v2 invokeSimpleTaskById:@"AXMigrateResourcesSimpleTask" arguments:MEMORY[0x1E4F1CC08]];
}

- (void)componentCacheChanged
{
  id v2 = [(AXAssetsService *)self _serviceProxy];
  [v2 invokeSimpleTaskById:@"AXComponentChangeSimpleTask" arguments:MEMORY[0x1E4F1CC08]];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __32__AXAssetsService_xpcConnection__block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC53F000, a2, OS_LOG_TYPE_ERROR, "Connection to service invalidated. client: %@", (uint8_t *)&v2, 0xCu);
}

void __32__AXAssetsService__serviceProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC53F000, a2, OS_LOG_TYPE_ERROR, "Failed to get service proxy: %@", (uint8_t *)&v2, 0xCu);
}

@end