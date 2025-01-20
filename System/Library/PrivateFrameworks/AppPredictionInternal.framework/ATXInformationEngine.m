@interface ATXInformationEngine
- (ATXInformationEngine)init;
- (ATXInformationEngine)initWithFilter:(id)a3 featurizer:(id)a4 ranker:(id)a5 infoStore:(id)a6 confidenceMapper:(id)a7 abuseControlConfig:(id)a8 featureWeights:(id)a9;
- (ATXTimelineAbuseControlConfig)abuseControlConfig;
- (BOOL)_currentActivePredictionsContainSuggestionFromSourceId:(id)a3 guardedData:(id)a4;
- (BOOL)_shouldSkipRefreshForOldSuggestions:(id)a3 newSuggestions:(id)a4;
- (BOOL)deleteAllSuggestionsForSourceId:(id)a3 excludingSuggestionId:(id)a4;
- (BOOL)shouldSkipUpdatingPredictionRefreshDateForPreviouslyScheduledDate:(id)a3 newDate:(id)a4;
- (id)_clearSuggestionsForInfoSourceIdentifier:(id)a3;
- (id)_insertSuggestions:(id)a3 forInfoSourceIdentifier:(id)a4;
- (id)_proactiveSuggestionFromScoredInfoSuggestion:(id)a3 clientModelId:(id)a4 clientModelVersion:(id)a5;
- (id)_widgetIdentitiesFromInfoSuggestions:(id)a3;
- (id)allInfoSuggestions;
- (id)allInfoSuggestionsForSourceId:(id)a3;
- (id)allRelevantInfoSuggestions;
- (id)currentPredictions;
- (id)forceUpdateAndReturnPredictions;
- (id)latestInfoSuggestionRelevantNowForSourceId:(id)a3;
- (id)latestUpdateDateForSourceId:(id)a3;
- (id)scheduledPredictionRefreshDate;
- (int64_t)_clientModelTypeForInfoSuggestion:(id)a3;
- (unint64_t)countOfInfoSuggestionsForBundleId:(id)a3;
- (unint64_t)countOfInfoSuggestionsForSourceId:(id)a3;
- (void)_pushPredictionsToBlendingLayer:(id)a3 forClientModel:(id)a4 withClientModelVersion:(id)a5;
- (void)_pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:(id)a3 forClientModel:(id)a4 withClientModelVersion:(id)a5 cachedSuggestions:(id)a6;
- (void)_pushSuggestionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:(id)a3 cachedSuggestions:(id)a4;
- (void)_schedulePredictionUpdateNoLaterThanDate:(id)a3 guardedData:(id)a4;
- (void)_storeCachedSuggestionsWithoutIntents:(id)a3 withGuardedData:(id)a4;
- (void)_updateClientModelWithClientModelId:(id)a3 withSuggestions:(id)a4;
- (void)_updatePredictionRefreshDateIfNecessaryForSuggestions:(id)a3;
- (void)_updatePredictionsWithGuardedData:(id)a3;
- (void)clearSuggestionsForInfoSourceIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getSuggestionsForInfoSourceIdentifier:(id)a3 withReply:(id)a4;
- (void)handleProactiveStackRotationForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4;
- (void)handleSuggestionDismissal:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5;
- (void)insertSuggestions:(id)a3 forInfoSourceIdentifier:(id)a4 completionHandler:(id)a5;
- (void)recordRecentTimelineEntries:(id)a3 forWidget:(id)a4;
- (void)resetSuggestionsTo:(id)a3 forInfoSourceIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation ATXInformationEngine

- (ATXInformationEngine)init
{
  v3 = [MEMORY[0x1E4F4B0E8] sharedInstance];
  v4 = objc_opt_new();
  v5 = [[ATXInformationFilter alloc] initWithStore:v3 abuseControlConfig:v4];
  v6 = objc_opt_new();
  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  v10 = [(ATXInformationEngine *)self initWithFilter:v5 featurizer:v6 ranker:v7 infoStore:v3 confidenceMapper:v8 abuseControlConfig:v4 featureWeights:v9];

  return v10;
}

- (ATXInformationEngine)initWithFilter:(id)a3 featurizer:(id)a4 ranker:(id)a5 infoStore:(id)a6 confidenceMapper:(id)a7 abuseControlConfig:(id)a8 featureWeights:(id)a9
{
  id v43 = a3;
  id v42 = a4;
  id v41 = a5;
  id v40 = a6;
  id v39 = a7;
  id v16 = a8;
  id v17 = a9;
  v48.receiver = self;
  v48.super_class = (Class)ATXInformationEngine;
  v18 = [(ATXInformationEngine *)&v48 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_confidenceMapper, a7);
    objc_storeStrong((id *)&v19->_store, a6);
    objc_storeStrong((id *)&v19->_filter, a3);
    objc_storeStrong((id *)&v19->_featurizer, a4);
    objc_storeStrong((id *)&v19->_ranker, a5);
    objc_storeStrong((id *)&v19->_abuseControlConfig, a8);
    objc_storeStrong((id *)&v19->_featureWeights, a9);
    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.proactive.ATXInformationEngine.internal", v20);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v21;

    v23 = objc_opt_new();
    v24 = (void *)MEMORY[0x1D25F6CC0]();
    uint64_t v25 = [(ATXInformationStore *)v19->_store readCachedSuggestions];
    v26 = (void *)v25;
    if (v25) {
      uint64_t v27 = v25;
    }
    else {
      uint64_t v27 = MEMORY[0x1E4F1CBF0];
    }
    [(ATXInformationEngine *)v19 _storeCachedSuggestionsWithoutIntents:v27 withGuardedData:v23];

    id v28 = objc_alloc(MEMORY[0x1E4F93B80]);
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create("com.apple.proactive.ATXInformationEngine.lock", v29);
    uint64_t v31 = [v28 initWithGuardedData:v23 serialQueue:v30];
    lock = v19->_lock;
    v19->_lock = (_PASQueueLock *)v31;

    objc_initWeak(&location, v19);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke;
    aBlock[3] = &unk_1E68AC2D0;
    objc_copyWeak(&v46, &location);
    v33 = _Block_copy(aBlock);
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4F93B98]) initWithQueue:v19->_queue operation:v33];
    coalescedPredictionUpdateOperation = v19->_coalescedPredictionUpdateOperation;
    v19->_coalescedPredictionUpdateOperation = (_PASSimpleCoalescingTimer *)v34;

    [(_PASSimpleCoalescingTimer *)v19->_coalescedPredictionUpdateOperation runAfterDelaySeconds:0 coalescingBehavior:1.0];
    v36 = __atxlog_handle_gi();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v36, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine initialized", buf, 2u);
    }

    v37 = v19;
    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }
  return v19;
}

void __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[3];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_33;
    v5[3] = &unk_1E68B2EF0;
    v6 = WeakRetained;
    [v3 runAsyncWithLockAcquired:v5];
    v4 = v6;
  }
  else
  {
    v4 = __atxlog_handle_gi();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_cold_1(v4);
    }
  }
}

uint64_t __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_33(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updatePredictionsWithGuardedData:a2];
}

- (void)_updatePredictionsWithGuardedData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v5 = (void *)os_transaction_create();
  v6 = __atxlog_handle_gi();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v25 = "-[ATXInformationEngine _updatePredictionsWithGuardedData:]";
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: %s", buf, 0xCu);
  }

  v7 = [(ATXInformationStore *)self->_store deleteExpiredSuggestions];
  [(ATXInformationStore *)self->_store addAbuseControlOutcomes:v7];
  v8 = [(ATXInformationStore *)self->_store readCurrentlyRelevantSuggestions];
  v9 = [(ATXInformationFilter *)self->_filter filterInfoSuggestions:v8];
  if ([(ATXInformationEngine *)self _shouldSkipRefreshForOldSuggestions:v4[1] newSuggestions:v9])
  {
    v10 = __atxlog_handle_gi();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: short-circuiting prediction update, as suggestions have not changed", buf, 2u);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D25F6CC0]();
    v12 = [(ATXInformationFeaturizerProtocol *)self->_featurizer featurizeInfoSuggestions:v9];
    v13 = [(ATXInformationRankerProtocol *)self->_ranker sortFeaturizedSuggestions:v12 withFeatureWeights:self->_featureWeights];
    v14 = __atxlog_handle_gi();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v13 count];
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v15;
      _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_INFO, "ATXInformationEngine: number of relevant suggestion(s): %d", buf, 8u);
    }

    [(ATXInformationEngine *)self _pushSuggestionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:v13 cachedSuggestions:v4[1]];
    id v16 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_140);
    if ([(ATXInformationStore *)self->_store writeCacheWithNewSuggestions:v16])[(ATXInformationEngine *)self _storeCachedSuggestionsWithoutIntents:v16 withGuardedData:v4]; {
  }
    }
  id v17 = [(ATXInformationStore *)self->_store earliestFutureSuggestionChangeDate];
  v18 = [(ATXInformationStore *)self->_store nextImportantDateAmongTimelineInducedProactiveStackRotationRecords];
  v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v20 = v19;
  if (v17)
  {
    uint64_t v21 = [v19 earlierDate:v17];

    v20 = (void *)v21;
  }
  if (v18)
  {
    uint64_t v22 = [v20 earlierDate:v18];

    v20 = (void *)v22;
  }
  [(ATXInformationEngine *)self _schedulePredictionUpdateNoLaterThanDate:v20 guardedData:v4];
}

uint64_t __58__ATXInformationEngine__updatePredictionsWithGuardedData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 suggestion];
}

- (void)_storeCachedSuggestionsWithoutIntents:(id)a3 withGuardedData:(id)a4
{
  v5 = a4;
  uint64_t v6 = objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_42_1);
  id v7 = (id)v5[1];
  v5[1] = v6;
}

id __78__ATXInformationEngine__storeCachedSuggestionsWithoutIntents_withGuardedData___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)[a2 copyByReplacingIntentWithIndexingHash];
  return v2;
}

- (BOOL)_shouldSkipRefreshForOldSuggestions:(id)a3 newSuggestions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count] || objc_msgSend(v7, "count"))
  {
    if ([v6 count] && objc_msgSend(v7, "count"))
    {
      v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v6];
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
      if ([v8 isEqualToSet:v9])
      {
        char v10 = 1;
      }
      else
      {
        v11 = (void *)[v8 mutableCopy];
        [v11 minusSet:v9];
        v12 = (void *)[v9 mutableCopy];
        [v12 minusSet:v8];
        uint64_t v13 = [v12 count];
        if (v13 == [v11 count])
        {
          v14 = [(ATXInformationEngine *)self _widgetIdentitiesFromInfoSuggestions:v12];
          int v15 = [(ATXInformationEngine *)self _widgetIdentitiesFromInfoSuggestions:v11];
          char v10 = [v14 isEqualToSet:v15];
        }
        else
        {
          char v10 = 0;
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (id)_widgetIdentitiesFromInfoSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedSetWithTransform:", &__block_literal_global_46_0);
}

id __61__ATXInformationEngine__widgetIdentitiesFromInfoSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [NSString alloc];
  v4 = [v2 appBundleIdentifier];
  v5 = [v2 widgetBundleIdentifier];
  id v6 = [v2 widgetKind];
  uint64_t v7 = [v2 intentIndexingHash];
  if (v7)
  {
    uint64_t v8 = [v2 intentIndexingHash];
  }
  else
  {
    v14 = [v2 intent];
    uint64_t v8 = objc_msgSend(v14, "atx_indexingHash");
  }
  uint64_t v9 = [v2 layouts];
  uint64_t v10 = [v2 confidenceLevel];
  v11 = [v2 suggestionIdentifier];
  v12 = (void *)[v3 initWithFormat:@"%@-%@-%@-%lld-%ld-%ld-%@", v4, v5, v6, v8, v9, v10, v11];

  if (!v7) {
  return v12;
  }
}

- (void)_pushSuggestionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:(id)a3 cachedSuggestions:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F93940];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 clientModelIdFromClientModelType:18];
  [(ATXInformationEngine *)self _pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:v8 forClientModel:v9 withClientModelVersion:@"0.1.1" cachedSuggestions:v7];

  id v11 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
  uint64_t v10 = [(ATXTimelineAbuseControlConfig *)self->_abuseControlConfig timelineRelevanceABGroup];
  [(ATXInformationEngine *)self _pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:v8 forClientModel:v11 withClientModelVersion:v10 cachedSuggestions:v7];
}

- (void)_pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate:(id)a3 forClientModel:(id)a4 withClientModelVersion:(id)a5 cachedSuggestions:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  context = (void *)MEMORY[0x1D25F6CC0]();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke;
  v24[3] = &unk_1E68B2F78;
  id v14 = v11;
  id v25 = v14;
  int v15 = objc_msgSend(v10, "_pas_filteredArrayWithTest:", v24);
  id v16 = objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_54_3);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke_3;
  v22[3] = &unk_1E68B2FA0;
  id v17 = v14;
  id v23 = v17;
  v18 = objc_msgSend(v13, "_pas_filteredArrayWithTest:", v22);
  LODWORD(a4) = [(ATXInformationEngine *)self _shouldSkipRefreshForOldSuggestions:v18 newSuggestions:v16];
  v19 = __atxlog_handle_gi();
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v17;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: predictions have NOT changed for the %@ client model. Not pushing update to blending layer", buf, 0xCu);
    }
  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v17;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: predictions have changed for the %@ client model. Pushing update to blending layer", buf, 0xCu);
    }

    [(ATXInformationEngine *)self _pushPredictionsToBlendingLayer:v15 forClientModel:v17 withClientModelVersion:v12];
  }
}

uint64_t __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 suggestion];
  v4 = [v3 clientModelId];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 suggestion];
}

uint64_t __145__ATXInformationEngine__pushPredictionsToBlendingLayerIfDifferentFromTheLastCacheUpdate_forClientModel_withClientModelVersion_cachedSuggestions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 clientModelId];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_pushPredictionsToBlendingLayer:(id)a3 forClientModel:(id)a4 withClientModelVersion:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v8;
  uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v33)
  {
    uint64_t v11 = *(void *)v35;
    id v31 = v9;
    uint64_t v25 = *(void *)v35;
    id v26 = v10;
    v24 = self;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v14 = (void *)MEMORY[0x1D25F6CC0]();
        int v15 = [(ATXInformationEngine *)self _proactiveSuggestionFromScoredInfoSuggestion:v13 clientModelId:v9 clientModelVersion:v10];
        if (v15)
        {
          [v32 addObject:v15];
          id v16 = __atxlog_handle_gi();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v30 = [v13 suggestion];
            id v17 = [v30 suggestionIdentifier];
            v29 = [v13 suggestion];
            v18 = [v29 widgetBundleIdentifier];
            uint64_t v28 = [v13 suggestion];
            v19 = [v28 startDate];
            BOOL v20 = [v13 suggestion];
            uint64_t v21 = [v20 endDate];
            uint64_t v22 = [v15 scoreSpecification];
            uint64_t v23 = [v22 suggestedConfidenceCategory];
            *(_DWORD *)buf = 138413570;
            id v39 = v31;
            __int16 v40 = 2114;
            id v41 = v17;
            __int16 v42 = 2112;
            id v43 = v18;
            __int16 v44 = 2112;
            v45 = v19;
            __int16 v46 = 2112;
            v47 = v21;
            __int16 v48 = 2048;
            uint64_t v49 = v23;
            _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: (%@) pushing suggestion (ID %{public}@) to blending for widget %@, startDate: %@, endDate: %@, blending confidence: %ld", buf, 0x3Eu);

            self = v24;
            uint64_t v11 = v25;

            id v10 = v26;
            id v9 = v31;
          }
        }
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v33);
  }

  [(ATXInformationEngine *)self _updateClientModelWithClientModelId:v9 withSuggestions:v32];
}

- (id)_proactiveSuggestionFromScoredInfoSuggestion:(id)a3 clientModelId:(id)a4 clientModelVersion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [v10 suggestion];
  uint64_t v12 = -[ATXInfoToBlendingConfidenceMapper blendingConfidenceCategoryForInfoConfidenceLevel:](self->_confidenceMapper, "blendingConfidenceCategoryForInfoConfidenceLevel:", [v11 confidenceLevel]);
  id v13 = (void *)MEMORY[0x1E4F938F0];
  [v10 score];
  double v15 = v14;

  id v16 = [v13 proactiveSuggestionForInfoSuggestion:v11 withClientModelId:v9 clientModelVersion:v8 rawScore:v12 confidenceCategory:v15];

  if (!v16)
  {
    id v17 = __atxlog_handle_gi();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ATXInformationEngine _proactiveSuggestionFromScoredInfoSuggestion:clientModelId:clientModelVersion:](v11, v17);
    }
  }
  return v16;
}

- (int64_t)_clientModelTypeForInfoSuggestion:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F93940];
  id v4 = a3;
  uint64_t v5 = [v3 clientModelIdFromClientModelType:19];
  id v6 = [v4 clientModelId];

  LODWORD(v4) = [v6 isEqualToString:v5];
  if (v4) {
    int64_t v7 = 19;
  }
  else {
    int64_t v7 = 18;
  }

  return v7;
}

- (void)_updateClientModelWithClientModelId:(id)a3 withSuggestions:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F93940]);
  id v8 = +[ATXClientModelSuggestionReceiver sharedInstance];
  id v9 = [v8 blendingLayerServer];
  id v10 = (void *)[v7 initWithClientModelId:v5 blendingLayerServer:v9];

  [v10 updateSuggestions:v6];
  uint64_t v11 = __atxlog_handle_gi();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109378;
    v12[1] = [v6 count];
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: InformationClientModel update Blending Layer with %d suggestion(s) for client model: %{public}@", (uint8_t *)v12, 0x12u);
  }
}

- (BOOL)shouldSkipUpdatingPredictionRefreshDateForPreviouslyScheduledDate:(id)a3 newDate:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5
    && ([v5 timeIntervalSinceNow], v7 > -1.0)
    && objc_msgSend(v6, "atx_isOnOrAfterDate:", v5))
  {
    id v8 = __atxlog_handle_gi();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: skip updating prediction refreshDate since the date of previously scheduled XPC activity (%@) is the same or earlier than the new refresh date: %@", (uint8_t *)&v11, 0x16u);
    }

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)_schedulePredictionUpdateNoLaterThanDate:(id)a3 guardedData:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (id *)a4;
  [v6 timeIntervalSinceNow];
  if (v8 < 0.0)
  {
    BOOL v9 = __atxlog_handle_gi();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      double v22 = *(double *)&v6;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: _schedulePredictionUpdateNoLaterThanDate - using current date since the desired refesh date was in the past: %@.", buf, 0xCu);
    }

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];

    id v6 = (id)v10;
  }
  int v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:(double)arc4random_uniform(0x258u) + 1500.0];
  id v12 = [v6 earlierDate:v11];

  if (![(ATXInformationEngine *)self shouldSkipUpdatingPredictionRefreshDateForPreviouslyScheduledDate:v7[2] newDate:v12])
  {
    __int16 v13 = __atxlog_handle_gi();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v7[2];
      *(_DWORD *)buf = 138412546;
      double v22 = *(double *)&v14;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: Updating XPC activity com.apple.duetexpertd.info-pred-update. Previously scheduled prediction refresh date: %@; New prediction refresh date: %@",
        buf,
        0x16u);
    }

    objc_storeStrong(v7 + 2, v12);
    [v12 timeIntervalSinceNow];
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = 0.0;
    }
    if (v16 > 0.0 || ([MEMORY[0x1E4F93B10] isClassCLocked] & 1) != 0)
    {
      id v17 = __atxlog_handle_gi();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v22 = v16;
        _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: Using XPC delay of %f for scheduled XPC update", buf, 0xCu);
      }

      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_int64(v18, (const char *)*MEMORY[0x1E4F14170], (uint64_t)v16);
      xpc_dictionary_set_int64(v18, (const char *)*MEMORY[0x1E4F141A8], 15);
      xpc_dictionary_set_BOOL(v18, (const char *)*MEMORY[0x1E4F14320], 1);
      xpc_dictionary_set_BOOL(v18, (const char *)*MEMORY[0x1E4F14138], 1);
      xpc_dictionary_set_BOOL(v18, (const char *)*MEMORY[0x1E4F142F8], 0);
      xpc_dictionary_set_string(v18, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke;
      handler[3] = &unk_1E68ACF98;
      handler[4] = self;
      xpc_activity_register("com.apple.duetexpertd.info-pred-update", v18, handler);
    }
    else
    {
      v19 = __atxlog_handle_gi();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: Bypassing XPC activity and scheduling update now", buf, 2u);
      }

      xpc_activity_unregister("com.apple.duetexpertd.info-pred-update");
      [(_PASSimpleCoalescingTimer *)self->_coalescedPredictionUpdateOperation runAfterDelaySeconds:0 coalescingBehavior:1.0];
    }
  }
}

void __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    if ([MEMORY[0x1E4F93B10] isClassCLocked])
    {
      id v5 = __atxlog_handle_gi();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke_cold_1(v5);
      }
    }
    else
    {
      id v5 = xpc_activity_copy_criteria(v3);
      double v7 = __atxlog_handle_gi();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E4F142C8]);
        int v9 = 136446210;
        uint64_t v10 = string;
        _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: XPC activity com.apple.duetexpertd.info-pred-update is running with priority: %{public}s", (uint8_t *)&v9, 0xCu);
      }

      [*(id *)(*(void *)(a1 + 32) + 32) runAfterDelaySeconds:0 coalescingBehavior:1.0];
    }
  }
  else
  {
    xpc_activity_state_t v6 = state;
    id v5 = __atxlog_handle_gi();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 134217984;
      uint64_t v10 = (const char *)v6;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: XPC activity com.apple.duetexpertd.info-pred-update updated state: %ld", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)insertSuggestions:(id)a3 forInfoSourceIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    lock = self->_lock;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    _DWORD v12[2] = __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke;
    v12[3] = &unk_1E68B2FC8;
    v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [(_PASQueueLock *)lock runAsyncWithLockAcquired:v12];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

void __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _insertSuggestions:*(void *)(a1 + 40) forInfoSourceIdentifier:*(void *)(a1 + 48)];
  id v5 = __atxlog_handle_gi();
  xpc_activity_state_t v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [*(id *)(a1 + 40) count];
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134218242;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: accepts %lu suggestion(s) from %@", buf, 0x16u);
    }

    int v15 = [*(id *)(a1 + 32) _currentActivePredictionsContainSuggestionFromSourceId:*(void *)(a1 + 48) guardedData:v3];
    double v16 = *(id **)(a1 + 32);
    if (v15) {
      [v16[4] runAfterDelaySeconds:0 coalescingBehavior:1.0];
    }
    else {
      [v16 _updatePredictionRefreshDateIfNecessaryForSuggestions:*(void *)(a1 + 40)];
    }
  }
  id v17 = *(void **)(a1 + 56);
  if (v17)
  {
    xpc_object_t v18 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_61;
    v19[3] = &unk_1E68ABB98;
    id v21 = v17;
    id v20 = v4;
    dispatch_async(v18, v19);
  }
}

uint64_t __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_61(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_insertSuggestions:(id)a3 forInfoSourceIdentifier:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count]
    && ([(ATXInformationStore *)self->_store writeInfoSuggestions:v6] & 1) == 0)
  {
    uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Failed to write suggestions with source id %@ to store", v7];
    uint64_t v10 = (objc_class *)MEMORY[0x1E4F28C58];
    id v11 = v9;
    id v12 = [v10 alloc];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    v16[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

    uint64_t v8 = (void *)[v12 initWithDomain:@"ATXInformationEngineErrorDomain" code:-1 userInfo:v13];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_updatePredictionRefreshDateIfNecessaryForSuggestions:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    lock = self->_lock;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke;
    v7[3] = &unk_1E68B3018;
    uint64_t v8 = v4;
    uint64_t v9 = self;
    [(_PASQueueLock *)lock runAsyncWithLockAcquired:v7];
    id v6 = v8;
  }
  else
  {
    id v6 = __atxlog_handle_gi();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[ATXInformationEngine _updatePredictionRefreshDateIfNecessaryForSuggestions:](v6);
    }
  }
}

void __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__67;
  uint64_t v10 = __Block_byref_object_dispose__67;
  id v11 = [MEMORY[0x1E4F1C9C8] distantFuture];
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke_65;
  v5[3] = &unk_1E68B2FF0;
  void v5[4] = &v6;
  [v4 enumerateObjectsUsingBlock:v5];
  [*(id *)(a1 + 40) _schedulePredictionUpdateNoLaterThanDate:v7[5] guardedData:v3];
  _Block_object_dispose(&v6, 8);
}

void __78__ATXInformationEngine__updatePredictionRefreshDateIfNecessaryForSuggestions___block_invoke_65(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 endDate];
  [v3 timeIntervalSinceNow];
  double v5 = v4;

  if (v5 > 0.0)
  {
    uint64_t v6 = [v10 startDate];
    uint64_t v7 = [v6 earlierDate:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

- (void)resetSuggestionsTo:(id)a3 forInfoSourceIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_1E68B2FC8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v15];
}

void __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = (void *)(a1 + 40);
  double v5 = [*(id *)(*(void *)(a1 + 32) + 48) readAllInfoSuggestionsWithSourceIdentifier:*(void *)(a1 + 40)];
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  if (![*(id *)(a1 + 48) count] || !objc_msgSend(v5, "count"))
  {
    if ([*(id *)(a1 + 48) count])
    {
      double v22 = *(void **)(a1 + 48);
      uint64_t v23 = v7;
    }
    else
    {
      if (![v5 count]) {
        goto LABEL_27;
      }
      uint64_t v23 = v6;
      double v22 = v5;
    }
    [v23 addObjectsFromArray:v22];
    goto LABEL_27;
  }
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:*(void *)(a1 + 48)];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v43 = v5;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v52 + 1) + 8 * i);
        if (([v8 containsObject:v14] & 1) == 0) {
          [v6 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v11);
  }
  id v44 = v3;

  uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v9];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v16 = *(id *)(a1 + 48);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v49 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v48 + 1) + 8 * j);
        if (([v15 containsObject:v21] & 1) == 0) {
          [v7 addObject:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v18);
  }

  double v5 = v43;
  id v3 = v44;
  double v4 = (void *)(a1 + 40);
LABEL_27:
  if (![v6 count] && !objc_msgSend(v7, "count")) {
    goto LABEL_36;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 48) atomicallyDeleteInfoSuggestions:v6 insertInfoSuggestions:v7])
  {
    int v24 = [*(id *)(a1 + 32) _currentActivePredictionsContainSuggestionFromSourceId:*(void *)(a1 + 40) guardedData:v3];
    uint64_t v25 = *(id **)(a1 + 32);
    if (v24) {
      [v25[4] runAfterDelaySeconds:0 coalescingBehavior:1.0];
    }
    else {
      [v25 _updatePredictionRefreshDateIfNecessaryForSuggestions:*(void *)(a1 + 48)];
    }
    goto LABEL_36;
  }
  uint64_t v26 = (void *)[[NSString alloc] initWithFormat:@"Failed to reset suggestions with source ID %@ due to database failure.", *v4];
  id v27 = (objc_class *)MEMORY[0x1E4F28C58];
  id v28 = v26;
  id v29 = [v27 alloc];
  v61[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = v28;
  dispatch_queue_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v61 count:1];

  id v31 = (void *)[v29 initWithDomain:@"ATXInformationEngineErrorDomain" code:-1 userInfo:v30];
  if (!v31)
  {
LABEL_36:
    v32 = __atxlog_handle_gi();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(a1 + 40);
      uint64_t v40 = [*(id *)(a1 + 48) count];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v39;
      __int16 v57 = 2048;
      uint64_t v58 = v40;
      _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: source %@ sets %lu suggestion(s)", buf, 0x16u);
    }
    id v31 = 0;
    goto LABEL_39;
  }
  v32 = __atxlog_handle_gi();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v4, v32, v33, v34, v35, v36, v37, v38);
  }
LABEL_39:

  id v41 = *(void **)(a1 + 56);
  if (v41)
  {
    __int16 v42 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_71;
    block[3] = &unk_1E68ABB98;
    id v47 = v41;
    id v46 = v31;
    dispatch_async(v42, block);
  }
}

uint64_t __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_71(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)_currentActivePredictionsContainSuggestionFromSourceId:(id)a3 guardedData:(id)a4
{
  id v5 = a3;
  uint64_t v6 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v7 = (void *)v6[1];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __91__ATXInformationEngine__currentActivePredictionsContainSuggestionFromSourceId_guardedData___block_invoke;
  v10[3] = &unk_1E68B3040;
  id v8 = v5;
  id v11 = v8;
  uint64_t v12 = &v13;
  [v7 enumerateObjectsUsingBlock:v10];
  LOBYTE(v7) = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v7;
}

void __91__ATXInformationEngine__currentActivePredictionsContainSuggestionFromSourceId_guardedData___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 sourceIdentifier];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)getSuggestionsForInfoSourceIdentifier:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke;
  v11[3] = &unk_1E68B3068;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

void __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) readAllInfoSuggestionsWithSourceIdentifier:*(void *)(a1 + 40)];
  id v3 = __atxlog_handle_gi();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [v2 count];
    uint64_t v5 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109378;
    int v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "%d suggestion(s) to be returned to source: %@", buf, 0x12u);
  }

  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke_72;
  v9[3] = &unk_1E68ABB98;
  id v7 = *(id *)(a1 + 48);
  id v10 = v2;
  id v11 = v7;
  id v8 = v2;
  dispatch_async(v6, v9);
}

uint64_t __72__ATXInformationEngine_getSuggestionsForInfoSourceIdentifier_withReply___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)clearSuggestionsForInfoSourceIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E68B3068;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v11];
}

void __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) _clearSuggestionsForInfoSourceIdentifier:*(void *)(a1 + 40)];
  uint64_t v5 = __atxlog_handle_gi();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v13;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "ATXInformationEngine: all suggestions from %@ removed", buf, 0xCu);
    }

    if ([*(id *)(a1 + 32) _currentActivePredictionsContainSuggestionFromSourceId:*(void *)(a1 + 40) guardedData:v3])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0); {
  }
    }
  __int16 v14 = *(void **)(a1 + 48);
  if (v14)
  {
    uint64_t v15 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    void v16[2] = __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_73;
    v16[3] = &unk_1E68ABB98;
    id v18 = v14;
    id v17 = v4;
    dispatch_async(v15, v16);
  }
}

uint64_t __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_73(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)_clearSuggestionsForInfoSourceIdentifier:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  store = self->_store;
  id v15 = 0;
  char v6 = [(ATXInformationStore *)store deleteAllInfoSuggestionsWithSourceIdentifier:v4 error:&v15];
  id v7 = v15;
  uint64_t v8 = 0;
  if ((v6 & 1) == 0)
  {
    uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Failed to delete all suggestions with source id %@ from store with error: %@", v4, v7];
    uint64_t v10 = (objc_class *)MEMORY[0x1E4F28C58];
    id v11 = v9;
    id v12 = [v10 alloc];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];

    uint64_t v8 = (void *)[v12 initWithDomain:@"ATXInformationEngineErrorDomain" code:-2 userInfo:v13];
  }

  return v8;
}

- (id)latestInfoSuggestionRelevantNowForSourceId:(id)a3
{
  return (id)[(ATXInformationStore *)self->_store latestInfoSuggestionRelevantNowForSourceId:a3];
}

- (BOOL)deleteAllSuggestionsForSourceId:(id)a3 excludingSuggestionId:(id)a4
{
  return [(ATXInformationStore *)self->_store deleteAllSuggestionsForSourceId:a3 excludingSuggestionId:a4];
}

- (void)handleSuggestionDismissal:(id)a3 isDismissalLongTerm:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  filter = self->_filter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke;
  v11[3] = &unk_1E68B30B8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [(ATXInformationFilter *)filter recordDismissOfSuggestion:a3 isDismissalLongTerm:v5 completionHandler:v11];
}

void __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_2;
    v5[3] = &unk_1E68B3090;
    void v5[4] = v3;
    id v6 = *(id *)(a1 + 40);
    [v4 runAsyncWithLockAcquired:v5];
  }
}

void __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _updatePredictionsWithGuardedData:a2];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_3;
  block[3] = &unk_1E68AB618;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

uint64_t __81__ATXInformationEngine_handleSuggestionDismissal_isDismissalLongTerm_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleProactiveStackRotationForInfoSuggestion:(id)a3 isStalenessRotation:(BOOL)a4
{
  id v6 = a3;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __90__ATXInformationEngine_handleProactiveStackRotationForInfoSuggestion_isStalenessRotation___block_invoke;
  v9[3] = &unk_1E68B30E0;
  void v9[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [(_PASQueueLock *)lock runAsyncWithLockAcquired:v9];
}

void __90__ATXInformationEngine_handleProactiveStackRotationForInfoSuggestion_isStalenessRotation___block_invoke(uint64_t a1, void *a2)
{
  id v36 = a2;
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  id v4 = [*(id *)(a1 + 40) suggestionIdentifier];
  LOBYTE(v3) = [v3 rotationExistsForSuggestionWithId:v4 considerStalenessRotation:0];

  if ((v3 & 1) == 0)
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 80);
    id v6 = [*(id *)(a1 + 40) widgetBundleIdentifier];
    id v7 = [*(id *)(a1 + 40) widgetKind];
    [v5 durationLimitForWidgetWithIdentifier:v6 kind:v7];
    double v9 = v8;

    id v10 = *(void **)(*(void *)(a1 + 32) + 80);
    BOOL v11 = [*(id *)(a1 + 40) widgetBundleIdentifier];
    id v12 = [*(id *)(a1 + 40) widgetKind];
    [v10 coolDownIntervalForWidgetWithIdentifier:v11 kind:v12];
    double v14 = v13;

    id v15 = objc_alloc(MEMORY[0x1E4F4B350]);
    uint64_t v16 = [*(id *)(a1 + 40) suggestionIdentifier];
    id v17 = [*(id *)(a1 + 40) clientModelId];
    id v18 = [*(id *)(a1 + 40) criterion];
    uint64_t v19 = [*(id *)(a1 + 40) widgetBundleIdentifier];
    uint64_t v20 = [*(id *)(a1 + 40) widgetKind];
    uint64_t v21 = [*(id *)(a1 + 40) intent];
    char v22 = *(unsigned char *)(a1 + 48);
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] now];
    LOBYTE(v35) = v22;
    int v24 = (void *)[v15 initWithInfoSuggestionId:v16 clientModelId:v17 criterion:v18 widget:v19 kind:v20 intent:v21 isStalenessRotation:v9 rotationDate:v14 durationLimit:v35 coolDownInterval:v23];

    int v25 = [*(id *)(*(void *)(a1 + 32) + 48) insertOrIgnoreProactiveStackRotationRecord:v24];
    uint64_t v26 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:19];
    id v27 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:20];
    id v28 = [*(id *)(a1 + 40) clientModelId];
    if ([v28 isEqualToString:v26])
    {
      char v29 = 0;
    }
    else
    {
      dispatch_queue_t v30 = [*(id *)(a1 + 40) clientModelId];
      char v31 = [v30 isEqualToString:v27];

      char v29 = v31 ^ 1;
    }

    if (v25)
    {
      char v32 = *(unsigned char *)(a1 + 48) ? 1 : v29;
      if ((v32 & 1) == 0)
      {
        uint64_t v33 = *(void **)(a1 + 32);
        uint64_t v34 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v9];
        [v33 _schedulePredictionUpdateNoLaterThanDate:v34 guardedData:v36];
      }
    }
  }
}

- (unint64_t)countOfInfoSuggestionsForBundleId:(id)a3
{
  return [(ATXInformationStore *)self->_store numberOfInfoSuggestionsForAppBundleIdentifier:a3];
}

- (unint64_t)countOfInfoSuggestionsForSourceId:(id)a3
{
  return [(ATXInformationStore *)self->_store numberOfInfoSuggestionsForSourceId:a3];
}

- (id)latestUpdateDateForSourceId:(id)a3
{
  return (id)[(ATXInformationStore *)self->_store latestUpdateDateForSourceId:a3];
}

- (void)recordRecentTimelineEntries:(id)a3 forWidget:(id)a4
{
}

- (id)scheduledPredictionRefreshDate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__67;
  id v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__ATXInformationEngine_scheduledPredictionRefreshDate__block_invoke;
  v5[3] = &unk_1E68B3108;
  void v5[4] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __54__ATXInformationEngine_scheduledPredictionRefreshDate__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a2 + 16) copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (id)allRelevantInfoSuggestions
{
  id v2 = [(ATXInformationStore *)self->_store readCurrentlyRelevantSuggestions];
  if (v2) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v2 copyItems:1];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)allInfoSuggestions
{
  id v2 = [(ATXInformationStore *)self->_store readAllInfoSuggestions];
  if (v2) {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v2 copyItems:1];
  }
  else {
    uint64_t v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v3;
}

- (id)allInfoSuggestionsForSourceId:(id)a3
{
  uint64_t v3 = [(ATXInformationStore *)self->_store readAllInfoSuggestionsWithSourceIdentifier:a3];
  uint64_t v4 = v3;
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)currentPredictions
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  double v9 = __Block_byref_object_copy__67;
  id v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__ATXInformationEngine_currentPredictions__block_invoke;
  v5[3] = &unk_1E68B3108;
  void v5[4] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __42__ATXInformationEngine_currentPredictions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C978];
  uint64_t v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = v4[1];

  uint64_t v7 = [v5 initWithArray:v6 copyItems:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  return MEMORY[0x1F41817F8](v7, v9);
}

- (id)forceUpdateAndReturnPredictions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__67;
  id v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__ATXInformationEngine_forceUpdateAndReturnPredictions__block_invoke;
  v5[3] = &unk_1E68B3130;
  void v5[4] = self;
  void v5[5] = &v6;
  [(_PASQueueLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __55__ATXInformationEngine_forceUpdateAndReturnPredictions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2;
  [v3 _updatePredictionsWithGuardedData:v4];
  id v5 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v6 = v4[1];

  uint64_t v7 = [v5 initWithArray:v6 copyItems:1];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void *)(v8 + 40);
  *(void *)(v8 + 40) = v7;
  return MEMORY[0x1F41817F8](v7, v9);
}

- (ATXTimelineAbuseControlConfig)abuseControlConfig
{
  return self->_abuseControlConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureWeights, 0);
  objc_storeStrong((id *)&self->_abuseControlConfig, 0);
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_featurizer, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_confidenceMapper, 0);
  objc_storeStrong((id *)&self->_coalescedPredictionUpdateOperation, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __118__ATXInformationEngine_initWithFilter_featurizer_ranker_infoStore_confidenceMapper_abuseControlConfig_featureWeights___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXInformationEngine: couldn't perform prediction update operation because self is nil", v1, 2u);
}

- (void)_proactiveSuggestionFromScoredInfoSuggestion:(void *)a1 clientModelId:(NSObject *)a2 clientModelVersion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXInformationEngine: failed to convert ATXInfoSuggestion to ATXProactiveSuggestion: %@", (uint8_t *)&v4, 0xCu);
}

void __77__ATXInformationEngine__schedulePredictionUpdateNoLaterThanDate_guardedData___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "ATXInformationEngine: XPC activity com.apple.duetexpertd.info-pred-update attempted to run when class C locked even though it was set up not to do that", v1, 2u);
}

void __84__ATXInformationEngine_insertSuggestions_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_updatePredictionRefreshDateIfNecessaryForSuggestions:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "ATXInformationEngine: _updatePredictionRefreshDateIfNecessaryForSuggestions called with no suggestions", v1, 2u);
}

void __85__ATXInformationEngine_resetSuggestionsTo_forInfoSourceIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __82__ATXInformationEngine_clearSuggestionsForInfoSourceIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end