@interface ATXFocusModeSignalsMetricLogger
- (ATXFocusModeSignalsMetricLogger)init;
- (id)appScoresForDenyListForMode:(unint64_t)a3;
- (id)appScoresForMode:(unint64_t)a3;
- (id)fetchRelevantBundleIdsWithModeConfigurationUIFlowLoggingEvent:(id)a3 suggestedEntities:(id)a4 candidateEntities:(id)a5 currentEntities:(id)a6;
- (id)metricFieldsToFeatureNames;
- (id)widgetScoresForMode:(unint64_t)a3;
- (unint64_t)logWidgetSignalsForMode:(unint64_t)a3 modeAffinitySignals:(id)a4 entitiesLogged:(unint64_t)a5;
- (void)addAppEntitySpecificFeatures:(id)a3 toMetric:(id)a4;
- (void)logFocusModeAppSignalsWithModeConfigurationUIFlowLoggingEvent:(id)a3 xpcActivity:(id)a4;
- (void)logFocusModeWidgetSignalsWithXPCActivity:(id)a3;
- (void)populateAppModeAffinitySignalsForMode:(unint64_t)a3 bundleId:(id)a4 metric:(id)a5;
- (void)populateAppModeDenyListSignalsForMode:(unint64_t)a3 bundleId:(id)a4 metric:(id)a5;
- (void)populateWidgetModeAffinitySignalsForMode:(unint64_t)a3 metric:(id)a4 modeEntity:(id)a5;
@end

@implementation ATXFocusModeSignalsMetricLogger

- (ATXFocusModeSignalsMetricLogger)init
{
  v24.receiver = self;
  v24.super_class = (Class)ATXFocusModeSignalsMetricLogger;
  v2 = [(ATXFocusModeSignalsMetricLogger *)&v24 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    cachedAppScores = v2->_cachedAppScores;
    v2->_cachedAppScores = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    cachedAppScoresForDenyList = v2->_cachedAppScoresForDenyList;
    v2->_cachedAppScoresForDenyList = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    cachedWidgetScores = v2->_cachedWidgetScores;
    v2->_cachedWidgetScores = (NSMutableDictionary *)v7;

    uint64_t v9 = [MEMORY[0x1E4F4AF78] sharedInstance];
    modeConfigClient = v2->_modeConfigClient;
    v2->_modeConfigClient = (ATXDNDModeConfigurationClient *)v9;

    uint64_t v11 = [MEMORY[0x1E4F4B180] sharedInstance];
    modeEntityTrialClientWrapper = v2->_modeEntityTrialClientWrapper;
    v2->_modeEntityTrialClientWrapper = (ATXModeEntityTrialClientWrapper *)v11;

    uint64_t v13 = objc_opt_new();
    modeEntityStore = v2->_modeEntityStore;
    v2->_modeEntityStore = (ATXModeEntityStore *)v13;

    uint64_t v15 = +[ATXGlobalAppModeAffinityModel modelWithAllInstalledAppsKnownToSpringBoard];
    globalAppModeAffinityModel = v2->_globalAppModeAffinityModel;
    v2->_globalAppModeAffinityModel = (ATXGlobalAppModeAffinityModel *)v15;

    uint64_t v17 = +[ATXGlobalInterruptingAppModel modelWithAllInstalledAppsKnownToSpringBoard];
    globalInterruptingAppModel = v2->_globalInterruptingAppModel;
    v2->_globalInterruptingAppModel = (ATXGlobalInterruptingAppModel *)v17;

    uint64_t v19 = +[ATXGlobalWidgetPopularityModel modelWithAllAvailableWidgets];
    globalWidgetPopularityModel = v2->_globalWidgetPopularityModel;
    v2->_globalWidgetPopularityModel = (ATXGlobalWidgetPopularityModel *)v19;

    uint64_t v21 = objc_opt_new();
    modeAffinityModelsConstants = v2->_modeAffinityModelsConstants;
    v2->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v21;
  }
  return v2;
}

- (void)logFocusModeAppSignalsWithModeConfigurationUIFlowLoggingEvent:(id)a3 xpcActivity:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 modeConfigurationEntityType])
  {
    modeConfigClient = self->_modeConfigClient;
    uint64_t v9 = [v6 dndModeUUID];
    uint64_t v10 = [(ATXDNDModeConfigurationClient *)modeConfigClient atxModeForDNDMode:v9];

    if (v10)
    {
      uint64_t v40 = v10;
      uint64_t v11 = [(ATXDNDModeConfigurationClient *)self->_modeConfigClient dndSemanticTypeForATXMode:v10];
      v12 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v13 = [v6 currentEntityIdentifiers];
      v14 = [v12 setWithArray:v13];

      uint64_t v15 = (void *)MEMORY[0x1E4F1CAD0];
      v16 = [v6 suggestedEntityIdentifiers];
      uint64_t v17 = [v15 setWithArray:v16];

      v18 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v19 = [v6 candidateEntityIdentifiers];
      uint64_t v20 = [v18 setWithArray:v19];

      v49 = (void *)v17;
      v50 = (void *)v20;
      uint64_t v21 = [(ATXFocusModeSignalsMetricLogger *)self fetchRelevantBundleIdsWithModeConfigurationUIFlowLoggingEvent:v6 suggestedEntities:v17 candidateEntities:v20 currentEntities:v14];
      v38 = v11;
      if (v11)
      {
        v48 = -[ATXDNDModeConfigurationClient iOSAppDenyListForMode:](self->_modeConfigClient, "iOSAppDenyListForMode:", objc_msgSend(v11, "integerValue", v11));
        v47 = -[ATXDNDModeConfigurationClient iOSAppAllowListForMode:](self->_modeConfigClient, "iOSAppAllowListForMode:", [v11 integerValue]);
      }
      else
      {
        v47 = (void *)MEMORY[0x1E4F1CBF0];
        v48 = (void *)MEMORY[0x1E4F1CBF0];
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id obj = v21;
      uint64_t v22 = v40;
      uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
      if (v46)
      {
        uint64_t v39 = 0;
        uint64_t v44 = *(void *)v52;
        while (2)
        {
          uint64_t v23 = 0;
          uint64_t v45 = v39 + 1;
          v39 += v46;
          do
          {
            if (*(void *)v52 != v44) {
              objc_enumerationMutation(obj);
            }
            uint64_t v24 = *(void *)(*((void *)&v51 + 1) + 8 * v23);
            v25 = objc_opt_new();
            [v25 setAbGroup:@"default"];
            [v25 setFocusMode:v22];
            if (([v48 containsObject:v24] & 1) != 0 || objc_msgSend(v6, "modeConfigurationType") == 1) {
              objc_msgSend(v25, "setActiveConfigurationType:", @"DenyList", v38);
            }
            if ((objc_msgSend(v47, "containsObject:", v24, v38) & 1) != 0 || !objc_msgSend(v6, "modeConfigurationType")) {
              [v25 setActiveConfigurationType:@"AllowList"];
            }
            v26 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper trialExperimentId];
            [v25 setExperimentId:v26];

            v27 = objc_msgSend(NSNumber, "numberWithInt:", -[ATXModeEntityTrialClientWrapper trialDeploymentId](self->_modeEntityTrialClientWrapper, "trialDeploymentId"));
            [v25 setDeploymentId:v27];

            v28 = [(ATXModeEntityTrialClientWrapper *)self->_modeEntityTrialClientWrapper trialTreatmentId];
            [v25 setTreatmentId:v28];

            [v25 setAppBundleId:v24];
            objc_msgSend(v25, "setIsAppCandidateSuggestion:", objc_msgSend(v50, "containsObject:", v24));
            objc_msgSend(v25, "setIsAppRecommendedSuggestion:", objc_msgSend(v49, "containsObject:", v24));
            if (([v49 containsObject:v24] & 1) != 0
              || [v50 containsObject:v24])
            {
              [v25 setWasAppSuggestedDuringModeSetup:1];
            }
            objc_msgSend(v25, "setWasAppSuggestionDuringModeSetupAccepted:", objc_msgSend(v14, "containsObject:", v24));
            if (![v6 modeConfigurationType]) {
              [(ATXFocusModeSignalsMetricLogger *)self populateAppModeAffinitySignalsForMode:v22 bundleId:v24 metric:v25];
            }
            if ([v6 modeConfigurationType] == 1) {
              [(ATXFocusModeSignalsMetricLogger *)self populateAppModeDenyListSignalsForMode:v22 bundleId:v24 metric:v25];
            }
            v29 = __atxlog_handle_modes();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              v30 = objc_opt_class();
              id v43 = v30;
              v31 = NSStringFromSelector(a2);
              [v25 coreAnalyticsDictionary];
              v32 = self;
              id v33 = v6;
              v34 = v14;
              v36 = id v35 = v7;
              *(_DWORD *)buf = 138412802;
              v56 = v30;
              __int16 v57 = 2112;
              v58 = v31;
              __int16 v59 = 2112;
              v60 = v36;
              _os_log_impl(&dword_1D0FA3000, v29, OS_LOG_TYPE_INFO, "[%@][%@] Logging: %@", buf, 0x20u);

              id v7 = v35;
              v14 = v34;
              id v6 = v33;
              self = v32;

              uint64_t v22 = v40;
            }

            [v25 logToCoreAnalytics];
            if ((unint64_t)(v45 + v23) > 0x13)
            {

              goto LABEL_32;
            }
            char v37 = [v7 didDefer];

            if (v37) {
              goto LABEL_32;
            }
            ++v23;
          }
          while (v46 != v23);
          uint64_t v46 = [obj countByEnumeratingWithState:&v51 objects:v61 count:16];
          if (v46) {
            continue;
          }
          break;
        }
      }
LABEL_32:
    }
  }
}

- (void)populateAppModeAffinitySignalsForMode:(unint64_t)a3 bundleId:(id)a4 metric:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ATXFocusModeSignalsMetricLogger *)self appScoresForMode:a3];
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    id v33 = v10;
    id v34 = v8;
    v12 = [v10 objectForKeyedSubscript:v8];
    uint64_t v13 = [v12 scoreMetadata];
    v14 = [v13 featureVector];

    id v31 = [[ATXModeEntityScoringFeatures alloc] initFromJSON:v14];
    v32 = v12;
    uint64_t v15 = NSNumber;
    v16 = [v12 scoreMetadata];
    [v16 score];
    uint64_t v17 = objc_msgSend(v15, "numberWithDouble:");
    [v9 setEntityModeEntityScore:v17];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    v18 = [(ATXFocusModeSignalsMetricLogger *)self metricFieldsToFeatureNames];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * v22);
          uint64_t v24 = [(ATXFocusModeSignalsMetricLogger *)self metricFieldsToFeatureNames];
          v25 = [v24 objectForKeyedSubscript:v23];

          if (v25)
          {
            v26 = [v14 objectForKeyedSubscript:v25];

            if (v26)
            {
              v27 = [v14 objectForKeyedSubscript:v25];
              [v9 setValue:v27 forKey:v23];
            }
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v20);
    }

    [(ATXFocusModeSignalsMetricLogger *)self addAppEntitySpecificFeatures:v31 toMetric:v9];
    v28 = NSNumber;
    globalInterruptingAppModel = self->_globalInterruptingAppModel;
    [(ATXModeAffinityModelsConstants *)self->_modeAffinityModelsConstants scalingFactorForModeGlobalPriors];
    id v8 = v34;
    -[ATXGlobalInterruptingAppModel scoreForBundleId:scalingFactor:](globalInterruptingAppModel, "scoreForBundleId:scalingFactor:", v34);
    v30 = objc_msgSend(v28, "numberWithDouble:");
    [v9 setGlobalInterruptingPrior:v30];

    uint64_t v10 = v33;
  }
}

- (void)populateAppModeDenyListSignalsForMode:(unint64_t)a3 bundleId:(id)a4 metric:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(ATXFocusModeSignalsMetricLogger *)self appScoresForDenyListForMode:a3];
  uint64_t v11 = [v10 objectForKeyedSubscript:v8];

  if (v11)
  {
    unint64_t v33 = a3;
    id v34 = v10;
    id v35 = v8;
    v12 = [v10 objectForKeyedSubscript:v8];
    uint64_t v13 = [v12 scoreMetadata];
    v14 = [v13 featureVector];

    id v31 = [[ATXModeEntityScoringFeatures alloc] initFromJSON:v14];
    v32 = v12;
    uint64_t v15 = NSNumber;
    v16 = [v12 scoreMetadata];
    [v16 score];
    uint64_t v17 = objc_msgSend(v15, "numberWithDouble:");
    [v9 setEntityModeEntityScore:v17];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v18 = [(ATXFocusModeSignalsMetricLogger *)self metricFieldsToFeatureNames];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * v22);
          uint64_t v24 = [(ATXFocusModeSignalsMetricLogger *)self metricFieldsToFeatureNames];
          v25 = [v24 objectForKeyedSubscript:v23];

          if (v25)
          {
            v26 = [v14 objectForKeyedSubscript:v25];

            if (v26)
            {
              v27 = [v14 objectForKeyedSubscript:v25];
              [v9 setValue:v27 forKey:v23];
            }
          }

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v20);
    }

    [(ATXFocusModeSignalsMetricLogger *)self addAppEntitySpecificFeatures:v31 toMetric:v9];
    v28 = NSNumber;
    globalAppModeAffinityModel = self->_globalAppModeAffinityModel;
    [(ATXModeAffinityModelsConstants *)self->_modeAffinityModelsConstants scalingFactorForModeGlobalPriors];
    id v8 = v35;
    -[ATXGlobalAppModeAffinityModel scoreForMode:bundleId:scalingFactor:](globalAppModeAffinityModel, "scoreForMode:bundleId:scalingFactor:", v33, v35);
    v30 = objc_msgSend(v28, "numberWithDouble:");
    [v9 setGlobalModeAffinityPrior:v30];

    uint64_t v10 = v34;
  }
}

- (void)addAppEntitySpecificFeatures:(id)a3 toMetric:(id)a4
{
  modeAffinityModelsConstants = self->_modeAffinityModelsConstants;
  id v7 = a4;
  id v8 = a3;
  objc_msgSend(v7, "setEntityOccurredGloballyOverLastNDays:", objc_msgSend(v8, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  objc_msgSend(v7, "setEntityOccurredInModeOverLastNDays:", objc_msgSend(v8, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  id v29 = [v8 entitySpecificFeatures];

  id v9 = objc_msgSend(v29, "appCategoryScore_v2");
  [v7 setCategoryScore:v9];

  uint64_t v10 = [v29 globalInterruptingPrior];
  [v7 setGlobalInterruptingPrior:v10];

  uint64_t v11 = [v29 modeAppInterruptionsCountByEntity];
  [v7 setModeAppInterruptionsCountByEntity:v11];

  v12 = [v29 globalAppInterruptionsCountByEntity];
  [v7 setGlobalAppInterruptionsCountByEntity:v12];

  uint64_t v13 = [v29 modePopularityOfInterruptingEntity];
  [v7 setModePopularityOfInterruptingEntity:v13];

  v14 = [v29 globalPopularityOfInterruptingEntity];
  [v7 setGlobalPopularityOfInterruptingEntity:v14];

  uint64_t v15 = [v29 ratioOfModePopularityToGlobalPopularityOfInterruptingEntity];
  [v7 setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:v15];

  v16 = [v29 modeAppInterruptionsClassConditionalProbabilityByEntity];
  [v7 setModeAppInterruptionsClassConditionalProbabilityByEntity:v16];

  uint64_t v17 = [v29 modeCountOfNotificationsClearedForEntity];
  [v7 setNotificationsClearedInMode:v17];

  v18 = [v29 globalCountOfNotificationsClearedForEntity];
  [v7 setNotificationsClearedGlobally:v18];

  uint64_t v19 = [v29 localNotificationsClearedRateForEntity];
  [v7 setLocalClearanceRateForEntity:v19];

  uint64_t v20 = [v29 globalNotificationsClearedRateForEntity];
  [v7 setGlobalClearanceRateForEntity:v20];

  uint64_t v21 = [v29 ratioOfLocalToGlobalNotificationsClearedRateForEntity];
  [v7 setRatioOfLocalToGlobalNotificationsClearedRateForEntity:v21];

  uint64_t v22 = [v29 classConditionalOfNotificationsClearedForEntity];
  [v7 setClassConditionalOfNotificationsClearedForEntity:v22];

  uint64_t v23 = [v29 globalCountOfNotificationsReceivedForEntity];
  [v7 setNotificationsReceivedGlobally:v23];

  uint64_t v24 = [v29 modeCountOfNotificationsReceivedForEntity];
  [v7 setNotificationsReceivedInMode:v24];

  v25 = [v29 localPopularityOfNotificationsReceivedForEntity];
  [v7 setLocalPopularityOfNotificationsReceivedForEntity:v25];

  v26 = [v29 globalPopularityOfNotificationsReceivedForEntity];
  [v7 setGlobalPopularityOfNotificationsReceivedForEntity:v26];

  v27 = [v29 ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity];
  [v7 setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:v27];

  v28 = [v29 classConditionalOfNotificationsReceivedForEntity];
  [v7 setClassConditionalOfNotificationsReceivedForEntity:v28];
}

- (id)fetchRelevantBundleIdsWithModeConfigurationUIFlowLoggingEvent:(id)a3 suggestedEntities:(id)a4 candidateEntities:(id)a5 currentEntities:(id)a6
{
  id v9 = (void *)MEMORY[0x1E4F1CAD0];
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [a3 previousEntityIdentifiers];
  v14 = [v9 setWithArray:v13];

  uint64_t v15 = [v12 setByAddingObjectsFromSet:v11];

  v16 = [v10 setByAddingObjectsFromSet:v15];
  uint64_t v17 = (void *)[v16 mutableCopy];

  [v17 minusSet:v14];
  v18 = (void *)[v14 mutableCopy];
  [v18 minusSet:v10];

  uint64_t v19 = [v18 allObjects];
  [v17 addObjectsFromArray:v19];

  return v17;
}

- (id)metricFieldsToFeatureNames
{
  return &unk_1F27F3BA0;
}

- (id)appScoresForMode:(unint64_t)a3
{
  cachedAppScores = self->_cachedAppScores;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)cachedAppScores objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_cachedAppScores;
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v9 = [[ATXAppModeModel alloc] initWithMode:a3 modeEntityStore:self->_modeEntityStore globalAppModeAffinityModel:self->_globalAppModeAffinityModel];
    id v11 = [(ATXAppModeModel *)v9 scoredEntities];
    id v12 = self->_cachedAppScores;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    v14 = self->_cachedAppScores;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
  }
  return v10;
}

- (id)appScoresForDenyListForMode:(unint64_t)a3
{
  cachedAppScoresForDenyList = self->_cachedAppScoresForDenyList;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)cachedAppScoresForDenyList objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_cachedAppScoresForDenyList;
    id v9 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    id v9 = [[ATXAppModeDenyListModel alloc] initWithMode:a3 modeEntityStore:self->_modeEntityStore globalInterruptingAppModel:self->_globalInterruptingAppModel];
    id v11 = [(ATXAppModeDenyListModel *)v9 scoredEntities];
    id v12 = self->_cachedAppScoresForDenyList;
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v12 setObject:v11 forKeyedSubscript:v13];

    v14 = self->_cachedAppScoresForDenyList;
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a3];
    id v10 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:v15];
  }
  return v10;
}

- (void)logFocusModeWidgetSignalsWithXPCActivity:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = allModesForTraining();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1D25F6CC0]();
        unint64_t v11 = [v9 integerValue];
        if (v11 > 0xD || ((1 << v11) & 0x3010) == 0)
        {
          unint64_t v13 = v11;
          v14 = [(ATXFocusModeSignalsMetricLogger *)self widgetScoresForMode:v11];
          unint64_t v15 = [(ATXFocusModeSignalsMetricLogger *)self logWidgetSignalsForMode:v13 modeAffinitySignals:v14 entitiesLogged:v6];
          if (v15 > 0x13 || (unint64_t v6 = v15, [v17 didDefer]))
          {

            goto LABEL_18;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_18:
}

- (unint64_t)logWidgetSignalsForMode:(unint64_t)a3 modeAffinitySignals:(id)a4 entitiesLogged:(unint64_t)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v6 = a4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v46;
    uint64_t v40 = *(void *)v46;
    do
    {
      uint64_t v10 = 0;
      uint64_t v41 = v8;
      do
      {
        if (*(void *)v46 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * v10);
        id v12 = [v6 objectForKeyedSubscript:v11];
        uint64_t v13 = [v12 scoreMetadata];
        if (v13)
        {
          v14 = (void *)v13;
          unint64_t v15 = [v6 objectForKeyedSubscript:v11];
          v16 = [v15 scoreMetadata];
          [v16 score];
          double v18 = v17;

          if (v18 > 0.0)
          {
            uint64_t v44 = [v6 objectForKeyedSubscript:v11];
            long long v19 = [v44 widget];
            long long v20 = objc_opt_new();
            [v20 setFocusMode:a3];
            long long v21 = [v19 extensionIdentity];
            uint64_t v22 = [v21 containerBundleIdentifier];
            [v20 setAppBundleId:v22];

            id v23 = [NSString alloc];
            uint64_t v24 = [v19 extensionIdentity];
            v25 = [v24 extensionBundleIdentifier];
            v26 = [v19 kind];
            v27 = (void *)[v23 initWithFormat:@"%@:%@", v25, v26];
            [v20 setWidgetBundleIdAndKind:v27];

            [v19 family];
            v28 = NSStringFromWidgetFamily();
            [v20 setWidgetSize:v28];

            id v29 = [v19 intentReference];
            v30 = [v29 intent];

            if (v30)
            {
              id v31 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v30, "_indexingHash"));
              [v20 setIntentHash:v31];
            }
            [(ATXFocusModeSignalsMetricLogger *)self populateWidgetModeAffinitySignalsForMode:a3 metric:v20 modeEntity:v44];
            v32 = __atxlog_handle_modes();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              unint64_t v33 = objc_opt_class();
              id v39 = v33;
              NSStringFromSelector(a2);
              id v35 = v34 = a5;
              long long v36 = [v20 coreAnalyticsDictionary];
              *(_DWORD *)buf = 138412802;
              v50 = v33;
              __int16 v51 = 2112;
              long long v52 = v35;
              __int16 v53 = 2112;
              long long v54 = v36;
              _os_log_impl(&dword_1D0FA3000, v32, OS_LOG_TYPE_INFO, "[%@][%@] Logging: %@", buf, 0x20u);

              a5 = v34;
            }

            [v20 logToCoreAnalytics];
            ++a5;

            uint64_t v9 = v40;
            uint64_t v8 = v41;
            if (a5 > 0x13) {
              goto LABEL_17;
            }
          }
        }
        else
        {
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v8);
  }
LABEL_17:

  return a5;
}

- (void)populateWidgetModeAffinitySignalsForMode:(unint64_t)a3 metric:(id)a4 modeEntity:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [v8 scoreMetadata];
    [v11 score];
    id v12 = objc_msgSend(v10, "numberWithDouble:");
    [v7 setEntityModeEntityScore:v12];

    v25 = v9;
    uint64_t v13 = [v9 scoreMetadata];
    v14 = [v13 featureVector];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    unint64_t v15 = [(ATXFocusModeSignalsMetricLogger *)self metricFieldsToFeatureNames];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8 * v19);
          long long v21 = [(ATXFocusModeSignalsMetricLogger *)self metricFieldsToFeatureNames];
          uint64_t v22 = [v21 objectForKeyedSubscript:v20];

          if (v22)
          {
            id v23 = [v14 objectForKeyedSubscript:v22];

            if (v23)
            {
              uint64_t v24 = [v14 objectForKeyedSubscript:v22];
              [v7 setValue:v24 forKey:v20];
            }
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    uint64_t v9 = v25;
  }
}

- (id)widgetScoresForMode:(unint64_t)a3
{
  cachedWidgetScores = self->_cachedWidgetScores;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v7 = [(NSMutableDictionary *)cachedWidgetScores objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_cachedWidgetScores;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
  }
  else
  {
    uint64_t v9 = [[ATXWidgetModeModel alloc] initWithMode:a3 globalWidgetPopularityModel:self->_globalWidgetPopularityModel];
    uint64_t v11 = [(ATXFocusModeSignalsMetricLogger *)self appScoresForMode:a3];
    id v12 = [(ATXWidgetModeModel *)v9 scoredEntitiesWithScoredAppEntities:v11];
    uint64_t v13 = self->_cachedWidgetScores;
    v14 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    unint64_t v15 = self->_cachedWidgetScores;
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v10 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];
  }
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_globalWidgetPopularityModel, 0);
  objc_storeStrong((id *)&self->_globalInterruptingAppModel, 0);
  objc_storeStrong((id *)&self->_globalAppModeAffinityModel, 0);
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_modeEntityTrialClientWrapper, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
  objc_storeStrong((id *)&self->_cachedWidgetScores, 0);
  objc_storeStrong((id *)&self->_cachedAppScoresForDenyList, 0);
  objc_storeStrong((id *)&self->_cachedAppScores, 0);
}

@end