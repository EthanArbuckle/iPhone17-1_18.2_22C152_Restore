@interface ATXAnchorModelOfflineDataHarvester
+ (id)actionIdentifiersFromActionsInMessage:(id)a3;
+ (id)bundleIdsFromAppLaunchesInMessage:(id)a3;
+ (id)getSamplingGroupForDataCollection;
+ (id)getUserUUIDForDataCollection;
+ (void)resetSamplingGroupAssignmentForUser;
- (ATXAnchorModelOfflineDataHarvester)init;
- (ATXAnchorModelOfflineDataHarvester)initWithSamplingGroup:(id)a3 userId:(id)a4;
- (id)allInstalledAppsKnownToSpringBoard;
- (id)fetchAnchorEvents:(id)a3;
- (id)fetchEventsAfterAnchorOccurrenceDate:(id)a3 withDuetDataProviderClass:(Class)a4 limit:(unint64_t)a5 maxSecondsBeforeAnchor:(int64_t)a6 maxSecondsAfterAnchor:(int64_t)a7;
- (id)processAnchorOccurrence:(id)a3 anchor:(id)a4;
- (void)addActionEventsFromAnchorOccurrenceDate:(id)a3 toMessage:(id)a4;
- (void)addAppLaunchEventsFromAnchorOccurrenceDate:(id)a3 toMessage:(id)a4;
- (void)addNegativeSamplesForAnchorOccurrenceDate:(id)a3 toMessage:(id)a4;
- (void)harvestData;
- (void)harvestDataForAnchor:(id)a3;
- (void)setNegativeActionSamplesForAnchorOccurrenceDate:(id)a3 mainMessage:(id)a4;
- (void)setNegativeAppLaunchSamplesForAnchorOccurrenceDate:(id)a3 mainMessage:(id)a4;
@end

@implementation ATXAnchorModelOfflineDataHarvester

- (ATXAnchorModelOfflineDataHarvester)init
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = __atxlog_handle_default();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1D0FA3000, v3, OS_LOG_TYPE_DEFAULT, "ATXAnchorModelOfflineDataHarvester is being initialized.", (uint8_t *)&v10, 2u);
  }

  v4 = [(id)objc_opt_class() getUserUUIDForDataCollection];
  if (v4)
  {
    v5 = [(id)objc_opt_class() getSamplingGroupForDataCollection];
    if (v5)
    {
      v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [v5 description];
        int v10 = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "AnchorModel: User is enrolled in Anchor Model data collection. Sampling group description: %@", (uint8_t *)&v10, 0xCu);
      }
      self = [(ATXAnchorModelOfflineDataHarvester *)self initWithSamplingGroup:v5 userId:v4];
      v8 = self;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)getUserUUIDForDataCollection
{
  v2 = +[ATXEnrollmentManager getUserIdForScheme:@"com.apple.duetexpertd.anchormodel.dataharvester.enrollmentmanager" enrollmentPeriod:7776000.0 enrollmentRate:0.1];
  if ([v2 length]) {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else {
    v3 = 0;
  }

  return v3;
}

+ (id)getSamplingGroupForDataCollection
{
  return +[ATXAnchorModelSamplingGroup getSamplingGroupForDataCollection];
}

+ (void)resetSamplingGroupAssignmentForUser
{
}

- (ATXAnchorModelOfflineDataHarvester)initWithSamplingGroup:(id)a3 userId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"ATXAnchorModelOfflineDataHarvester.m", 104, @"Invalid parameter not satisfying: %@", @"samplingGroup" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)ATXAnchorModelOfflineDataHarvester;
  v9 = [(ATXAnchorModelOfflineDataHarvester *)&v18 init];
  if (v9)
  {
    uint64_t v10 = [v7 anchorWhitelist];
    anchorsToCollect = v9->_anchorsToCollect;
    v9->_anchorsToCollect = (NSArray *)v10;

    uint64_t v12 = objc_opt_new();
    eventFeaturizer = v9->_eventFeaturizer;
    v9->_eventFeaturizer = (ATXAnchorModelEventFeaturizer *)v12;

    uint64_t v14 = objc_opt_new();
    harvester = v9->_harvester;
    v9->_harvester = (ATXAnchorModelEventHarvester *)v14;

    objc_storeStrong((id *)&v9->_userId, a4);
  }

  return v9;
}

- (void)harvestData
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = (void *)os_transaction_create();
  userId = self->_userId;
  v5 = __atxlog_handle_default();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (userId)
  {
    v17 = v3;
    if (v6)
    {
      NSUInteger v7 = [(NSArray *)self->_anchorsToCollect count];
      *(_DWORD *)buf = 134217984;
      NSUInteger v24 = v7;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "AnchorModel: User is enrolled in Anchor Model data collection. Beginning collection of %lu different types of anchors. [START HARVESTING DATA]", buf, 0xCu);
    }

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = self->_anchorsToCollect;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          NSUInteger v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v14 = (void *)MEMORY[0x1D25F6CC0]();
          v15 = __atxlog_handle_default();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            NSUInteger v24 = v13;
            _os_log_impl(&dword_1D0FA3000, v15, OS_LOG_TYPE_DEFAULT, "AnchorModel: Harvesting data on %@ anchor.", buf, 0xCu);
          }

          [(ATXAnchorModelOfflineDataHarvester *)self harvestDataForAnchor:v13];
        }
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v5 = __atxlog_handle_default();
    v3 = v17;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "AnchorModel: Finished harvesting data. [DONE HARVESTING DATA]";
LABEL_17:
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    v16 = "AnchorModel: User is not enrolled in Anchor Model data collection. Exiting early.";
    goto LABEL_17;
  }
}

- (void)harvestDataForAnchor:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ATXAnchorModelOfflineDataHarvester *)self fetchAnchorEvents:v4];
  BOOL v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = [v5 count];
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "AnchorModel: Found %lu anchor events.", buf, 0xCu);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * v11);
        NSUInteger v13 = __atxlog_handle_default();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v23 = v12;
          _os_log_debug_impl(&dword_1D0FA3000, v13, OS_LOG_TYPE_DEBUG, "AnchorModel: Anchor description: %@", buf, 0xCu);
        }

        uint64_t v14 = [(ATXAnchorModelOfflineDataHarvester *)self processAnchorOccurrence:v12 anchor:v4];
        +[ATXAnchorModelDataAnonymizer anonymizeMessage:v14];
        v15 = [MEMORY[0x1E4F93728] sharedInstance];
        [v15 logMessage:v14];

        v16 = __atxlog_handle_default();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0FA3000, v16, OS_LOG_TYPE_INFO, "AnchorModel: Logged message with PET2.", buf, 2u);
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }
}

- (id)fetchAnchorEvents:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  id v4 = a3;
  v5 = [v3 date];
  BOOL v6 = objc_opt_class();

  id v7 = [v5 dateByAddingTimeInterval:-115200.0];
  uint64_t v8 = [v5 dateByAddingTimeInterval:-7200.0];
  uint64_t v9 = [v6 fetchAnchorOccurrencesBetweenStartDate:v7 endDate:v8];

  return v9;
}

- (id)processAnchorOccurrence:(id)a3 anchor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = [(NSUUID *)self->_userId UUIDString];
  [v8 setUserId:v9];

  uint64_t v10 = [(ATXAnchorModelEventFeaturizer *)self->_eventFeaturizer featurizeAnchorEvent:v7 anchor:v6];
  [v8 setAnchor:v10];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = [v11 anchorOccurenceDateFromDuetEvent:v7];

  [(ATXAnchorModelOfflineDataHarvester *)self addAppLaunchEventsFromAnchorOccurrenceDate:v12 toMessage:v8];
  [(ATXAnchorModelOfflineDataHarvester *)self addActionEventsFromAnchorOccurrenceDate:v12 toMessage:v8];
  [(ATXAnchorModelOfflineDataHarvester *)self addNegativeSamplesForAnchorOccurrenceDate:v12 toMessage:v8];

  return v8;
}

- (void)addAppLaunchEventsFromAnchorOccurrenceDate:(id)a3 toMessage:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXAnchorModelOfflineDataHarvester *)self fetchEventsAfterAnchorOccurrenceDate:v6 withDuetDataProviderClass:objc_opt_class() limit:100 maxSecondsBeforeAnchor:300 maxSecondsAfterAnchor:5400];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = -[ATXAnchorModelEventFeaturizer featurizeAppLaunchEvents:anchorOccurrenceDate:](self->_eventFeaturizer, "featurizeAppLaunchEvents:anchorOccurrenceDate:", v8, v6, 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [v7 addPositiveAppLaunches:*(void *)(*((void *)&v14 + 1) + 8 * v13++)];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)addActionEventsFromAnchorOccurrenceDate:(id)a3 toMessage:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXAnchorModelOfflineDataHarvester *)self fetchEventsAfterAnchorOccurrenceDate:v6 withDuetDataProviderClass:objc_opt_class() limit:100 maxSecondsBeforeAnchor:300 maxSecondsAfterAnchor:5400];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [(ATXAnchorModelEventFeaturizer *)self->_eventFeaturizer featurizeActionEvent:*(void *)(*((void *)&v14 + 1) + 8 * v12) anchorOccurrenceDate:v6];
        [v7 addPositiveActions:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (void)addNegativeSamplesForAnchorOccurrenceDate:(id)a3 toMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ATXAnchorModelOfflineDataHarvester *)self setNegativeAppLaunchSamplesForAnchorOccurrenceDate:v7 mainMessage:v6];
  [(ATXAnchorModelOfflineDataHarvester *)self setNegativeActionSamplesForAnchorOccurrenceDate:v7 mainMessage:v6];
}

- (id)fetchEventsAfterAnchorOccurrenceDate:(id)a3 withDuetDataProviderClass:(Class)a4 limit:(unint64_t)a5 maxSecondsBeforeAnchor:(int64_t)a6 maxSecondsAfterAnchor:(int64_t)a7
{
  return [(ATXAnchorModelEventHarvester *)self->_harvester fetchEventsAfterAnchorOccurrenceDate:a3 withDuetDataProviderClass:a4 limit:a5 maxSecondsBeforeAnchor:a6 maxSecondsAfterAnchor:a7 predicates:0];
}

- (id)allInstalledAppsKnownToSpringBoard
{
  v2 = +[_ATXAppIconState sharedInstance];
  id v3 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = [v2 allInstalledAppsKnownToSpringBoard];
  v5 = (void *)[v3 initWithArray:v4];

  return v5;
}

- (void)setNegativeAppLaunchSamplesForAnchorOccurrenceDate:(id)a3 mainMessage:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ATXAnchorModelOfflineDataHarvester *)self allInstalledAppsKnownToSpringBoard];
  uint64_t v9 = +[ATXAnchorModelOfflineDataHarvester bundleIdsFromAppLaunchesInMessage:v7];
  uint64_t v10 = +[ATXAnchorModelEventHarvester negativeAppsGivenAllAppIds:v8 positiveAppIds:v9];

  uint64_t v24 = v10;
  uint64_t v23 = [v10 allObjects];
  +[ATXAnchorModelEventHarvester randomSampleFromArray:sampleSize:](ATXAnchorModelEventHarvester, "randomSampleFromArray:sampleSize:");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v27;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * v14);
        long long v16 = [ATXAppLaunchDuetEvent alloc];
        long long v17 = [v6 dateByAddingTimeInterval:1.0];
        long long v18 = [(ATXAppLaunchDuetEvent *)v16 initWithBundleId:v15 startDate:v6 endDate:v17];

        eventFeaturizer = self->_eventFeaturizer;
        v30 = v18;
        long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
        long long v21 = [(ATXAnchorModelEventFeaturizer *)eventFeaturizer featurizeAppLaunchEvents:v20 anchorOccurrenceDate:v6];
        v22 = [v21 objectAtIndexedSubscript:0];
        [v7 addNegativeAppLaunches:v22];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v12);
  }
}

- (void)setNegativeActionSamplesForAnchorOccurrenceDate:(id)a3 mainMessage:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[ATXAnchorModelOfflineDataHarvester actionIdentifiersFromActionsInMessage:v7];
  uint64_t v9 = [(ATXAnchorModelEventHarvester *)self->_harvester negativeActionsOnAnchorOccurrenceDate:v6 positiveActionIds:v8];
  uint64_t v10 = +[ATXAnchorModelEventHarvester randomSampleFromArray:v9 sampleSize:7];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [(ATXAnchorModelEventFeaturizer *)self->_eventFeaturizer featurizeActionEvent:*(void *)(*((void *)&v16 + 1) + 8 * v14) anchorOccurrenceDate:v6];
        [v7 addNegativeActions:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

+ (id)bundleIdsFromAppLaunchesInMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v3, "positiveAppLaunches", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v10 hasBundleId])
        {
          uint64_t v11 = [v10 bundleId];
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)actionIdentifiersFromActionsInMessage:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v19 = (id)objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = [v18 positiveActions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v8 hasAppLaunchMetadata])
        {
          uint64_t v9 = [v8 appLaunchMetadata];
          if ([v9 hasBundleId] && objc_msgSend(v8, "hasActionKeyMetadata"))
          {
            uint64_t v10 = [v8 actionKeyMetadata];
            if ([v10 hasActionType])
            {
              uint64_t v11 = [v8 actionUUIDMetadatasCount];

              if (v11 != 1) {
                continue;
              }
              id v12 = [NSString alloc];
              uint64_t v9 = [v8 appLaunchMetadata];
              uint64_t v10 = [v9 bundleId];
              long long v20 = [v8 actionKeyMetadata];
              long long v13 = [v20 actionType];
              long long v14 = [v8 actionUUIDMetadatas];
              long long v15 = [v14 firstObject];
              long long v16 = (void *)[v12 initWithFormat:@"%@:%@:%lld", v10, v13, objc_msgSend(v15, "actionUUID")];
              [v19 addObject:v16];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_harvester, 0);
  objc_storeStrong((id *)&self->_eventFeaturizer, 0);
  objc_storeStrong((id *)&self->_anchorsToCollect, 0);
}

@end