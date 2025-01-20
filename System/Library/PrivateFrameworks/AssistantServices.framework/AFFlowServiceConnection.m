@interface AFFlowServiceConnection
+ (id)sharedConnection;
- (id)_connection;
- (id)_init;
- (void)_clearConnection;
- (void)invokeMethodOnRemoteWithBlock:(id)a3 onError:(id)a4;
@end

@implementation AFFlowServiceConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)_connection
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  connection = self->_connection;
  if (!connection)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 136315394;
      *(void *)&location[4] = "-[AFFlowServiceConnection _connection]";
      __int16 v14 = 2112;
      uint64_t v15 = 0;
      _os_log_debug_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEBUG, "%s created new connection: %@", location, 0x16u);
    }
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.assistant.flow_service" options:0];
    v6 = self->_connection;
    self->_connection = v5;

    [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
    objc_initWeak((id *)location, self);
    v7 = self->_connection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __38__AFFlowServiceConnection__connection__block_invoke;
    v11[3] = &unk_1E592B978;
    objc_copyWeak(&v12, (id *)location);
    [(NSXPCConnection *)v7 setInvalidationHandler:v11];
    v8 = self->_connection;
    v9 = AFFlowServiceXPCInterface();
    [(NSXPCConnection *)v8 setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)location);
    connection = self->_connection;
  }
  return connection;
}

void __38__AFFlowServiceConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clearConnection];
}

- (void)_clearConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    connection = self->_connection;
    int v6 = 136315394;
    v7 = "-[AFFlowServiceConnection _clearConnection]";
    __int16 v8 = 2112;
    v9 = connection;
    _os_log_debug_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_DEBUG, "%s cleared connection: %@", (uint8_t *)&v6, 0x16u);
  }
  [(NSXPCConnection *)self->_connection invalidate];
  v4 = self->_connection;
  self->_connection = 0;
}

- (void)invokeMethodOnRemoteWithBlock:(id)a3 onError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke;
  block[3] = &unk_1E5924FD8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  v2 = [AFSafetyBlock alloc];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2;
  v15[3] = &unk_1E5928308;
  v15[4] = *(void *)(a1 + 32);
  v3 = [(AFSafetyBlock *)v2 initWithBlock:v15];
  v4 = [*(id *)(a1 + 32) _connection];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_3;
  v12[3] = &unk_1E5929680;
  id v14 = *(id *)(a1 + 40);
  v5 = v3;
  id v13 = v5;
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v12];

  uint64_t v7 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_5;
  v10[3] = &unk_1E592C710;
  v10[4] = *(void *)(a1 + 32);
  v11 = v5;
  __int16 v8 = *(void (**)(uint64_t, void *, void *))(v7 + 16);
  id v9 = v5;
  v8(v7, v6, v10);
}

void *__65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 16);
  result = *(void **)(a1 + 32);
  if (!result[2]) {
    return (void *)[result _clearConnection];
  }
  return result;
}

void __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[AFFlowServiceConnection invokeMethodOnRemoteWithBlock:onError:]_block_invoke_3";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Error accessing remote proxy: %@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invoke];
}

void __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_5(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2_6;
  block[3] = &unk_1E592C678;
  id v3 = *(id *)(a1 + 40);
  dispatch_async(v1, block);
}

uint64_t __65__AFFlowServiceConnection_invokeMethodOnRemoteWithBlock_onError___block_invoke_2_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)AFFlowServiceConnection;
  v2 = [(AFFlowServiceConnection *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v5 = dispatch_queue_create("AFFlowServiceConnection", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global_2116);
  }
  v2 = (void *)sharedConnection_sConnection;
  return v2;
}

void __43__AFFlowServiceConnection_sharedConnection__block_invoke()
{
  id v0 = [[AFFlowServiceConnection alloc] _init];
  v1 = (void *)sharedConnection_sConnection;
  sharedConnection_sConnection = (uint64_t)v0;
}

@end