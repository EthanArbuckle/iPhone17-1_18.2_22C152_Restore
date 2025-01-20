@interface ATXAppModeModel
- (ATXAppModeModel)initWithMode:(unint64_t)a3 modeEntityStore:(id)a4 globalAppModeAffinityModel:(id)a5;
- (double)scoreFromAppFeatures:(id)a3;
- (id)featuresToModel:(id)a3;
- (id)loadAppModeCoreMLModel;
- (id)modelName;
- (id)scoredAppModeEntityWithAppFeatures:(id)a3 bundleId:(id)a4;
- (id)scoredEntities;
- (void)addAppInterruptingSignalsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4;
- (void)addEntitySpecificFeaturesToAppFeatures:(id)a3;
- (void)addGlobalModeAffinityPriorsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4;
- (void)addNotificationsSignalsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4;
- (void)scoredEntities;
@end

@implementation ATXAppModeModel

- (ATXAppModeModel)initWithMode:(unint64_t)a3 modeEntityStore:(id)a4 globalAppModeAffinityModel:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)ATXAppModeModel;
  v11 = [(ATXAppModeModel *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_mode = a3;
    uint64_t v13 = [(ATXAppModeModel *)v11 loadAppModeCoreMLModel];
    appModeModel = v12->_appModeModel;
    v12->_appModeModel = (MLModel *)v13;

    objc_storeStrong((id *)&v12->_modeEntityStore, a4);
    uint64_t v15 = objc_opt_new();
    notificationDatastore = v12->_notificationDatastore;
    v12->_notificationDatastore = (ATXNotificationAndSuggestionDatastore *)v15;

    objc_storeStrong((id *)&v12->_globalAppModeAffinityModel, a5);
    uint64_t v17 = +[ATXModeEntityModelTrainer eventProviderForMode:a3];
    modeEventProvider = v12->_modeEventProvider;
    v12->_modeEventProvider = (ATXModeEntityEventProviderProtocol *)v17;

    uint64_t v19 = objc_opt_new();
    modeAffinityModelsConstants = v12->_modeAffinityModelsConstants;
    v12->_modeAffinityModelsConstants = (ATXModeAffinityModelsConstants *)v19;
  }
  return v12;
}

- (id)scoredEntities
{
  v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v5 = [(ATXGlobalAppModeAffinityModel *)self->_globalAppModeAffinityModel bundleIds];
  v6 = (void *)[v4 initWithSet:v5];

  v7 = objc_opt_new();
  if (self->_modeEventProvider)
  {
    v8 = [ATXModeEntityCorrelator alloc];
    modeEventProvider = self->_modeEventProvider;
    id v10 = objc_opt_new();
    v11 = objc_opt_new();
    v12 = objc_opt_new();
    uint64_t v13 = [(ATXModeEntityCorrelator *)v8 initWithModeEventProvider:modeEventProvider appLaunchEventProvider:v10 macPortableAppEventProvider:v11 macDesktopAppEventProvider:v12];

    v14 = [[ATXAppInterruptionsEventProvider alloc] initWithModeEventProvider:self->_modeEventProvider];
    appInterruptionsEventProvider = self->_appInterruptionsEventProvider;
    self->_appInterruptionsEventProvider = v14;

    if (![(ATXAppInterruptionsEventProvider *)self->_appInterruptionsEventProvider successfullyCalculatedAppSessionInterruptions])
    {
      v16 = __atxlog_handle_modes();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXAppModeModel scoredEntities](v16);
      }
    }
    uint64_t v17 = [[ATXAppNotificationEngagementEventProvider alloc] initWithModeEventProvider:self->_modeEventProvider];
    appNotificationEngagementEventProvider = self->_appNotificationEngagementEventProvider;
    self->_appNotificationEngagementEventProvider = v17;

    if (![(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider successfullyCalculatedNotificationEvents])
    {
      uint64_t v19 = __atxlog_handle_modes();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXAppModeModel scoredEntities](v19);
      }
    }
    v20 = [(ATXModeEntityCorrelator *)v13 entityFeaturesForModeEntityScoring];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __33__ATXAppModeModel_scoredEntities__block_invoke;
    v29[3] = &unk_1E68ABCF0;
    id v30 = v6;
    v31 = self;
    id v32 = v3;
    id v33 = v7;
    [v20 enumerateKeysAndObjectsUsingBlock:v29];
  }
  [v6 minusSet:v7];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __33__ATXAppModeModel_scoredEntities__block_invoke_2;
  v26[3] = &unk_1E68B3ED0;
  v26[4] = self;
  id v21 = v3;
  id v27 = v21;
  v28 = v7;
  id v22 = v7;
  [v6 enumerateObjectsUsingBlock:v26];
  v23 = v28;
  id v24 = v21;

  return v24;
}

void __33__ATXAppModeModel_scoredEntities__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v10])
  {
    v6 = [*(id *)(a1 + 40) scoredAppModeEntityWithAppFeatures:v5 bundleId:v10];
    v7 = *(void **)(a1 + 48);
    v8 = [v5 entity];
    id v9 = [v8 identifier];
    [v7 setObject:v6 forKey:v9];

    [*(id *)(a1 + 56) addObject:v10];
  }
}

void __33__ATXAppModeModel_scoredEntities__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 scoredAppModeEntityWithAppFeatures:0 bundleId:v4];
  [*(id *)(a1 + 40) setObject:v5 forKey:v4];
  [*(id *)(a1 + 48) addObject:v4];
}

- (id)scoredAppModeEntityWithAppFeatures:(id)a3 bundleId:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    id v7 = a4;
    id v6 = (id)objc_opt_new();
    uint64_t v8 = +[ATXSessionTaggingAppEntity genreIdForBundleId:v7];
    id v9 = (void *)v8;
    id v10 = &unk_1F27F2820;
    if (v8) {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    id v12 = objc_alloc(MEMORY[0x1E4F4AED8]);
    v22[0] = v11;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

    v14 = (void *)[v12 initWithBundleId:v7 itunesGenreIds:v13];
    [v6 setEntity:v14];
  }
  [(ATXAppModeModel *)self addEntitySpecificFeaturesToAppFeatures:v6];
  [(ATXAppModeModel *)self scoreFromAppFeatures:v6];
  double v16 = v15;
  uint64_t v17 = objc_opt_new();
  [v17 setScore:v16];
  v18 = [v6 jsonRepresentation];
  [v17 setFeatureVector:v18];

  uint64_t v19 = [v6 entity];
  [v19 setScoreMetadata:v17];

  v20 = [v6 entity];

  return v20;
}

- (void)addEntitySpecificFeaturesToAppFeatures:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    modeEntityStore = self->_modeEntityStore;
    id v37 = v4;
    id v6 = [v4 entity];
    id v7 = [v6 identifier];
    uint64_t v8 = [(ATXModeEntityStore *)modeEntityStore appEntityForBundleId:v7];

    if (v8)
    {
      id v9 = [v8 affinityVector];
      [v9 scoreForMode:self->_mode];
      double v11 = v10;

      id v12 = objc_msgSend(v8, "affinityVector_v2");
      [v12 scoreForMode:self->_mode];
      double v14 = v13;

      double v15 = [v37 entitySpecificFeatures];
      double v16 = v15;
      if (v15) {
        id v17 = v15;
      }
      else {
        id v17 = (id)objc_opt_new();
      }
      v18 = v17;

      uint64_t v19 = [NSNumber numberWithDouble:v11];
      [v18 setAppCategoryScore:v19];

      v20 = [NSNumber numberWithDouble:v14];
      objc_msgSend(v18, "setAppCategoryScore_v2:", v20);

      id v21 = [v37 entity];
      id v22 = [v21 identifier];
      [(ATXAppModeModel *)self addAppInterruptingSignalsForIdentifier:v22 toAppSpecificFeatures:v18];

      v23 = [v37 entity];
      id v24 = [v23 identifier];
      [(ATXAppModeModel *)self addNotificationsSignalsForIdentifier:v24 toAppSpecificFeatures:v18];

      v25 = [v37 entity];
      v26 = [v25 identifier];
      [(ATXAppModeModel *)self addGlobalModeAffinityPriorsForIdentifier:v26 toAppSpecificFeatures:v18];

      notificationDatastore = self->_notificationDatastore;
      v28 = (void *)MEMORY[0x1E4F1C9C8];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      id v30 = [v28 dateWithTimeIntervalSinceReferenceDate:v29 + -1209600.0];
      v31 = [(ATXNotificationAndSuggestionDatastore *)notificationDatastore notificationsReceivedPerBundleIdSinceDate:v30];

      id v32 = [v37 entity];
      id v33 = [v32 identifier];
      uint64_t v34 = [v31 objectForKeyedSubscript:v33];
      v35 = (void *)v34;
      if (v34) {
        v36 = (void *)v34;
      }
      else {
        v36 = &unk_1F27F2820;
      }
      [v18 setNotificationsReceivedInLastTwoWeeks:v36];

      [v37 setEntitySpecificFeatures:v18];
    }

    id v4 = v37;
  }
}

- (void)addGlobalModeAffinityPriorsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4
{
  id v5 = NSNumber;
  globalAppModeAffinityModel = self->_globalAppModeAffinityModel;
  unint64_t mode = self->_mode;
  modeAffinityModelsConstants = self->_modeAffinityModelsConstants;
  id v9 = a4;
  id v10 = a3;
  [(ATXModeAffinityModelsConstants *)modeAffinityModelsConstants scalingFactorForModeGlobalPriors];
  -[ATXGlobalAppModeAffinityModel scoreForMode:bundleId:scalingFactor:](globalAppModeAffinityModel, "scoreForMode:bundleId:scalingFactor:", mode, v10);
  double v12 = v11;

  id v13 = [v5 numberWithDouble:v12];
  [v9 setGlobalModeAffinityPrior:v13];
}

- (void)addAppInterruptingSignalsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4
{
  id v6 = NSNumber;
  appInterruptionsEventProvider = self->_appInterruptionsEventProvider;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[ATXAppInterruptionsEventProvider modeAppInterruptionsCountByEntity:](appInterruptionsEventProvider, "modeAppInterruptionsCountByEntity:", v9));
  [v8 setModeAppInterruptionsCountByEntity:v10];

  double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppInterruptionsEventProvider globalAppInterruptionsCountByEntity:](self->_appInterruptionsEventProvider, "globalAppInterruptionsCountByEntity:", v9));
  [v8 setGlobalAppInterruptionsCountByEntity:v11];

  double v12 = NSNumber;
  [(ATXAppInterruptionsEventProvider *)self->_appInterruptionsEventProvider modePopularityOfInterruptingEntity:v9];
  id v13 = objc_msgSend(v12, "numberWithDouble:");
  [v8 setModePopularityOfInterruptingEntity:v13];

  double v14 = NSNumber;
  [(ATXAppInterruptionsEventProvider *)self->_appInterruptionsEventProvider globalPopularityOfInterruptingEntity:v9];
  double v15 = objc_msgSend(v14, "numberWithDouble:");
  [v8 setGlobalPopularityOfInterruptingEntity:v15];

  double v16 = NSNumber;
  [(ATXAppInterruptionsEventProvider *)self->_appInterruptionsEventProvider modeAppInterruptionsClassConditionalProbabilityByEntity:v9];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  [v8 setModeAppInterruptionsClassConditionalProbabilityByEntity:v17];

  v18 = NSNumber;
  [(ATXAppInterruptionsEventProvider *)self->_appInterruptionsEventProvider ratioOfModePopularityToGlobalPopularityOfInterruptingEntity:v9];
  double v20 = v19;

  id v21 = [v18 numberWithDouble:v20];
  [v8 setRatioOfModePopularityToGlobalPopularityOfInterruptingEntity:v21];
}

- (void)addNotificationsSignalsForIdentifier:(id)a3 toAppSpecificFeatures:(id)a4
{
  id v6 = NSNumber;
  appNotificationEngagementEventProvider = self->_appNotificationEngagementEventProvider;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_msgSend(v6, "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsClearedForBundleId:](appNotificationEngagementEventProvider, "modeCountOfNotificationsClearedForBundleId:", v9));
  [v8 setModeCountOfNotificationsClearedForEntity:v10];

  double v11 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider localNotificationsClearedRateForBundleId:v9];
  double v12 = objc_msgSend(v11, "numberWithDouble:");
  [v8 setLocalNotificationsClearedRateForEntity:v12];

  id v13 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider globalNotificationsClearedRateForBundleId:v9];
  double v14 = objc_msgSend(v13, "numberWithDouble:");
  [v8 setGlobalNotificationsClearedRateForEntity:v14];

  double v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsClearedForBundleId:](self->_appNotificationEngagementEventProvider, "globalCountOfNotificationsClearedForBundleId:", v9));
  [v8 setGlobalCountOfNotificationsClearedForEntity:v15];

  double v16 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider ratioOfLocalToGlobalNotificationsClearedRateForBundleId:v9];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  [v8 setRatioOfLocalToGlobalNotificationsClearedRateForEntity:v17];

  v18 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider classConditionalOfNotificationsClearedForBundleId:v9];
  double v19 = objc_msgSend(v18, "numberWithDouble:");
  [v8 setClassConditionalOfNotificationsClearedForEntity:v19];

  double v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider globalCountOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "globalCountOfNotificationsReceivedForBundleId:", v9));
  [v8 setGlobalCountOfNotificationsReceivedForEntity:v20];

  id v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[ATXAppNotificationEngagementEventProvider modeCountOfNotificationsReceivedForBundleId:](self->_appNotificationEngagementEventProvider, "modeCountOfNotificationsReceivedForBundleId:", v9));
  [v8 setModeCountOfNotificationsReceivedForEntity:v21];

  id v22 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider localPopularityOfNotificationsReceivedForBundleId:v9];
  v23 = objc_msgSend(v22, "numberWithDouble:");
  [v8 setLocalPopularityOfNotificationsReceivedForEntity:v23];

  id v24 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider globalPopularityOfNotificationsReceivedForBundleId:v9];
  v25 = objc_msgSend(v24, "numberWithDouble:");
  [v8 setGlobalPopularityOfNotificationsReceivedForEntity:v25];

  v26 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider ratioOfLocalToGlobalPopularityOfNotificationsReceivedForBundleId:v9];
  id v27 = objc_msgSend(v26, "numberWithDouble:");
  [v8 setRatioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity:v27];

  v28 = NSNumber;
  [(ATXAppNotificationEngagementEventProvider *)self->_appNotificationEngagementEventProvider classConditionalOfNotificationsReceivedForBundleId:v9];
  double v30 = v29;

  id v31 = [v28 numberWithDouble:v30];
  [v8 setClassConditionalOfNotificationsReceivedForEntity:v31];
}

- (id)featuresToModel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 entitySpecificFeatures];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v7 = __atxlog_handle_modes();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[ATXAppModeModel featuresToModel:](v7);
    }
  }
  id v8 = [v4 entitySpecificFeatures];
  v63 = objc_msgSend(v8, "appCategoryScore_v2");
  id v9 = NSNumber;
  [v4 globalPopularity];
  v62 = objc_msgSend(v9, "numberWithDouble:");
  v61 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "globalOccurrences"));
  v60 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "entityOccurredGloballyOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  v59 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "entityOccurredInModeOverLastNDays:", -[ATXModeAffinityModelsConstants numOfDaysToComputeEntityOccurenceFeatures](self->_modeAffinityModelsConstants, "numOfDaysToComputeEntityOccurenceFeatures")));
  id v10 = NSNumber;
  [v4 ratioModeAndGlobalPopularity];
  v57 = objc_msgSend(v10, "numberWithDouble:");
  v58 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "localOccurrences"));
  v56 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "uniqueOccurrencesInMode"));
  double v11 = NSNumber;
  double v12 = (double)(unint64_t)[v4 localOccurrences];
  id v13 = [v8 globalModeAffinityPrior];
  [v13 doubleValue];
  double v15 = v14 + v12;
  double v16 = (double)(unint64_t)[v4 globalOccurrences];
  [(ATXModeAffinityModelsConstants *)self->_modeAffinityModelsConstants scalingFactorForModeGlobalPriors];
  v45 = [v11 numberWithDouble:v15 / (v17 + v16 + 0.00000001)];

  v18 = NSNumber;
  double v19 = (double)(unint64_t)[v4 uniqueOccurrencesInMode];
  double v20 = [v8 globalModeAffinityPrior];
  [v20 doubleValue];
  double v22 = v21 + v19;
  double v23 = (double)(unint64_t)[v4 modeOccurrences];
  [(ATXModeAffinityModelsConstants *)self->_modeAffinityModelsConstants scalingFactorForModeGlobalPriors];
  v43 = [v18 numberWithDouble:v22 / (v24 + v23 + 0.00000001)];

  v25 = NSNumber;
  double v26 = (double)(unint64_t)[v4 localOccurrences];
  id v27 = [v8 globalModeAffinityPrior];
  [v27 doubleValue];
  double v29 = v28 + v26;
  unint64_t v30 = [v4 localOccurrencesAcrossAllEntities];

  [(ATXModeAffinityModelsConstants *)self->_modeAffinityModelsConstants scalingFactorForModeGlobalPriors];
  v44 = [v25 numberWithDouble:v29 / (v31 + (double)v30 + 0.00000001)];

  v55 = [v8 globalModeAffinityPrior];
  v54 = [v8 modeAppInterruptionsCountByEntity];
  v53 = [v8 globalAppInterruptionsCountByEntity];
  v52 = [v8 modePopularityOfInterruptingEntity];
  v38 = [v8 globalPopularityOfInterruptingEntity];
  v51 = [v8 modeAppInterruptionsClassConditionalProbabilityByEntity];
  v50 = [v8 ratioOfModePopularityToGlobalPopularityOfInterruptingEntity];
  v49 = [v8 globalCountOfNotificationsReceivedForEntity];
  v48 = [v8 modeCountOfNotificationsReceivedForEntity];
  v47 = [v8 localPopularityOfNotificationsReceivedForEntity];
  v46 = [v8 globalPopularityOfNotificationsReceivedForEntity];
  id v32 = [v8 ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity];
  id v33 = [v8 classConditionalOfNotificationsReceivedForEntity];
  uint64_t v34 = [v8 modeCountOfNotificationsClearedForEntity];
  v39 = [v8 localNotificationsClearedRateForEntity];
  v35 = [v8 globalNotificationsClearedRateForEntity];
  v40 = [v8 globalCountOfNotificationsClearedForEntity];
  v41 = [v8 ratioOfLocalToGlobalNotificationsClearedRateForEntity];
  v42 = [v8 classConditionalOfNotificationsClearedForEntity];
  v36 = objc_opt_new();
  [v36 setObject:v60 forKey:@"entityOccurredGloballyOverTheLastNDays"];
  [v36 setObject:v59 forKey:@"entityOccurredInModeOverLastNDays"];
  [v36 setObject:v63 forKey:@"appCategoryScore"];
  [v36 setObject:v45 forKey:@"classConditionalProbabilityOfModeGivenEntity"];
  [v36 setObject:v61 forKey:@"globalOccurrencesOfEntity"];
  [v36 setObject:v62 forKey:@"globalPopularityForEntity"];
  [v36 setObject:v58 forKey:@"localOccurrencesOfEntityInMode"];
  [v36 setObject:v44 forKey:@"modePopularityForEntity"];
  [v36 setObject:v43 forKey:@"posteriorProbabilityOfEntityGivenMode"];
  [v36 setObject:v57 forKey:@"ratioOfModePopularityToGlobalPopularityOfEntity"];
  [v36 setObject:v56 forKey:@"uniqueOccurrencesOfEntityInMode"];
  [v36 setObject:v55 forKey:@"globalModeAffinityPrior"];
  [v36 setObject:v54 forKey:@"modeAppInterruptionsCountByEntity"];
  [v36 setObject:v53 forKey:@"globalAppInterruptionsCountByEntity"];
  [v36 setObject:v52 forKey:@"modePopularityOfInterruptingEntity"];
  [v36 setObject:v38 forKey:@"globalPopularityOfInterruptingEntity"];
  [v36 setObject:v51 forKey:@"modeAppInterruptionsClassConditionalProbabilityByEntity"];
  [v36 setObject:v50 forKey:@"ratioOfModePopularityToGlobalPopularityOfInterruptingEntity"];
  [v36 setObject:v49 forKey:@"globalCountOfNotificationsReceivedForEntity"];
  [v36 setObject:v48 forKey:@"modeCountOfNotificationsReceivedForEntity"];
  [v36 setObject:v47 forKey:@"localPopularityOfNotificationsReceivedForEntity"];
  [v36 setObject:v46 forKey:@"globalPopularityOfNotificationsReceivedForEntity"];
  [v36 setObject:v32 forKey:@"ratioOfLocalToGlobalPopularityOfNotificationsReceivedForEntity"];
  [v36 setObject:v33 forKey:@"classConditionalOfNotificationsReceivedForEntity"];
  [v36 setObject:v34 forKey:@"modeCountOfNotificationsClearedForEntity"];
  [v36 setObject:v39 forKey:@"localNotificationsClearedRateForEntity"];
  [v36 setObject:v35 forKey:@"globalNotificationsClearedRateForEntity"];
  [v36 setObject:v40 forKey:@"globalCountOfNotificationsClearedForEntity"];
  [v36 setObject:v41 forKey:@"ratioOfLocalToGlobalNotificationsClearedRateForEntity"];
  [v36 setObject:v42 forKey:@"classConditionalOfNotificationsClearedForEntity"];

  return v36;
}

- (id)modelName
{
  return @"ATXAppModeAllowListModel";
}

- (id)loadAppModeCoreMLModel
{
  v3 = objc_opt_new();
  id v4 = [(ATXAppModeModel *)self modelName];
  id v5 = [v3 loadCoreMLModelFromTrialWithName:v4];

  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v7 = [(ATXAppModeModel *)self modelName];
    id v6 = +[ATXCoreMLUtilities loadCoreMLModelWithName:v7];
  }
  return v6;
}

- (double)scoreFromAppFeatures:(id)a3
{
  id v4 = a3;
  if (self->_appModeModel)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1E930]);
    id v6 = [(ATXAppModeModel *)self featuresToModel:v4];
    id v19 = 0;
    id v7 = (void *)[v5 initWithDictionary:v6 error:&v19];
    id v8 = v19;

    if (v8)
    {
      id v9 = __atxlog_handle_modes();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[ATXAppModeModel scoreFromAppFeatures:]((uint64_t)v8, v9);
      }
    }
    appModeModel = self->_appModeModel;
    id v18 = v8;
    double v11 = [(MLModel *)appModeModel predictionFromFeatures:v7 error:&v18];
    id v12 = v18;

    if (v12)
    {
      id v13 = __atxlog_handle_modes();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ATXAppModeModel scoreFromAppFeatures:]((uint64_t)v12, v13);
      }
    }
    double v14 = [v11 featureValueForName:@"classProbability"];
    +[ATXCoreMLUtilities scoreForModelOutputValue:v14 outputIndexedSubscript:1];
    double v16 = v15;
    if ((unint64_t)[v4 uniqueOccurrencesInMode] < 2) {
      double v16 = v16 * 0.5;
    }
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeAffinityModelsConstants, 0);
  objc_storeStrong((id *)&self->_modeEventProvider, 0);
  objc_storeStrong((id *)&self->_appInterruptionsEventProvider, 0);
  objc_storeStrong((id *)&self->_appNotificationEngagementEventProvider, 0);
  objc_storeStrong((id *)&self->_notificationDatastore, 0);
  objc_storeStrong((id *)&self->_globalAppModeAffinityModel, 0);
  objc_storeStrong((id *)&self->_modeEntityStore, 0);
  objc_storeStrong((id *)&self->_appModeModel, 0);
}

- (void)scoredEntities
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXAppModeModel: There was an error in calculating app session interruptions from ATXAppInterruptionsEventProvider", v1, 2u);
}

- (void)featuresToModel:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "appFeatures.entitySpecificFeatures is not a sublass for ATXAppEntityFeatures", v1, 2u);
}

- (void)scoreFromAppFeatures:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXAppModeModel - Error during inference on the CoreMLModel: %@", (uint8_t *)&v2, 0xCu);
}

- (void)scoreFromAppFeatures:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXAppModeModel - Error initializing MLDictionaryFeatureProvider for inference on the CoreMLModel: %@", (uint8_t *)&v2, 0xCu);
}

@end