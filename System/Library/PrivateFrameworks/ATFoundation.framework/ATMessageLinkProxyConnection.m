@interface ATMessageLinkProxyConnection
- (ATMessageLink)messageLink;
- (ATMessageLinkProxyConnection)initWithMessageLink:(id)a3 connection:(id)a4;
- (NSXPCConnection)connection;
- (void)addRequestHandler:(id)a3 forDataClass:(id)a4 completion:(id)a5;
- (void)connectWithCompletion:(id)a3;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasClosed:(id)a3;
- (void)messageLinkWasInitialized:(id)a3;
- (void)messageLinkWasOpened:(id)a3;
- (void)removeRequestHandlerForDataClass:(id)a3 completion:(id)a4;
- (void)sendRequest:(id)a3 withCompletion:(id)a4;
- (void)sendResponse:(id)a3 withCompletion:(id)a4;
- (void)setConnection:(id)a3;
- (void)setMessageLink:(id)a3;
- (void)stop;
@end

@implementation ATMessageLinkProxyConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageLink);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setMessageLink:(id)a3
{
}

- (ATMessageLink)messageLink
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLink);

  return (ATMessageLink *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)connectWithCompletion:(id)a3
{
}

- (void)removeRequestHandlerForDataClass:(id)a3 completion:(id)a4
{
  v8 = (void (**)(id, void))a4;
  id v6 = a3;
  v7 = [(ATMessageLinkProxyConnection *)self messageLink];
  [v7 removeRequestHandlerForDataClass:v6];

  v8[2](v8, 0);
}

- (void)addRequestHandler:(id)a3 forDataClass:(id)a4 completion:(id)a5
{
  v9 = (void (**)(id, void))a5;
  id v7 = a4;
  v8 = [(ATMessageLinkProxyConnection *)self messageLink];
  [v8 addRequestHandler:self forDataClass:v7];

  v9[2](v9, 0);
}

- (void)sendResponse:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ATMessageLinkProxyConnection *)self messageLink];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__ATMessageLinkProxyConnection_sendResponse_withCompletion___block_invoke;
  v10[3] = &unk_1E6B8C440;
  id v11 = v6;
  id v9 = v6;
  [v8 sendResponse:v7 withCompletion:v10];
}

uint64_t __60__ATMessageLinkProxyConnection_sendResponse_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendRequest:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(ATMessageLinkProxyConnection *)self messageLink];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__ATMessageLinkProxyConnection_sendRequest_withCompletion___block_invoke;
  v10[3] = &unk_1E6B8C418;
  id v11 = v6;
  id v9 = v6;
  [v8 sendRequest:v7 withCompletion:v10];
}

uint64_t __59__ATMessageLinkProxyConnection_sendRequest_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  id v5 = a4;
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  id v7 = [(ATMessageLinkProxyConnection *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke;
  v13[3] = &unk_1E6B8C3C8;
  v8 = v6;
  v14 = v8;
  id v9 = [v7 remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke_5;
  v11[3] = &unk_1E6B8C3F0;
  v12 = v8;
  v10 = v8;
  [v9 messageLink:0 didReceiveRequest:v5 completion:v11];

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1D9BC7000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __62__ATMessageLinkProxyConnection_messageLink_didReceiveRequest___block_invoke_5(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)messageLinkWasClosed:(id)a3
{
  v4 = [(ATMessageLinkProxyConnection *)self connection];
  int v5 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];
  [v5 messageLinkWasClosed:0];

  [(ATMessageLinkProxyConnection *)self stop];
}

void __53__ATMessageLinkProxyConnection_messageLinkWasClosed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)messageLinkWasInitialized:(id)a3
{
  id v4 = [(ATMessageLinkProxyConnection *)self connection];
  id v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_2];
  [v3 messageLinkWasInitialized:0];
}

void __58__ATMessageLinkProxyConnection_messageLinkWasInitialized___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)messageLinkWasOpened:(id)a3
{
  id v4 = [(ATMessageLinkProxyConnection *)self connection];
  id v3 = [v4 remoteObjectProxyWithErrorHandler:&__block_literal_global_1998];
  [v3 messageLinkWasOpened:0];
}

void __53__ATMessageLinkProxyConnection_messageLinkWasOpened___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)stop
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _ATLogCategoryDeviceSync();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ Stopping .. ", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLink);
  [WeakRetained removeObserver:self];
}

- (ATMessageLinkProxyConnection)initWithMessageLink:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATMessageLinkProxyConnection;
  v8 = [(ATMessageLinkProxyConnection *)&v11 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a4);
    objc_storeWeak((id *)&v9->_messageLink, v6);
    [v6 addObserver:v9];
  }

  return v9;
}

@end