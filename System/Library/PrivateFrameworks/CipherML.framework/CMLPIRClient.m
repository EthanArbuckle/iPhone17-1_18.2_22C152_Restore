@interface CMLPIRClient
+ (id)new;
- (CMLClientConfig)clientConfig;
- (CMLPIRClient)init;
- (CMLPIRClient)initWithClientConfig:(id)a3;
- (CMLPIRClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4;
- (CMLPIRClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4 connection:(id)a5;
- (CMLPIRConfig)pirConfig;
- (NSString)useCase;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)dispatchQueue;
- (id)generateEvaluationKey:(id *)a3;
- (id)setPIRConfig:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)setConnection:(id)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation CMLPIRClient

- (NSString)useCase
{
  v2 = [(CMLPIRClient *)self clientConfig];
  v3 = [v2 useCase];

  return (NSString *)v3;
}

- (CMLPIRClient)initWithClientConfig:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.CipherML.CMLPIRClient", 0);
  v6 = [(CMLPIRClient *)self initWithClientConfig:v4 dispatchQueue:v5];

  return v6;
}

- (CMLPIRClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CMLPIRClient *)self isMemberOfClass:objc_opt_class()]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"CMLPIRClient should not be instantiated, only its subclasses" format];
  }
  v8 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.ciphermld" options:0];
  if (v8)
  {
    self = [(CMLPIRClient *)self initWithClientConfig:v6 dispatchQueue:v7 connection:v8];
    v9 = self;
  }
  else
  {
    v10 = +[CMLLog client];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CMLSimilarityClient initWithClientConfig:dispatchQueue:](@"com.apple.ciphermld", v10);
    }

    v9 = 0;
  }

  return v9;
}

- (CMLPIRClient)initWithClientConfig:(id)a3 dispatchQueue:(id)a4 connection:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CMLPIRClient;
  v12 = [(CMLPIRClient *)&v15 init];
  if (v12)
  {
    v13 = +[CMLXPC interfaceDescription];
    [v11 setRemoteObjectInterface:v13];

    [v11 activate];
    objc_storeStrong((id *)&v12->_clientConfig, a3);
    objc_storeStrong((id *)&v12->_dispatchQueue, a4);
    objc_storeStrong((id *)&v12->_connection, a5);
  }

  return v12;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CMLPIRClient;
  [(CMLPIRClient *)&v3 dealloc];
}

- (id)setPIRConfig:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v30 = 0;
  id v9 = [(CMLPIRClient *)self connection];
  id v10 = +[CMLXPC syncProxyToConnection:v9 error:&v30];

  objc_storeStrong((id *)&self->_pirConfig, a3);
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2;
  v28 = __Block_byref_object_dispose__2;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  id v23 = 0;
  id v11 = +[CMLLog client];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    v32 = v12;
    _os_log_impl(&dword_249C3F000, v11, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  v13 = [(CMLPIRClient *)self clientConfig];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __35__CMLPIRClient_setPIRConfig_error___block_invoke;
  v17[3] = &unk_26527E370;
  v17[4] = &v18;
  v17[5] = &v24;
  v17[6] = a2;
  [v10 setPIRConfig:v8 clientConfig:v13 reply:v17];

  if (a4)
  {
    id v14 = v30;
    if (!v30) {
      id v14 = (id)v25[5];
    }
    *a4 = v14;
  }
  id v15 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __35__CMLPIRClient_setPIRConfig_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, success(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:200 underlyingError:v7 description:@"Unable to set PIR config due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)generateEvaluationKey:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v28 = 0;
  id v6 = [(CMLPIRClient *)self connection];
  id v7 = +[CMLXPC syncProxyToConnection:v6 error:&v28];

  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  uint64_t v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__2;
  uint64_t v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    id v30 = v9;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ Sending XPC request", buf, 0xCu);
  }
  uint64_t v10 = [(CMLPIRClient *)self pirConfig];
  uint64_t v11 = [(CMLPIRClient *)self clientConfig];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __38__CMLPIRClient_generateEvaluationKey___block_invoke;
  v15[3] = &unk_26527E370;
  v15[4] = &v16;
  v15[5] = &v22;
  v15[6] = a2;
  [v7 generateEvaluationKey:v10 clientConfig:v11 reply:v15];

  if (a3)
  {
    id v12 = v28;
    if (!v28) {
      id v12 = (id)v23[5];
    }
    *a3 = v12;
  }
  id v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __38__CMLPIRClient_generateEvaluationKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a3;
  id v8 = +[CMLLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v13 = 138412802;
    id v14 = v9;
    __int16 v15 = 1024;
    BOOL v16 = v6 != 0;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl(&dword_249C3F000, v8, OS_LOG_TYPE_DEFAULT, "%@ XPC request complete, success(%d) error:%{public}@", (uint8_t *)&v13, 0x1Cu);
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (v7)
  {
    uint64_t v10 = +[CMLError errorWithCode:1500 underlyingError:v7 description:@"Unable to set generateEvaluationKey due to errors"];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (CMLPIRClient)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (CMLClientConfig)clientConfig
{
  return self->_clientConfig;
}

- (CMLPIRConfig)pirConfig
{
  return self->_pirConfig;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_pirConfig, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
}

@end