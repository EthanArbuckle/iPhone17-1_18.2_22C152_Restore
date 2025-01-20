@interface CXVoicemailObserverXPCClient
+ (id)sharedXPCClient;
+ (id)sharedXPCClientSemaphore;
+ (void)releaseSharedXPCClient;
- (CXVoicemailObserverXPCClient)init;
- (NSDictionary)voicemailUUIDToVoicemailMap;
- (NSHashTable)delegates;
- (NSMutableDictionary)mutableVoicemailUUIDToVoicemailMap;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)_init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3 isSynchronous:(BOOL)a4;
- (int)notifyToken;
- (void)_addOrUpdateVoicemails:(id)a3;
- (void)_invalidate;
- (void)_removeVoicemails:(id)a3;
- (void)_requestVoicemails;
- (void)addDelegate:(id)a3;
- (void)addOrUpdateVoicemails:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeDelegate:(id)a3;
- (void)removeVoicemails:(id)a3;
- (void)requestTransaction:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation CXVoicemailObserverXPCClient

+ (id)sharedXPCClientSemaphore
{
  if (sharedXPCClientSemaphore_onceToken != -1) {
    dispatch_once(&sharedXPCClientSemaphore_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)sharedXPCClientSemaphore_sharedXPCClientSemaphore;

  return v2;
}

uint64_t __56__CXVoicemailObserverXPCClient_sharedXPCClientSemaphore__block_invoke()
{
  sharedXPCClientSemaphore_sharedXPCClientSemaphore = (uint64_t)dispatch_semaphore_create(1);

  return MEMORY[0x1F41817F8]();
}

+ (id)sharedXPCClient
{
  v3 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!sharedXPCClient)
  {
    uint64_t v4 = [objc_alloc((Class)a1) _init];
    v5 = (void *)sharedXPCClient;
    sharedXPCClient = v4;
  }
  ++sharedXPCClientRetainCount;
  v6 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_signal(v6);

  v7 = (void *)sharedXPCClient;

  return v7;
}

+ (void)releaseSharedXPCClient
{
  v3 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);

  if (!--sharedXPCClientRetainCount)
  {
    [(id)sharedXPCClient _invalidate];
    uint64_t v4 = (void *)sharedXPCClient;
    sharedXPCClient = 0;
  }
  v5 = [a1 sharedXPCClientSemaphore];
  dispatch_semaphore_signal(v5);
}

- (CXVoicemailObserverXPCClient)init
{
  v3 = [(id)objc_opt_class() sharedXPCClient];

  return v3;
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)CXVoicemailObserverXPCClient;
  v2 = [(CXVoicemailObserverXPCClient *)&v9 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.callkit.voicemailobserverxpcclient", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CXVoicemailObserverXPCClient__init__block_invoke;
    block[3] = &unk_1E5CADD30;
    v8 = v2;
    dispatch_async(v5, block);
  }
  return v2;
}

void __37__CXVoicemailObserverXPCClient__init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v5;

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v8 = *(void *)(a1 + 32);
  objc_super v9 = (int *)(v8 + 8);
  v10 = *(NSObject **)(v8 + 16);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __37__CXVoicemailObserverXPCClient__init__block_invoke_2;
  v14 = &unk_1E5CAE330;
  objc_copyWeak(&v15, &location);
  notify_register_dispatch("com.apple.callkit.voicemailcontrollerhost.started", v9, v10, &v11);
  objc_msgSend(*(id *)(a1 + 32), "_requestVoicemails", v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __37__CXVoicemailObserverXPCClient__init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__CXVoicemailObserverXPCClient__init__block_invoke_3;
    block[3] = &unk_1E5CADD30;
    id v5 = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __37__CXVoicemailObserverXPCClient__init__block_invoke_3(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "com.apple.callkit.voicemailcontrollerhost.started";
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) _requestVoicemails];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  notify_cancel(self->_notifyToken);
  v3.receiver = self;
  v3.super_class = (Class)CXVoicemailObserverXPCClient;
  [(CXVoicemailObserverXPCClient *)&v3 dealloc];
}

- (NSDictionary)voicemailUUIDToVoicemailMap
{
  objc_super v3 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  int v4 = [(CXVoicemailObserverXPCClient *)self mutableVoicemailUUIDToVoicemailMap];
  id v5 = (void *)[v4 copy];

  return (NSDictionary *)v5;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CXVoicemailObserverXPCClient *)self delegates];
  [v6 addObject:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CXVoicemailObserverXPCClient *)self delegates];
  [v6 removeObject:v4];
}

- (void)requestTransaction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v8);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke;
  v14[3] = &unk_1E5CAE2B0;
  id v9 = v6;
  id v15 = v9;
  v10 = [(CXVoicemailObserverXPCClient *)self _remoteObjectProxyWithErrorHandler:v14 isSynchronous:0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_7;
  v12[3] = &unk_1E5CAE2B0;
  id v13 = v9;
  id v11 = v9;
  [v10 requestTransaction:v7 reply:v12];
}

void __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_7(uint64_t a1, void *a2)
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
  uint64_t v2 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v2);

  id v3 = objc_opt_class();

  [v3 releaseSharedXPCClient];
}

- (void)_addOrUpdateVoicemails:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v30;
    *(void *)&long long v8 = 138412290;
    long long v24 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        id v13 = [(CXVoicemailObserverXPCClient *)self voicemailUUIDToVoicemailMap];
        v14 = [v12 UUID];
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (([v15 isEqualToVoicemail:v12] & 1) == 0)
        {
          v16 = CXDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v35 = v12;
            _os_log_impl(&dword_1A6E3A000, v16, OS_LOG_TYPE_DEFAULT, "adding voicemail: %@", buf, 0xCu);
          }

          v17 = [(CXVoicemailObserverXPCClient *)self mutableVoicemailUUIDToVoicemailMap];
          v18 = [v12 UUID];
          [v17 setObject:v12 forKeyedSubscript:v18];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = [(CXVoicemailObserverXPCClient *)self delegates];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v23++) dataSourceVoicemailsChanged:self];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v21);
  }
}

- (void)_removeVoicemails:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v5);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v30;
    *(void *)&long long v8 = 138412290;
    long long v24 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
        id v13 = [(CXVoicemailObserverXPCClient *)self voicemailUUIDToVoicemailMap];
        v14 = [v12 UUID];
        id v15 = [v13 objectForKeyedSubscript:v14];

        if (v15)
        {
          v16 = CXDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v24;
            v35 = v12;
            _os_log_impl(&dword_1A6E3A000, v16, OS_LOG_TYPE_DEFAULT, "removing voicemail: %@", buf, 0xCu);
          }

          v17 = [(CXVoicemailObserverXPCClient *)self mutableVoicemailUUIDToVoicemailMap];
          v18 = [v12 UUID];
          [v17 removeObjectForKey:v18];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v9);
  }

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v19 = [(CXVoicemailObserverXPCClient *)self delegates];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v26;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v26 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v23++) dataSourceVoicemailsChanged:self];
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v21);
  }
}

- (void)_requestVoicemails
{
  id v3 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Requesting voicemails from host", buf, 2u);
  }

  int v5 = [(CXVoicemailObserverXPCClient *)self _remoteObjectProxyWithErrorHandler:&__block_literal_global_9 isSynchronous:1];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_10;
  v6[3] = &unk_1E5CAE170;
  v6[4] = self;
  [v5 requestVoicemails:v6];
}

void __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = CXDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v4, OS_LOG_TYPE_DEFAULT, "Received requested voicemails from host: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) _addOrUpdateVoicemails:v3];
}

- (void)_invalidate
{
  id v3 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  connection = self->_connection;

  [(NSXPCConnection *)connection invalidate];
}

- (NSXPCConnection)connection
{
  id v3 = [(CXVoicemailObserverXPCClient *)self queue];
  dispatch_assert_queue_V2(v3);

  connection = self->_connection;
  if (!connection)
  {
    int v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.callkit.voicemailcontrollerhost" options:0];
    id v6 = self->_connection;
    self->_connection = v5;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F29280], "cx_voicemailControllerVendorInterface");
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    long long v8 = objc_msgSend(MEMORY[0x1E4F29280], "cx_voicemailControllerHostInterface");
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v8];

    objc_initWeak(&location, self);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    uint64_t v12 = __42__CXVoicemailObserverXPCClient_connection__block_invoke;
    id v13 = &unk_1E5CADED0;
    objc_copyWeak(&v14, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&v10];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __42__CXVoicemailObserverXPCClient_connection__block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for voicemail observer %@", buf, 0xCu);
    }

    id v3 = [WeakRetained queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__CXVoicemailObserverXPCClient_connection__block_invoke_14;
    block[3] = &unk_1E5CADD30;
    void block[4] = WeakRetained;
    dispatch_async(v3, block);
  }
}

uint64_t __42__CXVoicemailObserverXPCClient_connection__block_invoke_14(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConnection:0];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3 isSynchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(CXVoicemailObserverXPCClient *)self connection];
  long long v8 = v7;
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
  uint64_t v10 = (void *)v9;

  return v10;
}

- (void)addOrUpdateVoicemails:(id)a3
{
  id v4 = a3;
  int v5 = [(CXVoicemailObserverXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CXVoicemailObserverXPCClient_addOrUpdateVoicemails___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __54__CXVoicemailObserverXPCClient_addOrUpdateVoicemails___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addOrUpdateVoicemails:*(void *)(a1 + 40)];
}

- (void)removeVoicemails:(id)a3
{
  id v4 = a3;
  int v5 = [(CXVoicemailObserverXPCClient *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CXVoicemailObserverXPCClient_removeVoicemails___block_invoke;
  v7[3] = &unk_1E5CADC68;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __49__CXVoicemailObserverXPCClient_removeVoicemails___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeVoicemails:*(void *)(a1 + 40)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)mutableVoicemailUUIDToVoicemailMap
{
  return self->_mutableVoicemailUUIDToVoicemailMap;
}

- (NSHashTable)delegates
{
  return self->_delegates;
}

- (void)setConnection:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_mutableVoicemailUUIDToVoicemailMap, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

void __62__CXVoicemailObserverXPCClient_requestTransaction_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Received error from transaction request: %@", (uint8_t *)&v2, 0xCu);
}

void __50__CXVoicemailObserverXPCClient__requestVoicemails__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Error requesting voicemails from host: %@", (uint8_t *)&v2, 0xCu);
}

@end