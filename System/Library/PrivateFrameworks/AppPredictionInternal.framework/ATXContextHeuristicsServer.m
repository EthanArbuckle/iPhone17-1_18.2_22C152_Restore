@interface ATXContextHeuristicsServer
+ (id)sharedInstance;
- (ATXContextHeuristicsServer)initWithHeuristics:(id)a3;
- (id)_cachedContextsFromSuggestions:(id)a3;
- (id)_contextHeuristicsClientModel;
- (id)_retrieveOldContextHeuristicsSuggestions;
- (void)_updateBlendingLayerWithSuggestionsFromContextHeuristics:(id)a3;
- (void)_updateBlendingLayerWithSuggestionsFromSpotlightRecents:(id)a3;
- (void)_updateContextHeuristicsBiomeStreamWithNewSuggestions:(id)a3 oldSuggestions:(id)a4;
- (void)contextHeuristics:(id)a3 didUpdateSpotlightRecents:(id)a4;
- (void)contextHeuristics:(id)a3 didUpdateSuggestions:(id)a4;
@end

@implementation ATXContextHeuristicsServer

+ (id)sharedInstance
{
  v2 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D0FA3000, v2, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: sharedInstance", v5, 2u);
  }

  if (sharedInstance__pasOnceToken7_0 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken7_0, &__block_literal_global_246);
  }
  v3 = (void *)sharedInstance__pasExprOnceResult_54;
  return v3;
}

void __44__ATXContextHeuristicsServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [ATXContextHeuristicsServer alloc];
  id v2 = objc_alloc(MEMORY[0x1E4F494B0]);
  v3 = [MEMORY[0x1E4F935D0] sharedInstance];
  v4 = (void *)[v2 initWithLocationManager:v3];
  uint64_t v5 = [(ATXContextHeuristicsServer *)v1 initWithHeuristics:v4];
  v6 = (void *)sharedInstance__pasExprOnceResult_54;
  sharedInstance__pasExprOnceResult_54 = v5;
}

- (ATXContextHeuristicsServer)initWithHeuristics:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXContextHeuristicsServer;
  v6 = [(ATXContextHeuristicsServer *)&v17 init];
  p_isa = (id *)&v6->super.isa;
  if (!v6)
  {
LABEL_13:
    v11 = p_isa;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v6->_heuristics, a3);
  [p_isa[1] setDelegate:p_isa];
  v8 = [[ATXContextHeuristicsScheduler alloc] initWithContextHeuristics:p_isa[1]];
  id v9 = p_isa[2];
  p_isa[2] = v8;

  if (![MEMORY[0x1E4F93B10] isClassCLocked])
  {
    [p_isa[1] refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:&__block_literal_global_11_0];
    int v12 = [MEMORY[0x1E4F4B628] isSportsEnabled];
    v13 = __atxlog_handle_context_heuristic();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v14)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: starting sports scheduler.", v16, 2u);
      }

      [p_isa[2] start];
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: sports feature flag disabled, not starting.", v16, 2u);
      }
    }
    goto LABEL_13;
  }
  v10 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    -[ATXContextHeuristicsServer initWithHeuristics:](v10);
  }

  v11 = 0;
LABEL_14:

  return v11;
}

void __49__ATXContextHeuristicsServer_initWithHeuristics___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __49__ATXContextHeuristicsServer_initWithHeuristics___block_invoke_cold_1(v2);
    }
  }
}

- (void)_updateBlendingLayerWithSuggestionsFromContextHeuristics:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ATXContextHeuristicsServer *)self _contextHeuristicsClientModel];
  v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = [v4 count];
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer context heuristics total: %lu", (uint8_t *)&v7, 0xCu);
  }

  [v5 updateSuggestions:v4 completionHandler:&__block_literal_global_15_7];
}

void __87__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromContextHeuristics___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __87__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromContextHeuristics___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (void)_updateBlendingLayerWithSuggestionsFromSpotlightRecents:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:46];
  id v5 = objc_alloc(MEMORY[0x1E4F93940]);
  v6 = +[ATXClientModelSuggestionReceiver sharedInstance];
  int v7 = [v6 blendingLayerServer];
  uint64_t v8 = (void *)[v5 initWithClientModelId:v4 blendingLayerServer:v7];

  uint64_t v9 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    uint64_t v11 = [v3 count];
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer spotlight recents total: %lu", (uint8_t *)&v10, 0xCu);
  }

  [v8 updateSuggestions:v3 completionHandler:&__block_literal_global_19_4];
}

void __86__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromSpotlightRecents___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = __atxlog_handle_context_heuristic();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __86__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromSpotlightRecents___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

- (void)contextHeuristics:(id)a3 didUpdateSuggestions:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer Context heuristics %@", (uint8_t *)&v8, 0xCu);
  }

  int v7 = [(ATXContextHeuristicsServer *)self _retrieveOldContextHeuristicsSuggestions];
  [(ATXContextHeuristicsServer *)self _updateBlendingLayerWithSuggestionsFromContextHeuristics:v5];
  [(ATXContextHeuristicsServer *)self _updateContextHeuristicsBiomeStreamWithNewSuggestions:v5 oldSuggestions:v7];
}

- (void)contextHeuristics:(id)a3 didUpdateSpotlightRecents:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v6 = __atxlog_handle_context_heuristic();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXContextHeuristicsServer: updateBlendingLayer Spotlight recents %@", (uint8_t *)&v7, 0xCu);
  }

  [(ATXContextHeuristicsServer *)self _updateBlendingLayerWithSuggestionsFromSpotlightRecents:v5];
}

- (id)_retrieveOldContextHeuristicsSuggestions
{
  id v2 = [(ATXContextHeuristicsServer *)self _contextHeuristicsClientModel];
  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__106;
  objc_super v17 = __Block_byref_object_dispose__106;
  id v18 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __70__ATXContextHeuristicsServer__retrieveOldContextHeuristicsSuggestions__block_invoke;
  uint64_t v10 = &unk_1E68AC9A8;
  uint64_t v12 = &v13;
  id v4 = v3;
  uint64_t v11 = v4;
  [v2 retrieveCurrentSuggestionsWithReply:&v7];
  objc_msgSend(MEMORY[0x1E4F93B18], "waitForSemaphore:timeoutSeconds:", v4, 1.0, v7, v8, v9, v10);
  id v5 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v5;
}

void __70__ATXContextHeuristicsServer__retrieveOldContextHeuristicsSuggestions__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_updateContextHeuristicsBiomeStreamWithNewSuggestions:(id)a3 oldSuggestions:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ATXContextHeuristicsServer *)self _cachedContextsFromSuggestions:a4];
  v26 = v6;
  uint64_t v8 = [(ATXContextHeuristicsServer *)self _cachedContextsFromSuggestions:v6];
  uint64_t v9 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if (([v8 containsObject:v15] & 1) == 0)
        {
          v16 = [[ATXContextHeuristicsEvent alloc] initWithContextName:&stru_1F2740B58 contextType:v15 isStart:0];
          objc_super v17 = [v9 source];
          [v17 sendEvent:v16];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v12);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        if (([v10 containsObject:v23] & 1) == 0)
        {
          v24 = [[ATXContextHeuristicsEvent alloc] initWithContextName:&stru_1F2740B58 contextType:v23 isStart:1];
          v25 = [v9 source];
          [v25 sendEvent:v24];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v20);
  }
}

- (id)_contextHeuristicsClientModel
{
  id v2 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:44];
  id v3 = objc_alloc(MEMORY[0x1E4F93940]);
  id v4 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v5 = [v4 blendingLayerServer];
  id v6 = (void *)[v3 initWithClientModelId:v2 blendingLayerServer:v5];

  return v6;
}

- (id)_cachedContextsFromSuggestions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = 0;
        v16 = &v15;
        uint64_t v17 = 0x3032000000;
        id v18 = __Block_byref_object_copy__106;
        uint64_t v19 = __Block_byref_object_dispose__106;
        id v20 = (id)objc_opt_new();
        uint64_t v9 = [v8 uiSpecification];
        uint64_t v10 = [v9 predictionReasons];

        if (v10)
        {
          uint64_t v11 = [v8 uiSpecification];
          [v11 predictionReasons];
          ATXSuggestionPredictionReasonEnumerateReasonCodes();
        }
        [v4 addObject:v16[5]];
        _Block_object_dispose(&v15, 8);
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  uint64_t v12 = (void *)[v4 copy];
  return v12;
}

void __61__ATXContextHeuristicsServer__cachedContextsFromSuggestions___block_invoke(uint64_t a1)
{
  stringForATXSuggestionPredictionReasonCode();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:v2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsScheduler, 0);
  objc_storeStrong((id *)&self->_heuristics, 0);
}

- (void)initWithHeuristics:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXContextHeuristicsServer: must be class C unlocked.", v1, 2u);
}

void __49__ATXContextHeuristicsServer_initWithHeuristics___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXContextHeuristicsServer: context heuristics failed to refresh at intialization.", v1, 2u);
}

void __87__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromContextHeuristics___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXContextHeuristicsServer: Blending update context heuristics failed due to error %{public}@", (uint8_t *)&v2, 0xCu);
}

void __86__ATXContextHeuristicsServer__updateBlendingLayerWithSuggestionsFromSpotlightRecents___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXContextHeuristicsServer: Blending update spotlight recents failed due to error %{public}@", (uint8_t *)&v2, 0xCu);
}

@end