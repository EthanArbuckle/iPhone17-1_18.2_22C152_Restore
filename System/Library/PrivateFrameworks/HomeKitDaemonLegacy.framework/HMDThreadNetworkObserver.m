@interface HMDThreadNetworkObserver
+ (id)supportedEventClasses;
- (BOOL)curReport_threadNetworkUp;
- (BOOL)dailyReportingRegistered;
- (BOOL)started;
- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource;
- (HMDEventCountersManager)countersManager;
- (HMDThreadNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7;
- (HMDThreadNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7 notificationCenter:(id)a8;
- (HMMDateProvider)dateProvider;
- (HMMLogEventDispatching)logEventDispatcher;
- (NSDate)curReport_threadNetworkLastDownTime;
- (NSDate)curReport_threadNetworkLastUpTime;
- (NSMutableDictionary)curReport_topReadWriteErrors;
- (NSMutableDictionary)curReport_topSessionErrors;
- (NSNotificationCenter)notificationCenter;
- (double)curReport_threadNetworkDownDuration;
- (double)curReport_threadNetworkUpDuration;
- (id)_keyOfLargestCountInHistogram:(id)a3;
- (id)counterGroupForName:(id)a3 homeUUID:(id)a4 date:(id)a5;
- (id)logEventForHomeWithUUID:(id)a3 associatedWithDate:(id)a4 isDailySummary:(BOOL)a5;
- (unint64_t)curReport_maxSimuIPPrefixes;
- (unint64_t)curReport_numAdvertisedBRs;
- (unint64_t)curReport_numAppleBRs;
- (unint64_t)curReport_numThirdPartyBRs;
- (unint64_t)curReport_numThreadNetworks;
- (unint64_t)curReport_readErrorCount;
- (unint64_t)curReport_readWritesCount;
- (unint64_t)curReport_reportDuration;
- (unint64_t)curReport_rxSuccess;
- (unint64_t)curReport_rxTotal;
- (unint64_t)curReport_txDelayAvg;
- (unint64_t)curReport_txSuccess;
- (unint64_t)curReport_txTotal;
- (unint64_t)curReport_writeErrorCount;
- (void)_handleAccessorySessionEvent:(id)a3;
- (void)_handleReadWriteLogEvent:(id)a3;
- (void)_incrementError:(id)a3 forHistogram:(id)a4 byValue:(unint64_t)a5;
- (void)_injectThreadNetworkStateForTestingWithNumAdvertisedBRs:(unint64_t)a3 numAppleBRs:(unint64_t)a4 numThirdPartyBRs:(unint64_t)a5 numThreadNetworks:(unint64_t)a6 maxSimuIPPrefixesDetected:(unint64_t)a7 txTotal:(unint64_t)a8 txSuccess:(unint64_t)a9 txDelayAvg:(unint64_t)a10 rxTotal:(unint64_t)a11 rxSuccess:(unint64_t)a12 reportDuration:(unint64_t)a13 reportDate:(id)a14 reportDailySummary:(BOOL)a15;
- (void)_runLoggingForDate:(id)a3 isDailySummary:(BOOL)a4;
- (void)_setDailyScheduler:(id)a3;
- (void)_updateDailyCountersAndResetCurrentReportStatsForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)runDailyTask;
- (void)setCurReport_maxSimuIPPrefixes:(unint64_t)a3;
- (void)setCurReport_numAdvertisedBRs:(unint64_t)a3;
- (void)setCurReport_numAppleBRs:(unint64_t)a3;
- (void)setCurReport_numThirdPartyBRs:(unint64_t)a3;
- (void)setCurReport_numThreadNetworks:(unint64_t)a3;
- (void)setCurReport_readErrorCount:(unint64_t)a3;
- (void)setCurReport_readWritesCount:(unint64_t)a3;
- (void)setCurReport_reportDuration:(unint64_t)a3;
- (void)setCurReport_rxSuccess:(unint64_t)a3;
- (void)setCurReport_rxTotal:(unint64_t)a3;
- (void)setCurReport_threadNetworkDownDuration:(double)a3;
- (void)setCurReport_threadNetworkLastDownTime:(id)a3;
- (void)setCurReport_threadNetworkLastUpTime:(id)a3;
- (void)setCurReport_threadNetworkUp:(BOOL)a3;
- (void)setCurReport_threadNetworkUpDuration:(double)a3;
- (void)setCurReport_txDelayAvg:(unint64_t)a3;
- (void)setCurReport_txSuccess:(unint64_t)a3;
- (void)setCurReport_txTotal:(unint64_t)a3;
- (void)setCurReport_writeErrorCount:(unint64_t)a3;
- (void)start;
- (void)stop;
@end

@implementation HMDThreadNetworkObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curReport_topSessionErrors, 0);
  objc_storeStrong((id *)&self->_curReport_topReadWriteErrors, 0);
  objc_storeStrong((id *)&self->_curReport_threadNetworkLastDownTime, 0);
  objc_storeStrong((id *)&self->_curReport_threadNetworkLastUpTime, 0);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_destroyWeak((id *)&self->_currentHomeDataSource);
  objc_destroyWeak((id *)&self->_notificationCenter);
  objc_destroyWeak((id *)&self->_countersManager);
  objc_destroyWeak((id *)&self->_logEventDispatcher);
}

- (BOOL)dailyReportingRegistered
{
  return self->_dailyReportingRegistered;
}

- (BOOL)started
{
  return self->_started;
}

- (NSMutableDictionary)curReport_topSessionErrors
{
  return self->_curReport_topSessionErrors;
}

- (NSMutableDictionary)curReport_topReadWriteErrors
{
  return self->_curReport_topReadWriteErrors;
}

- (void)setCurReport_writeErrorCount:(unint64_t)a3
{
  self->_curReport_writeErrorCount = a3;
}

- (unint64_t)curReport_writeErrorCount
{
  return self->_curReport_writeErrorCount;
}

- (void)setCurReport_readErrorCount:(unint64_t)a3
{
  self->_curReport_readErrorCount = a3;
}

- (unint64_t)curReport_readErrorCount
{
  return self->_curReport_readErrorCount;
}

- (void)setCurReport_readWritesCount:(unint64_t)a3
{
  self->_curReport_readWritesCount = a3;
}

- (unint64_t)curReport_readWritesCount
{
  return self->_curReport_readWritesCount;
}

- (void)setCurReport_threadNetworkLastDownTime:(id)a3
{
}

- (NSDate)curReport_threadNetworkLastDownTime
{
  return self->_curReport_threadNetworkLastDownTime;
}

- (void)setCurReport_threadNetworkLastUpTime:(id)a3
{
}

- (NSDate)curReport_threadNetworkLastUpTime
{
  return self->_curReport_threadNetworkLastUpTime;
}

- (void)setCurReport_threadNetworkDownDuration:(double)a3
{
  self->_curReport_threadNetworkDownDuration = a3;
}

- (double)curReport_threadNetworkDownDuration
{
  return self->_curReport_threadNetworkDownDuration;
}

- (void)setCurReport_threadNetworkUpDuration:(double)a3
{
  self->_curReport_threadNetworkUpDuration = a3;
}

- (double)curReport_threadNetworkUpDuration
{
  return self->_curReport_threadNetworkUpDuration;
}

- (void)setCurReport_threadNetworkUp:(BOOL)a3
{
  self->_curReport_threadNetworkUp = a3;
}

- (BOOL)curReport_threadNetworkUp
{
  return self->_curReport_threadNetworkUp;
}

- (void)setCurReport_reportDuration:(unint64_t)a3
{
  self->_curReport_reportDuration = a3;
}

- (unint64_t)curReport_reportDuration
{
  return self->_curReport_reportDuration;
}

- (void)setCurReport_rxSuccess:(unint64_t)a3
{
  self->_curReport_rxSuccess = a3;
}

- (unint64_t)curReport_rxSuccess
{
  return self->_curReport_rxSuccess;
}

- (void)setCurReport_rxTotal:(unint64_t)a3
{
  self->_curReport_rxTotal = a3;
}

- (unint64_t)curReport_rxTotal
{
  return self->_curReport_rxTotal;
}

- (void)setCurReport_txDelayAvg:(unint64_t)a3
{
  self->_curReport_txDelayAvg = a3;
}

- (unint64_t)curReport_txDelayAvg
{
  return self->_curReport_txDelayAvg;
}

- (void)setCurReport_txSuccess:(unint64_t)a3
{
  self->_curReport_txSuccess = a3;
}

- (unint64_t)curReport_txSuccess
{
  return self->_curReport_txSuccess;
}

- (void)setCurReport_txTotal:(unint64_t)a3
{
  self->_curReport_txTotal = a3;
}

- (unint64_t)curReport_txTotal
{
  return self->_curReport_txTotal;
}

- (void)setCurReport_maxSimuIPPrefixes:(unint64_t)a3
{
  self->_curReport_maxSimuIPPrefixes = a3;
}

- (unint64_t)curReport_maxSimuIPPrefixes
{
  return self->_curReport_maxSimuIPPrefixes;
}

- (void)setCurReport_numThreadNetworks:(unint64_t)a3
{
  self->_curReport_numThreadNetworks = a3;
}

- (unint64_t)curReport_numThreadNetworks
{
  return self->_curReport_numThreadNetworks;
}

- (void)setCurReport_numThirdPartyBRs:(unint64_t)a3
{
  self->_curReport_numThirdPartyBRs = a3;
}

- (unint64_t)curReport_numThirdPartyBRs
{
  return self->_curReport_numThirdPartyBRs;
}

- (void)setCurReport_numAppleBRs:(unint64_t)a3
{
  self->_curReport_numAppleBRs = a3;
}

- (unint64_t)curReport_numAppleBRs
{
  return self->_curReport_numAppleBRs;
}

- (void)setCurReport_numAdvertisedBRs:(unint64_t)a3
{
  self->_curReport_numAdvertisedBRs = a3;
}

- (unint64_t)curReport_numAdvertisedBRs
{
  return self->_curReport_numAdvertisedBRs;
}

- (HMMDateProvider)dateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateProvider);
  return (HMMDateProvider *)WeakRetained;
}

- (HMDCurrentResidentDeviceDataSource)currentHomeDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHomeDataSource);
  return (HMDCurrentResidentDeviceDataSource *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_notificationCenter);
  return (NSNotificationCenter *)WeakRetained;
}

- (HMDEventCountersManager)countersManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_countersManager);
  return (HMDEventCountersManager *)WeakRetained;
}

- (HMMLogEventDispatching)logEventDispatcher
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logEventDispatcher);
  return (HMMLogEventDispatching *)WeakRetained;
}

- (void)_injectThreadNetworkStateForTestingWithNumAdvertisedBRs:(unint64_t)a3 numAppleBRs:(unint64_t)a4 numThirdPartyBRs:(unint64_t)a5 numThreadNetworks:(unint64_t)a6 maxSimuIPPrefixesDetected:(unint64_t)a7 txTotal:(unint64_t)a8 txSuccess:(unint64_t)a9 txDelayAvg:(unint64_t)a10 rxTotal:(unint64_t)a11 rxSuccess:(unint64_t)a12 reportDuration:(unint64_t)a13 reportDate:(id)a14 reportDailySummary:(BOOL)a15
{
  id v22 = a14;
  [(HMDThreadNetworkObserver *)self setCurReport_numAdvertisedBRs:a3];
  [(HMDThreadNetworkObserver *)self setCurReport_numAppleBRs:a4];
  [(HMDThreadNetworkObserver *)self setCurReport_numThirdPartyBRs:a5];
  [(HMDThreadNetworkObserver *)self setCurReport_numThreadNetworks:a6];
  [(HMDThreadNetworkObserver *)self setCurReport_maxSimuIPPrefixes:a7];
  [(HMDThreadNetworkObserver *)self setCurReport_txTotal:a8];
  [(HMDThreadNetworkObserver *)self setCurReport_txSuccess:a9];
  [(HMDThreadNetworkObserver *)self setCurReport_txDelayAvg:a10];
  [(HMDThreadNetworkObserver *)self setCurReport_rxTotal:a11];
  [(HMDThreadNetworkObserver *)self setCurReport_rxSuccess:a12];
  [(HMDThreadNetworkObserver *)self setCurReport_reportDuration:a13];
  [(HMDThreadNetworkObserver *)self _runLoggingForDate:v22 isDailySummary:a15];
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDThreadNetworkObserver *)self countersManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HMDThreadNetworkObserver_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_1E6A197A0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

uint64_t __52__HMDThreadNetworkObserver_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 groupName];
  if (v5)
  {
    v7 = [v5 date];
    if ([v7 compare:*(void *)(a1 + 32)] == 1)
    {
      if (([v6 isEqual:@"ThreadNetworkStabilityEventGroup"] & 1) != 0
        || ([v6 isEqual:@"ReadWriteErrorEventGroup_ThreadReporting"] & 1) != 0)
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = [v6 isEqual:@"AccessorySessionErrorGroup_ThreadReporting"];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDThreadNetworkObserver *)self countersManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__HMDThreadNetworkObserver_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_1E6A197A0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

uint64_t __53__HMDThreadNetworkObserver_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = [v5 groupName];
  if (v5)
  {
    v7 = [v5 date];
    if ([v7 compare:*(void *)(a1 + 32)] == -1)
    {
      if (([v6 isEqual:@"ThreadNetworkStabilityEventGroup"] & 1) != 0
        || ([v6 isEqual:@"ReadWriteErrorEventGroup_ThreadReporting"] & 1) != 0)
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = [v6 isEqual:@"AccessorySessionErrorGroup_ThreadReporting"];
      }
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_keyOfLargestCountInHistogram:(id)a3
{
  id v3 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__176122;
  v11 = __Block_byref_object_dispose__176123;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__HMDThreadNetworkObserver__keyOfLargestCountInHistogram___block_invoke;
  v6[3] = &unk_1E6A19778;
  v6[4] = v13;
  v6[5] = &v7;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(v13, 8);
  return v4;
}

void __58__HMDThreadNetworkObserver__keyOfLargestCountInHistogram___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) < (unint64_t)[v6 unsignedIntValue])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 unsignedIntValue];
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

- (void)_incrementError:(id)a3 forHistogram:(id)a4 byValue:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  id v11 = v9;
  if (v9) {
    objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v9, "unsignedLongValue") + a5);
  }
  else {
  v10 = [NSNumber numberWithUnsignedInteger:a5];
  }
  [v7 setObject:v10 forKeyedSubscript:v8];
}

- (void)_updateDailyCountersAndResetCurrentReportStatsForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDThreadNetworkObserver *)self countersManager];
  uint64_t v9 = +[HMDDateCounterGroupSpecifier specifierWithGroupName:@"ThreadNetworkStabilityEventGroup" date:v7];
  v10 = [v8 objectForKeyedSubscript:v9];

  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ThreadNetwork_txTotal", -[HMDThreadNetworkObserver curReport_txTotal](self, "curReport_txTotal"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ThreadNetwork_txSuccess", -[HMDThreadNetworkObserver curReport_txSuccess](self, "curReport_txSuccess"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ThreadNetwork_rxTotal", -[HMDThreadNetworkObserver curReport_rxTotal](self, "curReport_rxTotal"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ThreadNetwork_rxSuccess", -[HMDThreadNetworkObserver curReport_rxSuccess](self, "curReport_rxSuccess"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ThreadNetwork_reportDuration", -[HMDThreadNetworkObserver curReport_reportDuration](self, "curReport_reportDuration"));
  [(HMDThreadNetworkObserver *)self curReport_threadNetworkUpDuration];
  [v10 incrementEventCounterForEventName:@"ThreadNetwork_uptime" withValue:v11];
  [(HMDThreadNetworkObserver *)self curReport_threadNetworkDownDuration];
  [v10 incrementEventCounterForEventName:@"ThreadNetwork_downtime" withValue:v12];
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numAdvertisedBRs](self, "curReport_numAdvertisedBRs"), @"ThreadNetwork_numAdvertisedBRs");
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numAppleBRs](self, "curReport_numAppleBRs"), @"ThreadNetwork_numAppleBRs");
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numThirdPartyBRs](self, "curReport_numThirdPartyBRs"), @"ThreadNetwork_numThirdPartyBRs");
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_numThreadNetworks](self, "curReport_numThreadNetworks"), @"ThreadNetwork_numThreadNetworks");
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_maxSimuIPPrefixes](self, "curReport_maxSimuIPPrefixes"), @"ThreadNetwork_maxSimuIPPrefixes");
  objc_msgSend(v10, "addValue:toStatisticsName:", -[HMDThreadNetworkObserver curReport_txDelayAvg](self, "curReport_txDelayAvg"), @"ThreadNetwork_txDelayAvg");
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ReadWriteCount_ThreadReporting", -[HMDThreadNetworkObserver curReport_readWritesCount](self, "curReport_readWritesCount"));
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"ReadErrorCount_ThreadReporting", -[HMDThreadNetworkObserver curReport_readErrorCount](self, "curReport_readErrorCount"));
  v37 = v10;
  objc_msgSend(v10, "incrementEventCounterForEventName:withValue:", @"WriteErrorCount_ThreadReporting", -[HMDThreadNetworkObserver curReport_writeErrorCount](self, "curReport_writeErrorCount"));
  v38 = v7;
  v39 = v6;
  v13 = [(HMDThreadNetworkObserver *)self counterGroupForName:@"ReadWriteErrorEventGroup_ThreadReporting" homeUUID:v6 date:v7];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v14 = [(HMDThreadNetworkObserver *)self curReport_topReadWriteErrors];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    v17 = 0;
    uint64_t v18 = *(void *)v45;
    do
    {
      uint64_t v19 = 0;
      v20 = v17;
      do
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v14);
        }
        uint64_t v21 = *(void *)(*((void *)&v44 + 1) + 8 * v19);
        id v22 = [(HMDThreadNetworkObserver *)self curReport_topReadWriteErrors];
        v17 = [v22 objectForKey:v21];

        objc_msgSend(v13, "incrementEventCounterForEventName:withValue:", v21, objc_msgSend(v17, "unsignedIntValue"));
        ++v19;
        v20 = v17;
      }
      while (v16 != v19);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v16);
  }
  else
  {
    v17 = 0;
  }
  v36 = v13;

  v23 = [(HMDThreadNetworkObserver *)self counterGroupForName:@"AccessorySessionErrorGroup_ThreadReporting" homeUUID:v39 date:v38];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  v24 = [(HMDThreadNetworkObserver *)self curReport_topSessionErrors];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v28 = 0;
      v29 = v17;
      do
      {
        if (*(void *)v41 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v30 = *(void *)(*((void *)&v40 + 1) + 8 * v28);
        v31 = [(HMDThreadNetworkObserver *)self curReport_topSessionErrors];
        v17 = [v31 objectForKey:v30];

        objc_msgSend(v23, "incrementEventCounterForEventName:withValue:", v30, objc_msgSend(v17, "unsignedIntValue"));
        ++v28;
        v29 = v17;
      }
      while (v26 != v28);
      uint64_t v26 = [v24 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v26);
  }

  [(HMDThreadNetworkObserver *)self setCurReport_readWritesCount:0];
  [(HMDThreadNetworkObserver *)self setCurReport_readErrorCount:0];
  [(HMDThreadNetworkObserver *)self setCurReport_writeErrorCount:0];
  v32 = [(HMDThreadNetworkObserver *)self curReport_topReadWriteErrors];
  [v32 removeAllObjects];

  v33 = [(HMDThreadNetworkObserver *)self curReport_topSessionErrors];
  [v33 removeAllObjects];

  [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkUpDuration:0.0];
  [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkDownDuration:0.0];
  if ([(HMDThreadNetworkObserver *)self curReport_threadNetworkUp])
  {
    v34 = [MEMORY[0x1E4F1C9C8] now];
    [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkLastUpTime:v34];

    [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkLastDownTime:0];
  }
  else
  {
    [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkLastUpTime:0];
    v35 = [MEMORY[0x1E4F1C9C8] now];
    [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkLastDownTime:v35];
  }
}

- (id)logEventForHomeWithUUID:(id)a3 associatedWithDate:(id)a4 isDailySummary:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(HMDThreadNetworkObserver *)self currentHomeDataSource];
  double v11 = [v10 homeUUIDForCurrentResidentDevice];
  int v12 = objc_msgSend(v8, "hmf_isEqualToUUID:", v11);

  if (v12)
  {
    id v67 = v9;
    if (v5)
    {
      v13 = [(HMDThreadNetworkObserver *)self countersManager];
      v14 = +[HMDDateCounterGroupSpecifier specifierWithGroupName:@"ThreadNetworkStabilityEventGroup" date:v9];
      uint64_t v15 = [v13 objectForKeyedSubscript:v14];

      uint64_t v16 = [(HMDThreadNetworkObserver *)self counterGroupForName:@"ReadWriteErrorEventGroup_ThreadReporting" homeUUID:v8 date:v9];
      v17 = [(HMDThreadNetworkObserver *)self counterGroupForName:@"AccessorySessionErrorGroup_ThreadReporting" homeUUID:v8 date:v9];
      uint64_t v58 = [v15 fetchEventCounterForEventName:@"ReadWriteCount_ThreadReporting"];
      uint64_t v65 = [v15 fetchEventCounterForEventName:@"ReadErrorCount_ThreadReporting"];
      uint64_t v64 = [v15 fetchEventCounterForEventName:@"WriteErrorCount_ThreadReporting"];
      v69[0] = 0;
      [v16 maxCounterName:v69];
      id v57 = v69[0];
      id v68 = 0;
      [v17 maxCounterName:&v68];
      id v56 = v68;
      uint64_t v66 = objc_msgSend(v17, "fetchEventCounterForEventName:");
      uint64_t v55 = [v15 fetchMaxValueForStatisticsName:@"ThreadNetwork_numAdvertisedBRs"];
      uint64_t v54 = [v15 fetchMaxValueForStatisticsName:@"ThreadNetwork_numAppleBRs"];
      uint64_t v63 = [v15 fetchMaxValueForStatisticsName:@"ThreadNetwork_numThirdPartyBRs"];
      uint64_t v62 = [v15 fetchMaxValueForStatisticsName:@"ThreadNetwork_numThreadNetworks"];
      uint64_t v61 = [v15 fetchMaxValueForStatisticsName:@"ThreadNetwork_maxSimuIPPrefixes"];
      uint64_t v60 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_txTotal"];
      uint64_t v59 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_txSuccess"];
      uint64_t v18 = [v15 fetchMaxValueForStatisticsName:@"ThreadNetwork_txDelayAvg"];
      uint64_t v19 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_rxTotal"];
      uint64_t v20 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_rxSuccess"];
      uint64_t v21 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_reportDuration"];
      unint64_t v22 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_uptime"];
      unint64_t v23 = [v15 fetchEventCounterForEventName:@"ThreadNetwork_downtime"];

      v24 = @"Daily Metrics";
    }
    else
    {
      uint64_t v58 = [(HMDThreadNetworkObserver *)self curReport_readWritesCount];
      unint64_t v26 = [(HMDThreadNetworkObserver *)self curReport_readErrorCount];
      unint64_t v27 = [(HMDThreadNetworkObserver *)self curReport_writeErrorCount];
      uint64_t v28 = [(HMDThreadNetworkObserver *)self curReport_topReadWriteErrors];
      uint64_t v29 = [(HMDThreadNetworkObserver *)self _keyOfLargestCountInHistogram:v28];

      uint64_t v30 = [(HMDThreadNetworkObserver *)self curReport_topSessionErrors];
      uint64_t v31 = [(HMDThreadNetworkObserver *)self _keyOfLargestCountInHistogram:v30];

      id v57 = (id)v29;
      if (v31)
      {
        v32 = [(HMDThreadNetworkObserver *)self curReport_topSessionErrors];
        v33 = [v32 objectForKeyedSubscript:v31];
        uint64_t v66 = [v33 unsignedIntValue];
      }
      else
      {
        uint64_t v66 = 0;
      }
      unint64_t v34 = [(HMDThreadNetworkObserver *)self curReport_numAdvertisedBRs];
      unint64_t v35 = [(HMDThreadNetworkObserver *)self curReport_numAppleBRs];
      unint64_t v36 = [(HMDThreadNetworkObserver *)self curReport_numThirdPartyBRs];
      uint64_t v62 = [(HMDThreadNetworkObserver *)self curReport_numThreadNetworks];
      uint64_t v61 = [(HMDThreadNetworkObserver *)self curReport_maxSimuIPPrefixes];
      uint64_t v60 = [(HMDThreadNetworkObserver *)self curReport_txTotal];
      uint64_t v59 = [(HMDThreadNetworkObserver *)self curReport_txSuccess];
      unint64_t v53 = [(HMDThreadNetworkObserver *)self curReport_txDelayAvg];
      unint64_t v52 = [(HMDThreadNetworkObserver *)self curReport_rxTotal];
      uint64_t v20 = [(HMDThreadNetworkObserver *)self curReport_rxSuccess];
      unint64_t v37 = [(HMDThreadNetworkObserver *)self curReport_reportDuration];
      uint64_t v64 = v27;
      uint64_t v65 = v26;
      uint64_t v63 = v36;
      unint64_t v38 = v35;
      unint64_t v39 = v34;
      if ([(HMDThreadNetworkObserver *)self curReport_threadNetworkUp])
      {
        long long v40 = [(HMDThreadNetworkObserver *)self curReport_threadNetworkLastUpTime];
        [v40 timeIntervalSinceNow];
        double v42 = fabs(v41);
        [(HMDThreadNetworkObserver *)self curReport_threadNetworkUpDuration];
        [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkUpDuration:v43 + v42];
      }
      else
      {
        long long v40 = [(HMDThreadNetworkObserver *)self curReport_threadNetworkLastDownTime];
        [v40 timeIntervalSinceNow];
        double v45 = fabs(v44);
        [(HMDThreadNetworkObserver *)self curReport_threadNetworkDownDuration];
        [(HMDThreadNetworkObserver *)self setCurReport_threadNetworkDownDuration:v46 + v45];
      }
      uint64_t v54 = v38;
      uint64_t v55 = v39;
      id v56 = (id)v31;

      [(HMDThreadNetworkObserver *)self curReport_threadNetworkUpDuration];
      unint64_t v22 = v47;
      [(HMDThreadNetworkObserver *)self curReport_threadNetworkDownDuration];
      unint64_t v23 = v48;
      [(HMDThreadNetworkObserver *)self _updateDailyCountersAndResetCurrentReportStatsForHomeWithUUID:v8 associatedWithDate:v67];
      v24 = @"Periodic Snapshot";
      uint64_t v19 = v52;
      uint64_t v18 = v53;
      uint64_t v21 = v37;
    }
    v49 = [HMDThreadNetworkStabilityLogEvent alloc];
    uint64_t v50 = [[HMDThreadNetworkStatusReport alloc] initWithNumAdvertisedBRs:v55 numAppleBRs:v54 numThirdPartyBRs:v63 numThreadNetworks:v62 maxSimuIPPrefixesDetected:v61 txTotal:v60 txSuccess:v59 txDelayAvg:v18 rxTotal:v19 rxSuccess:v20 reportDuration:v21];
    uint64_t v25 = [(HMDThreadNetworkStabilityLogEvent *)v49 initWithHomeUUID:v8 threadNetworkStatusReport:v50 threadNetworkUptime:v22 / 0x3C threadNetworkDowntime:v23 / 0x3C numReadWrites:v58 numReadErrors:v65 numWriteErrors:v64 topReadWriteError:v57 topSessionError:v56 numSessionErrors:v66 logTriggerReason:v24];

    id v9 = v67;
  }
  else
  {
    uint64_t v25 = 0;
  }

  return v25;
}

- (void)_runLoggingForDate:(id)a3 isDailySummary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDThreadNetworkObserver *)self currentHomeDataSource];
  id v8 = [v7 homeUUIDForCurrentResidentDevice];

  id v9 = [(HMDThreadNetworkObserver *)self logEventForHomeWithUUID:v8 associatedWithDate:v6 isDailySummary:v4];
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    double v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [v9 serializedLogEvent];
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2112;
      uint64_t v19 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Submitting HMDThreadNetworkStabilityLogEvent: %@", (uint8_t *)&v16, 0x16u);
    }
    uint64_t v15 = [(HMDThreadNetworkObserver *)v11 logEventDispatcher];
    [v15 submitLogEvent:v9];
  }
}

- (void)runDailyTask
{
  id v3 = [(HMDThreadNetworkObserver *)self dateProvider];
  id v4 = [v3 startOfDayByAddingDayCount:-1];

  [(HMDThreadNetworkObserver *)self _runLoggingForDate:v4 isDailySummary:1];
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v9;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  if (v5)
  {
    [(HMDThreadNetworkObserver *)self _handleReadWriteLogEvent:v5];
  }
  else
  {
    id v6 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }
    id v8 = v7;

    if (!v8) {
      goto LABEL_12;
    }
    [(HMDThreadNetworkObserver *)self _handleAccessorySessionEvent:v8];
  }

LABEL_12:
}

- (void)_handleAccessorySessionEvent:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 topErrorDomain];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [v13 expectedTransport];
    int v7 = [v6 isEqual:@"Thread"];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1E4F28C58];
      id v9 = [v13 topErrorDomain];
      v10 = objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, objc_msgSend(v13, "topErrorCode"), 0);
      double v11 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v10];

      int v12 = [(HMDThreadNetworkObserver *)self curReport_topSessionErrors];
      -[HMDThreadNetworkObserver _incrementError:forHistogram:byValue:](self, "_incrementError:forHistogram:byValue:", v11, v12, [v13 sessionFailures]);
    }
  }
}

- (void)_handleReadWriteLogEvent:(id)a3
{
  id v10 = a3;
  [(HMDThreadNetworkObserver *)self setCurReport_readWritesCount:[(HMDThreadNetworkObserver *)self curReport_readWritesCount] + 1];
  uint64_t v4 = [v10 error];
  if (v4)
  {
    id v5 = (void *)v4;
    int v6 = [v10 isThreadAccessory];

    if (v6)
    {
      if ([v10 isWriteOperation]) {
        [(HMDThreadNetworkObserver *)self setCurReport_writeErrorCount:[(HMDThreadNetworkObserver *)self curReport_writeErrorCount] + 1];
      }
      else {
        [(HMDThreadNetworkObserver *)self setCurReport_readErrorCount:[(HMDThreadNetworkObserver *)self curReport_readErrorCount] + 1];
      }
      int v7 = [v10 error];
      id v8 = +[HMDLogEventErrorEventsAnalyzer eventCounterNameForError:v7];

      id v9 = [(HMDThreadNetworkObserver *)self curReport_topReadWriteErrors];
      [(HMDThreadNetworkObserver *)self _incrementError:v8 forHistogram:v9 byValue:1];

      if ([v10 isSentOverThread]) {
        -[HMDThreadNetworkObserver requestThreadNetworkStateCaptureForAccessory:failingScenario:](self, "requestThreadNetworkStateCaptureForAccessory:failingScenario:", 0, [v10 isWriteOperation]);
      }
    }
  }
}

- (id)counterGroupForName:(id)a3 homeUUID:(id)a4 date:(id)a5
{
  if (a4)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    double v11 = [(HMDThreadNetworkObserver *)self countersManager];
    int v12 = +[HMDHouseholdDataEventCounterGroupSpecifier specifierWithGroupName:v10 homeUUID:v9 date:v8];

    id v13 = [v11 objectForKeyedSubscript:v12];
  }
  else
  {
    id v13 = 0;
  }
  return v13;
}

- (void)stop
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_started)
  {
    id v3 = (void *)MEMORY[0x1D9452090]();
    uint64_t v4 = self;
    id v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping", (uint8_t *)&v7, 0xCu);
    }
    self->_started = 0;
  }
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  uint64_t v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = HMFGetLogIdentifier();
    int v11 = 138543362;
    int v12 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting", (uint8_t *)&v11, 0xCu);
  }
  int v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = v4;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    id v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    int v12 = v10;
    _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@This device does not support Thread network stability reporting", (uint8_t *)&v11, 0xCu);
  }
  v8->_started = 1;
}

- (void)_setDailyScheduler:(id)a3
{
  if (!self->_dailyReportingRegistered)
  {
    self->_dailyReportingRegistered = 1;
    [a3 registerDailyTaskRunner:self];
  }
}

- (HMDThreadNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7 notificationCenter:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)HMDThreadNetworkObserver;
  __int16 v18 = [(HMDThreadNetworkObserver *)&v27 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_logEventDispatcher, v13);
    objc_storeWeak((id *)&v19->_countersManager, v14);
    objc_storeWeak((id *)&v19->_notificationCenter, v17);
    objc_storeWeak((id *)&v19->_currentHomeDataSource, v15);
    objc_storeWeak((id *)&v19->_dateProvider, v16);
    v19->_curReport_threadNetworkUp = 0;
    *(_OWORD *)&v19->_curReport_numAdvertisedBRs = 0u;
    *(_OWORD *)&v19->_curReport_numThirdPartyBRs = 0u;
    *(_OWORD *)&v19->_curReport_maxSimuIPPrefixes = 0u;
    *(_OWORD *)&v19->_curReport_txSuccess = 0u;
    *(_OWORD *)&v19->_curReport_rxTotal = 0u;
    *(_OWORD *)&v19->_curReport_reportDuration = 0u;
    curReport_threadNetworkLastUpTime = v19->_curReport_threadNetworkLastUpTime;
    v19->_curReport_threadNetworkDownDuration = 0.0;
    v19->_curReport_threadNetworkLastUpTime = 0;

    curReport_threadNetworkLastDownTime = v19->_curReport_threadNetworkLastDownTime;
    v19->_curReport_threadNetworkLastDownTime = 0;

    v19->_curReport_readWritesCount = 0;
    v19->_curReport_readErrorCount = 0;
    v19->_curReport_writeErrorCount = 0;
    unint64_t v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    curReport_topReadWriteErrors = v19->_curReport_topReadWriteErrors;
    v19->_curReport_topReadWriteErrors = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    curReport_topSessionErrors = v19->_curReport_topSessionErrors;
    v19->_curReport_topSessionErrors = v24;

    *(_WORD *)&v19->_started = 0;
  }

  return v19;
}

- (HMDThreadNetworkObserver)initWithLogEventDispatcher:(id)a3 countersManager:(id)a4 dailyScheduler:(id)a5 currentHomeDataSource:(id)a6 dateProvider:(id)a7
{
  int v12 = (void *)MEMORY[0x1E4F28EB8];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  __int16 v18 = [v12 defaultCenter];
  uint64_t v19 = [(HMDThreadNetworkObserver *)self initWithLogEventDispatcher:v17 countersManager:v16 dailyScheduler:v15 currentHomeDataSource:v14 dateProvider:v13 notificationCenter:v18];

  return v19;
}

+ (id)supportedEventClasses
{
  if (supportedEventClasses_onceToken_176182 != -1) {
    dispatch_once(&supportedEventClasses_onceToken_176182, &__block_literal_global_176183);
  }
  v2 = (void *)supportedEventClasses_supportedEventClasses_176184;
  return v2;
}

void __49__HMDThreadNetworkObserver_supportedEventClasses__block_invoke()
{
  v2[2] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:2];
  v1 = (void *)supportedEventClasses_supportedEventClasses_176184;
  supportedEventClasses_supportedEventClasses_176184 = v0;
}

@end