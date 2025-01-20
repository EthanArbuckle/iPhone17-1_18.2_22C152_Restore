@interface APXPCRemoteConnection
+ (id)connectionFor:(id)a3;
+ (id)connectionForMachService:(id)a3;
+ (id)sharedConnectionFor:(id)a3;
+ (id)sharedConnections;
+ (void)addSharedConnection:(id)a3 forMachService:(id)a4;
+ (void)removeSharedConnectionForMachService:(id)a3;
- (APUnfairLock)unfairLock;
- (APXPCRemoteConnection)initWithDelegate:(id)a3;
- (NSMutableArray)delegates;
- (NSString)machService;
- (NSXPCConnection)xpcConnection;
- (int)numClients;
- (void)addDelegate:(id)a3;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)dealloc;
- (void)decreaseConnectionCount;
- (void)increaseConnectionCount;
- (void)invalidateForDelegate:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setNumClients:(int)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation APXPCRemoteConnection

- (void)connectionInvalidated
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = v2->_delegates;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "connectionInvalidated", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfairLock, 0);
  objc_storeStrong((id *)&self->_machService, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

+ (void)addSharedConnection:(id)a3 forMachService:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  uint64_t v6 = [(id)objc_opt_class() sharedConnections];
  objc_sync_enter(v6);
  long long v7 = [(id)objc_opt_class() sharedConnections];
  [v7 setObject:v8 forKey:v5];

  objc_sync_exit(v6);
}

+ (id)connectionFor:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543362;
    id v8 = v3;
    _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_INFO, "A new connection will be established for %{public}@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = [[APXPCRemoteConnection alloc] initWithDelegate:v3];
  return v5;
}

- (APXPCRemoteConnection)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APXPCRemoteConnection;
  id v5 = [(APXPCRemoteConnection *)&v14 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_numClients = 0;
    uint64_t v7 = [(id)objc_opt_class() machService];
    machService = v6->_machService;
    v6->_machService = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    delegates = v6->_delegates;
    v6->_delegates = (NSMutableArray *)v9;

    v11 = [[APUnfairLock alloc] initWithOptions:0];
    unfairLock = v6->_unfairLock;
    v6->_unfairLock = v11;

    [(APXPCRemoteConnection *)v6 addDelegate:v4];
  }

  return v6;
}

- (void)addDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_delegates addObject:v5];
  [(APXPCRemoteConnection *)v4 increaseConnectionCount];
  objc_sync_exit(v4);
}

- (void)increaseConnectionCount
{
  obj = self;
  objc_sync_enter(obj);
  ++obj->_numClients;
  objc_sync_exit(obj);
}

- (NSXPCConnection)xpcConnection
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [(APXPCRemoteConnection *)self unfairLock];
  [v3 lock];
  if (self->_xpcConnection)
  {
LABEL_19:
    [v3 unlock];
    v31 = self->_xpcConnection;
    goto LABEL_20;
  }
  id v4 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    id v42 = (id)objc_opt_class();
    __int16 v43 = 2114;
    v44 = self;
    id v5 = v42;
    _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_INFO, "[%{private}@] Creating a new NSXPCConnection for %{public}@", buf, 0x16u);
  }
  uint64_t v6 = [(APXPCRemoteConnection *)self delegates];
  uint64_t v7 = [v6 firstObject];

  if (v7)
  {
    id v8 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v9 = [(id)objc_opt_class() machService];
    long long v10 = (NSXPCConnection *)[v8 initWithMachServiceName:v9 options:4096];
    xpcConnection = self->_xpcConnection;
    self->_xpcConnection = v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F29280];
    v13 = [v7 remoteObjectInterface];
    objc_super v14 = [v12 interfaceWithProtocol:v13];

    if (objc_opt_respondsToSelector())
    {
      v15 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = objc_opt_class();
        *(_DWORD *)buf = 138477827;
        id v42 = v16;
        id v17 = v16;
        _os_log_impl(&dword_1D70B2000, v15, OS_LOG_TYPE_INFO, "[%{private}@] Extending remote selectors to allow collection classes to pass data.", buf, 0xCu);
      }
      [v7 extendCollectionClassesForRemoteInterface:v14];
    }
    [(NSXPCConnection *)self->_xpcConnection setRemoteObjectInterface:v14];
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v18 = [v7 exportedInterface];
      if (v18)
      {
        v19 = [v7 exportedObject];
        BOOL v20 = v19 == 0;

        if (!v20)
        {
          v21 = (void *)MEMORY[0x1E4F29280];
          v22 = [v7 exportedInterface];
          v23 = [v21 interfaceWithProtocol:v22];
          [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v23];

          v24 = (void *)MEMORY[0x1E4F29280];
          v25 = [v7 exportedInterface];
          v26 = [v24 interfaceWithProtocol:v25];

          if (objc_opt_respondsToSelector())
          {
            v27 = APLogForCategory(0x33uLL);
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              v28 = objc_opt_class();
              *(_DWORD *)buf = 138477827;
              id v42 = v28;
              id v29 = v28;
              _os_log_impl(&dword_1D70B2000, v27, OS_LOG_TYPE_INFO, "[%{private}@] Extending exported selectors to allow collection classes to pass data.", buf, 0xCu);
            }
            [v7 extendCollectionClassesForExportedInterface:v26];
          }
          [(NSXPCConnection *)self->_xpcConnection setExportedInterface:v26];
          v30 = [v7 exportedObject];
          [(NSXPCConnection *)self->_xpcConnection setExportedObject:v30];
        }
      }
    }
    objc_initWeak((id *)buf, self);
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = sub_1D70D8C58;
    v39[3] = &unk_1E6A6B770;
    objc_copyWeak(&v40, (id *)buf);
    [(NSXPCConnection *)self->_xpcConnection setInterruptionHandler:v39];
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = sub_1D70B4808;
    v37 = &unk_1E6A6B770;
    objc_copyWeak(&v38, (id *)buf);
    [(NSXPCConnection *)self->_xpcConnection setInvalidationHandler:&v34];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)buf);

    goto LABEL_19;
  }
  v33 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D70B2000, v33, OS_LOG_TYPE_ERROR, "There are no known delegates. Returning a nil xpc connection as no one can handle the messages.", buf, 2u);
  }

  [v3 unlock];
  v31 = 0;
LABEL_20:

  return v31;
}

- (APUnfairLock)unfairLock
{
  return self->_unfairLock;
}

- (void)invalidateForDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 138543362;
    id v12 = v4;
    _os_log_impl(&dword_1D70B2000, v5, OS_LOG_TYPE_INFO, "Request to invalidate the connection from %{public}@", (uint8_t *)&v11, 0xCu);
  }

  [(APXPCRemoteConnection *)self removeDelegate:v4];
  if (!self->_numClients)
  {
    uint64_t v6 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      id v8 = NSStringFromClass(v7);
      uint64_t v9 = [(APXPCRemoteConnection *)self machService];
      int v11 = 138478083;
      id v12 = v8;
      __int16 v13 = 2114;
      objc_super v14 = v9;
      _os_log_impl(&dword_1D70B2000, v6, OS_LOG_TYPE_INFO, "[%{private}@] No more clients exist for the xpc connection to %{public}@. Invalidating the connection.", (uint8_t *)&v11, 0x16u);
    }
    long long v10 = [(APXPCRemoteConnection *)self unfairLock];
    [v10 lock];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    [(APXPCRemoteConnection *)self setXpcConnection:0];
    [v10 unlock];
  }
}

- (void)removeDelegate:(id)a3
{
  id v5 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  [(NSMutableArray *)v4->_delegates removeObject:v5];
  [(APXPCRemoteConnection *)v4 decreaseConnectionCount];
  objc_sync_exit(v4);
}

- (void)decreaseConnectionCount
{
  obj = self;
  objc_sync_enter(obj);
  --obj->_numClients;
  objc_sync_exit(obj);
}

- (void)setXpcConnection:(id)a3
{
}

- (NSString)machService
{
  return self->_machService;
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (void)dealloc
{
  [(id)objc_opt_class() removeSharedConnectionForMachService:self->_machService];
  v3.receiver = self;
  v3.super_class = (Class)APXPCRemoteConnection;
  [(APXPCRemoteConnection *)&v3 dealloc];
}

+ (id)sharedConnectionFor:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v10 = 138543362;
    id v11 = v3;
    _os_log_impl(&dword_1D70B2000, v4, OS_LOG_TYPE_INFO, "The shared connection will be used for %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id v5 = [(id)objc_opt_class() machService];
  uint64_t v6 = [(id)objc_opt_class() connectionForMachService:v5];
  if (v6)
  {
    uint64_t v7 = v6;
    [(APXPCRemoteConnection *)v6 addDelegate:v3];
  }
  else
  {
    uint64_t v7 = [[APXPCRemoteConnection alloc] initWithDelegate:v3];
    [(id)objc_opt_class() addSharedConnection:v7 forMachService:v5];
  }
  id v8 = v7;

  return v8;
}

+ (void)removeSharedConnectionForMachService:(id)a3
{
  id v5 = a3;
  id v3 = [(id)objc_opt_class() sharedConnections];
  objc_sync_enter(v3);
  id v4 = [(id)objc_opt_class() sharedConnections];
  [v4 removeObjectForKey:v5];

  objc_sync_exit(v3);
}

+ (id)connectionForMachService:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sharedConnections];
  objc_sync_enter(v4);
  id v5 = [(id)objc_opt_class() sharedConnections];
  uint64_t v6 = [v5 objectForKey:v3];

  objc_sync_exit(v4);
  return v6;
}

+ (id)sharedConnections
{
  if (qword_1EB789B48 != -1) {
    dispatch_once(&qword_1EB789B48, &unk_1F2E9CCD0);
  }
  v2 = (void *)qword_1EB789B38;
  return v2;
}

- (void)connectionInterrupted
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = v2->_delegates;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "connectionInterrupted", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (int)numClients
{
  return self->_numClients;
}

- (void)setNumClients:(int)a3
{
  self->_numClients = a3;
}

- (void)setDelegates:(id)a3
{
}

@end