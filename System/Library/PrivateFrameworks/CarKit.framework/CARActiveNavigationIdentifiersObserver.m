@interface CARActiveNavigationIdentifiersObserver
- (CARActiveNavigationIdentifiersObserver)init;
- (CARObserverHashTable)observers;
- (NSArray)activeNavigationIdentifiers;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)workQueue;
- (void)_setupConnection;
- (void)activeNavigationIdentifiersChangedTo:(id)a3;
- (void)addObserver:(id)a3;
- (void)invalidate;
- (void)removeObserver:(id)a3;
- (void)setConnection:(id)a3;
- (void)setObservers:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation CARActiveNavigationIdentifiersObserver

- (CARActiveNavigationIdentifiersObserver)init
{
  v12.receiver = self;
  v12.super_class = (Class)CARActiveNavigationIdentifiersObserver;
  v2 = [(CARActiveNavigationIdentifiersObserver *)&v12 init];
  if (v2)
  {
    v3 = [[CARObserverHashTable alloc] initWithProtocol:&unk_1F0327600];
    observers = v2->_observers;
    v2->_observers = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.CarPlayApp.ActiveNavigationIdentifiersWorkQueue", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    [(CARActiveNavigationIdentifiersObserver *)v2 _setupConnection];
    v8 = v2->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__CARActiveNavigationIdentifiersObserver_init__block_invoke;
    block[3] = &unk_1E5E3A938;
    v11 = v2;
    dispatch_async(v8, block);
  }
  return v2;
}

void __46__CARActiveNavigationIdentifiersObserver_init__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_23];

  uint64_t v5 = 0;
  dispatch_queue_t v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CARActiveNavigationIdentifiersObserver_init__block_invoke_65;
  v4[3] = &unk_1E5E3BBA8;
  v4[4] = &v5;
  [v3 fetchNavigationIdentifiersWithReply:v4];
  [*(id *)(a1 + 32) activeNavigationIdentifiersChangedTo:v6[5]];
  _Block_object_dispose(&v5, 8);
}

void __46__CARActiveNavigationIdentifiersObserver_init__block_invoke_65(uint64_t a1, void *a2)
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARActiveNavigationIdentifiersObserver *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CARActiveNavigationIdentifiersObserver *)self observers];
  [v5 removeObserver:v4];
}

- (void)_setupConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.navowners.service" options:4096];
  id v4 = CRCarPlayNavigationOwnerClientInterface();
  [v3 setExportedInterface:v4];

  [v3 setExportedObject:self];
  id v5 = CRCarPlayNavigationOwnersServiceInterface();
  [v3 setRemoteObjectInterface:v5];

  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke;
  v10[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v11, &location);
  [v3 setInterruptionHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke_2;
  v8[3] = &unk_1E5E3AC10;
  objc_copyWeak(&v9, &location);
  [v3 setInvalidationHandler:v8];
  [v3 resume];
  [(CARActiveNavigationIdentifiersObserver *)self setConnection:v3];
  dispatch_queue_t v6 = [(CARActiveNavigationIdentifiersObserver *)self connection];
  uint64_t v7 = [v6 remoteObjectProxy];
  [v7 beginObserving];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __58__CARActiveNavigationIdentifiersObserver__setupConnection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)activeNavigationIdentifiersChangedTo:(id)a3
{
  id v4 = (NSArray *)[a3 copy];
  activeNavigationIdentifiers = self->_activeNavigationIdentifiers;
  self->_activeNavigationIdentifiers = v4;

  id v6 = [(CARActiveNavigationIdentifiersObserver *)self observers];
  [v6 activeNavigationIdentifiersObserver:self updatedActiveNavigationIdentifiers:self->_activeNavigationIdentifiers];
}

- (void)invalidate
{
  id v2 = [(CARActiveNavigationIdentifiersObserver *)self connection];
  [v2 invalidate];
}

- (NSArray)activeNavigationIdentifiers
{
  return self->_activeNavigationIdentifiers;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_activeNavigationIdentifiers, 0);
}

@end