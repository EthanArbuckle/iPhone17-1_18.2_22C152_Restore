@interface ANTonePlayerService
- (ANTonePlayerService)init;
- (NSXPCConnection)connection;
- (void)dealloc;
- (void)invalidate;
- (void)playTone:(unint64_t)a3 audioSessionID:(unsigned int)a4 endpointUUID:(id)a5 completionHandler:(id)a6;
@end

@implementation ANTonePlayerService

- (ANTonePlayerService)init
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)ANTonePlayerService;
  v2 = [(ANTonePlayerService *)&v8 init];
  if (v2)
  {
    v3 = ANLogHandleTonePlayerService();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v10 = &stru_26D2D46B0;
      __int16 v11 = 2112;
      v12 = @"com.apple.announced.toneplayer";
      _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to Service: %@", buf, 0x16u);
    }

    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.announced.toneplayer" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2E3668];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_11];
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&__block_literal_global_49];
    [(NSXPCConnection *)v2->_connection resume];
  }
  return v2;
}

void __27__ANTonePlayerService_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = ANLogHandleTonePlayerService();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    v2 = &stru_26D2D46B0;
    _os_log_impl(&dword_220FAA000, v0, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was interrupted", (uint8_t *)&v1, 0xCu);
  }
}

void __27__ANTonePlayerService_init__block_invoke_47()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = ANLogHandleTonePlayerService();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 138412290;
    v2 = &stru_26D2D46B0;
    _os_log_impl(&dword_220FAA000, v0, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was invalidated", (uint8_t *)&v1, 0xCu);
  }
}

- (void)dealloc
{
  [(ANTonePlayerService *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ANTonePlayerService;
  [(ANTonePlayerService *)&v3 dealloc];
}

- (void)invalidate
{
  id v2 = [(ANTonePlayerService *)self connection];
  [v2 invalidate];
}

- (void)playTone:(unint64_t)a3 audioSessionID:(unsigned int)a4 endpointUUID:(id)a5 completionHandler:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  v12 = [(ANTonePlayerService *)self connection];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke;
  v18[3] = &unk_264587078;
  id v13 = v10;
  id v19 = v13;
  v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke_53;
  v16[3] = &unk_264587078;
  id v17 = v13;
  id v15 = v13;
  [v14 playTone:a3 audioSessionID:v7 endpointUUID:v11 completionHandler:v16];
}

void __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = ANLogHandleTonePlayerService();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412802;
    uint64_t v7 = &stru_26D2D46B0;
    __int16 v8 = 2080;
    v9 = "-[ANTonePlayerService playTone:audioSessionID:endpointUUID:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __78__ANTonePlayerService_playTone_audioSessionID_endpointUUID_completionHandler___block_invoke_53(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = ANLogHandleTonePlayerService();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412802;
      uint64_t v7 = &stru_26D2D46B0;
      __int16 v8 = 2080;
      v9 = "-[ANTonePlayerService playTone:audioSessionID:endpointUUID:completionHandler:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end