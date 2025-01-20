@interface HDHAHealthAppPluginHostConnection
- (HDHAHealthAppPluginHostConnection)init;
- (id)proxy;
- (id)synchronousProxy;
- (void)dealloc;
- (void)resumeIfNecessary;
@end

@implementation HDHAHealthAppPluginHostConnection

- (HDHAHealthAppPluginHostConnection)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDHAHealthAppPluginHostConnection;
  v2 = [(HDHAHealthAppPluginHostConnection *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.healthappd" options:0];
    connection = v3->_connection;
    v3->_connection = (NSXPCConnection *)v4;

    v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_2701EDDB0];
    [(NSXPCConnection *)v3->_connection setRemoteObjectInterface:v6];

    v7 = [(NSXPCConnection *)v3->_connection remoteObjectInterface];
    id v8 = (id)objc_msgSend(v7, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_handleJournaledSharingEntries_completion_, 0, 0);
  }
  return v3;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)HDHAHealthAppPluginHostConnection;
  [(HDHAHealthAppPluginHostConnection *)&v3 dealloc];
}

- (void)resumeIfNecessary
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_resumed)
  {
    self->_resumed = 1;
    [(NSXPCConnection *)self->_connection setInterruptionHandler:&__block_literal_global_2];
    [(NSXPCConnection *)self->_connection setInvalidationHandler:&__block_literal_global_292];
    [(NSXPCConnection *)self->_connection resume];
  }
  os_unfair_lock_unlock(p_lock);
}

void __54__HDHAHealthAppPluginHostConnection_resumeIfNecessary__block_invoke()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_250D3F000, v0, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection remote proxy interrupted", v1, 2u);
  }
}

void __54__HDHAHealthAppPluginHostConnection_resumeIfNecessary__block_invoke_290()
{
  _HKInitializeLogging();
  v0 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_250D3F000, v0, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection remote proxy invalidated", v1, 2u);
  }
}

- (id)proxy
{
  [(HDHAHealthAppPluginHostConnection *)self resumeIfNecessary];
  connection = self->_connection;
  return [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:&__block_literal_global_295];
}

void __42__HDHAHealthAppPluginHostConnection_proxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)synchronousProxy
{
  [(HDHAHealthAppPluginHostConnection *)self resumeIfNecessary];
  connection = self->_connection;
  return [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_297];
}

void __53__HDHAHealthAppPluginHostConnection_synchronousProxy__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  _HKInitializeLogging();
  objc_super v3 = *MEMORY[0x263F09968];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09968], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_250D3F000, v3, OS_LOG_TYPE_DEFAULT, "HDHAHealthAppPluginHostConnection error: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void).cxx_destruct
{
}

@end