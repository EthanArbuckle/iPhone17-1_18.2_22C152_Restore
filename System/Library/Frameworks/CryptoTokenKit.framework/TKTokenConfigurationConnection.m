@interface TKTokenConfigurationConnection
- (TKTokenConfigurationConnection)initWithEndpoint:(id)a3;
- (id)configurationProtocol;
- (void)dealloc;
- (void)registerForConfigurationChange:(id)a3;
- (void)tokenConfigurationChanged:(id)a3;
@end

@implementation TKTokenConfigurationConnection

- (TKTokenConfigurationConnection)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TKTokenConfigurationConnection;
  v6 = [(TKTokenConfigurationConnection *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    configurationConnections = v7->_configurationConnections;
    v7->_configurationConnections = (NSHashTable *)v8;
  }
  return v7;
}

- (id)configurationProtocol
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:self->_endpoint];
    id v5 = self->_connection;
    self->_connection = v4;

    v6 = +[TKTokenConfiguration interfaceForProtocol];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v6];

    v7 = +[TKTokenConfiguration interfaceForChangeProtocol];
    [(NSXPCConnection *)self->_connection setExportedInterface:v7];

    uint64_t v8 = [[TKTokenConfigurationConnectionProxy alloc] initWithConnection:self];
    [(NSXPCConnection *)self->_connection setExportedObject:v8];

    [(NSXPCConnection *)self->_connection resume];
    connection = self->_connection;
  }

  return [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_4];
}

void __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = TK_LOG_tokencfg();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)registerForConfigurationChange:(id)a3
{
  id v5 = a3;
  v4 = self->_configurationConnections;
  objc_sync_enter(v4);
  [(NSHashTable *)self->_configurationConnections addObject:v5];
  objc_sync_exit(v4);
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TKTokenConfigurationConnection;
  [(TKTokenConfigurationConnection *)&v3 dealloc];
}

- (void)tokenConfigurationChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_configurationConnections;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_configurationConnections;
  uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "tokenConfigurationChanged:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationConnections, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BED55000, a2, OS_LOG_TYPE_ERROR, "Failed to send configuration request: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end