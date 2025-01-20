@interface EMClientState
+ (OS_os_log)log;
+ (id)remoteInterface;
- (BOOL)isForeground;
- (BOOL)isRunningTests;
- (EFObserver)foregroundObservable;
- (EMClientState)initWithRemoteConnection:(id)a3;
- (EMRemoteConnection)connection;
- (id)daemonBoosterWithDescription:(id)a3;
- (void)_handleApplicationDidEnterBackground;
- (void)_handleApplicationWillEnterForeground;
- (void)_performAsyncUpdate:(id)a3;
- (void)exitDaemon;
- (void)setConnection:(id)a3;
- (void)setCurrentlyVisibleMailboxObjectIDs:(id)a3;
- (void)setCurrentlyVisibleMailboxes:(id)a3;
- (void)setForegroundObservable:(id)a3;
- (void)setIsForeground:(BOOL)a3;
- (void)setIsRunningTests:(BOOL)a3;
- (void)setStateForDemoMode:(id)a3;
- (void)test_handleApplicationDidEnterBackground;
- (void)test_handleApplicationWillEnterForeground;
@end

@implementation EMClientState

- (void)setIsForeground:(BOOL)a3
{
  if (self->_isForeground != a3)
  {
    BOOL v3 = a3;
    self->_isForeground = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__EMClientState_setIsForeground___block_invoke;
    v7[3] = &__block_descriptor_33_e34_v16__0___EMClientStateInterface__8l;
    BOOL v8 = a3;
    [(EMClientState *)self _performAsyncUpdate:v7];
    v5 = [(EMClientState *)self foregroundObservable];
    v6 = [NSNumber numberWithBool:v3];
    [v5 observerDidReceiveResult:v6];
  }
}

- (EFObserver)foregroundObservable
{
  return self->_foregroundObservable;
}

- (id)daemonBoosterWithDescription:(id)a3
{
  id v4 = a3;
  v5 = [EMDaemonBooster alloc];
  v6 = [(EMClientState *)self connection];
  v7 = [(EMDaemonBooster *)v5 initWithConnection:v6 description:v4];

  return v7;
}

void __37__EMClientState__performAsyncUpdate___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) connection];
  id v3 = [v2 remoteObjectProxy];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (EMRemoteConnection)connection
{
  return (EMRemoteConnection *)objc_getProperty(self, a2, 24, 1);
}

uint64_t __53__EMClientState_setCurrentlyVisibleMailboxObjectIDs___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisibleMailboxObjectIDs:*(void *)(a1 + 32)];
}

uint64_t __33__EMClientState_setIsForeground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsForeground:*(unsigned __int8 *)(a1 + 32)];
}

+ (id)remoteInterface
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  id v4 = objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1A867B0];
  [v5 setClasses:v4 forSelector:sel_setVisibleMailboxObjectIDs_ argumentIndex:0 ofReply:0];
  v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
  [v5 setClasses:v6 forSelector:sel_setStateForDemoMode_ argumentIndex:1 ofReply:1];

  return v5;
}

- (void)_handleApplicationWillEnterForeground
{
}

- (void)setCurrentlyVisibleMailboxes:(id)a3
{
  id v4 = objc_msgSend(a3, "ef_filter:", *MEMORY[0x1E4F60CE8]);
  objc_msgSend(v4, "ef_compactMapSelector:", sel_objectID);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  [(EMClientState *)self setCurrentlyVisibleMailboxObjectIDs:v5];
}

- (void)setCurrentlyVisibleMailboxObjectIDs:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EMClientState_setCurrentlyVisibleMailboxObjectIDs___block_invoke;
  v6[3] = &unk_1E63E2BF8;
  id v7 = v4;
  id v5 = v4;
  [(EMClientState *)self _performAsyncUpdate:v6];
}

- (void)_performAsyncUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  BOOL v8 = self;
  id v5 = v4;
  id v9 = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v7, 3221225472, __37__EMClientState__performAsyncUpdate___block_invoke, &unk_1E63E2890, v8);
  [v6 performBlock:&v7];
}

- (EMClientState)initWithRemoteConnection:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EMClientState;
  v6 = [(EMClientState *)&v19 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    connection = v7->_connection;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __42__EMClientState_initWithRemoteConnection___block_invoke;
    v16 = &unk_1E63E2688;
    objc_copyWeak(&v17, &location);
    [(EMRemoteConnection *)connection addRecoveryHandler:&v13];
    id v9 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v13, v14, v15, v16);
    [v9 addObserver:v7 selector:sel__handleApplicationWillEnterForeground name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v9 addObserver:v7 selector:sel__handleApplicationDidEnterBackground name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    uint64_t v10 = [MEMORY[0x1E4F60DD8] observableObserver];
    foregroundObservable = v7->_foregroundObservable;
    v7->_foregroundObservable = (EFObserver *)v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__EMClientState_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, block);
  }
  v2 = (void *)log_log_7;
  return (OS_os_log *)v2;
}

void __20__EMClientState_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;
}

void __42__EMClientState_initWithRemoteConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__EMClientState_initWithRemoteConnection___block_invoke_2;
  v3[3] = &unk_1E63E2BF8;
  id v4 = WeakRetained;
  id v2 = WeakRetained;
  [v2 _performAsyncUpdate:v3];
}

void __42__EMClientState_initWithRemoteConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setIsForeground:", objc_msgSend(*(id *)(a1 + 32), "isForeground"));
  objc_msgSend(v3, "setIsRunningTests:", objc_msgSend(*(id *)(a1 + 32), "isRunningTests"));
}

- (void)_handleApplicationDidEnterBackground
{
}

- (void)test_handleApplicationWillEnterForeground
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EMClientState.m", 113, @"%s can only be called from unit tests", "-[EMClientState test_handleApplicationWillEnterForeground]");
  }
  [(EMClientState *)self _handleApplicationWillEnterForeground];
}

- (void)test_handleApplicationDidEnterBackground
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EMClientState.m", 118, @"%s can only be called from unit tests", "-[EMClientState test_handleApplicationDidEnterBackground]");
  }
  [(EMClientState *)self _handleApplicationDidEnterBackground];
}

- (void)setStateForDemoMode:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  BOOL v8 = self;
  id v5 = v4;
  id v9 = v5;
  v6 = objc_msgSend(MEMORY[0x1E4F60F28], "mainThreadScheduler", v7, 3221225472, __37__EMClientState_setStateForDemoMode___block_invoke, &unk_1E63E2890, v8);
  [v6 performBlock:&v7];
}

void __37__EMClientState_setStateForDemoMode___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connection];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__EMClientState_setStateForDemoMode___block_invoke_2;
  v4[3] = &unk_1E63E2C40;
  id v5 = *(id *)(a1 + 40);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v4];

  [v3 setStateForDemoMode:*(void *)(a1 + 40)];
}

uint64_t __37__EMClientState_setStateForDemoMode___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exitDaemon
{
  id v2 = [(EMClientState *)self connection];
  id v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_4];

  [v3 exitDaemon];
}

void __27__EMClientState_exitDaemon__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[EMClientState log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    id v4 = objc_msgSend(v2, "ef_publicDescription");
    __27__EMClientState_exitDaemon__block_invoke_cold_1(v4, v5, v3);
  }
}

- (void)setIsRunningTests:(BOOL)a3
{
  self->_isRunningTests = a3;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__EMClientState_setIsRunningTests___block_invoke;
  v3[3] = &__block_descriptor_33_e34_v16__0___EMClientStateInterface__8l;
  BOOL v4 = a3;
  [(EMClientState *)self _performAsyncUpdate:v3];
}

uint64_t __35__EMClientState_setIsRunningTests___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsRunningTests:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isForeground
{
  return self->_isForeground;
}

- (void)setForegroundObservable:(id)a3
{
}

- (BOOL)isRunningTests
{
  return self->_isRunningTests;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_foregroundObservable, 0);
}

void __27__EMClientState_exitDaemon__block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "Failed to establish XPC connection. Error: %{public}@", buf, 0xCu);
}

@end