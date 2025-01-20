@interface ATXActionBlendingUpdater
+ (double)generateScoreForFallbackActionKey:(id)a3 fallbackAction:(id)a4 penalizedFallbackActions:(id)a5;
+ (id)clientModelIdForConsumerSubType:(unsigned __int8)a3;
+ (void)updateBlendingLayerWithBehavioralPredictions:(id)a3 feedbackMetadata:(id)a4 consumerSubType:(unsigned __int8)a5;
+ (void)updateBlendingLayerWithFallbackActions;
+ (void)updateBlendingLayerWithHeuristicPredictions:(id)a3;
+ (void)updateBlendingLayerWithLockscreenActions:(id)a3 feedbackMetadata:(id)a4;
+ (void)updateBlendingLayerWithRecentShortcuts:(id)a3;
@end

@implementation ATXActionBlendingUpdater

+ (id)clientModelIdForConsumerSubType:(unsigned __int8)a3
{
  int v5 = a3;
  v6 = 0;
  if ((int)a3 > 37)
  {
    if (a3 == 46)
    {
      uint64_t v7 = 48;
    }
    else
    {
      if (a3 != 38) {
        goto LABEL_4;
      }
      uint64_t v7 = 7;
    }
  }
  else
  {
    uint64_t v7 = 6;
    if ((v5 - 18) >= 4 && v5 != 16)
    {
LABEL_4:
      return v6;
    }
  }
  v6 = objc_msgSend(MEMORY[0x1E4F93940], "clientModelIdFromClientModelType:", v7, v3);
  return v6;
}

+ (void)updateBlendingLayerWithRecentShortcuts:(id)a3
{
  id v8 = a3;
  uint64_t v3 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:11];
  id v4 = objc_alloc(MEMORY[0x1E4F93940]);
  int v5 = +[ATXClientModelSuggestionReceiver sharedInstance];
  v6 = [v5 blendingLayerServer];
  uint64_t v7 = (void *)[v4 initWithClientModelId:v3 blendingLayerServer:v6];

  [v7 updateSuggestions:v8];
}

+ (void)updateBlendingLayerWithBehavioralPredictions:(id)a3 feedbackMetadata:(id)a4 consumerSubType:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v7 = a3;
  id v8 = a4;
  v9 = +[_ATXGlobals sharedInstance];
  v10 = +[ATXActionBlendingUpdater clientModelIdForConsumerSubType:v5];
  if (v10)
  {
    v11 = [v9 actionPredictionBlendingModelVersion];
    id v12 = objc_alloc(MEMORY[0x1E4F93940]);
    v13 = +[ATXClientModelSuggestionReceiver sharedInstance];
    v14 = [v13 blendingLayerServer];
    v15 = (void *)[v12 initWithClientModelId:v10 blendingLayerServer:v14];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v10 clientModelVersion:v11 engagementResetPolicy:0];
    v17 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromActionResults:v7 clientModelSpec:v16];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke;
    v18[3] = &__block_descriptor_33_e20_v20__0B8__NSError_12l;
    char v19 = v5;
    [v15 updateSuggestions:v17 feedbackMetadata:v8 completionHandler:v18];
  }
}

void __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 32)];
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated blending for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    v6 = __atxlog_handle_default();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:*(unsigned __int8 *)(a1 + 32)];
      __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke_cold_1(v8, (uint64_t)v5, (uint8_t *)&v9, v6);
    }
  }
}

+ (void)updateBlendingLayerWithHeuristicPredictions:(id)a3
{
  id v12 = a3;
  uint64_t v3 = +[_ATXGlobals sharedInstance];
  id v4 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:3];
  id v5 = [v3 heuristicPredictionBlendingModelVersion];
  id v6 = objc_alloc(MEMORY[0x1E4F93940]);
  id v7 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v8 = [v7 blendingLayerServer];
  int v9 = (void *)[v6 initWithClientModelId:v4 blendingLayerServer:v8];

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v4 clientModelVersion:v5 engagementResetPolicy:1];
  uint64_t v11 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromHeuristicActionResults:v12 clientModelSpec:v10];
  [v9 updateSuggestions:v11];
}

+ (void)updateBlendingLayerWithFallbackActions
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v26 = +[_ATXGlobals sharedInstance];
  v25 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:10];
  id v2 = objc_alloc(MEMORY[0x1E4F93940]);
  uint64_t v3 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v4 = [v3 blendingLayerServer];
  v22 = (void *)[v2 initWithClientModelId:v25 blendingLayerServer:v4];

  v23 = [v26 actionFallbacksBlendingModelVersion];
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v25 clientModelVersion:v23 engagementResetPolicy:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F4B050]) initWithClientModelSpec:v24];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = [v26 penalizedFallbackActions];
  v28 = [v6 setWithArray:v7];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v29 = objc_opt_new();
  id v8 = [v26 enabledFallbackActions];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v13 = objc_msgSend(v5, "suggestionforSpecifiedFallbackActionType:", objc_msgSend(MEMORY[0x1E4F4B050], "fallbackActionTypeForString:", v12, v22));
        v14 = v13;
        if (v13)
        {
          v15 = [v13 executableSpecification];
          v16 = [v15 executableObject];

          v17 = [v16 actionKey];
          [a1 generateScoreForFallbackActionKey:v17 fallbackAction:v12 penalizedFallbackActions:v28];
          double v19 = v18;
          v20 = [v14 scoreSpecification];
          [v20 setRawScore:v19];

          [v29 addObject:v14];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v9);
  }

  [v29 sortUsingComparator:&__block_literal_global_247];
  v21 = (void *)[v29 copy];
  [v22 updateSuggestions:v21];
}

uint64_t __66__ATXActionBlendingUpdater_updateBlendingLayerWithFallbackActions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = NSNumber;
  id v6 = [a3 scoreSpecification];
  [v6 rawScore];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  id v8 = NSNumber;
  uint64_t v9 = [v4 scoreSpecification];
  [v9 rawScore];
  uint64_t v10 = objc_msgSend(v8, "numberWithDouble:");
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

+ (double)generateScoreForFallbackActionKey:(id)a3 fallbackAction:(id)a4 penalizedFallbackActions:(id)a5
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[_ATXGlobals sharedInstance];
  uint64_t v11 = +[_ATXAppLaunchHistogramManager sharedInstance];
  uint64_t v12 = [v11 histogramForLaunchType:90];
  v13 = [v11 histogramForLaunchType:91];
  v27[0] = v7;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  [v12 totalLaunchesForBundleIds:v14];
  double v16 = v15;

  id v26 = v7;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v13 totalLaunchesForBundleIds:v17];
  double v19 = v18;

  [v12 totalLaunches];
  double v21 = v20;
  [v13 totalLaunches];
  +[_ATXActionUtils computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:](_ATXActionUtils, "computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:", [v10 fallbackActionsEngagementPriorAlpha], objc_msgSend(v10, "fallbackActionsEngagementPriorBeta"), v16, v19, v21, v22);
  double v24 = v23;
  if ([v9 containsObject:v8]) {
    double v24 = v24 + -10000.0;
  }

  return v24;
}

+ (void)updateBlendingLayerWithLockscreenActions:(id)a3 feedbackMetadata:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = +[_ATXGlobals sharedInstance];
  id v8 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:9];
  id v9 = objc_alloc(MEMORY[0x1E4F93940]);
  uint64_t v10 = +[ATXClientModelSuggestionReceiver sharedInstance];
  uint64_t v11 = [v10 blendingLayerServer];
  uint64_t v12 = (void *)[v9 initWithClientModelId:v8 blendingLayerServer:v11];

  v13 = [v7 actionPredictionBlendingModelVersion];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F93948]) initWithClientModelId:v8 clientModelVersion:v13 engagementResetPolicy:0];
  double v15 = __atxlog_handle_blending();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "lockscreen: converting actions to proactive suggestions: %@", (uint8_t *)&v18, 0xCu);
  }

  double v16 = +[ATXProactiveSuggestionBuilder proactiveSuggestionsForLockscreenActions:v5 clientModelSpec:v14];
  v17 = __atxlog_handle_blending();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v16;
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "lockscreen: Sending suggestions to blending: %@", (uint8_t *)&v18, 0xCu);
  }

  [v12 updateSuggestions:v16 feedbackMetadata:v6 completionHandler:&__block_literal_global_29_5];
}

void __86__ATXActionBlendingUpdater_updateBlendingLayerWithLockscreenActions_feedbackMetadata___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  if (a2)
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "lockscreen: successfully updated blending for lockscreen action predictions", v6, 2u);
    }
  }
  else
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __86__ATXActionBlendingUpdater_updateBlendingLayerWithLockscreenActions_feedbackMetadata___block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
}

void __106__ATXActionBlendingUpdater_updateBlendingLayerWithBehavioralPredictions_feedbackMetadata_consumerSubType___block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Error updating blending for %@ with error: %@", buf, 0x16u);
}

void __86__ATXActionBlendingUpdater_updateBlendingLayerWithLockscreenActions_feedbackMetadata___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "lockscreen: error updating blending with error: %@", (uint8_t *)&v2, 0xCu);
}

@end