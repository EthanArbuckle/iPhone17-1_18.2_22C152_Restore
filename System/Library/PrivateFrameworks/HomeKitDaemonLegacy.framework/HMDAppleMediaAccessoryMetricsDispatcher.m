@interface HMDAppleMediaAccessoryMetricsDispatcher
- (HMDAppleMediaAccessoryMetricsDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5;
- (HMDAppleMediaAccessoryMetricsDispatcherDataSource)dataSource;
- (HMDLogEventDailyScheduler)dailyScheduler;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSString)previousRoomName;
- (void)registerForDailySetRoomLogEvents;
- (void)runDailyTask;
- (void)setPreviousRoomName:(id)a3;
- (void)submitDailySetRoomEvent;
- (void)submitDailyStatusEvent;
- (void)submitRoomChangeEvent:(id)a3 previousRoom:(id)a4;
@end

@implementation HMDAppleMediaAccessoryMetricsDispatcher

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_dailyScheduler, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_previousRoomName, 0);
}

- (HMDAppleMediaAccessoryMetricsDispatcherDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDAppleMediaAccessoryMetricsDispatcherDataSource *)WeakRetained;
}

- (HMDLogEventDailyScheduler)dailyScheduler
{
  return (HMDLogEventDailyScheduler *)objc_getProperty(self, a2, 32, 1);
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 24, 1);
}

- (void)runDailyTask
{
  [(HMDAppleMediaAccessoryMetricsDispatcher *)self submitDailySetRoomEvent];
  [(HMDAppleMediaAccessoryMetricsDispatcher *)self submitDailyStatusEvent];
}

- (void)submitDailyStatusEvent
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDAppleMediaAccessoryMetricsDispatcher *)self dataSource];
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 numberOfCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:self];
    uint64_t v6 = [v4 numberOfTriggersWithCurrentAccessoryPairedSensorsForAppleMediaAccessoryMetricsDispatcher:self];
    uint64_t v7 = [v4 numberOfActionSetsWithCurrentAccessoryMediaActionForAppleMediaAccessoryMetricsDispatcher:self];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v20 = 0x2020000000;
    int v21 = 0;
    v8 = dispatch_group_create();
    dispatch_group_enter(v8);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke;
    v16[3] = &unk_1E6A078D0;
    p_long long buf = &buf;
    v9 = v8;
    v17 = v9;
    [v4 currentAccessorySensorStatusFlagsForAppleMediaAccessoryMetricsDispatcher:self completion:v16];
    v10 = [v4 workQueueForAppleMediaAccessoryMetricsDispatcher:self];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke_2;
    block[3] = &unk_1E6A078F8;
    block[6] = v5;
    block[7] = v6;
    block[8] = v7;
    block[4] = self;
    block[5] = &buf;
    dispatch_group_notify(v9, v10, block);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to submit daily accessory metric due to nil data source", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __65__HMDAppleMediaAccessoryMetricsDispatcher_submitDailyStatusEvent__block_invoke_2(uint64_t a1)
{
  v2 = [HMDCurrentAppleMediaAccessoryConfigurationLogEvent alloc];
  v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  v4 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v5 = [NSNumber numberWithInteger:*(void *)(a1 + 56)];
  uint64_t v6 = [NSNumber numberWithInteger:*(void *)(a1 + 64)];
  v8 = [(HMDCurrentAppleMediaAccessoryConfigurationLogEvent *)v2 initWithNumPairedSensors:v3 sensorStatus:v4 numPairedSensorAutomations:v5 numMediaAutomations:v6];

  uint64_t v7 = [*(id *)(a1 + 32) logEventSubmitter];
  [v7 submitLogEvent:v8];
}

- (void)setPreviousRoomName:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock_with_options();
  v4 = (NSString *)[v6 copy];
  previousRoomName = self->_previousRoomName;
  self->_previousRoomName = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)previousRoomName
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_previousRoomName;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)submitRoomChangeEvent:(id)a3 previousRoom:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFString *)a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Recording change but not submitting room changed event", (uint8_t *)&v16, 0xCu);
  }
  if (!v7)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = v9;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@previousRoom is nil. Substituting with empty string.", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v7 = &stru_1F2C9F1A8;
  }
  [(HMDAppleMediaAccessoryMetricsDispatcher *)v9 setPreviousRoomName:v7];
}

- (void)submitDailySetRoomEvent
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    int v26 = 138543362;
    v27 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Submitting daily room event", (uint8_t *)&v26, 0xCu);
  }
  uint64_t v7 = [(HMDAppleMediaAccessoryMetricsDispatcher *)v4 dataSource];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 currentRoomForAppleMediaAccessoryMetricsDispatcher:v4];
    if (v9)
    {
      os_unfair_lock_lock_with_options();
      v10 = v4->_previousRoomName;
      objc_storeStrong((id *)&v4->_previousRoomName, v9);
      os_unfair_lock_unlock(&v4->_lock);
      v11 = (void *)MEMORY[0x1D9452090]();
      v12 = v4;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = HMFGetLogIdentifier();
        int v26 = 138543874;
        v27 = v14;
        __int16 v28 = 2112;
        v29 = v9;
        __int16 v30 = 2112;
        v31 = v10;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Submitting daily room event with currentRoom: %@, previousRoom: %@", (uint8_t *)&v26, 0x20u);
      }
      v15 = [[HMDAppleMediaAccessoryDailySetRoomEvent alloc] initWithCurrentRoom:v9 previousRoom:v10];
      int v16 = [(HMDAppleMediaAccessoryMetricsDispatcher *)v12 logEventSubmitter];
      [v16 submitLogEvent:v15];
    }
    else
    {
      int v21 = (void *)MEMORY[0x1D9452090]();
      uint64_t v22 = v4;
      v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = HMFGetLogIdentifier();
        v25 = [(HMDAppleMediaAccessoryMetricsDispatcher *)v22 previousRoomName];
        int v26 = 138543618;
        v27 = v24;
        __int16 v28 = 2112;
        v29 = v25;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Data sourced nil current room name when submitting set room event metric with previous room name %@", (uint8_t *)&v26, 0x16u);
      }
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1D9452090]();
    uint64_t v18 = v4;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v26 = 138543362;
      v27 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@No data source to submit set room event metric", (uint8_t *)&v26, 0xCu);
    }
  }
}

- (void)registerForDailySetRoomLogEvents
{
  id v4 = [(HMDAppleMediaAccessoryMetricsDispatcher *)self dataSource];
  v3 = [v4 currentRoomForAppleMediaAccessoryMetricsDispatcher:self];
  [(HMDAppleMediaAccessoryMetricsDispatcher *)self setPreviousRoomName:v3];
}

- (HMDAppleMediaAccessoryMetricsDispatcher)initWithDataSource:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDAppleMediaAccessoryMetricsDispatcher;
  v11 = [(HMDAppleMediaAccessoryMetricsDispatcher *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_dataSource, v8);
    objc_storeStrong((id *)&v12->_logEventSubmitter, a4);
    objc_storeStrong((id *)&v12->_dailyScheduler, a5);
    previousRoomName = v12->_previousRoomName;
    v12->_previousRoomName = (NSString *)@"UNSET";

    [(HMDLogEventDailyScheduler *)v12->_dailyScheduler registerDailyTaskRunner:v12];
  }

  return v12;
}

@end