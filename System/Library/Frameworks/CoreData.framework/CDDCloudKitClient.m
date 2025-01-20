@interface CDDCloudKitClient
- (BOOL)_valid;
- (CDDCloudKitClient)initWithMachServiceName:(id)a3;
- (void)dealloc;
- (void)handleMessage:(id)a3 reply:(id)a4;
@end

@implementation CDDCloudKitClient

- (CDDCloudKitClient)initWithMachServiceName:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CDDCloudKitClient;
  v4 = [(CDDCloudKitClient *)&v14 init];
  if (v4)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:a3 options:0];
    v4->_connection = v5;
    -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED7FA9F0]);
    objc_initWeak(&location, v4);
    connection = v4->_connection;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __45__CDDCloudKitClient_initWithMachServiceName___block_invoke;
    v11[3] = &unk_1E544C3A0;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)connection setInvalidationHandler:v11];
    v7 = v4->_connection;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __45__CDDCloudKitClient_initWithMachServiceName___block_invoke_2;
    v9[3] = &unk_1E544C3A0;
    objc_copyWeak(&v10, &location);
    [(NSXPCConnection *)v7 setInterruptionHandler:v9];
    [(NSXPCConnection *)v4->_connection resume];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __45__CDDCloudKitClient_initWithMachServiceName___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[9] = 1;
  }
}

void __45__CDDCloudKitClient_initWithMachServiceName___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[8] = 1;
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection invalidate];

  v3.receiver = self;
  v3.super_class = (Class)CDDCloudKitClient;
  [(CDDCloudKitClient *)&v3 dealloc];
}

- (BOOL)_valid
{
  return !self->_interrupted && !self->_invalidated;
}

- (void)handleMessage:(id)a3 reply:(id)a4
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3052000000;
  objc_super v14 = __Block_byref_object_copy__27;
  v15 = __Block_byref_object_dispose__27;
  uint64_t v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__CDDCloudKitClient_handleMessage_reply___block_invoke;
  v10[3] = &unk_1E544BDF0;
  v10[4] = &v11;
  id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  if (!v7 || ([v7 handleMessage:a3 reply:a4], v12[5]))
  {
    v8 = [CDDCloudKitResponse alloc];
    v9 = -[CDDCloudKitResponse initWithMessage:success:error:](v8, a3, 0, (void *)v12[5]);
    (*((void (**)(id, void *))a4 + 2))(a4, v9);
  }
  v12[5] = 0;
  _Block_object_dispose(&v11, 8);
}

id __41__CDDCloudKitClient_handleMessage_reply___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

@end