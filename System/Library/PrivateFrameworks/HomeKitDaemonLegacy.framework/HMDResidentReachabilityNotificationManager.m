@interface HMDResidentReachabilityNotificationManager
+ (id)logCategory;
- (BOOL)anyEnabledResidentSupportsReachabilityNotifications;
- (BOOL)hasMultipleResidents;
- (BOOL)hasReachableResidents;
- (BOOL)isReachabilityEventNotificationEnabledForAnyCamera;
- (BOOL)notificationEnabled;
- (BOOL)shouldPostReachableNotification;
- (BOOL)shouldPostUnreachableNotification;
- (HMDBulletinBoard)bulletinBoard;
- (HMDHome)home;
- (HMDIDSServerBag)idsServerBag;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDResidentReachabilityContext)reachabilityContext;
- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4;
- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4 timerFactory:(id)a5 bulletinBoard:(id)a6;
- (HMFTimer)evaluateDebounceTimer;
- (HMFTimer)unreachableBulletinDebounceTimer;
- (OS_dispatch_queue)workQueue;
- (double)primaryResidentUnreachableTime;
- (id)_createTimer;
- (id)logIdentifier;
- (id)timerFactory;
- (void)_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:(BOOL)a3;
- (void)_handleCameraProfileSettingsDidChange:(id)a3;
- (void)_handleCameraProfileUnconfigured:(id)a3;
- (void)_handleNetworkReachabilityChange:(id)a3;
- (void)_handleResidentAdded:(id)a3;
- (void)_handleResidentRemoved:(id)a3;
- (void)_handleResidentUpdated:(id)a3;
- (void)_startDebounceTimer;
- (void)_startUnreachableBulletinDebounceTimer;
- (void)_updatePrimaryResidentLostTime:(id)a3;
- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4;
- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4 notificationCenter:(id)a5 idsServerBag:(id)a6 completionHandler:(id)a7;
- (void)setEvaluateDebounceTimer:(id)a3;
- (void)setNotificationEnabled:(BOOL)a3;
- (void)setPrimaryResidentUnreachableTime:(double)a3;
- (void)setReachabilityContext:(id)a3;
- (void)setUnreachableBulletinDebounceTimer:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateNotificationEnabled;
@end

@implementation HMDResidentReachabilityNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreachableBulletinDebounceTimer, 0);
  objc_storeStrong((id *)&self->_evaluateDebounceTimer, 0);
  objc_destroyWeak((id *)&self->_idsServerBag);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong(&self->_timerFactory, 0);
  objc_destroyWeak((id *)&self->_deviceMonitor);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_reachabilityContext, 0);
}

- (void)setPrimaryResidentUnreachableTime:(double)a3
{
  self->_primaryResidentUnreachableTime = a3;
}

- (double)primaryResidentUnreachableTime
{
  return self->_primaryResidentUnreachableTime;
}

- (void)setNotificationEnabled:(BOOL)a3
{
  self->_notificationEnabled = a3;
}

- (BOOL)notificationEnabled
{
  return self->_notificationEnabled;
}

- (void)setUnreachableBulletinDebounceTimer:(id)a3
{
}

- (HMFTimer)unreachableBulletinDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setEvaluateDebounceTimer:(id)a3
{
}

- (HMFTimer)evaluateDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 72, 1);
}

- (HMDIDSServerBag)idsServerBag
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idsServerBag);
  return (HMDIDSServerBag *)WeakRetained;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 48, 1);
}

- (id)timerFactory
{
  return objc_getProperty(self, a2, 40, 1);
}

- (HMDRemoteDeviceMonitor)deviceMonitor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceMonitor);
  return (HMDRemoteDeviceMonitor *)WeakRetained;
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (void)setReachabilityContext:(id)a3
{
}

- (HMDResidentReachabilityContext)reachabilityContext
{
  return (HMDResidentReachabilityContext *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentReachabilityNotificationManager *)self evaluateDebounceTimer];

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Debounce timer fired", (uint8_t *)&v16, 0xCu);
    }
    [(HMDResidentReachabilityNotificationManager *)v8 setEvaluateDebounceTimer:0];
    [(HMDResidentReachabilityNotificationManager *)v8 _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:1];
  }
  id v11 = [(HMDResidentReachabilityNotificationManager *)self unreachableBulletinDebounceTimer];

  if (v11 == v4)
  {
    v12 = (void *)MEMORY[0x1D9452090]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      int v16 = 138543362;
      v17 = v15;
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Unreachable Bulletin Timer fired", (uint8_t *)&v16, 0xCu);
    }
    [(HMDResidentReachabilityNotificationManager *)v13 setUnreachableBulletinDebounceTimer:0];
    [(HMDResidentReachabilityNotificationManager *)v13 _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:0];
  }
}

- (id)_createTimer
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDResidentReachabilityNotificationManager *)self idsServerBag];
  v5 = [v4 residentSelectionReachabilityNotificationAfterConnectivityDelay];

  if (v5)
  {
    uint64_t v6 = [v5 doubleValue];
    if (fabs(v7) < 2.22044605e-16)
    {
      v8 = (void *)MEMORY[0x1D9452090](v6);
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v22 = 138543362;
        v23 = v11;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@ResidentReachabilityNotificationAfterConnectivityDelay from IDS is 0.0 so disabling and not posting reachability notification", (uint8_t *)&v22, 0xCu);
      }
      v12 = 0;
      goto LABEL_11;
    }
    [v5 doubleValue];
    double v13 = v14;
  }
  else
  {
    double v13 = 600.0;
  }
  v15 = (void *)MEMORY[0x1D9452090]();
  int v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    int v22 = 138543618;
    v23 = v18;
    __int16 v24 = 2048;
    double v25 = v13;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Creating time for %f", (uint8_t *)&v22, 0x16u);
  }
  v19 = [(HMDResidentReachabilityNotificationManager *)v16 timerFactory];
  v12 = v19[2](v13);

  [v12 setDelegate:v16];
  v20 = [(HMDResidentReachabilityNotificationManager *)v16 workQueue];
  [v12 setDelegateQueue:v20];

  [v12 resume];
LABEL_11:

  return v12;
}

- (void)_startUnreachableBulletinDebounceTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDResidentReachabilityNotificationManager *)self unreachableBulletinDebounceTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Unreachable bulletin timer already active", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [(HMDResidentReachabilityNotificationManager *)self _createTimer];
    -[HMDResidentReachabilityNotificationManager setUnreachableBulletinDebounceTimer:](self, "setUnreachableBulletinDebounceTimer:");
  }
}

- (void)_startDebounceTimer
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDResidentReachabilityNotificationManager *)self evaluateDebounceTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Debounce timer already active", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [(HMDResidentReachabilityNotificationManager *)self _createTimer];
    -[HMDResidentReachabilityNotificationManager setEvaluateDebounceTimer:](self, "setEvaluateDebounceTimer:");
  }
}

- (BOOL)shouldPostUnreachableNotification
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self reachabilityContext];
  v3 = [v2 mostRecentReachability];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)shouldPostReachableNotification
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self reachabilityContext];
  v3 = [v2 mostRecentReachability];

  if (v3) {
    int v4 = [v3 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)anyEnabledResidentSupportsReachabilityNotifications
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  v3 = [v2 enabledResidents];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_41_136714);

  return v4;
}

uint64_t __97__HMDResidentReachabilityNotificationManager_anyEnabledResidentSupportsReachabilityNotifications__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 capabilities];
  uint64_t v3 = [v2 supportsCameraRecordingReachabilityNotifications];

  return v3;
}

- (BOOL)isReachabilityEventNotificationEnabledForAnyCamera
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  uint64_t v3 = [v2 accessories];

  uint64_t v20 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v4 = *(void *)v26;
    uint64_t v19 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v4) {
          objc_enumerationMutation(v3);
        }
        id v6 = *(id *)(*((void *)&v25 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          double v7 = v6;
        }
        else {
          double v7 = 0;
        }
        id v8 = v7;

        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v9 = [v8 cameraProfiles];
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "currentSettings", v19);
              if (([v14 supportedFeatures] & 2) != 0)
              {
                v15 = [v14 notificationSettings];
                char v16 = [v15 isReachabilityEventNotificationEnabled];

                if (v16)
                {

                  BOOL v17 = 1;
                  goto LABEL_24;
                }
              }
              else
              {
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }

        uint64_t v4 = v19;
      }
      BOOL v17 = 0;
      uint64_t v20 = [v3 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_24:

  return v17;
}

- (BOOL)hasMultipleResidents
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  uint64_t v3 = [v2 enabledResidents];
  uint64_t v4 = objc_msgSend(v3, "na_filter:", &__block_literal_global_38_136717);

  LOBYTE(v2) = (unint64_t)[v4 count] > 1;
  return (char)v2;
}

uint64_t __66__HMDResidentReachabilityNotificationManager_hasMultipleResidents__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 capabilities];
  uint64_t v3 = [v2 supportsCameraRecording];

  return v3;
}

- (BOOL)hasReachableResidents
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  uint64_t v3 = [v2 enabledResidents];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_36_136719);

  return v4;
}

uint64_t __67__HMDResidentReachabilityNotificationManager_hasReachableResidents__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 capabilities];
  if ([v3 supportsCameraRecording]) {
    uint64_t v4 = [v2 isReachable];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:(BOOL)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  v5 = [(HMDResidentReachabilityNotificationManager *)self deviceMonitor];
  char v6 = [v5 isReachable];

  if (v6)
  {
    double v7 = [(HMDResidentReachabilityNotificationManager *)self evaluateDebounceTimer];

    if (v7)
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v46 = 138543362;
        v47 = v11;
        uint64_t v12 = "%{public}@Debounce timer active, delaying check";
LABEL_22:
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v46, 0xCu);

        goto LABEL_23;
      }
      goto LABEL_23;
    }
    if (![(HMDResidentReachabilityNotificationManager *)self anyEnabledResidentSupportsReachabilityNotifications])
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v46 = 138543362;
        v47 = v11;
        uint64_t v12 = "%{public}@No enabled resident supports Reachability Notifications";
        goto LABEL_22;
      }
LABEL_23:

      return;
    }
    if (![(HMDResidentReachabilityNotificationManager *)self notificationEnabled])
    {
      id v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      uint64_t v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = HMFGetLogIdentifier();
        int v46 = 138543362;
        v47 = v11;
        uint64_t v12 = "%{public}@There is no camera or all camera settings disabled reachability notification";
        goto LABEL_22;
      }
      goto LABEL_23;
    }
    BOOL v17 = [(HMDResidentReachabilityNotificationManager *)self home];
    if (v17)
    {
      if ([(HMDResidentReachabilityNotificationManager *)self hasReachableResidents])
      {
        uint64_t v18 = [(HMDResidentReachabilityNotificationManager *)self unreachableBulletinDebounceTimer];
        [v18 suspend];

        uint64_t v19 = (void *)MEMORY[0x1D9452090]([(HMDResidentReachabilityNotificationManager *)self setUnreachableBulletinDebounceTimer:0]);
        uint64_t v20 = self;
        long long v21 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          long long v22 = HMFGetLogIdentifier();
          int v46 = 138543362;
          v47 = v22;
          _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Home has reachable residents supporting notification", (uint8_t *)&v46, 0xCu);
        }
        BOOL v23 = [(HMDResidentReachabilityNotificationManager *)v20 shouldPostReachableNotification];
        long long v24 = (void *)MEMORY[0x1D9452090]();
        long long v25 = v20;
        long long v26 = HMFGetOSLogHandle();
        long long v27 = v26;
        if (v23)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            long long v28 = HMFGetLogIdentifier();
            int v46 = 138543362;
            v47 = v28;
            _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Posting reachable notification", (uint8_t *)&v46, 0xCu);
          }
          v29 = [(HMDResidentReachabilityNotificationManager *)v25 bulletinBoard];
          objc_msgSend(v29, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v17, 1, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v25, "hasMultipleResidents"));

          v30 = [HMDResidentReachabilityContext alloc];
          uint64_t v31 = [(HMDResidentReachabilityContext *)v30 initWithMostRecentReachability:MEMORY[0x1E4F1CC38]];
          [(HMDResidentReachabilityNotificationManager *)v25 setReachabilityContext:v31];

          v32 = @"Posted reachable resident notification";
LABEL_33:
          [v17 saveToCurrentAccountWithReason:v32];
LABEL_40:

          return;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v33 = HMFGetLogIdentifier();
          int v46 = 138543362;
          v47 = v33;
          v34 = "%{public}@Not posting reachable notification due to no previous unreachable notification posted or previ"
                "ously posting reachable notification";
          goto LABEL_38;
        }
      }
      else
      {
        v35 = (void *)MEMORY[0x1D9452090]();
        v36 = self;
        v37 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = HMFGetLogIdentifier();
          int v46 = 138543362;
          v47 = v38;
          _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Home does not have reachable residents supporting camera recording", (uint8_t *)&v46, 0xCu);
        }
        if ([(HMDResidentReachabilityNotificationManager *)v36 shouldPostUnreachableNotification])
        {
          v39 = (void *)MEMORY[0x1D9452090]([(HMDResidentReachabilityNotificationManager *)v36 setUnreachableBulletinDebounceTimer:0]);
          v40 = v36;
          v41 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = HMFGetLogIdentifier();
            int v46 = 138543362;
            v47 = v42;
            _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Posting unreachable notification", (uint8_t *)&v46, 0xCu);
          }
          v43 = [(HMDResidentReachabilityNotificationManager *)v40 bulletinBoard];
          objc_msgSend(v43, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v17, 0, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v40, "hasMultipleResidents"));

          v44 = [HMDResidentReachabilityContext alloc];
          v45 = [(HMDResidentReachabilityContext *)v44 initWithMostRecentReachability:MEMORY[0x1E4F1CC28]];
          [(HMDResidentReachabilityNotificationManager *)v40 setReachabilityContext:v45];

          v32 = @"Posted no reachable resident notification";
          goto LABEL_33;
        }
        long long v24 = (void *)MEMORY[0x1D9452090]();
        long long v25 = v36;
        long long v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v33 = HMFGetLogIdentifier();
          int v46 = 138543362;
          v47 = v33;
          v34 = "%{public}@Not posting unreachable notification due to previously posting unreachable notification";
          goto LABEL_38;
        }
      }
    }
    else
    {
      long long v24 = (void *)MEMORY[0x1D9452090]();
      long long v25 = self;
      long long v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v33 = HMFGetLogIdentifier();
        int v46 = 138543362;
        v47 = v33;
        v34 = "%{public}@Our home has been deallocated";
LABEL_38:
        _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)&v46, 0xCu);
      }
    }

    goto LABEL_40;
  }
  double v13 = (void *)MEMORY[0x1D9452090]();
  double v14 = self;
  v15 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    char v16 = HMFGetLogIdentifier();
    int v46 = 138543362;
    v47 = v16;
    _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Network unreachable, clearing debounce timer and delaying check until reachable", (uint8_t *)&v46, 0xCu);
  }
  [(HMDResidentReachabilityNotificationManager *)v14 setEvaluateDebounceTimer:0];
}

- (void)updateNotificationEnabled
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDResidentReachabilityNotificationManager *)self isReachabilityEventNotificationEnabledForAnyCamera];
  BOOL v5 = [(HMDResidentReachabilityNotificationManager *)self notificationEnabled];
  char v6 = (void *)MEMORY[0x1D9452090]();
  double v7 = self;
  id v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v4 == v5)
  {
    if (v9)
    {
      v15 = HMFGetLogIdentifier();
      [(HMDResidentReachabilityNotificationManager *)v7 notificationEnabled];
      char v16 = HMFEnabledStatusToString();
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Resident reachability notifications not changing from %@", (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      [(HMDResidentReachabilityNotificationManager *)v7 notificationEnabled];
      uint64_t v11 = HMFEnabledStatusToString();
      uint64_t v12 = HMFEnabledStatusToString();
      int v17 = 138543874;
      uint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v11;
      __int16 v21 = 2112;
      long long v22 = v12;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Updating resident reachability notifications from %@ -> %@", (uint8_t *)&v17, 0x20u);
    }
    [(HMDResidentReachabilityNotificationManager *)v7 setNotificationEnabled:v4];
    if (![(HMDResidentReachabilityNotificationManager *)v7 notificationEnabled])
    {
      double v13 = [[HMDResidentReachabilityContext alloc] initWithMostRecentReachability:0];
      [(HMDResidentReachabilityNotificationManager *)v7 setReachabilityContext:v13];

      double v14 = [(HMDResidentReachabilityNotificationManager *)v7 home];
      [v14 saveToCurrentAccountWithReason:@"Camera reachability notification disabled"];
    }
  }
}

- (void)_handleCameraProfileUnconfigured:(id)a3
{
  BOOL v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HMDResidentReachabilityNotificationManager__handleCameraProfileUnconfigured___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDResidentReachabilityNotificationManager__handleCameraProfileUnconfigured___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  BOOL v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    id v8 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received a camera profile is unconfigured, updating notification enabled if needed", (uint8_t *)&v7, 0xCu);
  }
  return [*(id *)(a1 + 32) updateNotificationEnabled];
}

- (void)_handleCameraProfileSettingsDidChange:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __84__HMDResidentReachabilityNotificationManager__handleCameraProfileSettingsDidChange___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __84__HMDResidentReachabilityNotificationManager__handleCameraProfileSettingsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    int v13 = 138543362;
    double v14 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received camera profile settings did change notification, updating notification enabled if needed", (uint8_t *)&v13, 0xCu);
  }
  id v6 = [*(id *)(a1 + 40) userInfo];
  int v7 = objc_msgSend(v6, "hmf_BOOLForKey:", @"HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey");

  if (!v7) {
    return [*(id *)(a1 + 32) updateNotificationEnabled];
  }
  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    double v14 = v11;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Initial settings update", (uint8_t *)&v13, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "setNotificationEnabled:", objc_msgSend(*(id *)(a1 + 32), "isReachabilityEventNotificationEnabledForAnyCamera"));
}

- (void)_handleResidentUpdated:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) home];
    int v7 = [v6 name];
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Resident Reachability changed, checking home: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _updatePrimaryResidentLostTime:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:1];
}

- (void)_updatePrimaryResidentLostTime:(id)a3
{
  id v4 = a3;
  id v17 = [(HMDResidentReachabilityNotificationManager *)self home];
  BOOL v5 = [v4 userInfo];

  id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v7 = v6;
  }
  else {
    int v7 = 0;
  }
  id v8 = v7;

  int v9 = [v17 residentDeviceManager];
  uint64_t v10 = [v9 primaryResidentDevice];
  int v11 = [v8 isEqual:v10];

  uint64_t v12 = v17;
  if (v11)
  {
    uint64_t v13 = [v17 residentDeviceManager];
    double v14 = [v13 primaryResidentDevice];
    char v15 = [v14 isReachable];

    double v16 = 0.0;
    if ((v15 & 1) == 0) {
      HMFUptime();
    }
    [(HMDResidentReachabilityNotificationManager *)self setPrimaryResidentUnreachableTime:v16];
    uint64_t v12 = v17;
  }
}

- (void)_handleResidentRemoved:(id)a3
{
  id v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setEvaluateDebounceTimer:0];
  char v2 = [*(id *)(a1 + 32) anyEnabledResidentSupportsReachabilityNotifications];
  id v3 = (void *)MEMORY[0x1D9452090]();
  id v4 = *(id *)(a1 + 32);
  BOOL v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      int v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v7;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was removed, starting debounce timer", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) _startDebounceTimer];
  }
  else
  {
    if (v6)
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Last resident was reomved", (uint8_t *)&v11, 0xCu);
    }
    int v9 = [[HMDResidentReachabilityContext alloc] initWithMostRecentReachability:0];
    [*(id *)(a1 + 32) setReachabilityContext:v9];

    uint64_t v10 = [*(id *)(a1 + 32) home];
    [v10 saveToCurrentAccountWithReason:@"All residents were removed"];
  }
}

- (void)_handleResidentAdded:(id)a3
{
  id v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = HMFGetLogIdentifier();
    BOOL v6 = [*(id *)(a1 + 32) evaluateDebounceTimer];
    int v7 = [v6 isRunning];
    id v8 = &stru_1F2C9F1A8;
    if (v7) {
      id v8 = @"re";
    }
    int v10 = 138543618;
    int v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was added, %@starting debounce timer", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) setEvaluateDebounceTimer:0];
  return [*(id *)(a1 + 32) _startDebounceTimer];
}

- (void)_handleNetworkReachabilityChange:(id)a3
{
  id v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) deviceMonitor];
  int v3 = [v2 isReachable];

  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  BOOL v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      __int16 v12 = v8;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became reachable, starting debounce timer", (uint8_t *)&v11, 0xCu);
    }
    return [*(id *)(a1 + 32) _startDebounceTimer];
  }
  else
  {
    if (v7)
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      __int16 v12 = v10;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became unreachable, clearing debounce timer", (uint8_t *)&v11, 0xCu);
    }
    return [*(id *)(a1 + 32) setEvaluateDebounceTimer:0];
  }
}

- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4 notificationCenter:(id)a5 idsServerBag:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = a6;
  objc_storeWeak((id *)&self->_deviceMonitor, v13);
  objc_storeWeak((id *)&self->_home, v12);
  objc_storeWeak((id *)&self->_idsServerBag, v16);

  id v17 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __128__HMDResidentReachabilityNotificationManager_configureWithHome_deviceMonitor_notificationCenter_idsServerBag_completionHandler___block_invoke;
  block[3] = &unk_1E6A18488;
  block[4] = self;
  id v23 = v14;
  id v24 = v12;
  id v25 = v13;
  id v26 = v15;
  id v18 = v15;
  id v19 = v13;
  id v20 = v12;
  id v21 = v14;
  dispatch_async(v17, block);
}

uint64_t __128__HMDResidentReachabilityNotificationManager_configureWithHome_deviceMonitor_notificationCenter_idsServerBag_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v16 = 138543362;
    id v17 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting debounce timer", (uint8_t *)&v16, 0xCu);
  }
  [*(id *)(a1 + 32) _startDebounceTimer];
  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v6 = *(void **)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) residentDeviceManager];
  [v6 addObserver:v7 selector:sel__handleResidentUpdated_ name:@"HMDResidentDeviceManagerUpdateResidentNotification" object:v8];

  uint64_t v10 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  int v11 = [*(id *)(a1 + 48) residentDeviceManager];
  [v9 addObserver:v10 selector:sel__handleResidentAdded_ name:@"HMDResidentDeviceManagerAddResidentNotification" object:v11];

  uint64_t v13 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  id v14 = [*(id *)(a1 + 48) residentDeviceManager];
  [v12 addObserver:v13 selector:sel__handleResidentRemoved_ name:@"HMDResidentDeviceManagerRemoveResidentNotification" object:v14];

  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) selector:sel__handleNetworkReachabilityChange_ name:@"HMDRemoteDeviceMonitorReachableNotification" object:*(void *)(a1 + 56)];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) selector:sel__handleCameraProfileSettingsDidChange_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:0];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) selector:sel__handleCameraProfileUnconfigured_ name:@"HMDCameraProfileUnconfiguredNotification" object:0];
  objc_msgSend(*(id *)(a1 + 32), "setNotificationEnabled:", objc_msgSend(*(id *)(a1 + 32), "isReachabilityEventNotificationEnabledForAnyCamera"));
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  id v11 = [v6 defaultCenter];
  int v9 = [v8 homeManager];
  uint64_t v10 = [v9 idsServerBag];
  [(HMDResidentReachabilityNotificationManager *)self configureWithHome:v8 deviceMonitor:v7 notificationCenter:v11 idsServerBag:v10 completionHandler:0];
}

- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4 timerFactory:(id)a5 bulletinBoard:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HMDResidentReachabilityNotificationManager;
  id v15 = [(HMDResidentReachabilityNotificationManager *)&v20 init];
  int v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reachabilityContext, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    id v17 = _Block_copy(v13);
    id timerFactory = v16->_timerFactory;
    v16->_id timerFactory = v17;

    objc_storeStrong((id *)&v16->_bulletinBoard, a6);
    v16->_notificationEnabled = 0;
  }

  return v16;
}

- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDBulletinBoard sharedBulletinBoard];
  int v9 = [(HMDResidentReachabilityNotificationManager *)self initWithResidentReachabilityContext:v7 workQueue:v6 timerFactory:&__block_literal_global_136775 bulletinBoard:v8];

  return v9;
}

id __92__HMDResidentReachabilityNotificationManager_initWithResidentReachabilityContext_workQueue___block_invoke(double a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:0 options:a1];
  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t31_136781 != -1) {
    dispatch_once(&logCategory__hmf_once_t31_136781, &__block_literal_global_43_136782);
  }
  char v2 = (void *)logCategory__hmf_once_v32_136783;
  return v2;
}

uint64_t __57__HMDResidentReachabilityNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v32_136783;
  logCategory__hmf_once_v32_136783 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end