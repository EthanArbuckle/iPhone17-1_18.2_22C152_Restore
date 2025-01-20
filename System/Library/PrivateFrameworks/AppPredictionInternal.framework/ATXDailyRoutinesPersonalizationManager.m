@interface ATXDailyRoutinesPersonalizationManager
+ (id)_filterActions:(id)a3 havingCounts:(id)a4 includeBundleIds:(id)a5 excludeBundleIds:(id)a6 includeActionTypes:(id)a7 excludeActionTypes:(id)a8 havingMinOccurrences:(unint64_t)a9;
+ (id)_filterUnpackedActions:(id)a3;
+ (id)_rankActions:(id)a3 havingCounts:(id)a4;
+ (id)_unpackMostFrequentActionParameters:(id)a3 havingCounts:(id)a4 limit:(unint64_t)a5;
+ (id)sharedInstance;
- (ATXDailyRoutinesPersonalizationManager)init;
- (ATXDailyRoutinesPersonalizationManager)initWithFakeActions:(id)a3 loiManager:(id)a4;
- (BOOL)_allRequiredActionTypesPresent:(id)a3 minOccurrences:(unint64_t)a4 forContext:(id)a5;
- (BOOL)_enoughActionHistory;
- (BOOL)shouldDisplayDailyRoutineForContext:(id)a3;
- (id)_getMostFrequentActionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 minOccurrences:(unint64_t)a8 limit:(unint64_t)a9;
- (id)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8;
@end

@implementation ATXDailyRoutinesPersonalizationManager

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__ATXDailyRoutinesPersonalizationManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6_17 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_17, block);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_22;
  return v2;
}

void __56__ATXDailyRoutinesPersonalizationManager_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_22;
  sharedInstance__pasExprOnceResult_22 = v1;
}

- (BOOL)shouldDisplayDailyRoutineForContext:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = [v4 contextType];
    _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "Daily routines feasibility for context type %lu requested", (uint8_t *)&v13, 0xCu);
  }

  if (![(ATXDailyRoutinesPersonalizationManager *)self _enoughActionHistory])
  {
    v8 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      v9 = "Not enough action history for requested context";
LABEL_16:
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, 2u);
    }
LABEL_17:
    LOBYTE(v10) = 0;
    goto LABEL_21;
  }
  uint64_t v6 = [v4 contextType];
  if (v6)
  {
    if (v6 == 1)
    {
      if (([(ATXLocationOfInterestManagerProtocol *)self->_loiManager isAvailableLocationOfInterestType:0] & 1) == 0)goto LABEL_14; {
      v7 = &unk_1F27F35D0;
      }
    }
    else
    {
      if (v6 == 2)
      {
        if ([(ATXLocationOfInterestManagerProtocol *)self->_loiManager isAvailableLocationOfInterestType:1])
        {
          v7 = &unk_1F27F35E8;
          goto LABEL_19;
        }
LABEL_14:
        v8 = __atxlog_handle_dailyroutines();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v13) = 0;
          v9 = "LOI does not exist for requested context";
          goto LABEL_16;
        }
        goto LABEL_17;
      }
      v7 = 0;
    }
  }
  else
  {
    v7 = &unk_1F27F3600;
  }
LABEL_19:
  v11 = +[_ATXGlobals sharedInstance];
  BOOL v10 = -[ATXDailyRoutinesPersonalizationManager _allRequiredActionTypesPresent:minOccurrences:forContext:](self, "_allRequiredActionTypesPresent:minOccurrences:forContext:", v7, [v11 personalizationRequiredCountForRelevance], v4);

  v8 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 67109120;
    LODWORD(v14) = v10;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Action requirements met: %{BOOL}d", (uint8_t *)&v13, 8u);
  }
LABEL_21:

  return v10;
}

- (id)getActionPredictionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 limit:(unint64_t)a8
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v32 = [v12 contextType];
    _os_log_impl(&dword_1D0FA3000, v17, OS_LOG_TYPE_INFO, "Predictions for context type %lu requested", buf, 0xCu);
  }

  if (v13)
  {
    v18 = [MEMORY[0x1E4F1CAD0] setWithArray:v13];
    if (v14)
    {
LABEL_5:
      v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v14];
      goto LABEL_8;
    }
  }
  else
  {
    v18 = 0;
    if (v14) {
      goto LABEL_5;
    }
  }
  v19 = 0;
LABEL_8:
  v30 = v14;
  if (v15)
  {
    v20 = [MEMORY[0x1E4F1CAD0] setWithArray:v15];
  }
  else
  {
    v20 = 0;
  }
  v21 = v13;
  v22 = v12;
  if (v16)
  {
    v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v16];
  }
  else
  {
    v23 = 0;
  }
  v24 = +[_ATXGlobals sharedInstance];
  v25 = -[ATXDailyRoutinesPersonalizationManager _getMostFrequentActionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:](self, "_getMostFrequentActionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:", v22, v18, v19, v20, v23, [v24 personalizationRequiredCountForRelevance], a8);

  v26 = (void *)[objc_alloc(MEMORY[0x1E4F4AE60]) initWithScoredActions:v25 cacheFileData:0 consumerSubType:0 error:0];
  return v26;
}

- (ATXDailyRoutinesPersonalizationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)ATXDailyRoutinesPersonalizationManager;
  v2 = [(ATXDailyRoutinesPersonalizationManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    actionManager = v2->_actionManager;
    v2->_actionManager = (ATXContextualActionManager *)v3;

    uint64_t v5 = [MEMORY[0x1E4F935D0] sharedInstance];
    loiManager = v2->_loiManager;
    v2->_loiManager = (ATXLocationOfInterestManagerProtocol *)v5;
  }
  return v2;
}

- (ATXDailyRoutinesPersonalizationManager)initWithFakeActions:(id)a3 loiManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXDailyRoutinesPersonalizationManager;
  objc_super v8 = [(ATXDailyRoutinesPersonalizationManager *)&v12 init];
  if (v8)
  {
    v9 = [[ATXContextualActionManager alloc] initWithStaticActions:v6];
    actionManager = v8->_actionManager;
    v8->_actionManager = v9;

    objc_storeStrong((id *)&v8->_loiManager, a4);
  }

  return v8;
}

- (id)_getMostFrequentActionsForContext:(id)a3 includeBundleIds:(id)a4 excludeBundleIds:(id)a5 includeActionTypes:(id)a6 excludeActionTypes:(id)a7 minOccurrences:(unint64_t)a8 limit:(unint64_t)a9
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v50 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = [v15 timeWindow];

  if (v19)
  {
    v20 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[ATXDailyRoutinesPersonalizationManager _getMostFrequentActionsForContext:includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:](v20);
    }
  }
  v21 = [(ATXContextualActionManager *)self->_actionManager getCountsForContext:v15];
  v22 = objc_opt_class();
  v23 = [v21 allObjects];
  v49 = v16;
  v24 = [v22 _filterActions:v23 havingCounts:v21 includeBundleIds:v16 excludeBundleIds:v50 includeActionTypes:v17 excludeActionTypes:v18 havingMinOccurrences:a8];

  v25 = [(id)objc_opt_class() _unpackMostFrequentActionParameters:v24 havingCounts:v21 limit:a9];
  v26 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v54 = [v25 count];
    _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_INFO, "Found %lu actions for requested context", buf, 0xCu);
  }

  if ([v15 contextType] && objc_msgSend(v25, "count") < a9)
  {
    unint64_t v46 = a9 - [v25 count];
    [(ATXContextualActionManager *)self->_actionManager getAllCounts];
    v28 = v27 = v24;
    v29 = [v28 allObjects];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __169__ATXDailyRoutinesPersonalizationManager__getMostFrequentActionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_minOccurrences_limit___block_invoke;
    v51[3] = &unk_1E68B1A60;
    v47 = v27;
    id v52 = v27;
    objc_msgSend(v29, "_pas_filteredArrayWithTest:", v51);
    id v30 = v18;
    uint64_t v32 = v31 = v17;

    uint64_t v33 = objc_opt_class();
    v48 = (void *)v32;
    uint64_t v34 = v32;
    id v17 = v31;
    id v18 = v30;
    v35 = [v33 _filterActions:v34 havingCounts:v28 includeBundleIds:v49 excludeBundleIds:v50 includeActionTypes:v17 excludeActionTypes:v30 havingMinOccurrences:a8];
    v36 = [(id)objc_opt_class() _unpackMostFrequentActionParameters:v35 havingCounts:v28 limit:v46];
    v37 = __atxlog_handle_dailyroutines();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      uint64_t v38 = [v36 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v54 = v38;
      _os_log_impl(&dword_1D0FA3000, v37, OS_LOG_TYPE_INFO, "Found %lu additional actions to suggest", buf, 0xCu);
    }

    uint64_t v39 = [v25 arrayByAddingObjectsFromArray:v36];

    v25 = (void *)v39;
    v24 = v47;
  }
  if ([v25 count])
  {
    uint64_t v40 = 0;
    unint64_t v41 = 0;
    do
    {
      float v42 = (float)(unint64_t)([v25 count] + v40);
      v43 = [v25 objectAtIndexedSubscript:v41];
      *(float *)&double v44 = v42;
      [v43 setScore:v44];

      ++v41;
      --v40;
    }
    while (v41 < [v25 count]);
  }

  return v25;
}

uint64_t __169__ATXDailyRoutinesPersonalizationManager__getMostFrequentActionsForContext_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_minOccurrences_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

+ (id)_filterActions:(id)a3 havingCounts:(id)a4 includeBundleIds:(id)a5 excludeBundleIds:(id)a6 includeActionTypes:(id)a7 excludeActionTypes:(id)a8 havingMinOccurrences:(unint64_t)a9
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = (void *)MEMORY[0x1E4F1CAD0];
  id v20 = a3;
  v21 = +[_ATXGlobals sharedInstance];
  v22 = [v21 personalizationBlacklistedBundleIds];
  v23 = [v19 setWithArray:v22];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __163__ATXDailyRoutinesPersonalizationManager__filterActions_havingCounts_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_havingMinOccurrences___block_invoke;
  v32[3] = &unk_1E68B1A88;
  id v33 = v15;
  id v34 = v23;
  id v35 = v16;
  id v36 = v17;
  id v37 = v18;
  id v38 = v14;
  unint64_t v39 = a9;
  id v24 = v14;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v23;
  id v29 = v15;
  id v30 = objc_msgSend(v20, "_pas_filteredArrayWithTest:", v32);

  return v30;
}

BOOL __163__ATXDailyRoutinesPersonalizationManager__filterActions_havingCounts_includeBundleIds_excludeBundleIds_includeActionTypes_excludeActionTypes_havingMinOccurrences___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 bundleId];
  uint64_t v5 = [v3 actionType];
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    int v7 = [v6 containsObject:v4] ^ 1;
  }
  else {
    int v7 = 0;
  }
  if ([*(id *)(a1 + 40) containsObject:v4])
  {
    int v8 = 1;
  }
  else
  {
    v9 = *(void **)(a1 + 48);
    if (v9) {
      int v8 = [v9 containsObject:v4];
    }
    else {
      int v8 = 0;
    }
  }
  BOOL v10 = *(void **)(a1 + 56);
  if (v10) {
    int v11 = [v10 containsObject:v5];
  }
  else {
    int v11 = 1;
  }
  objc_super v12 = *(void **)(a1 + 64);
  if (v12) {
    int v13 = [v12 containsObject:v5] ^ 1;
  }
  else {
    int v13 = 1;
  }
  BOOL v14 = 0;
  if ((v11 & ~(v7 | v8)) == 1 && v13) {
    BOOL v14 = (unint64_t)[*(id *)(a1 + 72) countForObject:v3] >= *(void *)(a1 + 80);
  }

  return v14;
}

+ (id)_unpackMostFrequentActionParameters:(id)a3 havingCounts:(id)a4 limit:(unint64_t)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v36 = v7;
  v9 = [(id)objc_opt_class() _rankActions:v7 havingCounts:v8];
  BOOL v10 = objc_opt_new();
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(obj);
        }
        id v15 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v16 = (void *)MEMORY[0x1D25F6CC0]();
        *(float *)&double v17 = (float)(unint64_t)[v8 countForObject:v15];
        id v18 = [v15 getContainerWithScore:v17];
        v19 = v18;
        if (v18)
        {
          id v20 = [v18 scoredAction];
          v21 = [v20 predictedItem];

          +[_ATXActionUtils fetchDataAndUpdateContentAttributeSetForAction:v21];
          [v10 addObject:v19];
        }
        if ([v10 count] >= a5)
        {
          v22 = [(id)objc_opt_class() _filterUnpackedActions:v10];

          v23 = __atxlog_handle_dailyroutines();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v24 = [v22 count];
            *(_DWORD *)buf = 134218240;
            uint64_t v48 = v24;
            __int16 v49 = 2048;
            unint64_t v50 = a5;
            _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_INFO, "Recovered action data for %lu out of up to %lu entries", buf, 0x16u);
          }

          if ([v22 count] >= a5)
          {

            BOOL v10 = v22;
            goto LABEL_17;
          }
          BOOL v10 = v22;
        }
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  id v25 = [(id)objc_opt_class() _filterUnpackedActions:v10];

  id v26 = __atxlog_handle_dailyroutines();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    uint64_t v27 = [v25 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v48 = v27;
    __int16 v49 = 2048;
    unint64_t v50 = a5;
    _os_log_impl(&dword_1D0FA3000, v26, OS_LOG_TYPE_INFO, "Recovered action data for %lu out of up to %lu entries", buf, 0x16u);
  }

  id v28 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v29 = v25;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v39 != v32) {
          objc_enumerationMutation(v29);
        }
        id v34 = [*(id *)(*((void *)&v38 + 1) + 8 * j) scoredAction];
        [v28 addObject:v34];
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v31);
  }

  return v28;
}

+ (id)_rankActions:(id)a3 havingCounts:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__ATXDailyRoutinesPersonalizationManager__rankActions_havingCounts___block_invoke;
  v9[3] = &unk_1E68AC7A0;
  id v10 = v5;
  id v6 = v5;
  id v7 = [a3 sortedArrayUsingComparator:v9];

  return v7;
}

uint64_t __68__ATXDailyRoutinesPersonalizationManager__rankActions_havingCounts___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  unint64_t v7 = [v5 countForObject:a2];
  unint64_t v8 = [*(id *)(a1 + 32) countForObject:v6];

  if (v7 > v8) {
    return -1;
  }
  else {
    return v7 < v8;
  }
}

+ (id)_filterUnpackedActions:(id)a3
{
  id v3 = +[ATXActionPredictionsProcessor removeDuplicateActionPredictions:a3];
  id v4 = +[ATXActionPredictionsProcessor removeMissingOrBlockedRecipientPredictions:v3];

  id v5 = [MEMORY[0x1E4F1CA48] arrayWithArray:v4];

  return v5;
}

- (BOOL)_enoughActionHistory
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = +[_ATXGlobals sharedInstance];
  double v4 = (double)(unint64_t)[v3 personalizationRequiredActionHistorySeconds];

  [(ATXContextualActionManager *)self->_actionManager getIntervalSinceOldestEvent];
  double v6 = v5;
  unint64_t v7 = __atxlog_handle_dailyroutines();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 < v4)
  {
    if (v8)
    {
      int v11 = 134218240;
      unint64_t v12 = (unint64_t)v6;
      __int16 v13 = 2048;
      unint64_t v14 = (unint64_t)v4;
      v9 = "Not enough action history for requested context (got %lu (s) < %lu (s))";
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    int v11 = 134218240;
    unint64_t v12 = (unint64_t)v6;
    __int16 v13 = 2048;
    unint64_t v14 = (unint64_t)v4;
    v9 = "Action history is old enough (got %lu (s) >= %lu (s))";
LABEL_6:
    _os_log_impl(&dword_1D0FA3000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0x16u);
  }

  return v6 >= v4;
}

- (BOOL)_allRequiredActionTypesPresent:(id)a3 minOccurrences:(unint64_t)a4 forContext:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 count];
  BOOL v8 = __atxlog_handle_dailyroutines();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v6;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "Action types required: %@", buf, 0xCu);
    }

    BOOL v8 = [MEMORY[0x1E4F1CA80] setWithArray:v6];
    id v10 = [(ATXContextualActionManager *)self->_actionManager getAllCounts];
    int v11 = (void *)MEMORY[0x1E4F1CAD0];
    unint64_t v12 = +[_ATXGlobals sharedInstance];
    __int16 v13 = [v12 personalizationBlacklistedBundleIds];
    unint64_t v14 = [v11 setWithArray:v13];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v33 = v6;
      uint64_t v18 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v21 = __atxlog_handle_dailyroutines();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = [v20 bundleId];
            *(_DWORD *)buf = 138412290;
            id v41 = v22;
            _os_log_impl(&dword_1D0FA3000, v21, OS_LOG_TYPE_INFO, "Processing action for %@", buf, 0xCu);
          }
          v23 = [v20 bundleId];
          int v24 = [v14 containsObject:v23];

          if (v24)
          {
            id v25 = __atxlog_handle_dailyroutines();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D0FA3000, v25, OS_LOG_TYPE_INFO, "Skipping this blacklisted action", buf, 2u);
            }
          }
          else
          {
            if ([v15 countForObject:v20] >= a4)
            {
              id v26 = [v20 actionType];
              int v27 = [v8 containsObject:v26];

              if (v27)
              {
                id v28 = __atxlog_handle_dailyroutines();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  id v29 = [v20 actionType];
                  *(_DWORD *)buf = 138412290;
                  id v41 = v29;
                  _os_log_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_INFO, "Action type count requirement met: %@", buf, 0xCu);
                }
              }
              uint64_t v30 = objc_msgSend(v20, "actionType", v33);
              [v8 removeObject:v30];
            }
            if (![v8 count])
            {
              BOOL v31 = 1;
              goto LABEL_28;
            }
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      BOOL v31 = 0;
LABEL_28:
      id v6 = v33;
    }
    else
    {
      BOOL v31 = 0;
    }
  }
  else if (v9)
  {
    *(_WORD *)buf = 0;
    BOOL v31 = 1;
    _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_INFO, "No action types required", buf, 2u);
  }
  else
  {
    BOOL v31 = 1;
  }

  return v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loiManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
}

- (void)_getMostFrequentActionsForContext:(os_log_t)log includeBundleIds:excludeBundleIds:includeActionTypes:excludeActionTypes:minOccurrences:limit:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Context has custom time window provided, but we are ignoring it!", v1, 2u);
}

@end