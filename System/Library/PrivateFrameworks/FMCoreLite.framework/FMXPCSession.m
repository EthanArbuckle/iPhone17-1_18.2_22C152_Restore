@interface FMXPCSession
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)initWithServiceDescription:(id)a3;
- (NSUUID)identifier;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)serialQueue;
- (id)_proxy;
- (id)proxy;
- (id)syncProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)destroyXPCConnection;
- (void)invalidate;
- (void)resume;
- (void)setConnection:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)set_proxy:(id)a3;
- (void)suspend;
@end

@implementation FMXPCSession

uint64_t __26__FMXPCSession_connection__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyXPCConnection];
}

- (void)invalidate
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__FMXPCSession_invalidate__block_invoke;
  block[3] = &unk_1E60193F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (id)proxy
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __21__FMXPCSession_proxy__block_invoke;
  v5[3] = &unk_1E6019580;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__FMXPCSession_connection__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__FMXPCSession_connection__block_invoke_2;
  block[3] = &unk_1E60193F0;
  block[4] = WeakRetained;
  dispatch_async(v4, block);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __26__FMXPCSession_connection__block_invoke_6_cold_1((uint64_t)v3);
    }
  }
  else
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __26__FMXPCSession_connection__block_invoke_6_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B2FB9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Connection invalidated: %@", (uint8_t *)&v1, 0xCu);
}

- (void)dealloc
{
  [(FMXPCSession *)self destroyXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)FMXPCSession;
  [(FMXPCSession *)&v3 dealloc];
}

- (void)destroyXPCConnection
{
  [(FMXPCSession *)self set_proxy:0];
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (void)set_proxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->__proxy, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __26__FMXPCSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) destroyXPCConnection];
}

uint64_t __21__FMXPCSession_proxy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _proxy];

  if (!v2)
  {
    objc_super v3 = [*(id *)(a1 + 32) connection];
    v4 = [v3 remoteObjectProxy];
    objc_msgSend(*(id *)(a1 + 32), "set_proxy:", v4);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _proxy];
  return MEMORY[0x1F41817F8]();
}

- (id)_proxy
{
  return self->__proxy;
}

- (FMXPCSession)initWithServiceDescription:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMXPCSession;
  BOOL v6 = [(FMXPCSession *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.icloud.fmcorelite.fmxpcsession", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    v9 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v6->_identifier;
    v6->_identifier = v9;

    objc_storeStrong((id *)&v6->_serviceDescription, a3);
  }

  return v6;
}

- (id)syncProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  id v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E60195F8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke_2;
  v6[3] = &unk_1E60195D0;
  id v7 = *(id *)(a1 + 40);
  uint64_t v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

uint64_t __42__FMXPCSession_syncProxyWithErrorHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resume
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__FMXPCSession_resume__block_invoke;
  block[3] = &unk_1E60193F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __22__FMXPCSession_resume__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) connection];
  [v1 resume];
}

- (void)suspend
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__FMXPCSession_suspend__block_invoke;
  block[3] = &unk_1E60193F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

void __23__FMXPCSession_suspend__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) connection];
  [v1 suspend];
}

- (NSXPCConnection)connection
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  connection = self->_connection;
  if (connection)
  {
    uint64_t v4 = connection;
  }
  else
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    id v6 = [(FMXPCSession *)self serviceDescription];
    id v7 = [v6 machService];
    uint64_t v8 = [(FMXPCSession *)self serviceDescription];
    v9 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", v7, objc_msgSend(v8, "options"));
    id v10 = self->_connection;
    self->_connection = v9;

    id v11 = [(FMXPCSession *)self serviceDescription];
    uint64_t v12 = [v11 exportedObject];
    [(NSXPCConnection *)self->_connection setExportedObject:v12];

    v13 = [(FMXPCSession *)self serviceDescription];
    uint64_t v14 = [v13 exportedInterface];
    [(NSXPCConnection *)self->_connection setExportedInterface:v14];

    v15 = [(FMXPCSession *)self serviceDescription];
    v16 = [v15 remoteObjectInterface];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v16];

    objc_initWeak(&location, self->_connection);
    objc_initWeak(&from, self);
    id v17 = [(FMXPCSession *)self serviceDescription];
    v18 = [v17 interruptionHandler];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __26__FMXPCSession_connection__block_invoke;
    v31[3] = &unk_1E6019558;
    objc_copyWeak(&v33, &location);
    id v19 = v18;
    id v32 = v19;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v31];
    v20 = [(FMXPCSession *)self serialQueue];
    v21 = [(FMXPCSession *)self serviceDescription];
    v22 = [v21 invalidationHandler];

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __26__FMXPCSession_connection__block_invoke_6;
    v26[3] = &unk_1E6019620;
    objc_copyWeak(&v29, &from);
    objc_copyWeak(&v30, &location);
    id v23 = v20;
    id v27 = v23;
    id v24 = v22;
    id v28 = v24;
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v26];
    uint64_t v4 = self->_connection;

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);

    objc_destroyWeak(&v33);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __26__FMXPCSession_connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      __26__FMXPCSession_connection__block_invoke_cold_1((uint64_t)WeakRetained);
    }
  }
  else
  {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, WeakRetained);
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

void __26__FMXPCSession_connection__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_1B2FB9000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Connection interrupted: %@", (uint8_t *)&v1, 0xCu);
}

@end