@interface CHSensorDataClient
- (CHSensorDataClient)init;
- (void)aggregatedMotionAndAppLaunchDataFromDate:(id)a3 toDate:(id)a4 completion:(id)a5;
- (void)embeddingVectorForBundleId:(id)a3 completion:(id)a4;
@end

@implementation CHSensorDataClient

- (void).cxx_destruct
{
}

- (void)embeddingVectorForBundleId:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ch_sensor_data_handle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24A47C000, v8, OS_LOG_TYPE_DEFAULT, "CHSensorDataClient initiating call to cognitivehealthd - embeddingVectorForBundleId", buf, 2u);
  }

  clientHelper = self->_clientHelper;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CHSensorDataClient_embeddingVectorForBundleId_completion___block_invoke;
  v12[3] = &unk_265287CC0;
  id v13 = v6;
  id v10 = v6;
  v11 = [(CHXPCClientHelper *)clientHelper remoteObjectProxyWithErrorHandler:v12];
  [v11 embeddingVectorForBundleId:v7 completion:v10];
}

void __60__CHSensorDataClient_embeddingVectorForBundleId_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = ch_xpc_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [v3 localizedDescription];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_error_impl(&dword_24A47C000, v4, OS_LOG_TYPE_ERROR, "CHSensorDataClient remoteObjectProxy error: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)aggregatedMotionAndAppLaunchDataFromDate:(id)a3 toDate:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = ch_sensor_data_handle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24A47C000, v11, OS_LOG_TYPE_DEFAULT, "CHSensorDataClient initiating call to cognitivehealthd - aggregatedMotionAndAppLaunchData", buf, 2u);
  }

  clientHelper = self->_clientHelper;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __81__CHSensorDataClient_aggregatedMotionAndAppLaunchDataFromDate_toDate_completion___block_invoke;
  v15[3] = &unk_265287CC0;
  id v16 = v8;
  id v13 = v8;
  v14 = [(CHXPCClientHelper *)clientHelper remoteObjectProxyWithErrorHandler:v15];
  [v14 aggregatedMotionAndAppLaunchDataFromDate:v10 toDate:v9 completion:v13];
}

void __81__CHSensorDataClient_aggregatedMotionAndAppLaunchDataFromDate_toDate_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = ch_xpc_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [v3 localizedDescription];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_error_impl(&dword_24A47C000, v4, OS_LOG_TYPE_ERROR, "CHSensorDataClient remoteObjectProxy error: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CHSensorDataClient)init
{
  v18.receiver = self;
  v18.super_class = (Class)CHSensorDataClient;
  v2 = [(CHSensorDataClient *)&v18 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE1D8A0];
    v4 = (void *)MEMORY[0x24C5C6310]();
    id v5 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v10 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    [v3 setClasses:v10 forSelector:sel_aggregatedMotionAndAppLaunchDataFromDate_toDate_completion_ argumentIndex:0 ofReply:1];

    v11 = (void *)MEMORY[0x24C5C6310]();
    id v12 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
    [v3 setClasses:v14 forSelector:sel_embeddingVectorForBundleId_completion_ argumentIndex:0 ofReply:1];

    v15 = [[CHXPCClientHelper alloc] initWithServiceName:@"com.apple.cognitivehealth.sensordata" whitelistedServerInterface:v3 clientExportedObject:v2 interruptionHandler:&__block_literal_global_40 invalidationHandler:&__block_literal_global_21];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v15;
  }
  return v2;
}

void __26__CHSensorDataClient_init__block_invoke_19()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = ch_xpc_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    v2 = @"com.apple.cognitivehealth.sensordata";
    _os_log_error_impl(&dword_24A47C000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

void __26__CHSensorDataClient_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = ch_xpc_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    v2 = @"com.apple.cognitivehealth.sensordata";
    _os_log_error_impl(&dword_24A47C000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }
}

@end