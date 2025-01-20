@interface CBSClient
+ (id)defaultClient;
- (CBSClient)init;
- (NSXPCConnection)connection;
- (id)remoteAlertServer;
- (id)systemServicesServer;
- (void)setConnection:(id)a3;
@end

@implementation CBSClient

+ (id)defaultClient
{
  if (defaultClient_onceToken != -1) {
    dispatch_once(&defaultClient_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)defaultClient_singleton;
  return v2;
}

uint64_t __26__CBSClient_defaultClient__block_invoke()
{
  defaultClient_singleton = objc_alloc_init(CBSClient);
  return MEMORY[0x270F9A758]();
}

- (CBSClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)CBSClient;
  v2 = [(CBSClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.CheckerBoard.services" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    v5 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26F248600];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_92];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_95];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

void __17__CBSClient_init__block_invoke()
{
  v0 = CheckerBoardLogHandleForCategory(5);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __17__CBSClient_init__block_invoke_cold_1(v0);
  }
}

void __17__CBSClient_init__block_invoke_93()
{
  v0 = CheckerBoardLogHandleForCategory(5);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __17__CBSClient_init__block_invoke_93_cold_1(v0);
  }
}

- (id)remoteAlertServer
{
  v2 = [(CBSClient *)self connection];
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_98];

  return v3;
}

void __30__CBSClient_remoteAlertServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CheckerBoardLogHandleForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CBSClient_remoteAlertServer__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (id)systemServicesServer
{
  id v2 = [(CBSClient *)self connection];
  uint64_t v3 = [v2 remoteObjectProxyWithErrorHandler:&__block_literal_global_100];

  return v3;
}

void __33__CBSClient_systemServicesServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = CheckerBoardLogHandleForCategory(5);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __30__CBSClient_remoteAlertServer__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __17__CBSClient_init__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23EA9B000, log, OS_LOG_TYPE_ERROR, "XPC INTERRUPTION ERROR", v1, 2u);
}

void __17__CBSClient_init__block_invoke_93_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23EA9B000, log, OS_LOG_TYPE_ERROR, "XPC INVALIDATION ERROR", v1, 2u);
}

void __30__CBSClient_remoteAlertServer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_23EA9B000, a2, OS_LOG_TYPE_ERROR, "XPC CONNECTION ERROR: %@", (uint8_t *)&v2, 0xCu);
}

@end