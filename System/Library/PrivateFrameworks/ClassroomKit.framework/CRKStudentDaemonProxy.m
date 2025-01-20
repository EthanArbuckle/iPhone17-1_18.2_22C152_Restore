@interface CRKStudentDaemonProxy
+ (id)studentDaemonProxy;
+ (void)fetchResourceFromURL:(id)a3 completion:(id)a4;
+ (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4;
+ (void)studentDidAuthenticate:(id)a3 completion:(id)a4;
- (BOOL)isConnected;
- (BOOL)userExpectsReconnect;
- (CRKStudentDaemonProxy)init;
- (CRKStudentDaemonProxy)initWithConnectionBuilder:(id)a3;
- (id)connectionBuilder;
- (id)enqueuedOperationForRequest:(id)a3;
- (id)operationForRequest:(id)a3;
- (int64_t)maxConnectionAttempts;
- (void)addObserver:(id)a3;
- (void)client:(id)a3 didInterruptWithError:(id)a4;
- (void)client:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5;
- (void)clientDidConnect:(id)a3;
- (void)clientDidDisconnect:(id)a3;
- (void)connect;
- (void)dealloc;
- (void)disconnect;
- (void)enqueueOperation:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setConnected:(BOOL)a3;
- (void)setMaxConnectionAttempts:(int64_t)a3;
- (void)setUserExpectsReconnect:(BOOL)a3;
@end

@implementation CRKStudentDaemonProxy

- (CRKStudentDaemonProxy)init
{
  return [(CRKStudentDaemonProxy *)self initWithConnectionBuilder:&__block_literal_global_43];
}

uint64_t __29__CRKStudentDaemonProxy_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x263F08D68], "crk_studentDaemonConnection");
}

- (CRKStudentDaemonProxy)initWithConnectionBuilder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRKStudentDaemonProxy;
  v5 = [(CRKStudentDaemonProxy *)&v15 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    mTaskClient = v5->mTaskClient;
    v5->mTaskClient = (CATTaskClient *)v6;

    [(CATTaskClient *)v5->mTaskClient setDelegate:v5];
    uint64_t v8 = objc_opt_new();
    mOperationQueue = v5->mOperationQueue;
    v5->mOperationQueue = (CATOperationQueue *)v8;

    uint64_t v10 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    mObservers = v5->mObservers;
    v5->mObservers = (NSHashTable *)v10;

    v5->_maxConnectionAttempts = 5;
    uint64_t v12 = MEMORY[0x22A620AF0](v4);
    id connectionBuilder = v5->_connectionBuilder;
    v5->_id connectionBuilder = (id)v12;
  }
  return v5;
}

- (void)dealloc
{
  [(CATTaskClient *)self->mTaskClient invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CRKStudentDaemonProxy;
  [(CRKStudentDaemonProxy *)&v3 dealloc];
}

- (void)connect
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 60, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  [(CRKStudentDaemonProxy *)self setUserExpectsReconnect:1];
  if (!self->mConnecting && ![(CRKStudentDaemonProxy *)self isConnected])
  {
    self->mConnecting = 1;
    ++self->mConnectionAttempt;
    [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_connect object:0];
    id v4 = [(CRKStudentDaemonProxy *)self connectionBuilder];
    v4[2]();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = (void *)[objc_alloc(MEMORY[0x263F39CE8]) initWithXPCConnection:v8];
    [(CATTaskClient *)self->mTaskClient connectWithTransport:v5];
  }
}

- (void)disconnect
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 77, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  self->mConnecting = 0;
  [(CRKStudentDaemonProxy *)self setUserExpectsReconnect:0];
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self selector:sel_connect object:0];
  mTaskClient = self->mTaskClient;

  [(CATTaskClient *)mTaskClient disconnect];
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 85, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  [(NSHashTable *)self->mObservers addObject:v7];
}

- (void)removeObserver:(id)a3
{
  id v7 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v5 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 90, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }
  [(NSHashTable *)self->mObservers removeObject:v7];
}

- (id)operationForRequest:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 95, @"%@ must be called from the main thread", v9 object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 96, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_3:
  uint64_t v6 = [(CATTaskClient *)self->mTaskClient prepareTaskOperationForRequest:v5];

  return v6;
}

- (id)enqueuedOperationForRequest:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x263F08B88] isMainThread])
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    v9 = NSStringFromSelector(a2);
    [v8 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 101, @"%@ must be called from the main thread", v9 object file lineNumber description];

    if (v5) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x263F08690] currentHandler];
  [v10 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 102, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];

LABEL_3:
  uint64_t v6 = [(CRKStudentDaemonProxy *)self operationForRequest:v5];
  [(CATOperationQueue *)self->mOperationQueue addOperation:v6];

  return v6;
}

- (void)enqueueOperation:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    id v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 111, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  id v5 = v9;
  if (!v9)
  {
    id v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CRKStudentDaemonProxy.m", 112, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];

    id v5 = 0;
  }
  [(CATOperationQueue *)self->mOperationQueue addOperation:v5];
}

- (void)clientDidConnect:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [(CRKStudentDaemonProxy *)self setConnected:1];
  self->mConnecting = 0;
  self->mConnectionAttempt = 0;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSHashTable *)self->mObservers allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 daemonProxyDidConnect:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)client:(id)a3 didInterruptWithError:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (_CRKLogGeneral_onceToken_10 != -1) {
    dispatch_once(&_CRKLogGeneral_onceToken_10, &__block_literal_global_142);
  }
  uint64_t v7 = (void *)_CRKLogGeneral_logObj_10;
  if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_10, OS_LOG_TYPE_ERROR)) {
    -[CRKStudentDaemonProxy client:didInterruptWithError:](v7, v6);
  }
  [v5 disconnect];
}

- (void)clientDidDisconnect:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  [(CRKStudentDaemonProxy *)self setConnected:0];
  self->mConnecting = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSHashTable *)self->mObservers allObjects];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        if (objc_opt_respondsToSelector()) {
          [v9 daemonProxyDidDisconnect:self];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  if ([(CRKStudentDaemonProxy *)self userExpectsReconnect])
  {
    int64_t mConnectionAttempt = self->mConnectionAttempt;
    if (mConnectionAttempt < [(CRKStudentDaemonProxy *)self maxConnectionAttempts]) {
      [(CRKStudentDaemonProxy *)self performSelector:sel_connect withObject:0 afterDelay:0.5];
    }
  }
}

- (void)client:(id)a3 didReceiveNotificationWithName:(id)a4 userInfo:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = [(NSHashTable *)self->mObservers allObjects];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 daemonProxy:self didReceiveNotificationWithName:v7 userInfo:v8];
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
}

+ (void)setActiveStudentIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 studentDaemonProxy];
  [v8 setActiveStudentIdentifier:v7 completion:v6];
}

+ (void)studentDidAuthenticate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 studentDaemonProxy];
  [v8 studentDidAuthenticate:v7 completion:v6];
}

+ (void)fetchResourceFromURL:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 studentDaemonProxy];
  [v8 fetchResourceFromURL:v7 completion:v6];
}

+ (id)studentDaemonProxy
{
  v2 = objc_opt_new();

  return v2;
}

- (int64_t)maxConnectionAttempts
{
  return self->_maxConnectionAttempts;
}

- (void)setMaxConnectionAttempts:(int64_t)a3
{
  self->_maxConnectionAttempts = a3;
}

- (BOOL)isConnected
{
  return self->_connected;
}

- (void)setConnected:(BOOL)a3
{
  self->_connected = a3;
}

- (BOOL)userExpectsReconnect
{
  return self->_userExpectsReconnect;
}

- (void)setUserExpectsReconnect:(BOOL)a3
{
  self->_userExpectsReconnect = a3;
}

- (id)connectionBuilder
{
  return self->_connectionBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_connectionBuilder, 0);
  objc_storeStrong((id *)&self->mObservers, 0);
  objc_storeStrong((id *)&self->mOperationQueue, 0);

  objc_storeStrong((id *)&self->mTaskClient, 0);
}

- (void)client:(void *)a1 didInterruptWithError:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = a1;
  id v4 = [a2 verboseDescription];
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_224C00000, v3, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v5, 0xCu);
}

@end