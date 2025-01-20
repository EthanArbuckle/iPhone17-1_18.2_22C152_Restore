@interface CAMKeepAliveController
- (CAMKeepAliveController)init;
- (OS_dispatch_queue)_heartbeatQueue;
- (OS_dispatch_queue)_keepAliveQueue;
- (OS_dispatch_source)_heartbeatSource;
- (OS_xpc_object)_connection;
- (void)_handleHeartbeatConnectionReply:(id)a3;
- (void)_handleHeartbeatSourceEvent;
- (void)_keepAliveQueueCreateConnectionIfNecessary;
- (void)_keepAliveQueueCreateHeartbeatIfNecessary;
- (void)_keepAliveQueueTeardownConnection;
- (void)_keepAliveQueueTeardownHeartbeat;
- (void)_setConnection:(id)a3;
- (void)_setHeartbeatSource:(id)a3;
- (void)_setupConnectionIfNecessary;
- (void)_teardownConnection;
- (void)_teardownHeartbeat;
- (void)dealloc;
- (void)startKeepAliveSession;
@end

@implementation CAMKeepAliveController

- (CAMKeepAliveController)init
{
  v14.receiver = self;
  v14.super_class = (Class)CAMKeepAliveController;
  v2 = [(CAMKeepAliveController *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.camera.keep-alive-connection", v3);
    keepAliveQueue = v2->__keepAliveQueue;
    v2->__keepAliveQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.camera.keep-alive-heartbeat", v6);
    heartbeatQueue = v2->__heartbeatQueue;
    v2->__heartbeatQueue = (OS_dispatch_queue *)v7;

    v9 = v2->__heartbeatQueue;
    v10 = dispatch_get_global_queue(-2, 0);
    dispatch_set_target_queue(v9, v10);

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v2 selector:sel__handleApplicationWillEnterForeground_ name:*MEMORY[0x263F833B8] object:0];
    [v11 addObserver:v2 selector:sel__handleApplicationDidEnterBackground_ name:*MEMORY[0x263F83330] object:0];
    v12 = v2;
  }
  return v2;
}

- (void)startKeepAliveSession
{
  if (+[CAMApplication appOrPlugInState] == 2)
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_queue_t v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring attempt to start keep-alive session while backgrounded.", v4, 2u);
    }
  }
  else
  {
    [(CAMKeepAliveController *)self _setupConnectionIfNecessary];
  }
}

- (void)_setupConnectionIfNecessary
{
  v3 = [(CAMKeepAliveController *)self _keepAliveQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CAMKeepAliveController__setupConnectionIfNecessary__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (OS_dispatch_queue)_keepAliveQueue
{
  return self->__keepAliveQueue;
}

uint64_t __53__CAMKeepAliveController__setupConnectionIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _keepAliveQueueCreateConnectionIfNecessary];
  v2 = *(void **)(a1 + 32);
  return [v2 _keepAliveQueueCreateHeartbeatIfNecessary];
}

- (void)_keepAliveQueueCreateConnectionIfNecessary
{
  if (!self->__connection)
  {
    v3 = (const char *)*MEMORY[0x263F5DBD8];
    dispatch_queue_t v4 = dispatch_get_global_queue(-2, 0);
    mach_service = xpc_connection_create_mach_service(v3, v4, 0);
    connection = self->__connection;
    self->__connection = mach_service;

    xpc_connection_set_event_handler(self->__connection, &__block_literal_global_39);
    dispatch_queue_t v7 = self->__connection;
    xpc_connection_resume(v7);
  }
}

- (void)_keepAliveQueueCreateHeartbeatIfNecessary
{
  if (!self->__heartbeatSource)
  {
    objc_initWeak(&location, self);
    v3 = [(CAMKeepAliveController *)self _heartbeatQueue];
    dispatch_queue_t v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v3);
    heartbeatSource = self->__heartbeatSource;
    self->__heartbeatSource = v4;

    v6 = self->__heartbeatSource;
    dispatch_time_t v7 = dispatch_time(0, 0);
    dispatch_source_set_timer(v6, v7, 0x77359400uLL, 0x989680uLL);
    v8 = self->__heartbeatSource;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__CAMKeepAliveController__keepAliveQueueCreateHeartbeatIfNecessary__block_invoke;
    v9[3] = &unk_263FA0E00;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v8, v9);
    dispatch_resume((dispatch_object_t)self->__heartbeatSource);
    objc_destroyWeak(&v10);

    objc_destroyWeak(&location);
  }
}

- (OS_dispatch_queue)_heartbeatQueue
{
  return self->__heartbeatQueue;
}

void __67__CAMKeepAliveController__keepAliveQueueCreateHeartbeatIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleHeartbeatSourceEvent];
}

- (void)_handleHeartbeatSourceEvent
{
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  v3 = [(CAMKeepAliveController *)self _keepAliveQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke;
  block[3] = &unk_263FA2300;
  block[4] = self;
  void block[5] = &v24;
  dispatch_sync(v3, block);

  if (!*((unsigned char *)v25 + 24))
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__14;
    v21 = __Block_byref_object_dispose__14;
    id v22 = 0;
    dispatch_queue_t v4 = [(CAMKeepAliveController *)self _keepAliveQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_11;
    v16[3] = &unk_263FA35E8;
    v16[4] = self;
    v16[5] = &v17;
    dispatch_sync(v4, v16);

    if (v18[5])
    {
      objc_initWeak(&location, self);
      v5 = [(CAMKeepAliveController *)self _heartbeatQueue];
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      dispatch_time_t v7 = (_xpc_connection_s *)v18[5];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_2;
      handler[3] = &unk_263FA4B68;
      objc_copyWeak(&v14, &location);
      xpc_connection_send_message_with_reply(v7, v6, v5, handler);
      dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
      v9 = (_xpc_connection_s *)v18[5];
      barrier[0] = MEMORY[0x263EF8330];
      barrier[1] = 3221225472;
      barrier[2] = __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_3;
      barrier[3] = &unk_263FA0208;
      id v10 = v8;
      v12 = v10;
      xpc_connection_send_barrier(v9, barrier);
      dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    _Block_object_dispose(&v17, 8);
  }
  _Block_object_dispose(&v24, 8);
}

void __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _heartbeatSource];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;
}

- (OS_dispatch_source)_heartbeatSource
{
  return self->__heartbeatSource;
}

- (OS_xpc_object)_connection
{
  return self->__connection;
}

- (void)_handleHeartbeatConnectionReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v5 = [(CAMKeepAliveController *)self _keepAliveQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __58__CAMKeepAliveController__handleHeartbeatConnectionReply___block_invoke;
  v8[3] = &unk_263FA2300;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  if (!*((unsigned char *)v10 + 24) && MEMORY[0x21050C6C0](v4) == MEMORY[0x263EF8720])
  {
    string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x263EF86B0]);
    dispatch_time_t v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v14 = string;
      _os_log_impl(&dword_2099F8000, v7, OS_LOG_TYPE_DEFAULT, "Cancelling assetsd keep-alive because a reply was received with an error! (%s)", buf, 0xCu);
    }

    [(CAMKeepAliveController *)self _teardownHeartbeat];
  }
  _Block_object_dispose(&v9, 8);
}

void __58__CAMKeepAliveController__handleHeartbeatConnectionReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _heartbeatSource];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2 == 0;
}

- (void)_teardownConnection
{
  v3 = [(CAMKeepAliveController *)self _keepAliveQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CAMKeepAliveController__teardownConnection__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_sync(v3, block);

  [(CAMKeepAliveController *)self _teardownHeartbeat];
}

uint64_t __45__CAMKeepAliveController__teardownConnection__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _keepAliveQueueTeardownConnection];
}

- (void)_keepAliveQueueTeardownConnection
{
  if (self->__connection)
  {
    v3 = [(CAMKeepAliveController *)self _connection];
    xpc_connection_cancel(v3);
    [(CAMKeepAliveController *)self _setConnection:0];
  }
}

void __68__CAMKeepAliveController__keepAliveQueueCreateConnectionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (MEMORY[0x21050C6C0]() == MEMORY[0x263EF8720])
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x263EF86B0]);
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      xpc_object_t v6 = string;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Lost keep-alive connection to assetsd! (%s)", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_setConnection:(id)a3
{
}

- (void)_teardownHeartbeat
{
  v3 = [(CAMKeepAliveController *)self _keepAliveQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__CAMKeepAliveController__teardownHeartbeat__block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __44__CAMKeepAliveController__teardownHeartbeat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _keepAliveQueueTeardownHeartbeat];
}

- (void)_keepAliveQueueTeardownHeartbeat
{
  v3 = [(CAMKeepAliveController *)self _heartbeatSource];
  if (v3)
  {
    id v4 = v3;
    dispatch_source_cancel(v3);
    [(CAMKeepAliveController *)self _setHeartbeatSource:0];
    v3 = v4;
  }
}

- (void)_setHeartbeatSource:(id)a3
{
}

- (void)dealloc
{
  [(CAMKeepAliveController *)self stopKeepAliveSession];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CAMKeepAliveController;
  [(CAMKeepAliveController *)&v4 dealloc];
}

uint64_t __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_11(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _connection];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

void __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleHeartbeatConnectionReply:v3];
}

intptr_t __53__CAMKeepAliveController__handleHeartbeatSourceEvent__block_invoke_3(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__heartbeatQueue, 0);
  objc_storeStrong((id *)&self->__heartbeatSource, 0);
  objc_storeStrong((id *)&self->__keepAliveQueue, 0);
  objc_storeStrong((id *)&self->__connection, 0);
}

@end