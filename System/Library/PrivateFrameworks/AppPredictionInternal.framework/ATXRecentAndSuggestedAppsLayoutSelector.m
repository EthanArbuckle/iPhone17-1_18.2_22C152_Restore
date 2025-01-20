@interface ATXRecentAndSuggestedAppsLayoutSelector
- (ATXRecentAndSuggestedAppsLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4 maxRecents:(unint64_t)a5 recencyLookBackSeconds:(double)a6;
- (ATXRecentAndSuggestedAppsLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4 maxRecents:(unint64_t)a5 recencyLookBackSeconds:(double)a6 appLaunchPublisher:(id)a7;
- (id)_accumulateRecentAppLaunchBundleIds;
- (id)_getATXProactiveSuggestionForRecentAppLaunch:(id)a3;
- (id)validLayoutsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
- (void)_accumulateRecentAppLaunchBundleIds;
@end

@implementation ATXRecentAndSuggestedAppsLayoutSelector

- (ATXRecentAndSuggestedAppsLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4 maxRecents:(unint64_t)a5 recencyLookBackSeconds:(double)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = BiomeLibrary();
  v13 = [v12 App];
  v14 = [v13 InFocus];
  v15 = objc_msgSend(v14, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);

  v16 = [(ATXRecentAndSuggestedAppsLayoutSelector *)self initWithSuggestionDeduplicator:v11 hyperParameters:v10 maxRecents:a5 recencyLookBackSeconds:v15 appLaunchPublisher:a6];
  return v16;
}

- (ATXRecentAndSuggestedAppsLayoutSelector)initWithSuggestionDeduplicator:(id)a3 hyperParameters:(id)a4 maxRecents:(unint64_t)a5 recencyLookBackSeconds:(double)a6 appLaunchPublisher:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)ATXRecentAndSuggestedAppsLayoutSelector;
  v14 = [(ATXLayoutSelector *)&v17 initWithSuggestionDeduplicator:a3 hyperParameters:a4];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_appLaunchPublisher, a7);
    v15->_maxRecents = a5;
    v15->_recencyLookBackSeconds = a6;
  }

  return v15;
}

- (id)validLayoutsForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "Recency Blending: Layout Selector asked to provide validLayouts.", buf, 2u);
  }

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __92__ATXRecentAndSuggestedAppsLayoutSelector_validLayoutsForConsumerSubType_rankedSuggestions___block_invoke;
  v44[3] = &unk_1E68AE358;
  v44[4] = self;
  char v45 = v4;
  v8 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", v44);
  v9 = [(ATXRecentAndSuggestedAppsLayoutSelector *)self _accumulateRecentAppLaunchBundleIds];
  id v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v9 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = v11;
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "Recency Blending: recentlyLaunchedApps count: %lu", buf, 0xCu);
  }
  v39 = v6;

  v37 = v9;
  if ([v9 count])
  {
    uint64_t v12 = objc_msgSend(v9, "count", v9);
    uint64_t v13 = [v8 count];
    v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v13 + v12];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [(ATXRecentAndSuggestedAppsLayoutSelector *)self _getATXProactiveSuggestionForRecentAppLaunch:*(void *)(*((void *)&v40 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v50 count:16];
      }
      while (v17);
    }

    [v14 addObjectsFromArray:v8];
  }
  else
  {
    v14 = 0;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F93910]);
  if ([v14 count]) {
    v22 = v14;
  }
  else {
    v22 = v8;
  }
  v23 = [(ATXLayoutSelector *)self hyperParameters];
  [v23 layoutsToConsiderForConsumerSubType:v4];
  v25 = uint64_t v24 = v4;
  v26 = [(ATXLayoutSelector *)self hyperParameters];
  v27 = [(ATXLayoutSelector *)self deduplicator];
  v28 = (void *)[v21 initWithRankedSuggestions:v22 layoutsToConsider:v25 hyperParameters:v26 suggestionDeduplicator:v27];

  v29 = __atxlog_handle_blending();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v24];
    uint64_t v31 = [v8 count];
    *(_DWORD *)buf = 138543618;
    uint64_t v47 = (uint64_t)v30;
    __int16 v48 = 2048;
    uint64_t v49 = v31;
    _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "Recency Blending: Generating layouts for non-homescreen consumerSubType %{public}@ with %lu ranked and filtered suggestions", buf, 0x16u);
  }
  v32 = [v28 generateValidLayouts];
  if ([v32 count])
  {
    id v33 = v32;
  }
  else
  {
    v34 = __atxlog_handle_blending();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:v24];
      *(_DWORD *)buf = 138412290;
      uint64_t v47 = (uint64_t)v35;
      _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEFAULT, "Recency Blending: Unable to generate any valid layouts for consumerSubType: %@.", buf, 0xCu);
    }
    id v33 = 0;
  }

  return v33;
}

uint64_t __92__ATXRecentAndSuggestedAppsLayoutSelector_validLayoutsForConsumerSubType_rankedSuggestions___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 hyperParameters];
  uint64_t v6 = [v5 uiSupportsSuggestion:v4 consumerSubType:*(unsigned __int8 *)(a1 + 40)];

  return v6;
}

- (id)_getATXProactiveSuggestionForRecentAppLaunch:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F93948];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithClientModelId:@"recent_app_heuristic" clientModelVersion:@"1.0"];
  uint64_t v6 = +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppWithBundleId:v4 score:v5 clientModelSpec:0 mediumThreshold:1 highThreshold:1.0 predictionReason:0.0 allowedOnHomescreen:0.0];

  return v6;
}

- (id)_accumulateRecentAppLaunchBundleIds
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = +[_ATXAppIconState sharedInstance];
  v5 = [v4 allInstalledAppsKnownToSpringBoard];
  uint64_t v6 = (void *)[v3 initWithArray:v5];

  v7 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:self->_maxRecents];
  uint64_t v23 = 0;
  v24[0] = &v23;
  v24[1] = 0x3032000000;
  v24[2] = __Block_byref_object_copy__25;
  v24[3] = __Block_byref_object_dispose__25;
  id v25 = 0;
  v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-self->_recencyLookBackSeconds];
  appLaunchPublisher = self->_appLaunchPublisher;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __78__ATXRecentAndSuggestedAppsLayoutSelector__accumulateRecentAppLaunchBundleIds__block_invoke;
  v22[3] = &unk_1E68AC060;
  v22[4] = &v23;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __78__ATXRecentAndSuggestedAppsLayoutSelector__accumulateRecentAppLaunchBundleIds__block_invoke_2;
  v17[3] = &unk_1E68AE380;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  id v21 = self;
  id v13 = (id)[(BPSPublisher *)appLaunchPublisher sinkWithCompletion:v22 shouldContinue:v17];
  if (*(void *)(v24[0] + 40))
  {
    v14 = __atxlog_handle_usage_insights();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      [(ATXRecentAndSuggestedAppsLayoutSelector *)(uint64_t)v24 _accumulateRecentAppLaunchBundleIds];
    }
  }
  id v15 = (void *)[v12 copy];

  _Block_object_dispose(&v23, 8);
  return v15;
}

uint64_t __78__ATXRecentAndSuggestedAppsLayoutSelector__accumulateRecentAppLaunchBundleIds__block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 error];
  return MEMORY[0x1F41817F8]();
}

BOOL __78__ATXRecentAndSuggestedAppsLayoutSelector__accumulateRecentAppLaunchBundleIds__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 absoluteTimestamp];
  uint64_t v5 = [v4 compare:*(void *)(a1 + 32)];

  if (v5 == -1)
  {
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 40);
    v7 = [v3 bundleID];
    LODWORD(v6) = [v6 containsObject:v7];

    if (v6)
    {
      if ([v3 starting])
      {
        v8 = *(void **)(a1 + 48);
        v9 = [v3 bundleID];
        [v8 addObject:v9];
      }
      BOOL v10 = (unint64_t)[*(id *)(a1 + 48) count] < *(void *)(*(void *)(a1 + 56) + 40);
    }
    else
    {
      BOOL v10 = 1;
    }
  }

  return v10;
}

- (void).cxx_destruct
{
}

- (void)_accumulateRecentAppLaunchBundleIds
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  id v4 = "-[ATXRecentAndSuggestedAppsLayoutSelector _accumulateRecentAppLaunchBundleIds]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "%s: Error with reading app launch stream: %@", (uint8_t *)&v3, 0x16u);
}

@end