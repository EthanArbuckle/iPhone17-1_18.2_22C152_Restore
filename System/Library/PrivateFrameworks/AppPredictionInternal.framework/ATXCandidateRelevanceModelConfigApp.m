@interface ATXCandidateRelevanceModelConfigApp
- (ATXAppPredictionBlacklist)appBlacklist;
- (ATXCandidateRelevanceModelConfigApp)init;
- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist;
- (BOOL)bundleIdIsEnabledForPrediction:(id)a3;
- (BOOL)candidateIsStillValidToSuggest:(id)a3;
- (_ATXRecentInstallCache)recentInstallCache;
- (id)appInstallAgesForAppsWithExcludedApps:(id)a3 appInfoManager:(id)a4;
- (id)candidatePublisherFromStartTime:(double)a3;
- (id)datasetGenerator;
- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4;
- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4 appInfoManager:(id)a5;
- (id)proactiveSuggestionForBundleId:(id)a3 prediction:(float)a4;
- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4;
- (id)recentlyInstalledAndNotLaunchedAppsFromAppInfoManager:(id)a3 currentSuggestionExecutableIds:(id)a4 launchedApps:(id)a5;
- (id)recentlyLaunchedAppsFromAppLaunchAges:(id)a3;
- (void)setAppBlacklist:(id)a3;
- (void)setAppDigitalHealthBlacklist:(id)a3;
- (void)setRecentInstallCache:(id)a3;
@end

@implementation ATXCandidateRelevanceModelConfigApp

- (ATXCandidateRelevanceModelConfigApp)init
{
  v16.receiver = self;
  v16.super_class = (Class)ATXCandidateRelevanceModelConfigApp;
  v2 = [(ATXCandidateRelevanceModelConfig *)&v16 init];
  if (v2)
  {
    v3 = [ATXCandidateRelevanceLogisticRegressionModelTrainingPlan alloc];
    v4 = [(ATXCandidateRelevanceModelConfig *)v2 modelTrainingPlanParameters];
    v5 = [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)v3 initWithParameters:v4];
    [(ATXCandidateRelevanceModelConfig *)v2 setModelTrainingPlan:v5];

    v6 = objc_opt_new();
    [(ATXCandidateRelevanceModelConfig *)v2 setDatastore:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F93940]);
    v8 = [MEMORY[0x1E4F93940] clientModelIdFromClientModelType:14];
    v9 = +[ATXClientModelSuggestionReceiver sharedInstance];
    v10 = [v9 blendingLayerServer];
    v11 = (void *)[v7 initWithClientModelId:v8 blendingLayerServer:v10];
    [(ATXCandidateRelevanceModelConfig *)v2 setClientModel:v11];

    v12 = +[ATXAppPredictionBlacklist sharedInstance];
    [(ATXCandidateRelevanceModelConfigApp *)v2 setAppBlacklist:v12];

    v13 = +[ATXDigitalHealthBlacklist sharedInstance];
    [(ATXCandidateRelevanceModelConfigApp *)v2 setAppDigitalHealthBlacklist:v13];

    id v14 = [[_ATXRecentInstallCache alloc] initTrackingAppsMoreRecentThan:300.0];
    [(ATXCandidateRelevanceModelConfigApp *)v2 setRecentInstallCache:v14];
  }
  return v2;
}

- (id)datasetGenerator
{
  v2 = [ATXCandidateRelevanceModelDatasetGenerator alloc];
  v3 = objc_opt_new();
  v4 = [(ATXCandidateRelevanceModelDatasetGenerator *)v2 initWithConfig:v3];

  return v4;
}

- (id)candidatePublisherFromStartTime:(double)a3
{
  return +[ATXCandidateRelevanceModelDatasetGeneratorConfigApp candidatePublisherFromStartTime:a3];
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  v6 = [a3 identifier];
  *(float *)&double v7 = a4;
  v8 = [(ATXCandidateRelevanceModelConfigApp *)self proactiveSuggestionForBundleId:v6 prediction:v7];

  return v8;
}

- (id)proactiveSuggestionForBundleId:(id)a3 prediction:(float)a4
{
  v6 = (objc_class *)MEMORY[0x1E4F93948];
  id v7 = a3;
  id v8 = [v6 alloc];
  v9 = [(ATXCandidateRelevanceModelConfig *)self clientModel];
  v10 = [v9 clientModelId];
  v11 = (void *)[v8 initWithClientModelId:v10 clientModelVersion:@"1.0" engagementResetPolicy:0];

  v12 = +[ATXProactiveSuggestionBuilder _executableSpecForAppWithBundleId:v7];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F93968]) initWithRawScore:2 suggestedConfidenceCategory:a4];
  id v14 = [MEMORY[0x1E4F93960] layoutConfigurationsForLayoutOptions:2];
  LOWORD(v18) = 1;
  v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F93978]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v7, 0, 0, v14, 0, 1, v18);

  objc_super v16 = (void *)[objc_alloc(MEMORY[0x1E4F93938]) initWithClientModelSpecification:v11 executableSpecification:v12 uiSpecification:v15 scoreSpecification:v13];
  return v16;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  id v4 = a3;
  v5 = [(ATXCandidateRelevanceModelConfig *)self installedAppsKnownToSpringBoard];
  v6 = [v4 identifier];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = [v4 identifier];
    BOOL v9 = [(ATXCandidateRelevanceModelConfigApp *)self bundleIdIsEnabledForPrediction:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)bundleIdIsEnabledForPrediction:(id)a3
{
  id v4 = a3;
  v5 = [(ATXCandidateRelevanceModelConfigApp *)self appBlacklist];
  uint64_t v6 = [v5 disabledBundleIds];
  char v7 = [(id)v6 containsObject:v4];

  id v8 = [(ATXCandidateRelevanceModelConfigApp *)self appDigitalHealthBlacklist];
  BOOL v9 = [v8 blacklistedBundleIds];
  LOBYTE(v6) = [v9 containsObject:v4];

  return (v7 | v6) ^ 1;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[_ATXAppInfoManager sharedInstance];
  BOOL v9 = [(ATXCandidateRelevanceModelConfigApp *)self heuristicSuggestionsForContext:v7 currentSuggestionExecutableIds:v6 appInfoManager:v8];

  return v9;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4 appInfoManager:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F1CAD0];
  v12 = [v8 candidateIdentifiersLaunchAge];
  uint64_t v13 = [v12 allKeys];
  id v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
  }
  objc_super v16 = [v11 setWithArray:v15];
  v38 = v10;
  v39 = v9;
  v17 = [(ATXCandidateRelevanceModelConfigApp *)self recentlyInstalledAndNotLaunchedAppsFromAppInfoManager:v10 currentSuggestionExecutableIds:v9 launchedApps:v16];

  uint64_t v18 = objc_msgSend(v17, "subarrayWithRange:", 0, objc_msgSend(v17, "count") != 0);

  v40 = v8;
  v19 = [v8 candidateIdentifiersLaunchAge];
  uint64_t v20 = [(ATXCandidateRelevanceModelConfigApp *)self recentlyLaunchedAppsFromAppLaunchAges:v19];

  v36 = (void *)v20;
  v37 = v18;
  v21 = [v18 arrayByAddingObjectsFromArray:v20];
  v22 = objc_opt_new();
  v23 = objc_opt_new();
  if ([v21 count])
  {
    unint64_t v25 = 0;
    *(void *)&long long v24 = 138412802;
    long long v35 = v24;
    do
    {
      if ((unint64_t)objc_msgSend(v22, "count", v35) >= 2) {
        break;
      }
      v26 = [v21 objectAtIndexedSubscript:v25];
      v27 = [v26 executableSpecification];
      v28 = [v27 executableIdentifier];

      if (([v23 containsObject:v28] & 1) == 0
        && [(ATXCandidateRelevanceModelConfigApp *)self bundleIdIsEnabledForPrediction:v28])
      {
        v29 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v30);
          v32 = [v26 scoreSpecification];
          [v32 rawScore];
          *(_DWORD *)buf = v35;
          v42 = v31;
          __int16 v43 = 2112;
          v44 = v28;
          __int16 v45 = 2048;
          uint64_t v46 = v33;
          _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_DEFAULT, "%@ - Scored heuristic with identifier %@ and score: %f.", buf, 0x20u);
        }
        [v22 addObject:v26];
        [v23 addObject:v28];
      }

      ++v25;
    }
    while ([v21 count] > v25);
  }

  return v22;
}

- (id)recentlyInstalledAndNotLaunchedAppsFromAppInfoManager:(id)a3 currentSuggestionExecutableIds:(id)a4 launchedApps:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  v34 = v9;
  v12 = (void *)[v9 mutableCopy];
  uint64_t v33 = v10;
  [v12 unionSet:v10];
  v32 = v12;
  long long v35 = v8;
  uint64_t v13 = [(ATXCandidateRelevanceModelConfigApp *)self appInstallAgesForAppsWithExcludedApps:v12 appInfoManager:v8];
  [v13 keysSortedByValueUsingComparator:&__block_literal_global_14];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v37;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v37 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * v18);
      uint64_t v20 = [v13 objectForKeyedSubscript:v19];
      [v20 timeIntervalSinceNow];
      double v22 = v21;

      if (v22 < -14400.0) {
        break;
      }
      v23 = __atxlog_handle_relevance_model();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        long long v24 = (objc_class *)objc_opt_class();
        unint64_t v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138412802;
        v41 = v25;
        __int16 v42 = 2112;
        uint64_t v43 = v19;
        __int16 v44 = 2048;
        double v45 = -v22;
        _os_log_impl(&dword_1D0FA3000, v23, OS_LOG_TYPE_DEFAULT, "%@ - Found recently installed app with identifier %@ and install age %f.", buf, 0x20u);
      }
      LODWORD(v26) = 1.0;
      v27 = [(ATXCandidateRelevanceModelConfigApp *)self proactiveSuggestionForBundleId:v19 prediction:v26];
      if (v27)
      {
        [v11 addObject:v27];
      }
      else
      {
        v28 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          v31 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138412546;
          v41 = v31;
          __int16 v42 = 2112;
          uint64_t v43 = v19;
          _os_log_error_impl(&dword_1D0FA3000, v28, OS_LOG_TYPE_ERROR, "%@ - Could not create suggestion for recently installed app with identifier %@.", buf, 0x16u);
        }
      }

      if (v16 == ++v18)
      {
        uint64_t v16 = [v14 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v16) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  return v11;
}

uint64_t __137__ATXCandidateRelevanceModelConfigApp_recentlyInstalledAndNotLaunchedAppsFromAppInfoManager_currentSuggestionExecutableIds_launchedApps___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (id)appInstallAgesForAppsWithExcludedApps:(id)a3 appInfoManager:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ATXCandidateRelevanceModelConfig *)self installedAppsKnownToSpringBoard];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = [(ATXCandidateRelevanceModelConfigApp *)self recentInstallCache];
  v11 = [v10 allRecentlyInstalledApplications];
  [v9 unionSet:v11];

  [v9 minusSet:v6];
  v12 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend(v7, "appInfoForBundleId:", v18, (void)v23);
        uint64_t v20 = [v19 installDate];

        if (v20)
        {
          double v21 = [v19 installDate];
          [v12 setObject:v21 forKeyedSubscript:v18];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  return v12;
}

- (id)recentlyLaunchedAppsFromAppLaunchAges:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = objc_opt_new();
    [v4 keysSortedByValueUsingComparator:&__block_literal_global_146];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * v10);
        v12 = [v4 objectForKeyedSubscript:v11];
        [v12 timeIntervalSinceNow];
        double v14 = v13;

        if (v14 < -1800.0) {
          break;
        }
        uint64_t v15 = __atxlog_handle_relevance_model();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = (objc_class *)objc_opt_class();
          uint64_t v17 = NSStringFromClass(v16);
          *(_DWORD *)buf = 138412802;
          v31 = v17;
          __int16 v32 = 2112;
          uint64_t v33 = v11;
          __int16 v34 = 2048;
          double v35 = -v14;
          _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "%@ - Found recently launched app with identifier %@ and launch age %f.", buf, 0x20u);
        }
        double v18 = v14 * 0.009 / 1800.0 + 0.999;
        *(float *)&double v18 = v18;
        uint64_t v19 = [(ATXCandidateRelevanceModelConfigApp *)self proactiveSuggestionForBundleId:v11 prediction:v18];
        if (v19)
        {
          [v5 addObject:v19];
        }
        else
        {
          uint64_t v20 = __atxlog_handle_relevance_model();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            double v21 = (objc_class *)objc_opt_class();
            long long v25 = NSStringFromClass(v21);
            *(_DWORD *)buf = 138412546;
            v31 = v25;
            __int16 v32 = 2112;
            uint64_t v33 = v11;
            _os_log_error_impl(&dword_1D0FA3000, v20, OS_LOG_TYPE_ERROR, "%@ - Could not create suggestion for recently launched app with identifier %@.", buf, 0x16u);
          }
        }

        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v36 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  else
  {
    id v6 = __atxlog_handle_relevance_model();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v22 = (objc_class *)objc_opt_class();
      long long v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - appLaunchAges is nil, so returning an empty list.", buf, 0xCu);
    }
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

uint64_t __77__ATXCandidateRelevanceModelConfigApp_recentlyLaunchedAppsFromAppLaunchAges___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

- (ATXAppPredictionBlacklist)appBlacklist
{
  return self->_appBlacklist;
}

- (void)setAppBlacklist:(id)a3
{
}

- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist
{
  return self->_appDigitalHealthBlacklist;
}

- (void)setAppDigitalHealthBlacklist:(id)a3
{
}

- (_ATXRecentInstallCache)recentInstallCache
{
  return self->_recentInstallCache;
}

- (void)setRecentInstallCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentInstallCache, 0);
  objc_storeStrong((id *)&self->_appDigitalHealthBlacklist, 0);
  objc_storeStrong((id *)&self->_appBlacklist, 0);
}

@end