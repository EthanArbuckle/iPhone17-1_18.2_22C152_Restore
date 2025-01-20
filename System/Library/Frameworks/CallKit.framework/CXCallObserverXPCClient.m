@interface CXCallObserverXPCClient
+ (id)sharedXPCClient;
+ (id)sharedXPCClientSemaphore;
+ (void)releaseSharedXPCClient;
- (BOOL)clientsShouldConnect;
- (CXCallObserverXPCClient)init;
- (NSDictionary)callUUIDToCallMap;
- (NSHashTable)delegates;
- (NSMutableDictionary)mutableCallUUIDToCallMap;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)concurrentQueue;
- (id)_init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3 isSynchronous:(BOOL)a4;
- (int)clientsShouldConnectToken;
- (void)_addOrUpdateCall:(id)a3;
- (void)_invalidate;
- (void)_markAllCallsAsEnded;
- (void)_removeCall:(id)a3;
- (void)_requestCalls;
- (void)addDelegate:(id)a3;
- (void)addOrUpdateCall:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeCall:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)requestTransaction:(id)a3 completion:(id)a4;
- (void)setClientsShouldConnect:(BOOL)a3;
- (void)setClientsShouldConnectToken:(int)a3;
- (void)setConnection:(id)a3;
@end

@implementation CXCallObserverXPCClient

uint64_t __51__CXCallObserverXPCClient_sharedXPCClientSemaphore__block_invoke()
{
  sharedXPCClientSemaphore_sharedXPCClientSemaphore_0 = (uint64_t)dispatch_semaphore_create(1);

  return MEMORY[0x1F41817F8]();
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v5);

  id v6 = [(CXCallObserverXPCClient *)self delegates];
  [v6 addObject:v4];
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_mutableCallUUIDToCallMap, 0);

  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

void __32__CXCallObserverXPCClient__init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = (int *)(v8 + 12);
  v10 = *(NSObject **)(v8 + 16);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __32__CXCallObserverXPCClient__init__block_invoke_2;
  v14 = &unk_1E5CAE330;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("com.apple.callkit.callcontroller.shouldconnect", v9, v10, &v11);
  objc_msgSend(*(id *)(a1 + 32), "_requestCalls", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_requestCalls
{
  uint64_t v3 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v3);

  BOOL v4 = [(CXCallObserverXPCClient *)self clientsShouldConnect];
  uint64_t v5 = CXDefaultLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Requesting calls from host", buf, 2u);
    }

    uint64_t v5 = [(CXCallObserverXPCClient *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_9_0 isSynchronous:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __40__CXCallObserverXPCClient__requestCalls__block_invoke_10;
    v7[3] = &unk_1E5CAE170;
    v7[4] = self;
    [v5 requestCalls:v7];
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v5, OS_LOG_TYPE_DEFAULT, "Call host has no calls", buf, 2u);
  }
}

- (BOOL)clientsShouldConnect
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (self->_clientsShouldConnect)
  {
    return 1;
  }
  else
  {
    uint64_t state64 = 0;
    uint32_t state = notify_get_state([(CXCallObserverXPCClient *)self clientsShouldConnectToken], &state64);
    if (state)
    {
      uint32_t v5 = state;
      BOOL v6 = CXDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        uint32_t v10 = v5;
        _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Bad status received attempting to get host call state: %d", buf, 8u);
      }

      return self->_clientsShouldConnect;
    }
    else
    {
      BOOL v2 = state64 != 0;
      self->_clientsShouldConnect = v2;
    }
  }
  return v2;
}

- (int)clientsShouldConnectToken
{
  return self->_clientsShouldConnectToken;
}

- (CXCallObserverXPCClient)init
{
  uint64_t v3 = [(id)objc_opt_class() sharedXPCClient];

  return v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  notify_cancel(self->_clientsShouldConnectToken);
  v3.receiver = self;
  v3.super_class = (Class)CXCallObserverXPCClient;
  [(CXCallObserverXPCClient *)&v3 dealloc];
}

+ (id)sharedXPCClient
{
  objc_super v3 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!sharedXPCClient_0)
  {
    uint64_t v4 = [objc_alloc((Class)a1) _init];
    uint32_t v5 = (void *)sharedXPCClient_0;
    sharedXPCClient_0 = v4;
  }
  ++sharedXPCClientRetainCount_0;
  BOOL v6 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_signal(v6);

  v7 = (void *)sharedXPCClient_0;

  return v7;
}

+ (id)sharedXPCClientSemaphore
{
  if (sharedXPCClientSemaphore_onceToken_0 != -1) {
    dispatch_once(&sharedXPCClientSemaphore_onceToken_0, &__block_literal_global_10);
  }
  BOOL v2 = (void *)sharedXPCClientSemaphore_sharedXPCClientSemaphore_0;

  return v2;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)CXCallObserverXPCClient;
  BOOL v2 = [(CXCallObserverXPCClient *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.callobserverxpcclient", MEMORY[0x1E4F14430]);
    concurrentQueue = v2->_concurrentQueue;
    v2->_concurrentQueue = (OS_dispatch_queue *)v3;

    uint32_t v5 = v2->_concurrentQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__CXCallObserverXPCClient__init__block_invoke;
    block[3] = &unk_1E5CADD30;
    uint64_t v8 = v2;
    dispatch_barrier_async(v5, block);
  }
  return v2;
}

- (NSDictionary)callUUIDToCallMap
{
  dispatch_queue_t v3 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = [(CXCallObserverXPCClient *)self mutableCallUUIDToCallMap];
  uint32_t v5 = (void *)[v4 copy];

  return (NSDictionary *)v5;
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (NSMutableDictionary)mutableCallUUIDToCallMap
{
  return self->_mutableCallUUIDToCallMap;
}

+ (void)releaseSharedXPCClient
{
  dispatch_queue_t v3 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!--sharedXPCClientRetainCount_0)
  {
    [(id)sharedXPCClient_0 _invalidate];
    uint64_t v4 = (void *)sharedXPCClient_0;
    sharedXPCClient_0 = 0;
  }
  uint32_t v5 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_signal(v5);
}

void __32__CXCallObserverXPCClient__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_queue_t v3 = [WeakRetained concurrentQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__CXCallObserverXPCClient__init__block_invoke_3;
    block[3] = &unk_1E5CADD30;
    id v5 = v2;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __32__CXCallObserverXPCClient__init__block_invoke_3(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(*(void *)(result + 32) + 40))
  {
    uint64_t v1 = result;
    BOOL v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      uint64_t v4 = "com.apple.callkit.callcontroller.shouldconnect";
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v3, 0xCu);
    }

    [*(id *)(v1 + 32) setClientsShouldConnect:1];
    return [*(id *)(v1 + 32) _requestCalls];
  }
  return result;
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v5);

  id v6 = [(CXCallObserverXPCClient *)self delegates];
  [v6 removeObject:v4];
}

- (void)requestTransaction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v8);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke;
  v14[3] = &unk_1E5CAE2B0;
  id v9 = v6;
  id v15 = v9;
  uint32_t v10 = [(CXCallObserverXPCClient *)self _remoteObjectProxyWithErrorHandler:v14 isSynchronous:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke_7;
  v12[3] = &unk_1E5CAE2B0;
  id v13 = v9;
  id v11 = v9;
  [v10 requestTransaction:v7 reply:v12];
}

void __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__CXCallObserverXPCClient_requestTransaction_completion___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Received reply from transaction request with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  BOOL v2 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v2);

  id v3 = objc_opt_class();

  [v3 releaseSharedXPCClient];
}

- (void)_markAllCallsAsEnded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v3);

  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [(CXCallObserverXPCClient *)self callUUIDToCallMap];
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "self.callUUIDToCallMap: %@", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(CXCallObserverXPCClient *)self callUUIDToCallMap];
  uint64_t v7 = [v6 allValues];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        [v12 setHasEnded:1];
        [(CXCallObserverXPCClient *)self _removeCall:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_addOrUpdateCall:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v5);

  id v6 = [(CXCallObserverXPCClient *)self callUUIDToCallMap];
  uint64_t v7 = [v4 UUID];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (([v8 isEqualToCall:v4] & 1) == 0)
  {
    uint64_t v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "call: %@", buf, 0xCu);
    }

    uint64_t v10 = [(CXCallObserverXPCClient *)self mutableCallUUIDToCallMap];
    id v11 = [v4 UUID];
    [v10 setObject:v4 forKeyedSubscript:v11];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = [(CXCallObserverXPCClient *)self delegates];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v16++) dataSource:self callChanged:v4];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

- (void)_removeCall:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v5);

  id v6 = [(CXCallObserverXPCClient *)self callUUIDToCallMap];
  uint64_t v7 = [v4 UUID];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    uint64_t v9 = CXDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "call: %@", buf, 0xCu);
    }

    uint64_t v10 = [(CXCallObserverXPCClient *)self mutableCallUUIDToCallMap];
    id v11 = [v4 UUID];
    [v10 removeObjectForKey:v11];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = [(CXCallObserverXPCClient *)self delegates];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v18;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v18 != v15) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v16++) dataSource:self callChanged:v4];
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v14);
    }
  }
}

void __40__CXCallObserverXPCClient__requestCalls__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __40__CXCallObserverXPCClient__requestCalls__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __40__CXCallObserverXPCClient__requestCalls__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Received requested calls from host: %@", buf, 0xCu);
  }

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(a1 + 32), "_addOrUpdateCall:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_invalidate
{
  id v3 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v3);

  connection = self->_connection;

  [(NSXPCConnection *)connection invalidate];
}

- (NSXPCConnection)connection
{
  id v3 = [(CXCallObserverXPCClient *)self concurrentQueue];
  dispatch_assert_queue_barrier(v3);

  connection = self->_connection;
  if (!connection)
  {
    id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.callkit.callcontrollerhost" options:0];
    uint64_t v6 = self->_connection;
    self->_connection = v5;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callControllerVendorInterface");
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F29280], "cx_callControllerHostInterface");
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __37__CXCallObserverXPCClient_connection__block_invoke;
    v12[3] = &unk_1E5CADED0;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__CXCallObserverXPCClient_connection__block_invoke_2;
    v10[3] = &unk_1E5CADED0;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v10];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __37__CXCallObserverXPCClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for call observer %@", buf, 0xCu);
    }

    id v3 = [WeakRetained concurrentQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CXCallObserverXPCClient_connection__block_invoke_14;
    block[3] = &unk_1E5CADD30;
    void block[4] = WeakRetained;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __37__CXCallObserverXPCClient_connection__block_invoke_14(uint64_t a1)
{
  [*(id *)(a1 + 32) _invalidate];
  [*(id *)(a1 + 32) setConnection:0];
  [*(id *)(a1 + 32) setClientsShouldConnect:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _markAllCallsAsEnded];
}

void __37__CXCallObserverXPCClient_connection__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for call observer %@", buf, 0xCu);
    }

    id v3 = [WeakRetained concurrentQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CXCallObserverXPCClient_connection__block_invoke_15;
    block[3] = &unk_1E5CADD30;
    void block[4] = WeakRetained;
    dispatch_barrier_async(v3, block);
  }
}

uint64_t __37__CXCallObserverXPCClient_connection__block_invoke_15(uint64_t a1)
{
  [*(id *)(a1 + 32) setConnection:0];
  [*(id *)(a1 + 32) setClientsShouldConnect:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 _markAllCallsAsEnded];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 isSynchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CXCallObserverXPCClient *)self connection];
  uint64_t v8 = v7;
  if (v6)
  {
    if (v4) {
      [v7 synchronousRemoteObjectProxyWithErrorHandler:v6];
    }
    else {
    uint64_t v9 = [v7 remoteObjectProxyWithErrorHandler:v6];
    }
  }
  else
  {
    uint64_t v9 = [v7 remoteObjectProxy];
  }
  long long v10 = (void *)v9;

  return v10;
}

- (void)addOrUpdateCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallObserverXPCClient *)self concurrentQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CXCallObserverXPCClient_addOrUpdateCall___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __43__CXCallObserverXPCClient_addOrUpdateCall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addOrUpdateCall:*(void *)(a1 + 40)];
}

- (void)removeCall:(id)a3
{
  id v4 = a3;
  id v5 = [(CXCallObserverXPCClient *)self concurrentQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CXCallObserverXPCClient_removeCall___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(v5, v7);
}

uint64_t __38__CXCallObserverXPCClient_removeCall___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeCall:*(void *)(a1 + 40)];
}

- (void)setConnection:(id)a3
{
}

- (void)setClientsShouldConnectToken:(int)a3
{
  self->_clientsShouldConnectToken = a3;
}

- (void)setClientsShouldConnect:(BOOL)a3
{
  self->_clientsShouldConnect = a3;
}

void __40__CXCallObserverXPCClient__requestCalls__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error requesting calls from host: %@", (uint8_t *)&v2, 0xCu);
}

@end