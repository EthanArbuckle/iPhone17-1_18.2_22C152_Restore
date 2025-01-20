@interface BMComputeSourceServer
- (BMComputeSource)source;
- (BMComputeSourceServer)initWithQueue:(id)a3 machServiceName:(id)a4 source:(id)a5;
- (BMComputeSourceServer)initWithQueue:(id)a3 source:(id)a4 listener:(id)a5;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMapTable)connections;
- (NSString)description;
- (NSXPCInterface)interface;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (void)activate;
@end

@implementation BMComputeSourceServer

void __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke_137(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained _xpcConnection];

    if (v5)
    {
      v6 = [v4 _xpcConnection];
      v7 = (void *)xpc_connection_copy_invalidation_reason();

      if (v7)
      {
        v5 = [NSString stringWithUTF8String:v7];
      }
      else
      {
        v5 = @"<unknown>";
      }
      free(v7);
    }
  }
  else
  {
    v5 = 0;
  }
  v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412546;
    v12 = v4;
    __int16 v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_18E67D000, v8, OS_LOG_TYPE_INFO, "BMComputeSourceServer connection %@ invalidated because %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v9 = *(void **)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  [v9 removeObjectForKey:v10];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(BMComputeSourceServer *)self queue];
  dispatch_assert_queue_V2(v8);

  v9 = [MEMORY[0x1E4F4FB80] processWithXPCConnection:v7];
  id v10 = __biome_log_for_category();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = [v9 executableName];
    *(_DWORD *)buf = 138412546;
    v27 = v11;
    __int16 v28 = 1024;
    int v29 = [v9 pid];
    _os_log_impl(&dword_18E67D000, v10, OS_LOG_TYPE_INFO, "BMComputeSourceServer received new connection request from %@(%d)", buf, 0x12u);
  }
  v12 = [MEMORY[0x1E4F4FB38] policyForProcess:v9 connectionFlags:0 useCase:*MEMORY[0x1E4F4FB08]];
  char v13 = [v12 allowsConnectionToComputeSourceService];
  v14 = __biome_log_for_category();
  uint64_t v15 = (BMComputeSourceServerConnection *)v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BMComputeSourceServer listener:shouldAcceptNewConnection:](v9, &v15->super);
    }

    uint64_t v15 = [[BMComputeSourceServerConnection alloc] initWithServer:self clientProcess:v9];
    v16 = [(BMComputeSourceServer *)self connections];
    [v16 setObject:v15 forKey:v7];
    v17 = [(BMComputeSourceServer *)self queue];
    [v7 _setQueue:v17];

    objc_initWeak((id *)buf, v7);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke;
    v24[3] = &unk_1E55D74A0;
    objc_copyWeak(&v25, (id *)buf);
    [v7 setInterruptionHandler:v24];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke_137;
    v21[3] = &unk_1E55D8660;
    objc_copyWeak(&v23, (id *)buf);
    id v18 = v16;
    id v22 = v18;
    [v7 setInvalidationHandler:v21];
    v19 = [(BMComputeSourceServer *)self interface];
    [v7 setExportedInterface:v19];

    [v7 setExportedObject:v15];
    [v7 resume];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[BMComputeSourceServer listener:shouldAcceptNewConnection:](v9, &v15->super);
  }

  return v13;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BMComputeSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (BMComputeSource *)WeakRetained;
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (NSMapTable)connections
{
  return self->_connections;
}

- (BMComputeSourceServer)initWithQueue:(id)a3 machServiceName:(id)a4 source:(id)a5
{
  v8 = (objc_class *)MEMORY[0x1E4F29290];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithMachServiceName:v10];

  char v13 = [(BMComputeSourceServer *)self initWithQueue:v11 source:v9 listener:v12];
  return v13;
}

- (BMComputeSourceServer)initWithQueue:(id)a3 source:(id)a4 listener:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  dispatch_assert_queue_V2(v9);
  v17.receiver = self;
  v17.super_class = (Class)BMComputeSourceServer;
  v12 = [(BMComputeSourceServer *)&v17 init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_queue, a3);
    objc_storeWeak((id *)&v13->_source, v10);
    uint64_t v14 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    connections = v13->_connections;
    v13->_connections = (NSMapTable *)v14;

    objc_storeStrong((id *)&v13->_interface, (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDDF26A0]);
    objc_storeStrong((id *)&v13->_listener, a5);
    [(NSXPCListener *)v13->_listener _setQueue:v9];
    [(NSXPCListener *)v13->_listener setDelegate:v13];
  }

  return v13;
}

- (void)activate
{
  v3 = [(BMComputeSourceServer *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(BMComputeSourceServer *)self listener];
  [v4 resume];
}

void __60__BMComputeSourceServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = __biome_log_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl(&dword_18E67D000, v2, OS_LOG_TYPE_DEFAULT, "BMComputeSourceServer connection %@ interrupted", (uint8_t *)&v4, 0xCu);
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  id v5 = (void *)[v3 initWithFormat:@"<source: %@ listener: %@ queue: %@ connectionCount: %lu>", WeakRetained, self->_listener, self->_queue, -[NSMapTable count](self->_connections, "count")];

  return (NSString *)v5;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_4_1();
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "BMComputeSourceServer accepting connection from %{public}@(%d)", v5, 0x12u);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_18E67D000, a2, OS_LOG_TYPE_ERROR, "BMComputeSourceServer refusing connection from %{public}@(%d), process lacks write entitlements", v5, 0x12u);
}

@end