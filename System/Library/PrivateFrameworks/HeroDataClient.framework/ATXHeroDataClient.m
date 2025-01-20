@interface ATXHeroDataClient
- (ATXHeroDataClient)init;
- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)addHardRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)addSoftRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)donateHeroAppPredictions:(id)a3 completion:(id)a4;
- (void)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
- (void)getCurrentHeroPoiCategoryWithCompletion:(id)a3;
- (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4;
@end

@implementation ATXHeroDataClient

- (ATXHeroDataClient)init
{
  v7.receiver = self;
  v7.super_class = (Class)ATXHeroDataClient;
  v2 = [(ATXHeroDataClient *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.proactive.hero.AppPrediction.predictions" options:0];
    xpcConnection = v2->_xpcConnection;
    v2->_xpcConnection = (NSXPCConnection *)v3;

    v5 = ATXHeroDataXPCInterface();
    [(NSXPCConnection *)v2->_xpcConnection setRemoteObjectInterface:v5];

    [(NSXPCConnection *)v2->_xpcConnection setInterruptionHandler:&__block_literal_global];
    [(NSXPCConnection *)v2->_xpcConnection resume];
  }
  return v2;
}

void __25__ATXHeroDataClient_init__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __25__ATXHeroDataClient_init__block_invoke_cold_1();
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXHeroDataClient;
  [(ATXHeroDataClient *)&v3 dealloc];
}

- (void)donateHeroAppPredictions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = &__block_literal_global_5;
  if (v6) {
    objc_super v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2;
  v12[3] = &unk_264252340;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 donateHeroAppPredictions:v10 completion:v9];
}

void __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addConfirmForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = &__block_literal_global_7;
  if (v6) {
    objc_super v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __74__ATXHeroDataClient_addConfirmForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_264252340;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 addConfirmForAppClipWithHeroAppPrediction:v10 completion:v9];
}

void __74__ATXHeroDataClient_addConfirmForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addSoftRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = &__block_literal_global_9;
  if (v6) {
    objc_super v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__ATXHeroDataClient_addSoftRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_264252340;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 addSoftRejectForAppClipWithHeroAppPrediction:v10 completion:v9];
}

void __77__ATXHeroDataClient_addSoftRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addHardRejectForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = &__block_literal_global_11;
  if (v6) {
    objc_super v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__ATXHeroDataClient_addHardRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_264252340;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 addHardRejectForAppClipWithHeroAppPrediction:v10 completion:v9];
}

void __77__ATXHeroDataClient_addHardRejectForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)feedbackScoreForAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = &__block_literal_global_14;
  if (v6) {
    objc_super v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__ATXHeroDataClient_feedbackScoreForAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_264252340;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 feedbackScoreForAppClipWithHeroAppPrediction:v10 completion:v9];
}

void __77__ATXHeroDataClient_feedbackScoreForAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(double))(*(void *)(a1 + 32) + 16))(0.0);
}

- (void)openAppClipWithHeroAppPrediction:(id)a3 completion:(id)a4
{
  id v6 = a4;
  objc_super v7 = &__block_literal_global_16;
  if (v6) {
    objc_super v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __65__ATXHeroDataClient_openAppClipWithHeroAppPrediction_completion___block_invoke_2;
  v12[3] = &unk_264252340;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 openAppClipWithHeroAppPrediction:v10 completion:v9];
}

void __65__ATXHeroDataClient_openAppClipWithHeroAppPrediction_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCurrentHeroPoiCategoryWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = &__block_literal_global_19;
  if (v4) {
    v5 = v4;
  }
  xpcConnection = self->_xpcConnection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__ATXHeroDataClient_getCurrentHeroPoiCategoryWithCompletion___block_invoke_2;
  v9[3] = &unk_264252340;
  id v10 = v5;
  id v7 = v5;
  v8 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v9];
  [v8 getCurrentHeroPoiCategoryWithCompletion:v7];
}

void __61__ATXHeroDataClient_getCurrentHeroPoiCategoryWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
}

void __25__ATXHeroDataClient_init__block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_2155F7000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Connection to Hero App Prediction server interrupted", v0, 2u);
}

void __57__ATXHeroDataClient_donateHeroAppPredictions_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2155F7000, &_os_log_internal, v0, "Error: %@", v1, v2, v3, v4, v5);
}

@end