@interface BBXPCSyncService
+ (id)clientInterface;
- (BBSyncServiceDelegate)delegate;
- (BBXPCSyncService)initWithDelegate:(id)a3 queue:(id)a4;
- (id)_ensureConnection;
- (id)serverProxyObject;
- (unint64_t)pairedDeviceCount;
- (void)_resetConnection;
- (void)enqueueSyncedRemovalForBulletin:(id)a3 feeds:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)syncServiceDidReceiveMessage:(id)a3;
@end

@implementation BBXPCSyncService

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)clientInterface___interface;
  return v2;
}

uint64_t __35__BBXPCSyncService_clientInterface__block_invoke()
{
  clientInterface___interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C7C2FD8];
  return MEMORY[0x270F9A758]();
}

- (BBXPCSyncService)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BBXPCSyncService;
  v8 = [(BBXPCSyncService *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bulletinboard.BBXPCSyncService.connectionQueue", 0);
    connectionQueue = v9->_connectionQueue;
    v9->_connectionQueue = (OS_dispatch_queue *)v10;

    id v12 = [(BBXPCSyncService *)v9 _ensureConnection];
  }

  return v9;
}

- (id)_ensureConnection
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  dispatch_queue_t v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  connectionQueue = self->_connectionQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__BBXPCSyncService__ensureConnection__block_invoke;
  v5[3] = &unk_264296008;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(connectionQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __37__BBXPCSyncService__ensureConnection__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (!v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x263F84350] options:0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v4;

    id v7 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v8 = [MEMORY[0x263F842F0] serverInterface];
    [v7 setRemoteObjectInterface:v8];

    v9 = *(void **)(*(void *)(a1 + 32) + 32);
    dispatch_queue_t v10 = [MEMORY[0x263F842F0] clientInterface];
    [v9 setExportedInterface:v10];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setExportedObject:");
    [*(id *)(*(void *)(a1 + 32) + 32) _setQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:&__block_literal_global_46];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = *(void **)(*(void *)(a1 + 32) + 32);
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    v16 = __37__BBXPCSyncService__ensureConnection__block_invoke_47;
    v17 = &unk_264295FE0;
    objc_copyWeak(&v18, &location);
    [v11 setInvalidationHandler:&v14];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "resume", v14, v15, v16, v17);
    id v12 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v13;
      _os_log_impl(&dword_217675000, v12, OS_LOG_TYPE_DEFAULT, "Created IDS XPC SyncService connection %@", buf, 0xCu);
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v2 = *(void **)(*(void *)(a1 + 32) + 32);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
}

void __37__BBXPCSyncService__ensureConnection__block_invoke_2()
{
  v0 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_217675000, v0, OS_LOG_TYPE_DEFAULT, "IDS XPC SyncService connection interrupted", v1, 2u);
  }
}

void __37__BBXPCSyncService__ensureConnection__block_invoke_47(uint64_t a1)
{
  v2 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_217675000, v2, OS_LOG_TYPE_DEFAULT, "IDS XPC SyncService connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

- (void)_resetConnection
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__BBXPCSyncService__resetConnection__block_invoke;
  block[3] = &unk_264295E28;
  block[4] = self;
  dispatch_sync(connectionQueue, block);
}

void __36__BBXPCSyncService__resetConnection__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) invalidate];
  [*(id *)(*(void *)(a1 + 32) + 32) setInterruptionHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 32) setExportedObject:0];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (id)serverProxyObject
{
  uint64_t v2 = [(BBXPCSyncService *)self _ensureConnection];
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_50];

  return v3;
}

void __37__BBXPCSyncService_serverProxyObject__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_ERROR)) {
    __37__BBXPCSyncService_serverProxyObject__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (unint64_t)pairedDeviceCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  id v2 = [(BBXPCSyncService *)self serverProxyObject];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__BBXPCSyncService_pairedDeviceCount__block_invoke;
  v5[3] = &unk_264296050;
  v5[4] = &v6;
  [v2 pairedSyncDeviceCountWithHandler:v5];

  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__BBXPCSyncService_pairedDeviceCount__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)enqueueSyncedRemovalForBulletin:(id)a3 feeds:(unint64_t)a4
{
  p_delegate = &self->_delegate;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v9 = [v7 sectionID];
  id v12 = [WeakRetained syncService:self universalSectionIdentifierForSectionIdentifier:v9];

  dispatch_queue_t v10 = [(BBXPCSyncService *)self serverProxyObject];
  id v11 = +[BBUNCoreConversion toUNCBulletin:v7];

  objc_msgSend(v10, "enqueueSyncedRemovalForBulletin:universalSectionID:feeds:", v11, v12, +[BBUNCoreConversion toUNCFeed:](BBUNCoreConversion, "toUNCFeed:", a4));
}

- (void)syncServiceDidReceiveMessage:(id)a3
{
  id v4 = a3;
  id v11 = [v4 objectForKey:@"dismissals"];
  uint64_t v5 = [v4 objectForKey:@"dismissalIDs"];
  uint64_t v6 = [v4 objectForKey:@"sectionID"];
  id v7 = [v4 objectForKey:@"universalSectionID"];
  uint64_t v8 = [v4 objectForKey:@"feeds"];

  uint64_t v9 = [v8 unsignedIntegerValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained syncService:self receivedDismissalDictionaries:v11 dismissalIDs:v5 inSection:v6 universalSectionID:v7 forFeeds:v9];
}

- (BBSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (BBSyncServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __37__BBXPCSyncService_serverProxyObject__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217675000, a2, OS_LOG_TYPE_ERROR, "BBXPCSyncService: Error getting remote proxy %@", (uint8_t *)&v2, 0xCu);
}

@end