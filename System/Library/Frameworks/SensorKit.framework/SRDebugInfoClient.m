@interface SRDebugInfoClient
+ (id)clientInterface;
+ (id)connectionToDaemon;
+ (id)remoteInterface;
+ (void)initialize;
- (BOOL)connectionDidInterrupt;
- (NSXPCConnection)connection;
- (SRDebugInfoClient)init;
- (SRDebugInfoClient)initWithConnection:(id)a3;
- (void)datastoreListingWithReply:(id)a3;
- (void)dealloc;
- (void)dumpClientsWithReply:(id)a3;
- (void)dumpConfigurationsWithReply:(id)a3;
- (void)dumpDefaultsWithReply:(id)a3;
- (void)dumpStateCacheWithReply:(id)a3;
- (void)fetchDeviceInformationForDeviceIdentifiers:(id)a3 reply:(id)a4;
- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 sensor:(id)a4 reply:(id)a5;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setConnectionDidInterrupt:(BOOL)a3;
- (void)setupConnection;
@end

@implementation SRDebugInfoClient

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    SRDebugInfoClientLog = (uint64_t)os_log_create("com.apple.SensorKit", "SRDebugInfoClient");
  }
}

- (SRDebugInfoClient)init
{
  uint64_t v3 = [(id)objc_opt_class() connectionToDaemon];

  return [(SRDebugInfoClient *)self initWithConnection:v3];
}

- (SRDebugInfoClient)initWithConnection:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SRDebugInfoClient;
  v4 = [(SRDebugInfoClient *)&v6 init];
  if (v4)
  {
    v4->_connection = (NSXPCConnection *)a3;
    [(SRDebugInfoClient *)v4 setupConnection];
  }
  return v4;
}

- (void)invalidate
{
  [(NSXPCConnection *)[(SRDebugInfoClient *)self connection] setExportedObject:0];
  uint64_t v3 = [(SRDebugInfoClient *)self connection];

  [(NSXPCConnection *)v3 invalidate];
}

- (void)dealloc
{
  [(SRDebugInfoClient *)self setConnection:0];
  v3.receiver = self;
  v3.super_class = (Class)SRDebugInfoClient;
  [(SRDebugInfoClient *)&v3 dealloc];
}

+ (id)clientInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181538];
}

+ (id)remoteInterface
{
  v2 = (void *)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D181598];
  objc_super v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0), sel_dumpClientsWithReply_, 0, 1);
  return v2;
}

+ (id)connectionToDaemon
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.SensorKit.debugging" options:4096];

  return v2;
}

- (void)setupConnection
{
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [(id)objc_opt_class() remoteInterface]);
  [(NSXPCConnection *)self->_connection setExportedObject:self];
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [(id)objc_opt_class() clientInterface]);
  connection = self->_connection;

  [(NSXPCConnection *)connection resume];
}

- (void)dumpClientsWithReply:(id)a3
{
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SRDebugInfoClient_dumpClientsWithReply___block_invoke;
  v7[3] = &unk_26452E1D0;
  v7[4] = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__SRDebugInfoClient_dumpClientsWithReply___block_invoke_30;
  v6[3] = &unk_26452E760;
  v6[4] = a3;
  [v5 dumpClientsWithReply:v6];
}

uint64_t __42__SRDebugInfoClient_dumpClientsWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = +[SRError errorWithCode:8193];
  return (*(uint64_t (**)(uint64_t, void, SRError *))(v5 + 16))(v5, MEMORY[0x263EFFA78], v6);
}

uint64_t __42__SRDebugInfoClient_dumpClientsWithReply___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpStateCacheWithReply:(id)a3
{
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SRDebugInfoClient_dumpStateCacheWithReply___block_invoke;
  v7[3] = &unk_26452E1D0;
  v7[4] = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SRDebugInfoClient_dumpStateCacheWithReply___block_invoke_32;
  v6[3] = &unk_26452E760;
  v6[4] = a3;
  [v5 dumpStateCacheWithReply:v6];
}

uint64_t __45__SRDebugInfoClient_dumpStateCacheWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, +[SRError errorWithCode:8193]);
}

uint64_t __45__SRDebugInfoClient_dumpStateCacheWithReply___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)datastoreListingWithReply:(id)a3
{
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SRDebugInfoClient_datastoreListingWithReply___block_invoke;
  v7[3] = &unk_26452E1D0;
  v7[4] = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__SRDebugInfoClient_datastoreListingWithReply___block_invoke_33;
  v6[3] = &unk_26452E918;
  v6[4] = a3;
  [v5 listDatastoreWithReply:v6];
}

uint64_t __47__SRDebugInfoClient_datastoreListingWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, +[SRError errorWithCode:8193]);
}

uint64_t __47__SRDebugInfoClient_datastoreListingWithReply___block_invoke_33(uint64_t a1, uint64_t a2)
{
  if (a2) {
    [NSURL fileURLWithPath:a2];
  }
  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v3();
}

- (void)dumpConfigurationsWithReply:(id)a3
{
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SRDebugInfoClient_dumpConfigurationsWithReply___block_invoke;
  v7[3] = &unk_26452E1D0;
  v7[4] = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SRDebugInfoClient_dumpConfigurationsWithReply___block_invoke_36;
  v6[3] = &unk_26452E760;
  v6[4] = a3;
  [v5 dumpConfigurationsWithReply:v6];
}

uint64_t __49__SRDebugInfoClient_dumpConfigurationsWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = +[SRError errorWithCode:8193];
  return (*(uint64_t (**)(uint64_t, void, SRError *))(v5 + 16))(v5, MEMORY[0x263EFFA78], v6);
}

uint64_t __49__SRDebugInfoClient_dumpConfigurationsWithReply___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpDefaultsWithReply:(id)a3
{
  connection = self->_connection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SRDebugInfoClient_dumpDefaultsWithReply___block_invoke;
  v7[3] = &unk_26452E1D0;
  v7[4] = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __43__SRDebugInfoClient_dumpDefaultsWithReply___block_invoke_37;
  v6[3] = &unk_26452E760;
  v6[4] = a3;
  [v5 dumpDefaultsWithReply:v6];
}

uint64_t __43__SRDebugInfoClient_dumpDefaultsWithReply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = +[SRError errorWithCode:8193];
  return (*(uint64_t (**)(uint64_t, void, SRError *))(v5 + 16))(v5, MEMORY[0x263EFFA78], v6);
}

uint64_t __43__SRDebugInfoClient_dumpDefaultsWithReply___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEligibilityStatusForBundleIdentifier:(id)a3 sensor:(id)a4 reply:(id)a5
{
  connection = self->_connection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__SRDebugInfoClient_fetchEligibilityStatusForBundleIdentifier_sensor_reply___block_invoke;
  v6[3] = &unk_26452E1D0;
  v6[4] = a5;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v6), "fetchEligibilityStatusForBundleIdentifier:sensor:reply:", a3, a4, a5);
}

uint64_t __76__SRDebugInfoClient_fetchEligibilityStatusForBundleIdentifier_sensor_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543362;
    uint64_t v7 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void, void, SRError *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, +[SRError errorWithCode:8193]);
}

- (void)fetchDeviceInformationForDeviceIdentifiers:(id)a3 reply:(id)a4
{
  connection = self->_connection;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SRDebugInfoClient_fetchDeviceInformationForDeviceIdentifiers_reply___block_invoke;
  v5[3] = &unk_26452E1D0;
  v5[4] = a4;
  objc_msgSend(-[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v5), "fetchDeviceInformationForDeviceIdentifiers:reply:", a3, a4);
}

uint64_t __70__SRDebugInfoClient_fetchDeviceInformationForDeviceIdentifiers_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = SRDebugInfoClientLog;
  if (os_log_type_enabled((os_log_t)SRDebugInfoClientLog, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543362;
    uint64_t v9 = a2;
    _os_log_error_impl(&dword_21FCA3000, v4, OS_LOG_TYPE_ERROR, "Unable to connect to daemon because %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = +[SRError errorWithCode:8193];
  return (*(uint64_t (**)(uint64_t, void, SRError *))(v5 + 16))(v5, MEMORY[0x263EFFA68], v6);
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setConnection:(id)a3
{
}

- (BOOL)connectionDidInterrupt
{
  return self->_connectionDidInterrupt;
}

- (void)setConnectionDidInterrupt:(BOOL)a3
{
  self->_connectionDidInterrupt = a3;
}

@end