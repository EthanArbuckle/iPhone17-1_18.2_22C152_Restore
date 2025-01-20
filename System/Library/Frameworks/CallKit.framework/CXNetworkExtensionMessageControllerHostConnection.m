@interface CXNetworkExtensionMessageControllerHostConnection
- (CXNetworkExtensionMessageControllerHostConnection)initWithConnection:(id)a3;
- (CXNetworkExtensionMessageControllerHostConnectionDelegate)delegate;
- (NSSet)capabilities;
- (NSString)applicationIdentifier;
- (NSString)description;
- (NSXPCConnection)connection;
- (os_unfair_lock_s)accessorLock;
- (void)dealloc;
- (void)invalidate;
- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation CXNetworkExtensionMessageControllerHostConnection

- (CXNetworkExtensionMessageControllerHostConnection)initWithConnection:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CXNetworkExtensionMessageControllerHostConnection;
  v6 = [(CXNetworkExtensionMessageControllerHostConnection *)&v20 init];
  v7 = v6;
  if (v6)
  {
    v6->_accessorLock._os_unfair_lock_opaque = 0;
    uint64_t v8 = objc_msgSend(v5, "cx_applicationIdentifier");
    applicationIdentifier = v7->_applicationIdentifier;
    v7->_applicationIdentifier = (NSString *)v8;

    uint64_t v10 = objc_msgSend(v5, "cx_capabilities");
    capabilities = v7->_capabilities;
    v7->_capabilities = (NSSet *)v10;

    objc_storeStrong((id *)&v7->_connection, a3);
    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    v12 = objc_msgSend(MEMORY[0x1E4F29280], "cx_networkExtensionMessageControllerHostInterface");
    [(NSXPCConnection *)v7->_connection setExportedInterface:v12];

    objc_initWeak(&location, v7);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke;
    v17[3] = &unk_1E5CADED0;
    objc_copyWeak(&v18, &location);
    [(NSXPCConnection *)v7->_connection setInterruptionHandler:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke_2;
    v15[3] = &unk_1E5CADED0;
    objc_copyWeak(&v16, &location);
    [(NSXPCConnection *)v7->_connection setInvalidationHandler:v15];
    [(NSXPCConnection *)v7->_connection resume];
    v13 = CXDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v7;
      _os_log_impl(&dword_1A6E3A000, v13, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke(uint64_t a1)
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
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection interrupted for network extension message controller host %@", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained invalidate];
  }
}

void __72__CXNetworkExtensionMessageControllerHostConnection_initWithConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = CXDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = WeakRetained;
      _os_log_impl(&dword_1A6E3A000, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated for network extension message controller host %@", (uint8_t *)&v4, 0xCu);
    }

    int v3 = [WeakRetained delegate];
    [v3 networkExtensionMessageControllerHostConnectionInvalidated:WeakRetained];
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CXNetworkExtensionMessageControllerHostConnection;
  [(CXNetworkExtensionMessageControllerHostConnection *)&v3 dealloc];
}

- (CXNetworkExtensionMessageControllerHostConnectionDelegate)delegate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_accessorLock);

  return (CXNetworkExtensionMessageControllerHostConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained != obj) {
    objc_storeWeak((id *)p_delegate, obj);
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)invalidate
{
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  int v4 = [(CXNetworkExtensionMessageControllerHostConnection *)self connection];
  [v4 invalidate];

  os_unfair_lock_unlock(p_accessorLock);
}

- (void)sendNetworkExtensionMessage:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void *))a5;
  v11 = [(CXNetworkExtensionMessageControllerHostConnection *)self capabilities];
  uint64_t v12 = [v11 containsObject:@"private-network-extension-message-api"];

  if (v12)
  {
    v13 = [(CXNetworkExtensionMessageControllerHostConnection *)self delegate];
    [v13 networkExtensionMessageControllerHostConnection:self didReceiveIncomingMessage:v8 forBundleIdentifier:v9];

    v14 = 0;
  }
  else
  {
    v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CXNetworkExtensionMessageControllerHostConnection sendNetworkExtensionMessage:forBundleIdentifier:reply:]((uint64_t)self, v15);
    }

    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_requestTransactionErrorWithCode:", 1);
  }
  v10[2](v10, v12, v14);
}

- (void)sendNetworkExtensionPushToTalkMessage:(id)a3 forBundleIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, uint64_t, void *))a5;
  v11 = [(CXNetworkExtensionMessageControllerHostConnection *)self capabilities];
  uint64_t v12 = [v11 containsObject:@"private-network-extension-message-api"];

  if (v12)
  {
    v13 = [(CXNetworkExtensionMessageControllerHostConnection *)self delegate];
    [v13 networkExtensionMessageControllerHostConnection:self didReceiveIncomingPushToTalkMessage:v8 forBundleIdentifier:v9];

    v14 = 0;
  }
  else
  {
    v15 = CXDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CXNetworkExtensionMessageControllerHostConnection sendNetworkExtensionMessage:forBundleIdentifier:reply:]((uint64_t)self, v15);
    }

    v14 = objc_msgSend(MEMORY[0x1E4F28C58], "cx_requestTransactionErrorWithCode:", 1);
  }
  v10[2](v10, v12, v14);
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CXNetworkExtensionMessageControllerHostConnection *)self applicationIdentifier];
  uint64_t v6 = [(CXNetworkExtensionMessageControllerHostConnection *)self capabilities];
  v7 = [v3 stringWithFormat:@"<%@ %p applicationIdentifier=%@ capabilities=%@", v4, self, v5, v6];

  return (NSString *)v7;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (NSSet)capabilities
{
  return self->_capabilities;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendNetworkExtensionMessage:(uint64_t)a1 forBundleIdentifier:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6E3A000, a2, OS_LOG_TYPE_ERROR, "Connection is not entitled to use private API: %@", (uint8_t *)&v2, 0xCu);
}

@end