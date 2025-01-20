@interface ATServiceProxyConnection
- (ATService)service;
- (ATServiceProxyConnection)initWithService:(id)a3 connection:(id)a4;
- (NSXPCConnection)connection;
- (void)connectWithCompletion:(id)a3;
- (void)fetchMessageLinksWithCompletion:(id)a3;
- (void)service:(id)a3 willOpenMessageLink:(id)a4;
- (void)setConnection:(id)a3;
- (void)setService:(id)a3;
@end

@implementation ATServiceProxyConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_service);
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setService:(id)a3
{
}

- (ATService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);

  return (ATService *)WeakRetained;
}

- (void)fetchMessageLinksWithCompletion:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  v5 = [(ATServiceProxyConnection *)self service];
  if (objc_opt_respondsToSelector())
  {
    v22 = v5;
    v6 = [v5 allMessageLinkProxyListeners];
    v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v14 = objc_alloc(MEMORY[0x1E4F4A2C8]);
          v15 = [v13 endpoint];
          v16 = (void *)[v14 initWithEndpoint:v15];

          v17 = [v13 messageLink];
          v18 = [v17 guid];
          [v16 setIdentifier:v18];

          v19 = [v13 messageLink];
          objc_msgSend(v16, "setOpen:", objc_msgSend(v19, "isOpen"));

          v20 = [v13 messageLink];
          objc_msgSend(v16, "setInitialized:", objc_msgSend(v20, "isInitialized"));

          v21 = [v13 messageLink];
          objc_msgSend(v16, "setEndpointType:", objc_msgSend(v21, "endpointType"));

          [v7 addObject:v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    v4[2](v4, v7, 0);
    v5 = v22;
  }
}

- (void)connectWithCompletion:(id)a3
{
}

- (void)service:(id)a3 willOpenMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [v6 proxyListenerForMessageLink:v7];
    id v9 = objc_alloc(MEMORY[0x1E4F4A2C8]);
    uint64_t v10 = [v8 endpoint];
    uint64_t v11 = (void *)[v9 initWithEndpoint:v10];

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    v13 = [(ATServiceProxyConnection *)self connection];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke;
    v19[3] = &unk_1E6B8C3C8;
    id v14 = v12;
    v20 = v14;
    v15 = [v13 remoteObjectProxyWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke_2;
    v17[3] = &unk_1E6B8C3C8;
    v18 = v14;
    v16 = v14;
    [v15 service:0 willOpenMessageLink:v11 completion:v17];

    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

intptr_t __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __56__ATServiceProxyConnection_service_willOpenMessageLink___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (ATServiceProxyConnection)initWithService:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATServiceProxyConnection;
  id v8 = [(ATServiceProxyConnection *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_service, v6);
    objc_storeStrong((id *)&v9->_connection, a4);
  }

  return v9;
}

@end