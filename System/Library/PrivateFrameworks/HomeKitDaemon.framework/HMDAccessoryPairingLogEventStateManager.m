@interface HMDAccessoryPairingLogEventStateManager
+ (HMDAccessoryPairingLogEventStateManager)sharedManager;
+ (id)logCategory;
- (BOOL)isConfigured;
- (HMDAccessoryPairingEvent)pairingEvent;
- (HMDAccessoryPairingLogEventStateManager)initWithNotificationCenter:(id)a3;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NSDate)lastPairingEndTime;
- (NSMutableDictionary)pairingProgressStateTracker;
- (NSMutableDictionary)retryCountMap;
- (NSNotificationCenter)notificationCenter;
- (OS_dispatch_queue)workQueue;
- (double)getTimeDurationForLongestProgressStateForAccessory:(id)a3;
- (double)getTimeDurationForProgressStateForIdentifier:(id)a3 state:(id)a4;
- (id)getLastProgressStateForAccessory:(id)a3;
- (id)getLongestProgressStateForAccessory:(id)a3;
- (unint64_t)pairingUIState;
- (unint64_t)previousRecoveryType;
- (unint64_t)recoveryType;
- (unint64_t)retryCountForIdentifier:(id)a3;
- (void)_handleMatterAccessoryUpdatePairingMetricNotification:(id)a3 pairingEvent:(id)a4 logEventSubmitter:(id)a5;
- (void)_handlePairingStateProgressNotification:(id)a3;
- (void)_updateStateOnPairingProgress:(int64_t)a3;
- (void)clearPairingProgressStateTrackerForIdentifier:(id)a3;
- (void)clearRetryCountMap;
- (void)configureWithPairingEvent:(id)a3 workQueue:(id)a4 logEventSubmitter:(id)a5;
- (void)fillUnknownErrorIfMissingErrorForPairingEvent:(id)a3;
- (void)handleMatterAccessoryUpdatePairingMetricNotification:(id)a3;
- (void)incrementRetryCount:(id)a3;
- (void)resetStatesForNewAddOperation;
- (void)setLastPairingEndTime:(id)a3;
- (void)setLogEventSubmitter:(id)a3;
- (void)setPairingEvent:(id)a3;
- (void)setPairingUIState:(unint64_t)a3;
- (void)setPreviousRecoveryType:(unint64_t)a3;
- (void)setRecoveryType:(unint64_t)a3;
- (void)setWorkQueue:(id)a3;
- (void)startProgressStateTrackerWithDate:(id)a3 identifier:(id)a4;
- (void)updateLastPairingProgressStateEventForIdentifier:(id)a3 withDate:(id)a4;
- (void)updatePairingProgressState:(id)a3;
- (void)updateStatesOnResult:(BOOL)a3;
@end

@implementation HMDAccessoryPairingLogEventStateManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pairingEvent);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_pairingProgressStateTracker, 0);
  objc_storeStrong((id *)&self->_retryCountMap, 0);
  objc_storeStrong((id *)&self->_lastPairingEndTime, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
}

- (void)setPairingEvent:(id)a3
{
}

- (HMDAccessoryPairingEvent)pairingEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingEvent);
  return (HMDAccessoryPairingEvent *)WeakRetained;
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (NSMutableDictionary)pairingProgressStateTracker
{
  return self->_pairingProgressStateTracker;
}

- (NSMutableDictionary)retryCountMap
{
  return self->_retryCountMap;
}

- (void)setLastPairingEndTime:(id)a3
{
}

- (NSDate)lastPairingEndTime
{
  return self->_lastPairingEndTime;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setLogEventSubmitter:(id)a3
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void)setPreviousRecoveryType:(unint64_t)a3
{
  self->_previousRecoveryType = a3;
}

- (unint64_t)previousRecoveryType
{
  return self->_previousRecoveryType;
}

- (void)setRecoveryType:(unint64_t)a3
{
  self->_recoveryType = a3;
}

- (unint64_t)recoveryType
{
  return self->_recoveryType;
}

- (void)setPairingUIState:(unint64_t)a3
{
  self->_pairingUIState = a3;
}

- (unint64_t)pairingUIState
{
  return self->_pairingUIState;
}

- (void)resetStatesForNewAddOperation
{
  [(HMDAccessoryPairingLogEventStateManager *)self setPairingUIState:0];
  v3 = [(HMDAccessoryPairingLogEventStateManager *)self lastPairingEndTime];
  [v3 timeIntervalSinceNow];
  double v5 = fabs(v4);

  if (v5 > 300.0)
  {
    [(HMDAccessoryPairingLogEventStateManager *)self setPreviousRecoveryType:0];
  }
}

- (double)getTimeDurationForProgressStateForIdentifier:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  double v9 = 0.0;
  if (v7)
  {
    v10 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
    v11 = [v10 objectForKey:v6];

    if (v11)
    {
      v12 = [v11 progressStateMap];
      v13 = [v12 objectForKey:v7];
      [v13 doubleValue];
      double v9 = v14 * 1000.0;
    }
  }
  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);

  return v9;
}

- (double)getTimeDurationForLongestProgressStateForAccessory:(id)a3
{
  id v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    [v7 getTimeDurationForLongestProgressState];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
  return v9;
}

- (id)getLastProgressStateForAccessory:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    double v8 = (void *)MEMORY[0x230FBD990]();
    double v9 = self;
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = [v7 progressStateMap];
      int v15 = 138543874;
      id v16 = v11;
      __int16 v17 = 2114;
      id v18 = v4;
      __int16 v19 = 2114;
      v20 = v12;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Final pairing progress state map before metric submission for identifier %{public}@ - %{public}@", (uint8_t *)&v15, 0x20u);
    }
    v13 = [v7 lastProgressState];
  }
  else
  {
    v13 = 0;
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
  return v13;
}

- (id)getLongestProgressStateForAccessory:(id)a3
{
  id v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  id v6 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  id v7 = [v6 objectForKey:v4];

  if (v7)
  {
    double v8 = [v7 longestProgressState];
  }
  else
  {
    double v8 = 0;
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
  return v8;
}

- (void)clearPairingProgressStateTrackerForIdentifier:(id)a3
{
  id v8 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  double v5 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  id v6 = [v5 objectForKey:v8];

  if (v6)
  {
    id v7 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
    [v7 removeObjectForKey:v8];
  }
  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
}

- (void)updateLastPairingProgressStateEventForIdentifier:(id)a3 withDate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  double v9 = [v8 objectForKey:v10];

  [v9 updateWithProgressState:0 date:v6];
  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
}

- (void)_updateStateOnPairingProgress:(int64_t)a3
{
  v3 = self;
  uint64_t v21 = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case '/':
      uint64_t v4 = 1;
      goto LABEL_9;
    case '0':
      uint64_t v4 = 2;
      goto LABEL_9;
    case '1':
      uint64_t v4 = 3;
      goto LABEL_9;
    case '2':
      uint64_t v4 = 4;
LABEL_9:
      self = (HMDAccessoryPairingLogEventStateManager *)[(HMDAccessoryPairingLogEventStateManager *)self setRecoveryType:v4];
      goto LABEL_12;
    default:
      if (a3 == 3)
      {
        uint64_t v5 = 2;
      }
      else
      {
        if (a3 != 2) {
          goto LABEL_12;
        }
        uint64_t v5 = 1;
      }
      self = (HMDAccessoryPairingLogEventStateManager *)[(HMDAccessoryPairingLogEventStateManager *)self setPairingUIState:v5];
LABEL_12:
      id v6 = (void *)MEMORY[0x230FBD990](self);
      id v7 = v3;
      id v8 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        double v9 = HMFGetLogIdentifier();
        uint64_t v10 = [(HMDAccessoryPairingLogEventStateManager *)v7 pairingUIState];
        uint64_t v11 = [(HMDAccessoryPairingLogEventStateManager *)v7 recoveryType];
        v12 = HMSetupAccessoryProgressAsString();
        int v13 = 138544130;
        double v14 = v9;
        __int16 v15 = 2048;
        uint64_t v16 = v10;
        __int16 v17 = 2048;
        uint64_t v18 = v11;
        __int16 v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updated Pairing UI state: %lu, recoveryType: %lu on progress: %@", (uint8_t *)&v13, 0x2Au);
      }
      return;
  }
}

- (void)updatePairingProgressState:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  id v6 = [v4 objectForKey:@"HMDAccessoryProgressStateNotificationKey"];
  id v7 = [v4 objectForKey:@"HMDAccessoryProgressStateTimeNotificationKey"];
  id v8 = [v4 objectForKey:@"HMDAccessoryProgressStateforAccessoryKey"];
  double v9 = objc_msgSend(v4, "hmf_numberForKey:", @"HMDSetupAccessoryProgressStateKey");
  uint64_t v10 = [v9 integerValue];

  [(HMDAccessoryPairingLogEventStateManager *)self _updateStateOnPairingProgress:v10];
  uint64_t v11 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  v12 = [v11 objectForKey:v8];

  if (v12)
  {
    [v12 updateWithProgressState:v6 date:v7];
  }
  else
  {
    int v13 = (void *)MEMORY[0x230FBD990]();
    double v14 = self;
    HMFGetOSLogHandle();
    __int16 v15 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      uint64_t v18 = v16;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Attempting to update an uninitialized progress state map for %@", (uint8_t *)&v17, 0x16u);
    }
  }

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
}

- (void)startProgressStateTrackerWithDate:(id)a3 identifier:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  p_accessoryPairingProgressStateTrackerLock = &self->_accessoryPairingProgressStateTrackerLock;
  os_unfair_lock_lock_with_options();
  id v8 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  [v8 removeObjectForKey:v6];

  double v9 = [(HMDAccessoryPairingLogEventStateManager *)self pairingProgressStateTracker];
  uint64_t v10 = [[HMDAccessoryPairingProgressStateMap alloc] initWithDate:v11];
  [v9 setObject:v10 forKey:v6];

  os_unfair_lock_unlock(p_accessoryPairingProgressStateTrackerLock);
}

- (void)_handlePairingStateProgressNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v8 = HMFGetLogIdentifier();
    double v9 = [v4 name];
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2112;
    double v14 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_DEBUG, "%{public}@Received accessory pairing progress notification %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v10 = [v4 userInfo];
  [(HMDAccessoryPairingLogEventStateManager *)v6 updatePairingProgressState:v10];
}

- (void)incrementRetryCount:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  uint64_t v6 = os_unfair_lock_lock_with_options();
  id v7 = (void *)MEMORY[0x230FBD990](v6);
  id v8 = self;
  HMFGetOSLogHandle();
  double v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = HMFGetLogIdentifier();
    int v15 = 138543618;
    uint64_t v16 = v10;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Incrementing retry count for identifier %@", (uint8_t *)&v15, 0x16u);
  }
  int v11 = [(HMDAccessoryPairingLogEventStateManager *)v8 retryCountMap];
  v12 = [v11 objectForKeyedSubscript:v4];

  if (v12)
  {
    __int16 v13 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v12, "intValue") + 1);
    double v14 = [(HMDAccessoryPairingLogEventStateManager *)v8 retryCountMap];
    [v14 setObject:v13 forKeyedSubscript:v4];
  }
  else
  {
    __int16 v13 = [(HMDAccessoryPairingLogEventStateManager *)v8 retryCountMap];
    [v13 setObject:&unk_26E471770 forKeyedSubscript:v4];
  }

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
}

- (void)updateStatesOnResult:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  os_unfair_lock_lock_with_options();
  if (v3)
  {
    unint64_t v6 = 0;
  }
  else
  {
    if (![(HMDAccessoryPairingLogEventStateManager *)self recoveryType]) {
      goto LABEL_6;
    }
    unint64_t v6 = [(HMDAccessoryPairingLogEventStateManager *)self recoveryType];
  }
  [(HMDAccessoryPairingLogEventStateManager *)self setPreviousRecoveryType:v6];
LABEL_6:
  [(HMDAccessoryPairingLogEventStateManager *)self setRecoveryType:0];
  id v7 = [MEMORY[0x263EFF910] date];
  [(HMDAccessoryPairingLogEventStateManager *)self setLastPairingEndTime:v7];

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
  id v8 = (void *)MEMORY[0x230FBD990]();
  double v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = HMFGetLogIdentifier();
    int v12 = 138543618;
    __int16 v13 = v11;
    __int16 v14 = 2048;
    uint64_t v15 = [(HMDAccessoryPairingLogEventStateManager *)v9 previousRecoveryType];
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Updated previous recoveryType to: %lu", (uint8_t *)&v12, 0x16u);
  }
}

- (void)clearRetryCountMap
{
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  os_unfair_lock_lock_with_options();
  id v4 = [(HMDAccessoryPairingLogEventStateManager *)self retryCountMap];
  [v4 removeAllObjects];

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
}

- (unint64_t)retryCountForIdentifier:(id)a3
{
  id v4 = a3;
  p_accessoryPairingRetryMapLock = &self->_accessoryPairingRetryMapLock;
  os_unfair_lock_lock_with_options();
  unint64_t v6 = [(HMDAccessoryPairingLogEventStateManager *)self retryCountMap];
  id v7 = [v6 objectForKeyedSubscript:v4];
  unint64_t v8 = [v7 unsignedIntegerValue];

  os_unfair_lock_unlock(p_accessoryPairingRetryMapLock);
  return v8;
}

- (void)fillUnknownErrorIfMissingErrorForPairingEvent:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 matterAccessoryPairingStep];
  unint64_t v6 = [v4 error];

  if (v5 != 25 && !v6)
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    unint64_t v8 = self;
    double v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      __int16 v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Filling unknown error before submission because pairing event is missing error", (uint8_t *)&v12, 0xCu);
    }
    int v11 = [MEMORY[0x263F087E8] hmdErrorWithCode:1];
    [v4 setError:v11];

    [v4 setMatterAccessorySourceErrorDomain:@"HMDErrorDomain"];
  }
}

- (void)_handleMatterAccessoryUpdatePairingMetricNotification:(id)a3 pairingEvent:(id)a4 logEventSubmitter:(id)a5
{
  uint64_t v92 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  p_matterAccessoryPairingMetricLock = &self->_matterAccessoryPairingMetricLock;
  uint64_t v12 = os_unfair_lock_lock_with_options();
  __int16 v13 = (void *)MEMORY[0x230FBD990](v12);
  uint64_t v14 = self;
  HMFGetOSLogHandle();
  uint64_t v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v17 = [v8 name];
    *(_DWORD *)buf = 138543618;
    id v83 = v16;
    __int16 v84 = 2112;
    id v85 = v17;
    _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Handling %@", buf, 0x16u);
  }
  if (!v9)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    v22 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v83 = v23;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is nil", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (([v9 isMatterAccessory] & 1) == 0)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    v24 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v83 = v25;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is not for matter accessory", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (([v9 isAddOperation] & 1) == 0)
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    v26 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v83 = v27;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is not add operation", buf, 0xCu);
    }
    goto LABEL_18;
  }
  if ([v9 isSubmitted])
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    uint64_t v19 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v83 = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is already submitted", buf, 0xCu);
    }
LABEL_18:

    goto LABEL_19;
  }
  if ([v9 isSubmitting])
  {
    id v18 = (void *)MEMORY[0x230FBD990]();
    v28 = v14;
    HMFGetOSLogHandle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v29 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      id v83 = v29;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Not updating pairing metric because pairing event is already being submitted", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v30 = [v9 error];

  uint64_t v31 = [v9 matterAccessoryPairingStep];
  if (v30 || v31 == 25)
  {
    context = (void *)MEMORY[0x230FBD990](v31);
    v32 = v14;
    HMFGetOSLogHandle();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      id v34 = (id)objc_claimAutoreleasedReturnValue();
      HMDMatterAccessoryPairingStepAsString([v9 matterAccessoryPairingStep]);
      id v35 = (id)objc_claimAutoreleasedReturnValue();
      v36 = [v9 error];
      *(_DWORD *)buf = 138543874;
      id v83 = v34;
      __int16 v84 = 2112;
      id v85 = v35;
      __int16 v86 = 2112;
      v87 = v36;
      _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Received update to pairing event when metric is completed already %@ %@", buf, 0x20u);
    }
  }
  v37 = [v8 userInfo];
  contexta = [v37 objectForKeyedSubscript:@"HMDMatterAccessoryPairingMTRMetricsKey"];

  if (contexta)
  {
    v38 = (void *)MEMORY[0x230FBD990]();
    v39 = v14;
    HMFGetOSLogHandle();
    v40 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v41 = (id)objc_claimAutoreleasedReturnValue();
      v42 = [v9 mtrMetrics];
      *(_DWORD *)buf = 138543874;
      id v83 = v41;
      __int16 v84 = 2048;
      id v85 = v42;
      __int16 v86 = 2048;
      v87 = contexta;
      _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Updating mtr metrics %p -> %p", buf, 0x20u);
    }
    [v9 setMtrMetrics:contexta];
  }
  v43 = [v8 userInfo];
  id v81 = 0;
  unint64_t v44 = objc_msgSend(v43, "hmf_integerForKey:error:", @"HMDMatterAccessoryPairingStepKey", &v81);
  id v78 = v81;

  if ([v78 code] == 3)
  {
    v45 = (void *)MEMORY[0x230FBD990]();
    v46 = v14;
    HMFGetOSLogHandle();
    v47 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v83 = v48;
      __int16 v84 = 2112;
      id v85 = v78;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to updating pairing metric with error %@", buf, 0x16u);
    }
  }
  else
  {
    if (!v78)
    {
      v76 = (void *)MEMORY[0x230FBD990]();
      v49 = v14;
      HMFGetOSLogHandle();
      v50 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v74 = (id)objc_claimAutoreleasedReturnValue();
        HMDMatterAccessoryPairingStepAsString([v9 matterAccessoryPairingStep]);
        id v51 = (id)objc_claimAutoreleasedReturnValue();
        v52 = HMDMatterAccessoryPairingStepAsString(v44);
        *(_DWORD *)buf = 138543874;
        id v83 = v74;
        __int16 v84 = 2112;
        id v85 = v51;
        __int16 v86 = 2112;
        v87 = v52;
        _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Updating step %@ -> %@", buf, 0x20u);
      }
      [v9 setMatterAccessoryPairingStep:v44];
    }
    v53 = [v8 userInfo];
    v77 = objc_msgSend(v53, "hmf_errorForKey:", @"HMDMatterAccessoryPairingFailureErrorKey");

    if (v77)
    {
      v54 = [v8 userInfo];
      v75 = objc_msgSend(v54, "hmf_stringForKey:", @"HMDMatterAccessoryPairingSourceErrorDomain");

      if (!v75)
      {
        v55 = (void *)MEMORY[0x230FBD990]();
        v56 = v14;
        HMFGetOSLogHandle();
        v57 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        {
          v58 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          id v83 = v58;
          _os_log_impl(&dword_22F52A000, v57, OS_LOG_TYPE_ERROR, "%{public}@Received pairing error without source error domain", buf, 0xCu);
        }
      }
      v59 = (void *)MEMORY[0x263F087E8];
      v60 = [v77 domain];
      v73 = objc_msgSend(v59, "errorWithDomain:code:userInfo:", v60, objc_msgSend(v77, "code"), 0);

      v72 = (void *)MEMORY[0x230FBD990]();
      v61 = v14;
      HMFGetOSLogHandle();
      v62 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v63 = (id)objc_claimAutoreleasedReturnValue();
        v64 = [v9 error];
        v65 = [v9 matterAccessorySourceErrorDomain];
        *(_DWORD *)buf = 138544386;
        id v83 = v63;
        __int16 v84 = 2112;
        id v85 = v64;
        __int16 v86 = 2112;
        v87 = v73;
        __int16 v88 = 2112;
        v89 = v65;
        __int16 v90 = 2112;
        v91 = v75;
        _os_log_impl(&dword_22F52A000, v62, OS_LOG_TYPE_INFO, "%{public}@Updating error %@ -> %@, sourceErrorDomain %@ -> %@", buf, 0x34u);
      }
      [v9 setError:v73];
      [v9 setMatterAccessorySourceErrorDomain:v75];
    }
    v66 = [v8 userInfo];
    int v67 = objc_msgSend(v66, "hmf_BOOLForKey:", @"HMDMatterAccessoryPairingSubmitKey");

    if (v67)
    {
      v68 = (void *)MEMORY[0x230FBD990]([(HMDAccessoryPairingLogEventStateManager *)v14 fillUnknownErrorIfMissingErrorForPairingEvent:v9]);
      v69 = v14;
      HMFGetOSLogHandle();
      v70 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v83 = v71;
        __int16 v84 = 2112;
        id v85 = v9;
        _os_log_impl(&dword_22F52A000, v70, OS_LOG_TYPE_INFO, "%{public}@Submitting Event %@", buf, 0x16u);
      }
      [v9 setSubmitting:1];
      [v10 submitLogEvent:v9];
    }
  }
LABEL_19:
  os_unfair_lock_unlock(p_matterAccessoryPairingMetricLock);
}

- (void)handleMatterAccessoryUpdatePairingMetricNotification:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(HMDAccessoryPairingLogEventStateManager *)self isConfigured];
  unint64_t v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = [v4 name];
      uint64_t v12 = [(HMDAccessoryPairingLogEventStateManager *)v7 pairingEvent];
      *(_DWORD *)buf = 138543874;
      v25 = v10;
      __int16 v26 = 2112;
      v27 = v11;
      __int16 v28 = 2112;
      v29 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling %@ %@", buf, 0x20u);
    }
    __int16 v13 = [(HMDAccessoryPairingLogEventStateManager *)v7 pairingEvent];
    uint64_t v14 = [(HMDAccessoryPairingLogEventStateManager *)v7 logEventSubmitter];
    uint64_t v15 = [(HMDAccessoryPairingLogEventStateManager *)v7 workQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __96__HMDAccessoryPairingLogEventStateManager_handleMatterAccessoryUpdatePairingMetricNotification___block_invoke;
    v20[3] = &unk_264A2E610;
    v20[4] = v7;
    id v21 = v4;
    id v22 = v13;
    id v23 = v14;
    id v16 = v14;
    id v17 = v13;
    dispatch_async(v15, v20);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v18 = HMFGetLogIdentifier();
      uint64_t v19 = [v4 name];
      *(_DWORD *)buf = 138543618;
      v25 = v18;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Not handling %@ logEventStateManager is not configured", buf, 0x16u);
    }
  }
}

uint64_t __96__HMDAccessoryPairingLogEventStateManager_handleMatterAccessoryUpdatePairingMetricNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleMatterAccessoryUpdatePairingMetricNotification:*(void *)(a1 + 40) pairingEvent:*(void *)(a1 + 48) logEventSubmitter:*(void *)(a1 + 56)];
}

- (BOOL)isConfigured
{
  BOOL v3 = [(HMDAccessoryPairingLogEventStateManager *)self pairingEvent];
  if (v3)
  {
    id v4 = [(HMDAccessoryPairingLogEventStateManager *)self workQueue];
    if (v4)
    {
      BOOL v5 = [(HMDAccessoryPairingLogEventStateManager *)self logEventSubmitter];
      BOOL v6 = v5 != 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)configureWithPairingEvent:(id)a3 workQueue:(id)a4 logEventSubmitter:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v15 = [(HMDAccessoryPairingLogEventStateManager *)v12 workQueue];
    id v16 = [(HMDAccessoryPairingLogEventStateManager *)v12 logEventSubmitter];
    int v17 = 138544386;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    __int16 v23 = 2112;
    v24 = v15;
    __int16 v25 = 2112;
    __int16 v26 = v16;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring with workQueue %@ logEventSubmitter %@, from workQueue %@ logEventSubmitter %@", (uint8_t *)&v17, 0x34u);
  }
  [(HMDAccessoryPairingLogEventStateManager *)v12 setPairingEvent:v8];
  [(HMDAccessoryPairingLogEventStateManager *)v12 setWorkQueue:v9];
  [(HMDAccessoryPairingLogEventStateManager *)v12 setLogEventSubmitter:v10];
}

- (HMDAccessoryPairingLogEventStateManager)initWithNotificationCenter:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDAccessoryPairingLogEventStateManager;
  BOOL v6 = [(HMDAccessoryPairingLogEventStateManager *)&v14 init];
  if (v6)
  {
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    retryCountMap = v6->_retryCountMap;
    v6->_retryCountMap = v7;

    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionary];
    pairingProgressStateTracker = v6->_pairingProgressStateTracker;
    v6->_pairingProgressStateTracker = (NSMutableDictionary *)v9;

    v6->_pairingUIState = 0;
    v6->_recoveryType = 0;
    v6->_previousRecoveryType = 0;
    uint64_t v11 = [MEMORY[0x263EFF910] distantPast];
    lastPairingEndTime = v6->_lastPairingEndTime;
    v6->_lastPairingEndTime = (NSDate *)v11;

    objc_storeStrong((id *)&v6->_notificationCenter, a3);
    [(NSNotificationCenter *)v6->_notificationCenter addObserver:v6 selector:sel_handleMatterAccessoryUpdatePairingMetricNotification_ name:@"HMDMatterAccessoryUpdatePairingMetricNotification" object:0];
    [(NSNotificationCenter *)v6->_notificationCenter addObserver:v6 selector:sel__handlePairingStateProgressNotification_ name:@"HMDAccessoryProgressStateUpdateNotification" object:0];
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_106684 != -1) {
    dispatch_once(&logCategory__hmf_once_t42_106684, &__block_literal_global_106685);
  }
  v2 = (void *)logCategory__hmf_once_v43_106686;
  return v2;
}

void __54__HMDAccessoryPairingLogEventStateManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v43_106686;
  logCategory__hmf_once_v43_106686 = v0;
}

+ (HMDAccessoryPairingLogEventStateManager)sharedManager
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMDAccessoryPairingLogEventStateManager_sharedManager__block_invoke;
  block[3] = &unk_264A2F7F8;
  id v8 = v2;
  uint64_t v3 = sharedManager__hmf_once_t4;
  id v4 = v2;
  if (v3 != -1) {
    dispatch_once(&sharedManager__hmf_once_t4, block);
  }
  id v5 = (HMDAccessoryPairingLogEventStateManager *)(id)sharedManager__hmf_once_v5;

  return v5;
}

void __56__HMDAccessoryPairingLogEventStateManager_sharedManager__block_invoke(uint64_t a1)
{
  v1 = [[HMDAccessoryPairingLogEventStateManager alloc] initWithNotificationCenter:*(void *)(a1 + 32)];
  v2 = (void *)sharedManager__hmf_once_v5;
  sharedManager__hmf_once_id v5 = (uint64_t)v1;
}

@end