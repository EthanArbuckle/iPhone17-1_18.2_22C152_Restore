@interface HMDCameraSignificantEventNotificationDebouncer
+ (id)logCategory;
- (HMDCameraSignificantEventNotificationDebouncer)initWithLogIdentifier:(id)a3;
- (HMFTimer)cleanupTimer;
- (NSMutableDictionary)lastDateNotifiedByPersonIdentifier;
- (NSString)logIdentifier;
- (double)distinctPersonDebounceTimeInterval;
- (os_unfair_lock_s)lock;
- (void)timerDidFire:(id)a3;
- (void)trackCameraSignificantEvent:(id)a3 shouldNotify:(BOOL *)a4;
@end

@implementation HMDCameraSignificantEventNotificationDebouncer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_cleanupTimer, 0);
  objc_storeStrong((id *)&self->_lastDateNotifiedByPersonIdentifier, 0);
}

- (double)distinctPersonDebounceTimeInterval
{
  return self->_distinctPersonDebounceTimeInterval;
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (HMFTimer)cleanupTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)lastDateNotifiedByPersonIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)timerDidFire:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraSignificantEventNotificationDebouncer *)self cleanupTimer];

  if (v5 == v4)
  {
    os_unfair_lock_lock_with_options();
    v10 = (void *)MEMORY[0x263EFF9A0];
    v11 = [(HMDCameraSignificantEventNotificationDebouncer *)self lastDateNotifiedByPersonIdentifier];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __63__HMDCameraSignificantEventNotificationDebouncer_timerDidFire___block_invoke;
    v15[3] = &unk_264A26988;
    v15[4] = self;
    v12 = objc_msgSend(v11, "na_filter:", v15);
    v13 = [v10 dictionaryWithDictionary:v12];
    lastDateNotifiedByPersonIdentifier = self->_lastDateNotifiedByPersonIdentifier;
    self->_lastDateNotifiedByPersonIdentifier = v13;

    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v6 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v17 = v9;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer: %@", buf, 0x16u);
    }
  }
}

BOOL __63__HMDCameraSignificantEventNotificationDebouncer_timerDidFire___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 timeIntervalSinceNow];
  double v5 = v4;
  [*(id *)(a1 + 32) distinctPersonDebounceTimeInterval];
  return v5 < v6 + v6;
}

- (void)trackCameraSignificantEvent:(id)a3 shouldNotify:(BOOL *)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([v6 reason] == 2)
  {
    v7 = [v6 faceClassification];
    v8 = [v7 person];
    v9 = [v8 UUID];

    if (!v9)
    {
      v30 = (void *)MEMORY[0x230FBD990]();
      v31 = self;
      v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v33;
        __int16 v49 = 2112;
        id v50 = v6;
        _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_INFO, "%{public}@Significant Event: %@ did not have a recognized person, should notify", buf, 0x16u);
      }
      if (a4) {
        *a4 = 1;
      }
      goto LABEL_25;
    }
    os_unfair_lock_t lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    v10 = [(HMDCameraSignificantEventNotificationDebouncer *)self lastDateNotifiedByPersonIdentifier];
    v11 = [v10 objectForKeyedSubscript:v9];

    if (v11)
    {
      v12 = [MEMORY[0x263EFF910] now];
      [v12 timeIntervalSinceDate:v11];
      double v14 = v13;

      uint64_t v15 = [(HMDCameraSignificantEventNotificationDebouncer *)self distinctPersonDebounceTimeInterval];
      double v17 = v16;
      __int16 v18 = (void *)MEMORY[0x230FBD990](v15);
      id v19 = self;
      HMFGetOSLogHandle();
      uint64_t v20 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        [(HMDCameraSignificantEventNotificationDebouncer *)v19 distinctPersonDebounceTimeInterval];
        uint64_t v23 = v22;
        v24 = HMFBooleanToString();
        *(_DWORD *)buf = 138544642;
        id v48 = v21;
        __int16 v49 = 2112;
        id v50 = v11;
        __int16 v51 = 2112;
        v52 = v9;
        __int16 v53 = 2048;
        double v54 = v14;
        __int16 v55 = 2048;
        uint64_t v56 = v23;
        __int16 v57 = 2112;
        v58 = v24;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Last notification date: %@ for personIdentifier: %@, time interval: %.2f seconds, debounce interval: %.2f seconds, shouldNotify: %@", buf, 0x3Eu);
      }
      if (v14 <= v17)
      {
        BOOL v25 = 0;
        if (!a4) {
          goto LABEL_24;
        }
        goto LABEL_23;
      }
    }
    else
    {
      v34 = MEMORY[0x230FBD990]((void *)0x263EFF000);
      v35 = self;
      HMFGetOSLogHandle();
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v48 = v37;
        __int16 v49 = 2112;
        id v50 = v9;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Debouncer has no record of previous notification for personIdentifier: %@", buf, 0x16u);
      }
    }
    v38 = [MEMORY[0x263EFF910] now];
    v39 = [(HMDCameraSignificantEventNotificationDebouncer *)self lastDateNotifiedByPersonIdentifier];
    [v39 setObject:v38 forKeyedSubscript:v9];

    v40 = (void *)MEMORY[0x230FBD990]();
    v41 = self;
    HMFGetOSLogHandle();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = [(HMDCameraSignificantEventNotificationDebouncer *)v41 lastDateNotifiedByPersonIdentifier];
      v45 = [v44 objectForKeyedSubscript:v9];
      *(_DWORD *)buf = 138543874;
      id v48 = v43;
      __int16 v49 = 2112;
      id v50 = v45;
      __int16 v51 = 2112;
      v52 = v9;
      _os_log_impl(&dword_22F52A000, v42, OS_LOG_TYPE_INFO, "%{public}@shouldNotify, tracking last notification date: %@ for personIdentifier: %@", buf, 0x20u);
    }
    BOOL v25 = 1;
    if (!a4) {
      goto LABEL_24;
    }
LABEL_23:
    *a4 = v25;
LABEL_24:

    os_unfair_lock_unlock(lock);
LABEL_25:

    goto LABEL_26;
  }
  v26 = (void *)MEMORY[0x230FBD990]();
  v27 = self;
  v28 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v48 = v29;
    __int16 v49 = 2112;
    id v50 = v6;
    _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Significant Event: %@ is not for a person, should notify", buf, 0x16u);
  }
  if (a4) {
    *a4 = 1;
  }
LABEL_26:
}

- (HMDCameraSignificantEventNotificationDebouncer)initWithLogIdentifier:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMDCameraSignificantEventNotificationDebouncer;
  id v6 = [(HMDCameraSignificantEventNotificationDebouncer *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_logIdentifier, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    lastDateNotifiedByPersonIdentifier = v7->_lastDateNotifiedByPersonIdentifier;
    v7->_lastDateNotifiedByPersonIdentifier = (NSMutableDictionary *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
    v10 = [MEMORY[0x263F42608] sharedPreferences];
    v11 = [v10 preferenceForKey:@"DistinctPersonNotificationDebounceInterval_Seconds"];
    v12 = [v11 numberValue];

    [v12 doubleValue];
    v7->_distinctPersonDebounceTimeInterval = v13;
    uint64_t v14 = [objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:12 options:3600.0];
    cleanupTimer = v7->_cleanupTimer;
    v7->_cleanupTimer = (HMFTimer *)v14;

    [(HMFTimer *)v7->_cleanupTimer setDelegate:v7];
    [(HMFTimer *)v7->_cleanupTimer resume];
  }
  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_206605 != -1) {
    dispatch_once(&logCategory__hmf_once_t8_206605, &__block_literal_global_206606);
  }
  v2 = (void *)logCategory__hmf_once_v9_206607;
  return v2;
}

void __61__HMDCameraSignificantEventNotificationDebouncer_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v9_206607;
  logCategory__hmf_once_v9_206607 = v0;
}

@end