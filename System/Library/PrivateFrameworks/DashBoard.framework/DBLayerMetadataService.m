@interface DBLayerMetadataService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (DBLayerMetadataService)init;
- (DBLayerMetadataServiceDelegate)delegate;
- (NSXPCConnection)connection;
- (NSXPCListener)layerMetadataServiceListener;
- (void)invalidate;
- (void)sendLayerProperties:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLayerMetadataServiceListener:(id)a3;
@end

@implementation DBLayerMetadataService

- (DBLayerMetadataService)init
{
  v5.receiver = self;
  v5.super_class = (Class)DBLayerMetadataService;
  v2 = [(DBLayerMetadataService *)&v5 init];
  if (v2)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.carkit.layer-metadata"];
    [v3 setDelegate:v2];
    [v3 resume];
    [(DBLayerMetadataService *)v2 setLayerMetadataServiceListener:v3];
  }
  return v2;
}

- (void)sendLayerProperties:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(DBLayerMetadataService *)self delegate];

  if (v5)
  {
    v6 = [(DBLayerMetadataService *)self delegate];
    [v6 service:self didReceiveLayerMetadata:v4];
  }
  else
  {
    v7 = DBLogForCategory(0x12uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[DBLayerMetadataService sendLayerProperties:](v7);
    }
  }
}

- (void)invalidate
{
  v3 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating layer metadata service", v6, 2u);
  }

  id v4 = [(DBLayerMetadataService *)self connection];
  [v4 invalidate];

  [(DBLayerMetadataService *)self setConnection:0];
  objc_super v5 = [(DBLayerMetadataService *)self layerMetadataServiceListener];
  [v5 invalidate];

  [(DBLayerMetadataService *)self setLayerMetadataServiceListener:0];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v7;
    _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Incoming connection to layer metadata service: %@", buf, 0xCu);
  }

  v9 = [v7 valueForEntitlement:@"com.apple.carkit.layer-metadata"];
  char v10 = [v9 BOOLValue];

  if (v10)
  {
    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26E1E18F0];
    [v7 setExportedInterface:v11];
    [v7 setExportedObject:self];
    objc_initWeak(&location, v7);
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke;
    v17[3] = &unk_2649B4738;
    objc_copyWeak(&v18, &location);
    [v7 setInterruptionHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke_47;
    v15[3] = &unk_2649B4738;
    objc_copyWeak(&v16, &location);
    [v7 setInvalidationHandler:v15];
    v12 = DBLogForCategory(0x12uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Resuming layer metadata connection from %@", buf, 0xCu);
    }
    [v7 resume];
    [(DBLayerMetadataService *)self setConnection:v7];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  else
  {
    v11 = DBLogForCategory(0x12uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[DBLayerMetadataService listener:shouldAcceptNewConnection:]((uint64_t)v7, v11);
    }
  }

  return v10;
}

void __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  v2 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke_cold_1(a1);
  }
}

void __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke_47(uint64_t a1)
{
  v2 = DBLogForCategory(0x12uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke_47_cold_1(a1);
  }
}

- (DBLayerMetadataServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DBLayerMetadataServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCListener)layerMetadataServiceListener
{
  return self->_layerMetadataServiceListener;
}

- (void)setLayerMetadataServiceListener:(id)a3
{
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
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_layerMetadataServiceListener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)sendLayerProperties:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22D6F0000, log, OS_LOG_TYPE_DEBUG, "No delegate to receive metadata", v1, 2u);
}

- (void)listener:(uint64_t)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22D6F0000, a2, OS_LOG_TYPE_ERROR, "Connection not entitled: %@", (uint8_t *)&v2, 0xCu);
}

void __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Connection interrupted: %@", v4, v5, v6, v7, 2u);
}

void __61__DBLayerMetadataService_listener_shouldAcceptNewConnection___block_invoke_47_cold_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  OUTLINED_FUNCTION_0(&dword_22D6F0000, v2, v3, "Connection invalidated: %@", v4, v5, v6, v7, 2u);
}

@end