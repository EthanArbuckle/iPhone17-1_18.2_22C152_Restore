@interface CXXPCProvider
- (BOOL)requiresProxyingAVAudioSessionState;
- (CXXPCProvider)initWithConfiguration:(id)a3;
- (NSXPCConnection)connection;
- (id)hostProtocolDelegate;
- (int)notifyToken;
- (void)dealloc;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setNotifyToken:(int)a3;
@end

@implementation CXXPCProvider

- (CXXPCProvider)initWithConfiguration:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CXXPCProvider;
  v3 = [(CXProvider *)&v11 initWithConfiguration:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(CXProvider *)v3 abstractProvider];
    v6 = [v5 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__CXXPCProvider_initWithConfiguration___block_invoke;
    block[3] = &unk_1E5CADD30;
    v7 = v4;
    v10 = v7;
    dispatch_async(v6, block);

    [(CXProvider *)v7 registerCurrentConfiguration];
  }
  return v4;
}

void __39__CXXPCProvider_initWithConfiguration___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(int **)(a1 + 32);
  v3 = [v2 abstractProvider];
  v4 = [v3 queue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CXXPCProvider_initWithConfiguration___block_invoke_2;
  v5[3] = &unk_1E5CAE330;
  objc_copyWeak(&v6, &location);
  notify_register_dispatch("com.apple.callkit.callsourcehost.started", v2 + 12, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__CXXPCProvider_initWithConfiguration___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "com.apple.callkit.callsourcehost.started";
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Handling %s by setting up XPC connection", (uint8_t *)&v3, 0xCu);
  }

  [WeakRetained registerCurrentConfiguration];
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.callkit.callsourcehost" options:0];
    uint64_t v5 = self->_connection;
    self->_connection = v4;

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    id v6 = objc_msgSend(MEMORY[0x1E4F29280], "cx_providerVendorInterface");
    [(NSXPCConnection *)self->_connection setExportedInterface:v6];

    v7 = objc_msgSend(MEMORY[0x1E4F29280], "cx_providerHostInterface");
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__CXXPCProvider_connection__block_invoke;
    v12[3] = &unk_1E5CADED0;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __27__CXXPCProvider_connection__block_invoke_2;
    v10[3] = &unk_1E5CADED0;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v10];
    [(NSXPCConnection *)self->_connection resume];
    v8 = [(CXProvider *)self abstractProvider];
    [v8 sendDidBeginForProvider:self];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }

  return connection;
}

void __27__CXXPCProvider_connection__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[7];
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection %@ interrupted for XPC provider %@", buf, 0x16u);
    }

    v4 = [WeakRetained abstractProvider];
    uint64_t v5 = [v4 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__CXXPCProvider_connection__block_invoke_3;
    block[3] = &unk_1E5CADD30;
    void block[4] = WeakRetained;
    dispatch_async(v5, block);
  }
}

void __27__CXXPCProvider_connection__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) abstractProvider];
  [v2 handleConnectionInterruptionForProvider:*(void *)(a1 + 32)];
}

void __27__CXXPCProvider_connection__block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = WeakRetained[7];
      *(_DWORD *)buf = 138412546;
      uint64_t v8 = v3;
      __int16 v9 = 2112;
      v10 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection %@ invalidated for XPC provider %@", buf, 0x16u);
    }

    v4 = [WeakRetained abstractProvider];
    uint64_t v5 = [v4 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__CXXPCProvider_connection__block_invoke_4;
    block[3] = &unk_1E5CADD30;
    void block[4] = WeakRetained;
    dispatch_async(v5, block);
  }
}

void __27__CXXPCProvider_connection__block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  id v4 = [*(id *)(a1 + 32) abstractProvider];
  [v4 handleConnectionInterruptionForProvider:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  notify_cancel([(CXXPCProvider *)self notifyToken]);
  v3.receiver = self;
  v3.super_class = (Class)CXXPCProvider;
  [(CXXPCProvider *)&v3 dealloc];
}

- (id)hostProtocolDelegate
{
  uint64_t v2 = [(CXXPCProvider *)self connection];
  objc_super v3 = [v2 remoteObjectProxy];

  return v3;
}

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 1;
}

- (void)invalidate
{
  objc_super v3 = [(CXProvider *)self abstractProvider];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__CXXPCProvider_invalidate__block_invoke;
  block[3] = &unk_1E5CADD30;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __27__CXXPCProvider_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = CXDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "self: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) connection];
  [v4 invalidate];
}

- (void)setConnection:(id)a3
{
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (void).cxx_destruct
{
}

@end