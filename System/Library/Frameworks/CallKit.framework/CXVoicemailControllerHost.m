@interface CXVoicemailControllerHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CXVoicemailControllerHost)init;
- (CXVoicemailControllerHost)initWithVoicemails:(id)a3 delegate:(id)a4 queue:(id)a5;
- (CXVoicemailControllerHostDelegate)delegate;
- (NSMutableDictionary)voicemailUUIDToVoicemailMap;
- (NSMutableSet)connections;
- (NSXPCListener)xpcListener;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (id)_voicemailsForVoicemailControllerHostConnection:(id)a3;
- (void)_performDelegateCallback:(id)a3;
- (void)addOrUpdateVoicemails:(id)a3;
- (void)removeVoicemails:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setVoicemailUUIDToVoicemailMap:(id)a3;
- (void)setXpcListener:(id)a3;
- (void)voicemailControllerHostConnection:(id)a3 requestTransaction:(id)a4 completion:(id)a5;
- (void)voicemailControllerHostConnection:(id)a3 requestVoicemails:(id)a4;
- (void)voicemailControllerHostConnectionInvalidated:(id)a3;
@end

@implementation CXVoicemailControllerHost

- (CXVoicemailControllerHost)init
{
  return 0;
}

- (CXVoicemailControllerHost)initWithVoicemails:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CXVoicemailControllerHost;
  v9 = [(CXVoicemailControllerHost *)&v18 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[@"com.apple.callkit.voicemailcontrollerhost" UTF8String], 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    v12 = v9->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__CXVoicemailControllerHost_initWithVoicemails_delegate_queue___block_invoke;
    block[3] = &unk_1E5CADD08;
    v15 = v9;
    id v16 = v7;
    id v17 = v8;
    dispatch_async(v12, block);
  }
  return v9;
}

uint64_t __63__CXVoicemailControllerHost_initWithVoicemails_delegate_queue___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 48));
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v5;

  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.callkit.voicemailcontrollerhost"];
  uint64_t v9 = *(void *)(a1 + 32);
  dispatch_queue_t v10 = *(void **)(v9 + 32);
  *(void *)(v9 + 32) = v8;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 32) resume];
  int out_token = 0;
  notify_register_check("com.apple.callkit.voicemailcontrollerhost.started", &out_token);
  notify_set_state(out_token, 1uLL);
  return notify_post("com.apple.callkit.voicemailcontrollerhost.started");
}

- (void)addOrUpdateVoicemails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXVoicemailControllerHost *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__CXVoicemailControllerHost_addOrUpdateVoicemails___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__CXVoicemailControllerHost_addOrUpdateVoicemails___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 40) voicemailUUIDToVoicemailMap];
        uint64_t v9 = [v7 UUID];
        [v8 setObject:v7 forKeyedSubscript:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dispatch_queue_t v10 = objc_msgSend(*(id *)(a1 + 40), "connections", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) addOrUpdateVoicemails:*(void *)(a1 + 32)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)removeVoicemails:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXVoicemailControllerHost *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CXVoicemailControllerHost_removeVoicemails___block_invoke;
  v7[3] = &unk_1E5CADC68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __46__CXVoicemailControllerHost_removeVoicemails___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v20;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v19 + 1) + 8 * v6);
        id v8 = [*(id *)(a1 + 40) voicemailUUIDToVoicemailMap];
        uint64_t v9 = [v7 UUID];
        [v8 removeObjectForKey:v9];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  dispatch_queue_t v10 = objc_msgSend(*(id *)(a1 + 40), "connections", 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * v14++) removeVoicemails:*(void *)(a1 + 32)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)_performDelegateCallback:(id)a3
{
  dispatch_block_t block = a3;
  uint64_t v4 = [(CXVoicemailControllerHost *)self queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = [(CXVoicemailControllerHost *)self delegate];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = [(CXVoicemailControllerHost *)self delegateQueue];

    if (v7)
    {
      id v8 = [(CXVoicemailControllerHost *)self delegateQueue];
      dispatch_async(v8, block);
    }
  }
}

- (id)_voicemailsForVoicemailControllerHostConnection:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CXVoicemailControllerHost *)self queue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)MEMORY[0x1E4F1CA48];
  id v7 = [(CXVoicemailControllerHost *)self voicemailUUIDToVoicemailMap];
  id v8 = objc_msgSend(v6, "arrayWithCapacity:", objc_msgSend(v7, "count"));

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v9 = [(CXVoicemailControllerHost *)self voicemailUUIDToVoicemailMap];
  dispatch_queue_t v10 = [v9 allValues];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v4 isPermittedToUsePrivateAPI])
        {
          id v16 = v15;
        }
        else
        {
          id v16 = [v15 sanitizedCopy];
        }
        long long v17 = v16;
        [v8 addObject:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  long long v18 = (void *)[v8 copy];

  return v18;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = CXDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_1A6E3A000, v8, OS_LOG_TYPE_DEFAULT, "listener: %@ newConnection: %@", buf, 0x16u);
  }

  uint64_t v9 = [CXVoicemailControllerHostConnection alloc];
  dispatch_queue_t v10 = [(CXVoicemailControllerHost *)self queue];
  uint64_t v11 = [(CXVoicemailControllerHostConnection *)v9 initWithConnection:v7 serialQueue:v10];

  if (v11)
  {
    [(CXVoicemailControllerHostConnection *)v11 setDelegate:self];
    uint64_t v12 = [(CXVoicemailControllerHost *)self queue];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__CXVoicemailControllerHost_listener_shouldAcceptNewConnection___block_invoke;
    v15[3] = &unk_1E5CADC68;
    v15[4] = self;
    id v16 = v11;
    dispatch_async(v12, v15);
  }
  else
  {
    uint64_t v13 = CXDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1A6E3A000, v13, OS_LOG_TYPE_DEFAULT, "[WARN] Not accepting connection %@ because a CXXPCVoicemailSource couldn't be created", buf, 0xCu);
    }
  }
  return v11 != 0;
}

void __64__CXVoicemailControllerHost_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connections];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)voicemailControllerHostConnectionInvalidated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CXVoicemailControllerHost *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CXVoicemailControllerHost *)self connections];
  [v6 removeObject:v4];
}

- (void)voicemailControllerHostConnection:(id)a3 requestVoicemails:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(CXVoicemailControllerHost *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = CXDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v6;
    _os_log_impl(&dword_1A6E3A000, v9, OS_LOG_TYPE_DEFAULT, "voicemailControllerHostConnection: %@", (uint8_t *)&v11, 0xCu);
  }

  dispatch_queue_t v10 = [(CXVoicemailControllerHost *)self _voicemailsForVoicemailControllerHostConnection:v6];
  v7[2](v7, v10);
}

- (void)voicemailControllerHostConnection:(id)a3 requestTransaction:(id)a4 completion:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(CXVoicemailControllerHost *)self queue];
  dispatch_assert_queue_V2(v11);

  id v12 = CXDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl(&dword_1A6E3A000, v12, OS_LOG_TYPE_DEFAULT, "voicemailControllerHostConnection: %@ transaction: %@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__CXVoicemailControllerHost_voicemailControllerHostConnection_requestTransaction_completion___block_invoke;
  v16[3] = &unk_1E5CADE60;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  [(CXVoicemailControllerHost *)self _performDelegateCallback:v16];
}

void __93__CXVoicemailControllerHost_voicemailControllerHostConnection_requestTransaction_completion___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) applicationIdentifier];
  [v4 voicemailControllerHost:v2 clientWithIdentifier:v3 requestedTransaction:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CXVoicemailControllerHostDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CXVoicemailControllerHostDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void)setXpcListener:(id)a3
{
}

- (NSMutableDictionary)voicemailUUIDToVoicemailMap
{
  return self->_voicemailUUIDToVoicemailMap;
}

- (void)setVoicemailUUIDToVoicemailMap:(id)a3
{
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_voicemailUUIDToVoicemailMap, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end