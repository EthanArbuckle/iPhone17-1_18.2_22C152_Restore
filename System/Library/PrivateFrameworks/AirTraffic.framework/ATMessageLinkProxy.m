@interface ATMessageLinkProxy
+ (BOOL)supportsSecureCoding;
- (ATMessageLinkProxy)initWithCoder:(id)a3;
- (ATMessageLinkProxy)initWithEndpoint:(id)a3;
- (BOOL)isInitialized;
- (BOOL)isOpen;
- (NSString)description;
- (NSString)identifier;
- (int)endpointType;
- (void)addObserver:(id)a3;
- (void)addRequestHandler:(id)a3 forDataClass:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4 completion:(id)a5;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeRequestHandlerForDataClass:(id)a3;
- (void)sendRequest:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)setEndpointType:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setInitialized:(BOOL)a3;
- (void)setOpen:(BOOL)a3;
@end

@implementation ATMessageLinkProxy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_streams, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setEndpointType:(int)a3
{
  self->_endpointType = a3;
}

- (int)endpointType
{
  return self->_endpointType;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)removeRequestHandlerForDataClass:(id)a3
{
  id v4 = a3;
  v5 = self->_requestHandlers;
  objc_sync_enter(v5);
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke;
  v17[3] = &unk_264281038;
  v17[4] = self;
  v8 = v6;
  v18 = v8;
  v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v17];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  v13 = __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke_100;
  v14 = &unk_264281038;
  v15 = self;
  v10 = v8;
  v16 = v10;
  [v9 removeRequestHandlerForDataClass:v4 completion:&v11];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  -[NSMutableDictionary removeObjectForKey:](self->_requestHandlers, "removeObjectForKey:", v4, v11, v12, v13, v14, v15);

  objc_sync_exit(v5);
}

void __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error removing request handler. failed to connect to remote proxy with error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __55__ATMessageLinkProxy_removeRequestHandlerForDataClass___block_invoke_100(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error:%{public}@ removing request handler.", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = self->_requestHandlers;
  objc_sync_enter(v8);
  [(NSMutableDictionary *)self->_requestHandlers setObject:v6 forKey:v7];
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke;
  v16[3] = &unk_264281038;
  v16[4] = self;
  uint64_t v11 = v9;
  v17 = v11;
  uint64_t v12 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v16];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke_99;
  v14[3] = &unk_264281038;
  v14[4] = self;
  v13 = v11;
  v15 = v13;
  [v12 addRequestHandler:0 forDataClass:v7 completion:v14];

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  objc_sync_exit(v8);
}

void __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error adding request handler. failed to connect to remote proxy with error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __53__ATMessageLinkProxy_addRequestHandler_forDataClass___block_invoke_99(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error:%{public}@ adding request handler.", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_observers removeObject:v5];
  objc_sync_exit(v4);
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = self->_observers;
  objc_sync_enter(v5);
  [(NSHashTable *)self->_observers addObject:v4];
  objc_sync_exit(v5);

  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  connection = self->_connection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__ATMessageLinkProxy_addObserver___block_invoke;
  v13[3] = &unk_264281038;
  v13[4] = self;
  __int16 v8 = v6;
  v14 = v8;
  id v9 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__ATMessageLinkProxy_addObserver___block_invoke_98;
  v11[3] = &unk_264281038;
  v11[4] = self;
  uint64_t v12 = v8;
  uint64_t v10 = v8;
  [v9 connectWithCompletion:v11];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void __34__ATMessageLinkProxy_addObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error adding observer. failed to connect to remote proxy with error:%{public}@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __34__ATMessageLinkProxy_addObserver___block_invoke_98(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = os_log_create("com.apple.amp.AirTraffic", "Framework");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138543618;
      uint64_t v7 = v5;
      __int16 v8 = 2114;
      id v9 = v3;
      _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "%{public}@ error:%{public}@ adding observer.", (uint8_t *)&v6, 0x16u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke;
  v14[3] = &unk_2642811F0;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  uint64_t v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke_2;
  v12[3] = &unk_2642811F0;
  id v13 = v8;
  id v11 = v8;
  [v10 sendResponse:v9 withCompletion:v12];
}

uint64_t __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __50__ATMessageLinkProxy_sendResponse_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke;
  v14[3] = &unk_2642811F0;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  uint64_t v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke_2;
  v12[3] = &unk_264280CF8;
  id v13 = v8;
  id v11 = v8;
  [v10 sendRequest:v9 withCompletion:v12];
}

uint64_t __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __49__ATMessageLinkProxy_sendRequest_withCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self->_requestHandlers;
  objc_sync_enter(v11);
  requestHandlers = self->_requestHandlers;
  id v13 = [v9 dataClass];
  v14 = [(NSMutableDictionary *)requestHandlers objectForKey:v13];

  id v15 = dispatch_get_global_queue(0, 0);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __63__ATMessageLinkProxy_messageLink_didReceiveRequest_completion___block_invoke;
  v19[3] = &unk_264280CD0;
  id v20 = v14;
  v21 = self;
  id v22 = v9;
  id v23 = v10;
  id v16 = v10;
  id v17 = v9;
  id v18 = v14;
  dispatch_async(v15, v19);

  objc_sync_exit(v11);
}

uint64_t __63__ATMessageLinkProxy_messageLink_didReceiveRequest_completion___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) messageLink:*(void *)(a1 + 40) didReceiveRequest:*(void *)(a1 + 48)];
  }
  v2 = [*(id *)(a1 + 48) dataStream];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 48) dataStream];
    [v3 streamStatus];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v4();
}

- (void)messageLinkWasClosed:(id)a3
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ATMessageLinkProxy_messageLinkWasClosed___block_invoke;
  block[3] = &unk_264281378;
  block[4] = self;
  dispatch_async(v4, block);
}

void __43__ATMessageLinkProxy_messageLinkWasClosed___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    id v3 = *(id *)(v1 + 24);
    objc_sync_enter(v3);
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 24);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v8, "messageLinkWasClosed:", *(void *)(a1 + 32), (void)v9);
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
    objc_sync_exit(v3);
  }
}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ATMessageLinkProxy_messageLinkWasInitialized___block_invoke;
  block[3] = &unk_264281378;
  block[4] = self;
  dispatch_async(v4, block);
}

void __48__ATMessageLinkProxy_messageLinkWasInitialized___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  objc_sync_enter(v2);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "messageLinkWasInitialized:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)messageLinkWasOpened:(id)a3
{
  uint64_t v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__ATMessageLinkProxy_messageLinkWasOpened___block_invoke;
  block[3] = &unk_264281378;
  block[4] = self;
  dispatch_async(v4, block);
}

void __43__ATMessageLinkProxy_messageLinkWasOpened___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  objc_sync_enter(v2);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "messageLinkWasOpened:", *(void *)(a1 + 32), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)encodeWithCoder:(id)a3
{
  endpoint = self->_endpoint;
  id v5 = a3;
  [v5 encodeObject:endpoint forKey:@"endpoint"];
  [v5 encodeBool:self->_initialized forKey:@"initialized"];
  [v5 encodeBool:self->_open forKey:@"open"];
  [v5 encodeInt32:self->_endpointType forKey:@"endpointType"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
}

- (ATMessageLinkProxy)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATMessageLinkProxy *)self initWithEndpoint:0];
  if (v5)
  {
    v5->_open = [v4 decodeBoolForKey:@"open"];
    v5->_initialized = [v4 decodeBoolForKey:@"initialized"];
    v5->_endpointType = [v4 decodeInt32ForKey:@"endpointType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    long long v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    uint64_t v9 = [objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v8];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v9;

    long long v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719A40];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v11];

    long long v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719B20];
    [(NSXPCConnection *)v5->_connection setExportedInterface:v12];
    [(NSXPCConnection *)v5->_connection setExportedObject:v5];
    objc_initWeak(&location, v5);
    uint64_t v13 = v5->_connection;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    id v17 = __36__ATMessageLinkProxy_initWithCoder___block_invoke;
    id v18 = &unk_2642811A8;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:&v15];
    [(NSXPCConnection *)v5->_connection resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __36__ATMessageLinkProxy_initWithCoder___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained messageLinkWasClosed:0];
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(ATMessageLinkProxy *)self identifier];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %p \"%@\" open=%d, initialized=%d, endpointType=%d>", v5, self, v6, self->_open, self->_initialized, self->_endpointType];

  return (NSString *)v7;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)ATMessageLinkProxy;
  [(ATMessageLinkProxy *)&v4 dealloc];
}

- (ATMessageLinkProxy)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATMessageLinkProxy;
  uint64_t v6 = [(ATMessageLink *)&v15 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    uint64_t v8 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    uint64_t v10 = objc_opt_new();
    requestHandlers = v7->_requestHandlers;
    v7->_requestHandlers = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9C0] set];
    streams = v7->_streams;
    v7->_streams = (NSMutableSet *)v12;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end