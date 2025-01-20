@interface HMDCoreDataLogEventsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDCoreDataLogEventsAnalyzer)initWithDataSource:(id)a3;
- (HMDCounterThresholdTTRTrigger)cloudKitExportCountTTRTrigger;
- (HMDCounterThresholdTTRTrigger)cloudKitImportCountTTRTrigger;
- (HMDCounterThresholdTTRTrigger)workingStoreCommitTTRTrigger;
- (HMDEventCounterGroup)aggregationEventGroup;
- (HMDEventCounterGroup)cloudStoreReasonsEventGroup;
- (HMDEventCountersManager)countersManager;
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)addTTRThresholdTrigger:(id)a3 atThreshold:(int64_t)a4 displayReason:(id)a5 forEventName:(id)a6;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)handleCloudKitOperationEvent:(id)a3;
- (void)handleCloudStoreTransactionEvent:(id)a3;
- (void)handleWorkingStoreTransactionEvent:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetAggregationAnalysisContext;
- (void)runDailyTask;
@end

@implementation HMDCoreDataLogEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitExportCountTTRTrigger, 0);
  objc_storeStrong((id *)&self->_cloudKitImportCountTTRTrigger, 0);
  objc_storeStrong((id *)&self->_workingStoreCommitTTRTrigger, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_cloudStoreReasonsEventGroup, 0);
  objc_storeStrong((id *)&self->_aggregationEventGroup, 0);
}

- (HMDCounterThresholdTTRTrigger)cloudKitExportCountTTRTrigger
{
  return self->_cloudKitExportCountTTRTrigger;
}

- (HMDCounterThresholdTTRTrigger)cloudKitImportCountTTRTrigger
{
  return self->_cloudKitImportCountTTRTrigger;
}

- (HMDCounterThresholdTTRTrigger)workingStoreCommitTTRTrigger
{
  return self->_workingStoreCommitTTRTrigger;
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDEventCounterGroup)cloudStoreReasonsEventGroup
{
  return self->_cloudStoreReasonsEventGroup;
}

- (HMDEventCounterGroup)aggregationEventGroup
{
  return self->_aggregationEventGroup;
}

- (void)runDailyTask
{
  v3 = [(HMDCoreDataLogEventsAnalyzer *)self cloudStoreReasonsEventGroup];
  v4 = [v3 eventCounters];

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HMDCoreDataLogEventsAnalyzer_runDailyTask__block_invoke;
  v6[3] = &unk_264A29CC8;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
  v5 = [(HMDCoreDataLogEventsAnalyzer *)self cloudStoreReasonsEventGroup];
  [v5 resetEventCounters];
}

void __44__HMDCoreDataLogEventsAnalyzer_runDailyTask__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id v10 = [v4 logEventSubmitter];
  v7 = [HMDCoreDataCloudStoreReasonsDailyLogEvent alloc];
  uint64_t v8 = [v5 unsignedIntegerValue];

  v9 = [(HMDCoreDataCloudStoreReasonsDailyLogEvent *)v7 initWithReason:v6 reasonCount:v8];
  [v10 submitLogEvent:v9];
}

- (void)resetAggregationAnalysisContext
{
  id v2 = [(HMDCoreDataLogEventsAnalyzer *)self aggregationEventGroup];
  [v2 resetEventCounters];
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(HMDCoreDataLogEventsAnalyzer *)self aggregationEventGroup];
  objc_msgSend(v7, "setCloudStoreCoreDataTransactionCount:", objc_msgSend(v8, "fetchEventCounterForEventName:forDate:", @"CloudStoreCommitCount", v6));

  v9 = [(HMDCoreDataLogEventsAnalyzer *)self aggregationEventGroup];
  objc_msgSend(v7, "setWorkingStoreCoreDataTransactionCount:", objc_msgSend(v9, "fetchEventCounterForEventName:forDate:", @"WorkingStoreCommitCount", v6));

  id v10 = [(HMDCoreDataLogEventsAnalyzer *)self aggregationEventGroup];
  objc_msgSend(v7, "setCoreDataCloudKitImportCount:", objc_msgSend(v10, "fetchEventCounterForEventName:forDate:", @"CloudKitImportCount", v6));

  id v12 = [(HMDCoreDataLogEventsAnalyzer *)self aggregationEventGroup];
  uint64_t v11 = [v12 fetchEventCounterForEventName:@"CloudKitExportCount" forDate:v6];

  [v7 setCoreDataCloudKitExportCount:v11];
}

- (void)handleCloudKitOperationEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    int v13 = 138543618;
    v14 = v8;
    __int16 v15 = 2048;
    uint64_t v16 = [v4 operationType];
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing HMDCoreDataCloudKitOperationLogEvent, operationType: %lu", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v9 = [v4 operationType];
  if (v9 == 2)
  {
    id v10 = [(HMDCoreDataLogEventsAnalyzer *)v6 aggregationEventGroup];
    uint64_t v11 = v10;
    id v12 = @"CloudKitExportCount";
    goto LABEL_7;
  }
  if (v9 == 1)
  {
    id v10 = [(HMDCoreDataLogEventsAnalyzer *)v6 aggregationEventGroup];
    uint64_t v11 = v10;
    id v12 = @"CloudKitImportCount";
LABEL_7:
    [v10 incrementEventCounterForEventName:v12];
  }
}

- (void)handleWorkingStoreTransactionEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v9 = [v4 transactionAuthor];
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Processing HMDCoreDataWorkingStoreTransactionLogEvent, author: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(HMDCoreDataLogEventsAnalyzer *)v6 aggregationEventGroup];
  [v10 incrementEventCounterForEventName:@"WorkingStoreCommitCount"];
}

- (void)handleCloudStoreTransactionEvent:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCoreDataLogEventsAnalyzer *)self aggregationEventGroup];
  [v5 incrementEventCounterForEventName:@"CloudStoreCommitCount"];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v4 reasons];
  uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v26;
    *(void *)&long long v7 = 138543874;
    long long v22 = v7;
    do
    {
      uint64_t v10 = 0;
      uint64_t v23 = v8;
      do
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v25 + 1) + 8 * v10);
        id v12 = objc_msgSend(v4, "reasons", v22);
        uint64_t v13 = [v12 countForObject:v11];

        v14 = (void *)MEMORY[0x230FBD990]();
        uint64_t v15 = self;
        uint64_t v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v17 = v9;
          id v18 = v4;
          v20 = v19 = self;
          *(_DWORD *)buf = v22;
          v30 = v20;
          __int16 v31 = 2112;
          uint64_t v32 = v11;
          __int16 v33 = 2048;
          uint64_t v34 = v13;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Processing HMDCoreDataCloudStoreTransactionLogEvent with reason: %@ reasonCount: %lu", buf, 0x20u);

          self = v19;
          id v4 = v18;
          uint64_t v9 = v17;
          uint64_t v8 = v23;
        }

        v21 = [(HMDCoreDataLogEventsAnalyzer *)v15 cloudStoreReasonsEventGroup];
        [v21 incrementEventCounterForEventName:v11 withValue:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v8);
  }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v12;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDCoreDataLogEventsAnalyzer *)self handleWorkingStoreTransactionEvent:v5];
  }
  else
  {
    id v6 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v7 = v6;
    }
    else {
      long long v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      [(HMDCoreDataLogEventsAnalyzer *)self handleCloudStoreTransactionEvent:v8];
    }
    else
    {
      id v9 = v6;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;

      if (v11) {
        [(HMDCoreDataLogEventsAnalyzer *)self handleCloudKitOperationEvent:v11];
      }
    }
  }
}

- (id)addTTRThresholdTrigger:(id)a3 atThreshold:(int64_t)a4 displayReason:(id)a5 forEventName:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  id v12 = [HMDCounterThresholdTTRTrigger alloc];
  uint64_t v13 = [v11 radarInitiator];
  v14 = [(HMDCounterThresholdTTRTrigger *)v12 initWithThreshold:a4 displayReason:v10 radarInitiator:v13];

  uint64_t v15 = [v11 legacyCountersManager];

  [v15 addObserver:v14 forEventName:v9 requestGroup:@"CoreDataAggregationEventGroup"];
  return v14;
}

- (HMDCoreDataLogEventsAnalyzer)initWithDataSource:(id)a3
{
  v28[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HMDCoreDataLogEventsAnalyzer;
  id v5 = [(HMDCoreDataLogEventsAnalyzer *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 legacyCountersManager];
    countersManager = v5->_countersManager;
    v5->_countersManager = (HMDEventCountersManager *)v6;

    uint64_t v8 = [v4 logEventSubmitter];
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v8;

    id v10 = [v4 legacyCountersManager];
    uint64_t v11 = [v10 counterGroupForName:@"CoreDataAggregationEventGroup"];
    aggregationEventGroup = v5->_aggregationEventGroup;
    v5->_aggregationEventGroup = (HMDEventCounterGroup *)v11;

    uint64_t v13 = [v4 legacyCountersManager];
    uint64_t v14 = [v13 counterGroupForName:@"CoreDataCloudStoreReasonsGroup"];
    cloudStoreReasonsEventGroup = v5->_cloudStoreReasonsEventGroup;
    v5->_cloudStoreReasonsEventGroup = (HMDEventCounterGroup *)v14;

    [v4 addThresholdTrigger:@"coreDataCloudStoreCommitCount" forEventName:@"CloudStoreCommitCount" requestGroup:@"CoreDataAggregationEventGroup" atThreshold:10];
    [v4 addThresholdTrigger:@"cloudKitImportCount" forEventName:@"CloudKitImportCount" requestGroup:@"CoreDataAggregationEventGroup" atThreshold:10];
    [v4 addThresholdTrigger:@"cloudKitExportCount" forEventName:@"CloudKitExportCount" requestGroup:@"CoreDataAggregationEventGroup" atThreshold:50];
    uint64_t v16 = [v4 radarInitiator];

    if (v16)
    {
      uint64_t v17 = [(HMDCoreDataLogEventsAnalyzer *)v5 addTTRThresholdTrigger:v4 atThreshold:10000 displayReason:@"we detected excessive working store commits" forEventName:@"WorkingStoreCommitCount"];
      workingStoreCommitTTRTrigger = v5->_workingStoreCommitTTRTrigger;
      v5->_workingStoreCommitTTRTrigger = (HMDCounterThresholdTTRTrigger *)v17;

      uint64_t v19 = [(HMDCoreDataLogEventsAnalyzer *)v5 addTTRThresholdTrigger:v4 atThreshold:500 displayReason:@"we detected excessive CloudKit imports" forEventName:@"CloudKitImportCount"];
      cloudKitImportCountTTRTrigger = v5->_cloudKitImportCountTTRTrigger;
      v5->_cloudKitImportCountTTRTrigger = (HMDCounterThresholdTTRTrigger *)v19;

      uint64_t v21 = [(HMDCoreDataLogEventsAnalyzer *)v5 addTTRThresholdTrigger:v4 atThreshold:500 displayReason:@"we detected excessive CloudKit exports" forEventName:@"CloudKitExportCount"];
      cloudKitExportCountTTRTrigger = v5->_cloudKitExportCountTTRTrigger;
      v5->_cloudKitExportCountTTRTrigger = (HMDCounterThresholdTTRTrigger *)v21;
    }
    uint64_t v23 = [v4 logEventDispatcher];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:3];
    [v23 addObserver:v5 forEventClasses:v24];

    long long v25 = [v4 dailyScheduler];
    [v25 registerDailyTaskRunner:v5];
  }
  return v5;
}

+ (id)managedEventCounterRequestGroups
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"CoreDataAggregationEventGroup";
  v4[1] = @"CoreDataCloudStoreReasonsGroup";
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end