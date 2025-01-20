@interface IDSXPCConnection
+ (id)errorForMissingEntitlement:(id)a3;
- (BOOL)forSyncMessaging;
- (BOOL)hasEntitlement:(id)a3;
- (BOOL)syncOntoMain;
- (IDSXPCConnection)initWithQueue:(id)a3 remoteObject:(id)a4;
- (IDSXPCConnection)initWithQueue:(id)a3 syncOntoMain:(BOOL)a4 takingOverAndResumingConnection:(id)a5;
- (IDSXPCConnection)initWithQueue:(id)a3 takingOverAndResumingConnection:(id)a4;
- (IDSXPCConnection)initWithRemoteObject:(id)a3 rootConnection:(id)a4;
- (IDSXPCConnection)rootConnection;
- (NSMutableDictionary)pendingTransactions;
- (NSXPCConnection)connection;
- (NSXPCProxyCreating)remoteObject;
- (OS_dispatch_queue)queue;
- (id)_initWithQueue:(id)a3 syncOntoMain:(BOOL)a4 takingOverAndResumingConnection:(id)a5 forSyncMessaging:(BOOL)a6;
- (id)initForSyncMessagingWithQueue:(id)a3 takingOverAndResumingConnection:(id)a4;
- (id)invalidationHandler;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)remoteObjectProxyWithTimeoutInSeconds:(double)a3 errorHandler:(id)a4;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)valueForEntitlement:(id)a3;
- (void)_cleanupAllPendingTransactions;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setForSyncMessaging:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)setRootConnection:(id)a3;
- (void)setSyncOntoMain:(BOOL)a3;
@end

@implementation IDSXPCConnection

+ (id)errorForMissingEntitlement:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = [NSString stringWithFormat:@"Missing entitlement \"%@\"", a3];
  v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28228];
  v9[0] = v3;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v4 errorWithDomain:@"IDSXPCConnectionErrorDomain" code:-2000 userInfo:v5];

  return v6;
}

- (IDSXPCConnection)initWithQueue:(id)a3 remoteObject:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  id v8 = a4;
  if (!*(_WORD *)&self->_syncOntoMain) {
    dispatch_assert_queue_V2(v7);
  }
  v9 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v15 = v8;
    __int16 v16 = 2048;
    v17 = self;
    _os_log_impl(&dword_19190B000, v9, OS_LOG_TYPE_DEFAULT, "Alloc'ing IDSXPCConnection {remoteObject: %{public}@, pointer: %p}", buf, 0x16u);
  }

  v13.receiver = self;
  v13.super_class = (Class)IDSXPCConnection;
  v10 = [(IDSXPCConnection *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_queue, a3);
    objc_storeStrong((id *)&v11->_remoteObject, a4);
  }

  return v11;
}

- (id)initForSyncMessagingWithQueue:(id)a3 takingOverAndResumingConnection:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel__initWithQueue_syncOntoMain_takingOverAndResumingConnection_forSyncMessaging_);
}

- (IDSXPCConnection)initWithQueue:(id)a3 takingOverAndResumingConnection:(id)a4
{
  return (IDSXPCConnection *)MEMORY[0x1F4181798](self, sel__initWithQueue_syncOntoMain_takingOverAndResumingConnection_forSyncMessaging_);
}

- (IDSXPCConnection)initWithQueue:(id)a3 syncOntoMain:(BOOL)a4 takingOverAndResumingConnection:(id)a5
{
  return (IDSXPCConnection *)MEMORY[0x1F4181798](self, sel__initWithQueue_syncOntoMain_takingOverAndResumingConnection_forSyncMessaging_);
}

- (id)_initWithQueue:(id)a3 syncOntoMain:(BOOL)a4 takingOverAndResumingConnection:(id)a5 forSyncMessaging:(BOOL)a6
{
  v11 = a3;
  id v12 = a5;
  if (!a6) {
    dispatch_assert_queue_V2(v11);
  }
  self->_forSyncMessaging = a6;
  objc_storeStrong((id *)&self->_queue, a3);
  self->_syncOntoMain = a4;
  objc_storeStrong((id *)&self->_connection, a5);
  [(NSXPCConnection *)self->_connection setDelegate:self];
  [(NSXPCConnection *)self->_connection _setQueue:v11];
  objc_super v13 = [v12 interruptionHandler];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1919E6438;
  v22[3] = &unk_1E572CCE0;
  objc_copyWeak(&v24, &location);
  id v14 = v13;
  id v23 = v14;
  [v12 setInterruptionHandler:v22];
  id v15 = [v12 invalidationHandler];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1919E64DC;
  v19[3] = &unk_1E572CCE0;
  objc_copyWeak(&v21, &location);
  id v16 = v15;
  id v20 = v16;
  [v12 setInvalidationHandler:v19];
  [(NSXPCConnection *)self->_connection resume];
  v17 = [(IDSXPCConnection *)self initWithQueue:self->_queue remoteObject:self->_connection];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v17;
}

- (IDSXPCConnection)initWithRemoteObject:(id)a3 rootConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 queue];
  v9 = [(IDSXPCConnection *)self initWithQueue:v8 remoteObject:v7];

  [(IDSXPCConnection *)v9 setRootConnection:v6];
  return v9;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    remoteObject = self->_remoteObject;
    *(_DWORD *)buf = 138543618;
    id v7 = remoteObject;
    __int16 v8 = 2048;
    v9 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Dealloc'ing IDSXPCConnection {remoteObject: %{public}@, pointer: %p}", buf, 0x16u);
  }

  [(NSXPCConnection *)self->_connection invalidate];
  v5.receiver = self;
  v5.super_class = (Class)IDSXPCConnection;
  [(IDSXPCConnection *)&v5 dealloc];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    objc_super v5 = [(IDSXPCConnection *)self queue];
    dispatch_assert_queue_V2(v5);
  }
  id v6 = [(IDSXPCConnection *)self remoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919E67D4;
  v10[3] = &unk_1E57298A8;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  __int16 v8 = [v6 remoteObjectProxyWithErrorHandler:v10];

  return v8;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    objc_super v5 = [(IDSXPCConnection *)self queue];
    dispatch_assert_queue_V2(v5);
  }
  id v6 = [(IDSXPCConnection *)self remoteObject];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1919E6910;
  v10[3] = &unk_1E57298A8;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  __int16 v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];

  return v8;
}

- (id)remoteObjectProxyWithTimeoutInSeconds:(double)a3 errorHandler:(id)a4
{
  id v6 = a4;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    id v7 = [(IDSXPCConnection *)self queue];
    dispatch_assert_queue_V2(v7);
  }
  __int16 v8 = [(IDSXPCConnection *)self remoteObject];
  v9 = [v8 remoteObjectProxyWithErrorHandler:v6];

  uint64_t v10 = [IDSXPCConnectionTimeoutProxy alloc];
  id v11 = [(IDSXPCConnection *)self rootConnection];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1919E6AA0;
  v15[3] = &unk_1E57298A8;
  v15[4] = self;
  id v16 = v6;
  id v12 = v6;
  objc_super v13 = [(IDSXPCConnectionTimeoutProxy *)v10 initWithTarget:v9 connection:v11 timeoutInSeconds:v15 errorHandler:a3];

  return v13;
}

- (id)valueForEntitlement:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    objc_super v5 = [(IDSXPCConnection *)self queue];
    dispatch_assert_queue_V2(v5);
  }
  id v6 = [(IDSXPCConnection *)self rootConnection];
  id v7 = [v6 connection];
  __int16 v8 = [v7 valueForEntitlement:v4];

  return v8;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = a3;
  if (!*(_WORD *)&self->_syncOntoMain)
  {
    objc_super v5 = [(IDSXPCConnection *)self queue];
    dispatch_assert_queue_V2(v5);
  }
  id v6 = [(IDSXPCConnection *)self valueForEntitlement:v4];
  if (objc_opt_respondsToSelector()) {
    char v7 = [v6 BOOLValue];
  }
  else {
    char v7 = v6 != 0;
  }

  return v7;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v5 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = sub_1919E6F80;
    v26[3] = &unk_1E5729000;
    id v20 = v9;
    id v27 = v20;
    id v21 = (void (**)(void))MEMORY[0x192FE03B0](v26);
    if ([(IDSXPCConnection *)self syncOntoMain])
    {
      [v20 retainArguments];
      memset(buf, 170, 16);
      pthread_main_thread_np();
      pthread_dependency_init_np();
      v22 = im_primary_queue();
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1919E6F88;
      block[3] = &unk_1E572AEF8;
      id v24 = v21;
      v25 = buf;
      dispatch_async(v22, block);

      pthread_dependency_wait_np();
    }
    else
    {
      v21[2](v21);
    }

    goto LABEL_17;
  }
  uint64_t v10 = [v9 userInfo];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F292F8]];
  uint64_t v12 = [v11 objectForKeyedSubscript:@"IDSXPCConnectionTransactionUUID"];
  if (!v12)
  {

    goto LABEL_13;
  }
  objc_super v13 = (void *)v12;
  id v14 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F292F0]];
  id v15 = [(IDSXPCConnection *)self pendingTransactions];
  id v16 = [v15 objectForKey:v13];

  v17 = [MEMORY[0x1E4F6B460] xpc];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "transaction finished -- calling invoke {selector: %{public}@, uuid: %{public}@}", buf, 0x16u);
    }

    v19 = [(IDSXPCConnection *)self pendingTransactions];
    [v19 removeObjectForKey:v13];

    v16[2](v16);
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_19190B000, v17, OS_LOG_TYPE_DEFAULT, "TransactionUUID missing from pendingTransactions --  Skipping invoke {selector: %{public}@, uuid: %{public}@}", buf, 0x16u);
    }
  }
  if (v16) {
    goto LABEL_13;
  }
LABEL_17:
}

- (IDSXPCConnection)rootConnection
{
  if (self->_rootConnection) {
    self = self->_rootConnection;
  }
  return self;
}

- (NSMutableDictionary)pendingTransactions
{
  pendingTransactions = self->_pendingTransactions;
  if (!pendingTransactions)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v5 = self->_pendingTransactions;
    self->_pendingTransactions = v4;

    pendingTransactions = self->_pendingTransactions;
  }

  return pendingTransactions;
}

- (void)_cleanupAllPendingTransactions
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F6B460] xpc];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(IDSXPCConnection *)self pendingTransactions];
    BOOL v5 = [(IDSXPCConnection *)self remoteObject];
    int v8 = 138543874;
    id v9 = v4;
    __int16 v10 = 2114;
    id v11 = v5;
    __int16 v12 = 2048;
    objc_super v13 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Dropping all pending transactions {pendingTransaction: %{public}@, remoteObject: %{public}@, pointer: %p}", (uint8_t *)&v8, 0x20u);
  }
  id v6 = [(IDSXPCConnection *)self pendingTransactions];
  [v6 enumerateKeysAndObjectsUsingBlock:&unk_1EE246808];

  char v7 = [(IDSXPCConnection *)self pendingTransactions];
  [v7 removeAllObjects];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)syncOntoMain
{
  return self->_syncOntoMain;
}

- (void)setSyncOntoMain:(BOOL)a3
{
  self->_syncOntoMain = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)setPendingTransactions:(id)a3
{
}

- (void)setRootConnection:(id)a3
{
}

- (NSXPCProxyCreating)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)forSyncMessaging
{
  return self->_forSyncMessaging;
}

- (void)setForSyncMessaging:(BOOL)a3
{
  self->_forSyncMessaging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_rootConnection, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end