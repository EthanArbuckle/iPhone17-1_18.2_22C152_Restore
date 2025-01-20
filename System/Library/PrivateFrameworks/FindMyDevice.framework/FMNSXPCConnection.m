@interface FMNSXPCConnection
- (BOOL)_testMockConnection;
- (FMFuture)future;
- (FMNSXPCConnection)initWithConfiguration:(id)a3;
- (FMNSXPCConnection)initWithConfiguration:(id)a3 exportedObject:(id)a4;
- (NSXPCConnection)connection;
- (id)remoteObjectProxy;
- (int64_t)state;
- (void)addFailureBlock:(id)a3;
- (void)dealloc;
- (void)destroyXPCConnection;
- (void)setConnection:(id)a3;
- (void)setFuture:(id)a3;
- (void)set_testMockConnection:(BOOL)a3;
@end

@implementation FMNSXPCConnection

- (int64_t)state
{
  v3 = [(FMNSXPCConnection *)self connection];
  if (v3)
  {
    int64_t v4 = 1;
  }
  else if ([(FMNSXPCConnection *)self _testMockConnection])
  {
    int64_t v4 = 1;
  }
  else
  {
    int64_t v4 = 2;
  }

  return v4;
}

- (void)addFailureBlock:(id)a3
{
  id v4 = a3;
  v5 = [(FMNSXPCConnection *)self future];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__FMNSXPCConnection_addFailureBlock___block_invoke;
  v8[3] = &unk_1E689C038;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addFailureBlock:v8];
}

- (FMFuture)future
{
  return self->_future;
}

- (id)remoteObjectProxy
{
  objc_initWeak(&location, self);
  v3 = [(FMNSXPCConnection *)self connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__FMNSXPCConnection_remoteObjectProxy__block_invoke;
  v6[3] = &unk_1E689CF40;
  objc_copyWeak(&v7, &location);
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (FMNSXPCConnection)initWithConfiguration:(id)a3 exportedObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)FMNSXPCConnection;
  v8 = [(FMNSXPCConnection *)&v32 init];
  id v9 = v8;
  if (v8)
  {
    v8->__testMockConnection = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F61548]);
    objc_initWeak(&location, v9);
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke;
    v29[3] = &unk_1E689CF40;
    objc_copyWeak(&v30, &location);
    id v11 = (id)[v10 addFailureBlock:v29];
    [(FMNSXPCConnection *)v9 setFuture:v10];
    if ([v6 machService])
    {
      id v12 = objc_alloc(MEMORY[0x1E4F29268]);
      v13 = [v6 serviceName];
      uint64_t v14 = objc_msgSend(v12, "initWithMachServiceName:options:", v13, objc_msgSend(v6, "options"));
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F29268]);
      v13 = [v6 serviceName];
      uint64_t v14 = [v15 initWithServiceName:v13];
    }
    v16 = (void *)v14;

    v17 = [v6 remoteInterface];
    [v16 setRemoteObjectInterface:v17];

    v18 = [v6 exportedInterface];

    if (v18)
    {
      v19 = [v6 exportedInterface];
      [v16 setExportedInterface:v19];

      if (v7)
      {
        [v16 setExportedObject:v7];
      }
      else
      {
        v20 = LogCategory_Unspecified();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[FMNSXPCConnection initWithConfiguration:exportedObject:](v20);
        }
      }
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_3;
    v26[3] = &unk_1E689CF68;
    id v21 = v6;
    id v27 = v21;
    objc_copyWeak(&v28, &location);
    [v16 setInterruptionHandler:v26];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_6;
    v23[3] = &unk_1E689CF68;
    id v24 = v21;
    objc_copyWeak(&v25, &location);
    [v16 setInvalidationHandler:v23];
    [v16 resume];
    [(FMNSXPCConnection *)v9 setConnection:v16];
    objc_destroyWeak(&v25);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v9;
}

- (void)setFuture:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

- (FMNSXPCConnection)initWithConfiguration:(id)a3
{
  return [(FMNSXPCConnection *)self initWithConfiguration:a3 exportedObject:0];
}

void __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained destroyXPCConnection];
}

void __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) serviceName];
    int v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D0E93000, v2, OS_LOG_TYPE_DEFAULT, "FMNSXPCConnection Connection interrupted %@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FMNSXPCConnectionErrorDomain" code:1 userInfo:0];
  id v6 = [WeakRetained future];
  [v6 finishWithError:v5];
}

void __58__FMNSXPCConnection_initWithConfiguration_exportedObject___block_invoke_6(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = LogCategory_Unspecified();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = [*(id *)(a1 + 32) serviceName];
    int v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D0E93000, v2, OS_LOG_TYPE_DEFAULT, "FMNSXPCConnection Connection invalidated %@", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"FMNSXPCConnectionErrorDomain" code:0 userInfo:0];
  id v6 = [WeakRetained future];
  [v6 finishWithError:v5];
}

- (void)dealloc
{
  [(FMNSXPCConnection *)self destroyXPCConnection];
  v3.receiver = self;
  v3.super_class = (Class)FMNSXPCConnection;
  [(FMNSXPCConnection *)&v3 dealloc];
}

void __38__FMNSXPCConnection_remoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __38__FMNSXPCConnection_remoteObjectProxy__block_invoke_cold_1((uint64_t)v3, v5);
  }

  if ([v3 code] == 4099) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 2;
  }
  int v7 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28A50];
  v12[0] = v3;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  uint64_t v9 = [v7 errorWithDomain:@"FMNSXPCConnectionErrorDomain" code:v6 userInfo:v8];

  id v10 = [WeakRetained future];
  [v10 finishWithError:v9];
}

uint64_t __37__FMNSXPCConnection_addFailureBlock___block_invoke(uint64_t result, void *a2)
{
  if (*(void *)(result + 32))
  {
    uint64_t v2 = result;
    id v3 = a2;
    [v3 code];
    id v4 = [v3 domain];

    [v4 isEqualToString:@"FMNSXPCConnectionErrorDomain"];
    v5 = *(uint64_t (**)(void))(*(void *)(v2 + 32) + 16);
    return v5();
  }
  return result;
}

- (void)destroyXPCConnection
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_DEBUG, "Invalidating the xpc connection %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)_testMockConnection
{
  return self->__testMockConnection;
}

- (void)set_testMockConnection:(BOOL)a3
{
  self->__testMockConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConfiguration:(os_log_t)log exportedObject:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0E93000, log, OS_LOG_TYPE_ERROR, "Creating xpc connection with exportedInterface but no exportedObject", v1, 2u);
}

void __38__FMNSXPCConnection_remoteObjectProxy__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0E93000, a2, OS_LOG_TYPE_ERROR, "FMNSXPCConnection could not create remote object proxy %@", (uint8_t *)&v2, 0xCu);
}

@end