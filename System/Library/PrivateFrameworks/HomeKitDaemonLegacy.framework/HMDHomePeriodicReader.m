@interface HMDHomePeriodicReader
+ (id)logCategory;
- (HMDHome)home;
- (NSString)timerID;
- (OS_dispatch_queue)workQueue;
- (id)_characteristicsToRead;
- (id)logIdentifier;
- (void)_checkToIssueRead;
- (void)_issueCharacteristicRequests:(id)a3;
- (void)_startTimer;
- (void)checkToIssueRead;
- (void)configure:(id)a3;
- (void)dealloc;
- (void)handleCharacteristicBasedEventAdded:(id)a3;
- (void)handleTimerFiredNotification:(id)a3;
- (void)residentUpdated;
- (void)setHome:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startReadTimer;
@end

@implementation HMDHomePeriodicReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_timerID, 0);
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSString)timerID
{
  return self->_timerID;
}

- (void)_startTimer
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePeriodicReader *)self timerID];
  v4 = +[HMDBackgroundTaskManager sharedManager];
  [v4 cancelTaskWithIdentifier:v3 onObserver:self];

  v5 = [MEMORY[0x1E4F65530] sharedPreferences];
  v6 = [v5 preferenceForKey:@"periodicReaderInterval"];
  v7 = [v6 numberValue];

  if (!v7)
  {
    v7 = [NSNumber numberWithDouble:20.0];
    v8 = (void *)MEMORY[0x1D9452090]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      __int16 v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Preference for reader interval is missing, using default value: %@", buf, 0x16u);
    }
  }
  v12 = [MEMORY[0x1E4F1C9C8] date];
  [v7 doubleValue];
  v14 = [v12 dateByAddingTimeInterval:v13 * 60.0];

  v15 = (void *)MEMORY[0x1D9452090]();
  v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    v19 = objc_msgSend(v14, "hmf_localTimeDescription");
    *(_DWORD *)buf = 138543874;
    v29 = v18;
    __int16 v30 = 2112;
    v31 = v3;
    __int16 v32 = 2112;
    id v33 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Starting the next timer (%@) to fire at %@", buf, 0x20u);
  }
  v20 = +[HMDBackgroundTaskManager sharedManager];
  id v27 = 0;
  char v21 = [v20 scheduleTaskWithIdentifier:v3 fireDate:v14 onObserver:v16 selector:sel_handleTimerFiredNotification_ error:&v27];
  id v22 = v27;

  if ((v21 & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1D9452090]();
    v24 = v16;
    v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v29 = v26;
      __int16 v30 = 2112;
      v31 = v3;
      __int16 v32 = 2112;
      id v33 = v22;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Failed to start timer %@ with error %@", buf, 0x20u);
    }
  }
}

- (void)_issueCharacteristicRequests:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138543618;
    long long v20 = v6;
    id v21 = v4;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v11 = objc_msgSend(v4, "objectForKey:", v10, v20);
        v12 = (void *)MEMORY[0x1D9452090]();
        double v13 = self;
        v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          uint64_t v15 = v7;
          uint64_t v16 = v8;
          v18 = v17 = self;
          *(_DWORD *)buf = v20;
          id v27 = v18;
          __int16 v28 = 2112;
          v29 = v10;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Issuing a periodic read for %@", buf, 0x16u);

          self = v17;
          uint64_t v8 = v16;
          uint64_t v7 = v15;
          id v4 = v21;
        }

        v19 = [(HMDHomePeriodicReader *)v13 workQueue];
        [v10 readCharacteristicValues:v11 source:7 queue:v19 completionHandler:&__block_literal_global_19_82947];
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v7);
  }
}

- (void)_checkToIssueRead
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    long long v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMDHomePeriodicReader *)v4 timerID];
    int v11 = 138543618;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Stopping the timer with ID: %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = +[HMDBackgroundTaskManager sharedManager];
  v9 = [(HMDHomePeriodicReader *)v4 timerID];
  [v8 cancelTaskWithIdentifier:v9 onObserver:v4];

  v10 = [(HMDHomePeriodicReader *)v4 _characteristicsToRead];
  if (v10)
  {
    [(HMDHomePeriodicReader *)v4 _issueCharacteristicRequests:v10];
    [(HMDHomePeriodicReader *)v4 _startTimer];
  }
}

- (void)checkToIssueRead
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePeriodicReader *)self workQueue];

  if (v3)
  {
    id v4 = [(HMDHomePeriodicReader *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __41__HMDHomePeriodicReader_checkToIssueRead__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    long long v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Object not configured yet", buf, 0xCu);
    }
  }
}

uint64_t __41__HMDHomePeriodicReader_checkToIssueRead__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkToIssueRead];
}

- (void)startReadTimer
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePeriodicReader *)self workQueue];

  if (v3)
  {
    id v4 = [(HMDHomePeriodicReader *)self workQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__HMDHomePeriodicReader_startReadTimer__block_invoke;
    block[3] = &unk_1E6A19B30;
    block[4] = self;
    dispatch_async(v4, block);
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1D9452090]();
    long long v6 = self;
    uint64_t v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v11 = v8;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Object not configured yet", buf, 0xCu);
    }
  }
}

void __39__HMDHomePeriodicReader_startReadTimer__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _characteristicsToRead];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1D9452090]();
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      long long v6 = HMFGetLogIdentifier();
      int v7 = 138543362;
      uint64_t v8 = v6;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Starting periodic read timer", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) _startTimer];
  }
}

- (id)_characteristicsToRead
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDHomePeriodicReader *)self home];
  id v4 = [v3 primaryResident];
  char v5 = [v4 isCurrentDevice];

  if (v5)
  {
    long long v6 = [MEMORY[0x1E4F1CA80] set];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v44 = v3;
    int v7 = [v3 triggers];
    uint64_t v8 = (void *)[v7 copy];

    obuint64_t j = v8;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v65 objects:v72 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v51 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v66 != v51) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(id *)(*((void *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            __int16 v13 = v12;
          }
          else {
            __int16 v13 = 0;
          }
          id v14 = v13;

          if (v14)
          {
            uint64_t v15 = [v14 characteristicBaseEvents];
            long long v61 = 0u;
            long long v62 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
            if (v16)
            {
              uint64_t v17 = v16;
              uint64_t v18 = *(void *)v62;
              do
              {
                for (uint64_t j = 0; j != v17; ++j)
                {
                  if (*(void *)v62 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  long long v20 = [*(id *)(*((void *)&v61 + 1) + 8 * j) characteristic];
                  id v21 = [v20 accessory];

                  if ([v21 hasIPLink]) {
                    [v6 addObject:v21];
                  }
                }
                uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
              }
              while (v17);
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
      }
      while (v10);
    }

    v48 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v22 = v6;
    uint64_t v47 = [v22 countByEnumeratingWithState:&v57 objects:v70 count:16];
    if (v47)
    {
      char v52 = 0;
      id v45 = v22;
      uint64_t v46 = *(void *)v58;
      uint64_t v23 = *MEMORY[0x1E4F5BA48];
      uint64_t v24 = *MEMORY[0x1E4F5B8A8];
      do
      {
        long long v25 = 0;
        do
        {
          if (*(void *)v58 != v46) {
            objc_enumerationMutation(v45);
          }
          v26 = *(void **)(*((void *)&v57 + 1) + 8 * (void)v25);
          id v27 = [v48 objectForKey:v26];
          if (!v27)
          {
            id v27 = [MEMORY[0x1E4F1CA48] array];
            [v48 setObject:v27 forKey:v26];
          }
          obja = v25;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          __int16 v28 = [v26 services];
          uint64_t v29 = [v28 countByEnumeratingWithState:&v53 objects:v69 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v54;
            do
            {
              for (uint64_t k = 0; k != v30; ++k)
              {
                if (*(void *)v54 != v31) {
                  objc_enumerationMutation(v28);
                }
                id v33 = *(void **)(*((void *)&v53 + 1) + 8 * k);
                uint64_t v34 = [v33 type];
                int v35 = [v34 isEqualToString:v23];

                if (v35)
                {
                  v36 = [v33 findCharacteristicWithType:v24];
                  if (v36)
                  {
                    v37 = +[HMDCharacteristicRequest requestWithCharacteristic:v36];
                    [v27 addObject:v37];

                    char v52 = 1;
                  }
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v53 objects:v69 count:16];
            }
            while (v30);
          }

          long long v25 = obja + 1;
        }
        while (obja + 1 != (char *)v47);
        uint64_t v47 = [v45 countByEnumeratingWithState:&v57 objects:v70 count:16];
      }
      while (v47);
      id v22 = v45;

      if (v52)
      {
        id v38 = v48;
LABEL_50:
        v3 = v44;

        goto LABEL_51;
      }
    }
    else
    {
    }
    id v38 = 0;
    goto LABEL_50;
  }
  v39 = (void *)MEMORY[0x1D9452090]();
  v40 = self;
  v41 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v74 = v42;
    _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@This device is not the resident, not issuing the periodic read", buf, 0xCu);
  }
  id v38 = 0;
LABEL_51:

  return v38;
}

- (void)residentUpdated
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  char v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    long long v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Resident updated, issuing a read", (uint8_t *)&v7, 0xCu);
  }
  [(HMDHomePeriodicReader *)v4 checkToIssueRead];
}

- (void)handleTimerFiredNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 userInfo];
  long long v6 = objc_msgSend(v5, "hmf_stringForKey:", @"HMD.BGTM.NK");

  int v7 = [(HMDHomePeriodicReader *)self timerID];
  int v8 = HMFEqualObjects();

  if (v8)
  {
    uint64_t v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    int v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = HMFGetLogIdentifier();
      int v13 = 138543618;
      id v14 = v12;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Issuing read for fired timer with ID: %@", (uint8_t *)&v13, 0x16u);
    }
    [(HMDHomePeriodicReader *)v10 checkToIssueRead];
  }
}

- (void)handleCharacteristicBasedEventAdded:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = (void *)MEMORY[0x1D9452090]();
  long long v6 = self;
  int v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received characteristic event added notification", (uint8_t *)&v9, 0xCu);
  }
  [(HMDHomePeriodicReader *)v6 startReadTimer];
}

- (id)logIdentifier
{
  v2 = [(HMDHomePeriodicReader *)self home];
  v3 = NSString;
  id v4 = [v2 name];
  char v5 = [v2 uuid];
  long long v6 = [v5 UUIDString];
  int v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDHomePeriodicReader;
  [(HMDHomePeriodicReader *)&v4 dealloc];
}

- (void)configure:(id)a3
{
  p_home = &self->_home;
  id v5 = a3;
  objc_storeWeak((id *)p_home, v5);
  long long v6 = [v5 workQueue];
  workQueue = self->_workQueue;
  self->_workQueue = v6;

  int v8 = NSString;
  int v9 = [v5 uuid];
  uint64_t v10 = [v9 UUIDString];
  uint64_t v11 = [v8 stringWithFormat:@"periodic.read/%@", v10];
  timerID = self->_timerID;
  self->_timerID = v11;

  int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 addObserver:self selector:sel_handleCharacteristicBasedEventAdded_ name:@"HMDEventTriggerCharacteristicBasedEventAddedNotification" object:v5];

  [(HMDHomePeriodicReader *)self startReadTimer];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_82977 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_82977, &__block_literal_global_82978);
  }
  v2 = (void *)logCategory__hmf_once_v1_82979;
  return v2;
}

uint64_t __36__HMDHomePeriodicReader_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_82979;
  logCategory__hmf_once_v1_82979 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end