@interface CAXContextualActionsSuggestionReceiver
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)dealloc;
- (void)donateSessionSummary:(id)a3;
- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3;
- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3 completion:(id)a4;
- (void)processShortcutsSessionGivenSummary:(id)a3;
- (void)processShortcutsSessionGivenSummary:(id)a3 completion:(id)a4;
- (void)setupXPCListener;
- (void)startWithBlendingLayerServer:(id)a3;
@end

@implementation CAXContextualActionsSuggestionReceiver

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2257D2000, v6, OS_LOG_TYPE_DEFAULT, "Suggestion Receiver listener - received new connection.", buf, 2u);
  }

  v7 = CAXContextualActionsXPCInterface();
  [v5 setExportedInterface:v7];

  [v5 setExportedObject:self];
  [v5 setInterruptionHandler:&__block_literal_global_2];
  [v5 setInvalidationHandler:&__block_literal_global_7_0];
  [v5 resume];

  v8 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2257D2000, v8, OS_LOG_TYPE_DEFAULT, "Suggestion Receiver listener - resuming connection.", v10, 2u);
  }

  return 1;
}

void __77__CAXContextualActionsSuggestionReceiver_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2257D2000, v0, OS_LOG_TYPE_DEFAULT, "Unexpected interruption on CAX XPC interface", v1, 2u);
  }
}

void __77__CAXContextualActionsSuggestionReceiver_listener_shouldAcceptNewConnection___block_invoke_5()
{
  v0 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2257D2000, v0, OS_LOG_TYPE_DEFAULT, "Connection invalidated on CAX XPC interface. Client went away.", v1, 2u);
  }
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken10 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken10, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult;
  return v2;
}

void __56__CAXContextualActionsSuggestionReceiver_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x22A635790]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult;
  sharedInstance__pasExprOnceResult = v1;
}

- (void)startWithBlendingLayerServer:(id)a3
{
  id v4 = a3;
  id v5 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2257D2000, v5, OS_LOG_TYPE_DEFAULT, "Suggestion Receiver starting...", v8, 2u);
  }

  [(CAXContextualActionsSuggestionReceiver *)self setupXPCListener];
  v6 = (CAXSuggestionProvider *)objc_opt_new();
  suggestionProvider = self->_suggestionProvider;
  self->_suggestionProvider = v6;

  [(CAXSuggestionProvider *)self->_suggestionProvider registerModelForRealTimeRequestsWithBlendingLayerServer:v4];
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CAXContextualActionsSuggestionReceiver;
  [(CAXContextualActionsSuggestionReceiver *)&v3 dealloc];
}

- (void)setupXPCListener
{
  objc_super v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.proactive.ContextualActions.xpc"];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  [(NSXPCListener *)self->_xpcListener resume];
  id v5 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_2257D2000, v5, OS_LOG_TYPE_DEFAULT, "xpcListener resuming in Suggestion Receiver.", v6, 2u);
  }
}

- (void)processShortcutsSessionGivenSummary:(id)a3
{
  id v4 = a3;
  id v5 = [CAXContextualActionsPredictor alloc];
  v6 = +[CAXContextualActionsPredictor defaultPersonalizedModelUrl];
  v7 = +[CAXContextualActionsPredictor defaultConfigFileUrl];
  v8 = [(CAXContextualActionsPredictor *)v5 initWithDefaultCodersAndModelUrl:v6 configUrl:v7];

  [(CAXContextualActionsPredictor *)v8 updateModelWithSummary:v4];
  [(CAXContextualActionsSuggestionReceiver *)self donateSessionSummary:v4];
}

- (void)processShortcutsSessionGivenSummary:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, void))a4;
  id v7 = a3;
  v8 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2257D2000, v8, OS_LOG_TYPE_DEFAULT, "in receiver - processShortcutsSessionGivenSummary", v9, 2u);
  }

  [(CAXContextualActionsSuggestionReceiver *)self processShortcutsSessionGivenSummary:v7];
  if (v6) {
    v6[2](v6, 0);
  }
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [[CAXBiomeContextualActionsFeedbackStream alloc] initWithStoreConfig:0];
  id v5 = [(CAXBiomeContextualActionsFeedbackStream *)v4 source];
  [v5 sendEvent:v3];

  v6 = __atxlog_handle_contextual_actions();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v3 selectedAction];
    v8 = [v7 actionIdentifier];
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_2257D2000, v6, OS_LOG_TYPE_DEFAULT, "action selection event for action %@ successfully sent to private biome stream.", (uint8_t *)&v9, 0xCu);
  }
}

- (void)processShortcutsActionSelectionGivenFeedbackEvent:(id)a3 completion:(id)a4
{
  id v7 = a4;
  [(CAXContextualActionsSuggestionReceiver *)self processShortcutsActionSelectionGivenFeedbackEvent:a3];
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v6 = v7;
  }
}

- (void)donateSessionSummary:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [[CAXBiomeContextualActionsFeedbackStream alloc] initWithStoreConfig:0];
  id v5 = [v3 actions];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [CAXContextualActionsFeedbackEvent alloc];
      v8 = [v5 objectAtIndexedSubscript:v6];
      int v9 = [v3 sessionIdentifier];
      v10 = [(CAXContextualActionsFeedbackEvent *)v7 initWithSelectedAction:v8 suggestion:0 deviceContext:0 sessionIdentifier:v9];

      uint64_t v11 = [(CAXBiomeContextualActionsFeedbackStream *)v4 source];
      [v11 sendEvent:v10];

      v12 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v5 objectAtIndexedSubscript:v6];
        v14 = [v13 actionIdentifier];
        *(_DWORD *)buf = 138412290;
        v16 = v14;
        _os_log_impl(&dword_2257D2000, v12, OS_LOG_TYPE_DEFAULT, "action: %@ successfully sent to private biome stream.", buf, 0xCu);
      }
      ++v6;
    }
    while ([v5 count] > v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionProvider, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

@end