@interface HMDLogEventCountingAnalyzer
- (HMDEventCounterGroup)currentDayCountersGroup;
- (HMDEventCountersManager)countersManager;
- (HMDLogEventCountingAnalyzer)initWithEventCountersManager:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5 systemInfo:(id)a6 queue:(id)a7;
- (HMDLogEventCountingAnalyzer)initWithEventCountersManager:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5 systemInfo:(id)a6 queue:(id)a7 loggingPeriodicitySeconds:(unint64_t)a8 tickSecondsProviderBlock:(id)a9 periodicCountersLoggingBlock:(id)a10;
- (HMMDateProvider)dateProvider;
- (NSMutableDictionary)currentPeriodCounters;
- (NSString)serialNumber;
- (OS_dispatch_queue)queue;
- (id)periodicCountersSnapshotBlock;
- (id)periodicSnapshotAtCurrentTickSeconds:(unint64_t)a3;
- (id)tickSecondsProviderBlock;
- (unint64_t)loggingPeriodicitySeconds;
- (unint64_t)tickSecondsLastLogged;
- (void)deleteCountersAfterDate:(id)a3;
- (void)deleteCountersBeforeDate:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3;
- (void)didReceiveEventFromDispatcher:(id)a3 withCurrentTickSeconds:(unint64_t)a4;
- (void)incrementDailyCountersForEventName:(id)a3;
- (void)incrementPeriodicCountersForEventName:(id)a3;
- (void)runDailyTask;
- (void)setCurrentDayCountersGroup:(id)a3;
- (void)setTickSecondsLastLogged:(unint64_t)a3;
@end

@implementation HMDLogEventCountingAnalyzer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDayCountersGroup, 0);
  objc_storeStrong((id *)&self->_countersManager, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong(&self->_periodicCountersSnapshotBlock, 0);
  objc_storeStrong(&self->_tickSecondsProviderBlock, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_currentPeriodCounters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setCurrentDayCountersGroup:(id)a3
{
}

- (HMDEventCountersManager)countersManager
{
  return self->_countersManager;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setTickSecondsLastLogged:(unint64_t)a3
{
  self->_tickSecondsLastLogged = a3;
}

- (unint64_t)tickSecondsLastLogged
{
  return self->_tickSecondsLastLogged;
}

- (unint64_t)loggingPeriodicitySeconds
{
  return self->_loggingPeriodicitySeconds;
}

- (id)periodicCountersSnapshotBlock
{
  return self->_periodicCountersSnapshotBlock;
}

- (id)tickSecondsProviderBlock
{
  return self->_tickSecondsProviderBlock;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (NSMutableDictionary)currentPeriodCounters
{
  return self->_currentPeriodCounters;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (void)deleteCountersAfterDate:(id)a3
{
  id v4 = a3;
  v5 = [(HMDLogEventCountingAnalyzer *)self countersManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HMDLogEventCountingAnalyzer_deleteCountersAfterDate___block_invoke;
  v7[3] = &unk_264A26DA0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

BOOL __55__HMDLogEventCountingAnalyzer_deleteCountersAfterDate___block_invoke(uint64_t a1, void *a2)
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
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 groupName];
    if ([v7 isEqualToString:@"HMDLogEventCountingAnalyzerDailyGroupName"])
    {
      id v8 = [v6 date];
      BOOL v9 = [v8 compare:*(void *)(a1 + 32)] == 1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)deleteCountersBeforeDate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDLogEventCountingAnalyzer *)self countersManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__HMDLogEventCountingAnalyzer_deleteCountersBeforeDate___block_invoke;
  v7[3] = &unk_264A26DA0;
  id v8 = v4;
  id v6 = v4;
  [v5 removeCounterGroupsBasedOnPredicate:v7];
}

BOOL __56__HMDLogEventCountingAnalyzer_deleteCountersBeforeDate___block_invoke(uint64_t a1, void *a2)
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
  id v6 = v5;
  if (v5)
  {
    v7 = [v5 groupName];
    if ([v7 isEqualToString:@"HMDLogEventCountingAnalyzerDailyGroupName"])
    {
      id v8 = [v6 date];
      BOOL v9 = [v8 compare:*(void *)(a1 + 32)] == -1;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)runDailyTask
{
  id v3 = [(HMDLogEventCountingAnalyzer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__HMDLogEventCountingAnalyzer_runDailyTask__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __43__HMDLogEventCountingAnalyzer_runDailyTask__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) dateProvider];
  id v5 = [v2 startOfDayByAddingDayCount:-5];

  [*(id *)(a1 + 32) deleteCountersBeforeDate:v5];
  id v3 = [*(id *)(a1 + 32) dateProvider];
  id v4 = [v3 startOfDayByAddingDayCount:1];

  [*(id *)(a1 + 32) deleteCountersAfterDate:v4];
}

- (HMDEventCounterGroup)currentDayCountersGroup
{
  id v3 = [HMDDateCounterGroupSpecifier alloc];
  id v4 = [(HMDLogEventCountingAnalyzer *)self dateProvider];
  id v5 = [v4 startOfCurrentDay];
  id v6 = [(HMDDateCounterGroupSpecifier *)v3 initWithGroupName:@"HMDLogEventCountingAnalyzerDailyGroupName" date:v5];

  v7 = [(HMDLogEventCountingAnalyzer *)self countersManager];
  id v8 = [v7 counterGroupForSpecifier:v6];

  return (HMDEventCounterGroup *)v8;
}

- (void)incrementDailyCountersForEventName:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDLogEventCountingAnalyzer *)self currentDayCountersGroup];
  [v5 incrementEventCounterForEventName:v4];
}

- (void)incrementPeriodicCountersForEventName:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock_with_options();
  id v4 = [(NSMutableDictionary *)self->_currentPeriodCounters objectForKeyedSubscript:v8];

  if (v4)
  {
    id v5 = NSNumber;
    id v6 = [(NSMutableDictionary *)self->_currentPeriodCounters objectForKeyedSubscript:v8];
    v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue") + 1);
    [(NSMutableDictionary *)self->_currentPeriodCounters setObject:v7 forKeyedSubscript:v8];
  }
  else
  {
    [(NSMutableDictionary *)self->_currentPeriodCounters setObject:&unk_26E472B08 forKeyedSubscript:v8];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)periodicSnapshotAtCurrentTickSeconds:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (a3 - self->_tickSecondsLastLogged >= self->_loggingPeriodicitySeconds)
  {
    id v6 = (void *)[(NSMutableDictionary *)self->_currentPeriodCounters copy];
    [(NSMutableDictionary *)self->_currentPeriodCounters removeAllObjects];
    self->_tickSecondsLastLogged = a3;
  }
  else
  {
    id v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)didReceiveEventFromDispatcher:(id)a3 withCurrentTickSeconds:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(HMDLogEventCountingAnalyzer *)self queue];
  dispatch_assert_queue_V2(v7);

  id v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(HMDLogEventCountingAnalyzer *)self incrementPeriodicCountersForEventName:v12];
  [(HMDLogEventCountingAnalyzer *)self incrementDailyCountersForEventName:v12];
  BOOL v9 = [(HMDLogEventCountingAnalyzer *)self periodicSnapshotAtCurrentTickSeconds:a4];
  if (v9)
  {
    v10 = [(HMDLogEventCountingAnalyzer *)self periodicCountersSnapshotBlock];
    v11 = [(HMDLogEventCountingAnalyzer *)self serialNumber];
    ((void (**)(void, void *, void *))v10)[2](v10, v9, v11);
  }
}

- (void)didReceiveEventFromDispatcher:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDLogEventCountingAnalyzer_didReceiveEventFromDispatcher___block_invoke;
  v7[3] = &unk_264A2F820;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __61__HMDLogEventCountingAnalyzer_didReceiveEventFromDispatcher___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [v1 tickSecondsProviderBlock];
  [v1 didReceiveEventFromDispatcher:v2 withCurrentTickSeconds:v3[2]()];
}

- (HMDLogEventCountingAnalyzer)initWithEventCountersManager:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5 systemInfo:(id)a6 queue:(id)a7 loggingPeriodicitySeconds:(unint64_t)a8 tickSecondsProviderBlock:(id)a9 periodicCountersLoggingBlock:(id)a10
{
  id v34 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  v35.receiver = self;
  v35.super_class = (Class)HMDLogEventCountingAnalyzer;
  v22 = [(HMDLogEventCountingAnalyzer *)&v35 init];
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_countersManager, a3);
    uint64_t v24 = [MEMORY[0x263EFF9A0] dictionary];
    currentPeriodCounters = v23->_currentPeriodCounters;
    v23->_currentPeriodCounters = (NSMutableDictionary *)v24;

    objc_storeStrong((id *)&v23->_dateProvider, a5);
    int v26 = isInternalBuild();
    if (v26)
    {
      v27 = [v18 serialNumber];
    }
    else
    {
      v27 = 0;
    }
    objc_storeStrong((id *)&v23->_serialNumber, v27);
    if (v26) {

    }
    objc_storeStrong((id *)&v23->_queue, a7);
    v23->_loggingPeriodicitySeconds = a8;
    v28 = _Block_copy(v20);
    id tickSecondsProviderBlock = v23->_tickSecondsProviderBlock;
    v23->_id tickSecondsProviderBlock = v28;

    v23->_tickSecondsLastLogged = (*((uint64_t (**)(void))v23->_tickSecondsProviderBlock + 2))();
    v30 = _Block_copy(v21);
    id periodicCountersSnapshotBlock = v23->_periodicCountersSnapshotBlock;
    v23->_id periodicCountersSnapshotBlock = v30;

    [v16 registerDailyTaskRunner:v23];
  }

  return v23;
}

- (HMDLogEventCountingAnalyzer)initWithEventCountersManager:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5 systemInfo:(id)a6 queue:(id)a7
{
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__HMDLogEventCountingAnalyzer_initWithEventCountersManager_dailyScheduler_dateProvider_systemInfo_queue___block_invoke_2;
  v14[3] = &unk_264A26180;
  v15 = self;
  id v12 = [(HMDLogEventCountingAnalyzer *)v15 initWithEventCountersManager:a3 dailyScheduler:a4 dateProvider:a5 systemInfo:a6 queue:a7 loggingPeriodicitySeconds:900 tickSecondsProviderBlock:&__block_literal_global_198036 periodicCountersLoggingBlock:v14];

  return v12;
}

void __105__HMDLogEventCountingAnalyzer_initWithEventCountersManager_dailyScheduler_dateProvider_systemInfo_queue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  BOOL v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v11 = 138544130;
    id v12 = v10;
    __int16 v13 = 1024;
    int v14 = 15;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@[Logging Period = %d Minutes] Metric event counts on current device: %@ %@", (uint8_t *)&v11, 0x26u);
  }
}

__uint64_t __105__HMDLogEventCountingAnalyzer_initWithEventCountersManager_dailyScheduler_dateProvider_systemInfo_queue___block_invoke()
{
  return clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 0x3B9ACA00;
}

@end