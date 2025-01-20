@interface CXNetworkExtensionMessageControllerXPCClient
- (CXNetworkExtensionMessageControllerXPCClient)init;
- (NSXPCConnection)connection;
- (os_unfair_lock_s)accessorLock;
- (void)dealloc;
- (void)invalidate;
- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5;
- (void)setConnection:(id)a3;
@end

@implementation CXNetworkExtensionMessageControllerXPCClient

- (CXNetworkExtensionMessageControllerXPCClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)CXNetworkExtensionMessageControllerXPCClient;
  result = [(CXNetworkExtensionMessageControllerXPCClient *)&v3 init];
  if (result) {
    result->_accessorLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXNetworkExtensionMessageControllerXPCClient;
  [(CXNetworkExtensionMessageControllerXPCClient *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  connection = self->_connection;
  if (!connection)
  {
    v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.callkit.networkextension.messagecontrollerhost" options:0];
    v6 = self->_connection;
    self->_connection = v5;

    v7 = objc_msgSend(MEMORY[0x1E4F29280], "cx_networkExtensionMessageControllerHostInterface");
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke;
    v12[3] = &unk_1E5CADED0;
    objc_copyWeak(&v13, &location);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v12];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke_4;
    v10[3] = &unk_1E5CADED0;
    objc_copyWeak(&v11, &location);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v10];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  v8 = connection;
  os_unfair_lock_unlock(p_accessorLock);

  return v8;
}

void __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for network extension message client %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained invalidate];
    [WeakRetained setConnection:0];
  }
}

void __58__CXNetworkExtensionMessageControllerXPCClient_connection__block_invoke_4(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for network extension message client %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained setConnection:0];
  }
}

- (void)setConnection:(id)a3
{
  v8 = (NSXPCConnection *)a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  connection = self->_connection;
  p_connection = &self->_connection;
  if (connection != v8) {
    objc_storeStrong((id *)p_connection, a3);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)invalidate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  [(NSXPCConnection *)self->_connection invalidate];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXNetworkExtensionMessageControllerXPCClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke;
  v17[3] = &unk_1E5CAE2B0;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_6;
  v15[3] = &unk_1E5CAE788;
  id v16 = v12;
  id v14 = v12;
  [v13 sendNetworkExtensionMessage:v10 forBundleIdentifier:v9 reply:v15];
}

void __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CXNetworkExtensionMessageControllerXPCClient *)self connection];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke;
  v17[3] = &unk_1E5CAE2B0;
  id v12 = v8;
  id v18 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_8;
  v15[3] = &unk_1E5CAE788;
  id v16 = v12;
  id v14 = v12;
  [v13 sendNetworkExtensionPushToTalkMessage:v10 forBundleIdentifier:v9 reply:v15];
}

void __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

uint64_t __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (void).cxx_destruct
{
}

void __107__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionMessage_forBundleIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Could not send VoIP network extension message due to connection error %@", (uint8_t *)&v2, 0xCu);
}

void __117__CXNetworkExtensionMessageControllerXPCClient_sendNetworkExtensionPushToTalkMessage_forBundleIdentifier_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Could not send PushToTalk network extension message due to connection error %@", (uint8_t *)&v2, 0xCu);
}

@end