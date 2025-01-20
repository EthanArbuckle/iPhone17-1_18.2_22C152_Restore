@interface AKCarouselAlertClientConnection
+ (id)sharedConnection;
- (AKCarouselAlertClientConnection)init;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)internalQueue;
- (id)connection;
- (void)dealloc;
- (void)dismissAlert:(id)a3;
- (void)presentAlertWithDictionary:(id)a3 completion:(id)a4;
- (void)setInternalQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)unsafe_invalidate;
@end

@implementation AKCarouselAlertClientConnection

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedConnection_sharedConnection;

  return v2;
}

uint64_t __51__AKCarouselAlertClientConnection_sharedConnection__block_invoke()
{
  sharedConnection_sharedConnection = objc_alloc_init(AKCarouselAlertClientConnection);

  return MEMORY[0x1F41817F8]();
}

- (AKCarouselAlertClientConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)AKCarouselAlertClientConnection;
  v2 = [(AKCarouselAlertClientConnection *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AuthKit.alertRequestQueue", v3);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)unsafe_invalidate
{
  [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;
}

- (void)dealloc
{
  [(AKCarouselAlertClientConnection *)self unsafe_invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AKCarouselAlertClientConnection;
  [(AKCarouselAlertClientConnection *)&v3 dealloc];
}

- (id)connection
{
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    dispatch_queue_t v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Carousel.authAlertXPCService" options:4096];
    v5 = self->_xpcConnection;
    self->_xpcConnection = v4;

    v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EE461F30];
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v6];

    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke;
    v10[3] = &unk_1E575EA98;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke_2;
    v8[3] = &unk_1E575EA98;
    objc_copyWeak(&v9, &location);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:v8];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    xpcConnection = self->_xpcConnection;
  }

  return xpcConnection;
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__AKCarouselAlertClientConnection_connection__block_invoke_cold_1();
  }

  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke_53;
    block[3] = &unk_1E575EA70;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __45__AKCarouselAlertClientConnection_connection__block_invoke_53(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) xpcConnection];
  [v2 invalidate];

  objc_super v3 = *(void **)(a1 + 32);

  return [v3 setXpcConnection:0];
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__AKCarouselAlertClientConnection_connection__block_invoke_2_cold_1();
  }

  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained internalQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AKCarouselAlertClientConnection_connection__block_invoke_54;
    block[3] = &unk_1E575EA70;
    id v5 = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __45__AKCarouselAlertClientConnection_connection__block_invoke_54(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

- (void)presentAlertWithDictionary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke;
  v11[3] = &unk_1E575EB10;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(internalQueue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_super v3 = [WeakRetained connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2;
  v8[3] = &unk_1E575EAC0;
  id v9 = *(id *)(a1 + 40);
  dispatch_queue_t v4 = [v3 remoteObjectProxyWithErrorHandler:v8];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_56;
  v6[3] = &unk_1E575EAE8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v4 presentAlertWithDictionary:v5 completion:v6];
}

void __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_queue_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_56(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissAlert:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AKCarouselAlertClientConnection_dismissAlert___block_invoke;
  block[3] = &unk_1E575EB58;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__AKCarouselAlertClientConnection_dismissAlert___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_59];
  [v3 dismissAlert:*(void *)(a1 + 32)];
}

void __48__AKCarouselAlertClientConnection_dismissAlert___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2_cold_1();
  }
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);

  objc_storeStrong((id *)&self->_internalQueue, 0);
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "self: (%p); Connection interrupted", v2, v3, v4, v5, v6);
}

void __45__AKCarouselAlertClientConnection_connection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "self: (%p); Connection invalidated", v2, v3, v4, v5, v6);
}

void __73__AKCarouselAlertClientConnection_presentAlertWithDictionary_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_193494000, v0, v1, "error communicating to XPC: %@", v2, v3, v4, v5, v6);
}

@end