@interface ATStatusObserver
- (ATStatusObserver)init;
- (ATStatusObserverDelegate)delegate;
- (BOOL)ATCRunning;
- (BOOL)resumed;
- (NSXPCConnection)connection;
- (int)notifyToken;
- (void)fetchAllStatusWithCompletion:(id)a3;
- (void)resume;
- (void)setATCRunning:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setNotifyToken:(int)a3;
- (void)setResumed:(BOOL)a3;
- (void)suspend;
- (void)updateWithStatus:(id)a3;
@end

@implementation ATStatusObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setNotifyToken:(int)a3
{
  self->_notifyToken = a3;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void)setResumed:(BOOL)a3
{
  self->_resumed = a3;
}

- (BOOL)resumed
{
  return self->_resumed;
}

- (void)setATCRunning:(BOOL)a3
{
  self->_ATCRunning = a3;
}

- (BOOL)ATCRunning
{
  return self->_ATCRunning;
}

- (void)setConnection:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (ATStatusObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATStatusObserverDelegate *)WeakRetained;
}

- (void)updateWithStatus:(id)a3
{
  id v5 = a3;
  v4 = [(ATStatusObserver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 observer:self didUpdateWithStatus:v5];
  }
}

- (NSXPCConnection)connection
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.atc.xpc.observer" options:0];
    id v5 = self->_connection;
    self->_connection = v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C719BF8];
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    [v6 setClasses:v9 forSelector:sel_fetchAllStatusWithCompletion_ argumentIndex:0 ofReply:1];

    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];
    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C715178];
    [(NSXPCConnection *)self->_connection setExportedInterface:v10];

    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(NSXPCConnection *)self->_connection resume];

    connection = self->_connection;
  }
  return connection;
}

- (void)fetchAllStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void, void))v4;
  if (self->_ATCRunning)
  {
    v6 = [(ATStatusObserver *)self connection];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke;
    v12[3] = &unk_2642811F0;
    v7 = v5;
    id v13 = v7;
    uint64_t v8 = [v6 remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke_2;
    v10[3] = &unk_264280E60;
    v11 = v7;
    [v8 fetchAllStatusWithCompletion:v10];
  }
  else if (v4)
  {
    v9 = [MEMORY[0x263EFFA08] set];
    ((void (**)(void, void *, void))v5)[2](v5, v9, 0);
  }
}

uint64_t __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t __49__ATStatusObserver_fetchAllStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)suspend
{
  self->_resumed = 0;
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)resume
{
  self->_resumed = 1;
  if (self->_ATCRunning)
  {
    id v3 = [(ATStatusObserver *)self connection];
    v2 = [v3 remoteObjectProxy];
    [v2 resume];
  }
}

- (ATStatusObserver)init
{
  v16.receiver = self;
  v16.super_class = (Class)ATStatusObserver;
  v2 = [(ATStatusObserver *)&v16 init];
  id v3 = v2;
  if (v2)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x3032000000;
    v14[3] = __Block_byref_object_copy__199;
    v14[4] = __Block_byref_object_dispose__200;
    id v4 = v2;
    v15 = v4;
    p_notifyToken = &v4->_notifyToken;
    v6 = MEMORY[0x263EF83A0];
    id v7 = MEMORY[0x263EF83A0];
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __24__ATStatusObserver_init__block_invoke;
    handler[3] = &unk_264280E38;
    uint64_t v8 = v4;
    v12 = v8;
    id v13 = v14;
    notify_register_dispatch("com.apple.atc.started", p_notifyToken, v6, handler);

    uint64_t state64 = 0;
    notify_get_state(*p_notifyToken, &state64);
    if (state64) {
      v8->_ATCRunning = 1;
    }

    _Block_object_dispose(v14, 8);
  }
  return v3;
}

void __24__ATStatusObserver_init__block_invoke(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(token, &state64);
  uint64_t v4 = *(void *)(a1 + 32);
  if (state || !state64)
  {
    *(unsigned char *)(v4 + 8) = 0;
  }
  else
  {
    if (!*(unsigned char *)(v4 + 8))
    {
      if (*(unsigned char *)(v4 + 9))
      {
        id v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) connection];
        v6 = [v5 remoteObjectProxy];
        [v6 start];

        uint64_t v4 = *(void *)(a1 + 32);
      }
    }
    *(unsigned char *)(v4 + 8) = 1;
  }
}

@end