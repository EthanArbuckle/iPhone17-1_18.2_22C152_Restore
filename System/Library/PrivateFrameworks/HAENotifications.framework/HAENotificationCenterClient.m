@interface HAENotificationCenterClient
- (HAENotificationCenterClient)initWithBundleID:(id)a3;
- (NSString)bundleID;
- (id)setupConnection;
- (void)addHAENotificationEvent:(id)a3;
- (void)setBundleID:(id)a3;
@end

@implementation HAENotificationCenterClient

- (HAENotificationCenterClient)initWithBundleID:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HAENotificationCenterClient;
  v5 = [(HAENotificationCenterClient *)&v10 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(HAENotificationCenterClient *)v5 setupConnection];
    connection = v6->connection;
    v6->connection = (NSXPCConnection *)v7;

    [(HAENotificationCenterClient *)v6 setBundleID:v4];
  }

  return v6;
}

- (void)addHAENotificationEvent:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = HAENotificationsLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    bundleID = self->bundleID;
    int v8 = 138412546;
    v9 = bundleID;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_21FABA000, v5, OS_LOG_TYPE_DEFAULT, "Sending event from client %@, %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v7 = [(NSXPCConnection *)self->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  [v7 addHAENotificationEvent:v4];
}

void __55__HAENotificationCenterClient_addHAENotificationEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = HAENotificationsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__HAENotificationCenterClient_addHAENotificationEvent___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (id)setupConnection
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.coreaudio.adam.hae.notification" options:4096];
  id v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D1541D8];
  [v3 setRemoteObjectInterface:v4];

  [v3 setExportedObject:self];
  objc_initWeak(&location, self);
  [v3 setInterruptionHandler:&__block_literal_global_49];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  int v8 = __46__HAENotificationCenterClient_setupConnection__block_invoke_50;
  v9 = &unk_2645275B0;
  objc_copyWeak(&v10, &location);
  [v3 setInvalidationHandler:&v6];
  self->connectionDidInvalidate = 0;
  objc_msgSend(v3, "resume", v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  return v3;
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke()
{
  v0 = HAENotificationsLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __46__HAENotificationCenterClient_setupConnection__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_50(uint64_t a1)
{
  uint64_t v2 = HAENotificationsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __46__HAENotificationCenterClient_setupConnection__block_invoke_50_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 16) = 1;
  }
  else
  {
    uint64_t v12 = HAENotificationsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __46__HAENotificationCenterClient_setupConnection__block_invoke_50_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (NSString)bundleID
{
  return self->bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->bundleID, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

void __55__HAENotificationCenterClient_addHAENotificationEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[HAENotificationCenterClient addHAENotificationEvent:]_block_invoke";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_21FABA000, a2, OS_LOG_TYPE_ERROR, "%s error: %@", (uint8_t *)&v2, 0x16u);
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_50_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __46__HAENotificationCenterClient_setupConnection__block_invoke_50_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end