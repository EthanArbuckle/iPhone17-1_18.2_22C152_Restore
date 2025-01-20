@interface HMDCloudSyncLogEventsAnalyzer
+ (id)managedEventCounterRequestGroups;
- (HMDCloudSyncLogEventsAnalyzer)initWithDataSource:(id)a3;
- (HMDEventCountersManager)eventCountersManager;
- (HMDLogEventAnalyzerDataSource)dataSource;
- (HMDMetricsDeviceStateProvider)deviceStateProvider;
- (HMDTimeBasedFlagsManager)flagsManager;
- (HMMDateProvider)dateProvider;
- (HMMLogEventSubmitting)logEventSubmitter;
- (id)cloudSyncAnalysisResultForDate:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)handleDecryptionCompletedEvent:(id)a3;
- (void)handleFetchLogEvent:(id)a3;
- (void)handleIncomingCloudPushLogEvent:(id)a3;
- (void)handleMaximumDelayLogEvent:(id)a3;
- (void)handleRecordOperationLogEvent:(id)a3;
- (void)handleUploadLogEvent:(id)a3;
- (void)handleUploadReasonLogEvent:(id)a3;
- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4;
- (void)resetDataSource;
@end

@implementation HMDCloudSyncLogEventsAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_deviceStateProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_flagsManager, 0);
  objc_storeStrong((id *)&self->_eventCountersManager, 0);
}

- (HMDLogEventAnalyzerDataSource)dataSource
{
  return self->_dataSource;
}

- (HMDMetricsDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (HMDTimeBasedFlagsManager)flagsManager
{
  return self->_flagsManager;
}

- (HMDEventCountersManager)eventCountersManager
{
  return self->_eventCountersManager;
}

- (void)populateAggregationAnalysisLogEvent:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  id v7 = [(HMDCloudSyncLogEventsAnalyzer *)self cloudSyncAnalysisResultForDate:a4];
  objc_msgSend(v6, "setCloudSyncPushCount:", objc_msgSend(v7, "incomingPushCount"));
  objc_msgSend(v6, "setCloudSyncFetchCount:", objc_msgSend(v7, "legacyFetchCount"));
  objc_msgSend(v6, "setCloudSyncUploadCount:", objc_msgSend(v7, "legacyUploadCount"));
  objc_msgSend(v6, "setCloudSyncUploadErrorCount:", objc_msgSend(v7, "legacyUploadErrorCount"));
  objc_msgSend(v6, "setHomeDataBytesFetched:", objc_msgSend(v7, "bytesFetched"));
  objc_msgSend(v6, "setHomeDataBytesPushed:", objc_msgSend(v7, "bytesPushed"));
  objc_msgSend(v6, "setLegacyHomeDataBytesFetched:", objc_msgSend(v7, "legacyBytesFetched"));
  objc_msgSend(v6, "setLegacyHomeDataBytesPushed:", objc_msgSend(v7, "legacyBytesPushed"));
  objc_msgSend(v6, "setCloudSyncDecryptionFailedCount:", objc_msgSend(v7, "decryptionFailedCount"));
  objc_msgSend(v6, "setCloudSyncLastDecryptionFailed:", objc_msgSend(v7, "lastDecryptionFailed"));
  objc_msgSend(v6, "setCloudSyncMaximumDelayReached:", objc_msgSend(v7, "uploadMaximumDelayReached"));
}

- (void)resetDataSource
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = objc_msgSend((id)objc_opt_class(), "managedEventCounterRequestGroups", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        v9 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
        [v9 resetEventCountersForRequestGroup:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)cloudSyncAnalysisResultForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(HMDCloudSyncAnalysisResultLogEvent);
  uint64_t v6 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  uint64_t v7 = [v6 counterGroupForName:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

  -[HMDCloudSyncAnalysisResultLogEvent setUploadMaximumDelayReached:](v5, "setUploadMaximumDelayReached:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerUploadMaximumDelayReached" forDate:v4] != 0);
  uint64_t v8 = [(HMDCloudSyncLogEventsAnalyzer *)self flagsManager];
  v26 = [v8 flagForName:@"HMDCloudSyncLogEventsAnalyzerLastDecryptionFailed" periodicity:1];

  -[HMDCloudSyncAnalysisResultLogEvent setLastDecryptionFailed:](v5, "setLastDecryptionFailed:", [v26 bitsForDate:v4 bitCount:1 outValidBitCount:0] != 0);
  -[HMDCloudSyncAnalysisResultLogEvent setIncomingPushCount:](v5, "setIncomingPushCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerIncomingPushCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setFetchCount:](v5, "setFetchCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerFetchCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyFetchCount:](v5, "setLegacyFetchCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyFetchCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setFetchErrorCount:](v5, "setFetchErrorCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerFetchErrorCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyFetchErrorCount:](v5, "setLegacyFetchErrorCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyFetchErrorCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setUploadCount:](v5, "setUploadCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerUploadCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyUploadCount:](v5, "setLegacyUploadCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setUploadErrorCount:](v5, "setUploadErrorCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerUploadErrorCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyUploadErrorCount:](v5, "setLegacyUploadErrorCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setDecryptionFailedCount:](v5, "setDecryptionFailedCount:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerDecryptionFailedCount" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setBytesFetched:](v5, "setBytesFetched:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerHomeDataBytesFetched" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setBytesPushed:](v5, "setBytesPushed:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerHomeDataBytesPushed" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyBytesFetched:](v5, "setLegacyBytesFetched:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesFetched" forDate:v4]);
  -[HMDCloudSyncAnalysisResultLogEvent setLegacyBytesPushed:](v5, "setLegacyBytesPushed:", [v7 fetchEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesPushed" forDate:v4]);
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v10 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  long long v11 = [v10 counterGroupForName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadReasonRequestGroupKey"];

  long long v12 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  long long v13 = [v12 counterGroupForName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadNoPushReasonRequestGroupKey"];

  v14 = [v11 eventCountersForDate:v4];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__HMDCloudSyncLogEventsAnalyzer_cloudSyncAnalysisResultForDate___block_invoke;
  v27[3] = &unk_1E6A122D8;
  id v28 = v13;
  id v29 = v4;
  id v30 = v9;
  id v15 = v9;
  id v16 = v4;
  id v25 = v13;
  [v14 enumerateKeysAndObjectsUsingBlock:v27];
  v17 = (void *)[v15 copy];
  [(HMDCloudSyncAnalysisResultLogEvent *)v5 setLegacyUploadReasonCountMap:v17];

  v18 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  v19 = [v18 counterGroupForName:@"HMDCloudSyncLogEventsAnalyzerUploadErrorRequestGroupKey"];
  v20 = [v19 eventCountersForDate:v16];
  [(HMDCloudSyncAnalysisResultLogEvent *)v5 setUploadErrorCountMap:v20];

  v21 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  v22 = [v21 counterGroupForName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorRequestGroupKey"];
  v23 = [v22 eventCountersForDate:v16];
  [(HMDCloudSyncAnalysisResultLogEvent *)v5 setLegacyUploadErrorCountMap:v23];

  return v5;
}

void __64__HMDCloudSyncLogEventsAnalyzer_cloudSyncAnalysisResultForDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 unsignedIntegerValue];
  if (v5 - [*(id *)(a1 + 32) fetchEventCounterForEventName:v7 forDate:*(void *)(a1 + 40)] >= 1)
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v7];
  }
}

- (void)handleRecordOperationLogEvent:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6)
  {
    int v8 = [v6 isLegacy];
    v9 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    uint64_t v10 = [v7 size];
    if (v8) {
      long long v11 = @"HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesPushed";
    }
    else {
      long long v11 = @"HMDCloudSyncLogEventsAnalyzerHomeDataBytesPushed";
    }
    [v9 incrementEventCounterForEventName:v11 requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" withValue:v10];
  }
  id v18 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v12 = v18;
  }
  else {
    long long v12 = 0;
  }
  id v13 = v12;

  if (v13)
  {
    int v14 = [v13 isLegacy];
    id v15 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    uint64_t v16 = [v13 size];
    if (v14) {
      v17 = @"HMDCloudSyncLogEventsAnalyzerLegacyHomeDataBytesFetched";
    }
    else {
      v17 = @"HMDCloudSyncLogEventsAnalyzerHomeDataBytesFetched";
    }
    [v15 incrementEventCounterForEventName:v17 requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" withValue:v16];
  }
}

- (void)handleDecryptionCompletedEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMDCloudSyncLogEventsAnalyzer *)self flagsManager];
  id v7 = [v5 flagForName:@"HMDCloudSyncLogEventsAnalyzerLastDecryptionFailed" periodicity:1];

  LODWORD(v5) = [v4 didDecryptionFail];
  if (v5)
  {
    id v6 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    [v6 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerDecryptionFailedCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    [v7 setCurrentBit];
  }
  else
  {
    [v7 clearCurrentBit];
  }
}

- (void)handleMaximumDelayLogEvent:(id)a3
{
  id v3 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  [v3 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerUploadMaximumDelayReached" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];
}

- (void)handleUploadReasonLogEvent:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 saveReason];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      int v15 = 138544386;
      uint64_t v16 = v9;
      __int16 v17 = 2114;
      id v18 = v5;
      __int16 v19 = 2048;
      uint64_t v20 = [v4 legacyPushCount];
      __int16 v21 = 2048;
      uint64_t v22 = [v4 homeZonePushCount];
      __int16 v23 = 2048;
      uint64_t v24 = [v4 homeManagerPushCount];
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@[HMDCloudSyncLogEventsAnalyzer] Received upload reason: %{public}@ Count for legacy: %ld homeZone: %ld homeManager: %ld", (uint8_t *)&v15, 0x34u);
    }
    uint64_t v10 = [v4 legacyPushCount];
    uint64_t v11 = v10;
    if (v10 < 1)
    {
      uint64_t v11 = -v10;
      long long v12 = [(HMDCloudSyncLogEventsAnalyzer *)v7 eventCountersManager];
      id v13 = [v4 saveReason];
      int v14 = @"HMDCloudSyncLogEventsAnalyzerLegacyUploadNoPushReasonRequestGroupKey";
    }
    else
    {
      long long v12 = [(HMDCloudSyncLogEventsAnalyzer *)v7 eventCountersManager];
      id v13 = [v4 saveReason];
      int v14 = @"HMDCloudSyncLogEventsAnalyzerLegacyUploadReasonRequestGroupKey";
    }
    [v12 incrementEventCounterForEventName:v13 requestGroup:v14 withValue:v11];
  }
}

- (void)handleUploadLogEvent:(id)a3
{
  id v20 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v20;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  id v7 = v6;
  if (v5)
  {
    [v6 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    int v8 = [v5 error];

    if (!v8) {
      goto LABEL_10;
    }
    v9 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    [v9 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    uint64_t v10 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    uint64_t v11 = NSString;
    long long v12 = [v5 error];
    id v13 = [v12 domain];
    int v14 = [v5 error];
    int v15 = [v11 stringWithFormat:@"%@ %tu", v13, objc_msgSend(v14, "code")];
    uint64_t v16 = @"HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorRequestGroupKey";
  }
  else
  {
    [v6 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerUploadCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    __int16 v17 = [v20 error];

    if (!v17) {
      goto LABEL_10;
    }
    id v18 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    [v18 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerUploadErrorCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    uint64_t v10 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    __int16 v19 = NSString;
    long long v12 = [v20 error];
    id v13 = [v12 domain];
    int v14 = [v20 error];
    int v15 = [v19 stringWithFormat:@"%@ %tu", v13, objc_msgSend(v14, "code")];
    uint64_t v16 = @"HMDCloudSyncLogEventsAnalyzerUploadErrorRequestGroupKey";
  }
  [v10 incrementEventCounterForEventName:v15 requestGroup:v16];

LABEL_10:
}

- (void)handleFetchLogEvent:(id)a3
{
  id v13 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v13;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
  id v7 = v6;
  if (v5)
  {
    [v6 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyFetchCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    int v8 = [v5 error];

    if (!v8) {
      goto LABEL_10;
    }
    v9 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    uint64_t v10 = v9;
    uint64_t v11 = @"HMDCloudSyncLogEventsAnalyzerLegacyFetchErrorCount";
  }
  else
  {
    [v6 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerFetchCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

    long long v12 = [v13 error];

    if (!v12) {
      goto LABEL_10;
    }
    v9 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    uint64_t v10 = v9;
    uint64_t v11 = @"HMDCloudSyncLogEventsAnalyzerFetchErrorCount";
  }
  [v9 incrementEventCounterForEventName:v11 requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];

LABEL_10:
}

- (void)handleIncomingCloudPushLogEvent:(id)a3
{
  id v4 = [a3 topic];
  int v5 = [v4 isEqualToString:@"com.apple.icloud-container.com.apple.willowd"];

  if (v5)
  {
    id v6 = [(HMDCloudSyncLogEventsAnalyzer *)self eventCountersManager];
    [v6 incrementEventCounterForEventName:@"HMDCloudSyncLogEventsAnalyzerIncomingPushCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey"];
  }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v36 = v8;
    __int16 v37 = 2112;
    uint64_t v38 = objc_opt_class();
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[CloudSyncLogEventsAnalyzer] Processing Cloud Event: %@", buf, 0x16u);
  }
  id v9 = v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    [(HMDCloudSyncLogEventsAnalyzer *)v6 handleIncomingCloudPushLogEvent:v11];
  }
  else
  {
    id v12 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      [(HMDCloudSyncLogEventsAnalyzer *)v6 handleFetchLogEvent:v14];
    }
    else
    {
      id v15 = v12;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        [(HMDCloudSyncLogEventsAnalyzer *)v6 handleUploadLogEvent:v17];
      }
      else
      {
        id v18 = v15;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          __int16 v19 = v18;
        }
        else {
          __int16 v19 = 0;
        }
        id v20 = v19;

        if (v20)
        {
          [(HMDCloudSyncLogEventsAnalyzer *)v6 handleUploadReasonLogEvent:v20];
        }
        else
        {
          id v21 = v18;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            uint64_t v22 = v21;
          }
          else {
            uint64_t v22 = 0;
          }
          id v23 = v22;

          if (v23)
          {
            [(HMDCloudSyncLogEventsAnalyzer *)v6 handleMaximumDelayLogEvent:v23];
          }
          else
          {
            id v24 = v21;
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              uint64_t v25 = v24;
            }
            else {
              uint64_t v25 = 0;
            }
            id v26 = v25;

            if (v26)
            {
              [(HMDCloudSyncLogEventsAnalyzer *)v6 handleDecryptionCompletedEvent:v26];
            }
            else
            {
              id v27 = v24;
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v28 = v27;
              }
              else {
                id v28 = 0;
              }
              id v29 = v28;

              if (v29)
              {
                [(HMDCloudSyncLogEventsAnalyzer *)v6 handleRecordOperationLogEvent:v29];
              }
              else
              {
                context = (void *)MEMORY[0x1D9452090]();
                v34 = v6;
                id v30 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  v32 = HMFGetLogIdentifier();
                  uint64_t v31 = objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  v36 = v32;
                  __int16 v37 = 2112;
                  uint64_t v38 = v31;
                  _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_ERROR, "%{public}@Event class: %@ matched none of the handlers in HMDCloudSyncLogEventsAnalyzer", buf, 0x16u);
                }
              }
            }
          }
        }
      }
    }
  }
}

- (HMDCloudSyncLogEventsAnalyzer)initWithDataSource:(id)a3
{
  v20[10] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDCloudSyncLogEventsAnalyzer;
  int v5 = [(HMDCloudSyncLogEventsAnalyzer *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 legacyCountersManager];
    eventCountersManager = v5->_eventCountersManager;
    v5->_eventCountersManager = (HMDEventCountersManager *)v6;

    uint64_t v8 = [v4 flagsManager];
    flagsManager = v5->_flagsManager;
    v5->_flagsManager = (HMDTimeBasedFlagsManager *)v8;

    uint64_t v10 = [v4 logEventSubmitter];
    logEventSubmitter = v5->_logEventSubmitter;
    v5->_logEventSubmitter = (HMMLogEventSubmitting *)v10;

    uint64_t v12 = [v4 dateProvider];
    dateProvider = v5->_dateProvider;
    v5->_dateProvider = (HMMDateProvider *)v12;

    uint64_t v14 = [v4 deviceStateProvider];
    deviceStateProvider = v5->_deviceStateProvider;
    v5->_deviceStateProvider = (HMDMetricsDeviceStateProvider *)v14;

    uint64_t v16 = [v4 logEventDispatcher];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v20[4] = objc_opt_class();
    v20[5] = objc_opt_class();
    v20[6] = objc_opt_class();
    v20[7] = objc_opt_class();
    v20[8] = objc_opt_class();
    v20[9] = objc_opt_class();
    id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:10];
    [v16 addObserver:v5 forEventClasses:v17];

    [v4 addThresholdTrigger:@"cloudSyncPushCount" forEventName:@"HMDCloudSyncLogEventsAnalyzerIncomingPushCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:100];
    [v4 addThresholdTrigger:@"cloudSyncFetchCount" forEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyFetchCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:100];
    [v4 addThresholdTrigger:@"cloudSyncFetchCountV2" forEventName:@"HMDCloudSyncLogEventsAnalyzerFetchCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:100];
    [v4 addThresholdTrigger:@"cloudSyncUploadCount" forEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:10];
    [v4 addThresholdTrigger:@"cloudSyncUploadCountV2" forEventName:@"HMDCloudSyncLogEventsAnalyzerUploadCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:10];
    [v4 addThresholdTrigger:@"cloudSyncUploadErrorCount" forEventName:@"HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:10 uploadImmediately:1];
    [v4 addThresholdTrigger:@"cloudSyncUploadErrorCountV2" forEventName:@"HMDCloudSyncLogEventsAnalyzerUploadErrorCount" requestGroup:@"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey" atThreshold:10 uploadImmediately:1];
  }

  return v5;
}

+ (id)managedEventCounterRequestGroups
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = @"HMDCloudSyncLogEventsAnalyzerOperationsRequestGroupKey";
  v4[1] = @"HMDCloudSyncLogEventsAnalyzerLegacyUploadReasonRequestGroupKey";
  v4[2] = @"HMDCloudSyncLogEventsAnalyzerLegacyUploadNoPushReasonRequestGroupKey";
  v4[3] = @"HMDCloudSyncLogEventsAnalyzerUploadErrorRequestGroupKey";
  v4[4] = @"HMDCloudSyncLogEventsAnalyzerLegacyUploadErrorRequestGroupKey";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  return v2;
}

@end