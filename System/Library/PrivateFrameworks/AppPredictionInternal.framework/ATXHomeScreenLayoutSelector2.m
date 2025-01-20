@interface ATXHomeScreenLayoutSelector2
- (ATXHomeScreenLayoutSelector2)init;
- (ATXHomeScreenLayoutSelector2)initWithBlendingLayerHyperParameters:(id)a3;
- (ATXHomeScreenLayoutSelector2)initWithHomeScreenPageConfigurations:(id)a3 blendingLayerHyperParameters:(id)a4 suggestionDeduplicator:(id)a5 engagementRecordManager:(id)a6 widgetDismissManager:(id)a7 stackStateTracker:(id)a8 store:(id)a9 defaults:(id)a10 modeFilter:(id)a11 chronoService:(id)a12 isiPad:(BOOL)a13;
- (BOOL)_hasEligiblePinnedWidgetStacksForAPPWidget:(id)a3 forCandidateStack:(id)a4;
- (BOOL)_hasEligiblePinnedWidgetStacksForSuggestionsWidget:(id)a3 forCandidateStack:(id)a4;
- (BOOL)_hasEligibleWidgetSuggestionsStacksForSuggestion:(id)a3 onPages:(id)a4 ignoreDuplicatesInSGWidget:(BOOL)a5 ignoreDuplicatesInPanels:(BOOL)a6;
- (BOOL)_isBackgroundAppRefreshAllowedForAppBundleId:(id)a3;
- (BOOL)_isStack:(id)a3 eligibleToShowSuggestionViaWidgetSuggestion:(id)a4;
- (BOOL)_isStackEligibleForSmartRotate:(id)a3 stack:(id)a4;
- (BOOL)_isStackStale:(id)a3;
- (BOOL)_isSuggestionACandidate:(id)a3 forStack:(id)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7 homeScreenState:(id)a8;
- (BOOL)_isSuggestionStillNeededForTopOfStack:(id)a3;
- (BOOL)_shouldConsiderSuggestionForAppPredictionPanel:(id)a3;
- (BOOL)_shouldConsiderSuggestionForSuggestionsWidget:(id)a3;
- (BOOL)_shouldLimitWidgetSuggestionPowerCost;
- (BOOL)_stackHasRemainingReloadBudgetForWidgetSuggestion:(id)a3 homeScreenState:(id)a4;
- (BOOL)hasAskedChronoAboutReloadBudget;
- (NSDictionary)widgetSuggestionReloadBudgetByStackId;
- (double)_computeScoreForLayout:(id)a3;
- (double)_weightForConfidenceCategory:(int64_t)a3;
- (id)_appPredictionPanelPreviewFromRankedSuggestions:(id)a3;
- (id)_fallbackSuggestions:(id)a3 homeScreenState:(id)a4;
- (id)_filterRankedSuggestions:(id)a3 homeScreenState:(id)a4;
- (id)_homeScreenCachedSuggestionsFromHomeScreenState:(id)a3 sortedFallbackSuggestions:(id)a4 suggestionsWidgetPreviews:(id)a5 appPredictionPanelPreview:(id)a6 withUUID:(id)a7;
- (id)_loadHomeScreenState:(id)a3;
- (id)_processedSuggestionLayoutFromWidgetSuggestion:(id)a3 stack:(id)a4 blendingUpdateUUID:(id)a5;
- (id)_shortcutConversionOriginalActionSuggestionIndices:(id)a3;
- (id)_sortedPagesByMostRecentUserVisit:(id)a3;
- (id)_suggestionsEligibleForSuggestedSGWidgetOnPages:(id)a3 amongSuggestions:(id)a4;
- (id)_suggestionsWidgetPreviewsFromRankedSuggestions:(id)a3;
- (id)_suggestionsWidgetSuggestionsByPriorityOnPage:(id)a3;
- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4;
- (int64_t)_thresholdConfidenceForSuggestedSG;
- (void)_assignExistingSuggestedSGWidgetsOnPages:(id)a3 withSuggestions:(id)a4 suggestionToRankingIndex:(id)a5;
- (void)_assignNewSuggestedWidgetsForPages:(id)a3 rankedSuggestions:(id)a4 suggestionToRankingIndex:(id)a5 homeScreenState:(id)a6;
- (void)_assignPinnedAPPWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5;
- (void)_assignPinnedSuggestionsWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5;
- (void)_assignSuggestion:(id)a3 toTopOfStack:(id)a4;
- (void)_assignSuggestionsForExistingSuggestedWidgets:(id)a3 homeScreenState:(id)a4;
- (void)_assignUnfilledSGWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5;
- (void)_assignWidgetForTopOfStack:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5;
- (void)_fillSuggestedSGWidgetIfLayoutNotComplete:(id)a3 withSuggestions:(id)a4 updatingUsedSuggestionIndexSet:(id)a5;
- (void)_logStackDetail:(id)a3;
- (void)_performSuggestionAllocationWithRankedSuggestions:(id)a3 homeScreenState:(id)a4;
- (void)_preservePreviousAppSuggestionPositionsWithHomeScreenState:(id)a3;
- (void)_removeSuggestedWidgetWhereNecessaryWithHomeScreenState:(id)a3;
- (void)_rotateAwayFromPreviousSystemInitiatedRotationIfNecessary:(id)a3 homeScreenState:(id)a4;
- (void)_rotateStackToUpdatedSGSuggestionIfNecessary:(id)a3 suggestionToRankingIndex:(id)a4;
- (void)_updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions:(id)a3 suggestionToRankingIndex:(id)a4 homeScreenState:(id)a5;
- (void)setHasAskedChronoAboutReloadBudget:(BOOL)a3;
- (void)setWidgetSuggestionReloadBudgetByStackId:(id)a3;
@end

@implementation ATXHomeScreenLayoutSelector2

- (ATXHomeScreenLayoutSelector2)init
{
  v3 = [MEMORY[0x1E4F93550] sharedInstance];
  v4 = [(ATXHomeScreenLayoutSelector2 *)self initWithBlendingLayerHyperParameters:v3];

  return v4;
}

- (ATXHomeScreenLayoutSelector2)initWithBlendingLayerHyperParameters:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [MEMORY[0x1E4F4B018] sharedInstance];
  v7 = objc_opt_new();
  v8 = +[ATXStackStateTracker sharedInstance];
  v9 = [MEMORY[0x1E4F4B0E8] sharedInstance];
  id v10 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v11 = (void *)[v10 initWithSuiteName:*MEMORY[0x1E4F4B688]];
  v12 = +[ATXSuggestionModeFilter sharedInstance];
  v13 = objc_opt_new();
  LOBYTE(v16) = [MEMORY[0x1E4F93B08] isiPad];
  v14 = [(ATXHomeScreenLayoutSelector2 *)self initWithHomeScreenPageConfigurations:0 blendingLayerHyperParameters:v4 suggestionDeduplicator:v5 engagementRecordManager:v6 widgetDismissManager:v7 stackStateTracker:v8 store:v9 defaults:v11 modeFilter:v12 chronoService:v13 isiPad:v16];

  return v14;
}

- (ATXHomeScreenLayoutSelector2)initWithHomeScreenPageConfigurations:(id)a3 blendingLayerHyperParameters:(id)a4 suggestionDeduplicator:(id)a5 engagementRecordManager:(id)a6 widgetDismissManager:(id)a7 stackStateTracker:(id)a8 store:(id)a9 defaults:(id)a10 modeFilter:(id)a11 chronoService:(id)a12 isiPad:(BOOL)a13
{
  id v36 = a3;
  id obj = a4;
  id v35 = a4;
  id v34 = a5;
  id v33 = a6;
  id v32 = a7;
  id v31 = a8;
  id v37 = a9;
  id v30 = a10;
  id v19 = a11;
  id v20 = a12;
  v38.receiver = self;
  v38.super_class = (Class)ATXHomeScreenLayoutSelector2;
  v21 = [(ATXHomeScreenLayoutSelector2 *)&v38 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_homeScreenPageConfigs, a3);
    objc_storeStrong((id *)&v22->_hyperParameters, obj);
    objc_storeStrong((id *)&v22->_suggestionDeduplicator, a5);
    objc_storeStrong((id *)&v22->_engagementRecordManager, a6);
    objc_storeStrong((id *)&v22->_widgetDismissManager, a7);
    objc_storeStrong((id *)&v22->_stackStateTracker, a8);
    objc_storeStrong((id *)&v22->_store, a9);
    objc_storeStrong((id *)&v22->_defaults, a10);
    objc_storeStrong((id *)&v22->_modeFilter, a11);
    objc_storeStrong((id *)&v22->_chronoService, a12);
    v23 = [[_ATXHomeScreenTimelineRelevanceFilter alloc] initWithTimelineRelevanceStore:v37];
    timelineRelevanceFilter = v22->_timelineRelevanceFilter;
    v22->_timelineRelevanceFilter = v23;

    v22->_isiPad = a13;
    uint64_t v25 = [MEMORY[0x1E4F4B430] sharedInstance];
    descriptorCache = v22->_descriptorCache;
    v22->_descriptorCache = (ATXWidgetDescriptorCache *)v25;
  }
  return v22;
}

- (id)selectedLayoutForConsumerSubType:(unsigned __int8)a3 rankedSuggestions:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, "----- HSLS REFRESH START -----", buf, 2u);
  }

  if (v4 == 34)
  {
    [(ATXStackStateTracker *)self->_stackStateTracker updateStackRotationEvents];
    v8 = [(ATXHomeScreenLayoutSelector2 *)self _loadHomeScreenState:self->_homeScreenPageConfigs];
    stackStateTracker = self->_stackStateTracker;
    id v10 = [v8 sortedPagesByUserLastVisit];
    [(ATXStackStateTracker *)stackStateTracker cleanupOldDataWithHomeScreenPages:v10];

    v11 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:8 queryOptions:0];
    dismissedSuggestionsForSuggestionsWidget = self->_dismissedSuggestionsForSuggestionsWidget;
    self->_dismissedSuggestionsForSuggestionsWidget = v11;

    v13 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:16 queryOptions:0];
    dismissedSuggestionsForAppPredictionPanels = self->_dismissedSuggestionsForAppPredictionPanels;
    self->_dismissedSuggestionsForAppPredictionPanels = v13;

    v15 = [(ATXHomeScreenLayoutSelector2 *)self _filterRankedSuggestions:v6 homeScreenState:v8];
    [(ATXHomeScreenLayoutSelector2 *)self _assignSuggestionsForExistingSuggestedWidgets:v15 homeScreenState:v8];
    uint64_t v16 = [(ATXHomeScreenLayoutSelector2 *)self _suggestionsWidgetPreviewsFromRankedSuggestions:v15];
    v17 = [(ATXHomeScreenLayoutSelector2 *)self _appPredictionPanelPreviewFromRankedSuggestions:v15];
    self->_thresholdConfidenceForSuggestedSG = [(ATXHomeScreenLayoutSelector2 *)self _thresholdConfidenceForSuggestedSG];
    [(ATXHomeScreenLayoutSelector2 *)self setWidgetSuggestionReloadBudgetByStackId:0];
    [(ATXHomeScreenLayoutSelector2 *)self setHasAskedChronoAboutReloadBudget:0];
    self->_shouldLimitWidgetSuggestionPowerCost = [(ATXHomeScreenLayoutSelector2 *)self _shouldLimitWidgetSuggestionPowerCost];
    self->_numSuggestedWidgetInPastDay = [(ATXInformationStore *)self->_store numberOfSuggestedWidgetsInPastDay];
    self->_numWidgetReloadForSuggestionInPastDay = [(ATXInformationStore *)self->_store numberOfWidgetReloadForSuggestionInPastDay];
    [(ATXHomeScreenLayoutSelector2 *)self _performSuggestionAllocationWithRankedSuggestions:v15 homeScreenState:v8];
    [(ATXHomeScreenLayoutSelector2 *)self _rotateAwayFromPreviousSystemInitiatedRotationIfNecessary:v15 homeScreenState:v8];
    [(ATXHomeScreenLayoutSelector2 *)self _preservePreviousAppSuggestionPositionsWithHomeScreenState:v8];
    [(ATXHomeScreenLayoutSelector2 *)self _removeSuggestedWidgetWhereNecessaryWithHomeScreenState:v8];
    v18 = [(ATXHomeScreenLayoutSelector2 *)self _fallbackSuggestions:v15 homeScreenState:v8];
    id v19 = objc_opt_new();
    id v20 = [(ATXHomeScreenLayoutSelector2 *)self _homeScreenCachedSuggestionsFromHomeScreenState:v8 sortedFallbackSuggestions:v18 suggestionsWidgetPreviews:v16 appPredictionPanelPreview:v17 withUUID:v19];

    v21 = __atxlog_handle_blending();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "----- HSLS REFRESH END -----", v23, 2u);
    }
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)_performSuggestionAllocationWithRankedSuggestions:(id)a3 homeScreenState:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXHomeScreenLayoutSelector2 *)self _shortcutConversionOriginalActionSuggestionIndices:v6];
  id v30 = [v6 objectsAtIndexes:v8];
  v9 = (void *)[v6 mutableCopy];
  id v31 = (void *)v8;
  [v9 removeObjectsAtIndexes:v8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v10 = [v7 sortedPagesByUserLastVisit];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        [(ATXHomeScreenLayoutSelector2 *)self _assignPinnedSuggestionsWidgetForPage:v15 suggestions:v9 homeScreenState:v7];
        [(ATXHomeScreenLayoutSelector2 *)self _assignWidgetForTopOfStack:v15 suggestions:v9 homeScreenState:v7];
        [(ATXHomeScreenLayoutSelector2 *)self _assignPinnedAPPWidgetForPage:v15 suggestions:v9 homeScreenState:v7];
        [(ATXHomeScreenLayoutSelector2 *)self _assignUnfilledSGWidgetForPage:v15 suggestions:v9 homeScreenState:v7];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v12);
  }

  uint64_t v16 = objc_opt_new();
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __98__ATXHomeScreenLayoutSelector2__performSuggestionAllocationWithRankedSuggestions_homeScreenState___block_invoke;
  v40[3] = &unk_1E68ADF68;
  id v29 = v16;
  id v41 = v29;
  id v32 = v6;
  [v6 enumerateObjectsUsingBlock:v40];
  id v33 = objc_opt_new();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [v7 sortedPagesByUserLastVisit];
  uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    id v35 = 0;
    uint64_t v19 = *(void *)v37;
    uint64_t v20 = *MEMORY[0x1E4F4B540];
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v36 + 1) + 8 * j);
        v23 = [v22 config];
        uint64_t v24 = [v23 pageIndex];

        if (v24 == v20)
        {
          id v25 = v22;

          id v35 = v25;
        }
        else
        {
          [v33 addObject:v22];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v18);
  }
  else
  {
    id v35 = 0;
  }

  v26 = (void *)[v9 mutableCopy];
  [(ATXHomeScreenLayoutSelector2 *)self _assignExistingSuggestedSGWidgetsOnPages:v33 withSuggestions:v9 suggestionToRankingIndex:v29];
  [(ATXHomeScreenLayoutSelector2 *)self _assignNewSuggestedWidgetsForPages:v33 rankedSuggestions:v9 suggestionToRankingIndex:v29 homeScreenState:v7];
  if (v35)
  {
    v47 = v35;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [(ATXHomeScreenLayoutSelector2 *)self _assignExistingSuggestedSGWidgetsOnPages:v27 withSuggestions:v26 suggestionToRankingIndex:v29];

    v46 = v35;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    [(ATXHomeScreenLayoutSelector2 *)self _assignNewSuggestedWidgetsForPages:v28 rankedSuggestions:v26 suggestionToRankingIndex:v29 homeScreenState:v7];
  }
  [(ATXHomeScreenLayoutSelector2 *)self _updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions:v30 suggestionToRankingIndex:v29 homeScreenState:v7];
}

void __98__ATXHomeScreenLayoutSelector2__performSuggestionAllocationWithRankedSuggestions_homeScreenState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (id)_shortcutConversionOriginalActionSuggestionIndices:(id)a3
{
  id v3 = a3;
  int v4 = objc_msgSend(v3, "_pas_filteredArrayWithTest:", &__block_literal_global_49);
  v5 = objc_opt_new();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__ATXHomeScreenLayoutSelector2__shortcutConversionOriginalActionSuggestionIndices___block_invoke_2;
  v11[3] = &unk_1E68ADFB0;
  id v12 = v4;
  id v6 = v5;
  id v13 = v6;
  id v7 = v4;
  [v3 enumerateObjectsUsingBlock:v11];

  uint64_t v8 = v13;
  id v9 = v6;

  return v9;
}

uint64_t __83__ATXHomeScreenLayoutSelector2__shortcutConversionOriginalActionSuggestionIndices___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F93940];
  id v3 = [a2 clientModelSpecification];
  int v4 = [v3 clientModelId];
  uint64_t v5 = [v2 clientModelTypeFromClientModelId:v4];

  id v6 = (void *)MEMORY[0x1E4F93940];
  return [v6 clientModelTypeIsShortcutConversion:v5];
}

void __83__ATXHomeScreenLayoutSelector2__shortcutConversionOriginalActionSuggestionIndices___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 executableSpecification];
  uint64_t v7 = [v6 executableType];

  uint64_t v8 = [v5 executableSpecification];
  id v9 = v8;
  if (v7 == 2)
  {
    id v10 = [v8 executableObject];

    uint64_t v11 = [v10 intent];
  }
  else
  {
    uint64_t v12 = [v8 executableType];

    if (v12 != 10) {
      goto LABEL_19;
    }
    id v10 = [v5 linkActionExecutableObject];
    uint64_t v11 = [v10 cachedAppIntent];
  }
  id v13 = (void *)v11;

  if (v13)
  {
    uint64_t v23 = a1;
    uint64_t v24 = a3;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "executableSpecification", v23, v24, (void)v25);
          uint64_t v20 = [v19 executableObject];

          v21 = [v20 intent];
          LODWORD(v19) = +[ATXActionToWidgetConverter isWidgetIntent:v21 validConversionFromActionIntent:v13];

          if (v19)
          {
            v22 = __atxlog_handle_blending();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v30 = v5;
              _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "HSLS: Temporarily filtering out action suggestion because there is a converted widget suggestion for it.\n%@", buf, 0xCu);
            }

            [*(id *)(v23 + 40) addIndex:v24];
            goto LABEL_18;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v31 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
LABEL_19:
}

- (void)_assignPinnedSuggestionsWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a4;
  id v9 = a5;
  id v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 config];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = [v11 pageIndex];
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [assignPinnedSG]: considering pinned SG widgets on page %lu", buf, 0xCu);
  }
  long long v28 = v8;
  [v8 pinnedSGWidgets];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = __atxlog_handle_blending();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [v13 config];
          uint64_t v15 = [v30 widgets];
          uint64_t v16 = [v15 firstObject];
          uint64_t v17 = [v16 widgetUniqueId];
          uint64_t v18 = [v13 config];
          uint64_t v19 = [v18 identifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v44 = (uint64_t)v17;
          __int16 v45 = 2114;
          v46 = v19;
          _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "  HSLS [assignPinnedSG]: considering pinned SG widget %{public}@ in stack %{public}@", buf, 0x16u);
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v20 = v32;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              if (![(ATXHomeScreenLayoutSelector2 *)self _isSuggestionStillNeededForTopOfStack:v13])
              {
                long long v27 = __atxlog_handle_blending();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedSG]: pinned SG widget no longer needs suggestion", buf, 2u);
                }

                goto LABEL_27;
              }
              if ([(ATXHomeScreenLayoutSelector2 *)self _isSuggestionACandidate:v25 forStack:v13 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:1 homeScreenState:v9]&& [(ATXHomeScreenLayoutSelector2 *)self _hasEligiblePinnedWidgetStacksForSuggestionsWidget:v25 forCandidateStack:v13])
              {
                long long v26 = __atxlog_handle_blending();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v44 = v25;
                  _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedSG]: ASSIGNING suggestion %@", buf, 0xCu);
                }

                [(ATXHomeScreenLayoutSelector2 *)self _assignSuggestion:v25 toTopOfStack:v13];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_27:
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v33);
  }
}

- (void)_assignPinnedAPPWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v32 = a4;
  id v9 = a5;
  id v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 config];
    *(_DWORD *)buf = 134217984;
    uint64_t v44 = [v11 pageIndex];
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [assignPinnedAPP]: considering App Prediction Panels on page %lu", buf, 0xCu);
  }
  long long v28 = v8;
  [v8 pinnedAPPs];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v33)
  {
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        id v14 = __atxlog_handle_blending();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v30 = [v13 config];
          uint64_t v15 = [v30 widgets];
          uint64_t v16 = [v15 firstObject];
          uint64_t v17 = [v16 widgetUniqueId];
          uint64_t v18 = [v13 config];
          uint64_t v19 = [v18 identifier];
          *(_DWORD *)buf = 138543618;
          uint64_t v44 = (uint64_t)v17;
          __int16 v45 = 2114;
          v46 = v19;
          _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "  HSLS [assignPinnedAPP]: considering App Prediction Panel %{public}@ in stack %{public}@", buf, 0x16u);
        }
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v20 = v32;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v22; ++j)
            {
              if (*(void *)v35 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              if (![(ATXHomeScreenLayoutSelector2 *)self _isSuggestionStillNeededForTopOfStack:v13])
              {
                long long v27 = __atxlog_handle_blending();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedAPP]: App Prediction Panel no longer needs suggestion", buf, 2u);
                }

                goto LABEL_27;
              }
              if ([(ATXHomeScreenLayoutSelector2 *)self _isSuggestionACandidate:v25 forStack:v13 dedupeAppSuggestionsByWidgets:0 ignoreDuplicatesInSGWidget:1 ignoreDuplicatesInPanels:0 homeScreenState:v9]&& [(ATXHomeScreenLayoutSelector2 *)self _hasEligiblePinnedWidgetStacksForAPPWidget:v25 forCandidateStack:v13])
              {
                long long v26 = __atxlog_handle_blending();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v44 = v25;
                  _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "    HSLS [assignPinnedAPP]: ASSIGNING suggestion %@", buf, 0xCu);
                }

                [(ATXHomeScreenLayoutSelector2 *)self _assignSuggestion:v25 toTopOfStack:v13];
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }
LABEL_27:
      }
      uint64_t v33 = [obj countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v33);
  }
}

- (void)_assignWidgetForTopOfStack:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v9 = a5;
  id v10 = __atxlog_handle_blending();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [v8 config];
    *(_DWORD *)buf = 134217984;
    uint64_t v47 = [v11 pageIndex];
    _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [assignSmartRotate]: considering Smart Rotate on page %lu", buf, 0xCu);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v32 = v8;
  id obj = [v8 stacks];
  uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v42;
    uint64_t v33 = *(void *)v42;
    do
    {
      uint64_t v15 = 0;
      uint64_t v35 = v13;
      do
      {
        if (*(void *)v42 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * v15);
        uint64_t v17 = [v16 config];
        int v18 = [v17 allowsSmartRotate];

        if (v18)
        {
          uint64_t v19 = __atxlog_handle_blending();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            id v20 = [v16 config];
            uint64_t v21 = [v20 identifier];
            int v22 = [v16 isStale];
            *(_DWORD *)buf = 138543618;
            uint64_t v23 = @"NO";
            if (v22) {
              uint64_t v23 = @"YES";
            }
            uint64_t v47 = (uint64_t)v21;
            __int16 v48 = 2112;
            v49 = v23;
            _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "  HSLS [assignSmartRotate]: considering Smart Rotate for stack %{public}@ (isStale == %@)", buf, 0x16u);
          }
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v24 = v34;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v38;
            while (2)
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v38 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                if (![(ATXHomeScreenLayoutSelector2 *)self _isSuggestionStillNeededForTopOfStack:v16])
                {
                  uint64_t v31 = __atxlog_handle_blending();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "    HSLS [assignSmartRotate]: stack no longer needs suggestion", buf, 2u);
                  }

                  goto LABEL_30;
                }
                if ([(ATXHomeScreenLayoutSelector2 *)self _isSuggestionACandidate:v29 forStack:v16 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:1 homeScreenState:v9]&& [(ATXHomeScreenLayoutSelector2 *)self _isStackEligibleForSmartRotate:v29 stack:v16])
                {
                  id v30 = __atxlog_handle_blending();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v47 = v29;
                    _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEFAULT, "    HSLS [assignSmartRotate]: ASSIGNING suggestion %@", buf, 0xCu);
                  }

                  [(ATXHomeScreenLayoutSelector2 *)self _assignSuggestion:v29 toTopOfStack:v16];
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v37 objects:v45 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }
LABEL_30:

          uint64_t v14 = v33;
          uint64_t v13 = v35;
        }
        ++v15;
      }
      while (v15 != v13);
      uint64_t v13 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v13);
  }
}

- (void)_assignUnfilledSGWidgetForPage:(id)a3 suggestions:(id)a4 homeScreenState:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = __atxlog_handle_blending();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v8 config];
    *(_DWORD *)buf = 134217984;
    uint64_t v53 = [v12 pageIndex];
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "HSLS [assignUnfilledSG]: considering user-added unfilled SG widgets on page %lu", buf, 0xCu);
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = [v8 stacks];
  uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v32)
  {
    uint64_t v31 = *(void *)v46;
    uint64_t v13 = v38;
    id v34 = v10;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v46 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v14;
        uint64_t v15 = *(void **)(*((void *)&v45 + 1) + 8 * v14);
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v16 = [v15 suggestionsWidgetSuggestionsByWidgetUniqueId];
        uint64_t v17 = [v16 allValues];

        id v35 = v17;
        uint64_t v36 = [v17 countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v36)
        {
          uint64_t v18 = *(void *)v42;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v42 != v18) {
                objc_enumerationMutation(v35);
              }
              id v20 = *(void **)(*((void *)&v41 + 1) + 8 * v19);
              uint64_t v21 = __atxlog_handle_blending();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                [v20 widget];
                id v22 = v9;
                id v24 = v23 = v8;
                [v24 widgetUniqueId];
                uint64_t v25 = v18;
                uint64_t v26 = v13;
                v28 = uint64_t v27 = self;
                *(_DWORD *)buf = 138543362;
                uint64_t v53 = (uint64_t)v28;
                _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "  HSLS [assignUnfilledSG]: considering SG widget %{public}@", buf, 0xCu);

                self = v27;
                uint64_t v13 = v26;
                uint64_t v18 = v25;

                id v8 = v23;
                id v9 = v22;
                id v10 = v34;
              }

              v37[0] = MEMORY[0x1E4F143A8];
              v37[1] = 3221225472;
              v38[0] = __91__ATXHomeScreenLayoutSelector2__assignUnfilledSGWidgetForPage_suggestions_homeScreenState___block_invoke;
              v38[1] = &unk_1E68ADFD8;
              v38[2] = v20;
              v38[3] = self;
              id v39 = v10;
              id v40 = v8;
              [v9 enumerateObjectsUsingBlock:v37];
              if (([v20 isLayoutComplete] & 1) == 0)
              {
                uint64_t v29 = __atxlog_handle_blending();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
                  -[ATXHomeScreenLayoutSelector2 _assignUnfilledSGWidgetForPage:suggestions:homeScreenState:]((uint64_t)v49, (uint64_t)v20);
                }
              }
              ++v19;
            }
            while (v36 != v19);
            uint64_t v36 = [v35 countByEnumeratingWithState:&v41 objects:v50 count:16];
          }
          while (v36);
        }

        uint64_t v14 = v33 + 1;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v32);
  }
}

void __91__ATXHomeScreenLayoutSelector2__assignUnfilledSGWidgetForPage_suggestions_homeScreenState___block_invoke(id *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (![a1[4] isLayoutComplete])
  {
    if (![a1[5] _shouldConsiderSuggestionForSuggestionsWidget:v6]) {
      goto LABEL_34;
    }
    uint64_t v13 = [v6 executableSpecification];
    uint64_t v14 = [v13 executableType];

    if (v14 == 2)
    {
      uint64_t v15 = [v6 atxActionExecutableObject];
      uint64_t v7 = [v15 intent];

      if (v7 && [a1[6] containsWidgetForIntent:v7])
      {
        id v8 = __atxlog_handle_blending();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v25 = 138412290;
          id v26 = v6;
          _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "    HSLS [assignUnfilledSG]: action suggestion not eligible because there is already a widget showing the same intent %@", (uint8_t *)&v25, 0xCu);
        }
        goto LABEL_5;
      }
      goto LABEL_26;
    }
    uint64_t v16 = [v6 executableSpecification];
    uint64_t v17 = [v16 executableType];

    if (v17 != 10)
    {
LABEL_27:
      if (![a1[7] isShowingDuplicatedContentForSuggestion:v6 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:1])
      {
        id v23 = a1[4];
        id v24 = [v23 mainSuggestionInLayout];
        LODWORD(v23) = [v23 addSuggestion:v6 asMainSuggestion:v24 == 0];

        if (!v23) {
          goto LABEL_34;
        }
        uint64_t v7 = __atxlog_handle_blending();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_6;
        }
        id v8 = [a1[4] widget];
        id v9 = [v8 widgetUniqueId];
        int v25 = 138412546;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = v6;
        id v10 = "    HSLS [assignUnfilledSG]: ASSIGNED SW %@ with suggestion:\n%@";
        uint64_t v11 = v7;
        uint32_t v12 = 22;
        goto LABEL_4;
      }
      uint64_t v7 = __atxlog_handle_blending();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      int v25 = 138412290;
      id v26 = v6;
      id v22 = "    HSLS [assignUnfilledSG]: suggestion not eligible due to duplicates on page %@";
LABEL_30:
      _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0xCu);
      goto LABEL_6;
    }
    uint64_t v18 = [v6 linkActionExecutableObject];
    if (!v18)
    {
      uint64_t v7 = __atxlog_handle_blending();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      int v25 = 138412290;
      id v26 = v6;
      id v22 = "    HSLS [assignUnfilledSG]: Link action suggestion not eligible because the action container couldn't be deserialized %@";
      goto LABEL_30;
    }
    uint64_t v7 = v18;
    uint64_t v19 = [v18 cachedAppIntent];
    if (v19)
    {
      if (![a1[6] containsWidgetForIntent:v19])
      {

LABEL_26:
        goto LABEL_27;
      }
      id v20 = __atxlog_handle_blending();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        id v26 = v6;
        uint64_t v21 = "    HSLS [assignUnfilledSG]: Link action suggestion not eligible because there is already a widget showing"
              " the same app intent %@";
LABEL_23:
        _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v25, 0xCu);
      }
    }
    else
    {
      id v20 = __atxlog_handle_blending();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138412290;
        id v26 = v6;
        uint64_t v21 = "    HSLS [assignUnfilledSG]: Link action suggestion not eligible because cached app intent is nil %@";
        goto LABEL_23;
      }
    }

    goto LABEL_6;
  }
  *a4 = 1;
  uint64_t v7 = __atxlog_handle_blending();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [a1[4] widget];
    id v9 = [v8 widgetUniqueId];
    int v25 = 138543362;
    id v26 = v9;
    id v10 = "    HSLS [assignUnfilledSG]: SG widget %{public}@ is layout-complete";
    uint64_t v11 = v7;
    uint32_t v12 = 12;
LABEL_4:
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v25, v12);

LABEL_5:
  }
LABEL_6:

LABEL_34:
}

- (id)_suggestionsEligibleForSuggestedSGWidgetOnPages:(id)a3 amongSuggestions:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v6 = a4;
  id v25 = (id)objc_opt_new();
  id v24 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v35;
    *(void *)&long long v8 = 138412290;
    long long v23 = v8;
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v11 = 0;
      uint64_t v28 = v9;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        uint32_t v12 = *(void **)(*((void *)&v34 + 1) + 8 * v11);
        if (!-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v12, v23))goto LABEL_27; {
        long long v32 = 0u;
        }
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v13 = v27;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v40 count:16];
        if (!v14) {
          goto LABEL_20;
        }
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v19 = [v12 executableSpecification];
            if ([v19 executableType] == 1)
            {
              int v20 = [v18 isSeldomVisited];

              if (v20)
              {
                if ([v18 suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:v12]) {
                  goto LABEL_26;
                }
                continue;
              }
            }
            else
            {
            }
            if ([v18 isShowingDuplicatedContentForSuggestion:v12 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:1])goto LABEL_26; {
          }
            }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v40 count:16];
        }
        while (v15);
LABEL_20:

        id v13 = +[ATXSuggestionPreprocessor bundleIdAssociatedWithSuggestion:v12];
        if (!v13) {
          goto LABEL_23;
        }
        if (([v24 containsObject:v13] & 1) == 0)
        {
          [v24 addObject:v13];
LABEL_23:
          uint64_t v21 = __atxlog_handle_blending();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v23;
            id v39 = v12;
            _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: Found suggestion eligible for suggested SG %@", buf, 0xCu);
          }

          [v25 addObject:v12];
        }
LABEL_26:
        uint64_t v10 = v26;
        uint64_t v9 = v28;

LABEL_27:
        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v9);
  }

  return v25;
}

- (void)_fillSuggestedSGWidgetIfLayoutNotComplete:(id)a3 withSuggestions:(id)a4 updatingUsedSuggestionIndexSet:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke;
  uint64_t v15 = &unk_1E68ADFB0;
  id v9 = v7;
  id v16 = v9;
  id v17 = v8;
  id v10 = v8;
  [a4 enumerateObjectsUsingBlock:&v12];
  if ((objc_msgSend(v9, "isLayoutComplete", v12, v13, v14, v15) & 1) == 0)
  {
    uint64_t v11 = __atxlog_handle_blending();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenLayoutSelector2 _fillSuggestedSGWidgetIfLayoutNotComplete:withSuggestions:updatingUsedSuggestionIndexSet:](v9, v11);
    }
  }
}

void __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) isLayoutComplete])
  {
    *a4 = 1;
  }
  else if (([*(id *)(a1 + 40) containsIndex:a3] & 1) == 0)
  {
    id v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*v8 widget];
      uint64_t v11 = [v10 widgetUniqueId];
      int v15 = 138543618;
      id v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "HSLS [fillIncompleteSuggestedSG]: ASSIGNING new suggestion to suggested SG %{public}@ %@", (uint8_t *)&v15, 0x16u);
    }
    id v12 = *v8;
    uint64_t v13 = [*v8 mainSuggestionInLayout];
    LODWORD(v12) = [v12 addSuggestion:v7 asMainSuggestion:v13 == 0];

    if (v12)
    {
      [*(id *)(a1 + 40) addIndex:a3];
    }
    else
    {
      uint64_t v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke_cold_1((id *)(a1 + 32));
      }
    }
  }
}

- (void)_assignExistingSuggestedSGWidgetsOnPages:(id)a3 withSuggestions:(id)a4 suggestionToRankingIndex:(id)a5
{
  uint64_t v192 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v107 = a4;
  id v115 = a5;
  v114 = objc_opt_new();
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  long long v175 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v172 objects:v191 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v173;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v173 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = [*(id *)(*((void *)&v172 + 1) + 8 * i) config];
        objc_msgSend(v114, "appendFormat:", @"%lu ", objc_msgSend(v13, "pageIndex"));
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v172 objects:v191 count:16];
    }
    while (v10);
  }

  uint64_t v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v180 = (uint64_t)v114;
    _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: considering previously suggested SG widgets on pages %{public}@", buf, 0xCu);
  }

  [(ATXHomeScreenLayoutSelector2 *)self _suggestionsEligibleForSuggestedSGWidgetOnPages:obj amongSuggestions:v107];
  long long v168 = 0u;
  long long v169 = 0u;
  long long v170 = 0u;
  long long v171 = 0u;
  id v111 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v111 countByEnumeratingWithState:&v168 objects:v190 count:16];
  if (!v15) {
    goto LABEL_70;
  }
  uint64_t v16 = v15;
  uint64_t v134 = 0;
  uint64_t v17 = *(void *)v169;
  do
  {
    for (uint64_t j = 0; j != v16; ++j)
    {
      if (*(void *)v169 != v17) {
        objc_enumerationMutation(v111);
      }
      uint64_t v19 = [*(id *)(*((void *)&v168 + 1) + 8 * j) scoreSpecification];
      uint64_t v20 = [v19 suggestedConfidenceCategory];
      int64_t thresholdConfidenceForSuggestedSG = self->_thresholdConfidenceForSuggestedSG;

      uint64_t v22 = v134;
      if (v20 >= thresholdConfidenceForSuggestedSG) {
        uint64_t v22 = v134 + 1;
      }
      uint64_t v134 = v22;
    }
    uint64_t v16 = [v111 countByEnumeratingWithState:&v168 objects:v190 count:16];
  }
  while (v16);
  if (v134)
  {
    unint64_t v23 = [v111 count];
    v122 = objc_opt_new();
    v120 = objc_opt_new();
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    id v108 = obj;
    v131 = self;
    uint64_t v110 = [v108 countByEnumeratingWithState:&v164 objects:v189 count:16];
    if (v110)
    {
      uint64_t v129 = 0;
      uint64_t v109 = *(void *)v165;
      uint64_t v24 = *MEMORY[0x1E4F4B5F8];
      uint64_t v127 = *MEMORY[0x1E4F4B5F8];
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v165 != v109) {
            objc_enumerationMutation(v108);
          }
          uint64_t v113 = v25;
          uint64_t v26 = *(void **)(*((void *)&v164 + 1) + 8 * v25);
          if ([v26 isSeldomVisited])
          {
            id v27 = __atxlog_handle_blending();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v28 = [v26 config];
              uint64_t v29 = [v28 pageIndex];
              *(_DWORD *)buf = 134217984;
              uint64_t v180 = v29;
              _os_log_impl(&dword_1D0FA3000, v27, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: skipping page %lu because it's seldom visited", buf, 0xCu);
            }
          }
          else
          {
            long long v162 = 0u;
            long long v163 = 0u;
            long long v160 = 0u;
            long long v161 = 0u;
            id v27 = [v26 stacks];
            uint64_t v118 = [v27 countByEnumeratingWithState:&v160 objects:v188 count:16];
            if (v118)
            {
              v116 = v27;
              uint64_t v117 = *(void *)v161;
              do
              {
                uint64_t v30 = 0;
                do
                {
                  if (*(void *)v161 != v117) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v119 = v30;
                  long long v31 = *(void **)(*((void *)&v160 + 1) + 8 * v30);
                  long long v32 = [v31 config];
                  int v33 = [v32 allowsNewWidget];

                  if (v33) {
                    BOOL v34 = v134 < 1;
                  }
                  else {
                    BOOL v34 = 1;
                  }
                  if (!v34)
                  {
                    long long v158 = 0u;
                    long long v159 = 0u;
                    long long v156 = 0u;
                    long long v157 = 0u;
                    long long v35 = [v31 previousSuggestedWidgets];
                    uint64_t v36 = [v35 countByEnumeratingWithState:&v156 objects:v187 count:16];
                    if (v36)
                    {
                      uint64_t v37 = v36;
                      v125 = v31;
                      uint64_t v38 = *(void *)v157;
                      v124 = v35;
                      do
                      {
                        uint64_t v39 = 0;
                        uint64_t v132 = v37;
                        do
                        {
                          if (*(void *)v157 != v38) {
                            objc_enumerationMutation(v35);
                          }
                          id v40 = *(void **)(*((void *)&v156 + 1) + 8 * v39);
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            widgetDismissManager = self->_widgetDismissManager;
                            uint64_t v42 = ATXSpecialWidgetKindSiriSuggestions();
                            LODWORD(widgetDismissManager) = [(ATXWidgetSuggestionDismissManager *)widgetDismissManager shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:v24 kind:v42 intent:0];

                            if (widgetDismissManager)
                            {
                              long long v43 = __atxlog_handle_blending();
                              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl(&dword_1D0FA3000, v43, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: considered existing suggestions widget but the widget has been dismissed", buf, 2u);
                              }
                              uint64_t v37 = v132;
                            }
                            else
                            {
                              long long v43 = v40;
                              if ([v43 layoutType] == 5)
                              {
                                unint64_t v44 = 1;
                              }
                              else if ([v43 layoutType] == 9)
                              {
                                unint64_t v44 = 2;
                              }
                              else
                              {
                                unint64_t v44 = 4 * ([v43 layoutType] == 11);
                              }
                              long long v45 = __atxlog_handle_blending();
                              BOOL v46 = os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT);
                              if (v23 < v44 || v134 <= 0)
                              {
                                if (v46)
                                {
                                  v55 = [v43 widget];
                                  v56 = [v55 widgetUniqueId];
                                  *(_DWORD *)buf = 138544130;
                                  uint64_t v180 = (uint64_t)v56;
                                  __int16 v181 = 2048;
                                  unint64_t v182 = v44;
                                  __int16 v183 = 2048;
                                  unint64_t v184 = v23;
                                  __int16 v185 = 2048;
                                  uint64_t v186 = v134;
                                  _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: not populating previously suggested SG %{public}@: numSuggestionsNeeded %lu, remaining numSuggestions %lu, remaining numSuggestionsAboveConfidenceThreshold %lu", buf, 0x2Au);

                                  self = v131;
                                }
                                uint64_t v24 = v127;
                              }
                              else
                              {
                                unint64_t v126 = v23 - v44;
                                if (v46)
                                {
                                  long long v47 = [v43 widget];
                                  long long v48 = [v47 widgetUniqueId];
                                  *(_DWORD *)buf = 138544130;
                                  uint64_t v180 = (uint64_t)v48;
                                  __int16 v181 = 2048;
                                  unint64_t v182 = v44;
                                  __int16 v183 = 2048;
                                  unint64_t v184 = v23;
                                  __int16 v185 = 2048;
                                  uint64_t v186 = v134;
                                  _os_log_impl(&dword_1D0FA3000, v45, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: creating placeholder for previously suggested SG %{public}@: numSuggestionsNeeded %lu, remaining numSuggestions %lu, remaining numSuggestionsAboveConfidenceThreshold %lu", buf, 0x2Au);

                                  self = v131;
                                }

                                v49 = [_ATXSuggestionsWidgetSuggestion alloc];
                                uint64_t v50 = [v43 widget];
                                long long v45 = [(_ATXSuggestionsWidgetSuggestion *)v49 initWithSuggestionsWidget:v50 containingStack:v125 suggestionDeduplicator:self->_suggestionDeduplicator hyperParameters:self->_hyperParameters];

                                uint64_t v51 = [v125 suggestionsWidgetSuggestionsByWidgetUniqueId];
                                v52 = [v43 widget];
                                uint64_t v53 = [v52 widgetUniqueId];
                                [v51 setObject:v45 forKeyedSubscript:v53];

                                self = v131;
                                uint64_t v54 = [v125 suggestedWidgets];
                                [v54 addObject:v45];

                                [v122 addObject:v45];
                                [v120 addObject:v43];
                                uint64_t v24 = v127;
                                v129 += v44;
                                v134 -= v44;
                                unint64_t v23 = v126;
                                long long v35 = v124;
                              }
                              uint64_t v37 = v132;
                            }
                          }
                          ++v39;
                        }
                        while (v37 != v39);
                        uint64_t v37 = [v35 countByEnumeratingWithState:&v156 objects:v187 count:16];
                      }
                      while (v37);
                    }

                    id v27 = v116;
                  }
                  uint64_t v30 = v119 + 1;
                }
                while (v119 + 1 != v118);
                uint64_t v118 = [v27 countByEnumeratingWithState:&v160 objects:v188 count:16];
              }
              while (v118);
            }
          }

          uint64_t v25 = v113 + 1;
        }
        while (v113 + 1 != v110);
        uint64_t v110 = [v108 countByEnumeratingWithState:&v164 objects:v189 count:16];
      }
      while (v110);
    }
    else
    {
      uint64_t v129 = 0;
    }

    v60 = objc_opt_new();
    v151[0] = MEMORY[0x1E4F143A8];
    v151[1] = 3221225472;
    v151[2] = __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke;
    v151[3] = &unk_1E68AE028;
    id v121 = v120;
    id v152 = v121;
    id v61 = v111;
    id v153 = v61;
    uint64_t v155 = v129;
    id v62 = v60;
    id v154 = v62;
    [v122 enumerateObjectsUsingBlock:v151];
    long long v149 = 0u;
    long long v150 = 0u;
    long long v147 = 0u;
    long long v148 = 0u;
    id v63 = v122;
    uint64_t v64 = [v63 countByEnumeratingWithState:&v147 objects:v178 count:16];
    if (v64)
    {
      uint64_t v65 = v64;
      uint64_t v66 = *(void *)v148;
      do
      {
        for (uint64_t k = 0; k != v65; ++k)
        {
          if (*(void *)v148 != v66) {
            objc_enumerationMutation(v63);
          }
          [(ATXHomeScreenLayoutSelector2 *)self _fillSuggestedSGWidgetIfLayoutNotComplete:*(void *)(*((void *)&v147 + 1) + 8 * k) withSuggestions:v61 updatingUsedSuggestionIndexSet:v62];
        }
        uint64_t v65 = [v63 countByEnumeratingWithState:&v147 objects:v178 count:16];
      }
      while (v65);
    }
    v123 = v61;

    long long v145 = 0u;
    long long v146 = 0u;
    long long v143 = 0u;
    long long v144 = 0u;
    v57 = v63;
    uint64_t v68 = [v57 countByEnumeratingWithState:&v143 objects:v177 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v144;
      id v133 = v62;
      uint64_t v128 = *(void *)v144;
      v130 = v57;
      do
      {
        uint64_t v71 = 0;
        uint64_t v135 = v69;
        do
        {
          if (*(void *)v144 != v70) {
            objc_enumerationMutation(v57);
          }
          v72 = *(void **)(*((void *)&v143 + 1) + 8 * v71);
          if ([v72 isLayoutComplete])
          {
            v73 = [v72 stack];
            v74 = [v73 config];
            int v75 = [v74 allowsSmartRotate];

            if (v75)
            {
              long long v141 = 0u;
              long long v142 = 0u;
              long long v139 = 0u;
              long long v140 = 0u;
              v76 = [v72 suggestionLayout];
              v77 = [v76 allSuggestionsInLayout];

              uint64_t v78 = [v77 countByEnumeratingWithState:&v139 objects:v176 count:16];
              if (v78)
              {
                uint64_t v79 = v78;
                uint64_t v80 = 0;
                uint64_t v81 = *(void *)v140;
                do
                {
                  for (uint64_t m = 0; m != v79; ++m)
                  {
                    if (*(void *)v140 != v81) {
                      objc_enumerationMutation(v77);
                    }
                    v83 = *(void **)(*((void *)&v139 + 1) + 8 * m);
                    v84 = [v83 scoreSpecification];
                    uint64_t v85 = [v84 suggestedConfidenceCategory];

                    if (v85 > v80)
                    {
                      v86 = [v83 scoreSpecification];
                      uint64_t v80 = [v86 suggestedConfidenceCategory];

                      v87 = [v115 objectForKeyedSubscript:v83];
                      [v87 unsignedIntegerValue];
                    }
                  }
                  uint64_t v79 = [v77 countByEnumeratingWithState:&v139 objects:v176 count:16];
                }
                while (v79);
              }
              else
              {
                uint64_t v80 = 0;
              }

              if (v80 < v131->_thresholdConfidenceForSuggestedSG)
              {
                v88 = __atxlog_handle_blending();
                uint64_t v69 = v135;
                if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
                {
                  v100 = [v72 widget];
                  v101 = [v100 widgetUniqueId];
                  int64_t v102 = v131->_thresholdConfidenceForSuggestedSG;
                  v103 = [v72 suggestionLayout];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v180 = (uint64_t)v101;
                  __int16 v181 = 2048;
                  unint64_t v182 = v102;
                  __int16 v183 = 2112;
                  unint64_t v184 = (unint64_t)v103;
                  _os_log_fault_impl(&dword_1D0FA3000, v88, OS_LOG_TYPE_FAULT, "HSLS [assignExistingSuggestedSG]: newly created layout for previously suggested SG %{public}@ does not have >=1 suggestion with confidence >= %ld: %@", buf, 0x20u);
                }
                id v62 = v133;
                v57 = v130;
                goto LABEL_111;
              }
              v89 = [v72 stack];
              v90 = [v89 topOfStackSuggestion];
              v88 = [v90 mainSuggestionInLayout];

              uint64_t v69 = v135;
              if (v88)
              {
                v91 = [v115 objectForKeyedSubscript:v88];
                uint64_t v92 = [v91 unsignedIntegerValue];

                id v62 = v133;
                v57 = v130;
                if (v92)
                {
                  v93 = __atxlog_handle_blending();
                  if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                  {
                    v94 = [v72 widget];
                    v95 = [v94 widgetUniqueId];
                    *(_DWORD *)buf = 138543618;
                    uint64_t v180 = (uint64_t)v95;
                    __int16 v181 = 2112;
                    unint64_t v182 = (unint64_t)v88;
                    v96 = v93;
                    v97 = "HSLS [assignExistingSuggestedSG]: Smart Rotate to existing suggested SG %{public}@, overriding"
                          " inferior topOfStackSuggestion %@";
                    uint32_t v98 = 22;
                    goto LABEL_109;
                  }
                  goto LABEL_110;
                }
              }
              else
              {
                v93 = __atxlog_handle_blending();
                id v62 = v133;
                v57 = v130;
                if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
                {
                  v94 = [v72 widget];
                  v95 = [v94 widgetUniqueId];
                  *(_DWORD *)buf = 138543362;
                  uint64_t v180 = (uint64_t)v95;
                  v96 = v93;
                  v97 = "HSLS [assignExistingSuggestedSG]: Smart Rotate to existing suggested SG %{public}@, because ther"
                        "e is no topOfStackSuggestion for the stack yet";
                  uint32_t v98 = 12;
LABEL_109:
                  _os_log_impl(&dword_1D0FA3000, v96, OS_LOG_TYPE_DEFAULT, v97, buf, v98);
                }
LABEL_110:

                v99 = [v72 stack];
                [v99 setTopOfStackSuggestion:v72];
              }
LABEL_111:
              uint64_t v70 = v128;
            }
          }
          ++v71;
        }
        while (v71 != v69);
        uint64_t v69 = [v57 countByEnumeratingWithState:&v143 objects:v177 count:16];
      }
      while (v69);
    }

    v104 = [v123 objectsAtIndexes:v62];
    [v62 removeAllIndexes];
    v136[0] = MEMORY[0x1E4F143A8];
    v136[1] = 3221225472;
    v136[2] = __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_45;
    v136[3] = &unk_1E68ADFB0;
    id v137 = v104;
    id v138 = v62;
    id v105 = v62;
    id v106 = v104;
    v59 = v107;
    [v107 enumerateObjectsUsingBlock:v136];
    [v107 removeObjectsAtIndexes:v105];
  }
  else
  {
LABEL_70:
    v57 = __atxlog_handle_blending();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v58 = self->_thresholdConfidenceForSuggestedSG;
      *(_DWORD *)buf = 134217984;
      uint64_t v180 = v58;
      _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: not populating any previously suggested SG because there is no suggestions above confidence threshold %ld", buf, 0xCu);
    }
    v59 = v107;
  }
}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2;
  v11[3] = &unk_1E68AE000;
  id v8 = *(void **)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 56);
  id v12 = v5;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (*(void *)(a1 + 56) <= a3
    || (id v8 = (id *)(a1 + 32), [*(id *)(a1 + 32) isLayoutComplete]))
  {
    *a4 = 1;
  }
  else if (([*(id *)(a1 + 40) containsIndex:a3] & 1) == 0 {
         && [*(id *)(a1 + 48) containsIdenticalContentOfSuggestion:v7])
  }
  {
    id v9 = __atxlog_handle_blending();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [*v8 widget];
      uint64_t v11 = [v10 widgetUniqueId];
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D0FA3000, v9, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: ASSIGNING previously existing suggestion to suggested SG %{public}@ %@", (uint8_t *)&v15, 0x16u);
    }
    id v12 = *v8;
    id v13 = [*v8 mainSuggestionInLayout];
    LODWORD(v12) = [v12 addSuggestion:v7 asMainSuggestion:v13 == 0];

    if (v12)
    {
      [*(id *)(a1 + 40) addIndex:a3];
    }
    else
    {
      id v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2_cold_1((id *)(a1 + 32));
      }
    }
  }
}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_45(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        if (*(id *)(*((void *)&v12 + 1) + 8 * i) == v5)
        {
          objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3, (void)v12);
          uint64_t v11 = __atxlog_handle_blending();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v17 = v5;
            _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedSG]: removing used suggestion %@", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)_assignNewSuggestedWidgetsForPages:(id)a3 rankedSuggestions:(id)a4 suggestionToRankingIndex:(id)a5 homeScreenState:(id)a6
{
  uint64_t v226 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v144 = a4;
  id v11 = a5;
  id v161 = a6;
  long long v12 = objc_opt_new();
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v208 objects:v225 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v209;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v209 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [*(id *)(*((void *)&v208 + 1) + 8 * i) config];
        objc_msgSend(v12, "appendFormat:", @"%lu ", objc_msgSend(v18, "pageIndex"));
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v208 objects:v225 count:16];
    }
    while (v15);
  }

  uint64_t v19 = __atxlog_handle_blending();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v216 = (uint64_t)v12;
    _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: considering making new Widget Suggestion for pages %{public}@", buf, 0xCu);
  }

  v206[0] = MEMORY[0x1E4F143A8];
  v206[1] = 3221225472;
  v206[2] = __126__ATXHomeScreenLayoutSelector2__assignNewSuggestedWidgetsForPages_rankedSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke;
  v206[3] = &unk_1E68AE050;
  v206[4] = self;
  id v156 = v13;
  id v207 = v156;
  uint64_t v20 = objc_msgSend(v144, "_pas_filteredArrayWithTest:", v206);
  if (![v20 count])
  {
    v125 = v20;
    unint64_t v126 = __atxlog_handle_blending();
    if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v126, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: not making any new Widget Suggestion because there isn't any eligible suggestion", buf, 2u);
    }
    goto LABEL_173;
  }
  CFStringRef v21 = (const __CFString *)*MEMORY[0x1E4F4B6C0];
  buf[0] = 0;
  CFStringRef applicationID = (const __CFString *)*MEMORY[0x1E4F4B688];
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v21, (CFStringRef)*MEMORY[0x1E4F4B688], buf);
  long long v202 = 0u;
  long long v203 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  long long v142 = v20;
  id obj = v20;
  long long v159 = v11;
  long long v143 = v12;
  uint64_t v153 = [obj countByEnumeratingWithState:&v202 objects:v224 count:16];
  if (!v153) {
    goto LABEL_147;
  }
  uint64_t v151 = *(void *)v203;
LABEL_13:
  uint64_t v22 = 0;
LABEL_14:
  if (*(void *)v203 != v151) {
    objc_enumerationMutation(obj);
  }
  unint64_t v23 = *(void **)(*((void *)&v202 + 1) + 8 * v22);
  uint64_t v24 = [v23 executableSpecification];
  uint64_t v25 = [v24 executableType];

  if (v25 != 3)
  {
    id v27 = 0;
    goto LABEL_22;
  }
  uint64_t v26 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v23];
  id v27 = v26;
  if (!v26)
  {
LABEL_22:
    char v29 = 0;
    goto LABEL_26;
  }
  id v28 = [v26 widgetBundleIdentifier];
  if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
  {
    buf[0] = 0;
    if (CFPreferencesGetAppBooleanValue(@"ATXWidgetKitDeveloperModeSkipEntitlementCheck", applicationID, buf)) {
      char v29 = 1;
    }
    else {
      char v29 = [MEMORY[0x1E4F4AEF8] isDebuggingAllowedForExtensionBundleId:v28];
    }
  }
  else
  {
    char v29 = 0;
  }

LABEL_26:
  if (AppBooleanValue || (v29 & 1) != 0 || self->_numSuggestedWidgetInPastDay < 0x14)
  {
    uint64_t v30 = __atxlog_handle_blending();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v216 = (uint64_t)v23;
      _os_log_impl(&dword_1D0FA3000, v30, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: considering making new Widget Suggestion with suggestion %@", buf, 0xCu);
    }

    long long v31 = [v23 executableSpecification];
    uint64_t v32 = [v31 executableType];

    BOOL v33 = v32 != 3 || v27 == 0;
    long long v160 = v23;
    if (v33)
    {
      int v174 = 0;
      goto LABEL_37;
    }
    uint64_t v158 = v22;
    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    v88 = v156;
    uint64_t v89 = [v88 countByEnumeratingWithState:&v198 objects:v223 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v199;
      do
      {
        for (uint64_t j = 0; j != v90; ++j)
        {
          if (*(void *)v199 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = *(void **)(*((void *)&v198 + 1) + 8 * j);
          v94 = v27;
          v95 = [v27 appBundleIdentifier];
          int v96 = [v93 containsSuggestedWidgetForApp:v95];

          if (v96)
          {
            uint64_t v110 = __atxlog_handle_blending();
            id v27 = v94;
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              id v111 = [v94 appBundleIdentifier];
              v112 = [v93 config];
              uint64_t v113 = [v112 pageIndex];
              *(_DWORD *)buf = 138412546;
              uint64_t v216 = (uint64_t)v111;
              __int16 v217 = 2048;
              uint64_t v218 = v113;
              _os_log_impl(&dword_1D0FA3000, v110, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Found existing suggested widget under the same bundleId %@ on page %lu, so skipping this suggestion", buf, 0x16u);
            }
            uint64_t v22 = v158;
            goto LABEL_125;
          }
          id v27 = v94;
        }
        uint64_t v90 = [v88 countByEnumeratingWithState:&v198 objects:v223 count:16];
      }
      while (v90);
    }

    v97 = [v27 widgetBundleIdentifier];
    char v98 = ATXBundleIdIsSpecialWidgetExtensionBundleId() | v29;

    if (v98)
    {
      int v174 = 0;
      uint64_t v22 = v158;
LABEL_103:
      unint64_t v23 = v160;
      goto LABEL_37;
    }
    uint64_t v22 = v158;
    if (self->_shouldLimitWidgetSuggestionPowerCost)
    {
      v88 = __atxlog_handle_blending();
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_125;
      }
      id v115 = [v27 widgetBundleIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v216 = (uint64_t)v115;
      v116 = v88;
      uint64_t v117 = "HSLS [assignNewWidgetSuggestion]: Not considering making new Widget Suggestion for %@ to save power in the "
             "first week after Sky upgrade.";
    }
    else
    {
      if (AppBooleanValue)
      {
        int v174 = 1;
        goto LABEL_103;
      }
      unint64_t v23 = v160;
      if (self->_numWidgetReloadForSuggestionInPastDay < 0x14)
      {
        int v174 = 1;
LABEL_37:
        BOOL v34 = [v159 objectForKeyedSubscript:v23];
        unint64_t v162 = [v34 unsignedIntegerValue];

        BOOL v170 = [(ATXHomeScreenLayoutSelector2 *)self _shouldConsiderSuggestionForSuggestionsWidget:v23];
        long long v194 = 0u;
        long long v195 = 0u;
        long long v196 = 0u;
        long long v197 = 0u;
        id v35 = v156;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v194 objects:v222 count:16];
        if (!v36)
        {

          long long v167 = 0;
          goto LABEL_121;
        }
        uint64_t v37 = v36;
        long long v167 = 0;
        long long v163 = 0;
        uint64_t v38 = *(void *)v195;
        long long v149 = v35;
        uint64_t v157 = v22;
        id v152 = v27;
        uint64_t v146 = *(void *)v195;
LABEL_39:
        uint64_t v39 = 0;
        uint64_t v147 = v37;
        while (1)
        {
          if (*(void *)v195 != v38) {
            objc_enumerationMutation(v35);
          }
          id v40 = *(void **)(*((void *)&v194 + 1) + 8 * v39);
          if (v170 && [*(id *)(*((void *)&v194 + 1) + 8 * v39) containsSGWidget])
          {
            long long v41 = __atxlog_handle_blending();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v42 = [v40 config];
              uint64_t v43 = [v42 pageIndex];
              *(_DWORD *)buf = 134218242;
              uint64_t v216 = v43;
              __int16 v217 = 2112;
              uint64_t v218 = (uint64_t)v23;
              _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: page %lu is not eligible to surface SG widget suggestion as Widget Suggestion because it already contains a pinned or suggested SG widget: %@", buf, 0x16u);
            }
          }
          else
          {
            uint64_t v150 = v39;
            long long v192 = 0u;
            long long v193 = 0u;
            long long v190 = 0u;
            long long v191 = 0u;
            long long v172 = v40;
            long long v41 = [v40 stacks];
            uint64_t v44 = [v41 countByEnumeratingWithState:&v190 objects:v221 count:16];
            if (v44)
            {
              uint64_t v45 = v44;
              uint64_t v176 = *(void *)v191;
              BOOL v46 = v159;
              long long v165 = v41;
              while (2)
              {
                uint64_t v47 = 0;
LABEL_49:
                if (*(void *)v191 != v176) {
                  objc_enumerationMutation(v41);
                }
                v88 = *(NSObject **)(*((void *)&v190 + 1) + 8 * v47);
                if (![(ATXHomeScreenLayoutSelector2 *)self _isStack:v88 eligibleToShowSuggestionViaWidgetSuggestion:v23])
                {
                  v52 = __atxlog_handle_blending();
                  if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_83;
                  }
                  uint64_t v53 = [v88 config];
                  uint64_t v54 = [v53 identifier];
                  v55 = [v172 config];
                  uint64_t v56 = [v55 pageIndex];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v216 = (uint64_t)v54;
                  __int16 v217 = 2048;
                  uint64_t v218 = v56;
                  __int16 v219 = 2112;
                  v220 = v23;
                  v57 = v52;
                  int64_t v58 = "HSLS [assignNewWidgetSuggestion]: stack %{public}@ on page %lu is not eligible to surface sugges"
                        "tion as Widget Suggestion: %@";
                  goto LABEL_59;
                }
                if (v174)
                {
                  long long v48 = [v88 config];
                  v49 = [v48 identifier];
                  BOOL v50 = [(ATXHomeScreenLayoutSelector2 *)self _stackHasRemainingReloadBudgetForWidgetSuggestion:v49 homeScreenState:v161];

                  if (!v50)
                  {
                    v52 = __atxlog_handle_blending();
                    if (!os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_83;
                    }
                    uint64_t v53 = [v88 config];
                    uint64_t v54 = [v53 identifier];
                    v55 = [v172 config];
                    uint64_t v68 = [v55 pageIndex];
                    *(_DWORD *)buf = 138543874;
                    uint64_t v216 = (uint64_t)v54;
                    __int16 v217 = 2048;
                    uint64_t v218 = v68;
                    __int16 v219 = 2112;
                    v220 = v23;
                    v57 = v52;
                    int64_t v58 = "HSLS [assignNewWidgetSuggestion]: stack %{public}@ on page %lu is not eligible to surface Widg"
                          "et Suggestion because it has depleted reload budget: %@";
LABEL_59:
                    _os_log_impl(&dword_1D0FA3000, v57, OS_LOG_TYPE_DEFAULT, v58, buf, 0x20u);

LABEL_82:
                    goto LABEL_83;
                  }
                }
                uint64_t v51 = [v88 topOfStackSuggestion];

                if (v51)
                {
                  v52 = [v88 topOfStackSuggestion];
                  if (!v52) {
                    goto LABEL_104;
                  }
                }
                else
                {
                  v59 = [v88 suggestedWidgets];
                  uint64_t v60 = [v59 count];

                  if (!v60
                    || ([v88 suggestedWidgets],
                        id v61 = objc_claimAutoreleasedReturnValue(),
                        [v61 firstObject],
                        v52 = objc_claimAutoreleasedReturnValue(),
                        v61,
                        !v52))
                  {
LABEL_104:
                    v99 = v88;

                    id v62 = __atxlog_handle_blending();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
                    {
                      v100 = [v99 config];
                      v101 = [v100 identifier];
                      int64_t v102 = [v172 config];
                      uint64_t v103 = [v102 pageIndex];
                      *(_DWORD *)buf = 138543618;
                      uint64_t v216 = (uint64_t)v101;
                      __int16 v217 = 2048;
                      uint64_t v218 = v103;
                      _os_log_impl(&dword_1D0FA3000, v62, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: found target stack %{public}@ on page %lu -- stack does not yet have an existingSuggestion", buf, 0x16u);

                      long long v41 = v165;
                    }
                    int v87 = 1;
                    goto LABEL_107;
                  }
                }
                if (!v170 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
LABEL_72:
                  uint64_t v69 = [v52 mainSuggestionInLayout];
                  uint64_t v70 = [v46 objectForKeyedSubscript:v69];
                  unint64_t v71 = [v70 unsignedIntegerValue];

                  if (v71 >= v162)
                  {
                    if (v163)
                    {
                      v77 = [v167 mainSuggestionInLayout];
                      uint64_t v78 = [v46 objectForKeyedSubscript:v77];
                      unint64_t v79 = [v78 unsignedIntegerValue];

                      if (v71 <= v79)
                      {
                        unint64_t v23 = v160;
                        long long v41 = v165;
                        goto LABEL_83;
                      }
                      uint64_t v80 = __atxlog_handle_blending();
                      if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                      {
                        uint64_t v155 = [v88 config];
                        uint64_t v81 = [v155 identifier];
                        v82 = [v172 config];
                        uint64_t v83 = [v82 pageIndex];
                        v84 = [v52 suggestionLayout];
                        *(_DWORD *)buf = 138543874;
                        uint64_t v216 = (uint64_t)v81;
                        __int16 v217 = 2048;
                        uint64_t v218 = v83;
                        BOOL v46 = v159;
                        __int16 v219 = 2112;
                        v220 = v84;
                        _os_log_impl(&dword_1D0FA3000, v80, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: found a better target stack %{public}@ on page %lu with inferior existingSuggestion %@", buf, 0x20u);
                      }
                      uint64_t v85 = v88;

                      uint64_t v53 = v167;
                      long long v167 = v52;
                      long long v163 = v85;
                      unint64_t v23 = v160;
                    }
                    else
                    {
                      long long v163 = v88;
                      uint64_t v53 = v167;
                      long long v167 = v52;
                    }
                  }
                  else
                  {
                    uint64_t v53 = __atxlog_handle_blending();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                    {
                      v72 = [v88 config];
                      v73 = [v72 identifier];
                      v74 = [v172 config];
                      uint64_t v75 = [v74 pageIndex];
                      v76 = [v52 suggestionLayout];
                      *(_DWORD *)buf = 138543874;
                      uint64_t v216 = (uint64_t)v73;
                      __int16 v217 = 2048;
                      uint64_t v218 = v75;
                      BOOL v46 = v159;
                      __int16 v219 = 2112;
                      v220 = v76;
                      _os_log_impl(&dword_1D0FA3000, v53, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: can't assign to stack %{public}@ on page %lu -- superior existingSuggestion %@", buf, 0x20u);

                      unint64_t v23 = v160;
                    }
                  }
                  long long v41 = v165;
                  goto LABEL_82;
                }
                id v62 = v52;
                if ([v62 isLayoutComplete])
                {
                  id v63 = __atxlog_handle_blending();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v64 = [v88 config];
                    uint64_t v65 = [v64 identifier];
                    uint64_t v66 = [v172 config];
                    uint64_t v67 = [v66 pageIndex];
                    *(_DWORD *)buf = 138543618;
                    uint64_t v216 = (uint64_t)v65;
                    __int16 v217 = 2048;
                    uint64_t v218 = v67;
                    _os_log_impl(&dword_1D0FA3000, v63, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: stack %{public}@ on page %lu is not eligible to surface suggestion because it already contains an existing suggested SG widget with a complete layout.", buf, 0x16u);

                    long long v41 = v165;
                  }

                  v52 = v62;
LABEL_83:

                  if (v45 == ++v47)
                  {
                    uint64_t v86 = [v41 countByEnumeratingWithState:&v190 objects:v221 count:16];
                    uint64_t v45 = v86;
                    if (!v86)
                    {
                      id v27 = v152;
                      id v35 = v149;
                      uint64_t v38 = v146;
                      uint64_t v37 = v147;
                      goto LABEL_89;
                    }
                    continue;
                  }
                  goto LABEL_49;
                }
                break;
              }
              if (![v62 canAddSuggestion:v23])
              {

                goto LABEL_72;
              }
              uint64_t v118 = v88;

              uint64_t v119 = __atxlog_handle_blending();
              if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
              {
                v120 = [v118 config];
                id v121 = [v120 identifier];
                v122 = [v172 config];
                uint64_t v123 = [v122 pageIndex];
                *(_DWORD *)buf = 138543618;
                uint64_t v216 = (uint64_t)v121;
                __int16 v217 = 2048;
                uint64_t v218 = v123;
                _os_log_impl(&dword_1D0FA3000, v119, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: found target stack %{public}@ on page %lu -- existingSuggestion is SG widget with empty slot", buf, 0x16u);

                long long v41 = v165;
              }

              int v87 = 0;
              long long v167 = v62;
LABEL_107:
              id v27 = v152;

LABEL_108:
              if (v88)
              {
                v104 = __atxlog_handle_blending();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                {
                  id v105 = [v88 config];
                  id v106 = [v105 identifier];
                  id v107 = [v88 page];
                  id v108 = [v107 config];
                  uint64_t v109 = [v108 pageIndex];
                  *(_DWORD *)buf = 138543874;
                  uint64_t v216 = (uint64_t)v106;
                  __int16 v217 = 2048;
                  uint64_t v218 = v109;
                  __int16 v219 = 2112;
                  v220 = v23;
                  _os_log_impl(&dword_1D0FA3000, v104, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: ASSIGNING suggestion to target stack %{public}@ on page %lu as new Widget Suggestion: %@", buf, 0x20u);
                }
                [(ATXHomeScreenLayoutSelector2 *)self _assignSuggestion:v23 toTopOfStack:v88];
                if (v87) {
                  ++self->_numSuggestedWidgetInPastDay;
                }
                if (v174) {
                  ++self->_numWidgetReloadForSuggestionInPastDay;
                }
                uint64_t v22 = v157;
                goto LABEL_124;
              }
              uint64_t v22 = v157;
LABEL_121:
              v114 = __atxlog_handle_blending();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v216 = (uint64_t)v23;
                _os_log_impl(&dword_1D0FA3000, v114, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Unable to find suitable target stack for suggestion %@", buf, 0xCu);
              }

              v88 = 0;
LABEL_124:

LABEL_125:
              if (++v22 == v153)
              {
                uint64_t v124 = [obj countByEnumeratingWithState:&v202 objects:v224 count:16];
                uint64_t v153 = v124;
                if (!v124) {
                  goto LABEL_147;
                }
                goto LABEL_13;
              }
              goto LABEL_14;
            }
            id v27 = v152;
LABEL_89:
            uint64_t v39 = v150;
          }

          if (++v39 == v37)
          {
            uint64_t v37 = [v35 countByEnumeratingWithState:&v194 objects:v222 count:16];
            if (!v37)
            {
              int v87 = 1;
              v88 = v163;
              goto LABEL_108;
            }
            goto LABEL_39;
          }
        }
      }
      v88 = __atxlog_handle_blending();
      if (!os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_125;
      }
      id v115 = [v27 widgetBundleIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v216 = (uint64_t)v115;
      v116 = v88;
      uint64_t v117 = "HSLS [assignNewWidgetSuggestion]: Not considering making new Widget Suggestion for %@, because we have reac"
             "hed our reload budget.";
    }
    _os_log_impl(&dword_1D0FA3000, v116, OS_LOG_TYPE_DEFAULT, v117, buf, 0xCu);

    goto LABEL_125;
  }
  uint64_t v127 = __atxlog_handle_blending();
  if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0FA3000, v127, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Not considering making new Widget Suggestion, because we have reached our budget.", buf, 2u);
  }

LABEL_147:
  unint64_t v126 = [(ATXHomeScreenLayoutSelector2 *)self _suggestionsEligibleForSuggestedSGWidgetOnPages:v156 amongSuggestions:v144];
  uint64_t v128 = objc_opt_new();
  long long v186 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v189 = 0u;
  id v164 = v156;
  uint64_t v168 = [v164 countByEnumeratingWithState:&v186 objects:v214 count:16];
  if (v168)
  {
    uint64_t v166 = *(void *)v187;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v187 != v166) {
          objc_enumerationMutation(v164);
        }
        uint64_t v169 = v129;
        v130 = *(void **)(*((void *)&v186 + 1) + 8 * v129);
        long long v182 = 0u;
        long long v183 = 0u;
        long long v184 = 0u;
        long long v185 = 0u;
        id v171 = [v130 stacks];
        uint64_t v175 = [v171 countByEnumeratingWithState:&v182 objects:v213 count:16];
        if (v175)
        {
          uint64_t v173 = *(void *)v183;
          do
          {
            uint64_t v131 = 0;
            do
            {
              if (*(void *)v183 != v173) {
                objc_enumerationMutation(v171);
              }
              uint64_t v177 = v131;
              uint64_t v132 = *(void **)(*((void *)&v182 + 1) + 8 * v131);
              long long v178 = 0u;
              long long v179 = 0u;
              long long v180 = 0u;
              long long v181 = 0u;
              id v133 = [v132 suggestionsWidgetSuggestionsByWidgetUniqueId];
              uint64_t v134 = [v133 allValues];

              uint64_t v135 = [v134 countByEnumeratingWithState:&v178 objects:v212 count:16];
              if (v135)
              {
                uint64_t v136 = v135;
                uint64_t v137 = *(void *)v179;
                do
                {
                  for (uint64_t k = 0; k != v136; ++k)
                  {
                    if (*(void *)v179 != v137) {
                      objc_enumerationMutation(v134);
                    }
                    long long v139 = *(void **)(*((void *)&v178 + 1) + 8 * k);
                    long long v140 = [v139 widget];
                    if ([v140 isSuggestedWidget])
                    {
                      char v141 = [v139 isLayoutComplete];

                      if ((v141 & 1) == 0) {
                        [(ATXHomeScreenLayoutSelector2 *)self _fillSuggestedSGWidgetIfLayoutNotComplete:v139 withSuggestions:v126 updatingUsedSuggestionIndexSet:v128];
                      }
                    }
                    else
                    {
                    }
                  }
                  uint64_t v136 = [v134 countByEnumeratingWithState:&v178 objects:v212 count:16];
                }
                while (v136);
              }

              uint64_t v131 = v177 + 1;
            }
            while (v177 + 1 != v175);
            uint64_t v175 = [v171 countByEnumeratingWithState:&v182 objects:v213 count:16];
          }
          while (v175);
        }

        uint64_t v129 = v169 + 1;
      }
      while (v169 + 1 != v168);
      uint64_t v168 = [v164 countByEnumeratingWithState:&v186 objects:v214 count:16];
    }
    while (v168);
  }

  id v11 = v159;
  v125 = v142;
  long long v12 = v143;
LABEL_173:
}

uint64_t __126__ATXHomeScreenLayoutSelector2__assignNewSuggestedWidgetsForPages_rankedSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) _hasEligibleWidgetSuggestionsStacksForSuggestion:v3 onPages:*(void *)(a1 + 40) ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:1];
  if (v4)
  {
    id v5 = __atxlog_handle_blending();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "HSLS [assignNewWidgetSuggestion]: Found suggestion eligible for making new Widget Suggestion %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (BOOL)_stackHasRemainingReloadBudgetForWidgetSuggestion:(id)a3 homeScreenState:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_31;
  }
  if (CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0))
  {
    BOOL v8 = 1;
    goto LABEL_34;
  }
  uint64_t v9 = [(ATXHomeScreenLayoutSelector2 *)self widgetSuggestionReloadBudgetByStackId];

  if (v9) {
    goto LABEL_5;
  }
  if ([(ATXHomeScreenLayoutSelector2 *)self hasAskedChronoAboutReloadBudget]) {
    goto LABEL_31;
  }
  uint64_t v39 = self;
  id v41 = v6;
  long long v12 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v40 = v7;
  id obj = [v7 sortedPagesByUserLastVisit];
  uint64_t v44 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (!v44) {
    goto LABEL_26;
  }
  uint64_t v43 = *(void *)v53;
  do
  {
    uint64_t v13 = 0;
    do
    {
      if (*(void *)v53 != v43) {
        objc_enumerationMutation(obj);
      }
      uint64_t v45 = v13;
      uint64_t v14 = *(void **)(*((void *)&v52 + 1) + 8 * v13);
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v15 = [v14 stacks];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v49 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            CFStringRef v21 = [v20 config];
            if ([v21 allowsNewWidget])
            {
              uint64_t v22 = [v20 config];
              unint64_t v23 = [v22 widgets];
              unint64_t v24 = [v23 count];

              if (v24 < 2) {
                continue;
              }
              CFStringRef v21 = [v20 config];
              uint64_t v25 = [v21 identifier];
              [v12 addObject:v25];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v17);
      }

      uint64_t v13 = v45 + 1;
    }
    while (v45 + 1 != v44);
    uint64_t v44 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  }
  while (v44);
LABEL_26:

  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  self = v39;
  chronoService = v39->_chronoService;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke;
  v46[3] = &unk_1E68AE078;
  v46[4] = v39;
  id v28 = v26;
  uint64_t v47 = v28;
  [(CHSProactiveService *)chronoService suggestionBudgetsForStackIdentifiers:v12 completion:v46];
  if ([MEMORY[0x1E4F93B18] waitForSemaphore:v28 timeoutSeconds:2.0] == 1)
  {
    char v29 = __atxlog_handle_blending();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLayoutSelector2 _stackHasRemainingReloadBudgetForWidgetSuggestion:homeScreenState:](v29, v30, v31, v32, v33, v34, v35, v36);
    }
  }
  [(ATXHomeScreenLayoutSelector2 *)v39 setHasAskedChronoAboutReloadBudget:1];
  uint64_t v37 = [(ATXHomeScreenLayoutSelector2 *)v39 widgetSuggestionReloadBudgetByStackId];

  id v7 = v40;
  id v6 = v41;
  if (!v37)
  {
LABEL_31:
    BOOL v8 = 0;
    goto LABEL_34;
  }
LABEL_5:
  id v10 = [(ATXHomeScreenLayoutSelector2 *)self widgetSuggestionReloadBudgetByStackId];
  id v11 = [v10 objectForKeyedSubscript:v6];

  if (v11) {
    BOOL v8 = [v11 integerValue] > 0;
  }
  else {
    BOOL v8 = 1;
  }

LABEL_34:
  return v8;
}

void __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke_cold_1();
    }
  }
  BOOL v8 = __atxlog_handle_blending();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    id v10 = v5;
  }

  [*(id *)(a1 + 32) setWidgetSuggestionReloadBudgetByStackId:v5];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions:(id)a3 suggestionToRankingIndex:(id)a4 homeScreenState:(id)a5
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v80 = a4;
  id v8 = a5;
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = __144__ATXHomeScreenLayoutSelector2__updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke;
  v101[3] = &unk_1E68AE0A0;
  id v9 = v8;
  id v102 = v9;
  uint64_t v67 = objc_msgSend(a3, "_pas_filteredArrayWithTest:", v101);
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v62 = v9;
  id obj = [v9 sortedPagesByUserLastVisit];
  uint64_t v65 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
  if (v65)
  {
    uint64_t v64 = *(void *)v98;
    v77 = self;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v98 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v66 = v10;
        uint64_t v11 = *(void **)(*((void *)&v97 + 1) + 8 * v10);
        long long v12 = [(ATXHomeScreenLayoutSelector2 *)self _suggestionsWidgetSuggestionsByPriorityOnPage:v11];
        long long v93 = 0u;
        long long v94 = 0u;
        long long v95 = 0u;
        long long v96 = 0u;
        id v69 = v12;
        uint64_t v70 = [v12 countByEnumeratingWithState:&v93 objects:v110 count:16];
        if (v70)
        {
          uint64_t v13 = *(void *)v94;
          v73 = v11;
          uint64_t v68 = *(void *)v94;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v94 != v13) {
                objc_enumerationMutation(v69);
              }
              uint64_t v71 = v14;
              uint64_t v15 = *(void **)(*((void *)&v93 + 1) + 8 * v14);
              uint64_t v16 = [v15 widget];
              char v17 = [v16 isSuggestedWidget];

              if ((v17 & 1) == 0)
              {
                v72 = [v15 stack];
                long long v89 = 0u;
                long long v90 = 0u;
                long long v91 = 0u;
                long long v92 = 0u;
                id v18 = v67;
                uint64_t v19 = [v18 countByEnumeratingWithState:&v89 objects:v109 count:16];
                if (v19)
                {
                  uint64_t v20 = v19;
                  uint64_t v21 = *(void *)v90;
                  uint64_t v74 = *(void *)v90;
                  id v75 = v18;
                  while (2)
                  {
                    uint64_t v22 = 0;
                    uint64_t v76 = v20;
                    do
                    {
                      if (*(void *)v90 != v21) {
                        objc_enumerationMutation(v18);
                      }
                      unint64_t v23 = *(void **)(*((void *)&v89 + 1) + 8 * v22);
                      if (-[ATXHomeScreenLayoutSelector2 _shouldConsiderSuggestionForSuggestionsWidget:](self, "_shouldConsiderSuggestionForSuggestionsWidget:", v23)&& ([v11 isShowingDuplicatedContentForSuggestion:v23 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:1] & 1) == 0)
                      {
                        unint64_t v79 = v23;
                        if ([v15 isLayoutComplete])
                        {
                          uint64_t v78 = v22;
                          unint64_t v24 = v15;
                          uint64_t v25 = [v15 suggestionLayout];
                          dispatch_semaphore_t v26 = [v25 allSuggestionsInLayout];

                          id v27 = [v26 firstObject];
                          id v28 = [v80 objectForKeyedSubscript:v27];
                          unint64_t v29 = [v28 unsignedIntegerValue];

                          long long v87 = 0u;
                          long long v88 = 0u;
                          long long v85 = 0u;
                          long long v86 = 0u;
                          id v30 = v26;
                          uint64_t v31 = [v30 countByEnumeratingWithState:&v85 objects:v104 count:16];
                          if (v31)
                          {
                            uint64_t v32 = v31;
                            uint64_t v33 = *(void *)v86;
                            do
                            {
                              for (uint64_t i = 0; i != v32; ++i)
                              {
                                if (*(void *)v86 != v33) {
                                  objc_enumerationMutation(v30);
                                }
                                uint64_t v35 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                                uint64_t v36 = [v80 objectForKeyedSubscript:v35];
                                unint64_t v37 = [v36 unsignedIntegerValue];

                                if (v29 < v37)
                                {
                                  id v38 = v35;

                                  unint64_t v29 = v37;
                                  id v27 = v38;
                                }
                              }
                              uint64_t v32 = [v30 countByEnumeratingWithState:&v85 objects:v104 count:16];
                            }
                            while (v32);
                          }

                          uint64_t v39 = [v80 objectForKeyedSubscript:v79];
                          unint64_t v40 = [v39 unsignedIntegerValue];

                          self = v77;
                          if (v29 >= v40)
                          {
                            id v41 = __atxlog_handle_blending();
                            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                            {
                              uint64_t v42 = [v24 widget];
                              uint64_t v43 = [v42 widgetUniqueId];
                              *(_DWORD *)buf = 138543618;
                              id v106 = v43;
                              __int16 v107 = 2112;
                              id v108 = v79;
                              _os_log_impl(&dword_1D0FA3000, v41, OS_LOG_TYPE_DEFAULT, "HSLS [updateSGLayoutWithUnusedConvertableShortcut]: updating SG %{public}@ layout, because we have a better unused convertable shortcut suggestion %@", buf, 0x16u);
                            }
                            uint64_t v44 = [_ATXSuggestionsWidgetSuggestion alloc];
                            uint64_t v45 = [v24 widget];
                            BOOL v46 = [(_ATXSuggestionsWidgetSuggestion *)v44 initWithSuggestionsWidget:v45 containingStack:v72 suggestionDeduplicator:v77->_suggestionDeduplicator hyperParameters:v77->_hyperParameters];

                            long long v83 = 0u;
                            long long v84 = 0u;
                            long long v81 = 0u;
                            long long v82 = 0u;
                            id v47 = v30;
                            uint64_t v48 = [v47 countByEnumeratingWithState:&v81 objects:v103 count:16];
                            if (v48)
                            {
                              uint64_t v49 = v48;
                              uint64_t v50 = *(void *)v82;
                              do
                              {
                                for (uint64_t j = 0; j != v49; ++j)
                                {
                                  if (*(void *)v82 != v50) {
                                    objc_enumerationMutation(v47);
                                  }
                                  long long v52 = *(void **)(*((void *)&v81 + 1) + 8 * j);
                                  long long v53 = [v24 mainSuggestionInLayout];
                                  if (v52 == v27) {
                                    long long v54 = v79;
                                  }
                                  else {
                                    long long v54 = v52;
                                  }
                                  [(_ATXCompositeLayoutWidgetSuggestionBase *)v46 addSuggestion:v54 asMainSuggestion:v53 == 0];
                                }
                                uint64_t v49 = [v47 countByEnumeratingWithState:&v81 objects:v103 count:16];
                              }
                              while (v49);
                            }

                            if ([(_ATXCompositeLayoutWidgetSuggestionBase *)v46 isLayoutComplete])
                            {
                              v59 = [v72 suggestionsWidgetSuggestionsByWidgetUniqueId];
                              uint64_t v60 = [v24 widget];
                              id v61 = [v60 widgetUniqueId];
                              [v59 setObject:v46 forKeyedSubscript:v61];

                              self = v77;
                              [(ATXHomeScreenLayoutSelector2 *)v77 _rotateStackToUpdatedSGSuggestionIfNecessary:v46 suggestionToRankingIndex:v80];

                              uint64_t v11 = v73;
                              id v18 = v75;
                              goto LABEL_53;
                            }

                            self = v77;
                          }

                          id v18 = v75;
                          uint64_t v20 = v76;
                          uint64_t v15 = v24;
                          uint64_t v11 = v73;
                          uint64_t v21 = v74;
                          uint64_t v22 = v78;
                        }
                        else
                        {
                          long long v55 = __atxlog_handle_blending();
                          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                          {
                            uint64_t v56 = [v15 widget];
                            v57 = [v56 widgetUniqueId];
                            *(_DWORD *)buf = 138543618;
                            id v106 = v57;
                            __int16 v107 = 2112;
                            id v108 = v79;
                            _os_log_impl(&dword_1D0FA3000, v55, OS_LOG_TYPE_DEFAULT, "HSLS [updateSGLayoutWithUnusedConvertableShortcut]: ASSIGNING suggestion to unfilled SG %{public}@: %@", buf, 0x16u);
                          }
                          uint64_t v58 = [v15 mainSuggestionInLayout];
                          [v15 addSuggestion:v79 asMainSuggestion:v58 == 0];

                          if ([v15 isLayoutComplete])
                          {
                            [(ATXHomeScreenLayoutSelector2 *)self _rotateStackToUpdatedSGSuggestionIfNecessary:v15 suggestionToRankingIndex:v80];
                            goto LABEL_53;
                          }
                        }
                      }
                      ++v22;
                    }
                    while (v22 != v20);
                    uint64_t v20 = [v18 countByEnumeratingWithState:&v89 objects:v109 count:16];
                    if (v20) {
                      continue;
                    }
                    break;
                  }
                }
LABEL_53:

                uint64_t v13 = v68;
              }
              uint64_t v14 = v71 + 1;
            }
            while (v71 + 1 != v70);
            uint64_t v70 = [v69 countByEnumeratingWithState:&v93 objects:v110 count:16];
          }
          while (v70);
        }

        uint64_t v10 = v66 + 1;
      }
      while (v66 + 1 != v65);
      uint64_t v65 = [obj countByEnumeratingWithState:&v97 objects:v111 count:16];
    }
    while (v65);
  }
}

uint64_t __144__ATXHomeScreenLayoutSelector2__updateSuggestionsWidgetLayoutIfNecessaryWithRankedShortcutSuggestions_suggestionToRankingIndex_homeScreenState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 executableSpecification];
  uint64_t v5 = [v4 executableType];

  if (v5 == 2)
  {
    id v6 = [v3 atxActionExecutableObject];
    id v7 = [v6 intent];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [v3 executableSpecification];
  uint64_t v9 = [v8 executableType];

  if (v9 == 10)
  {
    uint64_t v10 = [v3 linkActionExecutableObject];
    uint64_t v11 = [v10 cachedAppIntent];

    id v7 = (void *)v11;
  }
  if (v7) {
    uint64_t v12 = [*(id *)(a1 + 32) containsWidgetForIntent:v7] ^ 1;
  }
  else {
    uint64_t v12 = 1;
  }

  return v12;
}

- (void)_rotateStackToUpdatedSGSuggestionIfNecessary:(id)a3 suggestionToRankingIndex:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isLayoutComplete])
  {
    id v7 = [v5 stack];
    id v8 = [v7 config];
    int v9 = [v8 allowsSmartRotate];

    if (v9)
    {
      uint64_t v35 = v7;
      uint64_t v36 = v5;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v10 = [v5 suggestionLayout];
      uint64_t v11 = [v10 allSuggestionsInLayout];

      uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        uint64_t v15 = *(void *)v38;
        unint64_t v16 = -1;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v38 != v15) {
              objc_enumerationMutation(v11);
            }
            id v18 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v19 = [v6 objectForKeyedSubscript:v18];
            unint64_t v20 = [v19 unsignedIntegerValue];

            if (v20 < v16)
            {
              id v21 = v18;

              unint64_t v16 = v20;
              uint64_t v14 = v21;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v37 objects:v47 count:16];
        }
        while (v13);
      }
      else
      {
        uint64_t v14 = 0;
        unint64_t v16 = -1;
      }

      uint64_t v22 = [v14 scoreSpecification];
      uint64_t v23 = [v22 suggestedConfidenceCategory];

      id v7 = v35;
      id v5 = v36;
      if (v23 >= 3)
      {
        unint64_t v24 = [v35 topOfStackSuggestion];

        if (v24)
        {
          uint64_t v25 = [v35 topOfStackSuggestion];
          dispatch_semaphore_t v26 = [v25 mainSuggestionInLayout];

          id v27 = [v6 objectForKeyedSubscript:v26];
          unint64_t v28 = [v27 unsignedIntegerValue];
        }
        else
        {
          unint64_t v28 = -1;
        }
        if (v16 < v28)
        {
          unint64_t v29 = __atxlog_handle_default();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = [v35 config];
            uint64_t v31 = [v30 identifier];
            uint64_t v32 = [v36 widget];
            uint64_t v33 = [v32 widgetUniqueId];
            uint64_t v34 = [v35 topOfStackSuggestion];
            *(_DWORD *)buf = 138543874;
            uint64_t v42 = v31;
            __int16 v43 = 2114;
            uint64_t v44 = v33;
            __int16 v45 = 2112;
            BOOL v46 = v34;
            _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "HSLS [updateSGLayoutWithUnusedConvertableShortcut]: rotating stack %{public}@ to SG widget %{public}@, because old topOfStackSuggestion is inferior: %@", buf, 0x20u);
          }
          [v35 setTopOfStackSuggestion:v36];
        }
      }
    }
  }
}

- (id)_suggestionsWidgetSuggestionsByPriorityOnPage:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  unint64_t v29 = objc_opt_new();
  id v5 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  dispatch_semaphore_t v26 = v3;
  id obj = [v3 stacks];
  uint64_t v6 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v36;
    uint64_t v27 = *(void *)v36;
    do
    {
      uint64_t v9 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * v9);
        uint64_t v11 = [v10 topOfStackSuggestion];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          uint64_t v13 = [v10 config];
          int v14 = [v13 isPinnedSuggestionsWidget];

          uint64_t v15 = [v10 topOfStackSuggestion];
          if (v14) {
            unint64_t v16 = v4;
          }
          else {
            unint64_t v16 = v29;
          }
          [v16 addObject:v15];
        }
        else
        {
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          char v17 = [v10 suggestionsWidgetSuggestionsByWidgetUniqueId];
          uint64_t v15 = [v17 allValues];

          uint64_t v18 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
          if (v18)
          {
            uint64_t v19 = v18;
            unint64_t v20 = v4;
            uint64_t v21 = *(void *)v32;
            do
            {
              for (uint64_t i = 0; i != v19; ++i)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v23 = *(void **)(*((void *)&v31 + 1) + 8 * i);
                unint64_t v24 = [v10 topOfStackSuggestion];

                if (v23 != v24) {
                  [v5 addObject:v23];
                }
              }
              uint64_t v19 = [v15 countByEnumeratingWithState:&v31 objects:v39 count:16];
            }
            while (v19);
            uint64_t v4 = v20;
            uint64_t v8 = v27;
            uint64_t v7 = v28;
          }
        }

        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  [v4 addObjectsFromArray:v29];
  [v4 addObjectsFromArray:v5];

  return v4;
}

- (id)_filterRankedSuggestions:(id)a3 homeScreenState:(id)a4
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v62 = a4;
  id v61 = objc_opt_new();
  id v63 = objc_opt_new();
  unint64_t v7 = 5;
  do
  {
    --v7;
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [NSNumber numberWithInteger:v7];
    [v61 setObject:v8 forKeyedSubscript:v9];

    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [NSNumber numberWithInteger:v7];
    [v63 setObject:v10 forKeyedSubscript:v11];
  }
  while (v7 > 1);
  uint64_t v60 = [(ATXEngagementRecordManager *)self->_engagementRecordManager engagedExecutablesOfType:4 queryOptions:0];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id obj = v6;
  uint64_t v12 = [obj countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (!v12) {
    goto LABEL_39;
  }
  uint64_t v65 = *(void *)v92;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v92 != v65) {
        objc_enumerationMutation(obj);
      }
      int v14 = *(void **)(*((void *)&v91 + 1) + 8 * i);
      uint64_t v15 = (void *)MEMORY[0x1D25F6CC0]();
      if (([(ATXBlendingLayerHyperParameters *)self->_hyperParameters uiSupportsSuggestion:v14 consumerSubType:34] & 1) != 0|| ([(ATXBlendingLayerHyperParameters *)self->_hyperParameters uiSupportsSuggestion:v14 consumerSubType:37] & 1) != 0|| [(ATXBlendingLayerHyperParameters *)self->_hyperParameters uiSupportsSuggestion:v14 consumerSubType:36])
      {
        unint64_t v16 = objc_msgSend(v14, "executableSpecification", v60);
        BOOL v17 = [v16 executableType] == 2;

        if (v17)
        {
          uint64_t v18 = [v14 atxActionExecutableObject];
          uint64_t v19 = v18;
          if (!v18)
          {
            uint64_t v19 = __atxlog_handle_blending();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v96 = (uint64_t)v14;
              _os_log_error_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_ERROR, "HSLS [preprocess]: Removing action suggestion, couldn't get ATXAction: %@", buf, 0xCu);
            }
            goto LABEL_36;
          }
          unint64_t v20 = [v18 intent];
          if (v20)
          {
            if ([v62 containsWidgetForIntent:v20])
            {
              uint64_t v21 = __atxlog_handle_blending();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v96 = (uint64_t)v14;
                uint64_t v22 = v21;
                uint64_t v23 = "HSLS [preprocess]: Removing action suggestion due to intent duplication with widget on screen \n"
                      "%@";
                goto LABEL_27;
              }
              goto LABEL_28;
            }
            if ([(ATXWidgetSuggestionDismissManager *)self->_widgetDismissManager shouldBlockSuggestionWithIntent:v20])
            {
              uint64_t v21 = __atxlog_handle_blending();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v96 = (uint64_t)v14;
                uint64_t v22 = v21;
                uint64_t v23 = "HSLS [preprocess]: Removing action suggestion due to previous suggested widget dismiss with same u"
                      "nderlying intent \n"
                      "%@";
LABEL_27:
                _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 0xCu);
              }
LABEL_28:

LABEL_36:
              goto LABEL_37;
            }
          }

LABEL_30:
        }
        else
        {
          unint64_t v24 = [v14 executableSpecification];
          BOOL v25 = [v24 executableType] == 3;

          if (v25)
          {
            dispatch_semaphore_t v26 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v14];
            uint64_t v19 = v26;
            if (!v26) {
              goto LABEL_20;
            }
            widgetDismissManager = self->_widgetDismissManager;
            uint64_t v28 = [v26 widgetBundleIdentifier];
            unint64_t v29 = [v19 widgetKind];
            id v30 = [v19 intent];
            LODWORD(widgetDismissManager) = [(ATXWidgetSuggestionDismissManager *)widgetDismissManager shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:v28 kind:v29 intent:v30];

            if (!widgetDismissManager)
            {
              if (![v60 count]
                || ([(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithSuggestion:v14 engagedExecutables:v60] & 1) != 0)
              {
                goto LABEL_30;
              }
              long long v35 = NSNumber;
              long long v31 = [v14 scoreSpecification];
              long long v36 = objc_msgSend(v35, "numberWithInteger:", -[NSObject suggestedConfidenceCategory](v31, "suggestedConfidenceCategory"));
              long long v37 = [v61 objectForKeyedSubscript:v36];
              [v37 addObject:v14];
            }
            else
            {
LABEL_20:
              long long v31 = __atxlog_handle_blending();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v96 = (uint64_t)v14;
                _os_log_impl(&dword_1D0FA3000, v31, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Removing widget suggestion due to previous dismiss \n%@", buf, 0xCu);
              }
            }

            goto LABEL_36;
          }
        }
        long long v32 = NSNumber;
        uint64_t v19 = [v14 scoreSpecification];
        long long v33 = objc_msgSend(v32, "numberWithInteger:", -[NSObject suggestedConfidenceCategory](v19, "suggestedConfidenceCategory"));
        long long v34 = [v63 objectForKeyedSubscript:v33];
        [v34 addObject:v14];

        goto LABEL_36;
      }
LABEL_37:
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v91 objects:v107 count:16];
  }
  while (v12);
LABEL_39:

  long long v38 = objc_opt_new();
  unint64_t v39 = 4;
  do
  {
    long long v40 = (void *)MEMORY[0x1D25F6CC0]();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    uint64_t v41 = [NSNumber numberWithInteger:v39];
    uint64_t v42 = [v61 objectForKeyedSubscript:v41];

    uint64_t v43 = [v42 countByEnumeratingWithState:&v87 objects:v106 count:16];
    if (v43)
    {
      uint64_t v44 = *(void *)v88;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v88 != v44) {
            objc_enumerationMutation(v42);
          }
          objc_msgSend(v38, "addObject:", *(void *)(*((void *)&v87 + 1) + 8 * j), v60);
        }
        uint64_t v43 = [v42 countByEnumeratingWithState:&v87 objects:v106 count:16];
      }
      while (v43);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    BOOL v46 = [NSNumber numberWithInteger:v39];
    id v47 = [v63 objectForKeyedSubscript:v46];

    uint64_t v48 = [v47 countByEnumeratingWithState:&v83 objects:v105 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v84;
      do
      {
        for (uint64_t k = 0; k != v48; ++k)
        {
          if (*(void *)v84 != v49) {
            objc_enumerationMutation(v47);
          }
          objc_msgSend(v38, "addObject:", *(void *)(*((void *)&v83 + 1) + 8 * k), v60);
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v83 objects:v105 count:16];
      }
      while (v48);
    }
  }
  while (v39-- > 1);
  [(_ATXHomeScreenTimelineRelevanceFilter *)self->_timelineRelevanceFilter scheduleBlendingRefreshAtNextTimelineRelevanceChangeRelatedToSuggestions:v38];
  long long v52 = [(_ATXHomeScreenTimelineRelevanceFilter *)self->_timelineRelevanceFilter removeSuggestionsByTimelineRelevanceIfNecessary:v38 homeScreenState:v62];

  uint64_t v79 = 0;
  id v80 = &v79;
  uint64_t v81 = 0x2020000000;
  uint64_t v82 = 0;
  uint64_t v75 = 0;
  uint64_t v76 = &v75;
  uint64_t v77 = 0x2020000000;
  uint64_t v78 = 0;
  uint64_t v71 = 0;
  v72 = &v71;
  uint64_t v73 = 0x2020000000;
  uint64_t v74 = 0;
  uint64_t v67 = 0;
  uint64_t v68 = &v67;
  uint64_t v69 = 0x2020000000;
  uint64_t v70 = 0;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __73__ATXHomeScreenLayoutSelector2__filterRankedSuggestions_homeScreenState___block_invoke;
  v66[3] = &unk_1E68AE0C8;
  v66[4] = &v79;
  v66[5] = &v71;
  v66[6] = &v75;
  v66[7] = &v67;
  [v52 enumerateObjectsUsingBlock:v66];
  long long v53 = __atxlog_handle_blending();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v54 = [v52 count];
    uint64_t v55 = v80[3];
    uint64_t v56 = v72[3];
    uint64_t v57 = v76[3];
    uint64_t v58 = v68[3];
    *(_DWORD *)buf = 134219008;
    uint64_t v96 = v54;
    __int16 v97 = 2048;
    uint64_t v98 = v55;
    __int16 v99 = 2048;
    uint64_t v100 = v56;
    __int16 v101 = 2048;
    uint64_t v102 = v57;
    __int16 v103 = 2048;
    uint64_t v104 = v58;
    _os_log_impl(&dword_1D0FA3000, v53, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: filterRankedSuggestions result count = %lu (%ld widget, %ld action, %ld apps, %ld Link actions)", buf, 0x34u);
  }

  _Block_object_dispose(&v67, 8);
  _Block_object_dispose(&v71, 8);
  _Block_object_dispose(&v75, 8);
  _Block_object_dispose(&v79, 8);

  return v52;
}

void __73__ATXHomeScreenLayoutSelector2__filterRankedSuggestions_homeScreenState___block_invoke(void *a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [v5 executableSpecification];
  uint64_t v7 = [v6 executableType];

  if (v7 == 3)
  {
    if (*(void *)(*(void *)(a1[4] + 8) + 24) < 3uLL
      || ([v5 scoreSpecification],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v8 suggestedConfidenceCategory],
          v8,
          v9 >= 3))
    {
      uint64_t v10 = __atxlog_handle_blending();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134218242;
        uint64_t v31 = a3;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_1D0FA3000, v10, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Widget Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }
    }
    uint64_t v11 = a1[4];
LABEL_29:
    ++*(void *)(*(void *)(v11 + 8) + 24);
    goto LABEL_30;
  }
  uint64_t v12 = [v5 executableSpecification];
  uint64_t v13 = [v12 executableType];

  if (v13 == 2)
  {
    if (*(void *)(*(void *)(a1[5] + 8) + 24) < 3uLL
      || ([v5 scoreSpecification],
          int v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 suggestedConfidenceCategory],
          v14,
          v15 >= 3))
    {
      unint64_t v16 = __atxlog_handle_blending();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134218242;
        uint64_t v31 = a3;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Action Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }
    }
    uint64_t v11 = a1[5];
    goto LABEL_29;
  }
  BOOL v17 = [v5 executableSpecification];
  uint64_t v18 = [v17 executableType];

  if (v18 == 1)
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24) < 3uLL
      || ([v5 scoreSpecification],
          uint64_t v19 = objc_claimAutoreleasedReturnValue(),
          uint64_t v20 = [v19 suggestedConfidenceCategory],
          v19,
          v20 >= 3))
    {
      uint64_t v21 = __atxlog_handle_blending();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134218242;
        uint64_t v31 = a3;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: App suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }
    }
    uint64_t v11 = a1[6];
    goto LABEL_29;
  }
  uint64_t v22 = [v5 executableSpecification];
  uint64_t v23 = [v22 executableType];

  if (v23 == 10)
  {
    if (*(void *)(*(void *)(a1[7] + 8) + 24) < 3uLL
      || ([v5 scoreSpecification],
          unint64_t v24 = objc_claimAutoreleasedReturnValue(),
          uint64_t v25 = [v24 suggestedConfidenceCategory],
          v24,
          v25 >= 3))
    {
      dispatch_semaphore_t v26 = __atxlog_handle_blending();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 134218242;
        uint64_t v31 = a3;
        __int16 v32 = 2112;
        id v33 = v5;
        _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Link action Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
      }
    }
    uint64_t v11 = a1[7];
    goto LABEL_29;
  }
  uint64_t v27 = [v5 scoreSpecification];
  uint64_t v28 = [v27 suggestedConfidenceCategory];

  if (v28 >= 3)
  {
    unint64_t v29 = __atxlog_handle_blending();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v30 = 134218242;
      uint64_t v31 = a3;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "HSLS [preprocess]: Suggestion at index %lu:\n%@", (uint8_t *)&v30, 0x16u);
    }
  }
LABEL_30:
}

- (void)_assignSuggestionsForExistingSuggestedWidgets:(id)a3 homeScreenState:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v5 = a4;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = [v5 sortedPagesByUserLastVisit];
  uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v47;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v6;
        uint64_t v7 = *(void **)(*((void *)&v46 + 1) + 8 * v6);
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v29 = [v7 stacks];
        uint64_t v8 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v43;
          uint64_t v27 = *(void *)v43;
          do
          {
            uint64_t v11 = 0;
            uint64_t v28 = v9;
            do
            {
              if (*(void *)v43 != v10) {
                objc_enumerationMutation(v29);
              }
              uint64_t v12 = *(void **)(*((void *)&v42 + 1) + 8 * v11);
              uint64_t v13 = [v12 config];
              int v14 = [v13 allowsNewWidget];

              if (v14)
              {
                uint64_t v30 = v11;
                long long v40 = 0u;
                long long v41 = 0u;
                long long v38 = 0u;
                long long v39 = 0u;
                uint64_t v15 = [v12 previousSuggestedWidgets];
                uint64_t v16 = [v15 countByEnumeratingWithState:&v38 objects:v50 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = *(void *)v39;
                  do
                  {
                    for (uint64_t i = 0; i != v17; ++i)
                    {
                      if (*(void *)v39 != v18) {
                        objc_enumerationMutation(v15);
                      }
                      uint64_t v20 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        id v21 = v20;
                        v33[0] = MEMORY[0x1E4F143A8];
                        v33[1] = 3221225472;
                        v33[2] = __94__ATXHomeScreenLayoutSelector2__assignSuggestionsForExistingSuggestedWidgets_homeScreenState___block_invoke;
                        v33[3] = &unk_1E68AE0F0;
                        v33[4] = self;
                        v33[5] = v12;
                        id v34 = v21;
                        long long v35 = v7;
                        id v36 = v5;
                        id v37 = v21;
                        id v22 = v21;
                        [v32 enumerateObjectsUsingBlock:v33];
                      }
                    }
                    uint64_t v17 = [v15 countByEnumeratingWithState:&v38 objects:v50 count:16];
                  }
                  while (v17);
                }

                uint64_t v10 = v27;
                uint64_t v9 = v28;
                uint64_t v11 = v30;
              }
              ++v11;
            }
            while (v11 != v9);
            uint64_t v9 = [v29 countByEnumeratingWithState:&v42 objects:v51 count:16];
          }
          while (v9);
        }

        uint64_t v6 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    }
    while (v25);
  }
}

void __94__ATXHomeScreenLayoutSelector2__assignSuggestionsForExistingSuggestedWidgets_homeScreenState___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = [v6 executableSpecification];
  if ([(_ATXSimpleWidgetSuggestion *)v7 executableType] != 3
    || ![*(id *)(*(void *)(a1 + 32) + 72) currentModeConfigurationAllowsSuggestion:v6]|| !objc_msgSend(*(id *)(a1 + 40), "sizeIsCompatibleWithWidgetSuggestion:", v6))
  {
LABEL_19:

    goto LABEL_20;
  }
  int v8 = [*(id *)(a1 + 48) containsIdenticalContentOfSuggestion:v6];

  if (v8)
  {
    uint64_t v9 = [*(id *)(a1 + 56) config];
    uint64_t v10 = [v9 pageIndex];
    uint64_t v11 = *MEMORY[0x1E4F4B540];

    if (v10 == v11)
    {
      if ([*(id *)(a1 + 56) isShowingDuplicatedContentForSuggestion:v6 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:0])goto LABEL_20; {
LABEL_9:
      }
      uint64_t v12 = [v6 scoreSpecification];
      uint64_t v13 = [v12 suggestedConfidenceCategory];

      if (v13 <= 2)
      {
        int v14 = *(void **)(*(void *)(a1 + 32) + 56);
        uint64_t v15 = [*(id *)(a1 + 72) widget];
        uint64_t v16 = [v15 widgetUniqueId];
        uint64_t v7 = [v14 firstAppearDateOfSuggestedWidgetWithUniqueId:v16];

        if (!v7 || ([(_ATXSimpleWidgetSuggestion *)v7 timeIntervalSinceNow], v17 < -10800.0))
        {
          uint64_t v18 = __atxlog_handle_blending();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [*(id *)(a1 + 72) widget];
            uint64_t v20 = [v19 compactDescription];
            id v21 = [*(id *)(a1 + 72) widget];
            id v22 = [v21 widgetUniqueId];
            uint64_t v23 = [*(id *)(a1 + 40) config];
            uint64_t v24 = [v23 identifier];
            int v35 = 138412802;
            id v36 = v20;
            __int16 v37 = 2114;
            long long v38 = v22;
            __int16 v39 = 2114;
            long long v40 = v24;
            _os_log_impl(&dword_1D0FA3000, v18, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedWidgets]: Not assigning low conf suggestion for exisiting suggested widget %@ (uniqueID %{public}@) for stack %{public}@ because it first appeared more than 3 hrs ago.", (uint8_t *)&v35, 0x20u);
          }
          goto LABEL_19;
        }
      }
      uint64_t v25 = [_ATXSimpleWidgetSuggestion alloc];
      uint64_t v26 = [*(id *)(a1 + 48) widget];
      uint64_t v7 = [(_ATXSimpleWidgetSuggestion *)v25 initWithWidget:v26 suggestion:v6 stack:*(void *)(a1 + 40) suggestionDeduplicator:*(void *)(*(void *)(a1 + 32) + 24)];

      uint64_t v27 = [*(id *)(a1 + 40) suggestedWidgets];
      [v27 addObject:v7];

      uint64_t v28 = __atxlog_handle_blending();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = [(_ATXSimpleWidgetSuggestion *)v7 widget];
        uint64_t v30 = [v29 compactDescription];
        uint64_t v31 = [(_ATXSimpleWidgetSuggestion *)v7 widget];
        id v32 = [v31 widgetUniqueId];
        id v33 = [*(id *)(a1 + 40) config];
        id v34 = [v33 identifier];
        int v35 = 138413058;
        id v36 = v30;
        __int16 v37 = 2114;
        long long v38 = v32;
        __int16 v39 = 2114;
        long long v40 = v34;
        __int16 v41 = 2112;
        id v42 = v6;
        _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "HSLS [assignExistingSuggestedWidgets]: Kept existing suggested widget %@ (uniqueID %{public}@) for stack %{public}@ by suggestion:\n%@", (uint8_t *)&v35, 0x2Au);
      }
      *a4 = 1;
      goto LABEL_19;
    }
    if (([*(id *)(a1 + 64) isShowingDuplicatedContentForSuggestion:v6 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:0 ignoreTodayPage:1] & 1) == 0)goto LABEL_9; {
  }
    }
LABEL_20:
}

- (void)_rotateAwayFromPreviousSystemInitiatedRotationIfNecessary:(id)a3 homeScreenState:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = [a4 sortedPagesByUserLastVisit];
  uint64_t v40 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v62;
    id v42 = self;
    id v43 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v62 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v41 = v7;
        int v8 = *(void **)(*((void *)&v61 + 1) + 8 * v7);
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v48 = v8;
        uint64_t v9 = [v8 stacks];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v71 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v58;
          uint64_t v44 = *(void *)v58;
          long long v45 = v9;
          do
          {
            uint64_t v13 = 0;
            uint64_t v46 = v11;
            do
            {
              if (*(void *)v58 != v12) {
                objc_enumerationMutation(v9);
              }
              int v14 = *(void **)(*((void *)&v57 + 1) + 8 * v13);
              uint64_t v15 = [v14 config];
              if (![v15 allowsSmartRotate]) {
                goto LABEL_14;
              }
              uint64_t v16 = [v14 topOfStackSuggestion];
              if (v16) {
                goto LABEL_13;
              }
              int v17 = [v14 mostRecentRotationOfStackIsSystemInitiated];

              if (v17)
              {
                uint64_t v15 = [v14 previousTopWidget];
                if (v15)
                {
                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  id v18 = v6;
                  uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v70 count:16];
                  id v47 = v18;
                  if (v19)
                  {
                    uint64_t v20 = v19;
                    uint64_t v21 = *(void *)v54;
LABEL_21:
                    uint64_t v22 = 0;
                    while (1)
                    {
                      if (*(void *)v54 != v21) {
                        objc_enumerationMutation(v47);
                      }
                      if ([(ATXSuggestionDeduplicatorProtocol *)self->_suggestionDeduplicator isWidget:v15 showingIdenticalContentOfSuggestion:*(void *)(*((void *)&v53 + 1) + 8 * v22)])break; {
                      if (v20 == ++v22)
                      }
                      {
                        id v18 = v47;
                        uint64_t v20 = [v47 countByEnumeratingWithState:&v53 objects:v70 count:16];
                        if (v20) {
                          goto LABEL_21;
                        }
                        goto LABEL_27;
                      }
                    }
                  }
                  else
                  {
LABEL_27:

                    uint64_t v23 = __atxlog_handle_blending();
                    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v24 = [v14 config];
                      uint64_t v25 = [v24 identifier];
                      *(_DWORD *)buf = 138412546;
                      uint64_t v67 = v15;
                      __int16 v68 = 2114;
                      uint64_t v69 = v25;
                      _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "HSLS [rotateAwayFromIrrelevantWidget]: Previous system rotation to widget %@ in stack %{public}@ is no longer relevant, attempting to make a fresh rotation...", buf, 0x16u);

                      id v18 = v47;
                    }

                    long long v51 = 0u;
                    long long v52 = 0u;
                    long long v49 = 0u;
                    long long v50 = 0u;
                    id v26 = v18;
                    uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v65 count:16];
                    if (v27)
                    {
                      uint64_t v28 = v27;
                      uint64_t v29 = *(void *)v50;
                      while (2)
                      {
                        for (uint64_t i = 0; i != v28; ++i)
                        {
                          if (*(void *)v50 != v29) {
                            objc_enumerationMutation(v26);
                          }
                          uint64_t v31 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                          id v32 = [v31 executableSpecification];
                          if ([v32 executableType] == 3
                            && ![v48 isShowingDuplicatedContentForSuggestion:v31 considerUnderStackContents:0 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:0])
                          {
                            id v33 = [v14 widgetForSuggestion:v31 considerSuggestedWidgets:1];

                            if (v33)
                            {
                              id v34 = __atxlog_handle_blending();
                              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                              {
                                int v35 = [v14 config];
                                id v36 = [v35 identifier];
                                *(_DWORD *)buf = 138543618;
                                uint64_t v67 = v36;
                                __int16 v68 = 2112;
                                uint64_t v69 = v31;
                                _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEFAULT, "HSLS [rotateAwayFromIrrelevantWidget]: ASSIGNING a new top widget for stack %{public}@ by suggestion: \n%@", buf, 0x16u);
                              }
                              self = v42;
                              [(ATXHomeScreenLayoutSelector2 *)v42 _assignSuggestion:v31 toTopOfStack:v14];
                              id v6 = v43;
                              goto LABEL_44;
                            }
                          }
                          else
                          {
                          }
                        }
                        uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v65 count:16];
                        if (v28) {
                          continue;
                        }
                        break;
                      }
                      self = v42;
                      id v6 = v43;
LABEL_44:
                      uint64_t v12 = v44;
                      uint64_t v9 = v45;
                    }
                  }
                  uint64_t v11 = v46;
                  uint64_t v16 = v47;
LABEL_13:
                }
LABEL_14:
              }
              ++v13;
            }
            while (v13 != v11);
            uint64_t v37 = [v9 countByEnumeratingWithState:&v57 objects:v71 count:16];
            uint64_t v11 = v37;
          }
          while (v37);
        }

        uint64_t v7 = v41 + 1;
      }
      while (v41 + 1 != v40);
      uint64_t v40 = [obj countByEnumeratingWithState:&v61 objects:v72 count:16];
    }
    while (v40);
  }
}

- (void)_preservePreviousAppSuggestionPositionsWithHomeScreenState:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [a3 sortedPagesByUserLastVisit];
  uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
  if (v25)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v3;
        uint64_t v4 = *(void **)(*((void *)&v31 + 1) + 8 * v3);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v5 = [v4 stacks];
        uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v41 count:16];
        if (v6)
        {
          uint64_t v7 = v6;
          uint64_t v8 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v28 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              uint64_t v11 = [v10 config];
              int v12 = [v11 isAppPredictionPanel];

              if (v12)
              {
                uint64_t v13 = [v10 previousTopOfStackSuggestion];
                int v14 = [v13 suggestionLayout];
                uint64_t v15 = [v14 oneByOneSuggestions];

                uint64_t v16 = [v10 topOfStackSuggestion];
                int v17 = [v16 suggestionLayout];
                id v18 = [v17 oneByOneSuggestions];

                if (v15) {
                  BOOL v19 = v18 == 0;
                }
                else {
                  BOOL v19 = 1;
                }
                if (!v19)
                {
                  uint64_t v20 = +[ATXStaticSuggestionsManager preservePreviousAppPositionsForPreviousSuggestions:newSuggestions:uiLimit:](ATXStaticSuggestionsManager, "preservePreviousAppPositionsForPreviousSuggestions:newSuggestions:uiLimit:", v15, v18, [v18 count]);
                  uint64_t v21 = [v10 topOfStackSuggestion];
                  uint64_t v22 = [v21 suggestionLayout];
                  [v22 setOneByOneSuggestions:v20];
                  goto LABEL_19;
                }
                uint64_t v20 = __atxlog_handle_blending();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v21 = [v10 config];
                  uint64_t v22 = [v21 identifier];
                  *(_DWORD *)buf = 138543874;
                  id v36 = v22;
                  __int16 v37 = 2112;
                  long long v38 = v15;
                  __int16 v39 = 2112;
                  uint64_t v40 = v18;
                  _os_log_error_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_ERROR, "HSLS [APPStablization]: Can't preserve App suggestion positions for panel in stack %{public}@ - previousSuggestions %@, newSuggestions %@", buf, 0x20u);
LABEL_19:
                }
                continue;
              }
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v27 objects:v41 count:16];
          }
          while (v7);
        }

        uint64_t v3 = v26 + 1;
      }
      while (v26 + 1 != v25);
      uint64_t v25 = [obj countByEnumeratingWithState:&v31 objects:v42 count:16];
    }
    while (v25);
  }
}

- (id)_fallbackSuggestions:(id)a3 homeScreenState:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v26 = (id)objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v28;
    *(void *)&long long v9 = 138412290;
    long long v25 = v9;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v28 != v13) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * v14);
      uint64_t v16 = objc_msgSend(v15, "executableSpecification", v25);
      unint64_t v17 = [v16 executableType];

      BOOL v18 = v17 > 0xA || ((1 << v17) & 0x406) == 0;
      if (!v18
        && ([v6 isShowingDuplicatedContentForSuggestion:v15 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:0 ignoreTodayPage:0] & 1) == 0)
      {
        if (v17 != 1 || v12 > 2)
        {
          if ((v17 & 0xFFFFFFFFFFFFFFF7) == 2 && v11 <= 2)
          {
            uint64_t v21 = __atxlog_handle_blending();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v25;
              long long v32 = v15;
              _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, "HSLS [fallbackGeneration]: Adding fallback action suggestion:\n%@", buf, 0xCu);
            }

            [v26 addObject:v15];
            ++v11;
          }
        }
        else
        {
          uint64_t v22 = __atxlog_handle_blending();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            long long v32 = v15;
            _os_log_impl(&dword_1D0FA3000, v22, OS_LOG_TYPE_DEFAULT, "HSLS [fallbackGeneration]: Adding fallback app suggestion:\n%@", buf, 0xCu);
          }

          [v26 addObject:v15];
          ++v12;
        }
        if (v12 == 3 && v11 == 3) {
          break;
        }
      }
      if (v10 == ++v14)
      {
        uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v26;
}

- (void)_removeSuggestedWidgetWhereNecessaryWithHomeScreenState:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [a3 sortedPagesByUserLastVisit];
  uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = v4;
        id v5 = *(void **)(*((void *)&v28 + 1) + 8 * v4);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v6 = [v5 stacks];
        uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v25 != v9) {
                objc_enumerationMutation(v6);
              }
              unint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              unint64_t v12 = [v11 suggestedWidgets];
              uint64_t v13 = [v12 count];

              if (v13)
              {
                uint64_t v14 = objc_opt_new();
                uint64_t v15 = [v11 suggestedWidgets];
                v22[0] = MEMORY[0x1E4F143A8];
                v22[1] = 3221225472;
                v22[2] = __88__ATXHomeScreenLayoutSelector2__removeSuggestedWidgetWhereNecessaryWithHomeScreenState___block_invoke;
                v22[3] = &unk_1E68AE118;
                v22[4] = v11;
                v22[5] = self;
                id v23 = v14;
                id v16 = v14;
                [v15 enumerateObjectsUsingBlock:v22];

                unint64_t v17 = [v11 suggestedWidgets];
                [v17 removeObjectsAtIndexes:v16];
              }
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v8);
        }

        uint64_t v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v20);
  }
}

void __88__ATXHomeScreenLayoutSelector2__removeSuggestedWidgetWhereNecessaryWithHomeScreenState___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [*(id *)(a1 + 32) topOfStackSuggestion];

  uint64_t v7 = *(void **)(a1 + 32);
  if (v6)
  {
    uint64_t v8 = [v7 topOfStackSuggestion];
    uint64_t v9 = [v8 widget];
    uint64_t v10 = [v9 widgetUniqueId];
    unint64_t v11 = [v5 widget];
    unint64_t v12 = [v11 widgetUniqueId];
    char v13 = [v10 isEqualToString:v12];

    if (v13) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v14 = [v7 previousTopWidget];

    if (v14)
    {
      uint64_t v15 = [*(id *)(a1 + 32) previousTopWidget];
      id v16 = [v15 widgetUniqueId];
      unint64_t v17 = [v5 widget];
      BOOL v18 = [v17 widgetUniqueId];
      char v19 = [v16 isEqualToString:v18];

      if (v19) {
        goto LABEL_7;
      }
    }
  }
  uint64_t v20 = *(void **)(*(void *)(a1 + 40) + 56);
  uint64_t v21 = [v5 widget];
  uint64_t v22 = [v20 mostRecentEngagementOfWidget:v21 ofType:3];

  if (!v22)
  {
    uint64_t v40 = __atxlog_handle_blending();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = [v5 widget];
      id v42 = [v41 widgetUniqueId];
      uint64_t v43 = [v5 stack];
      uint64_t v44 = [v43 config];
      long long v45 = [v44 identifier];
      *(_DWORD *)buf = 138543618;
      v72 = v42;
      __int16 v73 = 2114;
      uint64_t v74 = v45;
      _os_log_impl(&dword_1D0FA3000, v40, OS_LOG_TYPE_DEFAULT, "HSLS [suggestedWidgetRemoval]: Removing suggested widget %{public}@ from stack %{public}@, since it hasn't been seen by the user.", buf, 0x16u);
    }
    uint64_t v46 = [*(id *)(a1 + 32) topOfStackSuggestion];
    id v47 = [v46 widget];
    long long v48 = [v47 widgetUniqueId];
    long long v49 = [v5 widget];
    long long v50 = [v49 widgetUniqueId];
    int v51 = [v48 isEqualToString:v50];

    if (v51) {
      [*(id *)(a1 + 32) setTopOfStackSuggestion:0];
    }
    [*(id *)(a1 + 48) addIndex:a3];
    goto LABEL_32;
  }
LABEL_7:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v23 = v5;
    if ([v23 isLayoutComplete])
    {
      uint64_t v66 = a3;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      long long v24 = [v23 suggestionLayout];
      long long v25 = [v24 allSuggestionsInLayout];

      uint64_t v26 = [v25 countByEnumeratingWithState:&v67 objects:v77 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v68;
        while (2)
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v68 != v28) {
              objc_enumerationMutation(v25);
            }
            long long v30 = [*(id *)(*((void *)&v67 + 1) + 8 * v29) scoreSpecification];
            uint64_t v31 = [v30 suggestedConfidenceCategory];
            uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 136);

            if (v31 >= v32)
            {

              goto LABEL_31;
            }
            ++v29;
          }
          while (v27 != v29);
          uint64_t v27 = [v25 countByEnumeratingWithState:&v67 objects:v77 count:16];
          if (v27) {
            continue;
          }
          break;
        }
      }

      long long v33 = __atxlog_handle_blending();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v34 = [v23 widget];
        int v35 = [v34 widgetUniqueId];
        id v36 = [v23 stack];
        __int16 v37 = [v36 config];
        long long v38 = [v37 identifier];
        uint64_t v39 = *(void *)(*(void *)(a1 + 40) + 136);
        *(_DWORD *)buf = 138543874;
        v72 = v35;
        __int16 v73 = 2114;
        uint64_t v74 = v38;
        __int16 v75 = 2048;
        uint64_t v76 = v39;
        _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "HSLS [suggestedWidgetRemoval]: Removing suggested SW %{public}@ from stack %{public}@, because it does not have at least 1 suggestion with confidence >= %ld", buf, 0x20u);
      }
      a3 = v66;
    }
    else
    {
      long long v33 = __atxlog_handle_blending();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        long long v52 = [v23 widget];
        long long v53 = [v52 widgetUniqueId];
        long long v54 = [v23 stack];
        long long v55 = [v54 config];
        long long v56 = [v55 identifier];
        *(_DWORD *)buf = 138543618;
        v72 = v53;
        __int16 v73 = 2114;
        uint64_t v74 = v56;
        _os_log_impl(&dword_1D0FA3000, v33, OS_LOG_TYPE_DEFAULT, "HSLS [suggestedWidgetRemoval]: Removing suggested SG %{public}@ from stack %{public}@, because it does not have a complete layout", buf, 0x16u);
      }
    }

    long long v57 = [*(id *)(a1 + 32) topOfStackSuggestion];
    long long v58 = [v57 widget];
    long long v59 = [v58 widgetUniqueId];
    long long v60 = [v23 widget];
    long long v61 = [v60 widgetUniqueId];
    int v62 = [v59 isEqualToString:v61];

    if (v62) {
      [*(id *)(a1 + 32) setTopOfStackSuggestion:0];
    }
    long long v63 = [*(id *)(a1 + 32) suggestionsWidgetSuggestionsByWidgetUniqueId];
    long long v64 = [v23 widget];
    uint64_t v65 = [v64 widgetUniqueId];
    [v63 removeObjectForKey:v65];

    [*(id *)(a1 + 48) addIndex:a3];
LABEL_31:
  }
LABEL_32:
}

- (BOOL)_isSuggestionStillNeededForTopOfStack:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 config];
  if ([v4 allowsSmartRotate]) {
    goto LABEL_6;
  }
  id v5 = [v3 config];
  if ([v5 allowsNewWidget])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  id v6 = [v3 config];
  if ([v6 isPinnedSuggestionsWidget])
  {

    goto LABEL_5;
  }
  unint64_t v12 = [v3 config];
  char v13 = [v12 isAppPredictionPanel];

  if ((v13 & 1) == 0) {
    goto LABEL_12;
  }
LABEL_7:
  uint64_t v7 = [v3 topOfStackSuggestion];

  if (!v7)
  {
    LOBYTE(v11) = 1;
    goto LABEL_13;
  }
  uint64_t v8 = [v3 topOfStackSuggestion];
  int v9 = [v8 conformsToProtocol:&unk_1F280D770];

  if (!v9)
  {
LABEL_12:
    LOBYTE(v11) = 0;
    goto LABEL_13;
  }
  uint64_t v10 = [v3 topOfStackSuggestion];
  int v11 = [v10 isLayoutComplete] ^ 1;

LABEL_13:
  return v11;
}

- (void)_assignSuggestion:(id)a3 toTopOfStack:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 executableSpecification];
  uint64_t v9 = [v8 executableType];

  if (v9 == 3)
  {
    uint64_t v10 = [[_ATXSimpleWidgetSuggestion alloc] initWithSuggestion:v6 stack:v7 suggestionDeduplicator:self->_suggestionDeduplicator];
    if (v10) {
      [v7 setTopOfStackSuggestion:v10];
    }
    goto LABEL_6;
  }
  int v11 = [v7 topOfStackSuggestion];
  int v12 = [v11 conformsToProtocol:&unk_1F280D770];

  if (v12)
  {
    uint64_t v10 = [v7 topOfStackSuggestion];
    char v13 = [(_ATXSimpleWidgetSuggestion *)v10 mainSuggestionInLayout];
    [(_ATXSimpleWidgetSuggestion *)v10 addSuggestion:v6 asMainSuggestion:v13 == 0];

LABEL_6:
    goto LABEL_28;
  }
  uint64_t v14 = [v7 config];
  int v15 = [v14 isAppPredictionPanel];

  if (v15)
  {
    id v16 = [_ATXAppPredictionPanelSuggestion alloc];
    unint64_t v17 = [v7 config];
    BOOL v18 = [v17 widgets];
    char v19 = [v18 firstObject];
    uint64_t v20 = [(_ATXAppPredictionPanelSuggestion *)v16 initWithAppPredictionPanel:v19 containingStack:v7 suggestionDeduplicator:self->_suggestionDeduplicator hyperParameters:self->_hyperParameters];
  }
  else
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v21 = objc_msgSend(v7, "suggestionsWidgetSuggestionsByWidgetUniqueId", 0);
    uint64_t v22 = [v21 allValues];

    uint64_t v23 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v44;
LABEL_11:
      uint64_t v26 = 0;
      while (1)
      {
        if (*(void *)v44 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v43 + 1) + 8 * v26);
        if ([v27 canAddSuggestion:v6]) {
          break;
        }
        if (v24 == ++v26)
        {
          uint64_t v24 = [v22 countByEnumeratingWithState:&v43 objects:v51 count:16];
          if (v24) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
      uint64_t v20 = v27;
      uint64_t v28 = __atxlog_handle_blending();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [(_ATXCompositeLayoutWidgetSuggestionBase *)v20 widget];
        long long v30 = [v29 compactDescription];
        uint64_t v31 = [(_ATXCompositeLayoutWidgetSuggestionBase *)v20 widget];
        uint64_t v32 = [v31 widgetUniqueId];
        *(_DWORD *)buf = 138412546;
        long long v48 = v30;
        __int16 v49 = 2114;
        long long v50 = v32;
        _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_DEFAULT, "HSLS [topOfStackAssignment]: Setting topOfStackSuggestion to existing SuggestionsWidgetSuggestion (widget %@, uniqueID %{public}@) and add suggestion", buf, 0x16u);
      }
      if (v20) {
        goto LABEL_25;
      }
    }
    else
    {
LABEL_17:
    }
    unint64_t v17 = objc_opt_new();
    uint64_t v33 = *MEMORY[0x1E4F4B5F8];
    [v17 setAppBundleId:*MEMORY[0x1E4F4B5F8]];
    [v17 setExtensionBundleId:v33];
    uint64_t v34 = ATXSpecialWidgetKindSiriSuggestions();
    [v17 setWidgetKind:v34];

    int v35 = [v7 config];
    objc_msgSend(v17, "setSize:", objc_msgSend(v35, "stackLayoutSize"));

    id v36 = [MEMORY[0x1E4F29128] UUID];
    __int16 v37 = [v36 UUIDString];
    [v17 setWidgetUniqueId:v37];

    [v17 setSuggestedWidget:1];
    uint64_t v20 = [[_ATXSuggestionsWidgetSuggestion alloc] initWithSuggestionsWidget:v17 containingStack:v7 suggestionDeduplicator:self->_suggestionDeduplicator hyperParameters:self->_hyperParameters];
    long long v38 = __atxlog_handle_blending();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = [(_ATXCompositeLayoutWidgetSuggestionBase *)v20 widget];
      uint64_t v40 = [v39 compactDescription];
      uint64_t v41 = [(_ATXCompositeLayoutWidgetSuggestionBase *)v20 widget];
      id v42 = [v41 widgetUniqueId];
      *(_DWORD *)buf = 138412546;
      long long v48 = v40;
      __int16 v49 = 2114;
      long long v50 = v42;
      _os_log_impl(&dword_1D0FA3000, v38, OS_LOG_TYPE_DEFAULT, "HSLS [topOfStackAssignment]: Setting topOfStackSuggestion to new SuggestionsWidgetSuggestion (widget %@, uniqueID %{public}@) and add suggestion", buf, 0x16u);
    }
  }

LABEL_25:
  if ([(_ATXCompositeLayoutWidgetSuggestionBase *)v20 addSuggestion:v6 asMainSuggestion:1])
  {
    [v7 setTopOfStackSuggestion:v20];
  }

LABEL_28:
}

- (id)_suggestionsWidgetPreviewsFromRankedSuggestions:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v3 = objc_opt_new();
  for (uint64_t i = 0; i != 3; ++i)
  {
    id v5 = [[_ATXSuggestionsWidgetSuggestion alloc] initForPreviewOfSize:i hyperParameters:self->_hyperParameters];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v18;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
        int v12 = [v11 executableSpecification];
        uint64_t v13 = [v12 executableType];

        if ((v13 & 0xFFFFFFFFFFFFFFF7) == 2)
        {
          uint64_t v14 = [v5 mainSuggestionInLayout];
          int v15 = [v5 addSuggestion:v11 asMainSuggestion:v14 == 0];

          if (v15)
          {
            if ([v5 isLayoutComplete]) {
              break;
            }
          }
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (([v5 isLayoutComplete] & 1) == 0)
    {
      id v16 = __atxlog_handle_blending();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenLayoutSelector2 _suggestionsWidgetPreviewsFromRankedSuggestions:]((uint64_t)v24, (uint64_t)v5);
      }
    }
    [v3 addObject:v5];
  }
  return v3;
}

- (id)_appPredictionPanelPreviewFromRankedSuggestions:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [[_ATXAppPredictionPanelSuggestion alloc] initForPreviewWithHyperParameters:self->_hyperParameters];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v19 != v9) {
        objc_enumerationMutation(v6);
      }
      int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
      int v12 = objc_msgSend(v11, "executableSpecification", (void)v18);
      uint64_t v13 = [v12 executableType];

      if (v13 == 1)
      {
        uint64_t v14 = [v5 mainSuggestionInLayout];
        int v15 = [v5 addSuggestion:v11 asMainSuggestion:v14 == 0];

        if (v15)
        {
          if ([v5 isLayoutComplete]) {
            break;
          }
        }
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (([v5 isLayoutComplete] & 1) == 0)
  {
    id v16 = __atxlog_handle_blending();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLayoutSelector2 _appPredictionPanelPreviewFromRankedSuggestions:](v5, v16);
    }
  }
  return v5;
}

- (BOOL)_isSuggestionACandidate:(id)a3 forStack:(id)a4 dedupeAppSuggestionsByWidgets:(BOOL)a5 ignoreDuplicatesInSGWidget:(BOOL)a6 ignoreDuplicatesInPanels:(BOOL)a7 homeScreenState:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a8;
  id v16 = [v13 executableSpecification];
  uint64_t v17 = [v16 executableType];

  if (v17 == 2)
  {
    long long v18 = [v13 atxActionExecutableObject];
    long long v19 = [v18 intent];

    if (v19 && [v15 containsWidgetForIntent:v19])
    {
      long long v20 = __atxlog_handle_blending();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v13;
        _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible - home screen contains widget for action; suggestion %@",
          buf,
          0xCu);
      }
      goto LABEL_20;
    }
  }
  long long v21 = [v13 executableSpecification];
  uint64_t v22 = [v21 executableType];

  if (v22 == 10)
  {
    long long v19 = [v13 linkActionExecutableObject];
    uint64_t v23 = [v19 cachedAppIntent];
    if (!v23)
    {
      uint64_t v24 = __atxlog_handle_blending();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v13;
        uint64_t v25 = "    HSLS: suggestion not eligible - link action doesn't contain cached app intent; suggestion %@";
        goto LABEL_14;
      }
LABEL_15:

      goto LABEL_21;
    }
    if ([v15 containsWidgetForIntent:v23])
    {
      uint64_t v24 = __atxlog_handle_blending();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = (uint64_t)v13;
        uint64_t v25 = "    HSLS: suggestion not eligible - home screen contains widget for link action app intent; suggestion %@";
LABEL_14:
        _os_log_impl(&dword_1D0FA3000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
        goto LABEL_15;
      }
      goto LABEL_15;
    }
  }
  uint64_t v26 = [v14 page];
  int v27 = [v26 isShowingDuplicatedContentForSuggestion:v13 considerUnderStackContents:0 dedupeAppSuggestionsByWidgets:v11 ignoreDuplicatesInSGWidget:v10 ignoreDuplicatesInPanels:v9];

  if (v27)
  {
    long long v19 = __atxlog_handle_blending();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [v14 page];
      uint64_t v28 = [v20 config];
      *(_DWORD *)buf = 134218242;
      uint64_t v93 = [v28 pageIndex];
      __int16 v94 = 2112;
      id v95 = v13;
      _os_log_impl(&dword_1D0FA3000, v19, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for page %lu - duplicated content on page; suggestion %@",
        buf,
        0x16u);

LABEL_20:
    }
LABEL_21:
    BOOL v29 = 0;
    goto LABEL_68;
  }
  id v75 = v15;
  id v82 = v13;
  uint64_t v76 = objc_opt_new();
  uint64_t v79 = objc_opt_new();
  long long v30 = objc_opt_new();
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  uint64_t v77 = v14;
  uint64_t v31 = [v14 page];
  uint64_t v32 = [v31 stacks];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v87 objects:v98 count:16];
  if (!v33) {
    goto LABEL_50;
  }
  uint64_t v34 = v33;
  uint64_t v35 = *(void *)v88;
  id v36 = off_1E68AA000;
  while (2)
  {
    uint64_t v37 = 0;
    uint64_t v78 = v34;
    do
    {
      if (*(void *)v88 != v35) {
        objc_enumerationMutation(v32);
      }
      long long v38 = *(void **)(*((void *)&v87 + 1) + 8 * v37);
      uint64_t v39 = [v38 topOfStackSuggestion];
      if (v39 || ([v38 previousTopWidget], (uint64_t v39 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else if ([v38 containsIdenticalContentOfSuggestion:v13 ignoreDuplicatesInSGWidget:0 ignoreDuplicatesInPanels:0])
      {
        uint64_t v65 = __atxlog_handle_blending();
        BOOL v66 = os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT);
        id v14 = v77;
        if (v66)
        {
          long long v67 = [v77 page];
          long long v68 = [v67 config];
          uint64_t v69 = [v68 pageIndex];
          long long v70 = [v38 config];
          uint64_t v71 = [v70 identifier];
          *(_DWORD *)buf = 134218498;
          uint64_t v93 = v69;
          __int16 v94 = 2114;
          id v95 = v71;
          __int16 v96 = 2112;
          id v97 = v13;
          _os_log_impl(&dword_1D0FA3000, v65, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for page %lu - contained in a stack %{public}@ whose topWidget is unknown; suggestion %@",
            buf,
            0x20u);
        }
        id v15 = v75;
        long long v19 = v76;
        goto LABEL_66;
      }
      uint64_t v40 = [v13 executableSpecification];
      if ([v40 executableType] != 3)
      {

LABEL_36:
        long long v45 = [v38 topOfStackSuggestion];
        if (v45)
        {
        }
        else if ([v38 previousTopWidgetWasShowingIdenticalContentOfSuggestion:v13])
        {
          long long v46 = [v38 previousTopOfStackSuggestion];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v47 = [v38 previousTopOfStackSuggestion];
            [v47 widget];
            long long v48 = v36;
            uint64_t v49 = v35;
            id v50 = v13;
            int v51 = v32;
            long long v53 = v52 = v30;
            int v81 = [v53 isSuggestedWidget];

            long long v30 = v52;
            uint64_t v32 = v51;
            id v13 = v50;
            uint64_t v35 = v49;
            id v36 = v48;
            uint64_t v34 = v78;

            if (v81) {
              goto LABEL_41;
            }
          }
          else
          {
          }
          long long v54 = v79;
          goto LABEL_42;
        }
LABEL_41:
        long long v54 = v30;
LABEL_42:
        [v54 addObject:v38];
        goto LABEL_43;
      }
      char v41 = [v38 sizeIsCompatibleWithWidgetSuggestion:v13];

      if (v41) {
        goto LABEL_36;
      }
      id v42 = __atxlog_handle_blending();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        long long v43 = [v38 config];
        long long v44 = [v43 identifier];
        *(_DWORD *)buf = 138543618;
        uint64_t v93 = (uint64_t)v44;
        __int16 v94 = 2112;
        id v95 = v13;
        _os_log_impl(&dword_1D0FA3000, v42, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for stack %{public}@ - widget suggestion size not compatible; suggestion %@",
          buf,
          0x16u);
      }
LABEL_43:
      ++v37;
    }
    while (v34 != v37);
    uint64_t v55 = [v32 countByEnumeratingWithState:&v87 objects:v98 count:16];
    uint64_t v34 = v55;
    if (v55) {
      continue;
    }
    break;
  }
LABEL_50:

  id v56 = v30;
  if ([v79 count])
  {
    id v80 = v30;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v56 = v79;
    uint64_t v57 = [v56 countByEnumeratingWithState:&v83 objects:v91 count:16];
    if (v57)
    {
      uint64_t v58 = v57;
      uint64_t v59 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v84 != v59) {
            objc_enumerationMutation(v56);
          }
          long long v61 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          int v62 = __atxlog_handle_blending();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            long long v63 = [v61 config];
            long long v64 = [v63 identifier];
            *(_DWORD *)buf = 138543618;
            uint64_t v93 = (uint64_t)v64;
            __int16 v94 = 2112;
            id v95 = v82;
            _os_log_impl(&dword_1D0FA3000, v62, OS_LOG_TYPE_DEFAULT, "    HSLS: stack %{public}@ was previously showing suggestion and it's still not assigned yet; suggestion %@",
              buf,
              0x16u);
          }
        }
        uint64_t v58 = [v56 countByEnumeratingWithState:&v83 objects:v91 count:16];
      }
      while (v58);
    }

    id v13 = v82;
    long long v30 = v80;
  }
  long long v19 = v76;
  [v76 addObjectsFromArray:v56];
  id v14 = v77;
  if ([v76 containsObject:v77])
  {
    BOOL v29 = 1;
    id v15 = v75;
  }
  else
  {
    uint64_t v32 = __atxlog_handle_blending();
    id v15 = v75;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v73 = [v77 config];
      uint64_t v74 = [v73 identifier];
      *(_DWORD *)buf = 138543618;
      uint64_t v93 = (uint64_t)v74;
      __int16 v94 = 2112;
      id v95 = v13;
      _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_DEFAULT, "    HSLS: suggestion not eligible for stack %{public}@ - not in the list of candidate stacks; suggestion %@",
        buf,
        0x16u);
    }
LABEL_66:

    BOOL v29 = 0;
  }

LABEL_68:
  return v29;
}

- (BOOL)_hasEligiblePinnedWidgetStacksForSuggestionsWidget:(id)a3 forCandidateStack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ATXHomeScreenLayoutSelector2 *)self _shouldConsiderSuggestionForSuggestionsWidget:v6])goto LABEL_6; {
  uint64_t v8 = [v7 config];
  }
  int v9 = [v8 isPinnedSuggestionsWidget];

  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = [v7 topOfStackSuggestion];
  if (!v10
    || (BOOL v11 = (void *)v10,
        [v7 topOfStackSuggestion],
        int v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 canAddSuggestion:v6],
        v12,
        v11,
        (v13 & 1) != 0))
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_6:
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_hasEligiblePinnedWidgetStacksForAPPWidget:(id)a3 forCandidateStack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(ATXHomeScreenLayoutSelector2 *)self _shouldConsiderSuggestionForAppPredictionPanel:v6])goto LABEL_6; {
  uint64_t v8 = [v7 config];
  }
  int v9 = [v8 isAppPredictionPanel];

  if (!v9) {
    goto LABEL_6;
  }
  uint64_t v10 = [v7 topOfStackSuggestion];
  if (!v10
    || (BOOL v11 = (void *)v10,
        [v7 topOfStackSuggestion],
        int v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 canAddSuggestion:v6],
        v12,
        v11,
        (v13 & 1) != 0))
  {
    BOOL v14 = 1;
  }
  else
  {
LABEL_6:
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_isStackEligibleForSmartRotate:(id)a3 stack:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 config];
  char v9 = [v8 allowsSmartRotate];

  if (v9)
  {
    if (![(ATXHomeScreenLayoutSelector2 *)self _isSuggestionStillNeededForTopOfStack:v7])
    {
      BOOL v14 = __atxlog_handle_blending();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v7 config];
        id v16 = [v15 identifier];
        int v33 = 138543618;
        uint64_t v34 = v16;
        __int16 v35 = 2112;
        id v36 = v6;
        uint64_t v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - stack no longer needs top "
              "of stack suggestion; %@";
        goto LABEL_11;
      }
      goto LABEL_14;
    }
    uint64_t v10 = [v7 topOfStackSuggestion];
    if (v10)
    {
      BOOL v11 = (void *)v10;
      int v12 = [v6 executableSpecification];
      uint64_t v13 = [v12 executableType];

      if (v13 == 3)
      {
        BOOL v14 = __atxlog_handle_blending();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v7 config];
          id v16 = [v15 identifier];
          int v33 = 138543618;
          uint64_t v34 = v16;
          __int16 v35 = 2112;
          id v36 = v6;
          uint64_t v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - cannot assign widget sug"
                "gestion to composite layout; %@";
LABEL_11:
          _os_log_impl(&dword_1D0FA3000, v14, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v33, 0x16u);
LABEL_12:

LABEL_13:
          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    long long v20 = [v6 scoreSpecification];
    uint64_t v21 = [v20 suggestedConfidenceCategory];

    if (v21 <= 2)
    {
      if (![(ATXHomeScreenLayoutSelector2 *)self _isStackStale:v7])
      {
        BOOL v14 = __atxlog_handle_blending();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        id v15 = [v7 config];
        id v16 = [v15 identifier];
        int v33 = 138543618;
        uint64_t v34 = v16;
        __int16 v35 = 2112;
        id v36 = v6;
        uint64_t v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - low conf suggestion and st"
              "ack is not stale; %@";
        goto LABEL_11;
      }
      uint64_t v22 = [v6 executableSpecification];
      uint64_t v23 = [v22 executableType];

      if (v23 != 3)
      {
        BOOL v14 = __atxlog_handle_blending();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        id v15 = [v7 config];
        id v16 = [v15 identifier];
        int v33 = 138543618;
        uint64_t v34 = v16;
        __int16 v35 = 2112;
        id v36 = v6;
        uint64_t v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - low conf and type is not widget; %@";
        goto LABEL_11;
      }
      if ([v7 previousTopWidgetWasShowingIdenticalContentOfSuggestion:v6])
      {
        BOOL v14 = __atxlog_handle_blending();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        id v15 = [v7 config];
        id v16 = [v15 identifier];
        int v33 = 138543618;
        uint64_t v34 = v16;
        __int16 v35 = 2112;
        id v36 = v6;
        uint64_t v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - low conf and same as exist"
              "ing top widget; %@";
        goto LABEL_11;
      }
    }
    uint64_t v24 = [v7 config];
    BOOL v14 = objc_msgSend(v7, "widgetForSuggestion:considerSuggestedWidgets:", v6, objc_msgSend(v24, "allowsNewWidget"));

    if (v14)
    {
      uint64_t v25 = [v14 extensionBundleId];
      int v26 = [v25 isEqualToString:*MEMORY[0x1E4F4B5F8]];

      if (!v26)
      {
LABEL_27:
        BOOL v18 = 1;
        goto LABEL_15;
      }
      if ([(ATXHomeScreenLayoutSelector2 *)self _shouldConsiderSuggestionForSuggestionsWidget:v6])
      {
        uint64_t v27 = [v7 topOfStackSuggestion];
        if (!v27) {
          goto LABEL_27;
        }
        uint64_t v28 = (void *)v27;
        BOOL v29 = [v7 topOfStackSuggestion];
        char v30 = [v29 canAddSuggestion:v6];

        if (v30) {
          goto LABEL_27;
        }
        id v15 = __atxlog_handle_blending();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        id v16 = [v7 config];
        uint64_t v31 = [v16 identifier];
        int v33 = 138543618;
        uint64_t v34 = v31;
        __int16 v35 = 2112;
        id v36 = v6;
        uint64_t v32 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - cannot add to existing layout; %@";
      }
      else
      {
        id v15 = __atxlog_handle_blending();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_13;
        }
        id v16 = [v7 config];
        uint64_t v31 = [v16 identifier];
        int v33 = 138543618;
        uint64_t v34 = v31;
        __int16 v35 = 2112;
        id v36 = v6;
        uint64_t v32 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - can't be surfaced in SG widget; %@";
      }
    }
    else
    {
      id v15 = __atxlog_handle_blending();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      id v16 = [v7 config];
      uint64_t v31 = [v16 identifier];
      int v33 = 138543618;
      uint64_t v34 = v31;
      __int16 v35 = 2112;
      id v36 = v6;
      uint64_t v32 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - widget not found in stack; %@";
    }
    _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, v32, (uint8_t *)&v33, 0x16u);

    goto LABEL_12;
  }
  BOOL v14 = __atxlog_handle_blending();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v7 config];
    id v16 = [v15 identifier];
    int v33 = 138543618;
    uint64_t v34 = v16;
    __int16 v35 = 2112;
    id v36 = v6;
    uint64_t v17 = "    HSLS [assignSmartRotate]: Suggestion cannot smart rotate stack %{public}@ - smart rotate off; %@";
    goto LABEL_11;
  }
LABEL_14:
  BOOL v18 = 0;
LABEL_15:

  return v18;
}

- (BOOL)_hasEligibleWidgetSuggestionsStacksForSuggestion:(id)a3 onPages:(id)a4 ignoreDuplicatesInSGWidget:(BOOL)a5 ignoreDuplicatesInPanels:(BOOL)a6
{
  BOOL v67 = a6;
  BOOL v6 = a5;
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (![(ATXSuggestionModeFilter *)self->_modeFilter currentModeConfigurationAllowsSuggestion:v9])goto LABEL_27; {
  BOOL v11 = [v9 executableSpecification];
  }
  uint64_t v12 = [v11 executableType];

  uint64_t v13 = [v9 scoreSpecification];
  uint64_t v14 = [v13 suggestedConfidenceCategory];
  if (v12 != 3)
  {
    int64_t thresholdConfidenceForSuggestedSG = self->_thresholdConfidenceForSuggestedSG;

    if (v14 >= thresholdConfidenceForSuggestedSG
      && [(ATXHomeScreenLayoutSelector2 *)self _shouldConsiderSuggestionForSuggestionsWidget:v9])
    {
      widgetDismissManager = self->_widgetDismissManager;
      uint64_t v38 = *MEMORY[0x1E4F4B5F8];
      uint64_t v39 = ATXSpecialWidgetKindSiriSuggestions();
      LODWORD(widgetDismissManager) = [(ATXWidgetSuggestionDismissManager *)widgetDismissManager shouldBlockWidgetSuggestionBecauseOfPreviousDismiss:v38 kind:v39 intent:0];

      if (widgetDismissManager)
      {
        long long v20 = __atxlog_handle_blending();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_DEFAULT, "HSLS: considered suggestion for suggestions widget but the widget has been dismissed", buf, 2u);
        }
        goto LABEL_77;
      }
LABEL_42:
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v65 = v10;
      long long v20 = v10;
      uint64_t v48 = [v20 countByEnumeratingWithState:&v76 objects:v86 count:16];
      if (!v48)
      {
LABEL_55:

        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v20 = v20;
        uint64_t v55 = [v20 countByEnumeratingWithState:&v72 objects:v85 count:16];
        if (v55)
        {
          uint64_t v56 = v55;
          uint64_t v57 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v56; ++i)
            {
              if (*(void *)v73 != v57) {
                objc_enumerationMutation(v20);
              }
              uint64_t v59 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              long long v68 = 0u;
              long long v69 = 0u;
              long long v70 = 0u;
              long long v71 = 0u;
              long long v60 = objc_msgSend(v59, "stacks", v65);
              uint64_t v61 = [v60 countByEnumeratingWithState:&v68 objects:v84 count:16];
              if (v61)
              {
                uint64_t v62 = v61;
                uint64_t v63 = *(void *)v69;
                while (2)
                {
                  for (uint64_t j = 0; j != v62; ++j)
                  {
                    if (*(void *)v69 != v63) {
                      objc_enumerationMutation(v60);
                    }
                    if ([(ATXHomeScreenLayoutSelector2 *)self _isStack:*(void *)(*((void *)&v68 + 1) + 8 * j) eligibleToShowSuggestionViaWidgetSuggestion:v9])
                    {

                      BOOL v19 = 1;
                      goto LABEL_31;
                    }
                  }
                  uint64_t v62 = [v60 countByEnumeratingWithState:&v68 objects:v84 count:16];
                  if (v62) {
                    continue;
                  }
                  break;
                }
              }
            }
            uint64_t v56 = [v20 countByEnumeratingWithState:&v72 objects:v85 count:16];
          }
          while (v56);
        }
LABEL_30:
        BOOL v19 = 0;
LABEL_31:
        id v10 = v65;
        goto LABEL_78;
      }
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v77;
LABEL_44:
      uint64_t v51 = 0;
      while (1)
      {
        if (*(void *)v77 != v50) {
          objc_enumerationMutation(v20);
        }
        uint64_t v52 = *(void **)(*((void *)&v76 + 1) + 8 * v51);
        long long v53 = objc_msgSend(v9, "executableSpecification", v65);
        if ([v53 executableType] != 1) {
          break;
        }
        int v54 = [v52 isSeldomVisited];

        if (!v54) {
          goto LABEL_52;
        }
        if ([v52 suggestionsWidgetOnPageIsShowingDuplicatedContentForSuggestion:v9]) {
          goto LABEL_30;
        }
LABEL_53:
        if (v49 == ++v51)
        {
          uint64_t v49 = [v20 countByEnumeratingWithState:&v76 objects:v86 count:16];
          if (!v49) {
            goto LABEL_55;
          }
          goto LABEL_44;
        }
      }

LABEL_52:
      if ([v52 isShowingDuplicatedContentForSuggestion:v9 considerUnderStackContents:1 dedupeAppSuggestionsByWidgets:1 ignoreDuplicatesInSGWidget:v6 ignoreDuplicatesInPanels:v67])goto LABEL_30; {
      goto LABEL_53;
      }
    }
    goto LABEL_27;
  }

  if (v14 < 3)
  {
LABEL_27:
    BOOL v19 = 0;
    goto LABEL_28;
  }
  id v15 = (void *)MEMORY[0x1E4F93940];
  id v16 = [v9 clientModelSpecification];
  uint64_t v17 = [v16 clientModelId];
  unint64_t v18 = [v15 clientModelTypeFromClientModelId:v17];

  BOOL v19 = 0;
  if (v18 <= 0x2F && ((1 << v18) & 0x800000141114) != 0)
  {
    long long v20 = [MEMORY[0x1E4F938F0] infoSuggestionFromProactiveSuggestion:v9];
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v65 = v10;
    id v21 = v10;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v80 objects:v89 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v81;
LABEL_8:
      uint64_t v25 = 0;
      while (1)
      {
        if (*(void *)v81 != v24) {
          objc_enumerationMutation(v21);
        }
        int v26 = *(void **)(*((void *)&v80 + 1) + 8 * v25);
        uint64_t v27 = [v20 appBundleIdentifier];
        LOBYTE(v26) = [v26 containsSuggestedWidgetForApp:v27];

        if (v26) {
          break;
        }
        if (v23 == ++v25)
        {
          uint64_t v23 = [v21 countByEnumeratingWithState:&v80 objects:v89 count:16];
          if (!v23) {
            goto LABEL_14;
          }
          goto LABEL_8;
        }
      }

      goto LABEL_30;
    }
LABEL_14:

    id v28 = objc_alloc(MEMORY[0x1E4F5ACC8]);
    BOOL v29 = [v20 widgetBundleIdentifier];
    char v30 = [v20 appBundleIdentifier];
    uint64_t v31 = (void *)[v28 initWithExtensionBundleIdentifier:v29 containerBundleIdentifier:v30];

    if ([v31 widgetWantsLocation]
      && ([v31 isContainerAuthorizedForWidgetUpdates] & 1) == 0)
    {
      uint64_t v34 = __atxlog_handle_blending();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v88 = v20;
        __int16 v35 = "HSLS: The widget wants location but its container is not authorized for widget updates: %@";
        goto LABEL_38;
      }
LABEL_39:
      id v10 = v65;

LABEL_76:
LABEL_77:
      BOOL v19 = 0;
LABEL_78:

      goto LABEL_28;
    }
    if (!self->_widgetSuggestionDenyList)
    {
      uint64_t v32 = (ATXWidgetSuggestionsDenyList *)objc_opt_new();
      widgetSuggestionDenyList = self->_widgetSuggestionDenyList;
      self->_widgetSuggestionDenyList = v32;
    }
    if (v20
      && [(ATXWidgetSuggestionsDenyList *)self->_widgetSuggestionDenyList containsInfoSuggestion:v20])
    {
      uint64_t v34 = __atxlog_handle_blending();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        long long v88 = v20;
        __int16 v35 = "HSLS: The info suggestion is on the Widget Suggestions deny list: %@";
LABEL_38:
        _os_log_impl(&dword_1D0FA3000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 0xCu);
        goto LABEL_39;
      }
      goto LABEL_39;
    }
    char v41 = [v20 appBundleIdentifier];
    id v10 = v66;
    if ([v41 length])
    {
      CFStringRef v42 = (const __CFString *)*MEMORY[0x1E4F1D3F0];
      CFStringRef v43 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      long long v44 = v41;
      long long v45 = (void *)CFPreferencesCopyValue(@"SBSearchDisabledShortcuts", @"com.apple.spotlightui", v42, v43);
      LODWORD(v42) = [v45 containsObject:v44];

      if (v42)
      {
        long long v46 = __atxlog_handle_blending();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v88 = v44;
          id v47 = "HSLS: 'Show on Home Screen' is off for %@";
LABEL_74:
          _os_log_impl(&dword_1D0FA3000, v46, OS_LOG_TYPE_DEFAULT, v47, buf, 0xCu);
          goto LABEL_75;
        }
        goto LABEL_75;
      }
      if (![(ATXHomeScreenLayoutSelector2 *)self _isBackgroundAppRefreshAllowedForAppBundleId:v44])
      {
        long long v46 = __atxlog_handle_blending();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          long long v88 = v44;
          id v47 = "HSLS: background app refresh is off for %@";
          goto LABEL_74;
        }
LABEL_75:

        goto LABEL_76;
      }
    }

    goto LABEL_42;
  }
LABEL_28:

  return v19;
}

- (BOOL)_isStack:(id)a3 eligibleToShowSuggestionViaWidgetSuggestion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 config];
  int v9 = [v8 allowsNewWidget];

  if (!v9) {
    goto LABEL_19;
  }
  id v10 = [v6 page];
  char v11 = [v10 isSeldomVisited];

  if (v11) {
    goto LABEL_19;
  }
  uint64_t v12 = [v7 executableSpecification];
  uint64_t v13 = [v12 executableType];

  if (v13 != 3)
  {
    uint64_t v23 = [v6 config];
    uint64_t v24 = [v23 stackLayoutSize];

    if (v24 != 4) {
      goto LABEL_11;
    }
LABEL_19:
    BOOL v25 = 0;
    goto LABEL_20;
  }
  if (![v6 sizeIsCompatibleWithWidgetSuggestion:v7]) {
    goto LABEL_19;
  }
  uint64_t v14 = [v7 atxInfoSuggestionExecutableObject];
  if (!v14)
  {
    id v15 = __atxlog_handle_blending();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "HSLS: stack ineligible to show widget suggestion, no info suggestion: stack: %@, suggestion: %@", (uint8_t *)&v27, 0x16u);
    }
    goto LABEL_18;
  }
  id v15 = v14;
  descriptorCache = self->_descriptorCache;
  uint64_t v17 = [v14 widgetBundleIdentifier];
  unint64_t v18 = [v15 widgetKind];
  BOOL v19 = [(ATXWidgetDescriptorCache *)descriptorCache homeScreenDescriptorForExtensionBundleId:v17 kind:v18];

  if (!v19)
  {
    id v21 = __atxlog_handle_blending();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      uint64_t v22 = "HSLS: stack ineligible to show widget suggestion, descriptor not found: stack: %@, suggestion: %@";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    goto LABEL_19;
  }
  long long v20 = [v6 config];
  [v20 stackLayoutSize];
  CHSWidgetFamilyFromATXStackLayoutSize();

  [v19 disfavoredFamiliesForLocation:0];
  if (CHSWidgetFamilyMaskContainsFamily())
  {
    id v21 = __atxlog_handle_blending();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      id v30 = v7;
      uint64_t v22 = "HSLS: stack ineligible to show widget suggestion, stack family is disfavored by widget: stack: %@, suggestion: %@";
LABEL_16:
      _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v27, 0x16u);
      goto LABEL_17;
    }
    goto LABEL_17;
  }

LABEL_11:
  BOOL v25 = 1;
LABEL_20:

  return v25;
}

- (BOOL)_shouldConsiderSuggestionForSuggestionsWidget:(id)a3
{
  id v4 = a3;
  if ([(ATXBlendingLayerHyperParameters *)self->_hyperParameters isSuggestionEligibleForSuggestionsWidget:v4])int v5 = [(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithSuggestion:v4 engagedExecutables:self->_dismissedSuggestionsForSuggestionsWidget] ^ 1; {
  else
  }
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_shouldConsiderSuggestionForAppPredictionPanel:(id)a3
{
  id v4 = a3;
  if ([(ATXBlendingLayerHyperParameters *)self->_hyperParameters isSuggestionEligibleForAppPredictionPanel:v4])int v5 = [(ATXEngagementRecordManager *)self->_engagementRecordManager hasEngagedWithSuggestion:v4 engagedExecutables:self->_dismissedSuggestionsForAppPredictionPanels] ^ 1; {
  else
  }
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_isBackgroundAppRefreshAllowedForAppBundleId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    int v5 = [MEMORY[0x1E4F5FA50] sharedScheduler];
    uint64_t v17 = 0;
    v18[0] = &v17;
    v18[1] = 0x2020000000;
    char v19 = 1;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __77__ATXHomeScreenLayoutSelector2__isBackgroundAppRefreshAllowedForAppBundleId___block_invoke;
    v14[3] = &unk_1E68AE140;
    id v16 = &v17;
    id v6 = v4;
    id v15 = v6;
    [v5 backgroundAppRefreshEnabledForApp:v3 withHandler:v14];
    id v7 = v6;
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    intptr_t v9 = dispatch_semaphore_wait(v7, v8);

    if (v9)
    {
      id v10 = __atxlog_handle_blending();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenLayoutSelector2 _isBackgroundAppRefreshAllowedForAppBundleId:]();
      }

      BOOL v11 = 1;
    }
    else
    {
      uint64_t v12 = __atxlog_handle_blending();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        [(ATXHomeScreenLayoutSelector2 *)(uint64_t)v18 _isBackgroundAppRefreshAllowedForAppBundleId:v12];
      }

      BOOL v11 = *(unsigned char *)(v18[0] + 24) != 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v7 = __atxlog_handle_blending();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXHomeScreenLayoutSelector2 _isBackgroundAppRefreshAllowedForAppBundleId:](v7);
    }
    BOOL v11 = 1;
  }

  return v11;
}

intptr_t __77__ATXHomeScreenLayoutSelector2__isBackgroundAppRefreshAllowedForAppBundleId___block_invoke(uint64_t a1, char a2, char a3)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 & a3;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (int64_t)_thresholdConfidenceForSuggestedSG
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSUserDefaults *)self->_defaults integerForKey:*MEMORY[0x1E4F4B6E8]] < 10
    || [(NSUserDefaults *)self->_defaults integerForKey:*MEMORY[0x1E4F4B6F0]])
  {
    if ((unint64_t)[(ATXWidgetSuggestionDismissManager *)self->_widgetDismissManager userDismissCountForWidgetSuggestionWithBundleId:*MEMORY[0x1E4F4B5F8]] <= 1)int64_t v3 = 3; {
    else
    }
      int64_t v3 = 4;
  }
  else
  {
    int64_t v3 = 4;
  }
  dispatch_semaphore_t v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = v3;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "HSLS: threshold confidence for suggested SG = %ld", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

- (BOOL)_shouldLimitWidgetSuggestionPowerCost
{
  if (self->_isiPad || ([MEMORY[0x1E4F93B08] isInternalBuild] & 1) != 0) {
    return 0;
  }
  int v5 = [(NSUserDefaults *)self->_defaults objectForKey:*MEMORY[0x1E4F4B700]];
  if (v5)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v7 = v6;
    [v5 timeIntervalSinceReferenceDate];
    BOOL v3 = v7 - v8 < 604800.0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_loadHomeScreenState:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_opt_new();
  id v6 = v4;
  id v47 = v6;
  if (!v6)
  {
    id v62 = 0;
    id v6 = [v5 loadHomeScreenAndTodayPageConfigurationsWithError:&v62];
    id v7 = v62;
    if (v7)
    {
      double v8 = __atxlog_handle_blending();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:].cold.4();
      }
    }
    if (!v6)
    {
      intptr_t v9 = __atxlog_handle_blending();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:](v9, v10, v11, v12, v13, v14, v15, v16);
      }

      id v6 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  uint64_t v48 = v5;
  uint64_t v17 = [(ATXHomeScreenLayoutSelector2 *)self _sortedPagesByMostRecentUserVisit:v6];

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v58 objects:v65 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v59 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        uint64_t v24 = [v23 stacks];
        uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v64 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v55;
          do
          {
            for (uint64_t j = 0; j != v26; ++j)
            {
              if (*(void *)v55 != v27) {
                objc_enumerationMutation(v24);
              }
              [(ATXHomeScreenLayoutSelector2 *)self _logStackDetail:*(void *)(*((void *)&v54 + 1) + 8 * j)];
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v64 count:16];
          }
          while (v26);
        }

        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        __int16 v29 = [v23 panels];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v63 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v51;
          do
          {
            for (uint64_t k = 0; k != v31; ++k)
            {
              if (*(void *)v51 != v32) {
                objc_enumerationMutation(v29);
              }
              [(ATXHomeScreenLayoutSelector2 *)self _logStackDetail:*(void *)(*((void *)&v50 + 1) + 8 * k)];
            }
            uint64_t v31 = [v29 countByEnumeratingWithState:&v50 objects:v63 count:16];
          }
          while (v31);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v58 objects:v65 count:16];
    }
    while (v20);
  }

  id v49 = 0;
  uint64_t v34 = [v48 loadDockAppListWithError:&v49];
  id v35 = v49;
  if (v35)
  {
    id v36 = __atxlog_handle_blending();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:]();
    }
  }
  if (!v34)
  {
    uint64_t v37 = __atxlog_handle_blending();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ATXHomeScreenLayoutSelector2 _loadHomeScreenState:](v37, v38, v39, v40, v41, v42, v43, v44);
    }

    uint64_t v34 = objc_opt_new();
  }
  long long v45 = [[_ATXHomeScreenState alloc] initWithSortedHomeScreenPagesByUserLastVisit:v18 appsOnDock:v34 stackStateTracker:self->_stackStateTracker suggestionDeduplicator:self->_suggestionDeduplicator hyperParameters:self->_hyperParameters];

  return v45;
}

- (void)_logStackDetail:(id)a3
{
  *(void *)((char *)&v30[2] + 6) = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = __atxlog_handle_blending();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v3 identifier];
    id v6 = [v3 page];
    *(_DWORD *)buf = 138544386;
    uint64_t v25 = v5;
    __int16 v26 = 2048;
    uint64_t v27 = [v6 pageIndex];
    __int16 v28 = 1024;
    *(_DWORD *)__int16 v29 = [v3 allowsSmartRotate];
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = [v3 allowsNewWidget];
    LOWORD(v30[0]) = 2048;
    *(void *)((char *)v30 + 2) = [v3 stackLayoutSize];
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "HSLS [loadHSState]: stack %{public}@ page=%lu rotatation=%d N+1=%d size=%lu widgets:", buf, 0x2Cu);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v18 = v3;
  id v7 = [v3 widgets];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = __atxlog_handle_blending();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [v12 widgetUniqueId];
          uint64_t v15 = [v12 extensionBundleId];
          uint64_t v16 = [v12 widgetKind];
          uint64_t v17 = [v12 intent];
          *(_DWORD *)buf = 138413058;
          uint64_t v25 = v14;
          __int16 v26 = 2112;
          uint64_t v27 = (uint64_t)v15;
          __int16 v28 = 2112;
          *(void *)__int16 v29 = v16;
          *(_WORD *)&v29[8] = 2112;
          v30[0] = v17;
          _os_log_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEFAULT, "  HSLS [loadHSState]: %@ : %@ : %@ : %@", buf, 0x2Au);
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
}

- (id)_sortedPagesByMostRecentUserVisit:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = -[ATXStackStateTracker lastThreeUserVisitDatesOfPage:](self->_stackStateTracker, "lastThreeUserVisitDatesOfPage:", [v10 pageIndex]);
        uint64_t v12 = [v11 firstObject];
        uint64_t v13 = v12;
        if (v12)
        {
          id v14 = v12;
        }
        else
        {
          id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
        uint64_t v15 = v14;

        uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "pageIndex"));
        [v5 setObject:v15 forKeyedSubscript:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __66__ATXHomeScreenLayoutSelector2__sortedPagesByMostRecentUserVisit___block_invoke;
  v21[3] = &unk_1E68AE168;
  id v22 = v5;
  id v17 = v5;
  id v18 = [obj sortedArrayUsingComparator:v21];

  return v18;
}

uint64_t __66__ATXHomeScreenLayoutSelector2__sortedPagesByMostRecentUserVisit___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = NSNumber;
  id v7 = a3;
  uint64_t v8 = objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(a2, "pageIndex"));
  uint64_t v9 = [v5 objectForKeyedSubscript:v8];

  uint64_t v10 = *(void **)(a1 + 32);
  uint64_t v11 = NSNumber;
  uint64_t v12 = [v7 pageIndex];

  uint64_t v13 = [v11 numberWithUnsignedInteger:v12];
  id v14 = [v10 objectForKeyedSubscript:v13];

  uint64_t v15 = [v14 compare:v9];
  return v15;
}

- (id)_homeScreenCachedSuggestionsFromHomeScreenState:(id)a3 sortedFallbackSuggestions:(id)a4 suggestionsWidgetPreviews:(id)a5 appPredictionPanelPreview:(id)a6 withUUID:(id)a7
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v58 = a4;
  id v56 = a5;
  id v57 = a6;
  id v13 = a7;
  long long v72 = objc_opt_new();
  uint64_t v66 = objc_opt_new();
  id v65 = objc_opt_new();
  BOOL v67 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v59 = v12;
  id obj = [v12 sortedPagesByUserLastVisit];
  uint64_t v62 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
  if (v62)
  {
    uint64_t v61 = *(void *)v90;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v90 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v63 = v14;
        uint64_t v15 = *(void **)(*((void *)&v89 + 1) + 8 * v14);
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        id v64 = [v15 stacks];
        uint64_t v69 = [v64 countByEnumeratingWithState:&v85 objects:v96 count:16];
        if (v69)
        {
          uint64_t v68 = *(void *)v86;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v86 != v68) {
                objc_enumerationMutation(v64);
              }
              uint64_t v71 = v16;
              id v17 = *(void **)(*((void *)&v85 + 1) + 8 * v16);
              id v18 = [v17 topOfStackSuggestion];
              uint64_t v19 = [(ATXHomeScreenLayoutSelector2 *)self _processedSuggestionLayoutFromWidgetSuggestion:v18 stack:v17 blendingUpdateUUID:v13];

              if (v19)
              {
                long long v20 = [v17 config];
                int v21 = [v20 isAppPredictionPanel];

                id v22 = [v17 config];
                long long v23 = [v22 identifier];
                if (v21) {
                  long long v24 = v66;
                }
                else {
                  long long v24 = v65;
                }
                [v24 setObject:v19 forKeyedSubscript:v23];
              }
              long long v70 = (void *)v19;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
              long long v25 = [v17 suggestionsWidgetSuggestionsByWidgetUniqueId];
              long long v26 = [v25 allValues];

              uint64_t v27 = [v26 countByEnumeratingWithState:&v81 objects:v95 count:16];
              if (v27)
              {
                uint64_t v28 = v27;
                uint64_t v29 = *(void *)v82;
                do
                {
                  for (uint64_t i = 0; i != v28; ++i)
                  {
                    if (*(void *)v82 != v29) {
                      objc_enumerationMutation(v26);
                    }
                    uint64_t v31 = *(void **)(*((void *)&v81 + 1) + 8 * i);
                    uint64_t v32 = [(ATXHomeScreenLayoutSelector2 *)self _processedSuggestionLayoutFromWidgetSuggestion:v31 stack:v17 blendingUpdateUUID:v13];
                    if (v32)
                    {
                      int v33 = [v31 widget];
                      uint64_t v34 = [v33 widgetUniqueId];
                      [v72 setObject:v32 forKeyedSubscript:v34];
                    }
                  }
                  uint64_t v28 = [v26 countByEnumeratingWithState:&v81 objects:v95 count:16];
                }
                while (v28);
              }

              id v35 = objc_opt_new();
              long long v77 = 0u;
              long long v78 = 0u;
              long long v79 = 0u;
              long long v80 = 0u;
              id v36 = [v17 suggestedWidgets];
              uint64_t v37 = [v36 countByEnumeratingWithState:&v77 objects:v94 count:16];
              if (v37)
              {
                uint64_t v38 = v37;
                uint64_t v39 = *(void *)v78;
                do
                {
                  for (uint64_t j = 0; j != v38; ++j)
                  {
                    if (*(void *)v78 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    uint64_t v41 = [(ATXHomeScreenLayoutSelector2 *)self _processedSuggestionLayoutFromWidgetSuggestion:*(void *)(*((void *)&v77 + 1) + 8 * j) stack:v17 blendingUpdateUUID:v13];
                    if (v41) {
                      [v35 addObject:v41];
                    }
                  }
                  uint64_t v38 = [v36 countByEnumeratingWithState:&v77 objects:v94 count:16];
                }
                while (v38);
              }

              uint64_t v42 = [v17 config];
              uint64_t v43 = [v42 identifier];
              [v67 setObject:v35 forKeyedSubscript:v43];

              uint64_t v16 = v71 + 1;
            }
            while (v71 + 1 != v69);
            uint64_t v69 = [v64 countByEnumeratingWithState:&v85 objects:v96 count:16];
          }
          while (v69);
        }

        uint64_t v14 = v63 + 1;
      }
      while (v63 + 1 != v62);
      uint64_t v62 = [obj countByEnumeratingWithState:&v89 objects:v97 count:16];
    }
    while (v62);
  }

  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  id v44 = v56;
  uint64_t v45 = [v44 countByEnumeratingWithState:&v73 objects:v93 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    uint64_t v47 = *(void *)v74;
    do
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v74 != v47) {
          objc_enumerationMutation(v44);
        }
        id v49 = *(void **)(*((void *)&v73 + 1) + 8 * k);
        long long v50 = [(ATXHomeScreenLayoutSelector2 *)self _processedSuggestionLayoutFromWidgetSuggestion:v49 stack:0 blendingUpdateUUID:v13];
        if (v50)
        {
          long long v51 = [v49 widget];
          long long v52 = [v51 widgetUniqueId];
          [v72 setObject:v50 forKeyedSubscript:v52];
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v73 objects:v93 count:16];
    }
    while (v46);
  }

  long long v53 = [(ATXHomeScreenLayoutSelector2 *)self _processedSuggestionLayoutFromWidgetSuggestion:v57 stack:0 blendingUpdateUUID:v13];
  if (v53) {
    [v66 setObject:v53 forKeyedSubscript:*MEMORY[0x1E4F4B598]];
  }
  long long v54 = (void *)[objc_alloc(MEMORY[0x1E4F938E8]) initWithUUID:v13 suggestionWidgetLayouts:v72 appPredictionPanelLayouts:v66 topOfStackLayouts:v65 suggestedWidgetLayouts:v67 fallbackSuggestions:v58];

  return v54;
}

- (id)_processedSuggestionLayoutFromWidgetSuggestion:(id)a3 stack:(id)a4 blendingUpdateUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 suggestionLayout];

  if (v11)
  {
    uint64_t v11 = [v8 suggestionLayout];
    id v12 = [v8 widget];
    id v13 = [v8 mainSuggestionInLayout];
    uint64_t v14 = [v13 scoreSpecification];
    uint64_t v15 = [v14 suggestedConfidenceCategory];

    [v11 setUuid:v10];
    uint64_t v16 = [v8 mainSuggestionInLayout];
    id v17 = [v16 uuid];
    [v11 setUuidOfHighestConfidenceSuggestion:v17];

    id v18 = [v12 extensionBundleId];
    if ([v18 isEqualToString:*MEMORY[0x1E4F4B5F8]])
    {
      [v11 setIsValidForSuggestionsWidget:1];
    }
    else
    {
      uint64_t v19 = [v12 extensionBundleId];
      objc_msgSend(v11, "setIsValidForSuggestionsWidget:", objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E4F4AD48]));
    }
    long long v20 = [v12 widgetUniqueId];
    [v11 setWidgetUniqueId:v20];

    [v11 setIsLowConfidenceStackRotationForStaleStack:v15 < 3];
    int v21 = [v9 config];
    id v22 = [v21 widgets];
    objc_msgSend(v11, "setNumWidgetsInStack:", objc_msgSend(v22, "count"));

    [(ATXHomeScreenLayoutSelector2 *)self _computeScoreForLayout:v11];
    objc_msgSend(v11, "setLayoutScore:");
    long long v23 = [v9 suggestedWidgets];
    objc_msgSend(v11, "setIsNPlusOne:", objc_msgSend(v23, "containsObject:", v8));
  }
  return v11;
}

- (double)_computeScoreForLayout:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(MEMORY[0x1E4F939C8], "minSuggestionLayoutTypesForUILayoutType:", objc_msgSend(v4, "layoutType"));
  uint64_t v6 = [v5 objectForKeyedSubscript:&unk_1F27F0570];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (v7)
  {
    unint64_t v8 = 0;
    double v9 = 0.0;
    do
    {
      id v10 = [v4 oneByOneSuggestions];
      uint64_t v11 = [v10 objectAtIndexedSubscript:v8];

      id v12 = [v11 scoreSpecification];
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", [v12 suggestedConfidenceCategory]);
      double v9 = v9 + v13;

      ++v8;
      uint64_t v14 = [v5 objectForKeyedSubscript:&unk_1F27F0570];
      unint64_t v15 = [v14 unsignedIntegerValue];
    }
    while (v8 < v15);
  }
  else
  {
    double v9 = 0.0;
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:&unk_1F27F0588];
  uint64_t v17 = [v16 unsignedIntegerValue];

  if (v17)
  {
    unint64_t v18 = 0;
    do
    {
      uint64_t v19 = [v4 oneByTwoSuggestions];
      long long v20 = [v19 objectAtIndexedSubscript:v18];

      int v21 = [v20 scoreSpecification];
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", [v21 suggestedConfidenceCategory]);
      double v9 = v9 + v22;

      ++v18;
      long long v23 = [v5 objectForKeyedSubscript:&unk_1F27F0588];
      unint64_t v24 = [v23 unsignedIntegerValue];
    }
    while (v18 < v24);
  }
  long long v25 = [v5 objectForKeyedSubscript:&unk_1F27F05A0];
  uint64_t v26 = [v25 unsignedIntegerValue];

  if (v26)
  {
    unint64_t v27 = 0;
    do
    {
      uint64_t v28 = [v4 twoByTwoSuggestions];
      uint64_t v29 = [v28 objectAtIndexedSubscript:v27];

      uint64_t v30 = [v29 scoreSpecification];
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", [v30 suggestedConfidenceCategory]);
      double v9 = v9 + v31;

      ++v27;
      uint64_t v32 = [v5 objectForKeyedSubscript:&unk_1F27F05A0];
      unint64_t v33 = [v32 unsignedIntegerValue];
    }
    while (v27 < v33);
  }
  uint64_t v34 = [v5 objectForKeyedSubscript:&unk_1F27F05B8];
  uint64_t v35 = [v34 unsignedIntegerValue];

  if (v35)
  {
    unint64_t v36 = 0;
    do
    {
      uint64_t v37 = [v4 oneByFourSuggestions];
      uint64_t v38 = [v37 objectAtIndexedSubscript:v36];

      uint64_t v39 = [v38 scoreSpecification];
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", [v39 suggestedConfidenceCategory]);
      double v9 = v9 + v40;

      ++v36;
      uint64_t v41 = [v5 objectForKeyedSubscript:&unk_1F27F05B8];
      unint64_t v42 = [v41 unsignedIntegerValue];
    }
    while (v36 < v42);
  }
  uint64_t v43 = [v5 objectForKeyedSubscript:&unk_1F27F05D0];
  uint64_t v44 = [v43 unsignedIntegerValue];

  if (v44)
  {
    unint64_t v45 = 0;
    do
    {
      uint64_t v46 = [v4 twoByFourSuggestions];
      uint64_t v47 = [v46 objectAtIndexedSubscript:v45];

      uint64_t v48 = [v47 scoreSpecification];
      -[ATXHomeScreenLayoutSelector2 _weightForConfidenceCategory:](self, "_weightForConfidenceCategory:", [v48 suggestedConfidenceCategory]);
      double v9 = v9 + v49;

      ++v45;
      long long v50 = [v5 objectForKeyedSubscript:&unk_1F27F05D0];
      unint64_t v51 = [v50 unsignedIntegerValue];
    }
    while (v45 < v51);
  }

  return v9;
}

- (double)_weightForConfidenceCategory:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 100.0;
  }
  else {
    return dbl_1D142B438[a3];
  }
}

- (BOOL)_isStackStale:(id)a3
{
  return [a3 isStale];
}

- (NSDictionary)widgetSuggestionReloadBudgetByStackId
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (void)setWidgetSuggestionReloadBudgetByStackId:(id)a3
{
}

- (BOOL)hasAskedChronoAboutReloadBudget
{
  return self->_hasAskedChronoAboutReloadBudget;
}

- (void)setHasAskedChronoAboutReloadBudget:(BOOL)a3
{
  self->_hasAskedChronoAboutReloadBudget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetSuggestionReloadBudgetByStackId, 0);
  objc_storeStrong((id *)&self->_dismissedSuggestionsForAppPredictionPanels, 0);
  objc_storeStrong((id *)&self->_dismissedSuggestionsForSuggestionsWidget, 0);
  objc_storeStrong((id *)&self->_widgetSuggestionDenyList, 0);
  objc_storeStrong((id *)&self->_timelineRelevanceFilter, 0);
  objc_storeStrong((id *)&self->_descriptorCache, 0);
  objc_storeStrong((id *)&self->_chronoService, 0);
  objc_storeStrong((id *)&self->_modeFilter, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_stackStateTracker, 0);
  objc_storeStrong((id *)&self->_widgetDismissManager, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_suggestionDeduplicator, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_homeScreenPageConfigs, 0);
}

- (void)_assignUnfilledSGWidgetForPage:(uint64_t)a1 suggestions:(uint64_t)a2 homeScreenState:.cold.1(uint64_t a1, uint64_t a2)
{
  id v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "widget");
  int v5 = [v4 widgetUniqueId];
  _DWORD *v3 = 138412290;
  void *v2 = v5;
  OUTLINED_FUNCTION_6_0(&dword_1D0FA3000, v6, v7, "  HSLS [assignUnfilledSG]: Not enough suggestions to fill layouts of SW %@");
}

- (void)_fillSuggestedSGWidgetIfLayoutNotComplete:(void *)a1 withSuggestions:(NSObject *)a2 updatingUsedSuggestionIndexSet:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 widget];
  id v4 = [v3 widgetUniqueId];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "HSLS [fillIncompleteSuggestedSG]: unable to fill layout for suggested SG widget %{public}@", v5, 0xCu);
}

void __121__ATXHomeScreenLayoutSelector2__fillSuggestedSGWidgetIfLayoutNotComplete_withSuggestions_updatingUsedSuggestionIndexSet___block_invoke_cold_1(id *a1)
{
  v1 = [*a1 widget];
  v2 = [v1 widgetUniqueId];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "HSLS [fillIncompleteSuggestedSG]: Failure to add suggestion to existing suggested SG widget %{public}@, suggestion %@", v5, v6, v7, v8, v9);
}

void __114__ATXHomeScreenLayoutSelector2__assignExistingSuggestedSGWidgetsOnPages_withSuggestions_suggestionToRankingIndex___block_invoke_2_cold_1(id *a1)
{
  v1 = [*a1 widget];
  v2 = [v1 widgetUniqueId];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_6(&dword_1D0FA3000, v3, v4, "HSLS [assignExistingSuggestedSG]: Failure to add suggestion to existing suggested SG widget %{public}@, suggestion %@", v5, v6, v7, v8, v9);
}

- (void)_stackHasRemainingReloadBudgetForWidgetSuggestion:(uint64_t)a3 homeScreenState:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __98__ATXHomeScreenLayoutSelector2__stackHasRemainingReloadBudgetForWidgetSuggestion_homeScreenState___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
}

- (void)_suggestionsWidgetPreviewsFromRankedSuggestions:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "widget");
  uint64_t v5 = [v4 widgetUniqueId];
  _DWORD *v3 = 138412290;
  void *v2 = v5;
  OUTLINED_FUNCTION_6_0(&dword_1D0FA3000, v6, v7, "HSLS [SWPreviewGeneration]: Not enough suggestion to generate preview %@");
}

- (void)_appPredictionPanelPreviewFromRankedSuggestions:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 widget];
  uint64_t v4 = [v3 widgetUniqueId];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "HSLS [APPPreviewGeneration]: Not enough suggestion to generate preview %@", v5, 0xCu);
}

- (void)_isBackgroundAppRefreshAllowedForAppBundleId:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "HSLS: Attempting to consider suggestion with no app bundle identifier: %@", (uint8_t *)&v1, 0xCu);
}

- (void)_isBackgroundAppRefreshAllowedForAppBundleId:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *(unsigned __int8 *)(*(void *)a1 + 24);
  v4[0] = 67109378;
  v4[1] = v3;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_DEBUG, "HSLS: Background app refresh is allowed %{BOOL}d for %@", (uint8_t *)v4, 0x12u);
}

- (void)_isBackgroundAppRefreshAllowedForAppBundleId:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "HSLS: Attempting to query background app refresh state but the request timed out; assuming YES for %@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

- (void)_loadHomeScreenState:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadHomeScreenState:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "HSLS [loadHSState]: Error loading dock apps - %@", v2, v3, v4, v5, v6);
}

- (void)_loadHomeScreenState:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_loadHomeScreenState:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "HSLS [loadHSState]: Error loading HomeScreenConfigs - %@", v2, v3, v4, v5, v6);
}

@end