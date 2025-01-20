@interface CSRCHandlingXPCClient
- (CSRCHandlingXPCClient)init;
- (NSXPCConnection)rcXPCConnection;
- (OS_dispatch_queue)xpcConnectionQueue;
- (id)_getRemoteServiceProxyObject;
- (id)remoteObjectProxy;
- (void)_createClientConnection;
- (void)dealloc;
- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8;
- (void)setRcXPCConnection:(id)a3;
- (void)setRemoteObjectProxy:(id)a3;
- (void)setXpcConnectionQueue:(id)a3;
@end

@implementation CSRCHandlingXPCClient

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteObjectProxy, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_rcXPCConnection, 0);
}

- (void)setRemoteObjectProxy:(id)a3
{
}

- (id)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (void)setXpcConnectionQueue:(id)a3
{
}

- (OS_dispatch_queue)xpcConnectionQueue
{
  return self->_xpcConnectionQueue;
}

- (void)setRcXPCConnection:(id)a3
{
}

- (NSXPCConnection)rcXPCConnection
{
  return self->_rcXPCConnection;
}

- (void)_createClientConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.corespeech.corespeechd.rchandling.service" options:4096];
  rcXPCConnection = self->_rcXPCConnection;
  self->_rcXPCConnection = v3;

  v5 = self->_rcXPCConnection;
  v6 = CSRCHandlingXPCServiceGetXPCInterface();
  [(NSXPCConnection *)v5 setRemoteObjectInterface:v6];

  [(NSXPCConnection *)self->_rcXPCConnection setExportedObject:self];
  [(NSXPCConnection *)self->_rcXPCConnection _setQueue:self->_xpcConnectionQueue];
  objc_initWeak(&location, self);
  v7 = self->_rcXPCConnection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke;
  v11[3] = &unk_1E658C420;
  objc_copyWeak(&v12, &location);
  [(NSXPCConnection *)v7 setInterruptionHandler:v11];
  v8 = self->_rcXPCConnection;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_2;
  v9[3] = &unk_1E658C420;
  objc_copyWeak(&v10, &location);
  [(NSXPCConnection *)v8 setInvalidationHandler:v9];
  [(NSXPCConnection *)self->_rcXPCConnection resume];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __48__CSRCHandlingXPCClient__createClientConnection__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = [WeakRetained rcXPCConnection];
    v5 = [WeakRetained rcXPCConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSRCHandlingXPCClient _createClientConnection]_block_invoke";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Interruption Handler: %{public}@, client PID: %{public}d)", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained rcXPCConnection];

    if (v6)
    {
      v7 = [WeakRetained xpcConnectionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_8;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

void __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = [WeakRetained rcXPCConnection];
    v5 = [WeakRetained rcXPCConnection];
    *(_DWORD *)buf = 136315650;
    id v10 = "-[CSRCHandlingXPCClient _createClientConnection]_block_invoke_2";
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1026;
    int v14 = [v5 processIdentifier];
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Client Invalidation Handler: %{public}@, client PID: %{public}d exited", buf, 0x1Cu);
  }
  if (WeakRetained)
  {
    v6 = [WeakRetained rcXPCConnection];

    if (v6)
    {
      v7 = [WeakRetained xpcConnectionQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_10;
      block[3] = &unk_1E658D4D8;
      block[4] = WeakRetained;
      dispatch_async(v7, block);
    }
  }
}

uint64_t __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_10(uint64_t a1)
{
  [*(id *)(a1 + 32) setRcXPCConnection:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setRemoteObjectProxy:0];
}

uint64_t __48__CSRCHandlingXPCClient__createClientConnection__block_invoke_8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) rcXPCConnection];
  [v2 invalidate];

  [*(id *)(a1 + 32) setRcXPCConnection:0];
  v3 = *(void **)(a1 + 32);
  return [v3 setRemoteObjectProxy:0];
}

- (id)_getRemoteServiceProxyObject
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id remoteObjectProxy = self->_remoteObjectProxy;
  if (!remoteObjectProxy || !self->_rcXPCConnection)
  {
    v4 = (os_log_t *)MEMORY[0x1E4F5D180];
    v5 = *MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[CSRCHandlingXPCClient _getRemoteServiceProxyObject]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Creating RemoteServiceProxy", buf, 0xCu);
    }
    rcXPCConnection = self->_rcXPCConnection;
    if (rcXPCConnection
      || ([(CSRCHandlingXPCClient *)self _createClientConnection],
          (rcXPCConnection = self->_rcXPCConnection) != 0))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __53__CSRCHandlingXPCClient__getRemoteServiceProxyObject__block_invoke;
      v12[3] = &unk_1E658C9D8;
      v12[4] = self;
      v7 = [(NSXPCConnection *)rcXPCConnection synchronousRemoteObjectProxyWithErrorHandler:v12];
      id v8 = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = v7;
    }
    else
    {
      __int16 v11 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        int v14 = "-[CSRCHandlingXPCClient _getRemoteServiceProxyObject]";
        _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s ERR: RCProcessing rcProcConnection is nil", buf, 0xCu);
      }
      id v8 = self->_remoteObjectProxy;
      self->_id remoteObjectProxy = 0;
    }

    id remoteObjectProxy = self->_remoteObjectProxy;
  }
  id v9 = remoteObjectProxy;
  return v9;
}

void __53__CSRCHandlingXPCClient__getRemoteServiceProxyObject__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = (void *)*MEMORY[0x1E4F5D180];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_ERROR))
    {
      v7 = v4;
      uint64_t v8 = [v3 code];
      id v9 = [v3 localizedDescription];
      int v10 = 136315650;
      __int16 v11 = "-[CSRCHandlingXPCClient _getRemoteServiceProxyObject]_block_invoke";
      __int16 v12 = 2050;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s ERR: RC Processing Remote Object Proxy returned error : %{public}ld (%{public}@)", (uint8_t *)&v10, 0x20u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 8);
    *(void *)(v5 + 8) = 0;
  }
}

- (void)getMitigationDecisionForRCIdWithCompletion:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  int v10 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    uint64_t v13 = "-[CSRCHandlingXPCClient getMitigationDecisionForRCIdWithCompletion:requestId:completion:]";
    __int16 v14 = 2048;
    unint64_t v15 = a3;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s Getting mitigation decision for rdId: %lu", (uint8_t *)&v12, 0x16u);
  }
  __int16 v11 = [(CSRCHandlingXPCClient *)self _getRemoteServiceProxyObject];
  [v11 getMitigationDecisionForRCIdWithCompletion:a3 requestId:v8 completion:v9];
}

- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v18 = *MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315650;
    v21 = "-[CSRCHandlingXPCClient processRCWithId:requestId:speechPackage:taskId:forceAccept:completionHandler:]";
    __int16 v22 = 2048;
    unint64_t v23 = a3;
    __int16 v24 = 1024;
    BOOL v25 = v9;
    _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s Received RC with id: %lu, forceAccept: %d", (uint8_t *)&v20, 0x1Cu);
  }
  v19 = [(CSRCHandlingXPCClient *)self _getRemoteServiceProxyObject];
  [v19 processRCWithId:a3 requestId:v14 speechPackage:v15 taskId:v16 forceAccept:v9 completionHandler:v17];
}

- (void)dealloc
{
  [(CSRCHandlingXPCClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CSRCHandlingXPCClient;
  [(CSRCHandlingXPCClient *)&v3 dealloc];
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_rcXPCConnection invalidate];
  rcXPCConnection = self->_rcXPCConnection;
  self->_rcXPCConnection = 0;
}

- (CSRCHandlingXPCClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSRCHandlingXPCClient;
  v2 = [(CSRCHandlingXPCClient *)&v6 init];
  if (v2)
  {
    CSLogInitIfNeeded();
    uint64_t v3 = [MEMORY[0x1E4F5D450] getSerialQueue:@"com.apple.corespeech.rchandling.xpc.connection" qualityOfService:33];
    xpcConnectionQueue = v2->_xpcConnectionQueue;
    v2->_xpcConnectionQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

@end