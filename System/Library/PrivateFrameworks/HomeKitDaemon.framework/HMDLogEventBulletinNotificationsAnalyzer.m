@interface HMDLogEventBulletinNotificationsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDCounterThresholdTTRTrigger)cameraReachabilityTTRTrigger;
- (HMDCounterThresholdTTRTrigger)homeHubReachabilityTTRTrigger;
- (HMDEventCounterGroup)aggregationEventGroup;
- (HMDEventCounterGroup)topicEventGroup;
- (HMDLogEventBulletinNotificationsAnalyzer)initWithDataSource:(id)a3 notificationSettingsProvider:(id)a4;
- (HMDUserNotificationCenterSettingsProviding)notificationSettingsProvider;
- (HMMLogEventSubmitting)logEventSubmitter;
- (int64_t)cameraReachabilityThresholdFromConfiguration:(id)a3;
- (void)configurationChanged:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
- (void)runDailyTask;
@end

@implementation HMDLogEventBulletinNotificationsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraReachabilityTTRTrigger, 0);
  objc_storeStrong((id *)&self->_homeHubReachabilityTTRTrigger, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_topicEventGroup, 0);
  objc_storeStrong((id *)&self->_aggregationEventGroup, 0);
  objc_storeStrong((id *)&self->_notificationSettingsProvider, 0);
}

- (HMDCounterThresholdTTRTrigger)cameraReachabilityTTRTrigger
{
  return self->_cameraReachabilityTTRTrigger;
}

- (HMDCounterThresholdTTRTrigger)homeHubReachabilityTTRTrigger
{
  return self->_homeHubReachabilityTTRTrigger;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDEventCounterGroup)topicEventGroup
{
  return self->_topicEventGroup;
}

- (HMDEventCounterGroup)aggregationEventGroup
{
  return self->_aggregationEventGroup;
}

- (HMDUserNotificationCenterSettingsProviding)notificationSettingsProvider
{
  return self->_notificationSettingsProvider;
}

- (void)runDailyTask
{
  v3 = [(HMDLogEventBulletinNotificationsAnalyzer *)self notificationSettingsProvider];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__HMDLogEventBulletinNotificationsAnalyzer_runDailyTask__block_invoke;
  v4[3] = &unk_264A1A8C0;
  v4[4] = self;
  [v3 notificationSettingsWithCompletionHandler:v4];
}

void __56__HMDLogEventBulletinNotificationsAnalyzer_runDailyTask__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) topicEventGroup];
  uint64_t v5 = [v4 summedEventCounters];

  v6 = [*(id *)(a1 + 32) logEventSubmitter];
  v7 = [[HMDBulletinNotificationDailyTotalLogEvent alloc] initWithTopic:@"AllTopics" countForTopic:v5 userNotificationSettings:v3];
  [v6 submitLogEvent:v7];

  v8 = [*(id *)(a1 + 32) topicEventGroup];
  v9 = [v8 eventCounters];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        v16 = objc_msgSend(v10, "objectForKeyedSubscript:", v15, (void)v21);
        uint64_t v17 = [v16 unsignedIntegerValue];

        v18 = [*(id *)(a1 + 32) logEventSubmitter];
        v19 = [[HMDBulletinNotificationDailyTotalLogEvent alloc] initWithTopic:v15 countForTopic:v17 userNotificationSettings:v3];
        [v18 submitLogEvent:v19];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  v20 = [*(id *)(a1 + 32) topicEventGroup];
  [v20 resetEventCounters];
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDLogEventBulletinNotificationsAnalyzer *)self aggregationEventGroup];
  [v2 resetEventCounters];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(HMDLogEventBulletinNotificationsAnalyzer *)self aggregationEventGroup];
  uint64_t v8 = [v9 fetchEventCounterForEventName:@"BulletinTotalCount" forDate:v6];

  [v7 setBulletinNotificationsPostedCount:v8];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v9;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    id v6 = [(HMDLogEventBulletinNotificationsAnalyzer *)self aggregationEventGroup];
    [v6 incrementEventCounterForEventName:@"BulletinTotalCount"];

    id v7 = [(HMDLogEventBulletinNotificationsAnalyzer *)self topicEventGroup];
    uint64_t v8 = [v5 topic];
    [v7 incrementEventCounterForEventName:v8];
  }
}

- (int64_t)cameraReachabilityThresholdFromConfiguration:(id)a3
{
  int64_t v3 = 30 * [a3 totalCameraAccessoriesRecordingEnabled];
  if (v3 <= 45) {
    int64_t v3 = 45;
  }
  if ((unint64_t)v3 >= 0xC8) {
    return 200;
  }
  else {
    return v3;
  }
}

- (void)configurationChanged:(id)a3
{
  int64_t v4 = [(HMDLogEventBulletinNotificationsAnalyzer *)self cameraReachabilityThresholdFromConfiguration:a3];
  id v5 = [(HMDLogEventBulletinNotificationsAnalyzer *)self cameraReachabilityTTRTrigger];
  [v5 setTargetThreshold:v4];
}

- (HMDLogEventBulletinNotificationsAnalyzer)initWithDataSource:(id)a3 notificationSettingsProvider:(id)a4
{
  v46[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v45.receiver = self;
  v45.super_class = (Class)HMDLogEventBulletinNotificationsAnalyzer;
  uint64_t v8 = [(HMDLogEventBulletinNotificationsAnalyzer *)&v45 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_notificationSettingsProvider, a4);
    id v10 = [v6 legacyCountersManager];
    uint64_t v11 = [v10 counterGroupForName:@"BulletinAggregationEventGroup"];
    aggregationEventGroup = v9->_aggregationEventGroup;
    v9->_aggregationEventGroup = (HMDEventCounterGroup *)v11;

    uint64_t v13 = [v6 legacyCountersManager];
    uint64_t v14 = [v13 counterGroupForName:@"BulletinTopicEventGroup"];
    topicEventGroup = v9->_topicEventGroup;
    v9->_topicEventGroup = (HMDEventCounterGroup *)v14;

    uint64_t v16 = [v6 logEventSubmitter];
    logEventSubmitter = v9->_logEventSubmitter;
    v9->_logEventSubmitter = (HMMLogEventSubmitting *)v16;

    v18 = [v6 radarInitiator];

    if (v18)
    {
      v19 = [HMDCounterThresholdTTRTrigger alloc];
      v20 = [v6 radarInitiator];
      uint64_t v21 = [(HMDCounterThresholdTTRTrigger *)v19 initWithThreshold:20 displayReason:@"home hub couldn't be reached" radarInitiator:v20];
      homeHubReachabilityTTRTrigger = v9->_homeHubReachabilityTTRTrigger;
      v9->_homeHubReachabilityTTRTrigger = (HMDCounterThresholdTTRTrigger *)v21;

      long long v23 = [v6 legacyCountersManager];
      long long v24 = v9->_homeHubReachabilityTTRTrigger;
      v25 = @"HomeHubReachability";
      [v23 addObserver:v24 forEventName:@"HomeHubReachability" requestGroup:@"BulletinTopicEventGroup"];

      uint64_t v26 = [v6 cachedConfiguration];
      uint64_t v27 = [(HMDLogEventBulletinNotificationsAnalyzer *)v9 cameraReachabilityThresholdFromConfiguration:v26];

      v28 = [HMDCounterThresholdTTRTrigger alloc];
      v29 = [v6 radarInitiator];
      uint64_t v30 = [(HMDCounterThresholdTTRTrigger *)v28 initWithThreshold:v27 displayReason:@"camera was unreachable" radarInitiator:v29];
      cameraReachabilityTTRTrigger = v9->_cameraReachabilityTTRTrigger;
      v9->_cameraReachabilityTTRTrigger = (HMDCounterThresholdTTRTrigger *)v30;

      v32 = [v6 legacyCountersManager];
      v33 = v9->_cameraReachabilityTTRTrigger;
      v34 = @"CameraReachability";
      [v32 addObserver:v33 forEventName:@"CameraReachability" requestGroup:@"BulletinTopicEventGroup"];

      objc_initWeak(&location, v9);
      uint64_t v39 = MEMORY[0x263EF8330];
      uint64_t v40 = 3221225472;
      v41 = __92__HMDLogEventBulletinNotificationsAnalyzer_initWithDataSource_notificationSettingsProvider___block_invoke;
      v42 = &unk_264A1A898;
      objc_copyWeak(&v43, &location);
      [v6 addConfigurationChangedObserver:&v39];
      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
    }
    v35 = objc_msgSend(v6, "logEventDispatcher", v39, v40, v41, v42);
    v46[0] = objc_opt_class();
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:1];
    [v35 addObserver:v9 forEventClasses:v36];

    v37 = [v6 dailyScheduler];
    [v37 registerDailyTaskRunner:v9];
  }
  return v9;
}

void __92__HMDLogEventBulletinNotificationsAnalyzer_initWithDataSource_notificationSettingsProvider___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained configurationChanged:v3];
}

+ (id)managedEventCounterRequestGroups
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"BulletinAggregationEventGroup";
  v4[1] = @"BulletinTopicEventGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end