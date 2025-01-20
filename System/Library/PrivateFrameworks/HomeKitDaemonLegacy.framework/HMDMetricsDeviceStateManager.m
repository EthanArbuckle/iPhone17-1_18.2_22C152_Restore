@interface HMDMetricsDeviceStateManager
+ (id)lastUpdateForSoftwareVersion:(id)a3 dateProvider:(id)a4 userDefaults:(id)a5 updateDefaultsIfNeeded:(BOOL)a6;
+ (int64_t)_daysSinceSoftwareUpdateFrom:(id)a3 dateProvider:(id)a4;
+ (int64_t)internalDeviceDaysSinceSoftwareUpdate;
- (HAPSystemKeyCountProvider)keyCountProvider;
- (HMDMetricsDeviceStateManager)initWithCurrentSoftwareVersion:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5 dateProvider:(id)a6 keyCountProvider:(id)a7 userDefaults:(id)a8;
- (HMDMetricsDeviceStateManager)initWithLogEventSubmitter:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5;
- (HMMDateProvider)dateProvider;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)lastSoftwareUpdateDate;
- (int64_t)deviceDaysSinceSoftwareUpdate;
- (unint64_t)bitMappedDuplicateKeys;
- (unint64_t)bitMappedMissingKeys;
- (unint64_t)bitMaskForKeyType:(unint64_t)a3;
- (unint64_t)currentDataSyncState;
- (unint64_t)currentHomeManagerStatus;
- (unint64_t)duplicateKeysBitMapFromKeyCounts:(id)a3;
- (unint64_t)missingKeysBitMapFromKeyCounts:(id)a3;
- (void)handleHomeDataLoaded;
- (void)registerForNotifications;
- (void)runDailyTask;
- (void)updateCachedPairingKeyStates;
- (void)updateWithDataSyncState:(unint64_t)a3;
- (void)updateWithHomeManagerStatus:(unint64_t)a3;
@end

@implementation HMDMetricsDeviceStateManager

- (void)updateWithHomeManagerStatus:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_currentHomeManagerStatus != a3) {
    self->_currentHomeManagerStatus = a3;
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)updateWithDataSyncState:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self->_currentDataSyncState != a3)
  {
    self->_currentDataSyncState = a3;
    v6 = [(HMDMetricsDeviceStateManager *)self logEventSubmitter];
    v7 = [[HMDDataSyncStateLogEvent alloc] initWithDataSyncState:a3];
    [v6 submitLogEvent:v7];
  }
  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyCountProvider, 0);
  objc_destroyWeak((id *)&self->_dateProvider);
  objc_storeStrong((id *)&self->_lastSoftwareUpdateDate, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

- (HAPSystemKeyCountProvider)keyCountProvider
{
  return self->_keyCountProvider;
}

- (HMMDateProvider)dateProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateProvider);
  return (HMMDateProvider *)WeakRetained;
}

- (NSDate)lastSoftwareUpdateDate
{
  return self->_lastSoftwareUpdateDate;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (unint64_t)bitMappedDuplicateKeys
{
  return self->_bitMappedDuplicateKeys;
}

- (unint64_t)bitMappedMissingKeys
{
  return self->_bitMappedMissingKeys;
}

- (unint64_t)currentHomeManagerStatus
{
  return self->_currentHomeManagerStatus;
}

- (unint64_t)currentDataSyncState
{
  return self->_currentDataSyncState;
}

- (void)runDailyTask
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@runDailyTask", (uint8_t *)&v7, 0xCu);
  }
  [(HMDMetricsDeviceStateManager *)v4 updateCachedPairingKeyStates];
}

- (void)handleHomeDataLoaded
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = HMFGetLogIdentifier();
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@handleHomeDataLoaded", (uint8_t *)&v7, 0xCu);
  }
  [(HMDMetricsDeviceStateManager *)v4 updateCachedPairingKeyStates];
}

- (int64_t)deviceDaysSinceSoftwareUpdate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = objc_opt_class();
  lastSoftwareUpdateDate = self->_lastSoftwareUpdateDate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dateProvider);
  int64_t v7 = [v4 _daysSinceSoftwareUpdateFrom:lastSoftwareUpdateDate dateProvider:WeakRetained];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (unint64_t)bitMaskForKeyType:(unint64_t)a3
{
  if ((uint64_t)a3 > 1751999336)
  {
    switch(a3)
    {
      case 0x686D6369uLL:
        return 8;
      case 0x686D6B32uLL:
        return 16;
      case 0x686D6C69uLL:
        return 32;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x68617043uLL:
        return 2;
      case 0x68617053uLL:
        return 64;
      case 0x68617063uLL:
        return 4;
    }
  }
  return 1;
}

- (unint64_t)duplicateKeysBitMapFromKeyCounts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v4 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 integerValue];

        if (v12 >= 2) {
          v7 |= -[HMDMetricsDeviceStateManager bitMaskForKeyType:](self, "bitMaskForKeyType:", [v10 unsignedIntegerValue]);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)missingKeysBitMapFromKeyCounts:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v4 objectForKeyedSubscript:v10];
        uint64_t v12 = [v11 integerValue];

        if (!v12) {
          v7 |= -[HMDMetricsDeviceStateManager bitMaskForKeyType:](self, "bitMaskForKeyType:", [v10 unsignedIntegerValue]);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)updateCachedPairingKeyStates
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDMetricsDeviceStateManager *)self keyCountProvider];
  uint64_t v5 = [v4 countAccessoryPairingKeysForMetrics];

  self->_unint64_t bitMappedMissingKeys = [(HMDMetricsDeviceStateManager *)self missingKeysBitMapFromKeyCounts:v5];
  self->_unint64_t bitMappedDuplicateKeys = [(HMDMetricsDeviceStateManager *)self duplicateKeysBitMapFromKeyCounts:v5];
  uint64_t v6 = (void *)MEMORY[0x1D9452090]();
  unint64_t v7 = self;
  HMFGetOSLogHandle();
  uint64_t v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    unint64_t bitMappedMissingKeys = self->_bitMappedMissingKeys;
    unint64_t bitMappedDuplicateKeys = self->_bitMappedDuplicateKeys;
    int v12 = 138544130;
    v13 = v9;
    __int16 v14 = 2112;
    long long v15 = v5;
    __int16 v16 = 2048;
    unint64_t v17 = bitMappedMissingKeys;
    __int16 v18 = 2048;
    unint64_t v19 = bitMappedDuplicateKeys;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Fetched key counts: %@ \n Cached bitMappedMissingKeys: %lu Cached bitMappedDuplicateKeys: %lu", (uint8_t *)&v12, 0x2Au);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)registerForNotifications
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1D9452090](self, a2);
  id v4 = self;
  uint64_t v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    uint64_t v9 = v6;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@registerForEvents", (uint8_t *)&v8, 0xCu);
  }
  unint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:v4 selector:sel_handleHomeDataLoaded name:@"HMDHomeManagerHomeDataLoadedNotification" object:0];
}

- (HMDMetricsDeviceStateManager)initWithCurrentSoftwareVersion:(id)a3 logEventSubmitter:(id)a4 dailyScheduler:(id)a5 dateProvider:(id)a6 keyCountProvider:(id)a7 userDefaults:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HMDMetricsDeviceStateManager;
  uint64_t v20 = [(HMDMetricsDeviceStateManager *)&v24 init];
  if (v20)
  {
    uint64_t v21 = [(id)objc_opt_class() lastUpdateForSoftwareVersion:v14 dateProvider:v17 userDefaults:v19 updateDefaultsIfNeeded:1];
    lastSoftwareUpdateDate = v20->_lastSoftwareUpdateDate;
    v20->_lastSoftwareUpdateDate = (NSDate *)v21;

    objc_storeStrong((id *)&v20->_logEventSubmitter, a4);
    v20->_currentDataSyncState = 0;
    objc_storeWeak((id *)&v20->_dateProvider, v17);
    objc_storeStrong((id *)&v20->_keyCountProvider, a7);
    [v16 registerDailyTaskRunner:v20];
    [(HMDMetricsDeviceStateManager *)v20 registerForNotifications];
  }

  return v20;
}

- (HMDMetricsDeviceStateManager)initWithLogEventSubmitter:(id)a3 dailyScheduler:(id)a4 dateProvider:(id)a5
{
  int v8 = (void *)MEMORY[0x1E4F65548];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  int v12 = [v8 productInfo];
  v13 = [v12 softwareVersion];
  id v14 = [v13 versionString];
  id v15 = [MEMORY[0x1E4F5BE48] systemStore];
  id v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v17 = [(HMDMetricsDeviceStateManager *)self initWithCurrentSoftwareVersion:v14 logEventSubmitter:v11 dailyScheduler:v10 dateProvider:v9 keyCountProvider:v15 userDefaults:v16];

  return v17;
}

+ (int64_t)internalDeviceDaysSinceSoftwareUpdate
{
  v3 = [MEMORY[0x1E4F6A268] sharedInstance];
  id v4 = objc_opt_class();
  uint64_t v5 = [MEMORY[0x1E4F65548] productInfo];
  uint64_t v6 = [v5 softwareVersion];
  unint64_t v7 = [v6 versionString];
  int v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v9 = [v4 lastUpdateForSoftwareVersion:v7 dateProvider:v3 userDefaults:v8 updateDefaultsIfNeeded:0];

  int64_t v10 = [a1 _daysSinceSoftwareUpdateFrom:v9 dateProvider:v3];
  return v10;
}

+ (int64_t)_daysSinceSoftwareUpdateFrom:(id)a3 dateProvider:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = v6;
  if (!v6
    || (int v8 = (void *)MEMORY[0x1E4F6A268],
        [v6 startOfCurrentDay],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unint64_t v10 = [v8 daysFromDate:v5 toDate:v9],
        v9,
        (v10 & 0x8000000000000000) != 0))
  {
    int64_t v11 = -1;
  }
  else if (v10 > 0x1E)
  {
    int64_t v11 = 9999;
  }
  else
  {
    int64_t v11 = qword_1D54D37F0[v10];
  }

  return v11;
}

+ (id)lastUpdateForSoftwareVersion:(id)a3 dateProvider:(id)a4 userDefaults:(id)a5 updateDefaultsIfNeeded:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [v11 stringForKey:@"HMDMetricsDeviceStateManagerLastStoredSoftwareVersionKey"];
  uint64_t v13 = [v11 objectForKey:@"HMDMetricsDeviceStateManagerLastStoredSoftwareDateKey"];
  id v14 = (void *)v13;
  if (v12 && v13 && ([v12 isEqualToString:v9] & 1) != 0)
  {
    id v15 = v14;
  }
  else
  {
    id v15 = [v10 startOfCurrentDay];

    if (v6)
    {
      [v11 setObject:v9 forKey:@"HMDMetricsDeviceStateManagerLastStoredSoftwareVersionKey"];
      [v11 setObject:v15 forKey:@"HMDMetricsDeviceStateManagerLastStoredSoftwareDateKey"];
    }
  }

  return v15;
}

@end