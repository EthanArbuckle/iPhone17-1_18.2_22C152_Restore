@interface ATXNotificationResolutionAccumulator
- (ATXHistoricalResolutonsForNotification)historicalResolutionsForNotification;
- (ATXNotificationResolutionAccumulator)init;
- (id)dateIntervalFromModeEvent:(id)a3;
- (id)dateIntervalFromNotificationEvent:(id)a3;
- (unint64_t)timeToLaunchApp;
- (void)cacheAppLaunchDataFromStartTime:(id)a3 toEndTime:(id)a4;
- (void)computeFeaturesForNotification:(id)a3 mode:(unint64_t)a4;
- (void)computeHistoricalResolutionsIfNecessary;
- (void)computeTimeToLaunchAppForNotification;
- (void)dealloc;
- (void)historicalResolutionForNotification;
- (void)removeOldestEntry;
- (void)unloadHistoricalResolutionsForNotifications;
@end

@implementation ATXNotificationResolutionAccumulator

- (ATXNotificationResolutionAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXNotificationResolutionAccumulator;
  v2 = [(ATXNotificationResolutionAccumulator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F4B640] sharedInstance];
    memoryPressureMonitor = v2->_memoryPressureMonitor;
    v2->_memoryPressureMonitor = (ATXMemoryPressureMonitor *)v3;

    [(ATXMemoryPressureMonitor *)v2->_memoryPressureMonitor registerObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(ATXMemoryPressureMonitor *)self->_memoryPressureMonitor unregisterObserver:self];
  memoryPressureMonitor = self->_memoryPressureMonitor;
  self->_memoryPressureMonitor = 0;

  v4.receiver = self;
  v4.super_class = (Class)ATXNotificationResolutionAccumulator;
  [(ATXNotificationResolutionAccumulator *)&v4 dealloc];
}

- (void)computeFeaturesForNotification:(id)a3 mode:(unint64_t)a4
{
  objc_storeStrong((id *)&self->_userNotification, a3);
  id v7 = a3;
  self->_mode = a4;
  v8 = (void *)MEMORY[0x1E4F1C9C8];
  [v7 timestamp];
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v10 = [(NSDate *)v9 dateByAddingTimeInterval:-1209600.0];
  v11 = [[ATXUnifiedComputedAndInferredModeStream alloc] initWithStartTime:v10 toEndTime:v9];
  v12 = [(ATXUnifiedComputedAndInferredModeStream *)v11 fetchUnifiedModeEvents];
  unifiedModePublisher = self->_unifiedModePublisher;
  self->_unifiedModePublisher = v12;

  v14 = BiomeLibrary();
  v15 = [v14 Notification];
  v16 = [v15 Usage];
  objc_msgSend(v16, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v10, v9, 0, 0, 0);
  v17 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
  notificationPublisher = self->_notificationPublisher;
  self->_notificationPublisher = v17;

  startDate = self->_startDate;
  self->_startDate = v10;
  v20 = v10;

  endDate = self->_endDate;
  self->_endDate = v9;

  [(ATXNotificationResolutionAccumulator *)self computeTimeToLaunchAppForNotification];
  [(ATXNotificationResolutionAccumulator *)self computeHistoricalResolutionsIfNecessary];
}

- (void)computeTimeToLaunchAppForNotification
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(ATXUserNotification *)self->_userNotification timestamp];
  objc_super v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(ATXUserNotification *)self->_userNotification timestamp];
  id v7 = [v5 dateWithTimeIntervalSinceReferenceDate:v6 + 3600.0];
  v8 = BiomeLibrary();
  v9 = [v8 App];
  v10 = [v9 InFocus];
  v11 = objc_msgSend(v10, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v4, v7, 0, 0, 0);

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_44;
  v14[3] = &unk_1E68AC778;
  v14[4] = self;
  id v12 = v4;
  id v15 = v12;
  v16 = &v17;
  id v13 = (id)[v11 sinkWithCompletion:&__block_literal_global_18 shouldContinue:v14];
  self->_timeToLaunchApp = v18[3];

  _Block_object_dispose(&v17, 8);
}

void __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 error];

  if (v3)
  {
    objc_super v4 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_cold_1(v2);
    }
  }
}

uint64_t __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_44(void *a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 eventBody];
  v5 = [v4 bundleID];
  double v6 = [*(id *)(a1[4] + 8) bundleID];
  int v7 = [v5 isEqualToString:v6];

  if (v7
    && ([v3 eventBody],
        v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 starting],
        v8,
        v9))
  {
    v10 = [v3 eventBody];
    v11 = [v10 absoluteTimestamp];
    [v11 timeIntervalSinceDate:a1[5]];
    double v13 = v12;

    uint64_t v14 = 0;
    double v15 = v13 / 10.0;
    if (v13 < 0.0) {
      double v15 = 0.0;
    }
    *(void *)(*(void *)(a1[6] + 8) + 24) = (unint64_t)(ceil(v15) * 10.0);
  }
  else
  {
    uint64_t v14 = 1;
  }

  return v14;
}

- (void)computeHistoricalResolutionsIfNecessary
{
  obj = self;
  objc_sync_enter(obj);
  id v2 = obj;
  cachedHistoricalResolutionsForNotifications = obj->_cachedHistoricalResolutionsForNotifications;
  if (!cachedHistoricalResolutionsForNotifications)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
    v5 = obj->_cachedHistoricalResolutionsForNotifications;
    obj->_cachedHistoricalResolutionsForNotifications = (NSMutableDictionary *)v4;

    id v2 = obj;
    cachedHistoricalResolutionsForNotifications = obj->_cachedHistoricalResolutionsForNotifications;
  }
  double v6 = [(ATXUserNotification *)v2->_userNotification bundleID];
  int v7 = [(NSMutableDictionary *)cachedHistoricalResolutionsForNotifications objectForKeyedSubscript:v6];

  if (v7)
  {
    v8 = [v7 userNotification];
    int v9 = [v8 bundleID];
    v10 = [(ATXUserNotification *)obj->_userNotification bundleID];
    int v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      [(ATXUserNotification *)obj->_userNotification timestamp];
      double v13 = v12;
      uint64_t v14 = [v7 userNotification];
      [v14 timestamp];
      uint64_t v16 = (uint64_t)(v13 - v15);

      if ((unint64_t)(v16 - 1) <= 0xE0F)
      {
        uint64_t v17 = v7;
        historicalResolutionsForNotification = obj->_historicalResolutionsForNotification;
        obj->_historicalResolutionsForNotification = v17;
LABEL_11:

        goto LABEL_12;
      }
    }
  }
  [(ATXNotificationResolutionAccumulator *)obj cacheAppLaunchDataFromStartTime:obj->_startDate toEndTime:obj->_endDate];
  [(ATXNotificationResolutionAccumulator *)obj historicalResolutionForNotification];
  if ((unint64_t)[(NSMutableDictionary *)obj->_cachedHistoricalResolutionsForNotifications count] >= 0xA) {
    [(ATXNotificationResolutionAccumulator *)obj removeOldestEntry];
  }
  uint64_t v19 = [(ATXUserNotification *)obj->_userNotification bundleID];

  if (v19)
  {
    uint64_t v20 = obj->_historicalResolutionsForNotification;
    v21 = obj->_cachedHistoricalResolutionsForNotifications;
    historicalResolutionsForNotification = [(ATXUserNotification *)obj->_userNotification bundleID];
    [(NSMutableDictionary *)v21 setObject:v20 forKeyedSubscript:historicalResolutionsForNotification];
    goto LABEL_11;
  }
LABEL_12:

  objc_sync_exit(obj);
}

- (void)cacheAppLaunchDataFromStartTime:(id)a3 toEndTime:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int v9 = BiomeLibrary();
  v10 = [v9 App];
  int v11 = [v10 InFocus];
  double v12 = objc_msgSend(v11, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v6, v7, 0, 0, 0);

  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke_49;
  v27[3] = &unk_1E68ABB70;
  id v13 = v8;
  id v28 = v13;
  id v14 = (id)[v12 sinkWithCompletion:&__block_literal_global_48 receiveInput:v27];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  double v15 = (NSDictionary *)v13;
  uint64_t v16 = [(NSDictionary *)v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = -[NSDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * v19), (void)v23);
        [v20 sortUsingComparator:&__block_literal_global_54];

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSDictionary *)v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v17);
  }

  cacheHistoricalAppLaunches = self->_cacheHistoricalAppLaunches;
  self->_cacheHistoricalAppLaunches = v15;
  v22 = v15;
}

void __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    uint64_t v4 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_cold_1(v2);
    }
  }
}

void __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke_49(uint64_t a1, void *a2)
{
  id v19 = a2;
  id v3 = [v19 eventBody];
  int v4 = [v3 starting];

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    id v6 = [v19 eventBody];
    id v7 = [v6 bundleID];
    id v8 = [v5 objectForKeyedSubscript:v7];

    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10 = *(void **)(a1 + 32);
      int v11 = [v19 eventBody];
      double v12 = [v11 bundleID];
      [v10 setObject:v9 forKeyedSubscript:v12];
    }
    id v13 = *(void **)(a1 + 32);
    id v14 = [v19 eventBody];
    double v15 = [v14 bundleID];
    uint64_t v16 = [v13 objectForKeyedSubscript:v15];
    uint64_t v17 = [v19 eventBody];
    uint64_t v18 = [v17 absoluteTimestamp];
    [v16 addObject:v18];
  }
}

uint64_t __82__ATXNotificationResolutionAccumulator_cacheAppLaunchDataFromStartTime_toEndTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)historicalResolutionForNotification
{
  id v3 = (void *)MEMORY[0x1E4F1C9C8];
  [(ATXUserNotification *)self->_userNotification timestamp];
  v107 = [v3 dateWithTimeIntervalSinceReferenceDate:v4 + -86400.0];
  v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(ATXUserNotification *)self->_userNotification timestamp];
  v105 = [v5 dateWithTimeIntervalSinceReferenceDate:v6 + -604800.0];
  id v7 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v102 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v8 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v86 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v100 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v98 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v96 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v94 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v92 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v90 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v88 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v12 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v81 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v79 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v77 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  id v13 = objc_opt_new();
  unifiedModePublisher = self->_unifiedModePublisher;
  notificationPublisher = self->_notificationPublisher;
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke;
  v138[3] = &unk_1E68AC7A0;
  v138[4] = self;
  uint64_t v16 = [(BPSPublisher *)unifiedModePublisher orderedMergeWithOther:notificationPublisher comparator:v138];
  v136[0] = 0;
  v136[1] = v136;
  v136[2] = 0x3032000000;
  v136[3] = __Block_byref_object_copy__5;
  v136[4] = __Block_byref_object_dispose__5;
  id v137 = 0;
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_62;
  v109[3] = &unk_1E68AC7C8;
  v109[4] = self;
  v131 = v136;
  id v73 = v107;
  id v110 = v73;
  id v108 = v7;
  id v111 = v108;
  id v104 = v8;
  id v112 = v104;
  id v72 = v105;
  id v113 = v72;
  id v106 = v102;
  id v114 = v106;
  id v103 = v86;
  id v115 = v103;
  id v70 = v13;
  id v116 = v70;
  long long v132 = xmmword_1D142B160;
  id v101 = v100;
  id v117 = v101;
  id v87 = v9;
  id v118 = v87;
  id v99 = v98;
  id v119 = v99;
  id v85 = v10;
  id v120 = v85;
  long long v133 = xmmword_1D142B170;
  id v97 = v96;
  id v121 = v97;
  id v84 = v11;
  id v122 = v84;
  id v95 = v94;
  id v123 = v95;
  id v83 = v12;
  id v124 = v83;
  long long v134 = xmmword_1D142B180;
  id v93 = v92;
  id v125 = v93;
  id v82 = v81;
  id v126 = v82;
  uint64_t v135 = 1800;
  id v91 = v90;
  id v127 = v91;
  id v80 = v79;
  id v128 = v80;
  id v89 = v88;
  id v129 = v89;
  id v78 = v77;
  id v130 = v78;
  v71 = v16;
  id v17 = (id)[v16 sinkWithCompletion:&__block_literal_global_60 shouldContinue:v109];
  id v18 = objc_alloc(MEMORY[0x1E4F4B238]);
  id v19 = [(ATXUserNotification *)self->_userNotification bundleID];
  uint64_t v20 = [(ATXUserNotification *)self->_userNotification bundleID];
  uint64_t v21 = [v108 countForObject:v20];
  v22 = [(ATXUserNotification *)self->_userNotification bundleID];
  uint64_t v23 = [v106 countForObject:v22];
  long long v24 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v25 = percentageOfBundleIDInBucket((uint64_t)v24, v108);
  long long v26 = [(ATXUserNotification *)self->_userNotification bundleID];
  v76 = objc_msgSend(v18, "initWithBundleID:dailyNumberOfNotificationsReceivedForBundleID:weeklyNumberOfNotificationsReceivedForBundleID:dailyPercentageOfNotificationsReceivedForBundleID:weeklyPercentageOfNotificationsReceivedForBundleID:", v19, v21, v23, v25, percentageOfBundleIDInBucket((uint64_t)v26, v106));

  id v27 = objc_alloc(MEMORY[0x1E4F4B238]);
  id v28 = [(ATXUserNotification *)self->_userNotification bundleID];
  v29 = [(ATXUserNotification *)self->_userNotification bundleID];
  uint64_t v30 = [v104 countForObject:v29];
  v31 = [(ATXUserNotification *)self->_userNotification bundleID];
  uint64_t v32 = [v103 countForObject:v31];
  v33 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v34 = percentageOfBundleIDInBucket((uint64_t)v33, v104);
  v35 = [(ATXUserNotification *)self->_userNotification bundleID];
  v75 = objc_msgSend(v27, "initWithBundleID:dailyNumberOfNotificationsReceivedForBundleID:weeklyNumberOfNotificationsReceivedForBundleID:dailyPercentageOfNotificationsReceivedForBundleID:weeklyPercentageOfNotificationsReceivedForBundleID:", v28, v30, v32, v34, percentageOfBundleIDInBucket((uint64_t)v35, v103));

  id v36 = objc_alloc(MEMORY[0x1E4F4B208]);
  v37 = [(ATXUserNotification *)self->_userNotification bundleID];
  v38 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v39 = percentageOfBundleIDInBucket((uint64_t)v38, v101);
  v40 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v41 = percentageOfBundleIDInBucket((uint64_t)v40, v99);
  v42 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v43 = percentageOfBundleIDInBucket((uint64_t)v42, v97);
  v44 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v45 = percentageOfBundleIDInBucket((uint64_t)v44, v95);
  v46 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v47 = percentageOfBundleIDInBucket((uint64_t)v46, v93);
  v48 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v49 = percentageOfBundleIDInBucket((uint64_t)v48, v91);
  v50 = [(ATXUserNotification *)self->_userNotification bundleID];
  v74 = objc_msgSend(v36, "initWithBundleID:percentageForOneMinuteDuration:percentageForTwoMinutesDuration:percentageForFiveMinutesDuration:percentageForTenMinutesDuration:percentageForTwentyMinutesDuration:percentageForThirtyMinutesDuration:percentageForSixtyMinutesDuration:", v37, v39, v41, v43, v45, v47, v49, percentageOfBundleIDInBucket((uint64_t)v50, v89));

  id v51 = objc_alloc(MEMORY[0x1E4F4B208]);
  v52 = [(ATXUserNotification *)self->_userNotification bundleID];
  v53 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v54 = percentageOfBundleIDInBucket((uint64_t)v53, v87);
  v55 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v56 = percentageOfBundleIDInBucket((uint64_t)v55, v85);
  v57 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v58 = percentageOfBundleIDInBucket((uint64_t)v57, v84);
  v59 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v60 = percentageOfBundleIDInBucket((uint64_t)v59, v83);
  v61 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v62 = percentageOfBundleIDInBucket((uint64_t)v61, v82);
  v63 = [(ATXUserNotification *)self->_userNotification bundleID];
  double v64 = percentageOfBundleIDInBucket((uint64_t)v63, v80);
  v65 = [(ATXUserNotification *)self->_userNotification bundleID];
  v66 = objc_msgSend(v51, "initWithBundleID:percentageForOneMinuteDuration:percentageForTwoMinutesDuration:percentageForFiveMinutesDuration:percentageForTenMinutesDuration:percentageForTwentyMinutesDuration:percentageForThirtyMinutesDuration:percentageForSixtyMinutesDuration:", v52, v54, v56, v58, v60, v62, v64, percentageOfBundleIDInBucket((uint64_t)v65, v78));

  v67 = [[ATXHistoricalResolutonsForNotification alloc] initWithNotification:self->_userNotification historicalVolumeByCountAndPercentage:v76 modeConditionedHistoricalVolumeByCountAndPercentage:v75 historicalResolutionByPercentage:v74 modeConditionedHistoricalResolutionByPercentage:v66];
  historicalResolutionsForNotification = self->_historicalResolutionsForNotification;
  self->_historicalResolutionsForNotification = v67;

  cacheHistoricalAppLaunches = self->_cacheHistoricalAppLaunches;
  self->_cacheHistoricalAppLaunches = 0;

  _Block_object_dispose(v136, 8);
}

uint64_t __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) dateIntervalFromModeEvent:v5];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v5];
  }
  id v10 = v9;

  id v11 = [*(id *)(a1 + 32) dateIntervalFromModeEvent:v6];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = [*(id *)(a1 + 32) dateIntervalFromNotificationEvent:v6];
  }
  id v14 = v13;

  if (v10)
  {
    if (v14) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  double v15 = __atxlog_handle_notification_categorization();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_cold_1();
  }

  if (!v14)
  {
LABEL_13:
    uint64_t v16 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_cold_1();
    }
  }
LABEL_16:
  id v17 = [v10 startDate];
  [v17 timeIntervalSinceReferenceDate];
  double v19 = v18;

  uint64_t v20 = [v14 startDate];
  [v20 timeIntervalSinceReferenceDate];
  double v22 = v21;

  uint64_t v23 = [NSNumber numberWithDouble:v19];
  long long v24 = [NSNumber numberWithDouble:v22];
  uint64_t v25 = [v23 compare:v24];

  return v25;
}

void __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_58(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 error];

  if (v3)
  {
    double v4 = __atxlog_handle_notification_categorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_58_cold_1(v2);
    }
  }
}

uint64_t __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_62(void *a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 mode] == *(void *)(a1[4] + 16)) {
      objc_storeStrong((id *)(*(void *)(a1[26] + 8) + 40), a2);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [v6 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
LABEL_72:

      goto LABEL_73;
    }
    id v9 = [v6 eventBody];
    if ([v9 usageType] != 17)
    {
LABEL_71:

      goto LABEL_72;
    }
    id v106 = v6;
    uint64_t v10 = a1[5];
    id v11 = [v9 absoluteTimestamp];
    [v11 timeIntervalSinceDate:v10];
    double v13 = v12;

    if (v13 >= 0.0 && v13 <= 86400.0)
    {
      id v14 = (void *)a1[6];
      double v15 = [v9 bundleID];
      [v14 addObject:v15];

      if (*(void *)(*(void *)(a1[26] + 8) + 40))
      {
        uint64_t v16 = [v9 absoluteTimestamp];
        id v17 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
        if ([v16 compare:v17] == -1)
        {

          goto LABEL_15;
        }
        double v18 = [v9 absoluteTimestamp];
        double v19 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
        uint64_t v20 = [v18 compare:v19];

        if (v20 != 1)
        {
          double v21 = (void *)a1[7];
          uint64_t v16 = [v9 bundleID];
          [v21 addObject:v16];
LABEL_15:
        }
      }
    }
    uint64_t v22 = a1[8];
    uint64_t v23 = [v9 absoluteTimestamp];
    [v23 timeIntervalSinceDate:v22];
    double v25 = v24;

    if (v25 < 0.0) {
      goto LABEL_24;
    }
    if (v25 > 604800.0) {
      goto LABEL_24;
    }
    long long v26 = (void *)a1[9];
    id v27 = [v9 bundleID];
    [v26 addObject:v27];

    if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
      goto LABEL_24;
    }
    id v28 = [v9 absoluteTimestamp];
    v29 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
    if ([v28 compare:v29] == -1)
    {
    }
    else
    {
      uint64_t v30 = [v9 absoluteTimestamp];
      v31 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
      uint64_t v32 = [v30 compare:v31];

      if (v32 == 1)
      {
LABEL_24:
        double v34 = *(void **)(a1[4] + 64);
        v35 = [v9 bundleID];
        id v36 = [v34 objectForKeyedSubscript:v35];

        if (v36)
        {
          v37 = (void *)a1[11];
          v38 = [v9 bundleID];
          double v39 = [v37 objectForKeyedSubscript:v38];

          id v104 = v39;
          if (v39) {
            uint64_t v40 = [v39 integerValue];
          }
          else {
            uint64_t v40 = 0;
          }
          uint64_t v41 = [v36 count] - 1;
          while (v40 <= v41)
          {
            uint64_t v42 = v40 + ((v41 - v40) >> 1);
            double v43 = [v36 objectAtIndexedSubscript:v42];
            v44 = [v9 absoluteTimestamp];
            [v43 timeIntervalSinceDate:v44];
            double v46 = v45;

            if (v46 <= 0.0)
            {
              uint64_t v40 = v42 + 1;
            }
            else if (v46 <= (double)(uint64_t)a1[27])
            {
              v105 = v43;
              do
              {
                uint64_t v47 = v42;
                if (v42 <= v40) {
                  break;
                }
                --v42;
                v48 = [v36 objectAtIndexedSubscript:v47 - 1];
                double v49 = [v9 absoluteTimestamp];
                [v48 timeIntervalSinceDate:v49];
                double v51 = v50;

                if (v51 <= 0.0) {
                  break;
                }
              }
              while (v51 <= (double)(uint64_t)a1[27]);
              v52 = [v36 objectAtIndexedSubscript:v47];
              v53 = [v9 absoluteTimestamp];
              [v52 timeIntervalSinceDate:v53];
              double v55 = v54;

              if (v55 <= (double)(uint64_t)a1[28])
              {
                double v56 = (void *)a1[12];
                v57 = [v9 bundleID];
                [v56 addObject:v57];

                if (*(void *)(*(void *)(a1[26] + 8) + 40))
                {
                  double v58 = [v9 absoluteTimestamp];
                  uint64_t v59 = a1[28];
                  double v60 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                  v61 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                  LODWORD(v59) = isTimeRangeWithinTimeRange(v58, v59, v60, v61);

                  if (v59)
                  {
                    double v62 = (void *)a1[13];
                    goto LABEL_67;
                  }
                }
LABEL_68:
                id v100 = [NSNumber numberWithInteger:v47];
                id v101 = (void *)a1[11];
                id v102 = [v9 bundleID];
                [v101 setObject:v100 forKeyedSubscript:v102];

                break;
              }
              if (v55 <= (double)(uint64_t)a1[29])
              {
                v63 = (void *)a1[14];
                double v64 = [v9 bundleID];
                [v63 addObject:v64];

                if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
                  goto LABEL_68;
                }
                v65 = [v9 absoluteTimestamp];
                uint64_t v66 = a1[29];
                v67 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                v68 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                LODWORD(v66) = isTimeRangeWithinTimeRange(v65, v66, v67, v68);

                if (!v66) {
                  goto LABEL_68;
                }
                double v62 = (void *)a1[15];
LABEL_67:
                id v99 = [v9 bundleID];
                [v62 addObject:v99];

                goto LABEL_68;
              }
              if (v55 <= (double)(uint64_t)a1[30])
              {
                v69 = (void *)a1[16];
                id v70 = [v9 bundleID];
                [v69 addObject:v70];

                if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
                  goto LABEL_68;
                }
                v71 = [v9 absoluteTimestamp];
                uint64_t v72 = a1[30];
                id v73 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                v74 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                LODWORD(v72) = isTimeRangeWithinTimeRange(v71, v72, v73, v74);

                if (!v72) {
                  goto LABEL_68;
                }
                double v62 = (void *)a1[17];
                goto LABEL_67;
              }
              if (v55 <= (double)(uint64_t)a1[31])
              {
                v75 = (void *)a1[18];
                v76 = [v9 bundleID];
                [v75 addObject:v76];

                if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
                  goto LABEL_68;
                }
                id v77 = [v9 absoluteTimestamp];
                uint64_t v78 = a1[31];
                id v79 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                id v80 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                LODWORD(v78) = isTimeRangeWithinTimeRange(v77, v78, v79, v80);

                if (!v78) {
                  goto LABEL_68;
                }
                double v62 = (void *)a1[19];
                goto LABEL_67;
              }
              if (v55 <= (double)(uint64_t)a1[32])
              {
                id v81 = (void *)a1[20];
                id v82 = [v9 bundleID];
                [v81 addObject:v82];

                if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
                  goto LABEL_68;
                }
                id v83 = [v9 absoluteTimestamp];
                uint64_t v84 = a1[32];
                id v85 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                id v86 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                LODWORD(v84) = isTimeRangeWithinTimeRange(v83, v84, v85, v86);

                if (!v84) {
                  goto LABEL_68;
                }
                double v62 = (void *)a1[21];
                goto LABEL_67;
              }
              if (v55 <= (double)(uint64_t)a1[33])
              {
                id v87 = (void *)a1[22];
                id v88 = [v9 bundleID];
                [v87 addObject:v88];

                if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
                  goto LABEL_68;
                }
                id v89 = [v9 absoluteTimestamp];
                uint64_t v90 = a1[33];
                id v91 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                id v92 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                LODWORD(v90) = isTimeRangeWithinTimeRange(v89, v90, v91, v92);

                if (!v90) {
                  goto LABEL_68;
                }
                double v62 = (void *)a1[23];
                goto LABEL_67;
              }
              double v43 = v105;
              if (v55 <= (double)(uint64_t)a1[27])
              {
                id v93 = (void *)a1[24];
                id v94 = [v9 bundleID];
                [v93 addObject:v94];

                if (!*(void *)(*(void *)(a1[26] + 8) + 40)) {
                  goto LABEL_68;
                }
                id v95 = [v9 absoluteTimestamp];
                uint64_t v96 = a1[27];
                id v97 = [*(id *)(*(void *)(a1[26] + 8) + 40) startTime];
                id v98 = [*(id *)(*(void *)(a1[26] + 8) + 40) endTime];
                LODWORD(v96) = isTimeRangeWithinTimeRange(v95, v96, v97, v98);

                if (!v96) {
                  goto LABEL_68;
                }
                double v62 = (void *)a1[25];
                goto LABEL_67;
              }
            }
            else
            {
              uint64_t v41 = v42 - 1;
            }
          }
        }

        id v6 = v106;
        goto LABEL_71;
      }
      v33 = (void *)a1[10];
      id v28 = [v9 bundleID];
      [v33 addObject:v28];
    }

    goto LABEL_24;
  }
LABEL_73:

  return 1;
}

- (id)dateIntervalFromModeEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 endTime];

    id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v7 = [v4 startTime];
    if (v5) {
      [v4 endTime];
    }
    else {
    id v9 = [v4 startTime];
    }
    id v8 = (void *)[v6 initWithStartDate:v7 endDate:v9];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)dateIntervalFromNotificationEvent:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 eventBody];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [v4 eventBody];
      id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v9 = [v7 absoluteTimestamp];
      uint64_t v10 = [v7 absoluteTimestamp];
      id v11 = (void *)[v8 initWithStartDate:v9 endDate:v10];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)removeOldestEntry
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] distantFuture];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NSMutableDictionary *)self->_cachedHistoricalResolutionsForNotifications allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v19;
    id obj = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v11 = [(NSMutableDictionary *)self->_cachedHistoricalResolutionsForNotifications objectForKeyedSubscript:v10];
        double v12 = (void *)MEMORY[0x1E4F1C9C8];
        double v13 = [v11 userNotification];
        [v13 timestamp];
        id v14 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");

        if ([v14 compare:v3] == -1)
        {
          id v15 = v14;

          id v16 = v10;
          id v3 = v15;
          id v7 = v16;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);

    if (v7) {
      [(NSMutableDictionary *)self->_cachedHistoricalResolutionsForNotifications removeObjectForKey:v7];
    }
  }
  else
  {

    id v7 = 0;
  }
}

- (void)unloadHistoricalResolutionsForNotifications
{
  id obj = self;
  objc_sync_enter(obj);
  cachedHistoricalResolutionsForNotifications = obj->_cachedHistoricalResolutionsForNotifications;
  obj->_cachedHistoricalResolutionsForNotifications = 0;

  objc_sync_exit(obj);
}

- (unint64_t)timeToLaunchApp
{
  return self->_timeToLaunchApp;
}

- (ATXHistoricalResolutonsForNotification)historicalResolutionsForNotification
{
  return self->_historicalResolutionsForNotification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historicalResolutionsForNotification, 0);
  objc_storeStrong((id *)&self->_cachedHistoricalResolutionsForNotifications, 0);
  objc_storeStrong((id *)&self->_memoryPressureMonitor, 0);
  objc_storeStrong((id *)&self->_cacheHistoricalAppLaunches, 0);
  objc_storeStrong((id *)&self->_appLaunchPublisher, 0);
  objc_storeStrong((id *)&self->_notificationPublisher, 0);
  objc_storeStrong((id *)&self->_unifiedModePublisher, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

void __77__ATXNotificationResolutionAccumulator_computeTimeToLaunchAppForNotification__block_invoke_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXNotificationResolutionAccumulator: Error reading App.InFocus stream: %@", v4, v5, v6, v7, v8);
}

void __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "ATXNotificationResolutionAccumulator: During ordered merge, encountered unknown event: %@", v1, 0xCu);
}

void __75__ATXNotificationResolutionAccumulator_historicalResolutionForNotification__block_invoke_58_cold_1(void *a1)
{
  v1 = [a1 error];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "ATXNotificationResolutionAccumulator: Error from merged publishers: %@", v4, v5, v6, v7, v8);
}

@end