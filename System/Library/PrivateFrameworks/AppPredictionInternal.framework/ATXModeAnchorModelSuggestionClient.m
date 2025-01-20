@interface ATXModeAnchorModelSuggestionClient
+ (ATXModeAnchorModelSuggestionClient)sharedInstance;
- (id)_init;
- (void)_pingServer;
- (void)anchorModelDidProvideModeSuggestions:(id)a3;
- (void)fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11;
- (void)fetchCombinedSuggestionScoreForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11;
@end

@implementation ATXModeAnchorModelSuggestionClient

+ (ATXModeAnchorModelSuggestionClient)sharedInstance
{
  if (sharedInstance__pasOnceToken6_19 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_19, &__block_literal_global_118);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_25;
  return (ATXModeAnchorModelSuggestionClient *)v2;
}

void __52__ATXModeAnchorModelSuggestionClient_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  id v1 = [[ATXModeAnchorModelSuggestionClient alloc] _init];
  v2 = (void *)sharedInstance__pasExprOnceResult_25;
  sharedInstance__pasExprOnceResult_25 = (uint64_t)v1;
}

- (id)_init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXModeAnchorModelSuggestionClient;
  v2 = [(ATXModeAnchorModelSuggestionClient *)&v13 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = objc_alloc(MEMORY[0x1E4F93BC0]);
    v4 = ATXModeAnchorModelSuggestionServerXPCInterface();
    v5 = ATXModeAnchorModelSuggestionClientXPCInterface();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__ATXModeAnchorModelSuggestionClient__init__block_invoke;
    v10[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v11, &location);
    v6 = __atxlog_handle_modes();
    uint64_t v7 = [v3 initWithServiceName:*MEMORY[0x1E4F936B0] allowlistedServerInterface:v4 allowlistedClientInterface:v5 serverInitiatedRequestHandler:v2 interruptionHandler:v10 invalidationHandler:&__block_literal_global_8_1 logHandle:v6];
    xpcClientHelper = v2->_xpcClientHelper;
    v2->_xpcClientHelper = (_PASXPCClientHelper *)v7;

    [(ATXModeAnchorModelSuggestionClient *)v2 _pingServer];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __43__ATXModeAnchorModelSuggestionClient__init__block_invoke(uint64_t a1)
{
  v2 = __atxlog_handle_modes();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionClient: xpc connection interrupted.", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _pingServer];
}

void __43__ATXModeAnchorModelSuggestionClient__init__block_invoke_6()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionClient: xpc connection invalidated.", v1, 2u);
  }
}

- (void)_pingServer
{
  id v2 = [(_PASXPCClientHelper *)self->_xpcClientHelper remoteObjectProxyWithErrorHandler:&__block_literal_global_11];
  [v2 pingWithCompletion:&__block_literal_global_15_1];
}

void __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke_12()
{
  v0 = __atxlog_handle_modes();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "ATXModeAnchorModelSuggestionClient: successfully pinged server", v1, 2u);
  }
}

- (void)anchorModelDidProvideModeSuggestions:(id)a3
{
  xpcClientHelper = self->_xpcClientHelper;
  id v4 = a3;
  id v5 = [(_PASXPCClientHelper *)xpcClientHelper remoteObjectProxyWithErrorHandler:&__block_literal_global_17_2];
  [v5 anchorModelDidProvideModeSuggestions:v4];
}

void __75__ATXModeAnchorModelSuggestionClient_anchorModelDidProvideModeSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_modes();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __75__ATXModeAnchorModelSuggestionClient_anchorModelDidProvideModeSuggestions___block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)fetchCombinedSuggestionScoreForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  uint64_t v16 = *(void *)&a5;
  uint64_t v17 = *(void *)&a4;
  v19 = (void (**)(id, void *))a11;
  id v20 = a10;
  id v21 = a7;
  id v22 = a6;
  id v23 = a3;
  v26 = [[ATXModeSuggestionScorer alloc] initWithModeUUID:v23 modeType:v17 origin:v16 originBundleId:v22 originAnchorType:v21 confidenceScore:v20 secondsSinceSuggested:a8 serializedTriggers:a9];

  v24 = NSNumber;
  [(ATXModeSuggestionScorer *)v26 score];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  v19[2](v19, v25);
}

- (void)fetchCombinedSuggestionScoreAndFlagsForModeWithUUID:(id)a3 modeType:(int)a4 origin:(int)a5 originBundleId:(id)a6 originAnchorType:(id)a7 confidenceScore:(double)a8 secondsSinceSuggested:(double)a9 serializedTriggers:(id)a10 completionHandler:(id)a11
{
  uint64_t v16 = *(void *)&a5;
  uint64_t v17 = *(void *)&a4;
  v19 = (void (**)(id, void *, uint64_t, uint64_t, uint64_t))a11;
  id v20 = a10;
  id v21 = a7;
  id v22 = a6;
  id v23 = a3;
  v26 = [[ATXModeSuggestionScorer alloc] initWithModeUUID:v23 modeType:v17 origin:v16 originBundleId:v22 originAnchorType:v21 confidenceScore:v20 secondsSinceSuggested:a8 serializedTriggers:a9];

  v24 = NSNumber;
  [(ATXModeSuggestionScorer *)v26 score];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  v19[2](v19, v25, [(ATXModeSuggestionScorer *)v26 shouldSuggestOnLockScreen], [(ATXModeSuggestionScorer *)v26 shouldSuggestTriggers], [(ATXModeSuggestionScorer *)v26 shouldAllowSmartEntry]);
}

- (void).cxx_destruct
{
}

void __49__ATXModeAnchorModelSuggestionClient__pingServer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeAnchorModelSuggestionClient: Error pinging remote object proxy - %@", (uint8_t *)&v2, 0xCu);
}

void __75__ATXModeAnchorModelSuggestionClient_anchorModelDidProvideModeSuggestions___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXModeAnchorModelSuggestionClient: Error getting remote object proxy to provide new suggestion - %@", (uint8_t *)&v2, 0xCu);
}

@end