@interface ASCServicesConnection
+ (ASCServicesConnection)sharedConnection;
+ (OS_os_log)log;
- (ASCServicesConnection)init;
- (NSXPCConnection)connection;
- (NSXPCConnection)connectionIfValid;
- (OS_dispatch_queue)workQueue;
- (id)lockupFetcherService;
- (id)metricsService;
- (id)offerStateServiceWithDelegate:(id)a3;
- (id)serviceWithBlock:(id)a3;
- (id)testConnection;
- (id)utilityService;
- (void)connectionWasInterrupted;
- (void)connectionWasInvalidated;
- (void)setConnectionIfValid:(id)a3;
@end

@implementation ASCServicesConnection

+ (OS_os_log)log
{
  if (log_onceToken_6 != -1) {
    dispatch_once(&log_onceToken_6, &__block_literal_global_26);
  }
  v2 = (void *)log_log_6;

  return (OS_os_log *)v2;
}

uint64_t __28__ASCServicesConnection_log__block_invoke()
{
  log_log_6 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCServicesConnection");

  return MEMORY[0x1F41817F8]();
}

+ (ASCServicesConnection)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedConnection_sharedConnection;

  return (ASCServicesConnection *)v2;
}

uint64_t __41__ASCServicesConnection_sharedConnection__block_invoke()
{
  sharedConnection_sharedConnection = objc_alloc_init(ASCServicesConnection);

  return MEMORY[0x1F41817F8]();
}

- (ASCServicesConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASCServicesConnection;
  v2 = [(ASCServicesConnection *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AppStoreComponents.ServiceConnection", v3);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (NSXPCConnection)connection
{
  v3 = [(ASCServicesConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = [(ASCServicesConnection *)self connectionIfValid];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.appstorecomponentsd.xpc" options:0];
    objc_super v7 = ASCServiceBrokerGetInterface();
    [v6 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__ASCServicesConnection_connection__block_invoke;
    v12[3] = &unk_1E645D7E8;
    objc_copyWeak(&v13, &location);
    [v6 setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __35__ASCServicesConnection_connection__block_invoke_2;
    v10[3] = &unk_1E645D7E8;
    objc_copyWeak(&v11, &location);
    [v6 setInvalidationHandler:v10];
    v8 = [(ASCServicesConnection *)self workQueue];
    [v6 _setQueue:v8];

    [v6 resume];
    [(ASCServicesConnection *)self setConnectionIfValid:v6];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return (NSXPCConnection *)v6;
}

void __35__ASCServicesConnection_connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInterrupted];
}

void __35__ASCServicesConnection_connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInvalidated];
}

- (void)connectionWasInterrupted
{
  v3 = [(ASCServicesConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = +[ASCServicesConnection log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "daemon connection interrupted", v6, 2u);
  }

  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ASCServicesConnectionWasInterruptedNotification" object:self];
}

- (void)connectionWasInvalidated
{
  v3 = [(ASCServicesConnection *)self workQueue];
  dispatch_assert_queue_V2(v3);

  dispatch_queue_t v4 = +[ASCServicesConnection log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "daemon connection invalidated", v6, 2u);
  }

  [(ASCServicesConnection *)self setConnectionIfValid:0];
  v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"ASCServicesConnectionWasInvalidatedNotification" object:self];
}

- (id)serviceWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4DDB0]);
  id v6 = [(ASCServicesConnection *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__ASCServicesConnection_serviceWithBlock___block_invoke;
  block[3] = &unk_1E645EB48;
  block[4] = self;
  id v7 = v5;
  id v13 = v7;
  id v14 = v4;
  id v8 = v4;
  dispatch_async(v6, block);

  v9 = v14;
  id v10 = v7;

  return v10;
}

void __42__ASCServicesConnection_serviceWithBlock___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__ASCServicesConnection_serviceWithBlock___block_invoke_2;
  v4[3] = &unk_1E645D738;
  id v5 = *(id *)(a1 + 40);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v4];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __42__ASCServicesConnection_serviceWithBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

- (id)testConnection
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4DDA0]);
  id v4 = [(ASCServicesConnection *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__ASCServicesConnection_testConnection__block_invoke;
  v9[3] = &unk_1E645D920;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_async(v4, v9);

  id v6 = v10;
  id v7 = v5;

  return v7;
}

void __39__ASCServicesConnection_testConnection__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ASCServicesConnection_testConnection__block_invoke_2;
  v6[3] = &unk_1E645D738;
  id v7 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v6];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__ASCServicesConnection_testConnection__block_invoke_3;
  v4[3] = &unk_1E645D738;
  id v5 = *(id *)(a1 + 40);
  [v3 testConnectionWithReplyHandler:v4];
}

uint64_t __39__ASCServicesConnection_testConnection__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __39__ASCServicesConnection_testConnection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  if (a2) {
    return [v2 finishWithError:a2];
  }
  else {
    return [v2 finishWithSuccess];
  }
}

- (id)lockupFetcherService
{
  return [(ASCServicesConnection *)self serviceWithBlock:&__block_literal_global_20];
}

void __45__ASCServicesConnection_lockupFetcherService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 completionHandlerAdapter];
  [v4 getLockupFetcherServiceWithReplyHandler:v5];
}

- (id)metricsService
{
  return [(ASCServicesConnection *)self serviceWithBlock:&__block_literal_global_22_0];
}

void __39__ASCServicesConnection_metricsService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 completionHandlerAdapter];
  [v4 getMetricsServiceWithReplyHandler:v5];
}

- (id)offerStateServiceWithDelegate:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ASCServicesConnection_offerStateServiceWithDelegate___block_invoke;
  v8[3] = &unk_1E645EB90;
  id v9 = v4;
  id v5 = v4;
  id v6 = [(ASCServicesConnection *)self serviceWithBlock:v8];

  return v6;
}

void __55__ASCServicesConnection_offerStateServiceWithDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 completionHandlerAdapter];
  [v5 getAppOfferStateServiceForDelegate:v4 withReplyHandler:v6];
}

- (id)utilityService
{
  return [(ASCServicesConnection *)self serviceWithBlock:&__block_literal_global_24];
}

void __39__ASCServicesConnection_utilityService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 completionHandlerAdapter];
  [v4 getUtilityServiceWithReplyHandler:v5];
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSXPCConnection)connectionIfValid
{
  return self->_connectionIfValid;
}

- (void)setConnectionIfValid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIfValid, 0);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end