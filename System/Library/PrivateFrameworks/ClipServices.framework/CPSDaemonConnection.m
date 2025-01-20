@interface CPSDaemonConnection
+ (CPSDaemonConnection)sharedConnection;
- (CPSDaemonConnection)init;
- (CPSSessionProxy)sessionProxy;
- (NSXPCConnection)xpcConnection;
- (NSXPCConnection)xpcConnectionNotEntitled;
- (void)cancelPrewarmingClipWithURL:(id)a3 completionHandler:(id)a4;
- (void)checkAndConsumeShowsAppAttributionBannerForBundleID:(id)a3 completion:(id)a4;
- (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 completion:(id)a5;
- (void)didDetermineAvailability:(BOOL)a3 options:(id)a4;
- (void)didFinishLoadingWithError:(id)a3;
- (void)didFinishTestingAtTime:(double)a3;
- (void)didInstallApplicationPlaceholder;
- (void)didRetrieveApplicationIcon:(id)a3;
- (void)didRetrieveBusinessIcon:(id)a3;
- (void)didRetrieveHeroImage:(id)a3;
- (void)didUpdateInstallProgress:(id)a3;
- (void)didUpdateMetadata:(id)a3;
- (void)fetchABRMetadataForDiagnosticsWithURL:(id)a3 completion:(id)a4;
- (void)fetchAMPMetadataForDiagnosticsWithBundleID:(id)a3 completion:(id)a4;
- (void)fetchClipMetadataAndImagesWithURL:(id)a3 completionHandler:(id)a4;
- (void)fetchClipMetadataWithURL:(id)a3 completionHandler:(id)a4;
- (void)fetchClipURLWithURLHash:(id)a3 completionHandler:(id)a4;
- (void)fetchWebClipsURLStringForClientBundleID:(id)a3 completion:(id)a4;
- (void)fetchWebClipsUUIDStringForClientBundleID:(id)a3 completion:(id)a4;
- (void)getLastLaunchOptionsWithBundleID:(id)a3 completion:(id)a4;
- (void)getUserNotificationConsentForBundleID:(id)a3 completion:(id)a4;
- (void)getWebClipDictionaryWithIdentifier:(id)a3 completion:(id)a4;
- (void)installClipWithURL:(id)a3 completionHandler:(id)a4;
- (void)isClipURL:(id)a3 completionHandler:(id)a4;
- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4;
- (void)openClipWithInvocationUIIfNeededWithURL:(id)a3 completionHandler:(id)a4;
- (void)openClipWithURL:(id)a3 completionHandler:(id)a4;
- (void)openClipWithURL:(id)a3 launchOptions:(id)a4 completion:(id)a5;
- (void)performValidationWithRequest:(id)a3 completion:(id)a4;
- (void)prewarmClipWithURL:(id)a3 completionHandler:(id)a4;
- (void)registerSessionProxy:(id)a3;
- (void)remoteServiceDidCrash;
- (void)setSessionProxy:(id)a3;
- (void)stopStallingCurrentInstallationWithCompletionHandler:(id)a3;
- (void)uninstallClipWithURL:(id)a3 completionHandler:(id)a4;
- (void)uninstallClipsWithBundleIDs:(id)a3 completionHandler:(id)a4;
- (void)unregisterSessionProxy:(id)a3;
@end

@implementation CPSDaemonConnection

+ (CPSDaemonConnection)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)sharedConnection_connection;

  return (CPSDaemonConnection *)v2;
}

uint64_t __39__CPSDaemonConnection_sharedConnection__block_invoke()
{
  sharedConnection_connection = objc_alloc_init(CPSDaemonConnection);

  return MEMORY[0x270F9A758]();
}

- (CPSDaemonConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPSDaemonConnection;
  v2 = [(CPSDaemonConnection *)&v7 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.ClipServices.clipserviced.CPSDaemonConnection", 0);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (NSXPCConnection)xpcConnection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    v4 = xpcConnection;
  }
  else
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ClipServices.clipserviced" options:4096];
    v6 = self->_xpcConnection;
    self->_xpcConnection = v5;

    if (xpcConnection_onceToken != -1) {
      dispatch_once(&xpcConnection_onceToken, &__block_literal_global_20_0);
    }
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:xpcConnection_interface];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:xpcConnection_clientInterface];
    [(NSXPCConnection *)self->_xpcConnection setExportedObject:self];
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__CPSDaemonConnection_xpcConnection__block_invoke_2;
    v10[3] = &unk_26424EBF8;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __36__CPSDaemonConnection_xpcConnection__block_invoke_3;
    v8[3] = &unk_26424EBF8;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v8];
    [(NSXPCConnection *)self->_xpcConnection resume];
    v4 = self->_xpcConnection;
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __36__CPSDaemonConnection_xpcConnection__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C63F7F0];
  v1 = (void *)xpcConnection_interface;
  xpcConnection_interface = v0;

  xpcConnection_clientInterface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C6364A8];

  return MEMORY[0x270F9A758]();
}

void __36__CPSDaemonConnection_xpcConnection__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[2];
    WeakRetained[2] = 0;
    dispatch_queue_t v3 = WeakRetained;

    WeakRetained = v3;
  }
}

void __36__CPSDaemonConnection_xpcConnection__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained remoteServiceDidCrash];
}

- (NSXPCConnection)xpcConnectionNotEntitled
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  xpcConnectionNotEntitled = self->_xpcConnectionNotEntitled;
  if (xpcConnectionNotEntitled)
  {
    v4 = xpcConnectionNotEntitled;
  }
  else
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ClipServices.clipserviced" options:4096];
    v6 = self->_xpcConnectionNotEntitled;
    self->_xpcConnectionNotEntitled = v5;

    if (xpcConnectionNotEntitled_onceToken != -1) {
      dispatch_once(&xpcConnectionNotEntitled_onceToken, &__block_literal_global_131);
    }
    [(NSXPCConnection *)self->_xpcConnectionNotEntitled setRemoteObjectInterface:xpcConnectionNotEntitled_interface];
    objc_initWeak(&location, self);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __47__CPSDaemonConnection_xpcConnectionNotEntitled__block_invoke_2;
    id v11 = &unk_26424EBF8;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)self->_xpcConnectionNotEntitled setInvalidationHandler:&v8];
    [(NSXPCConnection *)self->_xpcConnectionNotEntitled resume];
    v4 = self->_xpcConnectionNotEntitled;
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __47__CPSDaemonConnection_xpcConnectionNotEntitled__block_invoke()
{
  xpcConnectionNotEntitled_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C63CBF8];

  return MEMORY[0x270F9A758]();
}

void __47__CPSDaemonConnection_xpcConnectionNotEntitled__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;
    dispatch_queue_t v3 = WeakRetained;

    id WeakRetained = v3;
  }
}

- (void)remoteServiceDidCrash
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CPSDaemonConnection_remoteServiceDidCrash__block_invoke;
  block[3] = &unk_26424E7B0;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __44__CPSDaemonConnection_remoteServiceDidCrash__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  v4 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v4 remoteServiceDidCrash];
}

- (void)didDetermineAvailability:(BOOL)a3 options:(id)a4
{
  id v6 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CPSDaemonConnection_didDetermineAvailability_options___block_invoke;
  block[3] = &unk_26424F9D0;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async(connectionQueue, block);
}

uint64_t __56__CPSDaemonConnection_didDetermineAvailability_options___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setUsedByPPT:", objc_msgSend(*(id *)(a1 + 40), "safari_BOOLForKey:", @"RegisteredForTest"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setOriginIsControlCenter:", objc_msgSend(*(id *)(a1 + 40), "safari_BOOLForKey:", @"OriginIsControlCenter"));
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", @"LaunchReason");
  [*(id *)(*(void *)(a1 + 32) + 32) setLaunchReason:v2];

  dispatch_queue_t v3 = objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", @"SourceBundleID");
  [*(id *)(*(void *)(a1 + 32) + 32) setSourceBundleID:v3];

  v4 = objc_msgSend(*(id *)(a1 + 40), "safari_stringForKey:", @"ReferrerBundleID");
  [*(id *)(*(void *)(a1 + 32) + 32) setReferrerBundleID:v4];

  v5 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 48);

  return [v5 didDetermineAvailability:v6];
}

- (void)didUpdateMetadata:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__CPSDaemonConnection_didUpdateMetadata___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __41__CPSDaemonConnection_didUpdateMetadata___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didUpdateMetadata:*(void *)(a1 + 40)];
}

- (void)didFinishLoadingWithError:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__CPSDaemonConnection_didFinishLoadingWithError___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __49__CPSDaemonConnection_didFinishLoadingWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didFinishLoadingWithError:*(void *)(a1 + 40)];
}

- (void)didUpdateInstallProgress:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__CPSDaemonConnection_didUpdateInstallProgress___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __48__CPSDaemonConnection_didUpdateInstallProgress___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didUpdateInstallProgress:*(void *)(a1 + 40)];
}

- (void)didInstallApplicationPlaceholder
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__CPSDaemonConnection_didInstallApplicationPlaceholder__block_invoke;
  block[3] = &unk_26424E7B0;
  block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __55__CPSDaemonConnection_didInstallApplicationPlaceholder__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didInstallApplicationPlaceholder];
}

- (void)didRetrieveApplicationIcon:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__CPSDaemonConnection_didRetrieveApplicationIcon___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __50__CPSDaemonConnection_didRetrieveApplicationIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didRetrieveApplicationIcon:*(void *)(a1 + 40)];
}

- (void)didRetrieveHeroImage:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CPSDaemonConnection_didRetrieveHeroImage___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __44__CPSDaemonConnection_didRetrieveHeroImage___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didRetrieveHeroImage:*(void *)(a1 + 40)];
}

- (void)didFinishTestingAtTime:(double)a3
{
  connectionQueue = self->_connectionQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__CPSDaemonConnection_didFinishTestingAtTime___block_invoke;
  v4[3] = &unk_26424EBD0;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(connectionQueue, v4);
}

uint64_t __46__CPSDaemonConnection_didFinishTestingAtTime___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) usedByPPT];
  if (result)
  {
    dispatch_queue_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
    double v4 = *(double *)(a1 + 40);
    return [v3 didFinishTestingAtTime:v4];
  }
  return result;
}

- (void)didRetrieveBusinessIcon:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__CPSDaemonConnection_didRetrieveBusinessIcon___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

uint64_t __47__CPSDaemonConnection_didRetrieveBusinessIcon___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) didRetrieveBusinessIcon:*(void *)(a1 + 40)];
}

- (void)registerSessionProxy:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CPSDaemonConnection_registerSessionProxy___block_invoke;
  v7[3] = &unk_26424E7D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 32);
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    dispatch_queue_t v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__CPSDaemonConnection_registerSessionProxy___block_invoke_cold_1((uint64_t)v2, a1, v3);
    }
    [*v2 unregisterSessionProxy:*((void *)*v2 + 4)];
  }
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    int v10 = 134217984;
    uint64_t v11 = v5;
    _os_log_impl(&dword_21559C000, v4, OS_LOG_TYPE_INFO, "registerSessionProxy: Registering new session proxy (%p)", (uint8_t *)&v10, 0xCu);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  id v6 = [*(id *)(a1 + 32) xpcConnection];
  objc_super v7 = [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_135];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) url];
  uint64_t v9 = [*(id *)(a1 + 40) configuration];
  [v7 registerSessionWithURL:v8 configuration:v9];
}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke_132(uint64_t a1, void *a2)
{
  id v2 = a2;
  dispatch_queue_t v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __44__CPSDaemonConnection_registerSessionProxy___block_invoke_132_cold_1(v3);
  }
}

- (void)unregisterSessionProxy:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke;
  v7[3] = &unk_26424E7D8;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = (uint64_t *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 32);
  uint64_t v5 = CPS_LOG_CHANNEL_PREFIXClipServices();
  id v6 = v5;
  if (v3 == v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *v2;
      int v13 = 134217984;
      uint64_t v14 = v7;
      _os_log_impl(&dword_21559C000, v6, OS_LOG_TYPE_INFO, "unregisterSessionProxy: Unregistering session proxy (%p)", (uint8_t *)&v13, 0xCu);
    }
    id v8 = [*(id *)(a1 + 40) xpcConnection];
    uint64_t v9 = [v8 remoteObjectProxyWithErrorHandler:&__block_literal_global_138];
    int v10 = [*(id *)(*(void *)(a1 + 40) + 32) url];
    [v9 unregisterSessionWithURL:v10];

    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(v11 + 32);
    *(void *)(v11 + 32) = 0;
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_cold_1(v2, v6);
  }
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_136(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_136_cold_1(v3);
  }
}

- (void)isClipURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_139;
  v5[3] = &unk_26424ED90;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 isClipURL:v4 reply:v5];
}

void __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_139(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchClipMetadataAndImagesWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_26424EDB8;
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_141;
  v5[3] = &unk_26424E530;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 fetchClipMetadataAndImagesWithURL:v6 reply:v5];
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_141(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_141_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138739971;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "fetchClipMetadataAndImagesWithURL: successfully prewarmed clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)prewarmClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_26424EDB8;
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_142;
  v5[3] = &unk_26424E530;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 prewarmClipWithURL:v6 reply:v5];
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_142(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_142_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138739971;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "prewarmClip: successfully prewarmed clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)cancelPrewarmingClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_26424EDB8;
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_143;
  v5[3] = &unk_26424E530;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 cancelPrewarmingClipWithURL:v6 reply:v5];
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_143(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_143_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138739971;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "cancelPrewarm: successfully canceled prewarming clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)openClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2;
  v8[3] = &unk_26424EDB8;
  id v9 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_144;
  v5[3] = &unk_26424E530;
  id v6 = v4;
  id v7 = *(id *)(a1 + 48);
  [v3 openClipWithURL:v6 launchOptions:0 reply:v5];
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_144(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_144_cold_1(v5);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v8 = 138739971;
    uint64_t v9 = v6;
    _os_log_impl(&dword_21559C000, v5, OS_LOG_TYPE_INFO, "openClip: successfully opened clip with URL: %{sensitive}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
  }
}

- (void)installClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_145;
  v5[3] = &unk_26424EDB8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 installClipWithURL:v4 reply:v5];
}

void __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_145(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)uninstallClipWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_146;
  v5[3] = &unk_26424EDB8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 uninstallClipWithURL:v4 reply:v5];
}

void __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_146(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)uninstallClipsWithBundleIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_147;
  v5[3] = &unk_26424EDB8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 uninstallClipsWithBundleIDs:v4 reply:v5];
}

void __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __69__CPSDaemonConnection_uninstallClipsWithBundleIDs_completionHandler___block_invoke_147(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchClipMetadataWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_148;
  v5[3] = &unk_26424F9F8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 fetchClipMetadataWithURL:v4 reply:v5];
}

void __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

uint64_t __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  }
  return result;
}

- (void)fetchClipURLWithURLHash:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  id v6 = [v5 bundleIdentifier];
  [v3 fetchClipURLWithURLHash:v4 sourceBundleID:v6 reply:*(void *)(a1 + 48)];
}

void __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openClipWithInvocationUIIfNeededWithURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_151;
  v5[3] = &unk_26424EDB8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 openClipWithInvocationUIIfNeededWithURL:v4 reply:v5];
}

void __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_151(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopStallingCurrentInstallationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connectionQueue = self->_connectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke;
  v7[3] = &unk_26424E6F0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(connectionQueue, v7);
}

void __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2;
  v6[3] = &unk_26424EDB8;
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_152;
  v4[3] = &unk_26424ED90;
  id v5 = *(id *)(a1 + 40);
  [v3 stopStallingCurrentInstallationWithReply:v4];
}

void __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_152(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openClipWithURL:(id)a3 launchOptions:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connectionQueue = self->_connectionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke;
  v15[3] = &unk_26424FA20;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(connectionQueue, v15);
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2;
  v8[3] = &unk_26424EDB8;
  id v9 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_153;
  v6[3] = &unk_26424EDB8;
  id v7 = *(id *)(a1 + 56);
  [v3 openClipWithURL:v4 launchOptions:v5 reply:v6];
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2_cold_1(v4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_153(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_153_cold_1(v4);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)getUserNotificationConsentForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2;
  v7[3] = &unk_26424EDB8;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_154;
  v5[3] = &unk_26424FA48;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 getUserNotificationConsentForBundleID:v4 reply:v5];
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_154(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_154_cold_1(v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)notifyWebClipActivationWithBundleID:(id)a3 referrerBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke;
  block[3] = &unk_26424EA90;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(connectionQueue, block);
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_157];
  [v2 notifyWebClipActivationWithBundleID:*(void *)(a1 + 40) referrerBundleID:*(void *)(a1 + 48) reply:&__block_literal_global_160];
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_2_cold_1(v3);
  }
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_158(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_158_cold_1(v3);
    }
  }
}

- (void)getLastLaunchOptionsWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke;
  block[3] = &unk_26424E678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(connectionQueue, block);
}

void __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_162];
  [v2 getLastLaunchOptionsWithBundleID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke_2_cold_1(v3);
  }
}

- (void)checkAndConsumeShowsAppAttributionBannerForBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2;
  v4[3] = &unk_26424EDB8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 checkAndConsumeShowsAppAttributionBannerForBundleID:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2_cold_1(v4);
  }
}

- (void)confirmLocationWithURL:(id)a3 inRegion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  connectionQueue = self->_connectionQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke;
  v15[3] = &unk_26424E9F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(connectionQueue, v15);
}

void __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) xpcConnectionNotEntitled];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_164];
  [v2 confirmLocationWithURL:*(void *)(a1 + 40) inRegion:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

void __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke_2_cold_1(v3);
  }
}

- (void)performValidationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke;
  block[3] = &unk_26424E678;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(connectionQueue, block);
}

void __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) xpcConnection];
  id v2 = [v3 remoteObjectProxyWithErrorHandler:&__block_literal_global_166];
  [v2 performValidationWithRequest:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke_2_cold_1(v3);
  }
}

- (void)fetchAMPMetadataForDiagnosticsWithBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2;
  v4[3] = &unk_26424EDB8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 fetchAMPMetadataForDiagnosticsWithBundleID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2_cold_1(v4);
  }
}

- (void)fetchABRMetadataForDiagnosticsWithURL:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2;
  v4[3] = &unk_26424EDB8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 fetchABRMetadataForDiagnosticsWithURL:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2_cold_1(v4);
  }
}

- (void)fetchWebClipsUUIDStringForClientBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__CPSDaemonConnection_fetchWebClipsUUIDStringForClientBundleID_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __75__CPSDaemonConnection_fetchWebClipsUUIDStringForClientBundleID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnectionNotEntitled];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__CPSDaemonConnection_fetchWebClipsUUIDStringForClientBundleID_completion___block_invoke_2;
  v4[3] = &unk_26424EDB8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 fetchWebClipsUUIDStringForClientBundleID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __75__CPSDaemonConnection_fetchWebClipsUUIDStringForClientBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75__CPSDaemonConnection_fetchWebClipsUUIDStringForClientBundleID_completion___block_invoke_2_cold_1(v4);
  }
}

- (void)fetchWebClipsURLStringForClientBundleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__CPSDaemonConnection_fetchWebClipsURLStringForClientBundleID_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __74__CPSDaemonConnection_fetchWebClipsURLStringForClientBundleID_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnectionNotEntitled];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __74__CPSDaemonConnection_fetchWebClipsURLStringForClientBundleID_completion___block_invoke_2;
  v4[3] = &unk_26424EDB8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 fetchWebClipsURLStringForClientBundleID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __74__CPSDaemonConnection_fetchWebClipsURLStringForClientBundleID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __74__CPSDaemonConnection_fetchWebClipsURLStringForClientBundleID_completion___block_invoke_2_cold_1(v4);
  }
}

- (void)getWebClipDictionaryWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__CPSDaemonConnection_getWebClipDictionaryWithIdentifier_completion___block_invoke;
  block[3] = &unk_26424F900;
  id v12 = v6;
  id v13 = v7;
  block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(connectionQueue, block);
}

void __69__CPSDaemonConnection_getWebClipDictionaryWithIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) xpcConnectionNotEntitled];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__CPSDaemonConnection_getWebClipDictionaryWithIdentifier_completion___block_invoke_2;
  v4[3] = &unk_26424EDB8;
  id v5 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
  [v3 getWebClipDictionaryWithIdentifier:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

void __69__CPSDaemonConnection_getWebClipDictionaryWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v4 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__CPSDaemonConnection_getWebClipDictionaryWithIdentifier_completion___block_invoke_2_cold_1(v4);
  }
}

- (CPSSessionProxy)sessionProxy
{
  return self->_sessionProxy;
}

- (void)setSessionProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnectionNotEntitled, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_connectionQueue, 0);
}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 134218240;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_21559C000, log, OS_LOG_TYPE_ERROR, "registerSessionProxy: Existing session proxy (%p) is about to be overwritten with a new one (%p)", (uint8_t *)&v5, 0x16u);
}

void __44__CPSDaemonConnection_registerSessionProxy___block_invoke_132_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "registerSessionProxy: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_21559C000, a2, OS_LOG_TYPE_ERROR, "unregisterSessionProxy: try to unregister a stale session proxy (%p)", (uint8_t *)&v3, 0xCu);
}

void __46__CPSDaemonConnection_unregisterSessionProxy___block_invoke_136_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "unregisterSessionProxy: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __51__CPSDaemonConnection_isClipURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "isClipURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchClipMetadataAndImagesWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __75__CPSDaemonConnection_fetchClipMetadataAndImagesWithURL_completionHandler___block_invoke_141_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchClipMetadataAndImagesWithURL: error when prewarming clip via daemon: %{public}@", v6, v7, v8, v9, v10);
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "prewarmClip: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __60__CPSDaemonConnection_prewarmClipWithURL_completionHandler___block_invoke_142_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "prewarmClip: error when prewarming clip via daemon: %{public}@", v6, v7, v8, v9, v10);
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "cancelPrewarm: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __69__CPSDaemonConnection_cancelPrewarmingClipWithURL_completionHandler___block_invoke_143_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "cancelPrewarm: error when cancelling prewarming clip via daemon: %{public}@", v6, v7, v8, v9, v10);
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "openClip: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __57__CPSDaemonConnection_openClipWithURL_completionHandler___block_invoke_144_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "openClip: error when opening clip via daemon: %{public}@", v6, v7, v8, v9, v10);
}

void __60__CPSDaemonConnection_installClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "installClipWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __62__CPSDaemonConnection_uninstallClipWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "uninstallClipWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __66__CPSDaemonConnection_fetchClipMetadataWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchClipMetadataWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __65__CPSDaemonConnection_fetchClipURLWithURLHash_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchClipMetadataWithURLHash: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __81__CPSDaemonConnection_openClipWithInvocationUIIfNeededWithURL_completionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "openClipWithInvocationUIIfNeededWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __76__CPSDaemonConnection_stopStallingCurrentInstallationWithCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "stopStallingCurrentInstallation: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "openClipWithURL:launchOptions: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __64__CPSDaemonConnection_openClipWithURL_launchOptions_completion___block_invoke_153_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "openClipWithURL:launchOptions: Fail to open clip with error: %{public}@", v6, v7, v8, v9, v10);
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "getUserNotificationConsentForBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __72__CPSDaemonConnection_getUserNotificationConsentForBundleID_completion___block_invoke_154_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "getUserNotificationConsentForBundleID: Fail to get clip notification consent with error: %{public}@", v6, v7, v8, v9, v10);
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "notifyWebClipActivationWithBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __76__CPSDaemonConnection_notifyWebClipActivationWithBundleID_referrerBundleID___block_invoke_158_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "notifyWebClipActivationWithBundleID: failed with error: %{public}@", v6, v7, v8, v9, v10);
}

void __67__CPSDaemonConnection_getLastLaunchOptionsWithBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "getLastLaunchOptionsWithBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __86__CPSDaemonConnection_checkAndConsumeShowsAppAttributionBannerForBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "checkAndConsumeShowsAppAttributionBannerForBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __66__CPSDaemonConnection_confirmLocationWithURL_inRegion_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "confirmLocationWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __63__CPSDaemonConnection_performValidationWithRequest_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "performValidationWithRequest: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __77__CPSDaemonConnection_fetchAMPMetadataForDiagnosticsWithBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchAMPMetadataForDiagnosticsWithBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __72__CPSDaemonConnection_fetchABRMetadataForDiagnosticsWithURL_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchABRMetadataForDiagnosticsWithURL: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __75__CPSDaemonConnection_fetchWebClipsUUIDStringForClientBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchWebClipsUUIDStringForClientBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __74__CPSDaemonConnection_fetchWebClipsURLStringForClientBundleID_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "fetchWebClipsURLStringForClientBundleID: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

void __69__CPSDaemonConnection_getWebClipDictionaryWithIdentifier_completion___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  int v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "cps_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21559C000, v4, v5, "getWebClipDictionaryWithIdentifier: Cannot connect to daemon with error: %{public}@", v6, v7, v8, v9, v10);
}

@end