@interface CCSetChangeRelayServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CCSetChangeRelayServer)initWithQueue:(id)a3;
- (void)activate;
- (void)notifyChangeToSet:(id)a3 completion:(id)a4;
@end

@implementation CCSetChangeRelayServer

- (CCSetChangeRelayServer)initWithQueue:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCSetChangeRelayServer;
  v5 = [(CCSetChangeRelayServer *)&v11 init];
  if (v5)
  {
    uint64_t v6 = +[CCSetChangeXPCNotifier sharedInstance];
    setChangeNotifier = v5->_setChangeNotifier;
    v5->_setChangeNotifier = (CCSetChangeXPCNotifier *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F29EB0]) initWithMachServiceName:@"com.apple.cascade.SetChangeRelayService" queue:v4];
    listener = v5->_listener;
    v5->_listener = (BMXPCListener *)v8;

    [(BMXPCListener *)v5->_listener setDelegate:v5];
  }

  return v5;
}

- (void)activate
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [(BMXPCListener *)self->_listener activate];
  v3 = __biome_log_for_category();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    listener = self->_listener;
    int v5 = 138412290;
    uint64_t v6 = listener;
    _os_log_impl(&dword_249B92000, v3, OS_LOG_TYPE_DEFAULT, "CCSetChangeRelayServer activated with listener: %@", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [MEMORY[0x263F29E80] processWithXPCConnection:v5];
  uint64_t v7 = __biome_log_for_category();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CCSetChangeRelayServer listener:shouldAcceptNewConnection:](v6, v7);
  }

  uint64_t v8 = [v6 processType];
  if (v8 == 5)
  {
    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FDD6BA8];
    [v9 setClass:objc_opt_class() forSelector:sel_notifyChangeToSet_completion_ argumentIndex:0 ofReply:0];
    [v5 setExportedInterface:v9];
    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    v10 = __biome_log_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CCSetChangeRelayServer listener:shouldAcceptNewConnection:](v6, v10);
    }

    [v5 invalidate];
  }

  return v8 == 5;
}

- (void)notifyChangeToSet:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  uint64_t v8 = __biome_log_for_category();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[CCSetChangeRelayServer notifyChangeToSet:completion:]((uint64_t)v6, v8);
  }

  [(CCSetChangeXPCNotifier *)self->_setChangeNotifier notifyChangeToSet:v6];
  v7[2](v7, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setChangeNotifier, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_249B92000, a2, OS_LOG_TYPE_ERROR, "CCSetChangeRelayServer refusing connection from %{public}@(%d), process is not SetStoreUpdateService", v5, 0x12u);
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = [a1 executableName];
  [a1 pid];
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "CCSetChangeRelayServer received new connection request from %@(%d)", v5, 0x12u);
}

- (void)notifyChangeToSet:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_249B92000, a2, OS_LOG_TYPE_DEBUG, "CCSetChangeRelayServer notifying change to Set: %@", (uint8_t *)&v2, 0xCu);
}

@end