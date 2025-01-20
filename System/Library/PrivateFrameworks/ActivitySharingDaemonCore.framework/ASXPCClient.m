@interface ASXPCClient
- (ASXPCClient)init;
- (void)dealloc;
- (void)invalidate;
- (void)launch;
@end

@implementation ASXPCClient

- (ASXPCClient)init
{
  v14.receiver = self;
  v14.super_class = (Class)ASXPCClient;
  v2 = [(ASXPCClient *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F08D68]);
    uint64_t v4 = [v3 initWithMachServiceName:*MEMORY[0x263F23DF8] options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FBC4F20];
    [(NSXPCConnection *)v2->_connection setRemoteObjectInterface:v6];

    [(NSXPCConnection *)v2->_connection setExportedObject:v2];
    [(NSXPCConnection *)v2->_connection setInterruptionHandler:&__block_literal_global_9];
    objc_initWeak(&location, v2);
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __19__ASXPCClient_init__block_invoke_325;
    v11 = &unk_265216A20;
    objc_copyWeak(&v12, &location);
    [(NSXPCConnection *)v2->_connection setInvalidationHandler:&v8];
    [(NSXPCConnection *)v2->_connection resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __19__ASXPCClient_init__block_invoke()
{
  ASLoggingInitialize();
  v0 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2474C9000, v0, OS_LOG_TYPE_DEFAULT, "ASXPCClient connection interrupted", v1, 2u);
  }
}

void __19__ASXPCClient_init__block_invoke_325(uint64_t a1)
{
  ASLoggingInitialize();
  v2 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "ASXPCClient connection invalidated", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

- (void)dealloc
{
  [(ASXPCClient *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ASXPCClient;
  [(ASXPCClient *)&v3 dealloc];
}

- (void)launch
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  [v2 launch];
  ASLoggingInitialize();
  objc_super v3 = *MEMORY[0x263F23AC0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC0], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2474C9000, v3, OS_LOG_TYPE_DEFAULT, "ASXPCClient launching server %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)invalidate
{
  [(NSXPCConnection *)self->_connection setInterruptionHandler:0];
  [(NSXPCConnection *)self->_connection setInvalidationHandler:0];
  connection = self->_connection;
  [(NSXPCConnection *)connection invalidate];
}

- (void).cxx_destruct
{
}

@end