@interface CAMNebulaDaemonConnectionManager
+ (id)_clientProtocolInterface;
+ (id)_daemonProtocolInterface;
- (CAMNebulaDaemonConnectionManager)initWithConnection:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 queue:(id)a6 clientAccess:(id)a7 allowedProtocol:(id)a8;
- (CAMNebulaDaemonConnectionManagerDelegate)delegate;
- (NSMutableArray)_registeredProtocols;
- (NSMutableArray)_registeredTargets;
- (NSMutableDictionary)_tasksPerIdentifier;
- (NSString)_name;
- (NSString)bundleIdentifier;
- (NSString)clientAccess;
- (NSString)description;
- (NSXPCConnection)_connection;
- (OS_dispatch_queue)_queue;
- (Protocol)allowedProtocol;
- (id)_targetsForSelector:(SEL)a3;
- (void)_getProxyForExecutingBlock:(id)a3;
- (void)addTarget:(id)a3 forProtocol:(id)a4;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3;
- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3;
- (void)pingAfterInterruption;
- (void)setDelegate:(id)a3;
@end

@implementation CAMNebulaDaemonConnectionManager

- (CAMNebulaDaemonConnectionManager)initWithConnection:(id)a3 name:(id)a4 bundleIdentifier:(id)a5 queue:(id)a6 clientAccess:(id)a7 allowedProtocol:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v35 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v40.receiver = self;
  v40.super_class = (Class)CAMNebulaDaemonConnectionManager;
  v20 = [(CAMNebulaDaemonConnectionManager *)&v40 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_bundleIdentifier, a5);
    objc_storeStrong((id *)&v21->__connection, a3);
    uint64_t v22 = objc_msgSend(v16, "copy", v35);
    name = v21->__name;
    v21->__name = (NSString *)v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    tasksPerIdentifier = v21->__tasksPerIdentifier;
    v21->__tasksPerIdentifier = v24;

    objc_storeStrong((id *)&v21->__queue, a6);
    uint64_t v26 = [v18 copy];
    clientAccess = v21->_clientAccess;
    v21->_clientAccess = (NSString *)v26;

    objc_storeStrong((id *)&v21->_allowedProtocol, a8);
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    registeredTargets = v21->__registeredTargets;
    v21->__registeredTargets = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    registeredProtocols = v21->__registeredProtocols;
    v21->__registeredProtocols = v30;

    v32 = [(id)objc_opt_class() _daemonProtocolInterface];
    v33 = [(id)objc_opt_class() _clientProtocolInterface];
    [v15 setExportedObject:v21];
    [v15 setExportedInterface:v32];
    [v15 setRemoteObjectInterface:v33];
    [v15 _setQueue:v21->__queue];
    [v15 setDelegate:v21];
    objc_initWeak(&location, v15);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __112__CAMNebulaDaemonConnectionManager_initWithConnection_name_bundleIdentifier_queue_clientAccess_allowedProtocol___block_invoke;
    v36[3] = &unk_263FA0868;
    objc_copyWeak(&v38, &location);
    v37 = v21;
    [v15 setInvalidationHandler:v36];
    [v15 resume];

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  return v21;
}

void __112__CAMNebulaDaemonConnectionManager_initWithConnection_name_bundleIdentifier_queue_clientAccess_allowedProtocol___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) setDelegate:0];
    uint64_t v2 = *(void *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v4 daemonConnectionManagerHasBeenDisconnected:*(void *)(a1 + 32)];

    [WeakRetained setInvalidationHandler:0];
  }
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->__name;
  uint64_t v6 = [(NSXPCConnection *)self->__connection processIdentifier];
  v7 = NSStringFromProtocol(self->_allowedProtocol);
  v8 = [v3 stringWithFormat:@"<%@ %p '%@' pid: %d allowed: %@>", v4, self, name, v6, v7];

  return (NSString *)v8;
}

- (void)addTarget:(id)a3 forProtocol:(id)a4
{
  if (a3 && a4)
  {
    registeredTargets = self->__registeredTargets;
    id v7 = a4;
    [(NSMutableArray *)registeredTargets addObject:a3];
    [(NSMutableArray *)self->__registeredProtocols addObject:v7];
  }
}

+ (id)_daemonProtocolInterface
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE49FB8];
  v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_enqueueIrisVideoJobs_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)_clientProtocolInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26BE2B180];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v5)
  {
    [v10 invoke];
  }
  else
  {
    v12 = (const char *)[v10 selector];
    if ((unint64_t)protocol_getMethodDescription(self->_allowedProtocol, v12, 1, 1).name)
    {
      v13 = [(CAMNebulaDaemonConnectionManager *)self _targetsForSelector:v12];
      if ([v13 count])
      {
        v14 = (void *)os_transaction_create();
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __72__CAMNebulaDaemonConnectionManager_connection_handleInvocation_isReply___block_invoke;
        block[3] = &unk_263FA0CD0;
        id v19 = v13;
        id v20 = v11;
        id v21 = v14;
        id v15 = v14;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
      else
      {
        [v11 invoke];
      }
    }
    else
    {
      id v16 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138543618;
        v23 = self;
        __int16 v24 = 2114;
        v25 = v17;
        _os_log_impl(&dword_2099F8000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ tried to call %{public}@ but is not allowed to", buf, 0x16u);
      }
    }
  }
}

void __72__CAMNebulaDaemonConnectionManager_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "invokeWithTarget:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_targetsForSelector:(SEL)a3
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [(NSMutableArray *)self->__registeredProtocols count];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      long long v9 = [(NSMutableArray *)self->__registeredTargets objectAtIndexedSubscript:i];
      long long v10 = [(NSMutableArray *)self->__registeredProtocols objectAtIndexedSubscript:i];
      if ((unint64_t)protocol_getMethodDescription(v10, a3, 1, 1).name) {
        [v5 addObject:v9];
      }
    }
  }
  if (sel_pingAfterInterruption == a3) {
    [v5 addObject:self];
  }
  return v5;
}

- (void)pingAfterInterruption
{
  id v2 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "Handling ping from client after interruption", v3, 2u);
  }
}

- (void)_getProxyForExecutingBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->__queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke;
  block[3] = &unk_263FA28F8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke(uint64_t a1)
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained _connection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke_77;
  v6[3] = &unk_263FA28D0;
  v6[4] = &v7;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void *, uint64_t))(v5 + 16))(v5, v4, v8[5]);
  }

  _Block_object_dispose(&v7, 8);
}

void __63__CAMNebulaDaemonConnectionManager__getProxyForExecutingBlock___block_invoke_77(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "Error getting proxy object %{public}@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)forceStopTimelapseCaptureWithReasons:(int64_t)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __73__CAMNebulaDaemonConnectionManager_forceStopTimelapseCaptureWithReasons___block_invoke;
  v3[3] = &__block_descriptor_40_e53_v24__0___CAMNebulaDaemonClientProtocol__8__NSError_16l;
  v3[4] = a3;
  [(CAMNebulaDaemonConnectionManager *)self _getProxyForExecutingBlock:v3];
}

uint64_t __73__CAMNebulaDaemonConnectionManager_forceStopTimelapseCaptureWithReasons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 forceStopTimelapseCaptureWithReasons:*(void *)(a1 + 32)];
}

- (void)nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __91__CAMNebulaDaemonConnectionManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke;
  v6[3] = &unk_263FA2940;
  id v7 = v4;
  id v5 = v4;
  [(CAMNebulaDaemonConnectionManager *)self _getProxyForExecutingBlock:v6];
}

uint64_t __91__CAMNebulaDaemonConnectionManager_nebulaDaemonDidCompleteLocalVideoPersistenceWithResult___block_invoke(uint64_t a1, void *a2)
{
  return [a2 nebulaDaemonDidCompleteLocalVideoPersistenceWithResult:*(void *)(a1 + 32)];
}

- (CAMNebulaDaemonConnectionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMNebulaDaemonConnectionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)clientAccess
{
  return self->_clientAccess;
}

- (Protocol)allowedProtocol
{
  return self->_allowedProtocol;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSXPCConnection)_connection
{
  return self->__connection;
}

- (NSString)_name
{
  return self->__name;
}

- (OS_dispatch_queue)_queue
{
  return self->__queue;
}

- (NSMutableDictionary)_tasksPerIdentifier
{
  return self->__tasksPerIdentifier;
}

- (NSMutableArray)_registeredTargets
{
  return self->__registeredTargets;
}

- (NSMutableArray)_registeredProtocols
{
  return self->__registeredProtocols;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__registeredProtocols, 0);
  objc_storeStrong((id *)&self->__registeredTargets, 0);
  objc_storeStrong((id *)&self->__tasksPerIdentifier, 0);
  objc_storeStrong((id *)&self->__queue, 0);
  objc_storeStrong((id *)&self->__name, 0);
  objc_storeStrong((id *)&self->__connection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedProtocol, 0);
  objc_storeStrong((id *)&self->_clientAccess, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end