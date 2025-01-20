@interface CRCarKitServiceClient
+ (id)serviceQueue;
- (CRCarKitServiceClient)init;
- (NSXPCConnection)connection;
- (void)_serviceQueuePerformBlock:(id)a3 errorHandler:(id)a4;
- (void)_setupConnection;
- (void)dealloc;
- (void)performServiceBlock:(id)a3 errorHandler:(id)a4;
- (void)performSynchronousServiceBlock:(id)a3 errorHandler:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation CRCarKitServiceClient

- (void)performServiceBlock:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() serviceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CRCarKitServiceClient_performServiceBlock_errorHandler___block_invoke;
  block[3] = &unk_1E5E3A980;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)_setupConnection
{
  v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F0327240];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_fetchAllVehiclesWithReply_ argumentIndex:0 ofReply:1];

  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.carkit.service" options:4096];
  [v7 setRemoteObjectInterface:v3];
  v8 = CarGeneralLogging();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v8, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", buf, 2u);
  }

  [v7 resume];
  [(CRCarKitServiceClient *)self setConnection:v7];
}

- (void)setConnection:(id)a3
{
}

+ (id)serviceQueue
{
  if (serviceQueue_onceToken != -1) {
    dispatch_once(&serviceQueue_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)serviceQueue___queue;
  return v2;
}

void __37__CRCarKitServiceClient_serviceQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.carkit.serviceClient", v2);
  v1 = (void *)serviceQueue___queue;
  serviceQueue___queue = (uint64_t)v0;
}

- (CRCarKitServiceClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRCarKitServiceClient;
  v2 = [(CRCarKitServiceClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CRCarKitServiceClient *)v2 _setupConnection];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [(CRCarKitServiceClient *)self connection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CRCarKitServiceClient;
  [(CRCarKitServiceClient *)&v4 dealloc];
}

- (void)performSynchronousServiceBlock:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(id)objc_opt_class() serviceQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__CRCarKitServiceClient_performSynchronousServiceBlock_errorHandler___block_invoke;
  block[3] = &unk_1E5E3A980;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

uint64_t __69__CRCarKitServiceClient_performSynchronousServiceBlock_errorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceQueuePerformBlock:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48)];
}

- (void)_serviceQueuePerformBlock:(id)a3 errorHandler:(id)a4
{
  id v6 = (void (**)(id, void *))a3;
  id v7 = a4;
  v8 = [(CRCarKitServiceClient *)self connection];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke;
  v13[3] = &unk_1E5E3A910;
  id v14 = v7;
  id v9 = v7;
  id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];

  if (v6)
  {
    v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1ABB00000, v11, OS_LOG_TYPE_DEFAULT, "Connecting to CarKit service.", v12, 2u);
    }

    v6[2](v6, v10);
  }
}

void __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = CarGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __58__CRCarKitServiceClient_performServiceBlock_errorHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serviceQueuePerformBlock:*(void *)(a1 + 40) errorHandler:*(void *)(a1 + 48)];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

void __64__CRCarKitServiceClient__serviceQueuePerformBlock_errorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "CarKit Service Error: %@", (uint8_t *)&v2, 0xCu);
}

@end