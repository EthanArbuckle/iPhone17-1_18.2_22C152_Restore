@interface ATServiceProxy
- (ATServiceProxy)init;
- (ATServiceProxy)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)messageLinks;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)service:(id)a3 willOpenMessageLink:(id)a4;
- (void)service:(id)a3 willOpenMessageLink:(id)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
@end

@implementation ATServiceProxy

- (void).cxx_destruct
{
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)service:(id)a3 willOpenMessageLink:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = [(ATService *)self observers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) service:self willOpenMessageLink:v5];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)service:(id)a3 willOpenMessageLink:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = (void (**)(id, void))a5;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [(ATService *)self observers];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v13++) service:self willOpenMessageLink:v7];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }

  v8[2](v8, 0);
}

- (id)messageLinks
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__363;
  v21 = __Block_byref_object_dispose__364;
  id v22 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_DEFAULT, "get message links", buf, 2u);
  }

  connection = self->_connection;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __30__ATServiceProxy_messageLinks__block_invoke;
  v14[3] = &unk_264281158;
  v6 = v3;
  long long v15 = v6;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __30__ATServiceProxy_messageLinks__block_invoke_65;
  v11[3] = &unk_264280FC0;
  uint64_t v13 = &v17;
  uint64_t v8 = v6;
  uint64_t v12 = v8;
  [v7 fetchMessageLinksWithCompletion:v11];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __30__ATServiceProxy_messageLinks__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_2164B1000, v4, OS_LOG_TYPE_ERROR, "get message links - failed to obtain remote proxy. err=%{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __30__ATServiceProxy_messageLinks__block_invoke_65(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    uint64_t v10 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138543362;
      uint64_t v12 = v6;
      _os_log_impl(&dword_2164B1000, v10, OS_LOG_TYPE_ERROR, "failed to get message links from service. err=%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263EFFA08] setWithArray:a2];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(ATServiceProxy *)self connection];
  id v6 = [v5 remoteObjectProxy];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __30__ATServiceProxy_addObserver___block_invoke;
  v8[3] = &unk_264281158;
  v8[4] = self;
  [v6 connectWithCompletion:v8];

  v7.receiver = self;
  v7.super_class = (Class)ATServiceProxy;
  [(ATService *)&v7 addObserver:v4];
}

void __30__ATServiceProxy_addObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (a2)
  {
    id v3 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138543362;
      uint64_t v6 = v4;
      _os_log_impl(&dword_2164B1000, v3, OS_LOG_TYPE_ERROR, "%{public}@ failed to connect to remote service", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (ATServiceProxy)init
{
  return [(ATServiceProxy *)self initWithConnection:0];
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)ATServiceProxy;
  [(ATServiceProxy *)&v4 dealloc];
}

- (ATServiceProxy)initWithConnection:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATServiceProxy;
  int v5 = [(ATService *)&v15 init];
  if (v5)
  {
    if (v4)
    {
      uint64_t v6 = (NSXPCConnection *)v4;
      connection = v5->_connection;
      v5->_connection = v6;
    }
    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.atc.xpc.service" options:0];
      id v9 = v5->_connection;
      v5->_connection = (NSXPCConnection *)v8;

      connection = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719E08];
      [connection setClass:objc_opt_class() forSelector:sel_service_willOpenMessageLink_completion_ argumentIndex:1 ofReply:0];
      [(NSXPCConnection *)v5->_connection setExportedInterface:connection];
      uint64_t v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719ED0];
      int v11 = (void *)MEMORY[0x263EFFA08];
      uint64_t v12 = objc_opt_class();
      uint64_t v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
      [v10 setClasses:v13 forSelector:sel_fetchMessageLinksWithCompletion_ argumentIndex:0 ofReply:1];

      [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v10];
      [(NSXPCConnection *)v5->_connection setExportedObject:v5];
      [(NSXPCConnection *)v5->_connection setInterruptionHandler:&__block_literal_global_373];
      [(NSXPCConnection *)v5->_connection setInvalidationHandler:&__block_literal_global_59];
      [(NSXPCConnection *)v5->_connection resume];
    }
  }

  return v5;
}

void __37__ATServiceProxy_initWithConnection___block_invoke_57()
{
  v0 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2164B1000, v0, OS_LOG_TYPE_DEFAULT, "xpc connection invalidated", v1, 2u);
  }
}

void __37__ATServiceProxy_initWithConnection___block_invoke()
{
  v0 = os_log_create("com.apple.amp.AirTraffic", "XPC");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2164B1000, v0, OS_LOG_TYPE_DEFAULT, "xpc connection interrupted", v1, 2u);
  }
}

@end