@interface ATXPCServer
- (BOOL)_doingWork;
- (NSSet)connections;
- (id)_connections;
- (id)_handlerForMessageName:(id)a3;
- (id)_highAvailabilityQueue;
- (id)defaultMessageHandler;
- (id)disconnectHandler;
- (id)initListenerWithServiceName:(id)a3;
- (id)lockdownHandler;
- (id)shutdownHandler;
- (void)_handleNewConnection:(id)a3;
- (void)_rescheduleIdleTimerSourceWithInterval:(double)a3;
- (void)_resetMessageFlag;
- (void)_runShutdownHandler;
- (void)dealloc;
- (void)setDefaultMessageHandler:(id)a3;
- (void)setDisconnectHandler:(id)a3;
- (void)setHandlerForMessageName:(id)a3 handler:(id)a4;
- (void)setIdleTimerInterval:(double)a3;
- (void)setLockdownHandler:(id)a3;
- (void)setShutdownHandler:(id)a3;
@end

@implementation ATXPCServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerSource, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong(&self->_defaultMessageHandler, 0);
  objc_storeStrong(&self->_shutdownHandler, 0);
  objc_storeStrong(&self->_disconnectHandler, 0);
  objc_storeStrong(&self->_lockdownHandler, 0);
  objc_storeStrong((id *)&self->_handlerMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_conn, 0);
}

- (void)setShutdownHandler:(id)a3
{
}

- (id)shutdownHandler
{
  return self->_shutdownHandler;
}

- (void)setDisconnectHandler:(id)a3
{
}

- (id)disconnectHandler
{
  return self->_disconnectHandler;
}

- (void)setDefaultMessageHandler:(id)a3
{
}

- (id)defaultMessageHandler
{
  return self->_defaultMessageHandler;
}

- (void)setLockdownHandler:(id)a3
{
}

- (id)lockdownHandler
{
  return self->_lockdownHandler;
}

- (NSSet)connections
{
  return &self->_connections->super;
}

- (void)setIdleTimerInterval:(double)a3
{
  timerQueue = self->_timerQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__ATXPCServer_setIdleTimerInterval___block_invoke;
  v4[3] = &unk_264281490;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(timerQueue, v4);
}

uint64_t __36__ATXPCServer_setIdleTimerInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleIdleTimerSourceWithInterval:*(double *)(a1 + 40)];
}

- (void)_rescheduleIdleTimerSourceWithInterval:(double)a3
{
  idleTimerSource = self->_idleTimerSource;
  if (idleTimerSource)
  {
    dispatch_source_cancel(idleTimerSource);
    v6 = self->_idleTimerSource;
    self->_idleTimerSource = 0;
  }
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_timerQueue);
  v8 = self->_idleTimerSource;
  self->_idleTimerSource = v7;

  dispatch_source_set_timer((dispatch_source_t)self->_idleTimerSource, 0, 1000000000 * (unint64_t)a3, 0);
  v9 = self->_idleTimerSource;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __54__ATXPCServer__rescheduleIdleTimerSourceWithInterval___block_invoke;
  handler[3] = &unk_264281378;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume((dispatch_object_t)self->_idleTimerSource);
}

void __54__ATXPCServer__rescheduleIdleTimerSourceWithInterval___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _doingWork];
  char v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 80) && (v2 & 1) == 0)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v4 + 72));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v4 + 80) = v3 ^ 1;
}

- (BOOL)_doingWork
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  char v2 = self->_connections;
  uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "_outstandingMessages", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_resetMessageFlag
{
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__ATXPCServer__resetMessageFlag__block_invoke;
  block[3] = &unk_264281378;
  block[4] = self;
  dispatch_async(timerQueue, block);
}

uint64_t __32__ATXPCServer__resetMessageFlag__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 80) = 0;
  return result;
}

- (void)_runShutdownHandler
{
  shutdownHandler = (void (**)(void))self->_shutdownHandler;
  if (shutdownHandler) {
    shutdownHandler[2]();
  }
}

- (void)setHandlerForMessageName:(id)a3 handler:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    handlerMap = self->_handlerMap;
    if (!handlerMap)
    {
      long long v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v9 = self->_handlerMap;
      self->_handlerMap = v8;

      handlerMap = self->_handlerMap;
    }
    long long v10 = (void *)[v6 copy];
    [(NSMutableDictionary *)handlerMap setObject:v10 forKey:v11];
  }
  else
  {
    [(ATXPCServer *)self setDefaultMessageHandler:v6];
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ATXPCServer;
  [(ATXPCServer *)&v2 dealloc];
}

- (id)initListenerWithServiceName:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXPCServer;
  v5 = [(ATXPCServer *)&v18 init];
  if (v5)
  {
    id v6 = (const char *)[v4 UTF8String];
    long long v7 = [(ATXPCServer *)v5 _highAvailabilityQueue];
    xpc_connection_t mach_service = xpc_connection_create_mach_service(v6, v7, 1uLL);
    conn = v5->_conn;
    v5->_conn = mach_service;

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__1679;
    v16[4] = __Block_byref_object_dispose__1680;
    long long v10 = v5;
    v17 = v10;
    id v11 = v5->_conn;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __43__ATXPCServer_initListenerWithServiceName___block_invoke;
    handler[3] = &unk_2642813A0;
    handler[4] = v16;
    xpc_connection_set_event_handler(v11, handler);
    xpc_connection_resume(v5->_conn);
    dispatch_queue_t v12 = dispatch_queue_create("idle_timer", 0);
    timerQueue = v10->_timerQueue;
    v10->_timerQueue = (OS_dispatch_queue *)v12;

    _Block_object_dispose(v16, 8);
  }

  return v5;
}

void __43__ATXPCServer_initListenerWithServiceName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = MEMORY[0x2166CE550]();
  if (v4 == MEMORY[0x263EF86F0])
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _handleNewConnection:v3];
  }
  else
  {
    uint64_t v5 = v4;
    id v6 = os_log_create("com.apple.amp.AirTraffic", "XPC");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2080;
      id v11 = _StringForXPCType(v5);
      _os_log_impl(&dword_2164B1000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_handleNewConnection:(id)a3
{
  id v4 = a3;
  [(ATXPCServer *)self _resetMessageFlag];
  objc_initWeak(&location, self);
  uint64_t v5 = [[ATXPCConnection alloc] initWithXPCConnection:v4];
  objc_initWeak(&from, v5);
  id v6 = [(ATXPCServer *)self _connections];
  [v6 addObject:v5];

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __36__ATXPCServer__handleNewConnection___block_invoke;
  v13[3] = &unk_264281418;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [(ATXPCConnection *)v5 setMessageHandler:v13];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __36__ATXPCServer__handleNewConnection___block_invoke_2;
  v10[3] = &unk_264281440;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  [(ATXPCConnection *)v5 setDisconnectHandler:v10];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__ATXPCServer__handleNewConnection___block_invoke_3;
  v7[3] = &unk_264281468;
  objc_copyWeak(&v8, &location);
  objc_copyWeak(&v9, &from);
  [(ATXPCConnection *)v5 setLockdownHandler:v7];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);

  objc_destroyWeak(&location);
}

void __36__ATXPCServer__handleNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetMessageFlag];
  id v4 = [v7 name];
  uint64_t v5 = [WeakRetained _handlerForMessageName:v4];

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    ((void (**)(void, id, id))v5)[2](v5, v6, v7);
  }
}

void __36__ATXPCServer__handleNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained disconnectHandler];
  if (v2)
  {
    id v4 = [WeakRetained _connections];
    [v4 removeObject:v2];
  }
  if (v3) {
    ((void (**)(void, id))v3)[2](v3, v2);
  }
}

void __36__ATXPCServer__handleNewConnection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = [WeakRetained lockdownHandler];

  if (v6)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    v6[2](v6, v5, a2);
  }
}

- (id)_handlerForMessageName:(id)a3
{
  id v4 = [(NSMutableDictionary *)self->_handlerMap objectForKey:a3];
  if (!v4) {
    id v4 = (void *)MEMORY[0x2166CE2A0](self->_defaultMessageHandler);
  }
  id v5 = (void *)MEMORY[0x2166CE2A0](v4);

  return v5;
}

- (id)_highAvailabilityQueue
{
  id v2 = (void *)MEMORY[0x263EF83A0];
  id v3 = MEMORY[0x263EF83A0];
  return v2;
}

- (id)_connections
{
  connections = self->_connections;
  if (!connections)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    id v5 = self->_connections;
    self->_connections = v4;

    connections = self->_connections;
  }
  return connections;
}

@end