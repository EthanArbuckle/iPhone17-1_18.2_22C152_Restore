@interface BMAccessConnectionFactory
+ (BMAccessConnectionFactoryDelegate)delegate;
+ (id)connectionToAccessServerInDomain:(unint64_t)a3 user:(unsigned int)a4 useCase:(id)a5;
+ (id)connectionToFileServerInDomain:(unint64_t)a3 user:(unsigned int)a4 useCase:(id)a5;
+ (id)defaultQueue;
+ (id)globalStrongConnectionCache;
+ (id)globalWeakConnectionCache;
+ (void)_configureConnection:(id)a3 interface:(id)a4 useCase:(id)a5;
+ (void)setDelegate:(id)a3;
- (BMAccessConnectionFactory)initWithType:(unint64_t)a3 domain:(unint64_t)a4 user:(unsigned int)a5 useCase:(id)a6;
- (BMAccessConnectionFactoryDelegate)delegate;
- (BOOL)connectionIsCrossUser;
- (BOOL)currentProcessCanDirectlyConnectCrossUser;
- (id)_legacyUserDomainConnection;
- (id)_newConnection;
- (id)_proxyConnectionThroughCoreDuet;
- (id)_regularConnection;
- (id)_requestConnectionFromCaller;
- (id)coreDuetMachService;
- (id)machServiceName;
- (id)makeConnection;
- (id)remoteObjectInterface;
- (unint64_t)_connectionFlags;
- (unsigned)user;
- (void)_configureConnection:(id)a3;
- (void)_requestConnectionFromCaller;
- (void)setDelegate:(id)a3;
@end

@implementation BMAccessConnectionFactory

uint64_t __54__BMAccessConnectionFactory_globalWeakConnectionCache__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isValid] ^ 1;
}

uint64_t __54__BMAccessConnectionFactory_globalWeakConnectionCache__block_invoke()
{
  uint64_t v0 = +[BMCache weakCache];
  v1 = (void *)globalWeakConnectionCache_cache;
  globalWeakConnectionCache_cache = v0;

  v2 = (void *)globalWeakConnectionCache_cache;
  return [v2 setIsExpiredBlock:&__block_literal_global_4];
}

id __43__BMAccessConnectionFactory_makeConnection__block_invoke_2(uint64_t a1)
{
  v2 = [BMXPCConnectionWrapper alloc];
  v3 = (void *)[*(id *)(a1 + 32) _newConnection];
  id v4 = [(BMXPCConnectionWrapper *)v2 _initWithConnection:v3];

  return v4;
}

- (id)_requestConnectionFromCaller
{
  v3 = _os_activity_create(&dword_1B30A0000, "Proxying connection through caller", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = [MEMORY[0x1E4F29268] currentConnection];
  if (!v4)
  {
    v5 = __biome_log_for_category(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BMAccessConnectionFactory _requestConnectionFromCaller](v5);
    }
  }
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  v6 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_89];
  unint64_t domain = self->_domain;
  uint64_t v8 = [(BMAccessConnectionFactory *)self user];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_90;
  v15[3] = &unk_1E60234B8;
  v15[4] = &v16;
  [v6 requestBiomeEndpointForAppScopedService:domain user:v8 reply:v15];

  v9 = (void *)v17[5];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F29268];
    v11 = [(id)objc_opt_class() defaultQueue];
    v9 = objc_msgSend(v10, "bm_connectionWithListenerEndpoint:queue:", v9, v11);

    v12 = objc_opt_class();
    v13 = [(BMAccessConnectionFactory *)self remoteObjectInterface];
    [v12 _configureConnection:v9 interface:v13 useCase:self->_useCase];
  }
  _Block_object_dispose(&v16, 8);

  os_activity_scope_leave(&state);
  return v9;
}

- (void)_configureConnection:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(BMAccessConnectionFactory *)self remoteObjectInterface];
  [v5 _configureConnection:v4 interface:v6 useCase:self->_useCase];
}

- (id)remoteObjectInterface
{
  unint64_t serviceType = self->_serviceType;
  if (!serviceType)
  {
    v3 = (id *)&protocolRef_BMAccessServer;
    goto LABEL_5;
  }
  if (serviceType == 1)
  {
    v3 = (id *)&protocolRef_BMFileServer;
LABEL_5:
    id v4 = *v3;
    v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:v4];

    goto LABEL_7;
  }
  v5 = 0;
LABEL_7:
  return v5;
}

- (id)_regularConnection
{
  v3 = &BMMachServiceNameUserAccessService;
  if (self->_domain) {
    v3 = &BMMachServiceNameSystemAccessService;
  }
  id v4 = (void *)MEMORY[0x1E4F29268];
  v5 = *v3;
  id v6 = [(id)objc_opt_class() defaultQueue];
  v7 = objc_msgSend(v4, "bm_connectionWithMachServiceName:queue:options:", v5, v6, 4096);

  [(BMAccessConnectionFactory *)self _configureConnection:v7];
  return v7;
}

+ (void)_configureConnection:(id)a3 interface:(id)a4 useCase:(id)a5
{
  id v8 = a5;
  id v10 = a3;
  [v10 setRemoteObjectInterface:a4];
  v9 = [a1 defaultQueue];
  [v10 _setQueue:v9];

  [v10 activate];
  objc_msgSend(v10, "setBm_exportedUseCase:", v8);
}

+ (id)defaultQueue
{
  if (defaultQueue_onceToken != -1) {
    dispatch_once(&defaultQueue_onceToken, &__block_literal_global_92);
  }
  v2 = (void *)defaultQueue_queue;
  return v2;
}

- (unsigned)user
{
  if (self->_domain == 1) {
    return 0;
  }
  else {
    return self->_user;
  }
}

+ (id)connectionToFileServerInDomain:(unint64_t)a3 user:(unsigned int)a4 useCase:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  id v8 = [[BMAccessConnectionFactory alloc] initWithType:1 domain:a3 user:v5 useCase:v7];

  v9 = +[BMAccessConnectionFactory delegate];
  [(BMAccessConnectionFactory *)v8 setDelegate:v9];

  id v10 = [(BMAccessConnectionFactory *)v8 makeConnection];

  return v10;
}

- (void)setDelegate:(id)a3
{
}

- (BMAccessConnectionFactory)initWithType:(unint64_t)a3 domain:(unint64_t)a4 user:(unsigned int)a5 useCase:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BMAccessConnectionFactory;
  v12 = [(BMAccessConnectionFactory *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_unint64_t serviceType = a3;
    v12->_unint64_t domain = a4;
    v12->_user = a5;
    objc_storeStrong((id *)&v12->_useCase, a6);
  }

  return v13;
}

+ (BMAccessConnectionFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained(&_delegate);
  return (BMAccessConnectionFactoryDelegate *)WeakRetained;
}

- (id)_newConnection
{
  unint64_t v3 = [(BMAccessConnectionFactory *)self _connectionFlags];
  if (v3)
  {
    [(BMAccessConnectionFactory *)self _requestConnectionFromCaller];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((v3 & 2) != 0)
  {
    [(BMAccessConnectionFactory *)self _proxyConnectionThroughCoreDuet];
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((v3 & 0x10000) != 0) {
      [(BMAccessConnectionFactory *)self _legacyUserDomainConnection];
    }
    else {
      [(BMAccessConnectionFactory *)self _regularConnection];
    }
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)makeConnection
{
  unint64_t v3 = [[_BMXPCConnectionCacheKey alloc] initWithServiceType:self->_serviceType domain:self->_domain user:self->_user useCase:self->_useCase flags:[(BMAccessConnectionFactory *)self _connectionFlags]];
  unsigned int user = self->_user;
  if (user == getuid()
    && ([(BMAccessConnectionFactory *)self delegate],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 shouldCacheConnectionToMachService:self->_serviceType domain:self->_domain useCase:self->_useCase], v5, v6))
  {
    id v7 = [(id)objc_opt_class() globalStrongConnectionCache];
    id v8 = v7;
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __43__BMAccessConnectionFactory_makeConnection__block_invoke;
    v20 = &unk_1E6023470;
    id v21 = self;
    v9 = &v17;
  }
  else
  {
    id v7 = [(id)objc_opt_class() globalWeakConnectionCache];
    id v8 = v7;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __43__BMAccessConnectionFactory_makeConnection__block_invoke_2;
    objc_super v15 = &unk_1E6023470;
    uint64_t v16 = self;
    v9 = &v12;
  }
  id v10 = objc_msgSend(v7, "cachedObjectWithKey:missHandler:", v3, v9, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);

  return v10;
}

- (unint64_t)_connectionFlags
{
  unint64_t v3 = +[BMProcess current];
  if ([v3 processType] == 4 || objc_msgSend(v3, "processType") == 5)
  {
    unint64_t v4 = 1;
    goto LABEL_4;
  }
  int v6 = [(NSString *)self->_useCase isEqual:@"__coreduet__"];
  id v7 = [(BMAccessConnectionFactory *)self machServiceName];
  int v8 = [v3 canPerformGlobalMachLookup:v7 report:1];
  if (v6)
  {
    if (!v8)
    {
      v9 = [(BMAccessConnectionFactory *)self coreDuetMachService];
      int v10 = [v3 canPerformGlobalMachLookup:v9 report:0];

      BOOL v11 = v10 == 0;
      uint64_t v12 = 2;
      goto LABEL_11;
    }
LABEL_9:

    unint64_t v4 = 0;
    goto LABEL_4;
  }
  if (v8) {
    goto LABEL_9;
  }
  int v13 = [v3 canPerformGlobalMachLookup:@"com.apple.biome.PublicStreamAccessService" report:0];

  BOOL v11 = v13 == 0;
  uint64_t v12 = 0x10000;
LABEL_11:
  if (v11) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = v12;
  }
LABEL_4:

  return v4;
}

- (id)machServiceName
{
  if (self->_serviceType > 1)
  {
    unint64_t v3 = 0;
  }
  else
  {
    v2 = &BMMachServiceNameSystemAccessService;
    if (self->_domain != 1) {
      v2 = &BMMachServiceNameUserAccessService;
    }
    unint64_t v3 = *v2;
  }
  return v3;
}

+ (id)globalWeakConnectionCache
{
  if (globalWeakConnectionCache_onceToken != -1) {
    dispatch_once(&globalWeakConnectionCache_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)globalWeakConnectionCache_cache;
  return v2;
}

- (BMAccessConnectionFactoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BMAccessConnectionFactoryDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

+ (id)connectionToAccessServerInDomain:(unint64_t)a3 user:(unsigned int)a4 useCase:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  int v8 = [[BMAccessConnectionFactory alloc] initWithType:0 domain:a3 user:v5 useCase:v7];

  id WeakRetained = objc_loadWeakRetained(&_delegate);
  [(BMAccessConnectionFactory *)v8 setDelegate:WeakRetained];

  int v10 = [(BMAccessConnectionFactory *)v8 makeConnection];

  return v10;
}

void __41__BMAccessConnectionFactory_defaultQueue__block_invoke()
{
  attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v0 = dispatch_get_global_queue(21, 2uLL);
  dispatch_queue_t v1 = dispatch_queue_create_with_target_V2("com.apple.Biome.ResponseQueue", attr, v0);
  v2 = (void *)defaultQueue_queue;
  defaultQueue_queue = (uint64_t)v1;
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_90(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = __biome_log_for_category(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_90_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

+ (void)setDelegate:(id)a3
{
}

+ (id)globalStrongConnectionCache
{
  if (globalStrongConnectionCache_onceToken != -1) {
    dispatch_once(&globalStrongConnectionCache_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)globalStrongConnectionCache_cache;
  return v2;
}

uint64_t __56__BMAccessConnectionFactory_globalStrongConnectionCache__block_invoke()
{
  uint64_t v0 = +[BMCache strongCache];
  dispatch_queue_t v1 = (void *)globalStrongConnectionCache_cache;
  globalStrongConnectionCache_cache = v0;

  v2 = (void *)globalStrongConnectionCache_cache;
  return [v2 setIsExpiredBlock:&__block_literal_global_8];
}

uint64_t __56__BMAccessConnectionFactory_globalStrongConnectionCache__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isValid] ^ 1;
}

id __43__BMAccessConnectionFactory_makeConnection__block_invoke(uint64_t a1)
{
  v2 = [BMXPCConnectionWrapper alloc];
  unint64_t v3 = (void *)[*(id *)(a1 + 32) _newConnection];
  id v4 = [(BMXPCConnectionWrapper *)v2 _initWithConnection:v3];

  return v4;
}

- (id)coreDuetMachService
{
  v2 = get_DKMachServiceName();
  return v2;
}

- (BOOL)connectionIsCrossUser
{
  if (self->_domain) {
    return 0;
  }
  unsigned int user = self->_user;
  return user != geteuid();
}

- (BOOL)currentProcessCanDirectlyConnectCrossUser
{
  if (!getuid()) {
    return 1;
  }
  v2 = +[BMProcess current];
  char v3 = [v2 BOOLForEntitlement:@"com.apple.private.xpc.launchd.per-user-lookup"];

  return v3;
}

- (id)_proxyConnectionThroughCoreDuet
{
  char v3 = _os_activity_create(&dword_1B30A0000, "Proxying connection through CoreDuet", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  id v4 = get_DKMachServiceName();
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:4096];
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  id v6 = (void (*)(void))get_DKDaemonInterfaceSymbolLoc_ptr;
  v29 = get_DKDaemonInterfaceSymbolLoc_ptr;
  if (!get_DKDaemonInterfaceSymbolLoc_ptr)
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    uint64_t v21 = (uint64_t)__get_DKDaemonInterfaceSymbolLoc_block_invoke;
    v22 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E60229E8;
    v23 = (void (*)(uint64_t))&v26;
    id v7 = (void *)CoreDuetLibrary();
    v27[3] = (uint64_t)dlsym(v7, "_DKDaemonInterface");
    get_DKDaemonInterfaceSymbolLoc_ptr = *(_UNKNOWN **)(*((void *)v23 + 1) + 24);
    id v6 = (void (*)(void))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (v6)
  {
    int v8 = v6();
    [v5 setRemoteObjectInterface:v8];

    [v5 resume];
    uint64_t v19 = 0;
    uint64_t v20 = (uint64_t)&v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__3;
    v23 = __Block_byref_object_dispose__3;
    id v24 = 0;
    v9 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_85];
    BOOL v10 = self->_domain == 1;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_86;
    v18[3] = &unk_1E60234B8;
    v18[4] = &v19;
    [v9 requestBiomeEndpoint:v10 reply:v18];

    uint64_t v11 = *(void *)(v20 + 40);
    if (v11)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F29268];
      int v13 = [(id)objc_opt_class() defaultQueue];
      v14 = objc_msgSend(v12, "bm_connectionWithListenerEndpoint:queue:", v11, v13);

      [(BMAccessConnectionFactory *)self _configureConnection:v14];
      [v5 invalidate];
    }
    else
    {
      [v5 invalidate];
      v14 = 0;
    }
    _Block_object_dispose(&v19, 8);

    os_activity_scope_leave(&state);
    return v14;
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v17 = [NSString stringWithUTF8String:"NSXPCInterface *__softlink__DKDaemonInterface(void)"];
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, @"BMAccessConnectionFactory.m", 25, @"%s", dlerror());

    __break(1u);
  }
  return result;
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = __biome_log_for_category(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_cold_1();
  }
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = __biome_log_for_category(2);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_86_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = __biome_log_for_category(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_cold_1();
  }
}

- (id)_legacyUserDomainConnection
{
  char v3 = (void *)MEMORY[0x1E4F29268];
  id v4 = [(id)objc_opt_class() defaultQueue];
  uint64_t v5 = objc_msgSend(v3, "bm_connectionWithMachServiceName:queue:options:", @"com.apple.biome.PublicStreamAccessService", v4, 4096);

  [(BMAccessConnectionFactory *)self _configureConnection:v5];
  return v5;
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_1B30A0000, v0, v1, "Failed to connect to CoreDuet with error %@", v2, v3, v4, v5, v6);
}

void __60__BMAccessConnectionFactory__proxyConnectionThroughCoreDuet__block_invoke_86_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_1B30A0000, v0, v1, "Proxy connection through CoreDuet with error %@", v2, v3, v4, v5, v6);
}

- (void)_requestConnectionFromCaller
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1B30A0000, log, OS_LOG_TYPE_FAULT, "Unable to determine current connection in write service", v1, 2u);
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_1B30A0000, v0, v1, "Failed to connect to service client with error %@", v2, v3, v4, v5, v6);
}

void __57__BMAccessConnectionFactory__requestConnectionFromCaller__block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_1B30A0000, v0, v1, "Proxy connection through service client with error %@", v2, v3, v4, v5, v6);
}

@end