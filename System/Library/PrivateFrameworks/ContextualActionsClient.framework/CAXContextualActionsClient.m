@interface CAXContextualActionsClient
- (CAXContextualActionsClient)initWithClientModelId:(id)a3;
- (void)dealloc;
- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3;
- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3 completion:(id)a4;
- (void)processShortcutsSessionGivenSummary:(id)a3;
- (void)processShortcutsSessionGivenSummary:(id)a3 completion:(id)a4;
@end

@implementation CAXContextualActionsClient

- (CAXContextualActionsClient)initWithClientModelId:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualActionsClient;
  v5 = [(CAXContextualActionsClient *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    clientModelId = v5->_clientModelId;
    v5->_clientModelId = (NSString *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.proactive.ContextualActions.xpc" options:0];
    xpcConnection = v5->_xpcConnection;
    v5->_xpcConnection = (NSXPCConnection *)v8;

    v10 = CAXContextualActionsXPCInterface();
    [(NSXPCConnection *)v5->_xpcConnection setRemoteObjectInterface:v10];

    [(NSXPCConnection *)v5->_xpcConnection setInterruptionHandler:&__block_literal_global];
    [(NSXPCConnection *)v5->_xpcConnection resume];
  }

  return v5;
}

void __52__CAXContextualActionsClient_initWithClientModelId___block_invoke()
{
  v0 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2257D2000, v0, OS_LOG_TYPE_DEFAULT, "Connection to Contextual Actions Client Model server interrupted.", v1, 2u);
  }
}

- (void)processShortcutsSessionGivenSummary:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2257D2000, v8, OS_LOG_TYPE_DEFAULT, "in client - processShortcutsSessionGivenSummary", buf, 2u);
  }

  v9 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2257D2000, v9, OS_LOG_TYPE_DEFAULT, "in client - processShortcutsSessionGivenSummary: about to enter suggestion receiver", buf, 2u);
  }
  if (!v6) {
    id v6 = &__block_literal_global_3;
  }

  xpcConnection = self->_xpcConnection;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__CAXContextualActionsClient_processShortcutsSessionGivenSummary_completion___block_invoke_4;
  v13[3] = &unk_264754A28;
  id v14 = v6;
  id v11 = v6;
  objc_super v12 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v13];
  [v12 processShortcutsSessionGivenSummary:v7 completion:v11];
}

void __77__CAXContextualActionsClient_processShortcutsSessionGivenSummary_completion___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_2257D2000, v4, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = &__block_literal_global_6;
  if (v6) {
    uint64_t v7 = v6;
  }
  xpcConnection = self->_xpcConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2;
  v12[3] = &unk_264754A28;
  id v13 = v7;
  id v9 = v7;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:v12];
  [v11 processShortcutsActionSelectionGivenFeedbackEvent:v10 completion:v9];
}

void __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3
{
  xpcConnection = self->_xpcConnection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_8];
  [v5 processShortcutsActionSelectionGivenFeedbackEvent:v4];
}

void __80__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)processShortcutsSessionGivenSummary:(id)a3
{
  xpcConnection = self->_xpcConnection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)xpcConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_10];
  [v5 processShortcutsSessionGivenSummary:v4];
}

void __66__CAXContextualActionsClient_processShortcutsSessionGivenSummary___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_xpcConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CAXContextualActionsClient;
  [(CAXContextualActionsClient *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_clientModelId, 0);
}

void __91__CAXContextualActionsClient_processShortcutsActionSelectionGivenFeedbackEvent_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end