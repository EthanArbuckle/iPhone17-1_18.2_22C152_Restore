@interface CHIntegrationTestClient
- (CHIntegrationTestClient)init;
- (void)populateSampleAppLaunchEmbeddingWithCompletion:(id)a3;
@end

@implementation CHIntegrationTestClient

- (void).cxx_destruct
{
}

- (void)populateSampleAppLaunchEmbeddingWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = ch_test_handle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24A47C000, v5, OS_LOG_TYPE_DEFAULT, "CHIntegrationTestClient initiating call to cognitivehealthd - embeddingVectorForBundleId", buf, 2u);
  }

  clientHelper = self->_clientHelper;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__CHIntegrationTestClient_populateSampleAppLaunchEmbeddingWithCompletion___block_invoke;
  v9[3] = &unk_265287CC0;
  id v10 = v4;
  id v7 = v4;
  v8 = [(CHXPCClientHelper *)clientHelper remoteObjectProxyWithErrorHandler:v9];
  [v8 populateSampleAppLaunchEmbeddingWithCompletion:v7];
}

void __74__CHIntegrationTestClient_populateSampleAppLaunchEmbeddingWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ch_test_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = [v3 localizedDescription];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_error_impl(&dword_24A47C000, v4, OS_LOG_TYPE_ERROR, "CHSensorDataClient remoteObjectProxy error: %@", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CHIntegrationTestClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)CHIntegrationTestClient;
  v2 = [(CHIntegrationTestClient *)&v9 init];
  if (v2)
  {
    id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FE1D7C0];
    id v4 = (void *)MEMORY[0x24C5C6310]();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
    [v3 setClasses:v5 forSelector:sel_populateSampleAppLaunchEmbeddingWithCompletion_ argumentIndex:0 ofReply:1];

    int v6 = [[CHXPCClientHelper alloc] initWithServiceName:@"com.apple.cognitivehealth.integrationtest" whitelistedServerInterface:v3 clientExportedObject:v2 interruptionHandler:&__block_literal_global invalidationHandler:&__block_literal_global_12];
    clientHelper = v2->_clientHelper;
    v2->_clientHelper = v6;
  }
  return v2;
}

void __31__CHIntegrationTestClient_init__block_invoke_10()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = ch_xpc_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    v2 = @"com.apple.cognitivehealth.integrationtest";
    _os_log_error_impl(&dword_24A47C000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ invalidated.", (uint8_t *)&v1, 0xCu);
  }
}

void __31__CHIntegrationTestClient_init__block_invoke()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = ch_xpc_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    int v1 = 138412290;
    v2 = @"com.apple.cognitivehealth.integrationtest";
    _os_log_error_impl(&dword_24A47C000, v0, OS_LOG_TYPE_ERROR, "Connection to %@ interrupted.", (uint8_t *)&v1, 0xCu);
  }
}

@end