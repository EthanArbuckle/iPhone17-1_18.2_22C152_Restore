@interface CXNetworkExtensionMessageControllerHost
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CXNetworkExtensionMessageControllerHost)init;
- (NSMapTable)delegateToQueue;
- (NSMutableSet)connections;
- (NSXPCListener)xpcListener;
- (os_unfair_lock_s)accessorLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)networkExtensionMessageControllerHostConnection:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5;
- (void)networkExtensionMessageControllerHostConnection:(id)a3 didReceiveIncomingPushToTalkMessage:(id)a4 forBundleIdentifier:(id)a5;
- (void)networkExtensionMessageControllerHostConnectionInvalidated:(id)a3;
- (void)removeDelegate:(id)a3;
@end

@implementation CXNetworkExtensionMessageControllerHost

- (CXNetworkExtensionMessageControllerHost)init
{
  v11.receiver = self;
  v11.super_class = (Class)CXNetworkExtensionMessageControllerHost;
  v2 = [(CXNetworkExtensionMessageControllerHost *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_accessorLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    connections = v3->_connections;
    v3->_connections = v4;

    uint64_t v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v3->_delegateToQueue;
    v3->_delegateToQueue = (NSMapTable *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.callkit.networkextension.messagecontrollerhost"];
    xpcListener = v3->_xpcListener;
    v3->_xpcListener = (NSXPCListener *)v8;

    [(NSXPCListener *)v3->_xpcListener setDelegate:v3];
    [(NSXPCListener *)v3->_xpcListener resume];
  }
  return v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v10 = a4;
  p_accessorLock = &self->_accessorLock;
  id v7 = a3;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v8 = [(CXNetworkExtensionMessageControllerHost *)self delegateToQueue];
  if (v10) {
    id v9 = v10;
  }
  else {
    id v9 = (id)MEMORY[0x1E4F14428];
  }
  [v8 setObject:v9 forKey:v7];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)removeDelegate:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  uint64_t v6 = [(CXNetworkExtensionMessageControllerHost *)self delegateToQueue];
  [v6 removeObjectForKey:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)networkExtensionMessageControllerHostConnectionInvalidated:(id)a3
{
  p_accessorLock = &self->_accessorLock;
  id v5 = a3;
  os_unfair_lock_lock(p_accessorLock);
  uint64_t v6 = [(CXNetworkExtensionMessageControllerHost *)self connections];
  [v6 removeObject:v5];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)networkExtensionMessageControllerHostConnection:(id)a3 didReceiveIncomingMessage:(id)a4 forBundleIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_t lock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(CXNetworkExtensionMessageControllerHost *)self delegateToQueue];
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
        v14 = [(CXNetworkExtensionMessageControllerHost *)self delegateToQueue];
        v15 = [v14 objectForKey:v13];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __137__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingMessage_forBundleIdentifier___block_invoke;
        block[3] = &unk_1E5CAE018;
        block[4] = v13;
        block[5] = self;
        id v19 = v7;
        id v20 = v8;
        dispatch_async(v15, block);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(lock);
}

uint64_t __137__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingMessage_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkExtensionMessageControllerHost:*(void *)(a1 + 40) didReceiveIncomingMessage:*(void *)(a1 + 48) forBundleIdentifier:*(void *)(a1 + 56)];
}

- (void)networkExtensionMessageControllerHostConnection:(id)a3 didReceiveIncomingPushToTalkMessage:(id)a4 forBundleIdentifier:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  os_unfair_lock_t lock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = [(CXNetworkExtensionMessageControllerHost *)self delegateToQueue];
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v21 + 1) + 8 * v12);
        v14 = [(CXNetworkExtensionMessageControllerHost *)self delegateToQueue];
        v15 = [v14 objectForKey:v13];

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __147__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingPushToTalkMessage_forBundleIdentifier___block_invoke;
        block[3] = &unk_1E5CAE018;
        block[4] = v13;
        block[5] = self;
        id v19 = v7;
        id v20 = v8;
        dispatch_async(v15, block);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  os_unfair_lock_unlock(lock);
}

uint64_t __147__CXNetworkExtensionMessageControllerHost_networkExtensionMessageControllerHostConnection_didReceiveIncomingPushToTalkMessage_forBundleIdentifier___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) networkExtensionMessageControllerHost:*(void *)(a1 + 40) didReceiveIncomingPushToTalkMessage:*(void *)(a1 + 48) forBundleIdentifier:*(void *)(a1 + 56)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = CXDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v5;
    _os_log_impl(&dword_1A6E3A000, v6, OS_LOG_TYPE_DEFAULT, "Asked to accept new connection from %@", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [[CXNetworkExtensionMessageControllerHostConnection alloc] initWithConnection:v5];
  [(CXNetworkExtensionMessageControllerHostConnection *)v7 setDelegate:self];
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  uint64_t v9 = [(CXNetworkExtensionMessageControllerHost *)self connections];
  [v9 addObject:v7];

  os_unfair_lock_unlock(p_accessorLock);
  return 1;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSMutableSet)connections
{
  return self->_connections;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_delegateToQueue, 0);

  objc_storeStrong((id *)&self->_connections, 0);
}

@end