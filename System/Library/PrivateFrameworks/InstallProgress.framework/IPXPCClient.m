@interface IPXPCClient
- (IPXPCClient)initWithConnection:(id)a3 serviceQueue:(id)a4;
- (IPXPCClientDelegate)delegate;
- (NSString)description;
- (id)asyncProxy:(id)a3;
- (void)actionBarrier:(id)a3;
- (void)getActiveInstallations:(id)a3;
- (void)getAllInstallableStates:(id)a3;
- (void)getProgressForIdentity:(id)a3 completion:(id)a4;
- (void)registerAsProgressObserver:(id)a3;
- (void)resume;
- (void)sendProgressEndForIdentity:(id)a3 reason:(unint64_t)a4;
- (void)sendUpdateForIdentity:(id)a3 currentProgress:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation IPXPCClient

- (IPXPCClient)initWithConnection:(id)a3 serviceQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)IPXPCClient;
  v9 = [(IPXPCClient *)&v18 init];
  if (v9)
  {
    [v7 _setQueue:v8];
    v10 = IPServerExportedInterface();
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:v9];
    v11 = IPClientExportedInterface();
    [v7 setRemoteObjectInterface:v11];

    objc_initWeak(&location, v9);
    objc_initWeak(&from, v7);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__IPXPCClient_initWithConnection_serviceQueue___block_invoke;
    v13[3] = &unk_26538F750;
    objc_copyWeak(&v14, &location);
    objc_copyWeak(&v15, &from);
    [v7 setInvalidationHandler:v13];
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __47__IPXPCClient_initWithConnection_serviceQueue___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained(WeakRetained + 2);
    [v2 clientDisconnected:WeakRetained];
  }
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 setExportedObject:0];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p {%@}>", objc_opt_class(), self, self->_connection];
}

- (void)resume
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v5 = 138412290;
    v6 = connection;
    _os_log_impl(&dword_252AA9000, v3, OS_LOG_TYPE_DEFAULT, "resuming %@", (uint8_t *)&v5, 0xCu);
  }

  [(NSXPCConnection *)self->_connection resume];
}

- (id)asyncProxy:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (void)sendUpdateForIdentity:(id)a3 currentProgress:(id)a4
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke;
  v9[3] = &unk_26538F778;
  v9[4] = self;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IPXPCClient *)self asyncProxy:v9];
  [v8 installableForIdentity:v7 progressChanged:v6];
}

void __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke_cold_1();
  }
}

- (void)sendProgressEndForIdentity:(id)a3 reason:(unint64_t)a4
{
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke;
  v8[3] = &unk_26538F778;
  v8[4] = self;
  id v6 = a3;
  id v7 = [(IPXPCClient *)self asyncProxy:v8];
  [v7 installableForIdentity:v6 progressEndedForReason:a4];
}

void __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = _IPServerLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke_cold_1();
  }
}

- (void)actionBarrier:(id)a3
{
}

- (void)registerAsProgressObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, void))a3;
  int v5 = _IPServerLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = self;
    _os_log_impl(&dword_252AA9000, v5, OS_LOG_TYPE_DEFAULT, "Client %@ registering as progress observer.", (uint8_t *)&v6, 0xCu);
  }

  v4[2](v4, 0);
}

- (void)getActiveInstallations:(id)a3
{
  p_delegate = &self->_delegate;
  v10 = (void (**)(id, id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v6 = [WeakRetained activeInstallationsForClient:self];
  id v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  v10[2](v10, v9, 0);
}

- (void)getAllInstallableStates:(id)a3
{
  p_delegate = &self->_delegate;
  v10 = (void (**)(id, id, void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  uint64_t v6 = [WeakRetained allInstallableStatesForClient:self];
  id v7 = (void *)v6;
  uint64_t v8 = (void *)MEMORY[0x263EFFA68];
  if (v6) {
    uint64_t v8 = (void *)v6;
  }
  id v9 = v8;

  v10[2](v10, v9, 0);
}

- (void)getProgressForIdentity:(id)a3 completion:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v12 = 0;
  v10 = [WeakRetained progressForIdentity:v8 forClient:self error:&v12];

  id v11 = v12;
  v7[2](v7, v10, v11);
}

- (IPXPCClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IPXPCClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_transport);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __53__IPXPCClient_sendUpdateForIdentity_currentProgress___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_252AA9000, v0, v1, "Could not send progress update to %@: %@");
}

void __49__IPXPCClient_sendProgressEndForIdentity_reason___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_252AA9000, v0, v1, "could not send progress end to %@: %@");
}

@end