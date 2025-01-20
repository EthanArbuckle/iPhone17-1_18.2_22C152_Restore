@interface ATXInfoSuggestionServer
+ (id)sharedInstance;
- (ATXInfoSuggestionServer)initWithInfoEngine:(id)a3 rsSuggestionProducer:(id)a4 infoHeuristics:(id)a5 criterionRegistry:(id)a6 xpcListener:(id)a7;
- (ATXInformationEngine)infoEngine;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_processIncomingSuggestion:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5;
- (id)_processIncomingSuggestions:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5;
- (void)_addSuggestions:(id)a3 forSourceIdentifier:(id)a4 needReset:(BOOL)a5 errorHandler:(id)a6;
- (void)clearSuggestionsForInfoSourceIdentifier:(id)a3 errorHandler:(id)a4;
- (void)dealloc;
- (void)getSuggestionsForInfoSourceIdentifier:(id)a3 withReply:(id)a4;
- (void)informationHeuristics:(id)a3 didUpdateSuggestions:(id)a4 forHeuristic:(id)a5;
- (void)insertSuggesions:(id)a3 forInfoSourceIdentifier:(id)a4 errorHandler:(id)a5;
- (void)overwriteSuggestionsWithProactiveSuggestions:(id)a3 forClientModelIdentifier:(id)a4 completionHandler:(id)a5;
- (void)refreshInfoSuggestionsWithCompletionHandler:(id)a3;
- (void)resetSuggestionsTo:(id)a3 forInfoSourceIdentifier:(id)a4 errorHandler:(id)a5;
- (void)retrieveAvailableCriterionIdentifiersForSourceIdentifier:(id)a3 reply:(id)a4;
- (void)stackDidRotateProactivelyForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4;
- (void)timelineDidReloadForWidget:(id)a3 parentApp:(id)a4 withEntries:(id)a5 completion:(id)a6;
- (void)userDidDismissSuggestion:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5;
@end

@implementation ATXInfoSuggestionServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_36 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_36, &__block_literal_global_194);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_47;
  return v2;
}

void __41__ATXInfoSuggestionServer_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = [ATXInfoSuggestionServer alloc];
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = objc_opt_new();
  id v6 = objc_alloc(MEMORY[0x1E4F29290]);
  v7 = (void *)[v6 initWithMachServiceName:*MEMORY[0x1E4F93A08]];
  uint64_t v8 = [(ATXInfoSuggestionServer *)v1 initWithInfoEngine:v2 rsSuggestionProducer:v3 infoHeuristics:v4 criterionRegistry:v5 xpcListener:v7];
  v9 = (void *)sharedInstance__pasExprOnceResult_47;
  sharedInstance__pasExprOnceResult_47 = v8;
}

- (ATXInfoSuggestionServer)initWithInfoEngine:(id)a3 rsSuggestionProducer:(id)a4 infoHeuristics:(id)a5 criterionRegistry:(id)a6 xpcListener:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXInfoSuggestionServer;
  v17 = [(ATXInfoSuggestionServer *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_xpcListener, a7);
    [(NSXPCListener *)v18->_xpcListener setDelegate:v18];
    [(NSXPCListener *)v18->_xpcListener resume];
    objc_storeStrong((id *)&v18->_criterionRegistry, a6);
    objc_storeStrong((id *)&v18->_engine, a3);
    objc_storeStrong((id *)&v18->_relevantShortcutSuggestionProducer, a4);
    objc_storeStrong((id *)&v18->_informationHeuristics, a5);
    [(ATXInformationHeuristics *)v18->_informationHeuristics setDelegate:v18];
    [(ATXInformationHeuristics *)v18->_informationHeuristics refreshResultsForAllHeuristicsPendingRefreshWithCompletionHandler:&__block_literal_global_18_2];
  }

  return v18;
}

void __112__ATXInfoSuggestionServer_initWithInfoEngine_rsSuggestionProducer_infoHeuristics_criterionRegistry_xpcListener___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    v2 = __atxlog_handle_gi();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __112__ATXInfoSuggestionServer_initWithInfoEngine_rsSuggestionProducer_infoHeuristics_criterionRegistry_xpcListener___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)dealloc
{
  [(NSXPCListener *)self->_xpcListener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ATXInfoSuggestionServer;
  [(ATXInfoSuggestionServer *)&v3 dealloc];
}

- (void)refreshInfoSuggestionsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  informationHeuristics = self->_informationHeuristics;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E68AEE28;
  id v8 = v4;
  id v6 = v4;
  [(ATXInformationHeuristics *)informationHeuristics refreshResultsForAllHeuristicsWithCompletionHandler:v7];
}

uint64_t __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    objc_super v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ATXInformationEngine)infoEngine
{
  return self->_engine;
}

- (id)_processIncomingSuggestion:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(ATXInfoSuggestionCriterionRegistry *)self->_criterionRegistry isSourceIdentifierRegistered:v9])
  {
    if (a5)
    {
      NSErrorForInvalidInfoSourceIdentifier(v9);
      id v24 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  criterionRegistry = self->_criterionRegistry;
  v11 = [v8 criterion];
  uint64_t v12 = [(ATXInfoSuggestionCriterionRegistry *)criterionRegistry confidenceLevelForCriterion:v11 sourceIdentifier:v9];

  if ((unint64_t)(v12 + 1) <= 1)
  {
    if (a5)
    {
      id v13 = [v8 criterion];
      id v14 = (objc_class *)NSString;
      id v15 = v9;
      id v16 = [v14 alloc];
      if (v12)
      {
        v17 = (void *)[v16 initWithFormat:@"criterion \"%@\" of \"%@\" is disabled", v13, v15];

        v18 = (objc_class *)MEMORY[0x1E4F28C58];
        id v19 = v17;
        id v20 = [v18 alloc];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34[0] = v19;
        objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];

        v22 = v20;
        uint64_t v23 = -5;
      }
      else
      {
        v28 = (void *)[v16 initWithFormat:@"criterion \"%@\" of \"%@\" is invalid", v13, v15];

        v29 = (objc_class *)MEMORY[0x1E4F28C58];
        id v19 = v28;
        id v30 = [v29 alloc];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34[0] = v19;
        objc_super v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];

        v22 = v30;
        uint64_t v23 = -2;
      }
      v31 = (void *)[v22 initWithDomain:@"ATXInfoSuggestionServerErrorDomain" code:v23 userInfo:v21];

      *a5 = v31;
    }
LABEL_13:
    id v24 = 0;
    goto LABEL_14;
  }
  [v8 setConfidenceLevel:v12];
  [v8 setSourceIdentifier:v9];
  v25 = [v8 suggestionIdentifier];

  if (!v25)
  {
    v26 = [MEMORY[0x1E4F29128] UUID];
    v27 = [v26 UUIDString];
    [v8 setSuggestionIdentifier:v27];
  }
  id v24 = v8;
LABEL_14:

  return v24;
}

- (id)_processIncomingSuggestions:(id)a3 sourceIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = -[ATXInfoSuggestionServer _processIncomingSuggestion:sourceIdentifier:error:](self, "_processIncomingSuggestion:sourceIdentifier:error:", *(void *)(*((void *)&v20 + 1) + 8 * i), v9, a5, (void)v20);
        if (!v16)
        {

          id v18 = 0;
          goto LABEL_11;
        }
        v17 = (void *)v16;
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v18 = v10;
LABEL_11:

  return v18;
}

- (void)_addSuggestions:(id)a3 forSourceIdentifier:(id)a4 needReset:(BOOL)a5 errorHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = (void (**)(id, id))a6;
  id v16 = 0;
  uint64_t v12 = [(ATXInfoSuggestionServer *)self _processIncomingSuggestions:a3 sourceIdentifier:v10 error:&v16];
  id v13 = v16;
  if (v12)
  {
    engine = self->_engine;
    if (v7) {
      [(ATXInformationEngine *)engine resetSuggestionsTo:v12 forInfoSourceIdentifier:v10 completionHandler:v11];
    }
    else {
      [(ATXInformationEngine *)engine insertSuggestions:v12 forInfoSourceIdentifier:v10 completionHandler:v11];
    }
  }
  else
  {
    id v15 = __atxlog_handle_gi();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestionServer _addSuggestions:forSourceIdentifier:needReset:errorHandler:]();
    }

    v11[2](v11, v13);
  }
}

- (void)insertSuggesions:(id)a3 forInfoSourceIdentifier:(id)a4 errorHandler:(id)a5
{
}

- (void)resetSuggestionsTo:(id)a3 forInfoSourceIdentifier:(id)a4 errorHandler:(id)a5
{
}

- (void)getSuggestionsForInfoSourceIdentifier:(id)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, void, void *))a4;
  criterionRegistry = self->_criterionRegistry;
  id v8 = a3;
  if ([(ATXInfoSuggestionCriterionRegistry *)criterionRegistry isSourceIdentifierRegistered:v8])
  {
    [(ATXInformationEngine *)self->_engine getSuggestionsForInfoSourceIdentifier:v8 withReply:v6];
    id v9 = v8;
  }
  else
  {
    id v9 = NSErrorForInvalidInfoSourceIdentifier(v8);

    id v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestionServer getSuggestionsForInfoSourceIdentifier:withReply:]();
    }

    v6[2](v6, 0, v9);
  }
}

- (void)clearSuggestionsForInfoSourceIdentifier:(id)a3 errorHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  criterionRegistry = self->_criterionRegistry;
  id v8 = a3;
  if ([(ATXInfoSuggestionCriterionRegistry *)criterionRegistry isSourceIdentifierRegistered:v8])
  {
    [(ATXInformationEngine *)self->_engine clearSuggestionsForInfoSourceIdentifier:v8 completionHandler:v6];
    id v9 = v8;
  }
  else
  {
    id v9 = NSErrorForInvalidInfoSourceIdentifier(v8);

    id v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestionServer clearSuggestionsForInfoSourceIdentifier:errorHandler:]();
    }

    v6[2](v6, v9);
  }
}

- (void)overwriteSuggestionsWithProactiveSuggestions:(id)a3 forClientModelIdentifier:(id)a4 completionHandler:(id)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v36 = a5;
  id v9 = __atxlog_handle_gi();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = [v7 count];
    __int16 v48 = 2114;
    id v49 = v8;
    _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: receive %d suggestion(s) from ATXClientModel %{public}@", buf, 0x12u);
  }

  id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1D25F6CC0]();
        uint64_t v18 = [objc_alloc(MEMORY[0x1E4F938F0]) initWithProactiveSuggestion:v16];
        if (!v18)
        {
          uint64_t v25 = (objc_class *)NSString;
          id v26 = v16;
          v27 = (void *)[[v25 alloc] initWithFormat:@"Failed to convert ATXProactiveSuggestion to ATXInfoSuggestion: %@", v26];

          v28 = (objc_class *)MEMORY[0x1E4F28C58];
          id v29 = v27;
          id v30 = [v28 alloc];
          v50[0] = *MEMORY[0x1E4F28568];
          *(void *)buf = v29;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v50 count:1];

          v32 = (void *)[v30 initWithDomain:@"ATXInfoSuggestionServerErrorDomain" code:-4 userInfo:v31];
          uint64_t v33 = __atxlog_handle_gi();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
            -[ATXInfoSuggestionServer overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:]();
          }

          id v24 = v36;
          (*((void (**)(id, void, void *))v36 + 2))(v36, 0, v32);

          id v22 = v11;
          goto LABEL_20;
        }
        id v19 = (void *)v18;
        long long v20 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:18];
        [v19 setClientModelId:v20];

        [v10 addObject:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  id v41 = 0;
  long long v21 = [(ATXInfoSuggestionServer *)self _processIncomingSuggestions:v10 sourceIdentifier:v8 error:&v41];
  id v22 = v41;
  if (v21)
  {
    engine = self->_engine;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke;
    v37[3] = &unk_1E68B49B0;
    id v38 = v21;
    id v39 = v8;
    id v24 = v36;
    id v40 = v36;
    [(ATXInformationEngine *)engine resetSuggestionsTo:v38 forInfoSourceIdentifier:v39 completionHandler:v37];
  }
  else
  {
    v34 = __atxlog_handle_gi();
    id v24 = v36;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestionServer overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:]();
    }

    (*((void (**)(id, void, id))v36 + 2))(v36, 0, v22);
  }

LABEL_20:
}

void __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    objc_super v3 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v3();
  }
  else
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = *(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = objc_msgSend(MEMORY[0x1E4F938F0], "proactiveSuggestionForInfoSuggestion:withClientModelId:clientModelVersion:rawScore:confidenceCategory:", *(void *)(*((void *)&v13 + 1) + 8 * i), *(void *)(a1 + 40), @"1.0", 0, 0.0, (void)v13);
          if (!v10)
          {
            uint64_t v12 = __atxlog_handle_gi();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
              __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke_cold_1(v12);
            }

            (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
            goto LABEL_17;
          }
          id v11 = (void *)v10;
          [v4 addObject:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_17:
  }
}

- (void)retrieveAvailableCriterionIdentifiersForSourceIdentifier:(id)a3 reply:(id)a4
{
  criterionRegistry = self->_criterionRegistry;
  uint64_t v7 = (void (**)(id, id, void))a4;
  id v8 = a3;
  if ([(ATXInfoSuggestionCriterionRegistry *)criterionRegistry isSourceIdentifierRegistered:v8])
  {
    id v11 = [(ATXInfoSuggestionCriterionRegistry *)self->_criterionRegistry availableCriterionIdentifiersForSourceIdentifier:v8];

    v7[2](v7, v11, 0);
  }
  else
  {
    id v9 = NSErrorForInvalidInfoSourceIdentifier(v8);

    uint64_t v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestionServer retrieveAvailableCriterionIdentifiersForSourceIdentifier:reply:]();
    }

    ((void (**)(id, id, void *))v7)[2](v7, 0, v9);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F93A08];
  uint64_t v7 = [v5 valueForEntitlement:*MEMORY[0x1E4F93A08]];
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0 && ([v7 BOOLValue] & 1) != 0)
  {
    id v8 = ATXInfoSuggestionXPCInterface();
    [v5 setExportedInterface:v8];

    [v5 setExportedObject:self];
    [v5 setInterruptionHandler:&__block_literal_global_32_1];
    [v5 setInvalidationHandler:&__block_literal_global_35_2];
    [v5 resume];
    id v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v5;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: accepts XPC connection: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    BOOL v10 = 1;
  }
  else
  {
    id v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXInfoSuggestionServer listener:shouldAcceptNewConnection:]((uint64_t)v5, v6, v9);
    }
    BOOL v10 = 0;
  }

  return v10;
}

void __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke()
{
  v0 = __atxlog_handle_gi();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_33()
{
  v0 = __atxlog_handle_gi();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: XPC connection invalidated.", v1, 2u);
  }
}

- (void)userDidDismissSuggestion:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5
{
}

- (void)stackDidRotateProactivelyForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4
{
}

- (void)timelineDidReloadForWidget:(id)a3 parentApp:(id)a4 withEntries:(id)a5 completion:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = __atxlog_handle_xpc();
  os_signpost_id_t v15 = os_signpost_id_generate(v14);

  long long v16 = __atxlog_handle_xpc();
  v17 = v16;
  unint64_t v18 = v15 - 1;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "_timelineDidUpdateForWidget", " enableTelemetry=YES ", buf, 2u);
  }

  id v19 = @"entries";
  if ([v12 count] && (unint64_t)objc_msgSend(v12, "count") <= 1) {
    id v19 = @"entry";
  }
  os_signpost_id_t spid = v15;
  long long v20 = v19;
  long long v21 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = objc_msgSend(v12, "count", spid);
    *(_DWORD *)buf = 138413058;
    uint64_t v43 = (uint64_t)v10;
    __int16 v44 = 2112;
    long long v45 = v11;
    __int16 v46 = 2048;
    uint64_t v47 = v22;
    __int16 v48 = 2112;
    id v49 = v20;
    _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: timelineDidReloadForWidget:appBundleId:entries:completion called with widget: %@, appBundleId: %@ and %lu %@", buf, 0x2Au);
  }
  id v39 = v20;
  id v40 = v11;

  long long v23 = [ATXTimelineRelevance alloc];
  criterionRegistry = self->_criterionRegistry;
  uint64_t v25 = [(ATXInformationEngine *)self->_engine abuseControlConfig];
  id v41 = v10;
  id v26 = [(ATXTimelineRelevance *)v23 initWithWidget:v10 criterionRegistry:criterionRegistry abuseControlConfig:v25];

  [(ATXTimelineRelevance *)v26 setDelegate:self->_engine];
  v27 = [(ATXTimelineRelevance *)v26 sourceId];
  v28 = [(ATXInformationEngine *)self->_engine latestInfoSuggestionRelevantNowForSourceId:v27];
  engine = self->_engine;
  id v30 = [v28 suggestionIdentifier];
  [(ATXInformationEngine *)engine deleteAllSuggestionsForSourceId:v27 excludingSuggestionId:v30];

  v31 = [(ATXTimelineRelevance *)v26 infoSuggestionsFromTimelineEntries:v12 latestInfoSuggestionRelevantNow:v28];
  v32 = @"suggestions";
  if ((unint64_t)[v31 count] <= 1 && objc_msgSend(v31, "count")) {
    v32 = @"suggestion";
  }
  uint64_t v33 = v32;
  v34 = __atxlog_handle_timeline();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v35 = [v31 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v43 = v35;
    __int16 v44 = 2112;
    long long v45 = v33;
    _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEFAULT, "ATXInfoSuggestionServer: Sending %lu %@ to the InformationEngine", buf, 0x16u);
  }

  [(ATXInformationEngine *)self->_engine insertSuggestions:v31 forInfoSourceIdentifier:v27 completionHandler:v13];
  id v36 = __atxlog_handle_xpc();
  v37 = v36;
  if (v18 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0FA3000, v37, OS_SIGNPOST_INTERVAL_END, spid, "_timelineDidUpdateForWidget", " enableTelemetry=YES ", buf, 2u);
  }
}

- (void)informationHeuristics:(id)a3 didUpdateSuggestions:(id)a4 forHeuristic:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F494B8] sourceIdentifierForHeuristicWithName:a5];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        os_signpost_id_t v15 = objc_msgSend(MEMORY[0x1E4F93940], "clientModelIdFromClientModelType:", 18, (void)v16);
        [v14 setClientModelId:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [(ATXInfoSuggestionServer *)self resetSuggestionsTo:v9 forInfoSourceIdentifier:v8 errorHandler:&__block_literal_global_50_1];
}

void __83__ATXInfoSuggestionServer_informationHeuristics_didUpdateSuggestions_forHeuristic___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    uint64_t v3 = __atxlog_handle_gi();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __83__ATXInfoSuggestionServer_informationHeuristics_didUpdateSuggestions_forHeuristic___block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_informationHeuristics, 0);
  objc_storeStrong((id *)&self->_criterionRegistry, 0);
  objc_storeStrong((id *)&self->_relevantShortcutSuggestionProducer, 0);
  objc_storeStrong((id *)&self->_engine, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
}

void __112__ATXInfoSuggestionServer_initWithInfoEngine_rsSuggestionProducer_infoHeuristics_criterionRegistry_xpcListener___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __71__ATXInfoSuggestionServer_refreshInfoSuggestionsWithCompletionHandler___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addSuggestions:forSourceIdentifier:needReset:errorHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)getSuggestionsForInfoSourceIdentifier:withReply:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)clearSuggestionsForInfoSourceIdentifier:errorHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_12();
  _os_log_fault_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_FAULT, "ATXInfoSuggestionServer %s: %{public}@", (uint8_t *)v1, 0x16u);
}

void __115__ATXInfoSuggestionServer_overwriteSuggestionsWithProactiveSuggestions_forClientModelIdentifier_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 136315138;
  uint64_t v2 = "-[ATXInfoSuggestionServer overwriteSuggestionsWithProactiveSuggestions:forClientModelIdentifier:completionHandler:]_block_invoke";
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXInfoSuggestionServer %s: error converting ATXProactiveSuggestion to ATXProactiveSuggestion", (uint8_t *)&v1, 0xCu);
}

- (void)retrieveAvailableCriterionIdentifiersForSourceIdentifier:reply:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_5(&dword_1D0FA3000, v0, v1, "ATXInfoSuggestionServer %s: %{public}@", v2, v3, v4, v5, 2u);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXInfoSuggestionServer: Rejecting connection %{public}@ without entitlement %{public}@", (uint8_t *)&v3, 0x16u);
}

void __62__ATXInfoSuggestionServer_listener_shouldAcceptNewConnection___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __83__ATXInfoSuggestionServer_informationHeuristics_didUpdateSuggestions_forHeuristic___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "Error donating suggestions through heuristics: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end