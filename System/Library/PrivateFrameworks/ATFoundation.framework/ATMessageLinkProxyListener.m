@interface ATMessageLinkProxyListener
- (ATMessageLink)messageLink;
- (ATMessageLinkProxyListener)initWithMessageLink:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)endpoint;
- (void)setMessageLink:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation ATMessageLinkProxyListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLink, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)setMessageLink:(id)a3
{
}

- (ATMessageLink)messageLink
{
  return self->_messageLink;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 processIdentifier];
  v9 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v25 = self;
    __int16 v26 = 1024;
    int v27 = v8;
    _os_log_impl(&dword_1D9BC7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Got connection from pid %i", buf, 0x12u);
  }

  v10 = [[ATMessageLinkProxyConnection alloc] initWithMessageLink:self->_messageLink connection:v7];
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33E8B98];
  [v7 setExportedInterface:v11];

  [v7 setExportedObject:v10];
  v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F33EB250];
  [v7 setRemoteObjectInterface:v12];

  objc_initWeak((id *)buf, v10);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke;
  v21[3] = &unk_1E6B8C380;
  v21[4] = self;
  int v23 = v8;
  objc_copyWeak(&v22, (id *)buf);
  [v7 setInterruptionHandler:v21];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke_69;
  v17 = &unk_1E6B8C380;
  v18 = self;
  int v20 = v8;
  objc_copyWeak(&v19, (id *)buf);
  [v7 setInvalidationHandler:&v14];
  objc_msgSend(v7, "resume", v14, v15, v16, v17, v18);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);

  return 1;
}

void __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection interrupted from pid: %i", (uint8_t *)&v6, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stop];
}

void __65__ATMessageLinkProxyListener_listener_shouldAcceptNewConnection___block_invoke_69(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = _ATLogCategoryXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(_DWORD *)(a1 + 48);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 1024;
    int v9 = v4;
    _os_log_impl(&dword_1D9BC7000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ connection invalidated from pid: %i", (uint8_t *)&v6, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stop];
}

- (id)endpoint
{
  return [(NSXPCListener *)self->_listener endpoint];
}

- (void)stop
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    __int16 v8 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping", (uint8_t *)&v7, 0xCu);
  }

  listener = self->_listener;
  if (listener)
  {
    [(NSXPCListener *)listener invalidate];
    [(NSXPCListener *)self->_listener setDelegate:0];
    v5 = self->_listener;
    self->_listener = 0;
  }
  messageLink = self->_messageLink;
  self->_messageLink = 0;
}

- (void)start
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    int v7 = self;
    _os_log_impl(&dword_1D9BC7000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ starting", (uint8_t *)&v6, 0xCu);
  }

  int v4 = [MEMORY[0x1E4F29290] anonymousListener];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
}

- (ATMessageLinkProxyListener)initWithMessageLink:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATMessageLinkProxyListener;
  int v6 = [(ATMessageLinkProxyListener *)&v9 init];
  int v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_messageLink, a3);
  }

  return v7;
}

@end