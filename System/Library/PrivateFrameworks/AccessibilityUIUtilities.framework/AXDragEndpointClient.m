@interface AXDragEndpointClient
+ (BOOL)isValidServiceName:(id)a3;
- (AXDragEndpointClient)initWithServiceName:(id)a3;
- (void)dealloc;
- (void)getDragEndpoint:(id)a3;
@end

@implementation AXDragEndpointClient

+ (BOOL)isValidServiceName:(id)a3
{
  uint64_t v3 = isValidServiceName__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isValidServiceName__onceToken, &__block_literal_global);
  }
  char v5 = [(id)isValidServiceName__AllowedServiceNames containsObject:v4];

  return v5;
}

void __43__AXDragEndpointClient_isValidServiceName___block_invoke()
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F493C0];
  v6[0] = *MEMORY[0x1E4F493C8];
  v6[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F493B8];
  v6[2] = *MEMORY[0x1E4F493B0];
  v6[3] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  uint64_t v4 = [v0 setWithArray:v3];
  char v5 = (void *)isValidServiceName__AllowedServiceNames;
  isValidServiceName__AllowedServiceNames = v4;
}

- (AXDragEndpointClient)initWithServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AXDragEndpointClient;
  char v5 = [(AXDragEndpointClient *)&v10 init];
  if (v5 && [(id)objc_opt_class() isValidServiceName:v4])
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v4 options:0];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v6;

    v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1F59CC8];
    [(NSXPCConnection *)v5->_connection setRemoteObjectInterface:v8];

    [(NSXPCConnection *)v5->_connection resume];
  }

  return v5;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AXDragEndpointClient;
  [(AXDragEndpointClient *)&v3 dealloc];
}

- (void)getDragEndpoint:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __40__AXDragEndpointClient_getDragEndpoint___block_invoke;
  v11[3] = &unk_1E649BE10;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__AXDragEndpointClient_getDragEndpoint___block_invoke_316;
  v9[3] = &unk_1E649BE38;
  id v10 = v6;
  id v8 = v6;
  [v7 requestDragEndpoint:v9];
}

void __40__AXDragEndpointClient_getDragEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogDragging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __40__AXDragEndpointClient_getDragEndpoint___block_invoke_cold_1((uint64_t)v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __40__AXDragEndpointClient_getDragEndpoint___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __40__AXDragEndpointClient_getDragEndpoint___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C39D1000, a2, OS_LOG_TYPE_ERROR, "unable to get drag endpoint: %@", (uint8_t *)&v2, 0xCu);
}

@end