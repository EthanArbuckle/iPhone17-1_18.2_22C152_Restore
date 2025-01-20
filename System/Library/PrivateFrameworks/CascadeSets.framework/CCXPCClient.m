@interface CCXPCClient
- (CCXPCClient)init;
- (CCXPCClient)initWithRemoteObjectInterface:(id)a3 exportedInterface:(id)a4 connection:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9;
- (CCXPCClient)initWithRemoteObjectInterface:(id)a3 exportedInterface:(id)a4 serviceName:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9;
- (CCXPCClient)initWithRemoteObjectXPCInterface:(id)a3 exportedXPCInterface:(id)a4 connection:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9;
- (NSString)clientId;
- (NSString)useCase;
- (NSXPCConnection)connection;
- (id)_errorHandlerWithCompletion:(id)a3;
- (id)_failureHandlerWithResponse:(unsigned __int16)a3;
- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4;
- (unsigned)failureCode;
- (unsigned)interruptionCode;
- (void)dealloc;
- (void)invalidate;
- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5;
- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4;
- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5;
- (void)setConnection:(id)a3;
- (void)setFailureCode:(unsigned __int16)a3;
@end

@implementation CCXPCClient

- (CCXPCClient)initWithRemoteObjectInterface:(id)a3 exportedInterface:(id)a4 serviceName:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9
{
  uint64_t v9 = a8;
  uint64_t v10 = a7;
  v16 = (void *)MEMORY[0x263F08D68];
  id v17 = a9;
  id v18 = a6;
  id v19 = a4;
  id v20 = a3;
  v21 = objc_msgSend(v16, "bm_connectionWithServiceName:queue:", a5, 0);
  v22 = [(CCXPCClient *)self initWithRemoteObjectInterface:v20 exportedInterface:v19 connection:v21 clientId:v18 interruptionCode:v10 invalidationCode:v9 useCase:v17];

  return v22;
}

- (CCXPCClient)initWithRemoteObjectInterface:(id)a3 exportedInterface:(id)a4 connection:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9
{
  uint64_t v9 = a8;
  uint64_t v10 = a7;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:a3];
  if (v15)
  {
    id v20 = [MEMORY[0x263F08D80] interfaceWithProtocol:v15];
    v21 = [(CCXPCClient *)self initWithRemoteObjectXPCInterface:v19 exportedXPCInterface:v20 connection:v16 clientId:v17 interruptionCode:v10 invalidationCode:v9 useCase:v18];
  }
  else
  {
    v21 = [(CCXPCClient *)self initWithRemoteObjectXPCInterface:v19 exportedXPCInterface:0 connection:v16 clientId:v17 interruptionCode:v10 invalidationCode:v9 useCase:v18];
  }

  return v21;
}

- (CCXPCClient)initWithRemoteObjectXPCInterface:(id)a3 exportedXPCInterface:(id)a4 connection:(id)a5 clientId:(id)a6 interruptionCode:(unsigned __int16)a7 invalidationCode:(unsigned __int16)a8 useCase:(id)a9
{
  uint64_t v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v31 = a5;
  id v17 = a6;
  id v18 = a9;
  v35.receiver = self;
  v35.super_class = (Class)CCXPCClient;
  id v19 = [(CCXPCClient *)&v35 init];
  p_isa = (id *)&v19->super.isa;
  if (v19)
  {
    v19->_failureCode = 0;
    v19->_interruptionCode = a7;
    objc_storeStrong((id *)&v19->_clientId, a6);
    objc_storeStrong(p_isa + 2, a9);
    v21 = p_isa + 3;
    objc_storeStrong(p_isa + 3, a5);
    id v22 = p_isa[3];
    if (!v22)
    {
      v29 = 0;
      goto LABEL_10;
    }
    [v22 setRemoteObjectInterface:v15];
    if (v16)
    {
      [p_isa[3] setExportedInterface:v16];
      id v23 = p_isa[3];
      v24 = [MEMORY[0x263F29EA0] weakProxyToObject:p_isa];
      [v23 setExportedObject:v24];
    }
    objc_initWeak(&location, p_isa);
    id v25 = p_isa[3];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __131__CCXPCClient_initWithRemoteObjectXPCInterface_exportedXPCInterface_connection_clientId_interruptionCode_invalidationCode_useCase___block_invoke;
    v32[3] = &unk_26527A650;
    objc_copyWeak(&v33, &location);
    [v25 setInterruptionHandler:v32];
    id v26 = p_isa[3];
    v27 = [p_isa _failureHandlerWithResponse:v9];
    [v26 setInvalidationHandler:v27];

    v28 = __biome_log_for_category();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[CCXPCClient initWithRemoteObjectXPCInterface:exportedXPCInterface:connection:clientId:interruptionCode:invalidationCode:useCase:]((uint64_t)v17, v28);
    }

    [*v21 activate];
    objc_msgSend(*v21, "setBm_exportedUseCase:", v18);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  v29 = p_isa;
LABEL_10:

  return v29;
}

- (id)_failureHandlerWithResponse:(unsigned __int16)a3
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__CCXPCClient__failureHandlerWithResponse___block_invoke;
  v6[3] = &unk_26527A678;
  objc_copyWeak(&v7, &location);
  unsigned __int16 v8 = a3;
  v4 = (void *)MEMORY[0x24C5B1320](v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  return v4;
}

- (void)dealloc
{
  [(CCXPCClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CCXPCClient;
  [(CCXPCClient *)&v3 dealloc];
}

- (void)invalidate
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  objc_super v3 = [a1 clientId];
  int v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "Invalidating XPC connection for client %@", (uint8_t *)&v4, 0xCu);
}

- (void)requestBiomeEndpointForAppScopedService:(unint64_t)a3 user:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v50[1] = *MEMORY[0x263EF8340];
  v28 = (void (**)(id, void, void *))a5;
  unsigned __int16 v8 = (void *)MEMORY[0x263F29E80];
  uint64_t v9 = [MEMORY[0x263F08D68] currentConnection];
  v29 = [v8 processWithXPCConnection:v9];

  uint64_t v10 = [v29 processType];
  v11 = (uint64_t *)MEMORY[0x263F08320];
  if (v10 != 5)
  {
    id v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v49 = *MEMORY[0x263F08320];
    v50[0] = @"Not authorized";
    id v26 = [NSDictionary dictionaryWithObjects:v50 forKeys:&v49 count:1];
    v27 = [v25 errorWithDomain:@"com.apple.CascadeSets.Donate" code:3 userInfo:v26];
    v28[2](v28, 0, v27);

    goto LABEL_15;
  }
  if (!a3 && [v29 uid] == v5) {
    uint64_t v5 = getuid();
  }
  uint64_t v44 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__3;
  v42 = __Block_byref_object_dispose__3;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  objc_super v35 = __Block_byref_object_copy__3;
  v36 = __Block_byref_object_dispose__3;
  id v37 = 0;
  uint64_t v12 = *MEMORY[0x263F29E18];
  uint64_t v13 = *v11;
  do
  {
    v14 = [MEMORY[0x263F29E50] connectionToAccessServerInDomain:a3 user:v5 useCase:self->_useCase];
    id v15 = [v14 connection];
    id v16 = v15;
    if (v15)
    {
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke;
      v31[3] = &unk_26527A6F0;
      v31[4] = &v32;
      id v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v31];
      id v18 = v17;
      if (v17)
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2;
        v30[3] = &unk_26527A718;
        v30[4] = &v38;
        v30[5] = &v32;
        [v17 requestBiomeEndpointForAppScopedService:a3 user:v5 reply:v30];
        goto LABEL_12;
      }
      id v22 = (void *)MEMORY[0x263F087E8];
      uint64_t v45 = v13;
      v46 = @"Failed to create remote object proxy";
      v21 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      uint64_t v23 = [v22 errorWithDomain:v12 code:7 userInfo:v21];
      v24 = (void *)v33[5];
      v33[5] = v23;
    }
    else
    {
      id v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v47 = v13;
      v48 = @"Failed to create connection";
      id v18 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v20 = [v19 errorWithDomain:v12 code:7 userInfo:v18];
      v21 = (void *)v33[5];
      v33[5] = v20;
    }

LABEL_12:
  }
  while ((BMShouldRetry() & 1) != 0);
  v28[2](v28, v39[5], (void *)v33[5]);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
LABEL_15:
}

- (void)serviceVersionRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, id))a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CCXPCClient_serviceVersionRespondingRequest_completion_usingBlock___block_invoke;
  v12[3] = &unk_26527A6C8;
  id v10 = v8;
  id v13 = v10;
  v11 = [(CCXPCClient *)self _remoteObjectProxy:v6 errorCompletion:v12];
  if (v11) {
    v9[2](v9, v11, v10);
  }
}

- (void)serviceRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v10 = a4;
  id v8 = (void (**)(id, void *, id))a5;
  uint64_t v9 = [(CCXPCClient *)self _remoteObjectProxy:v6 errorCompletion:v10];
  if (v9) {
    v8[2](v8, v9, v10);
  }
}

- (id)_remoteObjectProxy:(BOOL)a3 errorCompletion:(id)a4
{
  BOOL v4 = a3;
  BOOL v6 = (void (**)(id, void))a4;
  id v7 = [(CCXPCClient *)self _errorHandlerWithCompletion:v6];
  id v8 = [(CCXPCClient *)self connection];
  uint64_t v9 = v8;
  if (v4) {
    [v8 synchronousRemoteObjectProxyWithErrorHandler:v7];
  }
  else {
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v7];
  }

  if (v6 && !v10) {
    v6[2](v6, [(CCXPCClient *)self failureCode]);
  }

  return v10;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (id)_errorHandlerWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__CCXPCClient__errorHandlerWithCompletion___block_invoke;
  v8[3] = &unk_26527A6A0;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  BOOL v6 = (void *)MEMORY[0x24C5B1320](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_storeStrong((id *)&self->_useCase, 0);
}

void __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __43__CCXPCClient__failureHandlerWithResponse___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_super v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __43__CCXPCClient__failureHandlerWithResponse___block_invoke_cold_1(a1, WeakRetained, v3);
    }

    [WeakRetained setFailureCode:*(unsigned __int16 *)(a1 + 40)];
    [WeakRetained setConnection:0];
  }
}

- (CCXPCClient)init
{
  id v2 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF498] reason:@"init unsupported" userInfo:MEMORY[0x263EFFA78]];
  objc_exception_throw(v2);
}

void __131__CCXPCClient_initWithRemoteObjectXPCInterface_exportedXPCInterface_connection_clientId_interruptionCode_invalidationCode_useCase___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = [WeakRetained connection];
    id v4 = [WeakRetained clientId];
    int v5 = 138412546;
    id v6 = v3;
    __int16 v7 = 2112;
    id v8 = v4;
    _os_log_impl(&dword_249B92000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection %@ for client %@ interrupted", (uint8_t *)&v5, 0x16u);
  }
}

void __43__CCXPCClient__errorHandlerWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __43__CCXPCClient__errorHandlerWithCompletion___block_invoke_cold_1((uint64_t)v3, WeakRetained, v5);
    }

    uint64_t v6 = [WeakRetained interruptionCode];
    [WeakRetained setFailureCode:v6];
    [WeakRetained setConnection:0];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
  }
}

- (void)serviceOptionsRespondingRequest:(BOOL)a3 completion:(id)a4 usingBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *, id))a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __69__CCXPCClient_serviceOptionsRespondingRequest_completion_usingBlock___block_invoke;
  v12[3] = &unk_26527A6C8;
  id v10 = v8;
  id v13 = v10;
  id v11 = [(CCXPCClient *)self _remoteObjectProxy:v6 errorCompletion:v12];
  if (v11) {
    v9[2](v9, v11, v10);
  }
}

uint64_t __69__CCXPCClient_serviceOptionsRespondingRequest_completion_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t __69__CCXPCClient_serviceVersionRespondingRequest_completion_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

- (void)serviceArrayRespondingRequestWithCompletion:(id)a3 usingBlock:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, id))a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CCXPCClient_serviceArrayRespondingRequestWithCompletion_usingBlock___block_invoke;
  v10[3] = &unk_26527A6C8;
  id v8 = v6;
  id v11 = v8;
  uint64_t v9 = [(CCXPCClient *)self _remoteObjectProxy:1 errorCompletion:v10];
  if (v9) {
    v7[2](v7, v9, v8);
  }
}

uint64_t __70__CCXPCClient_serviceArrayRespondingRequestWithCompletion_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __66__CCXPCClient_requestBiomeEndpointForAppScopedService_user_reply___block_invoke(uint64_t a1, void *a2)
{
}

- (NSString)useCase
{
  return self->_useCase;
}

- (void)setConnection:(id)a3
{
}

- (unsigned)failureCode
{
  return self->_failureCode;
}

- (void)setFailureCode:(unsigned __int16)a3
{
  self->_failureCode = a3;
}

- (NSString)clientId
{
  return self->_clientId;
}

- (unsigned)interruptionCode
{
  return self->_interruptionCode;
}

- (void)initWithRemoteObjectXPCInterface:(uint64_t)a1 exportedXPCInterface:(NSObject *)a2 connection:clientId:interruptionCode:invalidationCode:useCase:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "Client %@ connecting to XPC service", (uint8_t *)&v2, 0xCu);
}

void __43__CCXPCClient__failureHandlerWithResponse___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = *(unsigned __int16 *)(a1 + 40);
  int v5 = [a2 clientId];
  v6[0] = 67109378;
  v6[1] = v4;
  __int16 v7 = 2112;
  id v8 = v5;
  _os_log_debug_impl(&dword_249B92000, a3, OS_LOG_TYPE_DEBUG, "XPC connection terminated (%u) for client %@", (uint8_t *)v6, 0x12u);
}

void __43__CCXPCClient__errorHandlerWithCompletion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v5 = [a2 clientId];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_249B92000, a3, OS_LOG_TYPE_ERROR, "XPC request hit error (%@) for client %@", (uint8_t *)&v6, 0x16u);
}

@end