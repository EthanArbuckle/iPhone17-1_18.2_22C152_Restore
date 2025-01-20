@interface AAFXPCSession
- (AAFXPCSession)initWithRemoteServiceConfig:(id)a3 delegate:(id)a4;
- (AAFXPCSessionConfig)remoteServiceConfig;
- (AAFXPCSessionDelegate)delegate;
- (NSUUID)identifier;
- (NSXPCConnection)connection;
- (id)_unsafe_createNewConnection;
- (id)remoteServiceProxy;
- (id)remoteServiceProxyWithErrorHandler:(id)a3;
- (id)syncRemoteServiceProxy;
- (id)syncRemoteServiceProxyWithErrorHandler:(id)a3;
- (os_unfair_lock_s)connectionLock;
- (void)_unsafe_destroyXPCConnection;
- (void)activate;
- (void)invalidate;
- (void)resume;
- (void)setConnection:(id)a3;
- (void)setConnectionLock:(os_unfair_lock_s)a3;
- (void)setDelegate:(id)a3;
- (void)suspend;
@end

@implementation AAFXPCSession

- (AAFXPCSession)initWithRemoteServiceConfig:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AAFXPCSession;
  v9 = [(AAFXPCSession *)&v13 init];
  if (v9)
  {
    v10 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_remoteServiceConfig, a3);
    objc_storeWeak((id *)&v9->_delegate, v8);
    v9->_connectionLock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (id)remoteServiceProxy
{
  v2 = [(AAFXPCSession *)self connection];
  v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_2];

  return v3;
}

void __35__AAFXPCSession_remoteServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _AAFLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__AAFXPCSession_remoteServiceProxy__block_invoke_cold_1();
  }
}

- (id)remoteServiceProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(AAFXPCSession *)self connection];
  v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)syncRemoteServiceProxy
{
  id v2 = [(AAFXPCSession *)self connection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2];

  return v3;
}

void __39__AAFXPCSession_syncRemoteServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _AAFLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __35__AAFXPCSession_remoteServiceProxy__block_invoke_cold_1();
  }
}

- (id)syncRemoteServiceProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  v5 = [(AAFXPCSession *)self connection];
  v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)activate
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD937000, log, OS_LOG_TYPE_DEBUG, "Connection activated", v1, 2u);
}

- (void)resume
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DD937000, log, OS_LOG_TYPE_DEBUG, "Connection resumed", v1, 2u);
}

- (void)suspend
{
  p_connectionLock = &self->_connectionLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __24__AAFXPCSession_suspend__block_invoke;
  v3[3] = &unk_1E6CFA7E0;
  v3[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __24__AAFXPCSession_suspend__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

uint64_t __24__AAFXPCSession_suspend__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) suspend];
}

- (void)invalidate
{
  p_connectionLock = &self->_connectionLock;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __27__AAFXPCSession_invalidate__block_invoke;
  v3[3] = &unk_1E6CFA7E0;
  v3[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  __27__AAFXPCSession_invalidate__block_invoke((uint64_t)v3);
  os_unfair_lock_unlock(p_connectionLock);
}

uint64_t __27__AAFXPCSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_unsafe_destroyXPCConnection");
}

- (NSXPCConnection)connection
{
  p_connectionLock = &self->_connectionLock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__AAFXPCSession_connection__block_invoke;
  v5[3] = &unk_1E6CFA808;
  v5[4] = self;
  os_unfair_lock_lock(&self->_connectionLock);
  v3 = __27__AAFXPCSession_connection__block_invoke((uint64_t)v5);
  os_unfair_lock_unlock(p_connectionLock);
  return (NSXPCConnection *)v3;
}

id __27__AAFXPCSession_connection__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_unsafe_createNewConnection");
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)_unsafe_destroyXPCConnection
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (id)_unsafe_createNewConnection
{
  id v3 = objc_alloc(MEMORY[0x1E4F29268]);
  id v4 = [(AAFXPCSession *)self remoteServiceConfig];
  v5 = [v4 serviceName];
  v6 = [(AAFXPCSession *)self remoteServiceConfig];
  id v7 = (NSXPCConnection *)objc_msgSend(v3, "initWithMachServiceName:options:", v5, objc_msgSend(v6, "options"));
  connection = self->_connection;
  self->_connection = v7;

  v9 = [(AAFXPCSessionConfig *)self->_remoteServiceConfig exportedProtocol];

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E4F29280];
    v11 = [(AAFXPCSessionConfig *)self->_remoteServiceConfig exportedProtocol];
    v12 = [v10 interfaceWithProtocol:v11];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 configureExportedInterface:v12];
    }
    [(NSXPCConnection *)self->_connection setExportedInterface:v12];
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)&self->_delegate);
      v19 = [v18 exportedObject];
      [(NSXPCConnection *)self->_connection setExportedObject:v19];
    }
  }
  v20 = (void *)MEMORY[0x1E4F29280];
  v21 = [(AAFXPCSessionConfig *)self->_remoteServiceConfig remoteProtocol];
  v22 = [v20 interfaceWithProtocol:v21];

  id v23 = objc_loadWeakRetained((id *)&self->_delegate);
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    id v25 = objc_loadWeakRetained((id *)&self->_delegate);
    [v25 configureRemoteInterface:v22];
  }
  [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v22];
  objc_initWeak(&location, self->_connection);
  objc_initWeak(&from, self);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __44__AAFXPCSession__unsafe_createNewConnection__block_invoke;
  v31[3] = &unk_1E6CFA830;
  objc_copyWeak(&v32, &location);
  objc_copyWeak(&v33, &from);
  [(NSXPCConnection *)self->_connection setInterruptionHandler:v31];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_15;
  v28[3] = &unk_1E6CFA830;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v28];
  v26 = self->_connection;
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v26;
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (id *)(a1 + 40);
  id v4 = objc_loadWeakRetained(v3);
  v5 = [v4 delegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0 && WeakRetained)
  {
    id v7 = objc_loadWeakRetained(v3);
    id v8 = [v7 delegate];
    [v8 remoteServiceDidInterrupt];
  }
  else
  {
    id v7 = _AAFLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_cold_1();
    }
  }
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_15(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
  id v4 = [WeakRetained delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0 && v3)
  {
    char v6 = [WeakRetained delegate];
    [v6 remoteServiceDidInvalidate];
  }
  else
  {
    char v6 = _AAFLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_15_cold_1();
    }
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (AAFXPCSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAFXPCSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AAFXPCSessionConfig)remoteServiceConfig
{
  return self->_remoteServiceConfig;
}

- (os_unfair_lock_s)connectionLock
{
  return self->_connectionLock;
}

- (void)setConnectionLock:(os_unfair_lock_s)a3
{
  self->_connectionLock = a3;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_remoteServiceConfig, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __35__AAFXPCSession_remoteServiceProxy__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD937000, v0, v1, "Error getting synchronous connection to service : %@", v2, v3, v4, v5, v6);
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD937000, v0, v1, "Connection interrupted: %@", v2, v3, v4, v5, v6);
}

void __44__AAFXPCSession__unsafe_createNewConnection__block_invoke_15_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD937000, v0, v1, "Connection invalidated: %@", v2, v3, v4, v5, v6);
}

@end