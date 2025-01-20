@interface MSXPCConnection
- (BOOL)shouldLaunchMobileMail;
- (MSXPCConnection)initWithProtocol:(id)a3;
- (Protocol)protocol;
- (id)_connection;
- (id)_connectionForPromise:(id)a3;
- (id)_nts_wrappedInterruptionHandler;
- (id)description;
- (id)exportedInterface;
- (id)exportedObject;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)remoteObjectInterface;
- (id)remoteObjectProxy;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)_finishPromise:(id)a3 withConnection:(id)a4 error:(id)a5;
- (void)_invalidatePromise:(id)a3;
- (void)_invokeInterruptionHandlerForPromise:(id)a3;
- (void)_queue_invokeInvalidationHandler;
- (void)_sendInvocation:(id)a3 remoteInterface:(id)a4 remoteProxy:(id)a5 errorHandler:(id)a6;
- (void)dealloc;
- (void)invalidate;
- (void)resume;
- (void)setExportedInterface:(id)a3;
- (void)setExportedObject:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setRemoteObjectInterface:(id)a3;
- (void)setShouldLaunchMobileMail:(BOOL)a3;
- (void)suspend;
@end

@implementation MSXPCConnection

uint64_t __29__MSXPCConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invokeInvalidationHandler");
}

uint64_t __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
  [*(id *)(a1 + 40) invokeWithTarget:*(void *)(a1 + 48)];
  v2 = *(void **)(a1 + 32);

  return [v2 resignCurrent];
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "___nsxpc_remoteObjectProxy");
  if (!v4)
  {
    v4 = [v3 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 64)];
    objc_msgSend(*(id *)(a1 + 32), "___setNSXPCRemoteObjectProxy:", v4);
  }
  v5 = *(NSObject **)(*(void *)(a1 + 40) + 168);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_4;
  block[3] = &unk_264243610;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v10 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)invalidate
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_locallyInvalidated, 1u) & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __29__MSXPCConnection_invalidate__block_invoke;
    block[3] = &unk_264243488;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)dealloc
{
  [(MSXPCConnection *)self _invalidatePromise:self->_connectionPromise];
  v3.receiver = self;
  v3.super_class = (Class)MSXPCConnection;
  [(MSXPCConnection *)&v3 dealloc];
}

- (void)_invalidatePromise:(id)a3
{
  id v6 = a3;
  v4 = [v6 future];
  [v4 cancel];

  v5 = [(MSXPCConnection *)self _connectionForPromise:v6];
  [v5 invalidate];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [[_MSXPCRemoteProxy alloc] initWithConnection:self interface:self->_remoteObjectInterface errorHandler:v4];

  return v5;
}

- (void)setShouldLaunchMobileMail:(BOOL)a3
{
  self->_shouldLaunchMobileMail = a3;
}

- (void)setRemoteObjectInterface:(id)a3
{
  id v7 = a3;
  [(NSLock *)self->_lock lock];
  objc_storeStrong((id *)&self->_remoteObjectInterface, a3);
  id v6 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  objc_msgSend(v6, a2, v7);

  [(NSLock *)self->_lock unlock];
}

- (void)setInterruptionHandler:(id)a3
{
  id v8 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_interruptionHandler != v8)
  {
    id v4 = (void *)MEMORY[0x2166BBCE0](v8);
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = v4;

    id v6 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
    if (v6)
    {
      id v7 = [(MSXPCConnection *)self _nts_wrappedInterruptionHandler];
      [v6 setInterruptionHandler:v7];
      [v6 setInvalidationHandler:v7];
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (MSXPCConnection)initWithProtocol:(id)a3
{
  v5 = (Protocol *)a3;
  v18.receiver = self;
  v18.super_class = (Class)MSXPCConnection;
  id v6 = [(MSXPCConnection *)&v18 init];
  if (v6)
  {
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    id v9 = NSStringFromProtocol(v5);
    id v10 = [v7 stringWithFormat:@"com.apple.mailservices.%@.%@.%p", v8, v9, v6];

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v6->_lock;
    v6->_lock = v11;

    objc_storeStrong((id *)&v6->_protocol, a3);
    id v13 = v10;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v14;

    v6->_shouldLaunchMobileMail = 1;
    atomic_store(0, (unsigned __int8 *)&v6->_locallyInvalidated);
    v16 = v6;
  }
  return v6;
}

- (void)_queue_invokeInvalidationHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSLock *)self->_lock lock];
  id v7 = [(EFPromise *)self->_connectionPromise future];
  [v7 cancel];

  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler) {
    invalidationHandler[2]();
  }
  id v8 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  [v8 setInterruptionHandler:0];
  [v8 setInvalidationHandler:0];
  [v8 invalidate];
  connectionPromise = self->_connectionPromise;
  self->_connectionPromise = 0;

  id v5 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  [(NSLock *)self->_lock unlock];
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 160) lock];
  id v6 = v14;
  if (v14)
  {
    [v14 setRemoteObjectInterface:*(void *)(a1 + 40)];
    [v14 setExportedInterface:*(void *)(*(void *)(a1 + 32) + 192)];
    [v14 setExportedObject:*(void *)(*(void *)(a1 + 32) + 200)];
    id v7 = objc_msgSend(*(id *)(a1 + 32), "_nts_wrappedInterruptionHandler");
    [v14 setInterruptionHandler:v7];
    [v14 setInvalidationHandler:v7];
    [v14 _setQueue:*(void *)(*(void *)(a1 + 32) + 168)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 224);
    if (v8 < 1)
    {
      id v10 = v14;
      if ((v8 & 0x8000000000000000) == 0)
      {
LABEL_6:
        v11 = *(void **)(a1 + 48);
        v12 = [v10 remoteObjectProxyWithErrorHandler:*(void *)(a1 + 64)];
        objc_msgSend(v11, "___setNSXPCRemoteObjectProxy:", v12);

LABEL_7:
        id v6 = v14;
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v9 = 0;
      id v10 = v14;
      do
      {
        [v10 resume];
        ++v9;
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 224);
        id v10 = v14;
      }
      while (v9 < v8);
      if ((v8 & 0x8000000000000000) == 0) {
        goto LABEL_6;
      }
    }
    do
    {
      [v10 suspend];
      BOOL v13 = __CFADD__(v8++, 1);
      id v10 = v14;
    }
    while (!v13);
    goto LABEL_6;
  }
  if (!v5)
  {
    id v5 = [MEMORY[0x263F087E8] errorWithDomain:@"MailServices" code:3 userInfo:0];
    goto LABEL_7;
  }
LABEL_9:
  [*(id *)(a1 + 32) _finishPromise:*(void *)(a1 + 56) withConnection:v6 error:v5];
  [*(id *)(*(void *)(a1 + 32) + 160) unlock];
}

- (void)resume
{
  [(NSLock *)self->_lock lock];
  ++self->_resumeCount;
  objc_super v3 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  [v3 resume];

  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)_sendInvocation:(id)a3 remoteInterface:(id)a4 remoteProxy:(id)a5 errorHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  unsigned __int8 v15 = atomic_load((unsigned __int8 *)&self->_locallyInvalidated);
  if ((v15 & 1) == 0)
  {
    [v10 retainArguments];
    [(NSLock *)self->_lock lock];
    p_connectionPromise = &self->_connectionPromise;
    if (!self->_connectionPromise)
    {
      id v28 = v11;
      id v17 = objc_alloc_init(MEMORY[0x263F3B398]);
      objc_storeStrong((id *)&self->_connectionPromise, v17);
      objc_super v18 = objc_alloc_init(MSXPCEndpoint);
      [(MSMailDefaultService *)v18 setShouldLaunchMobileMail:self->_shouldLaunchMobileMail];
      v19 = [v11 protocol];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_2;
      v37[3] = &unk_2642435E8;
      v37[4] = self;
      id v38 = v11;
      id v39 = v12;
      id v41 = v14;
      id v20 = v17;
      id v40 = v20;
      [(MSXPCEndpoint *)v18 connectionForProtocol:v19 completionHandler:v37];

      id v11 = v28;
    }
    v21 = [MEMORY[0x263F08AB8] currentProgress];

    if (v21)
    {
      v22 = [MEMORY[0x263F08AB8] progressWithTotalUnitCount:1];
    }
    else
    {
      v22 = 0;
    }
    v25 = [(EFPromise *)*p_connectionPromise future];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_3;
    v31[3] = &unk_264243638;
    id v32 = v12;
    id v26 = v14;
    id v36 = v26;
    v33 = self;
    id v24 = v22;
    id v34 = v24;
    id v35 = v10;
    [v25 addSuccessBlock:v31];

    v27 = [(EFPromise *)*p_connectionPromise future];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_5;
    v29[3] = &unk_264243688;
    v29[4] = self;
    id v30 = v26;
    [v27 addFailureBlock:v29];

    [(NSLock *)self->_lock unlock];
    goto LABEL_10;
  }
  if (v13)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke;
    block[3] = &unk_2642433D0;
    id v43 = v13;
    dispatch_async(queue, block);
    id v24 = v43;
LABEL_10:
  }
}

- (id)_connectionForPromise:(id)a3
{
  objc_super v3 = [a3 future];
  id v4 = [v3 resultIfAvailable:0];

  return v4;
}

- (id)_nts_wrappedInterruptionHandler
{
  objc_super v3 = self->_connectionPromise;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__MSXPCConnection__nts_wrappedInterruptionHandler__block_invoke;
  v8[3] = &unk_2642435C0;
  objc_copyWeak(&v10, &location);
  uint64_t v9 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x2166BBCE0](v8);
  id v6 = (void *)[v5 copy];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)_finishPromise:(id)a3 withConnection:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v7 = a4;
  id v8 = a5;
  if (([v9 finishWithResult:v7 error:v8] & 1) == 0) {
    [v7 invalidate];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_exportedObject, 0);
  objc_storeStrong((id *)&self->_exportedInterface, 0);
  objc_storeStrong((id *)&self->_remoteObjectInterface, 0);
  objc_storeStrong((id *)&self->_connectionPromise, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p> connection for protocol %s", v4, self, protocol_getName(self->_protocol)];
}

- (id)remoteObjectInterface
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_remoteObjectInterface;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (id)exportedInterface
{
  [(NSLock *)self->_lock lock];
  objc_super v3 = self->_exportedInterface;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)setExportedInterface:(id)a3
{
  id v7 = a3;
  [(NSLock *)self->_lock lock];
  objc_storeStrong((id *)&self->_exportedInterface, a3);
  id v6 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  objc_msgSend(v6, a2, v7);

  [(NSLock *)self->_lock unlock];
}

- (id)exportedObject
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_exportedObject;
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (void)setExportedObject:(id)a3
{
  id v7 = a3;
  [(NSLock *)self->_lock lock];
  objc_storeStrong(&self->_exportedObject, a3);
  id v6 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  objc_msgSend(v6, a2, v7);

  [(NSLock *)self->_lock unlock];
}

void __50__MSXPCConnection__nts_wrappedInterruptionHandler__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _invokeInterruptionHandlerForPromise:*(void *)(a1 + 32)];
}

- (void)_invokeInterruptionHandlerForPromise:(id)a3
{
  id v7 = (EFPromise *)a3;
  [(NSLock *)self->_lock lock];
  uint64_t v4 = [(EFPromise *)v7 future];
  [v4 cancel];

  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler) {
    dispatch_async((dispatch_queue_t)self->_queue, interruptionHandler);
  }
  id v6 = [(MSXPCConnection *)self _connectionForPromise:v7];
  [v6 setInterruptionHandler:0];
  [v6 setInvalidationHandler:0];
  [v6 invalidate];
  if (self->_connectionPromise == v7)
  {
    self->_connectionPromise = 0;
  }
  [(NSLock *)self->_lock unlock];
}

- (id)interruptionHandler
{
  [(NSLock *)self->_lock lock];
  id v3 = (void *)MEMORY[0x2166BBCE0](self->_interruptionHandler);
  [(NSLock *)self->_lock unlock];
  uint64_t v4 = (void *)MEMORY[0x2166BBCE0](v3);

  return v4;
}

- (id)invalidationHandler
{
  [(NSLock *)self->_lock lock];
  id v3 = (void *)MEMORY[0x2166BBCE0](self->_invalidationHandler);
  [(NSLock *)self->_lock unlock];
  uint64_t v4 = (void *)MEMORY[0x2166BBCE0](v3);

  return v4;
}

- (void)setInvalidationHandler:(id)a3
{
  id v6 = a3;
  [(NSLock *)self->_lock lock];
  uint64_t v4 = (void *)MEMORY[0x2166BBCE0](v6);
  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = v4;

  [(NSLock *)self->_lock unlock];
}

- (void)suspend
{
  [(NSLock *)self->_lock lock];
  id v3 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  [v3 suspend];

  --self->_resumeCount;
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (id)_connection
{
  [(NSLock *)self->_lock lock];
  id v3 = [(MSXPCConnection *)self _connectionForPromise:self->_connectionPromise];
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (int)auditSessionIdentifier
{
  v2 = [(MSXPCConnection *)self _connection];
  int v3 = [v2 auditSessionIdentifier];

  return v3;
}

- (int)processIdentifier
{
  v2 = [(MSXPCConnection *)self _connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (unsigned)effectiveUserIdentifier
{
  v2 = [(MSXPCConnection *)self _connection];
  unsigned int v3 = [v2 effectiveUserIdentifier];

  return v3;
}

- (unsigned)effectiveGroupIdentifier
{
  v2 = [(MSXPCConnection *)self _connection];
  unsigned int v3 = [v2 effectiveGroupIdentifier];

  return v3;
}

- (id)remoteObjectProxy
{
  v2 = [[_MSXPCRemoteProxy alloc] initWithConnection:self interface:self->_remoteObjectInterface errorHandler:0];

  return v2;
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F07F70] code:4099 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 168);
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_6;
    id v9 = &unk_264243660;
    id v11 = v4;
    id v10 = v3;
    dispatch_async(v5, &v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v6, v7, v8, v9);
}

uint64_t __76__MSXPCConnection__sendInvocation_remoteInterface_remoteProxy_errorHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (BOOL)shouldLaunchMobileMail
{
  return self->_shouldLaunchMobileMail;
}

@end