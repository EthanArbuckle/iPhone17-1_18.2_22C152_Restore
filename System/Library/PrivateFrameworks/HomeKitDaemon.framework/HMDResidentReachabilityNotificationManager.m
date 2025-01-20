@interface HMDResidentReachabilityNotificationManager
+ (id)logCategory;
- (BOOL)anyEnabledResidentSupportsReachabilityNotifications;
- (BOOL)hasMultipleResidents;
- (BOOL)hasReachableResidents;
- (BOOL)isUserPreferredReachable;
- (BOOL)notificationEnabled;
- (BOOL)shouldPostReachableNotification;
- (BOOL)shouldPostUnreachableNotification;
- (BOOL)shouldPostUserPreferredReachableNotification;
- (BOOL)shouldPostUserPreferredUnreachableNotification;
- (HMDBulletinBoard)bulletinBoard;
- (HMDHome)home;
- (HMDIDSServerBag)idsServerBag;
- (HMDRemoteDeviceMonitor)deviceMonitor;
- (HMDResidentReachabilityContext)reachabilityContext;
- (HMDResidentReachabilityContext)userPreferredReachabilityContext;
- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4;
- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4 timerFactory:(id)a5 bulletinBoard:(id)a6;
- (HMFTimer)evaluateDebounceTimer;
- (HMFTimer)unreachableBulletinDebounceTimer;
- (HMFTimer)userPreferredReachabilityBulletinDebounceTimer;
- (NSString)electedPrimary;
- (NSString)previousPrimary;
- (OS_dispatch_queue)workQueue;
- (double)primaryResidentUnreachableTime;
- (id)_createTimer;
- (id)logIdentifier;
- (id)timerFactory;
- (void)_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:(BOOL)a3;
- (void)_handleNetworkReachabilityChange:(id)a3;
- (void)_handleResidentAdded:(id)a3;
- (void)_handleResidentRemoved:(id)a3;
- (void)_handleResidentUpdated:(id)a3;
- (void)_handleUserPreferredReachabilityBulletinDebounceTimer;
- (void)_handleUserPreferredResidentReachable:(id)a3;
- (void)_startDebounceTimer;
- (void)_startUnreachableBulletinDebounceTimer;
- (void)_updatePrimaryResidentLostTime:(id)a3;
- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4;
- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4 notificationCenter:(id)a5 idsServerBag:(id)a6 completionHandler:(id)a7;
- (void)setElectedPrimary:(id)a3;
- (void)setEvaluateDebounceTimer:(id)a3;
- (void)setIsUserPreferredReachable:(BOOL)a3;
- (void)setNotificationEnabled:(BOOL)a3;
- (void)setPreviousPrimary:(id)a3;
- (void)setPrimaryResidentUnreachableTime:(double)a3;
- (void)setReachabilityContext:(id)a3;
- (void)setUnreachableBulletinDebounceTimer:(id)a3;
- (void)setUserPreferredReachabilityBulletinDebounceTimer:(id)a3;
- (void)setUserPreferredReachabilityContext:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDResidentReachabilityNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPreferredReachabilityContext, 0);
  objc_storeStrong((id *)&self->_electedPrimary, 0);
  objc_storeStrong((id *)&self->_previousPrimary, 0);
  objc_storeStrong((id *)&self->_userPreferredReachabilityBulletinDebounceTimer, 0);
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

- (void)setUserPreferredReachabilityContext:(id)a3
{
}

- (HMDResidentReachabilityContext)userPreferredReachabilityContext
{
  return (HMDResidentReachabilityContext *)objc_getProperty(self, a2, 120, 1);
}

- (void)setIsUserPreferredReachable:(BOOL)a3
{
  self->_isUserPreferredReachable = a3;
}

- (BOOL)isUserPreferredReachable
{
  return self->_isUserPreferredReachable;
}

- (void)setElectedPrimary:(id)a3
{
}

- (NSString)electedPrimary
{
  return self->_electedPrimary;
}

- (void)setPreviousPrimary:(id)a3
{
}

- (NSString)previousPrimary
{
  return self->_previousPrimary;
}

- (void)setUserPreferredReachabilityBulletinDebounceTimer:(id)a3
{
}

- (HMFTimer)userPreferredReachabilityBulletinDebounceTimer
{
  return self->_userPreferredReachabilityBulletinDebounceTimer;
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
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentReachabilityNotificationManager *)self evaluateDebounceTimer];

  if (v6 == v4)
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Debounce timer fired", (uint8_t *)&v21, 0xCu);
    }
    [(HMDResidentReachabilityNotificationManager *)v8 setEvaluateDebounceTimer:0];
    [(HMDResidentReachabilityNotificationManager *)v8 _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:1];
  }
  id v11 = [(HMDResidentReachabilityNotificationManager *)self unreachableBulletinDebounceTimer];

  if (v11 == v4)
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Unreachable Bulletin Timer fired", (uint8_t *)&v21, 0xCu);
    }
    [(HMDResidentReachabilityNotificationManager *)v13 setUnreachableBulletinDebounceTimer:0];
    [(HMDResidentReachabilityNotificationManager *)v13 _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:0];
  }
  id v16 = [(HMDResidentReachabilityNotificationManager *)self userPreferredReachabilityBulletinDebounceTimer];

  if (v16 == v4)
  {
    v17 = (void *)MEMORY[0x230FBD990]();
    v18 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = HMFGetLogIdentifier();
      int v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@User preferred resident Reachability Bulletin Timer fired", (uint8_t *)&v21, 0xCu);
    }
    [(HMDResidentReachabilityNotificationManager *)v18 setUserPreferredReachabilityBulletinDebounceTimer:0];
    [(HMDResidentReachabilityNotificationManager *)v18 _handleUserPreferredReachabilityBulletinDebounceTimer];
  }
}

- (id)_createTimer
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDResidentReachabilityNotificationManager *)self idsServerBag];
  v5 = [v4 residentSelectionReachabilityNotificationAfterConnectivityDelay];

  if (v5)
  {
    uint64_t v6 = [v5 doubleValue];
    if (fabs(v7) < 2.22044605e-16)
    {
      v8 = (void *)MEMORY[0x230FBD990](v6);
      v9 = self;
      v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = HMFGetLogIdentifier();
        int v22 = 138543362;
        uint64_t v23 = v11;
        _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@ResidentReachabilityNotificationAfterConnectivityDelay from IDS is 0.0 so disabling and not posting reachability notification", (uint8_t *)&v22, 0xCu);
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
  v15 = (void *)MEMORY[0x230FBD990]();
  id v16 = self;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = HMFGetLogIdentifier();
    int v22 = 138543618;
    uint64_t v23 = v18;
    __int16 v24 = 2048;
    double v25 = v13;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Creating time for %f", (uint8_t *)&v22, 0x16u);
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
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentReachabilityNotificationManager *)self unreachableBulletinDebounceTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Unreachable bulletin timer already active", buf, 0xCu);
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
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = [(HMDResidentReachabilityNotificationManager *)self evaluateDebounceTimer];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    v5 = self;
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Debounce timer already active", buf, 0xCu);
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
  uint64_t v4 = [v3 count];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v5 = [v2 accessories];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __97__HMDResidentReachabilityNotificationManager_anyEnabledResidentSupportsReachabilityNotifications__block_invoke;
  v7[3] = &unk_264A261E8;
  v7[4] = &v8;
  [v5 enumerateObjectsUsingBlock:v7];

  if (v4) {
    LOBYTE(v4) = *((unsigned char *)v9 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __97__HMDResidentReachabilityNotificationManager_anyEnabledResidentSupportsReachabilityNotifications__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v7 = v6;
  }
  else {
    double v7 = 0;
  }
  id v8 = v7;
  id v14 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v14;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v8)
  {
    char v11 = [v8 hostAccessory];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v13 = isKindOfClass ^ 1 | (v11 == 0);
    if (v10) {
      goto LABEL_12;
    }
LABEL_11:
    if ((v13 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  char v13 = 0;
  if (!v10) {
    goto LABEL_11;
  }
LABEL_12:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  *a4 = 1;
LABEL_13:
}

- (BOOL)hasMultipleResidents
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  v3 = [v2 enabledResidents];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)hasReachableResidents
{
  v2 = [(HMDResidentReachabilityNotificationManager *)self home];
  v3 = [v2 enabledResidents];
  char v4 = objc_msgSend(v3, "na_any:", &__block_literal_global_41_198999);

  return v4;
}

uint64_t __67__HMDResidentReachabilityNotificationManager_hasReachableResidents__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isReachableByIDS];
}

- (void)_evaluateReachabilityBulletinAndPostponeUnreachableBulletin:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v62 = *MEMORY[0x263EF8340];
  v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDResidentReachabilityNotificationManager *)self deviceMonitor];
  char v7 = [v6 isReachable];

  if (v7)
  {
    id v8 = [(HMDResidentReachabilityNotificationManager *)self evaluateDebounceTimer];

    if (v8)
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      char v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = HMFGetLogIdentifier();
        int v60 = 138543362;
        v61 = v12;
        char v13 = "%{public}@Debounce timer active, delaying check";
LABEL_15:
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v60, 0xCu);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    if (![(HMDResidentReachabilityNotificationManager *)self anyEnabledResidentSupportsReachabilityNotifications])
    {
      v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = self;
      char v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = HMFGetLogIdentifier();
        int v60 = 138543362;
        v61 = v12;
        char v13 = "%{public}@No enabled resident supports Reachability Notifications";
        goto LABEL_15;
      }
LABEL_16:

      return;
    }
    v18 = [(HMDResidentReachabilityNotificationManager *)self home];
    v19 = v18;
    if (v18)
    {
      v20 = [v18 currentUser];
      int v21 = [v20 isRestrictedGuest];

      if (!v21)
      {
        if ([(HMDResidentReachabilityNotificationManager *)self hasReachableResidents])
        {
          v28 = [(HMDResidentReachabilityNotificationManager *)self unreachableBulletinDebounceTimer];
          [v28 suspend];

          v29 = (void *)MEMORY[0x230FBD990]([(HMDResidentReachabilityNotificationManager *)self setUnreachableBulletinDebounceTimer:0]);
          v30 = self;
          v31 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = HMFGetLogIdentifier();
            int v60 = 138543362;
            v61 = v32;
            _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@Home has reachable residents supporting notification", (uint8_t *)&v60, 0xCu);
          }
          BOOL v33 = [(HMDResidentReachabilityNotificationManager *)v30 shouldPostReachableNotification];
          v34 = (void *)MEMORY[0x230FBD990]();
          v35 = v30;
          v36 = HMFGetOSLogHandle();
          v37 = v36;
          if (!v33)
          {
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v52 = HMFGetLogIdentifier();
              int v60 = 138543362;
              v61 = v52;
              _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@Not posting reachable notification due to no previous unreachable notification posted or previously posting reachable notification", (uint8_t *)&v60, 0xCu);
            }
            v27 = v34;
            goto LABEL_22;
          }
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v38 = HMFGetLogIdentifier();
            int v60 = 138543362;
            v61 = v38;
            _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Posting reachable notification", (uint8_t *)&v60, 0xCu);
          }
          v39 = [(HMDResidentReachabilityNotificationManager *)v35 bulletinBoard];
          objc_msgSend(v39, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v19, 1, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v35, "hasMultipleResidents"));

          v40 = [HMDResidentReachabilityContext alloc];
          v41 = [(HMDResidentReachabilityContext *)v40 initWithMostRecentReachability:MEMORY[0x263EFFA88]];
          [(HMDResidentReachabilityNotificationManager *)v35 setReachabilityContext:v41];

          v42 = @"Posted reachable resident notification";
        }
        else
        {
          v43 = (void *)MEMORY[0x230FBD990]();
          v44 = self;
          v45 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            v46 = HMFGetLogIdentifier();
            int v60 = 138543362;
            v61 = v46;
            _os_log_impl(&dword_22F52A000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@Home does not have reachable residents supporting camera recording", (uint8_t *)&v60, 0xCu);
          }
          if (![(HMDResidentReachabilityNotificationManager *)v44 shouldPostUnreachableNotification])
          {
            uint64_t v22 = MEMORY[0x230FBD990]();
            uint64_t v23 = v44;
            __int16 v24 = HMFGetOSLogHandle();
            if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_21;
            }
            double v25 = HMFGetLogIdentifier();
            int v60 = 138543362;
            v61 = v25;
            uint64_t v26 = "%{public}@Not posting unreachable notification due to previously posting unreachable notification";
            goto LABEL_20;
          }
          if (v3)
          {
            v47 = (void *)MEMORY[0x230FBD990]();
            v48 = v44;
            v49 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              v50 = HMFGetLogIdentifier();
              int v60 = 138543362;
              v61 = v50;
              _os_log_impl(&dword_22F52A000, v49, OS_LOG_TYPE_DEFAULT, "%{public}@Attempting resident discovery before posting unreachable notification", (uint8_t *)&v60, 0xCu);
            }
            v51 = [v19 residentDeviceManager];
            [v51 discoverPrimaryResidentForRequester:0];

            [(HMDResidentReachabilityNotificationManager *)v48 _startUnreachableBulletinDebounceTimer];
            goto LABEL_23;
          }
          v53 = (void *)MEMORY[0x230FBD990]([(HMDResidentReachabilityNotificationManager *)v44 setUnreachableBulletinDebounceTimer:0]);
          v54 = v44;
          v55 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v56 = HMFGetLogIdentifier();
            int v60 = 138543362;
            v61 = v56;
            _os_log_impl(&dword_22F52A000, v55, OS_LOG_TYPE_INFO, "%{public}@Posting unreachable notification", (uint8_t *)&v60, 0xCu);
          }
          v57 = [(HMDResidentReachabilityNotificationManager *)v54 bulletinBoard];
          objc_msgSend(v57, "insertHomeHubReachabilityBulletinForHome:reachable:hasMultipleResidents:", v19, 0, -[HMDResidentReachabilityNotificationManager hasMultipleResidents](v54, "hasMultipleResidents"));

          v58 = [HMDResidentReachabilityContext alloc];
          v59 = [(HMDResidentReachabilityContext *)v58 initWithMostRecentReachability:MEMORY[0x263EFFA80]];
          [(HMDResidentReachabilityNotificationManager *)v54 setReachabilityContext:v59];

          v42 = @"Posted no reachable resident notification";
        }
        [v19 saveToCurrentAccountWithReason:v42];
        goto LABEL_23;
      }
      uint64_t v22 = MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = HMFGetLogIdentifier();
        int v60 = 138543362;
        v61 = v25;
        uint64_t v26 = "%{public}@Current user is a guest in this home, suppressing resident reachability update bulletin";
LABEL_20:
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v60, 0xCu);
      }
    }
    else
    {
      uint64_t v22 = MEMORY[0x230FBD990]();
      uint64_t v23 = self;
      __int16 v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        double v25 = HMFGetLogIdentifier();
        int v60 = 138543362;
        v61 = v25;
        uint64_t v26 = "%{public}@Our home has been deallocated";
        goto LABEL_20;
      }
    }
LABEL_21:

    v27 = (void *)v22;
LABEL_22:
LABEL_23:

    return;
  }
  id v14 = (void *)MEMORY[0x230FBD990]();
  v15 = self;
  id v16 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = HMFGetLogIdentifier();
    int v60 = 138543362;
    v61 = v17;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Network unreachable, clearing debounce timer and delaying check until reachable", (uint8_t *)&v60, 0xCu);
  }
  [(HMDResidentReachabilityNotificationManager *)v15 setEvaluateDebounceTimer:0];
}

- (BOOL)shouldPostUserPreferredUnreachableNotification
{
  if ([(HMDResidentReachabilityNotificationManager *)self isUserPreferredReachable]) {
    return 0;
  }
  char v4 = [(HMDResidentReachabilityNotificationManager *)self userPreferredReachabilityContext];
  v5 = [v4 mostRecentReachability];

  if (v5) {
    char v3 = [v5 BOOLValue];
  }
  else {
    char v3 = 1;
  }

  return v3;
}

- (BOOL)shouldPostUserPreferredReachableNotification
{
  if ([(HMDResidentReachabilityNotificationManager *)self isUserPreferredReachable])
  {
    char v3 = [(HMDResidentReachabilityNotificationManager *)self userPreferredReachabilityContext];
    char v4 = [v3 mostRecentReachability];

    if (v4) {
      int v5 = [v4 BOOLValue] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)_handleUserPreferredReachabilityBulletinDebounceTimer
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v3 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  char v4 = [(HMDResidentReachabilityNotificationManager *)self home];
  int v5 = [v4 userSelectedPreferredResident];

  if (!v5)
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v27 = 138543362;
      v28 = v22;
      uint64_t v23 = "%{public}@Home is no longer in manual selection, ignore preferred reachability bulletin";
      __int16 v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_INFO;
      uint32_t v26 = 12;
LABEL_11:
      _os_log_impl(&dword_22F52A000, v24, v25, v23, (uint8_t *)&v27, v26);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (![(HMDResidentReachabilityNotificationManager *)self shouldPostUserPreferredReachableNotification]&& ![(HMDResidentReachabilityNotificationManager *)self shouldPostUserPreferredUnreachableNotification])
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    v20 = self;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      int v27 = 138543618;
      v28 = v22;
      __int16 v29 = 1024;
      LODWORD(v30) = [(HMDResidentReachabilityNotificationManager *)v20 isUserPreferredReachable];
      uint64_t v23 = "%{public}@Not posting reachable: %{BOOL}d notification due to no previous situation";
      __int16 v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      uint32_t v26 = 18;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  id v6 = (void *)MEMORY[0x230FBD990]();
  char v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = HMFGetLogIdentifier();
    id v10 = [(HMDResidentReachabilityNotificationManager *)v7 home];
    char v11 = [v10 name];
    int v27 = 138543874;
    v28 = v9;
    __int16 v29 = 2112;
    v30 = v11;
    __int16 v31 = 1024;
    BOOL v32 = [(HMDResidentReachabilityNotificationManager *)v7 isUserPreferredReachable];
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Posting user perferred resident reachable notification for home: %@, reachable: %{BOOL}d", (uint8_t *)&v27, 0x1Cu);
  }
  v12 = [(HMDResidentReachabilityNotificationManager *)v7 bulletinBoard];
  uint64_t v13 = [(HMDResidentReachabilityNotificationManager *)v7 isUserPreferredReachable];
  id v14 = [(HMDResidentReachabilityNotificationManager *)v7 electedPrimary];
  v15 = [(HMDResidentReachabilityNotificationManager *)v7 previousPrimary];
  [v12 insertUserPreferredHomeHubReachabilityBulletinForHome:v4 reachable:v13 electedPrimary:v14 previousPrimary:v15];

  id v16 = [HMDResidentReachabilityContext alloc];
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDResidentReachabilityNotificationManager isUserPreferredReachable](v7, "isUserPreferredReachable"));
  v18 = [(HMDResidentReachabilityContext *)v16 initWithMostRecentReachability:v17];
  [(HMDResidentReachabilityNotificationManager *)v7 setUserPreferredReachabilityContext:v18];

LABEL_13:
}

- (void)_handleUserPreferredResidentReachable:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __84__HMDResidentReachabilityNotificationManager__handleUserPreferredResidentReachable___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __84__HMDResidentReachabilityNotificationManager__handleUserPreferredResidentReachable___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) userInfo];
  objc_msgSend(*(id *)(a1 + 32), "setIsUserPreferredReachable:", objc_msgSend(v2, "hmf_BOOLForKey:", @"HMDResidentDeviceManagerUserPreferredResidentReachabilityKey"));

  char v3 = [*(id *)(a1 + 40) userInfo];
  id v4 = objc_msgSend(v3, "hmf_stringForKey:", @"HMDResidentDeviceManagerUserPreferredResidentNameKey");
  [*(id *)(a1 + 32) setPreviousPrimary:v4];

  int v5 = [*(id *)(a1 + 40) userInfo];
  id v6 = objc_msgSend(v5, "hmf_stringForKey:", @"HMDResidentDeviceManagerBackupResidentNameKey");
  [*(id *)(a1 + 32) setElectedPrimary:v6];

  char v7 = [*(id *)(a1 + 32) userPreferredReachabilityBulletinDebounceTimer];

  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = *(id *)(a1 + 32);
  id v10 = HMFGetOSLogHandle();
  char v11 = v10;
  if (!v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v34 = 138543362;
      v35 = v13;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@User preferred reachability changed, start a debounce timer", (uint8_t *)&v34, 0xCu);
    }
    id v14 = [*(id *)(a1 + 32) idsServerBag];
    v15 = [v14 residentSelectionUserPreferredReachabilityNotificationDelay];

    if (v15)
    {
      uint64_t v16 = [v15 doubleValue];
      if (fabs(v17) < 2.22044605e-16)
      {
        v18 = (void *)MEMORY[0x230FBD990](v16);
        id v19 = *(id *)(a1 + 32);
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v21 = HMFGetLogIdentifier();
          int v34 = 138543362;
          v35 = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@ResidentSelectionUserPreferredReachabilityNotificationDelay from IDS is 0.0 so disabling and not posting user preferred reachability notification", (uint8_t *)&v34, 0xCu);
        }
LABEL_17:

        return;
      }
      [v15 doubleValue];
      double v22 = v23;
    }
    else
    {
      double v22 = 600.0;
    }
    __int16 v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = *(id *)(a1 + 32);
    uint32_t v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = HMFGetLogIdentifier();
      int v34 = 138543618;
      v35 = v27;
      __int16 v36 = 2048;
      double v37 = v22;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@User preferred reachability changed, start a debounce timer with delay %f", (uint8_t *)&v34, 0x16u);
    }
    v28 = [*(id *)(a1 + 32) timerFactory];
    __int16 v29 = v28[2](v22);
    [*(id *)(a1 + 32) setUserPreferredReachabilityBulletinDebounceTimer:v29];

    v30 = [*(id *)(a1 + 32) userPreferredReachabilityBulletinDebounceTimer];
    [v30 setDelegate:*(void *)(a1 + 32)];

    __int16 v31 = [*(id *)(a1 + 32) userPreferredReachabilityBulletinDebounceTimer];
    BOOL v32 = [*(id *)(a1 + 32) workQueue];
    [v31 setDelegateQueue:v32];

    uint64_t v33 = [*(id *)(a1 + 32) userPreferredReachabilityBulletinDebounceTimer];
    [v33 resume];

    goto LABEL_17;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v12 = HMFGetLogIdentifier();
    int v34 = 138543362;
    v35 = v12;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@User preferred reachability bulletin debounce timer is active", (uint8_t *)&v34, 0xCu);
  }
}

- (void)_handleResidentUpdated:(id)a3
{
  id v4 = a3;
  int v5 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __69__HMDResidentReachabilityNotificationManager__handleResidentUpdated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) home];
    char v7 = [v6 name];
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Resident Reachability changed, checking home: %@", (uint8_t *)&v9, 0x16u);
  }
  [*(id *)(a1 + 32) _updatePrimaryResidentLostTime:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _evaluateReachabilityBulletinAndPostponeUnreachableBulletin:1];
}

- (void)_updatePrimaryResidentLostTime:(id)a3
{
  id v4 = a3;
  id v19 = [(HMDResidentReachabilityNotificationManager *)self home];
  int v5 = [v4 userInfo];

  id v6 = [v5 objectForKeyedSubscript:@"HMDResidentDeviceManagerResidentDeviceNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = v6;
  }
  else {
    char v7 = 0;
  }
  id v8 = v7;

  int v9 = [v19 residentDeviceManager];
  id v10 = [v9 primaryResidentDevice];
  int v11 = [v8 isEqual:v10];

  v12 = v19;
  if (v11)
  {
    uint64_t v13 = [v19 residentDeviceManager];
    id v14 = [v13 primaryResidentDevice];
    if ([v14 isReachable])
    {

      double v15 = 0.0;
    }
    else
    {
      uint64_t v16 = [v19 residentDeviceManager];
      double v17 = [v16 primaryResidentDevice];
      char v18 = [v17 isReachableByIDS];

      double v15 = 0.0;
      if ((v18 & 1) == 0) {
        HMFUptime();
      }
    }
    [(HMDResidentReachabilityNotificationManager *)self setPrimaryResidentUnreachableTime:v15];
    v12 = v19;
  }
}

- (void)_handleResidentRemoved:(id)a3
{
  id v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __69__HMDResidentReachabilityNotificationManager__handleResidentRemoved___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setEvaluateDebounceTimer:0];
  char v2 = [*(id *)(a1 + 32) anyEnabledResidentSupportsReachabilityNotifications];
  id v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 32);
  int v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v6)
    {
      char v7 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was removed, starting debounce timer", (uint8_t *)&v11, 0xCu);
    }
    [*(id *)(a1 + 32) _startDebounceTimer];
  }
  else
  {
    if (v6)
    {
      id v8 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@Last resident was reomved", (uint8_t *)&v11, 0xCu);
    }
    int v9 = [[HMDResidentReachabilityContext alloc] initWithMostRecentReachability:0];
    [*(id *)(a1 + 32) setReachabilityContext:v9];

    id v10 = [*(id *)(a1 + 32) home];
    [v10 saveToCurrentAccountWithReason:@"All residents were removed"];
  }
}

- (void)_handleResidentAdded:(id)a3
{
  id v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __67__HMDResidentReachabilityNotificationManager__handleResidentAdded___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  char v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = HMFGetLogIdentifier();
    BOOL v6 = [*(id *)(a1 + 32) evaluateDebounceTimer];
    int v7 = [v6 isRunning];
    id v8 = &stru_26E2EB898;
    if (v7) {
      id v8 = @"re";
    }
    int v10 = 138543618;
    int v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@A resident was added, %@starting debounce timer", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 32) setEvaluateDebounceTimer:0];
  return [*(id *)(a1 + 32) _startDebounceTimer];
}

- (void)_handleNetworkReachabilityChange:(id)a3
{
  id v4 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __79__HMDResidentReachabilityNotificationManager__handleNetworkReachabilityChange___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  char v2 = [*(id *)(a1 + 32) deviceMonitor];
  int v3 = [v2 isReachable];

  id v4 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became reachable, starting debounce timer", (uint8_t *)&v11, 0xCu);
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
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@Network became unreachable, clearing debounce timer", (uint8_t *)&v11, 0xCu);
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

  double v17 = [(HMDResidentReachabilityNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __128__HMDResidentReachabilityNotificationManager_configureWithHome_deviceMonitor_notificationCenter_idsServerBag_completionHandler___block_invoke;
  block[3] = &unk_264A2DDC0;
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
  uint64_t v21 = *MEMORY[0x263EF8340];
  char v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = HMFGetLogIdentifier();
    int v19 = 138543362;
    id v20 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Starting debounce timer", (uint8_t *)&v19, 0xCu);
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
  uint64_t v16 = *(void *)(a1 + 32);
  id v15 = *(void **)(a1 + 40);
  double v17 = [*(id *)(a1 + 48) residentDeviceManager];
  [v15 addObserver:v16 selector:sel__handleUserPreferredResidentReachable_ name:@"HMDResidentDeviceManagerUserPreferredResidentReachabilityNotification" object:v17];

  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)configureWithHome:(id)a3 deviceMonitor:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x263F08A00];
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
  v22.receiver = self;
  v22.super_class = (Class)HMDResidentReachabilityNotificationManager;
  id v15 = [(HMDResidentReachabilityNotificationManager *)&v22 init];
  uint64_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_reachabilityContext, a3);
    objc_storeStrong((id *)&v16->_workQueue, a4);
    double v17 = _Block_copy(v13);
    id timerFactory = v16->_timerFactory;
    v16->_id timerFactory = v17;

    objc_storeStrong((id *)&v16->_bulletinBoard, a6);
    v16->_notificationEnabled = 0;
    int v19 = objc_alloc_init(HMDResidentReachabilityContext);
    userPreferredReachabilityContext = v16->_userPreferredReachabilityContext;
    v16->_userPreferredReachabilityContext = v19;
  }
  return v16;
}

- (HMDResidentReachabilityNotificationManager)initWithResidentReachabilityContext:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[HMDBulletinBoard sharedBulletinBoard];
  int v9 = [(HMDResidentReachabilityNotificationManager *)self initWithResidentReachabilityContext:v7 workQueue:v6 timerFactory:&__block_literal_global_199055 bulletinBoard:v8];

  return v9;
}

id __92__HMDResidentReachabilityNotificationManager_initWithResidentReachabilityContext_workQueue___block_invoke(double a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:0 options:a1];
  return v1;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t37 != -1) {
    dispatch_once(&logCategory__hmf_once_t37, &__block_literal_global_47_199061);
  }
  char v2 = (void *)logCategory__hmf_once_v38;
  return v2;
}

void __57__HMDResidentReachabilityNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v38;
  logCategory__hmf_once_uint64_t v38 = v0;
}

@end