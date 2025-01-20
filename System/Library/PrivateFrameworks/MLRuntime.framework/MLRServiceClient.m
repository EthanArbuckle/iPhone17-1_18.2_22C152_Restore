@interface MLRServiceClient
+ (id)sharedConnection;
- (MLRServiceClient)initWithConnection:(id)a3;
- (void)dealloc;
- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4;
- (void)performOnRemoteObjecWithBlock:(id)a3 isSynchronous:(BOOL)a4 errorHandler:(id)a5;
- (void)performSynchronouslyOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4;
@end

@implementation MLRServiceClient

- (MLRServiceClient)initWithConnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v12 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"connection must not be nil" userInfo:0];
    objc_exception_throw(v12);
  }
  v6 = v5;
  v13.receiver = self;
  v13.super_class = (Class)MLRServiceClient;
  v7 = [(MLRServiceClient *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_connection, a3);
    connection = v8->_connection;
    v10 = DESServiceGetXPCInterface();
    [(NSXPCConnection *)connection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v8->_connection resume];
  }

  return v8;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;

  v4.receiver = self;
  v4.super_class = (Class)MLRServiceClient;
  [(MLRServiceClient *)&v4 dealloc];
}

+ (id)sharedConnection
{
  if (sharedConnection_onceToken != -1) {
    dispatch_once(&sharedConnection_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedConnection_client;

  return v2;
}

void __36__MLRServiceClient_sharedConnection__block_invoke()
{
  v0 = [MLRServiceClient alloc];
  id v1 = objc_alloc(MEMORY[0x263F08D68]);
  id v4 = (id)[v1 initWithMachServiceName:*MEMORY[0x263F3A420] options:4096];
  uint64_t v2 = [(MLRServiceClient *)v0 initWithConnection:v4];
  v3 = (void *)sharedConnection_client;
  sharedConnection_client = v2;
}

- (void)performOnRemoteObjecWithBlock:(id)a3 isSynchronous:(BOOL)a4 errorHandler:(id)a5
{
  BOOL v6 = a4;
  v24[1] = *MEMORY[0x263EF8340];
  v8 = (void (**)(id, void *))a3;
  id v9 = a5;
  v10 = (void (**)(void, void))v9;
  connection = self->_connection;
  if (v6)
  {
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke;
    v21[3] = &unk_2643F1E60;
    id v12 = &v22;
    id v22 = v9;
    uint64_t v13 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v21];
  }
  else
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke_2;
    v19[3] = &unk_2643F1E60;
    id v12 = &v20;
    id v20 = v9;
    uint64_t v13 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v19];
  }
  v14 = (void *)v13;

  if (v14)
  {
    if (v8) {
      v8[2](v8, v14);
    }
  }
  else if (v10)
  {
    v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F3A4A0];
    uint64_t v23 = *MEMORY[0x263F08320];
    v24[0] = @"Fail to create remote object proxy.";
    v17 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
    v18 = [v15 errorWithDomain:v16 code:1300 userInfo:v17];
    ((void (**)(void, void *))v10)[2](v10, v18);
  }
}

uint64_t __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __77__MLRServiceClient_performOnRemoteObjecWithBlock_isSynchronous_errorHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)performOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4
{
}

- (void)performSynchronouslyOnRemoteObjecWithBlock:(id)a3 errorHandler:(id)a4
{
}

- (void)donateJSONResult:(id)a3 identifier:(id)a4 completion:(id)a5
{
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *))a5;
  if (!v8)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F3A4A0];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27[0] = @"JSONResult must be not be nil.";
    v14 = NSDictionary;
    v15 = (__CFString **)v27;
    uint64_t v16 = &v26;
LABEL_6:
    v11 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
    v17 = [v12 errorWithDomain:v13 code:1400 userInfo:v11];
    v10[2](v10, v17);

    goto LABEL_7;
  }
  if (!v9)
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F3A4A0];
    uint64_t v24 = *MEMORY[0x263F08320];
    v25 = @"identifier must be not be nil.";
    v14 = NSDictionary;
    v15 = &v25;
    uint64_t v16 = &v24;
    goto LABEL_6;
  }
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke;
  v20[3] = &unk_2643F1E88;
  id v21 = v8;
  id v22 = v9;
  uint64_t v23 = v10;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_3;
  v18[3] = &unk_2643F1E60;
  v19 = v23;
  [(MLRServiceClient *)self performOnRemoteObjecWithBlock:v20 errorHandler:v18];

  v11 = v21;
LABEL_7:
}

void __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_2;
  v5[3] = &unk_2643F1E60;
  id v6 = *(id *)(a1 + 48);
  [a2 donateJSONResult:v3 identifier:v4 completion:v5];
}

uint64_t __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__MLRServiceClient_donateJSONResult_identifier_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

@end