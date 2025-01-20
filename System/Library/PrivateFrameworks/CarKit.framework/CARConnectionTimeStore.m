@interface CARConnectionTimeStore
+ (id)_CARConnectionServiceInterface;
- (BOOL)_setupConnectionForSystemDaemon:(BOOL)a3;
- (CARConnectionTimeStore)init;
- (NSXPCConnection)connection;
- (id)initForSystemDaemon;
- (void)_xpcFetchWithServiceBlock:(id)a3 errorHandler:(id)a4;
- (void)_xpcFetchWithSynchronousServiceBlock:(id)a3 errorHandler:(id)a4;
- (void)clearHistoricalConnectionsWithCompletion:(id)a3;
- (void)dealloc;
- (void)fetchRecentSessions:(id)a3;
- (void)sendConnectionEvent:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
- (void)syncSendConnectionEvent:(id)a3 completion:(id)a4;
@end

@implementation CARConnectionTimeStore

- (CARConnectionTimeStore)init
{
  v5.receiver = self;
  v5.super_class = (Class)CARConnectionTimeStore;
  v2 = [(CARConnectionTimeStore *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CARConnectionTimeStore *)v2 _setupConnectionForSystemDaemon:0];
  }
  return v3;
}

- (id)initForSystemDaemon
{
  v6.receiver = self;
  v6.super_class = (Class)CARConnectionTimeStore;
  v2 = [(CARConnectionTimeStore *)&v6 init];
  v3 = v2;
  if (v2 && ![(CARConnectionTimeStore *)v2 _setupConnectionForSystemDaemon:1]) {
    v4 = 0;
  }
  else {
    v4 = v3;
  }

  return v4;
}

+ (id)_CARConnectionServiceInterface
{
  if (_CARConnectionServiceInterface_onceToken != -1) {
    dispatch_once(&_CARConnectionServiceInterface_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)_CARConnectionServiceInterface___interface;
  return v2;
}

void __56__CARConnectionTimeStore__CARConnectionServiceInterface__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F03273C0];
  v1 = (void *)_CARConnectionServiceInterface___interface;
  _CARConnectionServiceInterface___interface = v0;

  v2 = (void *)_CARConnectionServiceInterface___interface;
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setClasses:v10 forSelector:sel_fetchConnectionSessions_ argumentIndex:0 ofReply:1];
}

- (BOOL)_setupConnectionForSystemDaemon:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.reconnectiontime.service" options:0];
  if (!v3) {
    goto LABEL_7;
  }
  if (xpc_user_sessions_enabled())
  {
    int v11 = 0;
    xpc_user_sessions_get_foreground_uid();
    uint64_t v8 = [v5 _xpcConnection];
    xpc_connection_set_target_user_session_uid();

LABEL_7:
    uint64_t v9 = [(id)objc_opt_class() _CARConnectionServiceInterface];
    [v5 setRemoteObjectInterface:v9];

    [v5 resume];
    [(CARConnectionTimeStore *)self setConnection:v5];
    BOOL v7 = 1;
    goto LABEL_8;
  }
  uint64_t v6 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    -[CARConnectionTimeStore _setupConnectionForSystemDaemon:](v6);
  }

  BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CARConnectionTimeStore;
  [(CARConnectionTimeStore *)&v3 dealloc];
}

- (void)_xpcFetchWithServiceBlock:(id)a3 errorHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  uint64_t v8 = [(CARConnectionTimeStore *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke;
  v13[3] = &unk_1E5E3A910;
  id v14 = v7;
  id v9 = v7;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v13];

  if (v6)
  {
    int v11 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore: Connecting to CarKit Connection Time service", v12, 2u);
    }

    v6[2](v6, v10);
  }
}

void __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (void)_xpcFetchWithSynchronousServiceBlock:(id)a3 errorHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  uint64_t v8 = [(CARConnectionTimeStore *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __76__CARConnectionTimeStore__xpcFetchWithSynchronousServiceBlock_errorHandler___block_invoke;
  v13[3] = &unk_1E5E3A910;
  id v14 = v7;
  id v9 = v7;
  uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];

  if (v6)
  {
    uint64_t v11 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore: Connecting to CarKit Connection Time service", v12, 2u);
    }

    v6[2](v6, v10);
  }
}

void __76__CARConnectionTimeStore__xpcFetchWithSynchronousServiceBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v3);
  }
}

- (void)fetchRecentSessions:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke;
  v8[3] = &unk_1E5E3AFE8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARConnectionTimeStore *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

uint64_t __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 fetchConnectionSessions:*(void *)(a1 + 32)];
}

void __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = CarConnectionTimeLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)sendConnectionEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke;
  v13[3] = &unk_1E5E3B010;
  id v14 = v6;
  id v15 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_247;
  v10[3] = &unk_1E5E3AC60;
  id v11 = v14;
  id v12 = v15;
  id v8 = v15;
  id v9 = v14;
  [(CARConnectionTimeStore *)self _xpcFetchWithServiceBlock:v13 errorHandler:v10];
}

void __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) eventName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore sendConnectionEvent: %@", (uint8_t *)&v6, 0xCu);
  }
  [v3 recordConnectionEvent:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_247(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_247_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)syncSendConnectionEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke;
  v13[3] = &unk_1E5E3B010;
  id v14 = v6;
  id v15 = v7;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_248;
  v10[3] = &unk_1E5E3AC60;
  id v11 = v14;
  id v12 = v15;
  id v8 = v15;
  id v9 = v14;
  [(CARConnectionTimeStore *)self _xpcFetchWithSynchronousServiceBlock:v13 errorHandler:v10];
}

void __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) eventName];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1ABB00000, v4, OS_LOG_TYPE_DEFAULT, "CARConnectionTimeStore syncSendConnectionEvent: %@", (uint8_t *)&v6, 0xCu);
  }
  [v3 recordConnectionEvent:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

void __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_248(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CarConnectionTimeLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_248_cold_1(a1);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)clearHistoricalConnectionsWithCompletion:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke;
  v8[3] = &unk_1E5E3AFE8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5E3A910;
  id v7 = v9;
  id v5 = v9;
  [(CARConnectionTimeStore *)self _xpcFetchWithServiceBlock:v8 errorHandler:v6];
}

uint64_t __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearHistoricalConnectionDataWithReply:*(void *)(a1 + 32)];
}

uint64_t __67__CARConnectionTimeStore_clearHistoricalConnectionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_setupConnectionForSystemDaemon:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2080;
  uint64_t v6 = xpc_strerror();
  _os_log_fault_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_FAULT, "xpc_user_sessions_get_foreground_uid() failed with error %d - %s", (uint8_t *)v4, 0x12u);
}

- (void)_setupConnectionForSystemDaemon:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1ABB00000, log, OS_LOG_TYPE_FAULT, "Cannot setup xpc connection for system daemon when xpc_user_sessions_enabled is false", v1, 2u);
}

void __65__CARConnectionTimeStore__xpcFetchWithServiceBlock_errorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__CARConnectionTimeStore_fetchRecentSessions___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __57__CARConnectionTimeStore_sendConnectionEvent_completion___block_invoke_247_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) eventName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1ABB00000, v2, v3, "CARConnectionTimeStore failed on sendConnectionEvent: %@ error: %@", v4, v5, v6, v7, v8);
}

void __61__CARConnectionTimeStore_syncSendConnectionEvent_completion___block_invoke_248_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) eventName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0(&dword_1ABB00000, v2, v3, "CARConnectionTimeStore failed on syncSendConnectionEvent: %@ error: %@", v4, v5, v6, v7, v8);
}

@end