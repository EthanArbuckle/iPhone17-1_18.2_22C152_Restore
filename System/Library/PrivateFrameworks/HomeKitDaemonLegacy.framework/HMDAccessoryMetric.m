@interface HMDAccessoryMetric
+ (id)logCategory;
- (HMDAccessory)accessory;
- (HMDAccessoryDiagnosticsMetric)diagnosticsMetric;
- (HMDAccessoryMetric)initWithAccessory:(id)a3;
- (HMDAccessorySessionMetric)sessionMetric;
- (HMFTimer)accessoryMetricTimer;
- (NSArray)deltaCounters;
- (NSDictionary)previousDiagnosticMetrics;
- (OS_dispatch_queue)workQueue;
- (double)timerInterval;
- (id)logIdentifier;
- (void)_initDiagnosticCounters;
- (void)setAccessoryMetricTimer:(id)a3;
- (void)setPreviousDiagnosticMetrics:(id)a3;
- (void)submitMetricAndStop;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDAccessoryMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousDiagnosticMetrics, 0);
  objc_storeStrong((id *)&self->_deltaCounters, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessoryMetricTimer, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_diagnosticsMetric, 0);
  objc_storeStrong((id *)&self->_sessionMetric, 0);
}

- (void)setPreviousDiagnosticMetrics:(id)a3
{
}

- (NSDictionary)previousDiagnosticMetrics
{
  return self->_previousDiagnosticMetrics;
}

- (NSArray)deltaCounters
{
  return self->_deltaCounters;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (double)timerInterval
{
  return self->_timerInterval;
}

- (void)setAccessoryMetricTimer:(id)a3
{
}

- (HMFTimer)accessoryMetricTimer
{
  return self->_accessoryMetricTimer;
}

- (HMDAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDAccessory *)WeakRetained;
}

- (HMDAccessoryDiagnosticsMetric)diagnosticsMetric
{
  return self->_diagnosticsMetric;
}

- (HMDAccessorySessionMetric)sessionMetric
{
  return self->_sessionMetric;
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryMetric *)self accessory];
  v3 = NSString;
  v4 = [v2 name];
  v5 = [v2 identifier];
  v6 = [v3 stringWithFormat:@"%@ : %@", v4, v5];

  return v6;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryMetric *)self accessory];
  id v6 = [(HMDAccessoryMetric *)self accessoryMetricTimer];

  if (v6 == v4)
  {
    v7 = [(HMDAccessoryMetric *)self sessionMetric];
    [v7 submitMetric];

    v8 = [(HMDAccessoryMetric *)self sessionMetric];
    [v8 resetSessionMetric];

    if (!v5)
    {
      v9 = (void *)MEMORY[0x1D9452090]();
      v10 = self;
      v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v51 = v12;
        _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Accessory disappeared, stopping accessory metric timer", buf, 0xCu);
      }
      v13 = [(HMDAccessoryMetric *)v10 accessoryMetricTimer];
      [v13 suspend];

      [(HMDAccessoryMetric *)v10 setAccessoryMetricTimer:0];
    }
    v14 = [(HMDAccessoryMetric *)self diagnosticsMetric];
    v15 = [v14 collectMetric];

    v16 = [(HMDAccessoryMetric *)self previousDiagnosticMetrics];

    v17 = 0;
    if (v16 && v15)
    {
      v41 = v5;
      id v42 = v4;
      v17 = (void *)[v15 mutableCopy];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id obj = [(HMDAccessoryMetric *)self deltaCounters];
      uint64_t v18 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v44 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            v21 = v17;
            if (*(void *)v46 != v44) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            v23 = [v15 objectForKeyedSubscript:v22];
            [(HMDAccessoryMetric *)self previousDiagnosticMetrics];
            v25 = v24 = self;
            v26 = [v25 objectForKeyedSubscript:v22];

            v27 = NSNumber;
            int v28 = [v23 intValue];
            uint64_t v29 = v28 - [v26 intValue];
            v30 = v27;
            self = v24;
            v31 = [v30 numberWithInt:v29];
            v17 = v21;
            [v21 setObject:v31 forKeyedSubscript:v22];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
        }
        while (v19);
      }

      v5 = v41;
      id v4 = v42;
    }
    [(HMDAccessoryMetric *)self setPreviousDiagnosticMetrics:v15];
    if ([v17 count])
    {
      v32 = NSNumber;
      v33 = [(HMDAccessoryMetric *)self diagnosticsMetric];
      v34 = [v33 metricCollectionStartTime];
      [v34 timeIntervalSinceNow];
      LODWORD(v36) = llround(fabs(v35));
      v37 = [v32 numberWithInt:v36];
      [v17 setObject:v37 forKeyedSubscript:@"HMMTRAccessoryDiagnosticLogEventDurationInSeconds"];

      v38 = [(HMDAccessoryMetric *)self diagnosticsMetric];
      [v38 submitMetric:v17];

      v39 = [MEMORY[0x1E4F1C9C8] date];
      v40 = [(HMDAccessoryMetric *)self diagnosticsMetric];
      [v40 setMetricCollectionStartTime:v39];
    }
  }
}

- (void)submitMetricAndStop
{
  v3 = [(HMDAccessoryMetric *)self sessionMetric];
  [v3 submitMetric];

  id v4 = [(HMDAccessoryMetric *)self accessoryMetricTimer];
  [v4 suspend];
}

- (void)_initDiagnosticCounters
{
  v19[16] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F6A118];
  v19[0] = *MEMORY[0x1E4F6A110];
  v19[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F6A178];
  v19[2] = *MEMORY[0x1E4F6A170];
  v19[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F6A190];
  v19[4] = *MEMORY[0x1E4F6A188];
  v19[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F6A1A0];
  v19[6] = *MEMORY[0x1E4F6A198];
  v19[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F6A140];
  v19[8] = *MEMORY[0x1E4F6A1A8];
  v19[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F6A138];
  v19[10] = *MEMORY[0x1E4F6A130];
  v19[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F6A150];
  v19[12] = *MEMORY[0x1E4F6A148];
  v19[13] = v9;
  uint64_t v10 = *MEMORY[0x1E4F6A160];
  v19[14] = *MEMORY[0x1E4F6A158];
  v19[15] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:16];
  deltaCounters = self->_deltaCounters;
  self->_deltaCounters = v11;

  v13 = [(HMDAccessoryMetric *)self previousDiagnosticMetrics];
  uint64_t v14 = [v13 count];

  if (!v14)
  {
    v15 = [(HMDAccessoryMetric *)self diagnosticsMetric];
    v16 = [v15 metric];
    [(HMDAccessoryMetric *)self setPreviousDiagnosticMetrics:v16];

    v17 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v18 = [(HMDAccessoryMetric *)self diagnosticsMetric];
    [v18 setMetricCollectionStartTime:v17];
  }
}

- (HMDAccessoryMetric)initWithAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HMDAccessoryMetric;
  uint64_t v5 = [(HMDAccessoryMetric *)&v24 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("Session Metrics", 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_accessory, v4);
    uint64_t v8 = [[HMDAccessorySessionMetric alloc] initWithAccessory:v4 workQueue:v5->_workQueue];
    sessionMetric = v5->_sessionMetric;
    v5->_sessionMetric = v8;

    uint64_t v10 = [[HMDAccessoryDiagnosticsMetric alloc] initWithAccessory:v4];
    diagnosticsMetric = v5->_diagnosticsMetric;
    v5->_diagnosticsMetric = v10;

    v12 = [MEMORY[0x1E4F65530] sharedPreferences];
    v13 = [v12 preferenceForKey:@"HMDAccessorySessionMetricSubmissionInterval"];
    uint64_t v14 = [v13 numberValue];

    if (v14)
    {
      [v14 floatValue];
      float v16 = v15;
    }
    else
    {
      float v16 = 14400.0;
    }
    v5->_double timerInterval = (float)(v16 + (float)(HMFRandomUInt32() % (int)(v16 * 0.1)));
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:4 options:v5->_timerInterval];
    accessoryMetricTimer = v5->_accessoryMetricTimer;
    v5->_accessoryMetricTimer = (HMFTimer *)v17;

    [(HMFTimer *)v5->_accessoryMetricTimer setDelegateQueue:v5->_workQueue];
    [(HMFTimer *)v5->_accessoryMetricTimer setDelegate:v5];
    [(HMFTimer *)v5->_accessoryMetricTimer resume];
    uint64_t v19 = (void *)MEMORY[0x1D9452090]([(HMDAccessoryMetric *)v5 _initDiagnosticCounters]);
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = HMFGetLogIdentifier();
      double timerInterval = v5->_timerInterval;
      *(_DWORD *)buf = 138543618;
      v26 = v21;
      __int16 v27 = 2048;
      double v28 = timerInterval;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@[AccessoryMetric] Initialized session metric for accessory with submission interval: %f", buf, 0x16u);
    }
  }
  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_63731 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_63731, &__block_literal_global_148_63732);
  }
  v2 = (void *)logCategory__hmf_once_v5_63733;
  return v2;
}

uint64_t __33__HMDAccessoryMetric_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_63733;
  logCategory__hmf_once_v5_63733 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end