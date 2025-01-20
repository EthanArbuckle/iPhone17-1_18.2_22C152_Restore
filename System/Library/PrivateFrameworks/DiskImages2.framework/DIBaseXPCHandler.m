@interface DIBaseXPCHandler
- (BOOL)completeCommandWithError:(id *)a3;
- (BOOL)connectWithError:(id *)a3;
- (BOOL)dupStderrWithError:(id *)a3;
- (BOOL)isPrivileged;
- (DIBaseXPCHandler)init;
- (NSError)xpcError;
- (NSXPCConnection)connection;
- (OS_dispatch_semaphore)semaphore;
- (id)remoteObjectInterface;
- (id)remoteProxy;
- (id)serviceName;
- (void)closeConnection;
- (void)createConnection;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setIsPrivileged:(BOOL)a3;
- (void)setRemoteProxy:(id)a3;
- (void)setSemaphore:(id)a3;
- (void)setXpcError:(id)a3;
- (void)signalCommandCompletedWithXpcError:(id)a3;
@end

@implementation DIBaseXPCHandler

- (DIBaseXPCHandler)init
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)DIBaseXPCHandler;
  v2 = [(DIBaseXPCHandler *)&v11 init];
  if (v2
    && (dispatch_semaphore_t v3 = dispatch_semaphore_create(0),
        [(DIBaseXPCHandler *)v2 setSemaphore:v3],
        v3,
        [(DIBaseXPCHandler *)v2 semaphore],
        v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    int v6 = *__error();
    if (DIForwardLogs())
    {
      v7 = getDIOSLog();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      int v13 = 24;
      __int16 v14 = 2080;
      v15 = "-[DIBaseXPCHandler init]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      v9 = getDIOSLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        int v13 = 24;
        __int16 v14 = 2080;
        v15 = "-[DIBaseXPCHandler init]";
        _os_log_impl(&dword_21E237000, v9, OS_LOG_TYPE_ERROR, "%.*s: Failed creating semaphore", buf, 0x12u);
      }
    }
    v5 = 0;
    *__error() = v6;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection invalidate];
  }
  v4.receiver = self;
  v4.super_class = (Class)DIBaseXPCHandler;
  [(DIBaseXPCHandler *)&v4 dealloc];
}

- (id)serviceName
{
  return 0;
}

- (BOOL)connectWithError:(id *)a3
{
  objc_initWeak(&location, self);
  [(DIBaseXPCHandler *)self createConnection];
  v5 = [(DIBaseXPCHandler *)self connection];

  if (v5)
  {
    int v6 = [(DIBaseXPCHandler *)self connection];
    [v6 resume];

    v7 = [(DIBaseXPCHandler *)self connection];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    int v13 = __37__DIBaseXPCHandler_connectWithError___block_invoke;
    __int16 v14 = &unk_2644A2388;
    objc_copyWeak(&v15, &location);
    v8 = [v7 remoteObjectProxyWithErrorHandler:&v11];
    -[DIBaseXPCHandler setRemoteProxy:](self, "setRemoteProxy:", v8, v11, v12, v13, v14);

    objc_destroyWeak(&v15);
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = +[DIError failWithEnumValue:151 verboseInfo:@"Failed to create XPC connection object" error:a3];
  }
  objc_destroyWeak(&location);
  return v9;
}

void __37__DIBaseXPCHandler_connectWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained signalCommandCompletedWithXpcError:v3];
}

- (void)signalCommandCompletedWithXpcError:(id)a3
{
  [(DIBaseXPCHandler *)self setXpcError:a3];
  objc_super v4 = [(DIBaseXPCHandler *)self semaphore];
  dispatch_semaphore_signal(v4);
}

- (BOOL)completeCommandWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v5 = [(DIBaseXPCHandler *)self semaphore];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  int v6 = [(DIBaseXPCHandler *)self xpcError];
  [(DIBaseXPCHandler *)self setXpcError:0];
  v7 = [(DIBaseXPCHandler *)self connection];

  if (v7)
  {
    if (v6)
    {
      int v8 = *__error();
      if (DIForwardLogs())
      {
        BOOL v9 = getDIOSLog();
        os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158210;
        int v15 = 45;
        __int16 v16 = 2080;
        v17 = "-[DIBaseXPCHandler completeCommandWithError:]";
        __int16 v18 = 2114;
        v19 = v6;
        v10 = (char *)_os_log_send_and_compose_impl();

        if (v10)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v10);
          free(v10);
        }
      }
      else
      {
        uint64_t v12 = getDIOSLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          int v15 = 45;
          __int16 v16 = 2080;
          v17 = "-[DIBaseXPCHandler completeCommandWithError:]";
          __int16 v18 = 2114;
          v19 = v6;
          _os_log_impl(&dword_21E237000, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Got error from last XPC command: %{public}@", buf, 0x1Cu);
        }
      }
      *__error() = v8;
      LOBYTE(v11) = 0;
      if (a3) {
        *a3 = v6;
      }
    }
    else
    {
      LOBYTE(v11) = 1;
    }
  }
  else
  {
    BOOL v11 = +[DIError failWithEnumValue:151 verboseInfo:@"XPC connection failed" error:a3];
  }

  return v11;
}

- (void)closeConnection
{
  id v3 = [(DIBaseXPCHandler *)self connection];
  [v3 invalidate];

  [(DIBaseXPCHandler *)self setConnection:0];
}

- (BOOL)dupStderrWithError:(id *)a3
{
  objc_initWeak(&location, self);
  id v5 = objc_alloc(MEMORY[0x263F08840]);
  int v6 = (void *)[v5 initWithFileDescriptor:fileno((FILE *)*MEMORY[0x263EF8348])];
  v7 = [(DIBaseXPCHandler *)self remoteProxy];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  BOOL v11 = __39__DIBaseXPCHandler_dupStderrWithError___block_invoke;
  uint64_t v12 = &unk_2644A2388;
  objc_copyWeak(&v13, &location);
  [v7 dupWithStderrHandle:v6 reply:&v9];

  LOBYTE(a3) = -[DIBaseXPCHandler completeCommandWithError:](self, "completeCommandWithError:", a3, v9, v10, v11, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
  return (char)a3;
}

void __39__DIBaseXPCHandler_dupStderrWithError___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained signalCommandCompletedWithXpcError:v3];
}

- (void)createConnection
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v3 = *__error();
  if (DIForwardLogs())
  {
    objc_super v4 = getDIOSLog();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    [(DIBaseXPCHandler *)self serviceName];
    *(_DWORD *)buf = 68158210;
    int v14 = 36;
    __int16 v15 = 2080;
    __int16 v16 = "-[DIBaseXPCHandler createConnection]";
    __int16 v17 = 2114;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v5 = (char *)_os_log_send_and_compose_impl();

    if (v5)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v5);
      free(v5);
    }
  }
  else
  {
    int v6 = getDIOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(DIBaseXPCHandler *)self serviceName];
      *(_DWORD *)buf = 68158210;
      int v14 = 36;
      __int16 v15 = 2080;
      __int16 v16 = "-[DIBaseXPCHandler createConnection]";
      __int16 v17 = 2114;
      id v18 = v7;
      _os_log_impl(&dword_21E237000, v6, OS_LOG_TYPE_DEFAULT, "%.*s: Creating connection with %{public}@", buf, 0x1Cu);
    }
  }
  *__error() = v3;
  id v8 = objc_alloc(MEMORY[0x263F08D68]);
  uint64_t v9 = [(DIBaseXPCHandler *)self serviceName];
  uint64_t v10 = (void *)[v8 initWithServiceName:v9];
  [(DIBaseXPCHandler *)self setConnection:v10];

  BOOL v11 = [(DIBaseXPCHandler *)self remoteObjectInterface];
  uint64_t v12 = [(DIBaseXPCHandler *)self connection];
  [v12 setRemoteObjectInterface:v11];
}

- (id)remoteObjectInterface
{
  return 0;
}

- (id)remoteProxy
{
  return self->_remoteProxy;
}

- (void)setRemoteProxy:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
}

- (NSError)xpcError
{
  return self->_xpcError;
}

- (void)setXpcError:(id)a3
{
}

- (BOOL)isPrivileged
{
  return self->_isPrivileged;
}

- (void)setIsPrivileged:(BOOL)a3
{
  self->_isPrivileged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcError, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_remoteProxy, 0);
}

@end