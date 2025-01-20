@interface HMDCameraRecordingReachabilityEventManager
+ (id)logCategory;
- (BOOL)currentBridgedCameraReachability;
- (BOOL)currentCameraReachability;
- (BOOL)isAccessoryReachable;
- (BOOL)isCurrentDeviceConfirmedPrimaryResident;
- (BOOL)isCurrentDeviceConnectedToNetwork;
- (BOOL)lastKnownCameraReachability;
- (BOOL)shouldAddInitialReachabilityEventForCurrentCameraReachability:(BOOL)a3 mostRecentReachabilityEventModel:(id)a4;
- (BOOL)shouldHandleReachabilityChanges;
- (HMBCloudZone)cloudZone;
- (HMBLocalZone)localZone;
- (HMDAppleAccountSettings)accountSettings;
- (HMDBulletinBoard)bulletinBoard;
- (HMDCameraRecordingReachabilityEventManager)initWithAccessory:(id)a3 workQueue:(id)a4 identifier:(id)a5 bulletinBoard:(id)a6 logEventSubmitter:(id)a7 accountSettings:(id)a8 notificationCenter:(id)a9;
- (HMDCameraRecordingReachabilityEventManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4;
- (HMDCameraRecordingReachabilityEventModel)mostRecentReachabilityEventModel;
- (HMDHAPAccessory)hapAccessory;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFTimer)initialReachabilityTimer;
- (HMFTimer)reachabilityChangeDebounceTimer;
- (HMMLogEventSubmitting)logEventSubmitter;
- (NAFuture)didHandleInitialReachabilityFuture;
- (NSDate)reachabilityChangeDebounceStartDate;
- (NSDate)suppressNotificationsBeforeDate;
- (NSHashTable)clientConnections;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)workQueue;
- (_HMCameraUserSettings)currentSettings;
- (double)initialReachabilityTimeout;
- (double)reachabilityChangeReachableDebounceTimeout;
- (double)reachabilityChangeUnreachableDebounceTimeout;
- (id)fetchReachabilityEventsWithDateInterval:(id)a3;
- (id)initialReachabilityTimerFactory;
- (id)localZone:(id)a3 didProcessModelCreation:(id)a4;
- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4;
- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4;
- (id)logIdentifier;
- (id)mostRecentReachabilityEventModelInModels:(id)a3;
- (id)performCloudPullWithLabel:(id)a3;
- (id)reachabilityChangeDebounceTimerFactory;
- (id)reachabilityEventModelForCurrentCameraReachability:(BOOL)a3 dateOfOccurrence:(id)a4;
- (unint64_t)reachabilityChangeDebounceCount;
- (void)addCameraReachabilityEventForCurrentCameraReachability:(BOOL)a3 dateOfOccurrence:(id)a4;
- (void)cleanUpEvents;
- (void)clipManagerDidStart:(id)a3;
- (void)clipManagerDidStop:(id)a3;
- (void)configureWithMessageDispatcher:(id)a3 currentSettings:(id)a4 isCurrentDeviceConfirmedPrimaryResident:(BOOL)a5 isCurrentDeviceConnectedToNetwork:(BOOL)a6;
- (void)handleAccessoryConfigured:(id)a3;
- (void)handleAccessoryUnconfigured:(id)a3;
- (void)handleAppleAccountSettingsHomeStateUpdated:(id)a3;
- (void)handleCameraProfileSettingsDidChange:(id)a3;
- (void)handleDeleteAllEventsMessage:(id)a3;
- (void)handleFetchCountOfEventsMessage:(id)a3;
- (void)handleFetchEventsMessage:(id)a3;
- (void)handleHMDBridgedAccessoryReachableNotification:(id)a3;
- (void)handleHMDBridgedAccessoryUnreachableNotification:(id)a3;
- (void)handleInitialCameraReachability;
- (void)handlePerformCloudPullMessage:(id)a3;
- (void)handleRemoteCameraReachabilityChange:(id)a3;
- (void)handleResidentDeviceConfirmedStateChangedNotification:(id)a3;
- (void)handleSubscribeMessage:(id)a3;
- (void)handleUnsubscribeMessage:(id)a3;
- (void)handleUpdatedCameraReachability:(BOOL)a3;
- (void)networkMonitorIsReachable:(id)a3;
- (void)networkMonitorIsUnreachable:(id)a3;
- (void)notifySubscribersOfRemoteCameraReachabilityEvent;
- (void)notifyTransportOfUpdatedEvents:(id)a3 removedEventUUIDs:(id)a4;
- (void)setClientConnections:(id)a3;
- (void)setCloudZone:(id)a3;
- (void)setCurrentBridgedCameraReachability:(BOOL)a3;
- (void)setCurrentCameraReachability:(BOOL)a3;
- (void)setCurrentDeviceConfirmedPrimaryResident:(BOOL)a3;
- (void)setCurrentDeviceConnectedToNetwork:(BOOL)a3;
- (void)setCurrentSettings:(id)a3;
- (void)setDidHandleInitialReachabilityFuture:(id)a3;
- (void)setInitialReachabilityTimer:(id)a3;
- (void)setInitialReachabilityTimerFactory:(id)a3;
- (void)setLastKnownCameraReachability:(BOOL)a3;
- (void)setLocalZone:(id)a3;
- (void)setLogEventSubmitter:(id)a3;
- (void)setMessageDispatcher:(id)a3;
- (void)setMostRecentReachabilityEventModel:(id)a3;
- (void)setReachabilityChangeDebounceCount:(unint64_t)a3;
- (void)setReachabilityChangeDebounceStartDate:(id)a3;
- (void)setReachabilityChangeDebounceTimer:(id)a3;
- (void)setReachabilityChangeDebounceTimerFactory:(id)a3;
- (void)setSuppressNotificationsBeforeDate:(id)a3;
- (void)startReachabilityChangeDebounceTimerWithReachability:(BOOL)a3;
- (void)submitLogEventWithCurrentModel:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateInitialReachabilityTimer;
@end

@implementation HMDCameraRecordingReachabilityEventManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reachabilityChangeDebounceTimerFactory, 0);
  objc_storeStrong(&self->_initialReachabilityTimerFactory, 0);
  objc_storeStrong((id *)&self->_suppressNotificationsBeforeDate, 0);
  objc_storeStrong((id *)&self->_reachabilityChangeDebounceStartDate, 0);
  objc_storeStrong((id *)&self->_reachabilityChangeDebounceTimer, 0);
  objc_storeStrong((id *)&self->_initialReachabilityTimer, 0);
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_mostRecentReachabilityEventModel, 0);
  objc_storeStrong((id *)&self->_didHandleInitialReachabilityFuture, 0);
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_clientConnections, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountSettings, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_destroyWeak((id *)&self->_hapAccessory);
  objc_storeStrong((id *)&self->_currentSettings, 0);
}

- (void)setReachabilityChangeDebounceTimerFactory:(id)a3
{
}

- (id)reachabilityChangeDebounceTimerFactory
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setInitialReachabilityTimerFactory:(id)a3
{
}

- (id)initialReachabilityTimerFactory
{
  return objc_getProperty(self, a2, 168, 1);
}

- (void)setSuppressNotificationsBeforeDate:(id)a3
{
}

- (NSDate)suppressNotificationsBeforeDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (void)setReachabilityChangeDebounceStartDate:(id)a3
{
}

- (NSDate)reachabilityChangeDebounceStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 152, 1);
}

- (void)setReachabilityChangeDebounceTimer:(id)a3
{
}

- (HMFTimer)reachabilityChangeDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setInitialReachabilityTimer:(id)a3
{
}

- (HMFTimer)initialReachabilityTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCloudZone:(id)a3
{
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 128, 1);
}

- (void)setLocalZone:(id)a3
{
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 120, 1);
}

- (void)setMostRecentReachabilityEventModel:(id)a3
{
}

- (HMDCameraRecordingReachabilityEventModel)mostRecentReachabilityEventModel
{
  return (HMDCameraRecordingReachabilityEventModel *)objc_getProperty(self, a2, 112, 1);
}

- (void)setReachabilityChangeDebounceCount:(unint64_t)a3
{
  self->_reachabilityChangeDebounceCount = a3;
}

- (unint64_t)reachabilityChangeDebounceCount
{
  return self->_reachabilityChangeDebounceCount;
}

- (void)setCurrentBridgedCameraReachability:(BOOL)a3
{
  self->_currentBridgedCameraReachability = a3;
}

- (BOOL)currentBridgedCameraReachability
{
  return self->_currentBridgedCameraReachability;
}

- (void)setCurrentCameraReachability:(BOOL)a3
{
  self->_currentCameraReachability = a3;
}

- (BOOL)currentCameraReachability
{
  return self->_currentCameraReachability;
}

- (void)setLastKnownCameraReachability:(BOOL)a3
{
  self->_lastKnownCameraReachability = a3;
}

- (BOOL)lastKnownCameraReachability
{
  return self->_lastKnownCameraReachability;
}

- (void)setDidHandleInitialReachabilityFuture:(id)a3
{
}

- (NAFuture)didHandleInitialReachabilityFuture
{
  return (NAFuture *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLogEventSubmitter:(id)a3
{
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return (HMMLogEventSubmitting *)objc_getProperty(self, a2, 88, 1);
}

- (void)setClientConnections:(id)a3
{
}

- (NSHashTable)clientConnections
{
  return (NSHashTable *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMessageDispatcher:(id)a3
{
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 72, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (HMDAppleAccountSettings)accountSettings
{
  return (HMDAppleAccountSettings *)objc_getProperty(self, a2, 56, 1);
}

- (HMDBulletinBoard)bulletinBoard
{
  return (HMDBulletinBoard *)objc_getProperty(self, a2, 48, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHAPAccessory)hapAccessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hapAccessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (id)logIdentifier
{
  v3 = [(HMDCameraRecordingReachabilityEventManager *)self hapAccessory];
  if (isInternalBuild())
  {
    v4 = NSString;
    v5 = [v3 home];
    v6 = [v5 name];
    v7 = [v3 name];
    v8 = [(HMDCameraRecordingReachabilityEventManager *)self uniqueIdentifier];
    v9 = [v4 stringWithFormat:@"%@/%@/%@", v6, v7, v8];
  }
  else
  {
    v5 = [(HMDCameraRecordingReachabilityEventManager *)self uniqueIdentifier];
    v9 = [v5 UUIDString];
  }

  return v9;
}

- (void)networkMonitorIsUnreachable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received network monitor is unreachable", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraRecordingReachabilityEventManager *)v7 setCurrentDeviceConnectedToNetwork:0];
}

- (void)networkMonitorIsReachable:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received network monitor is reachable", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraRecordingReachabilityEventManager *)v7 setCurrentDeviceConnectedToNetwork:1];
}

- (void)timerDidFire:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingReachabilityEventManager *)self initialReachabilityTimer];

  if (v6 == v4)
  {
    BOOL v18 = [(HMDCameraRecordingReachabilityEventManager *)self isAccessoryReachable];
    v19 = (void *)MEMORY[0x1D9452090]();
    v20 = self;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = HMFGetLogIdentifier();
      v23 = HMFBooleanToString();
      *(_DWORD *)buf = 138543618;
      v26 = v22;
      __int16 v27 = 2112;
      v28 = v23;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_INFO, "%{public}@Initial reachability timer fired with isReachable: %@", buf, 0x16u);
    }
    [(HMDCameraRecordingReachabilityEventManager *)v20 setLastKnownCameraReachability:v18];
    [(HMDCameraRecordingReachabilityEventManager *)v20 setCurrentCameraReachability:v18];
    [(HMDCameraRecordingReachabilityEventManager *)v20 setInitialReachabilityTimer:0];
    [(HMDCameraRecordingReachabilityEventManager *)v20 handleInitialCameraReachability];
  }
  else
  {
    id v7 = [(HMDCameraRecordingReachabilityEventManager *)self reachabilityChangeDebounceTimer];

    if (v7 == v4)
    {
      v8 = (void *)MEMORY[0x1D9452090]();
      v9 = self;
      int v10 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = HMFGetLogIdentifier();
        [(HMDCameraRecordingReachabilityEventManager *)v9 lastKnownCameraReachability];
        uint64_t v12 = HMFBooleanToString();
        [(HMDCameraRecordingReachabilityEventManager *)v9 currentCameraReachability];
        v13 = HMFBooleanToString();
        *(_DWORD *)buf = 138543874;
        v26 = v11;
        __int16 v27 = 2114;
        v28 = v12;
        __int16 v29 = 2114;
        v30 = v13;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Reachability change debounce timer fired with last known reachability %{public}@ and current reachability %{public}@", buf, 0x20u);
      }
      BOOL v14 = [(HMDCameraRecordingReachabilityEventManager *)v9 lastKnownCameraReachability];
      if (v14 == [(HMDCameraRecordingReachabilityEventManager *)v9 currentCameraReachability])
      {
        [(HMDCameraRecordingReachabilityEventManager *)v9 submitLogEventWithCurrentModel:0];
      }
      else
      {
        [(HMDCameraRecordingReachabilityEventManager *)v9 setLastKnownCameraReachability:[(HMDCameraRecordingReachabilityEventManager *)v9 currentCameraReachability]];
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __59__HMDCameraRecordingReachabilityEventManager_timerDidFire___block_invoke;
        aBlock[3] = &unk_1E6A19708;
        aBlock[4] = v9;
        v15 = _Block_copy(aBlock);
        v16 = [(HMDCameraRecordingReachabilityEventManager *)v9 didHandleInitialReachabilityFuture];
        id v17 = (id)[v16 addSuccessBlock:v15];
      }
      [(HMDCameraRecordingReachabilityEventManager *)v9 setReachabilityChangeDebounceTimer:0];
    }
  }
}

void __59__HMDCameraRecordingReachabilityEventManager_timerDidFire___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 currentCameraReachability];
  id v4 = [*(id *)(a1 + 32) reachabilityChangeDebounceStartDate];
  [v2 addCameraReachabilityEventForCurrentCameraReachability:v3 dateOfOccurrence:v4];
}

- (void)clipManagerDidStop:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDCameraRecordingReachabilityEventManager *)self setLocalZone:0];
  [(HMDCameraRecordingReachabilityEventManager *)self setCloudZone:0];
}

- (void)clipManagerDidStart:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 localZone];
  [(HMDCameraRecordingReachabilityEventManager *)self setLocalZone:v6];

  id v7 = [v4 cloudZone];
  [(HMDCameraRecordingReachabilityEventManager *)self setCloudZone:v7];

  v8 = [(HMDCameraRecordingReachabilityEventManager *)self localZone];
  [v8 addObserverForAllModels:self];

  [(HMDCameraRecordingReachabilityEventManager *)self cleanUpEvents];
  v9 = [(HMDCameraRecordingReachabilityEventManager *)self cloudZone];
  char v10 = [v9 hasPerformedInitialFetch];

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    uint64_t v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      BOOL v14 = HMFGetLogIdentifier();
      v15 = [(HMDCameraRecordingReachabilityEventManager *)v12 suppressNotificationsBeforeDate];
      int v17 = 138543618;
      BOOL v18 = v14;
      __int16 v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Suppressing all reachability notifications before %@", (uint8_t *)&v17, 0x16u);
    }
    v16 = [MEMORY[0x1E4F1C9C8] date];
    [(HMDCameraRecordingReachabilityEventManager *)v12 setSuppressNotificationsBeforeDate:v16];
  }
}

- (id)localZone:(id)a3 didProcessModelUpdate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1D9452090]();
  v9 = self;
  char v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543618;
    BOOL v14 = v11;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received model update: %@", (uint8_t *)&v13, 0x16u);
  }

  return 0;
}

- (id)localZone:(id)a3 didProcessModelDeletion:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelDeletion___block_invoke;
  v9[3] = &unk_1E6A197C8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelDeletion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) model];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  id v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 40);
  id v7 = HMFGetOSLogHandle();
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = HMFGetLogIdentifier();
      id v10 = [v4 debugDescription];
      int v18 = 138543618;
      __int16 v19 = v9;
      __int16 v20 = 2112;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received deleted reachability event model: %@", (uint8_t *)&v18, 0x16u);
    }
    v11 = *(void **)(a1 + 40);
    uint64_t v12 = [MEMORY[0x1E4F1CAD0] set];
    int v13 = (void *)MEMORY[0x1E4F1CAD0];
    BOOL v14 = [v4 hmbModelID];
    __int16 v15 = [v13 setWithObject:v14];
    [v11 notifyTransportOfUpdatedEvents:v12 removedEventUUIDs:v15];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v16 = HMFGetLogIdentifier();
      uint64_t v17 = *(void **)(a1 + 32);
      int v18 = 138543874;
      __int16 v19 = v16;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      uint64_t v23 = objc_opt_class();
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Deletion model %@ is not of expected type: %@", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (id)localZone:(id)a3 didProcessModelCreation:(id)a4
{
  id v5 = a4;
  id v6 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelCreation___block_invoke;
  v9[3] = &unk_1E6A197C8;
  id v10 = v5;
  v11 = self;
  id v7 = v5;
  dispatch_async(v6, v9);

  return 0;
}

void __80__HMDCameraRecordingReachabilityEventManager_localZone_didProcessModelCreation___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) model];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 40);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = HMFGetLogIdentifier();
      v9 = [v4 debugDescription];
      int v42 = 138543618;
      v43 = v8;
      __int16 v44 = 2114;
      v45 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Received new reachability event model: %{public}@", (uint8_t *)&v42, 0x16u);
    }
    id v10 = [v4 createEvent];
    if (!v10)
    {
      uint64_t v31 = (void *)MEMORY[0x1D9452090]();
      id v32 = *(id *)(a1 + 40);
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = HMFGetLogIdentifier();
        v35 = [v4 debugDescription];
        int v42 = 138543618;
        v43 = v34;
        __int16 v44 = 2112;
        v45 = v35;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to convert reachability model into event: %@", (uint8_t *)&v42, 0x16u);
      }
      goto LABEL_23;
    }
    v11 = [MEMORY[0x1E4F1CAD0] setWithObject:v10];
    uint64_t v12 = *(void **)(a1 + 40);
    int v13 = [MEMORY[0x1E4F1CAD0] set];
    [v12 notifyTransportOfUpdatedEvents:v11 removedEventUUIDs:v13];

    BOOL v14 = [v10 dateOfOccurrence];
    __int16 v15 = [*(id *)(a1 + 40) suppressNotificationsBeforeDate];
    uint64_t v16 = [v14 compare:v15];

    if (v16 == -1)
    {
      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = *(id *)(a1 + 40);
      v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v36 = HMFGetLogIdentifier();
        v37 = [v10 dateOfOccurrence];
        v38 = [*(id *)(a1 + 40) suppressNotificationsBeforeDate];
        int v42 = 138543874;
        v43 = v36;
        __int16 v44 = 2112;
        v45 = v37;
        __int16 v46 = 2112;
        v47 = v38;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Ignoring created event with date of occurrence %@ because it is before %@", (uint8_t *)&v42, 0x20u);
      }
    }
    else
    {
      uint64_t v17 = [*(id *)(a1 + 40) currentSettings];
      int v18 = [v17 notificationSettings];
      int v19 = [v18 isReachabilityEventNotificationEnabled];

      __int16 v20 = [*(id *)(a1 + 40) accountSettings];
      int v21 = [v20 isHomeEnabled];

      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      id v23 = *(id *)(a1 + 40);
      uint64_t v24 = HMFGetOSLogHandle();
      v25 = v24;
      if (v19 && v21)
      {
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v26 = HMFGetLogIdentifier();
          int v42 = 138543618;
          v43 = v26;
          __int16 v44 = 2114;
          v45 = v10;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Inserting bulletin for new reachability event: %{public}@", (uint8_t *)&v42, 0x16u);
        }
        __int16 v27 = [*(id *)(a1 + 40) bulletinBoard];
        v28 = [*(id *)(a1 + 40) hapAccessory];
        uint64_t v29 = [v10 isReachable];
        v30 = [v10 dateOfOccurrence];
        [v27 insertReachabilityEventBulletinForAccessory:v28 reachable:v29 date:v30];

        goto LABEL_22;
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v39 = HMFGetLogIdentifier();
        v40 = HMFBooleanToString();
        v41 = HMFBooleanToString();
        int v42 = 138544130;
        v43 = v39;
        __int16 v44 = 2112;
        v45 = v10;
        __int16 v46 = 2112;
        v47 = v40;
        __int16 v48 = 2112;
        v49 = v41;
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Not inserting bulletin for new reachability event: %@ due to reachabilityEventNotificationEnabled: %@ and isHomeEnabled: %@", (uint8_t *)&v42, 0x2Au);
      }
    }

LABEL_22:

LABEL_23:
  }
}

- (void)handleDeleteAllEventsMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v27 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling delete all reachability events message", buf, 0xCu);
  }
  id v10 = [(HMDCameraRecordingReachabilityEventManager *)v7 localZone];

  if (v10)
  {
    v11 = [(HMDCameraRecordingReachabilityEventManager *)v7 localZone];
    uint64_t v25 = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
    int v13 = (void *)MEMORY[0x1E4F69EF0];
    BOOL v14 = [v4 name];
    __int16 v15 = [v13 optionsWithLabel:v14];
    uint64_t v16 = [v11 removeAllModelsOfTypes:v12 options:v15];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __75__HMDCameraRecordingReachabilityEventManager_handleDeleteAllEventsMessage___block_invoke;
    v23[3] = &unk_1E6A12BB8;
    id v24 = v4;
    id v17 = (id)[v16 addCompletionBlock:v23];

    int v18 = v24;
  }
  else
  {
    int v19 = (void *)MEMORY[0x1D9452090]();
    __int16 v20 = v7;
    int v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_ERROR, "%{public}@Cannot delete clips because zones are not ready", buf, 0xCu);
    }
    int v18 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v18];
  }
}

uint64_t __75__HMDCameraRecordingReachabilityEventManager_handleDeleteAllEventsMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) respondWithPayload:0 error:a3];
}

- (void)handlePerformCloudPullMessage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    __int16 v20 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling perform cloud pull message", buf, 0xCu);
  }
  id v10 = [(HMDCameraRecordingReachabilityEventManager *)v7 performCloudPullWithLabel:@"Fetching reachability events due to client request"];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke;
  v17[3] = &unk_1E6A19708;
  id v11 = v4;
  id v18 = v11;
  uint64_t v12 = [v10 addSuccessBlock:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke_2;
  v15[3] = &unk_1E6A197F0;
  id v16 = v11;
  id v13 = v11;
  id v14 = (id)[v12 addFailureBlock:v15];
}

uint64_t __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) respondWithSuccess];
}

uint64_t __76__HMDCameraRecordingReachabilityEventManager_handlePerformCloudPullMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleUnsubscribeMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v21 = 138543362;
    __int16 v22 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling unsubscribe message", (uint8_t *)&v21, 0xCu);
  }
  id v10 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDCameraRecordingReachabilityEventManager *)v7 clientConnections];
    [v13 removeObject:v12];

    [v4 respondWithSuccess];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    __int16 v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      int v19 = [v4 transport];
      int v21 = 138543874;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unsubscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);
    }
    __int16 v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v20];
  }
}

- (void)handleSubscribeMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v21 = 138543362;
    __int16 v22 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling subscribe message", (uint8_t *)&v21, 0xCu);
  }
  id v10 = [v4 transport];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    id v13 = [(HMDCameraRecordingReachabilityEventManager *)v7 clientConnections];
    [v13 addObject:v12];

    [v4 respondWithSuccess];
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    __int16 v15 = v7;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      uint64_t v18 = objc_opt_class();
      int v19 = [v4 transport];
      int v21 = 138543874;
      __int16 v22 = v17;
      __int16 v23 = 2112;
      uint64_t v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@Subscribing transport was not of expected class %@: %@", (uint8_t *)&v21, 0x20u);
    }
    __int16 v20 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v20];
  }
}

- (void)handleFetchCountOfEventsMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    id v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v41 = v9;
    __int16 v42 = 2112;
    uint64_t v43 = (uint64_t)v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to fetch count of events: %@", buf, 0x16u);
  }
  id v11 = [(HMDCameraRecordingReachabilityEventManager *)v7 localZone];

  if (v11)
  {
    id v12 = [v4 messagePayload];
    id v13 = objc_msgSend(v12, "hmf_dateForKey:", *MEMORY[0x1E4F2CCB0]);

    id v14 = [v4 messagePayload];
    __int16 v15 = objc_msgSend(v14, "hmf_dateForKey:", *MEMORY[0x1E4F2CCB8]);

    if (v13 && v15)
    {
      id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v13 endDate:v15];
      id v17 = (void *)MEMORY[0x1D9452090]();
      uint64_t v18 = v7;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        __int16 v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v41 = v20;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v16;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Fetching count of reachability event models with date interval: %@", buf, 0x16u);
      }
      int v21 = [(HMDCameraRecordingReachabilityEventManager *)v18 fetchReachabilityEventsWithDateInterval:v16];
      __int16 v22 = (void *)MEMORY[0x1D9452090]();
      __int16 v23 = v18;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        __int16 v25 = HMFGetLogIdentifier();
        uint64_t v26 = [v21 count];
        *(_DWORD *)buf = 138543874;
        v41 = v25;
        __int16 v42 = 2048;
        uint64_t v43 = v26;
        __int16 v44 = 2112;
        v45 = v16;
        _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched count of %lu events with date interval: %@", buf, 0x20u);
      }
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count", *MEMORY[0x1E4F2CCA8]));
      v39 = v27;
      uint64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];

      [v4 respondWithPayload:v28];
    }
    else
    {
      v33 = (void *)MEMORY[0x1D9452090]();
      v34 = v7;
      v35 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v36 = HMFGetLogIdentifier();
        v37 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v41 = v36;
        __int16 v42 = 2112;
        uint64_t v43 = (uint64_t)v37;
        _os_log_impl(&dword_1D49D5000, v35, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);
      }
      id v16 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v16];
    }
  }
  else
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    v30 = v7;
    uint64_t v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v41 = v32;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch count of events because zones are not ready", buf, 0xCu);
    }
    id v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v13];
  }
}

- (void)handleFetchEventsMessage:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    id v10 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v49 = v9;
    __int16 v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to fetch events: %@", buf, 0x16u);
  }
  id v11 = [(HMDCameraRecordingReachabilityEventManager *)v7 localZone];

  if (v11)
  {
    id v12 = [v4 dateForKey:*MEMORY[0x1E4F2CCB0]];
    id v13 = [v4 dateForKey:*MEMORY[0x1E4F2CCB8]];
    id v14 = [v4 numberForKey:*MEMORY[0x1E4F2CCC0]];
    uint64_t v15 = [v4 numberForKey:*MEMORY[0x1E4F2CCD0]];
    id v16 = (void *)v15;
    if (v12 && v13 && v14 && v15)
    {
      __int16 v44 = v13;
      id v17 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v12 endDate:v13];
      int v18 = [v16 BOOLValue];
      unint64_t v19 = [v14 unsignedIntegerValue];
      __int16 v20 = (void *)MEMORY[0x1D9452090]();
      int v21 = v7;
      __int16 v22 = HMFGetOSLogHandle();
      v45 = v16;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v23 = HMFGetLogIdentifier();
        HMFBooleanToString();
        uint64_t v24 = v43 = v14;
        *(_DWORD *)buf = 138544130;
        v49 = v23;
        __int16 v50 = 2112;
        v51 = v17;
        __int16 v52 = 2048;
        unint64_t v53 = v19;
        __int16 v54 = 2112;
        v55 = v24;
        _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Fetching reachability event models with date interval: %@, limit: %lu, shouldOrderAscending: %@", buf, 0x2Au);

        id v14 = v43;
      }

      __int16 v25 = [(HMDCameraRecordingReachabilityEventManager *)v21 fetchReachabilityEventsWithDateInterval:v17];
      uint64_t v26 = (void *)[v25 mutableCopy];

      if (v18) {
        uint64_t v27 = &__block_literal_global_107_129483;
      }
      else {
        uint64_t v27 = &__block_literal_global_109_129484;
      }
      [v26 sortUsingComparator:v27];
      uint64_t v28 = v14;
      if ([v26 count] <= v19)
      {
        uint64_t v29 = (void *)[v26 copy];
      }
      else
      {
        uint64_t v29 = objc_msgSend(v26, "subarrayWithRange:", 0, v19);
      }
      v39 = v29;
      id v13 = v44;
      v40 = objc_msgSend(v29, "na_map:", &__block_literal_global_112_129485);
      uint64_t v46 = *MEMORY[0x1E4F2CCE0];
      v41 = encodeRootObjectForIncomingXPCMessage(v40, 0);
      v47 = v41;
      __int16 v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      [v4 respondWithPayload:v42];

      id v14 = v28;
      id v16 = v45;
    }
    else
    {
      v34 = (void *)MEMORY[0x1D9452090]();
      v35 = v7;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        uint64_t v38 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v49 = v37;
        __int16 v50 = 2112;
        v51 = v38;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Could not find required value in message payload: %@", buf, 0x16u);
      }
      id v17 = [MEMORY[0x1E4F28C58] hmErrorWithCode:20];
      [v4 respondWithError:v17];
    }
  }
  else
  {
    v30 = (void *)MEMORY[0x1D9452090]();
    uint64_t v31 = v7;
    id v32 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v33 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v49 = v33;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@Cannot fetch events because zones are not ready", buf, 0xCu);
    }
    id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    [v4 respondWithError:v12];
  }
}

uint64_t __71__HMDCameraRecordingReachabilityEventManager_handleFetchEventsMessage___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 createEvent];
}

uint64_t __71__HMDCameraRecordingReachabilityEventManager_handleFetchEventsMessage___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = [a3 dateOfOccurrence];
  id v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

uint64_t __71__HMDCameraRecordingReachabilityEventManager_handleFetchEventsMessage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 dateOfOccurrence];
  id v6 = [v4 dateOfOccurrence];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)handleRemoteCameraReachabilityChange:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  uint64_t v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    id v12 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Received message to perform cloud pull for new reachability event", (uint8_t *)&v11, 0xCu);
  }
  id v10 = [(HMDCameraRecordingReachabilityEventManager *)v7 performCloudPullWithLabel:@"Fetching reachability events due to remote message"];
  [v4 respondWithSuccess];
}

- (void)handleAppleAccountSettingsHomeStateUpdated:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) accountSettings];
    *(_DWORD *)buf = 138543618;
    __int16 v20 = v5;
    __int16 v21 = 2112;
    __int16 v22 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received notification of an updated home state with account settings - %@", buf, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 32) hapAccessory];
  v8 = [v7 home];
  v9 = [*(id *)(a1 + 32) accountSettings];
  int v10 = [v9 isHomeEnabled];

  if (v10)
  {
    int v11 = [*(id *)(a1 + 32) currentSettings];
    id v12 = [v11 notificationSettings];
    objc_msgSend(v8, "setCameraReachabilityEventNotificationsEnabled:forAccessory:completionHandler:", objc_msgSend(v12, "isReachabilityEventNotificationEnabled"), v7, 0);

    uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
    [*(id *)(a1 + 32) setSuppressNotificationsBeforeDate:v13];

    id v14 = [*(id *)(a1 + 32) performCloudPullWithLabel:@"Fetching reachability events due to account settings changed"];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_100;
    v18[3] = &unk_1E6A19708;
    v18[4] = *(void *)(a1 + 32);
    uint64_t v15 = [v14 addSuccessBlock:v18];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_101;
    v17[3] = &unk_1E6A197F0;
    void v17[4] = *(void *)(a1 + 32);
    id v16 = (id)[v15 addFailureBlock:v17];
  }
  else
  {
    [v8 setCameraReachabilityEventNotificationsEnabled:0 forAccessory:v7 completionHandler:0];
  }
}

void __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_100(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Successfully fetched the reachability events due to account settings changed", (uint8_t *)&v8, 0xCu);
  }
}

void __89__HMDCameraRecordingReachabilityEventManager_handleAppleAccountSettingsHomeStateUpdated___block_invoke_101(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    int v8 = 138543618;
    v9 = v7;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch the reachability events due to account settings changed with error - %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)handleHMDBridgedAccessoryUnreachableNotification:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryUnreachableNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __95__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryUnreachableNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) hapAccessory];
  char v3 = [v2 isPrimary];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = [*(id *)(a1 + 32) hapAccessory];
      v9 = [v8 name];
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@HMDBridgedAccessoryUnreachableNotification for bridged camera %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) setCurrentBridgedCameraReachability:0];
    [*(id *)(a1 + 32) handleUpdatedCameraReachability:0];
  }
}

- (void)handleHMDBridgedAccessoryReachableNotification:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryReachableNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __93__HMDCameraRecordingReachabilityEventManager_handleHMDBridgedAccessoryReachableNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) hapAccessory];
  char v3 = [v2 isPrimary];

  if ((v3 & 1) == 0)
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      int v8 = [*(id *)(a1 + 32) hapAccessory];
      v9 = [v8 name];
      int v10 = 138543618;
      id v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@HMDBridgedAccessoryReachableNotification for bridged camera %@", (uint8_t *)&v10, 0x16u);
    }
    [*(id *)(a1 + 32) setCurrentBridgedCameraReachability:1];
    [*(id *)(a1 + 32) handleUpdatedCameraReachability:1];
  }
}

- (void)handleAccessoryUnconfigured:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__HMDCameraRecordingReachabilityEventManager_handleAccessoryUnconfigured___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __74__HMDCameraRecordingReachabilityEventManager_handleAccessoryUnconfigured___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) hapAccessory];
    uint64_t v7 = [v6 name];
    int v9 = 138543618;
    int v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Unconfigured camera %@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) handleUpdatedCameraReachability:0];
}

- (void)handleAccessoryConfigured:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMDCameraRecordingReachabilityEventManager_handleAccessoryConfigured___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __72__HMDCameraRecordingReachabilityEventManager_handleAccessoryConfigured___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 32) hapAccessory];
    uint64_t v7 = [v6 name];
    int v9 = 138543618;
    int v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Configured camera %@", (uint8_t *)&v9, 0x16u);
  }
  return [*(id *)(a1 + 32) handleUpdatedCameraReachability:1];
}

- (void)handleCameraProfileSettingsDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__HMDCameraRecordingReachabilityEventManager_handleCameraProfileSettingsDidChange___block_invoke;
  v7[3] = &unk_1E6A197C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __83__HMDCameraRecordingReachabilityEventManager_handleCameraProfileSettingsDidChange___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v30 = 138543362;
    uint64_t v31 = v5;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@Received camera profile settings did change notification", (uint8_t *)&v30, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) currentSettings];
  uint64_t v7 = [*(id *)(a1 + 40) userInfo];
  id v8 = [v7 objectForKeyedSubscript:@"HMDCameraProfileSettingsNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v9 = v8;
  }
  else {
    int v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    [*(id *)(a1 + 32) setCurrentSettings:v10];
    __int16 v11 = [*(id *)(a1 + 40) userInfo];
    char v12 = objc_msgSend(v11, "hmf_BOOLForKey:", @"HMDCameraProfileSettingsIsInitialSettingsUpdateNotificationKey");

    if ((v12 & 1) == 0)
    {
      uint64_t v13 = [v6 notificationSettings];
      char v14 = [v13 isReachabilityEventNotificationEnabled];

      uint64_t v15 = [v10 notificationSettings];
      int v16 = [v15 isReachabilityEventNotificationEnabled];

      if ((v14 & 1) == 0)
      {
        if (v16)
        {
          id v17 = (void *)MEMORY[0x1D9452090]();
          id v18 = *(id *)(a1 + 32);
          unint64_t v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            __int16 v20 = HMFGetLogIdentifier();
            int v30 = 138543362;
            uint64_t v31 = v20;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Reachability event notifications are now enabled", (uint8_t *)&v30, 0xCu);
          }
          __int16 v21 = [MEMORY[0x1E4F1C9C8] date];
          [*(id *)(a1 + 32) setSuppressNotificationsBeforeDate:v21];

          id v22 = (id)[*(id *)(a1 + 32) performCloudPullWithLabel:@"Fetching reachability events due to enabling notifications"];
        }
      }
    }
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1D9452090]();
    id v24 = *(id *)(a1 + 32);
    __int16 v25 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = HMFGetLogIdentifier();
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = [*(id *)(a1 + 40) userInfo];
      uint64_t v29 = [v28 objectForKeyedSubscript:@"HMDCameraProfileSettingsNotificationKey"];
      int v30 = 138544130;
      uint64_t v31 = v26;
      __int16 v32 = 2112;
      v33 = @"HMDCameraProfileSettingsNotificationKey";
      __int16 v34 = 2112;
      uint64_t v35 = v27;
      __int16 v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Object for key %@ is not of expected type %@: %@", (uint8_t *)&v30, 0x2Au);
    }
  }
}

- (void)handleResidentDeviceConfirmedStateChangedNotification:(id)a3
{
  id v4 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__HMDCameraRecordingReachabilityEventManager_handleResidentDeviceConfirmedStateChangedNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __100__HMDCameraRecordingReachabilityEventManager_handleResidentDeviceConfirmedStateChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) hapAccessory];
  id v3 = [v2 home];
  uint64_t v4 = [v3 isCurrentDeviceConfirmedPrimaryResident];

  uint64_t result = [*(id *)(a1 + 32) isCurrentDeviceConfirmedPrimaryResident];
  if (v4 != result)
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) isCurrentDeviceConfirmedPrimaryResident];
      id v10 = HMFBooleanToString();
      __int16 v11 = HMFBooleanToString();
      int v12 = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v11;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Notified that isCurrentDeviceConfirmedPrimaryResident changed from %@ to %@", (uint8_t *)&v12, 0x20u);
    }
    return [*(id *)(a1 + 32) setCurrentDeviceConfirmedPrimaryResident:v4];
  }
  return result;
}

- (id)mostRecentReachabilityEventModelInModels:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__129513;
  __int16 v11 = __Block_byref_object_dispose__129514;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __87__HMDCameraRecordingReachabilityEventManager_mostRecentReachabilityEventModelInModels___block_invoke;
  v6[3] = &unk_1E6A11288;
  v6[4] = &v7;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __87__HMDCameraRecordingReachabilityEventManager_mostRecentReachabilityEventModelInModels___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  id v10 = v4;
  if (v6)
  {
    uint64_t v7 = [v6 dateOfOccurrence];
    id v8 = [v10 dateOfOccurrence];
    uint64_t v9 = [v7 compare:v8];

    if (v9 != -1) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_5:
}

- (void)startReachabilityChangeDebounceTimerWithReachability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v3) {
    uint64_t v6 = [(HMDCameraRecordingReachabilityEventManager *)self reachabilityChangeReachableDebounceTimeout];
  }
  else {
    uint64_t v6 = [(HMDCameraRecordingReachabilityEventManager *)self reachabilityChangeUnreachableDebounceTimeout];
  }
  double v8 = v7;
  uint64_t v9 = (void *)MEMORY[0x1D9452090](v6);
  id v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v20 = 138543618;
    __int16 v21 = v12;
    __int16 v22 = 2048;
    double v23 = v8;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Starting reachability change debounce timer with time interval of %fs", (uint8_t *)&v20, 0x16u);
  }
  uint64_t v13 = [(HMDCameraRecordingReachabilityEventManager *)v10 reachabilityChangeDebounceTimerFactory];
  __int16 v14 = v13[2](v13, 0, v8);
  [(HMDCameraRecordingReachabilityEventManager *)v10 setReachabilityChangeDebounceTimer:v14];

  uint64_t v15 = [(HMDCameraRecordingReachabilityEventManager *)v10 reachabilityChangeDebounceTimer];
  [v15 setDelegate:v10];

  __int16 v16 = [(HMDCameraRecordingReachabilityEventManager *)v10 workQueue];
  id v17 = [(HMDCameraRecordingReachabilityEventManager *)v10 reachabilityChangeDebounceTimer];
  [v17 setDelegateQueue:v16];

  uint64_t v18 = [(HMDCameraRecordingReachabilityEventManager *)v10 reachabilityChangeDebounceTimer];
  [v18 resume];

  unint64_t v19 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDCameraRecordingReachabilityEventManager *)v10 setReachabilityChangeDebounceStartDate:v19];
}

- (double)reachabilityChangeUnreachableDebounceTimeout
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  BOOL v3 = [v2 preferenceForKey:@"reachabilityChangeUnreachableDebounceTimeout"];
  id v4 = [v3 numberValue];

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)reachabilityChangeReachableDebounceTimeout
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  BOOL v3 = [v2 preferenceForKey:@"reachabilityChangeReachableDebounceTimeout"];
  id v4 = [v3 numberValue];

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (void)updateInitialReachabilityTimer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDCameraRecordingReachabilityEventManager *)self shouldHandleReachabilityChanges])
  {
    id v4 = (void *)MEMORY[0x1D9452090]();
    double v5 = self;
    double v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      double v7 = HMFGetLogIdentifier();
      int v15 = 138543362;
      __int16 v16 = v7;
      _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_INFO, "%{public}@Starting initial reachability timer", (uint8_t *)&v15, 0xCu);
    }
    [(HMDCameraRecordingReachabilityEventManager *)v5 setReachabilityChangeDebounceTimer:0];
    id v8 = objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    [(HMDCameraRecordingReachabilityEventManager *)v5 setDidHandleInitialReachabilityFuture:v8];

    uint64_t v9 = [(HMDCameraRecordingReachabilityEventManager *)v5 initialReachabilityTimerFactory];
    [(HMDCameraRecordingReachabilityEventManager *)v5 initialReachabilityTimeout];
    id v10 = v9[2](v9, 0);
    [(HMDCameraRecordingReachabilityEventManager *)v5 setInitialReachabilityTimer:v10];

    __int16 v11 = [(HMDCameraRecordingReachabilityEventManager *)v5 initialReachabilityTimer];
    [v11 setDelegate:v5];

    id v12 = [(HMDCameraRecordingReachabilityEventManager *)v5 workQueue];
    uint64_t v13 = [(HMDCameraRecordingReachabilityEventManager *)v5 initialReachabilityTimer];
    [v13 setDelegateQueue:v12];

    __int16 v14 = [(HMDCameraRecordingReachabilityEventManager *)v5 initialReachabilityTimer];
    [v14 resume];
  }
  else
  {
    [(HMDCameraRecordingReachabilityEventManager *)self setInitialReachabilityTimer:0];
    [(HMDCameraRecordingReachabilityEventManager *)self setReachabilityChangeDebounceTimer:0];
  }
}

- (double)initialReachabilityTimeout
{
  v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  BOOL v3 = [v2 preferenceForKey:@"cameraInitialReachabilityTimeout"];
  id v4 = [v3 numberValue];

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (id)performCloudPullWithLabel:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  double v6 = [(HMDCameraRecordingReachabilityEventManager *)self cloudZone];

  if (v6)
  {
    double v7 = [MEMORY[0x1E4F69EF0] optionsWithLabel:v4];
    id v8 = [(HMDCameraRecordingReachabilityEventManager *)self cloudZone];
    uint64_t v9 = [v8 performCloudPullWithOptions:v7];
    id v10 = (void *)MEMORY[0x1E4F7A0F0];
    __int16 v11 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
    id v12 = [v10 schedulerWithDispatchQueue:v11];
    uint64_t v13 = [v9 reschedule:v12];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__HMDCameraRecordingReachabilityEventManager_performCloudPullWithLabel___block_invoke;
    v22[3] = &unk_1E6A196E0;
    v22[4] = self;
    id v23 = v7;
    id v14 = v7;
    int v15 = [v13 addFailureBlock:v22];
  }
  else
  {
    __int16 v16 = (void *)MEMORY[0x1D9452090]();
    uint64_t v17 = self;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      unint64_t v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v19;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform cloud pull because zones are not ready", buf, 0xCu);
    }
    int v20 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v13 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
    int v15 = [v20 futureWithError:v13];
  }

  return v15;
}

void __72__HMDCameraRecordingReachabilityEventManager_performCloudPullWithLabel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  double v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    double v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform cloud pull with options %@ due to error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (void)submitLogEventWithCurrentModel:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = 0.0;
  if ([v4 reachable])
  {
    double v6 = [(HMDCameraRecordingReachabilityEventManager *)self mostRecentReachabilityEventModel];
    if (!v6) {
      _HMFPreconditionFailure();
    }
    double v7 = v6;
    uint64_t v8 = [v6 dateOfOccurrence];
    if (v8)
    {
      int v9 = [v4 dateOfOccurrence];
      [v9 timeIntervalSinceDate:v8];
      double v5 = v10;
    }
    else
    {
      __int16 v11 = (void *)MEMORY[0x1D9452090]();
      uint64_t v12 = self;
      __int16 v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        id v14 = HMFGetLogIdentifier();
        int v22 = 138543618;
        id v23 = v14;
        __int16 v24 = 2112;
        __int16 v25 = v7;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_FAULT, "%{public}@Most recent reachability event model has no date of occurrence: %@", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  uint64_t v15 = [HMDCameraRecordingReachabilityLogEvent alloc];
  if (v4) {
    uint64_t v16 = [v4 reachable];
  }
  else {
    uint64_t v16 = [(HMDCameraRecordingReachabilityEventManager *)self currentCameraReachability];
  }
  uint64_t v17 = v16;
  unint64_t v18 = [(HMDCameraRecordingReachabilityEventManager *)self reachabilityChangeDebounceCount];
  unint64_t v19 = [(HMDCameraRecordingReachabilityEventManager *)self hapAccessory];
  int v20 = [(HMDCameraRecordingReachabilityLogEvent *)v15 initWithReachability:v17 didCreateEventModel:v4 != 0 reachabilityChangeDebounceCount:v18 offlineDuration:v19 hapAccessory:v5];

  __int16 v21 = [(HMDCameraRecordingReachabilityEventManager *)self logEventSubmitter];
  [v21 submitLogEvent:v20];

  [(HMDCameraRecordingReachabilityEventManager *)self setReachabilityChangeDebounceCount:0];
}

- (id)reachabilityEventModelForCurrentCameraReachability:(BOOL)a3 dateOfOccurrence:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [HMDCameraRecordingReachabilityEventModel alloc];
  int v9 = [MEMORY[0x1E4F29128] UUID];
  double v10 = [(HMDCameraRecordingReachabilityEventManager *)self hapAccessory];
  __int16 v11 = [v10 uuid];
  uint64_t v12 = [(HMBModel *)v8 initWithModelID:v9 parentModelID:v11];

  [(HMDCameraRecordingReachabilityEventModel *)v12 setReachable:v4];
  [(HMDCameraRecordingReachabilityEventModel *)v12 setDateOfOccurrence:v6];

  return v12;
}

- (void)notifyTransportOfUpdatedEvents:(id)a3 removedEventUUIDs:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  int v9 = [(HMDCameraRecordingReachabilityEventManager *)self clientConnections];
  uint64_t v10 = [v9 count];

  __int16 v11 = (void *)MEMORY[0x1D9452090]();
  uint64_t v12 = self;
  __int16 v13 = HMFGetOSLogHandle();
  id v14 = v13;
  if (v10)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      uint64_t v16 = [(HMDCameraRecordingReachabilityEventManager *)v12 clientConnections];
      *(_DWORD *)buf = 138544130;
      __int16 v42 = v15;
      __int16 v43 = 2048;
      uint64_t v44 = [v16 count];
      __int16 v45 = 2048;
      uint64_t v46 = [v6 count];
      __int16 v47 = 2048;
      uint64_t v48 = [v7 count];
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Notifying %lu subscribed transports of %lu updated events, %lu removed events", buf, 0x2Au);
    }
    v39[0] = *MEMORY[0x1E4F2CCD8];
    id v32 = v6;
    uint64_t v17 = encodeRootObjectForIncomingXPCMessage(v6, 0);
    v39[1] = *MEMORY[0x1E4F2CCC8];
    v40[0] = v17;
    id v31 = v7;
    v40[1] = v7;
    unint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = [(HMDCameraRecordingReachabilityEventManager *)v12 clientConnections];
    uint64_t v19 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v35;
      uint64_t v22 = *MEMORY[0x1E4F2CC90];
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v35 != v21) {
            objc_enumerationMutation(obj);
          }
          uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * v23);
          __int16 v25 = [MEMORY[0x1E4F654B0] entitledMessageWithName:v22 messagePayload:v18];
          [v25 setTransport:v24];
          id v26 = objc_alloc(MEMORY[0x1E4F65488]);
          uint64_t v27 = [(HMDCameraRecordingReachabilityEventManager *)v12 messageTargetUUID];
          uint64_t v28 = (void *)[v26 initWithTarget:v27];
          [v25 setDestination:v28];

          [v25 setRequiresCameraClipsEntitlement];
          uint64_t v29 = [(HMDCameraRecordingReachabilityEventManager *)v12 messageDispatcher];
          [v29 sendMessage:v25];

          ++v23;
        }
        while (v20 != v23);
        uint64_t v20 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v20);
    }

    id v7 = v31;
    id v6 = v32;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v30 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      __int16 v42 = v30;
      __int16 v43 = 2048;
      uint64_t v44 = [v6 count];
      __int16 v45 = 2048;
      uint64_t v46 = [v7 count];
      _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEBUG, "%{public}@No subscribed transports to notify of %lu updated events, %lu removed events", buf, 0x20u);
    }
  }
}

- (void)notifySubscribersOfRemoteCameraReachabilityEvent
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDCameraRecordingReachabilityEventManager *)self hapAccessory];
  double v5 = v4;
  if (v4)
  {
    id v6 = [v4 home];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 notificationRegistry];
      int v9 = [v5 uuid];
      uint64_t v27 = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
      __int16 v11 = [v8 userIDsRegisteredForReachabilityEventNotificationsForAccessoryUUIDs:v10];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __94__HMDCameraRecordingReachabilityEventManager_notifySubscribersOfRemoteCameraReachabilityEvent__block_invoke;
      v26[3] = &unk_1E6A11238;
      v26[4] = self;
      uint64_t v12 = objc_msgSend(v11, "na_map:", v26);
      if (objc_msgSend(v12, "hmf_isEmpty"))
      {
        __int16 v13 = (void *)MEMORY[0x1D9452090]();
        id v14 = self;
        uint64_t v15 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          uint64_t v29 = v16;
          _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@No devices need to be notified for accessory reachability event", buf, 0xCu);
        }
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __94__HMDCameraRecordingReachabilityEventManager_notifySubscribersOfRemoteCameraReachabilityEvent__block_invoke_78;
        v25[3] = &unk_1E6A11260;
        v25[4] = self;
        objc_msgSend(v12, "na_each:", v25);
      }
    }
    else
    {
      uint64_t v21 = (void *)MEMORY[0x1D9452090]();
      uint64_t v22 = self;
      uint64_t v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = v24;
        _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_ERROR, "%{public}@Home reference was nil when attempting to notify subscribers", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1D9452090]();
    unint64_t v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      uint64_t v29 = v20;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@HAP accessory reference was nil when attempting to notify subscribers", buf, 0xCu);
    }
  }
}

id __94__HMDCameraRecordingReachabilityEventManager_notifySubscribersOfRemoteCameraReachabilityEvent__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = +[HMDDevice deviceWithDestination:v3];
  if (!v4)
  {
    double v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = *(id *)(a1 + 32);
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      int v10 = 138543618;
      __int16 v11 = v8;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the device with destination %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v4;
}

void __94__HMDCameraRecordingReachabilityEventManager_notifySubscribersOfRemoteCameraReachabilityEvent__block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [HMDRemoteMessage alloc];
  double v5 = [HMDRemoteDeviceMessageDestination alloc];
  id v6 = [*(id *)(a1 + 32) uniqueIdentifier];
  id v7 = [(HMDRemoteDeviceMessageDestination *)v5 initWithTarget:v6 device:v3];
  uint64_t v8 = [(HMDRemoteMessage *)v4 initWithName:@"HMDRemoteCameraReachabilityDidChangeMessage" destination:v7 payload:0 type:0 timeout:1 secure:86400.0];

  int v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = *(id *)(a1 + 32);
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v13 = [v3 shortDescription];
    [*(id *)(a1 + 32) currentCameraReachability];
    uint64_t v14 = HMFBooleanToString();
    uint64_t v15 = [(HMFObject *)v8 shortDescription];
    int v17 = 138544130;
    unint64_t v18 = v12;
    __int16 v19 = 2112;
    uint64_t v20 = v13;
    __int16 v21 = 2112;
    uint64_t v22 = v14;
    __int16 v23 = 2112;
    uint64_t v24 = v15;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Notifying device %@ for camera reachability change to %@ using message: %@", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v16 = [*(id *)(a1 + 32) messageDispatcher];
  [v16 sendMessage:v8];
}

- (void)addCameraReachabilityEventForCurrentCameraReachability:(BOOL)a3 dateOfOccurrence:(id)a4
{
  BOOL v4 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  uint64_t v8 = [(HMDCameraRecordingReachabilityEventManager *)self reachabilityEventModelForCurrentCameraReachability:v4 dateOfOccurrence:v6];
  int v9 = (void *)MEMORY[0x1D9452090]();
  id v10 = self;
  __int16 v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v13 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    id v32 = v12;
    __int16 v33 = 2112;
    long long v34 = v8;
    __int16 v35 = 2112;
    long long v36 = v13;
    __int16 v37 = 2112;
    id v38 = v6;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Adding camera reachability event model %@ with current reachability: %@ date of occurrence: %@", buf, 0x2Au);
  }
  id v26 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Create camera reachability event"];
  uint64_t v14 = [(HMDCameraRecordingReachabilityEventManager *)v10 localZone];
  uint64_t v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  uint64_t v16 = [v14 createModels:v15 options:v26];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke;
  v30[3] = &unk_1E6A16F08;
  v30[4] = v10;
  [v16 flatMap:v30];
  int v17 = v25 = v6;
  unint64_t v18 = (void *)MEMORY[0x1E4F7A0F0];
  __int16 v19 = [(HMDCameraRecordingReachabilityEventManager *)v10 workQueue];
  uint64_t v20 = [v18 schedulerWithDispatchQueue:v19];
  __int16 v21 = [v17 reschedule:v20];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_73;
  v29[3] = &unk_1E6A16F30;
  v29[4] = v10;
  uint64_t v22 = [v21 addSuccessBlock:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_2;
  v27[3] = &unk_1E6A196E0;
  v27[4] = v10;
  id v28 = v8;
  id v23 = v8;
  id v24 = (id)[v22 addFailureBlock:v27];

  [(HMDCameraRecordingReachabilityEventManager *)v10 submitLogEventWithCurrentModel:v23];
  [(HMDCameraRecordingReachabilityEventManager *)v10 setMostRecentReachabilityEventModel:v23];
}

id __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = [v3 mirrorOutputResult];

  if (v4)
  {
    double v5 = [v3 mirrorOutputResult];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1D9452090]();
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_ERROR, "%{public}@No mirrorOutputResult future provided", (uint8_t *)&v13, 0xCu);
    }
    id v10 = (void *)MEMORY[0x1E4F7A0D8];
    __int16 v11 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:15];
    double v5 = [v10 futureWithError:v11];
  }
  return v5;
}

uint64_t __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_73(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifySubscribersOfRemoteCameraReachabilityEvent];
}

void __118__HMDCameraRecordingReachabilityEventManager_addCameraReachabilityEventForCurrentCameraReachability_dateOfOccurrence___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = (void *)MEMORY[0x1D9452090]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    id v7 = HMFGetLogIdentifier();
    uint64_t v8 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v3;
    _os_log_impl(&dword_1D49D5000, v6, OS_LOG_TYPE_ERROR, "%{public}@Failed to push event %@ to the cloud due to error: %@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)fetchReachabilityEventsWithDateInterval:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v7 = [(HMDCameraRecordingReachabilityEventManager *)self localZone];
  uint64_t v8 = [v7 queryModelsOfType:objc_opt_class()];

  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __86__HMDCameraRecordingReachabilityEventManager_fetchReachabilityEventsWithDateInterval___block_invoke;
  uint64_t v16 = &unk_1E6A11210;
  id v17 = v4;
  id v18 = v6;
  id v9 = v6;
  id v10 = v4;
  [v8 enumerateObjectsUsingBlock:&v13];
  __int16 v11 = objc_msgSend(v9, "copy", v13, v14, v15, v16);

  return v11;
}

void __86__HMDCameraRecordingReachabilityEventManager_fetchReachabilityEventsWithDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v6 = v3;
  id v5 = [v3 dateOfOccurrence];
  LODWORD(v4) = [v4 containsDate:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (BOOL)shouldAddInitialReachabilityEventForCurrentCameraReachability:(BOOL)a3 mostRecentReachabilityEventModel:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  id v7 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  if (v6) {
    v4 ^= [v6 reachable];
  }
  else {
    LOBYTE(v4) = v4 ^ 1;
  }

  return v4;
}

- (void)handleInitialCameraReachability
{
  id v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  LOBYTE(v3) = [(HMDCameraRecordingReachabilityEventManager *)self currentCameraReachability];
  int v4 = [MEMORY[0x1E4F1C9C8] date];
  [(HMDCameraRecordingReachabilityEventManager *)self setSuppressNotificationsBeforeDate:v4];
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self performCloudPullWithLabel:@"Fetch initial reachability events"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__HMDCameraRecordingReachabilityEventManager_handleInitialCameraReachability__block_invoke;
  v8[3] = &unk_1E6A111E8;
  char v10 = (char)v3;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  id v7 = (id)[v5 addSuccessBlock:v8];
}

void __77__HMDCameraRecordingReachabilityEventManager_handleInitialCameraReachability__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  id v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  id v7 = [MEMORY[0x1E4F1C9C8] distantFuture];
  uint64_t v8 = (void *)[v5 initWithStartDate:v6 endDate:v7];

  id v9 = [*(id *)(a1 + 32) fetchReachabilityEventsWithDateInterval:v8];
  char v10 = [*(id *)(a1 + 32) mostRecentReachabilityEventModelInModels:v9];
  [*(id *)(a1 + 32) setMostRecentReachabilityEventModel:v10];

  __int16 v11 = (void *)MEMORY[0x1D9452090]();
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    uint64_t v25 = v11;
    uint64_t v15 = v9;
    uint64_t v16 = v8;
    id v17 = v3;
    int v18 = *(unsigned __int8 *)(a1 + 48);
    __int16 v19 = [*(id *)(a1 + 32) mostRecentReachabilityEventModel];
    uint64_t v20 = [v19 createEvent];
    *(_DWORD *)buf = 138543874;
    uint64_t v27 = v14;
    __int16 v28 = 1024;
    int v29 = v18;
    id v3 = v17;
    uint64_t v8 = v16;
    id v9 = v15;
    __int16 v11 = v25;
    __int16 v30 = 2114;
    id v31 = v20;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Determining should add initial reachability event using current reachability: %{BOOL}d, most recent reachability event: %{public}@", buf, 0x1Cu);
  }
  __int16 v21 = *(void **)(a1 + 32);
  uint64_t v22 = *(unsigned __int8 *)(a1 + 48);
  id v23 = [v21 mostRecentReachabilityEventModel];
  LODWORD(v21) = [v21 shouldAddInitialReachabilityEventForCurrentCameraReachability:v22 mostRecentReachabilityEventModel:v23];

  if (v21)
  {
    [*(id *)(a1 + 32) setReachabilityChangeDebounceCount:1];
    [*(id *)(a1 + 32) addCameraReachabilityEventForCurrentCameraReachability:*(unsigned __int8 *)(a1 + 48) dateOfOccurrence:*(void *)(a1 + 40)];
  }
  id v24 = [*(id *)(a1 + 32) didHandleInitialReachabilityFuture];
  [v24 finishWithNoResult];
}

- (void)handleUpdatedCameraReachability:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraRecordingReachabilityEventManager *)self initialReachabilityTimer];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v10;
      __int16 v11 = "%{public}@Initial reachability timer active";
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v13, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (![(HMDCameraRecordingReachabilityEventManager *)self shouldHandleReachabilityChanges])
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    uint64_t v8 = self;
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = HMFGetLogIdentifier();
      int v13 = 138543362;
      uint64_t v14 = v10;
      __int16 v11 = "%{public}@Not handling reachability change";
      goto LABEL_11;
    }
LABEL_12:

    return;
  }
  [(HMDCameraRecordingReachabilityEventManager *)self setCurrentCameraReachability:v3];
  [(HMDCameraRecordingReachabilityEventManager *)self setReachabilityChangeDebounceCount:[(HMDCameraRecordingReachabilityEventManager *)self reachabilityChangeDebounceCount]+ 1];
  id v12 = [(HMDCameraRecordingReachabilityEventManager *)self reachabilityChangeDebounceTimer];

  if (!v12)
  {
    [(HMDCameraRecordingReachabilityEventManager *)self startReachabilityChangeDebounceTimerWithReachability:v3];
  }
}

- (void)setCurrentDeviceConnectedToNetwork:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_currentDeviceConnectedToNetwork != v3)
  {
    self->_currentDeviceConnectedToNetwork = v3;
    [(HMDCameraRecordingReachabilityEventManager *)self updateInitialReachabilityTimer];
  }
}

- (BOOL)isCurrentDeviceConnectedToNetwork
{
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_currentDeviceConnectedToNetwork;
}

- (void)setCurrentDeviceConfirmedPrimaryResident:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (self->_currentDeviceConfirmedPrimaryResident != v3)
  {
    self->_currentDeviceConfirmedPrimaryResident = v3;
    [(HMDCameraRecordingReachabilityEventManager *)self updateInitialReachabilityTimer];
    id v6 = [(HMDCameraRecordingReachabilityEventManager *)self hapAccessory];
    if (v6)
    {
      id v7 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
      uint64_t v8 = v7;
      if (v3)
      {
        [v7 addObserver:self selector:sel_handleAccessoryConfigured_ name:@"HMDAccessoryConnectedNotification" object:v6];

        id v9 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
        [v9 addObserver:self selector:sel_handleAccessoryUnconfigured_ name:@"HMDAccessoryDisconnectedNotification" object:v6];

        char v10 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
        [v10 addObserver:self selector:sel_handleHMDBridgedAccessoryReachableNotification_ name:@"HMDBridgedAccessoryReachableNotification" object:v6];

        __int16 v11 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
        [v11 addObserver:self selector:sel_handleHMDBridgedAccessoryUnreachableNotification_ name:@"HMDBridgedAccessoryUnreachableNotification" object:v6];
      }
      else
      {
        [v7 removeObserver:self name:@"HMDAccessoryConnectedNotification" object:v6];

        uint64_t v16 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
        [v16 removeObserver:self name:@"HMDAccessoryDisconnectedNotification" object:v6];

        id v17 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
        [v17 removeObserver:self name:@"HMDBridgedAccessoryReachableNotification" object:v6];

        __int16 v11 = [(HMDCameraRecordingReachabilityEventManager *)self notificationCenter];
        [v11 removeObserver:self name:@"HMDBridgedAccessoryUnreachableNotification" object:v6];
      }
    }
    else
    {
      id v12 = (void *)MEMORY[0x1D9452090]();
      int v13 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = HMFGetLogIdentifier();
        int v18 = 138543362;
        __int16 v19 = v15;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Not updating notification registrations because accessory reference is nil", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (BOOL)isCurrentDeviceConfirmedPrimaryResident
{
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  return self->_currentDeviceConfirmedPrimaryResident;
}

- (void)setCurrentSettings:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  LODWORD(v5) = isRecordingAllowedForSettings(self->_currentSettings);
  id v6 = (_HMCameraUserSettings *)[v4 copy];
  currentSettings = self->_currentSettings;
  self->_currentSettings = v6;

  int v8 = isRecordingAllowedForSettings(v4);
  if (v5 != v8)
  {
    [(HMDCameraRecordingReachabilityEventManager *)self updateInitialReachabilityTimer];
  }
}

- (_HMCameraUserSettings)currentSettings
{
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  currentSettings = self->_currentSettings;
  return currentSettings;
}

- (BOOL)shouldHandleReachabilityChanges
{
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self currentSettings];
  BOOL v4 = isRecordingAllowedForSettings(v3)
    && [(HMDCameraRecordingReachabilityEventManager *)self isCurrentDeviceConnectedToNetwork]&& [(HMDCameraRecordingReachabilityEventManager *)self isCurrentDeviceConfirmedPrimaryResident];

  return v4;
}

- (BOOL)isAccessoryReachable
{
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDCameraRecordingReachabilityEventManager *)self hapAccessory];
  id v5 = v4;
  if (v4)
  {
    if ([v4 isPrimary]) {
      char v6 = [v5 isReachable];
    }
    else {
      char v6 = [(HMDCameraRecordingReachabilityEventManager *)self currentBridgedCameraReachability];
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)cleanUpEvents
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-*MEMORY[0x1E4F2CC80]];
  id v5 = objc_alloc(MEMORY[0x1E4F28C18]);
  char v6 = [MEMORY[0x1E4F1C9C8] distantPast];
  BOOL v7 = (void *)[v5 initWithStartDate:v6 endDate:v4];

  int v8 = [(HMDCameraRecordingReachabilityEventManager *)self fetchReachabilityEventsWithDateInterval:v7];
  if ((unint64_t)[v8 count] > 1)
  {
    int v13 = [(HMDCameraRecordingReachabilityEventManager *)self mostRecentReachabilityEventModelInModels:v8];
    uint64_t v14 = (void *)MEMORY[0x1E4F1CAD0];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __59__HMDCameraRecordingReachabilityEventManager_cleanUpEvents__block_invoke;
    v26[3] = &unk_1E6A111C0;
    id v15 = v13;
    id v27 = v15;
    uint64_t v16 = objc_msgSend(v8, "na_map:", v26);
    id v17 = [v14 setWithArray:v16];

    int v18 = (void *)MEMORY[0x1D9452090]();
    __int16 v19 = self;
    uint64_t v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      uint64_t v22 = [v17 count];
      *(_DWORD *)buf = 138543618;
      int v29 = v21;
      __int16 v30 = 2048;
      uint64_t v31 = v22;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Removing %lu expired records", buf, 0x16u);
    }
    id v23 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Remove expired camera reachability event records"];
    [v23 setShouldEnqueueMirrorOutput:0];
    id v24 = [(HMDCameraRecordingReachabilityEventManager *)v19 localZone];
    id v25 = (id)[v24 removeModelIDs:v17 options:v23];
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    char v10 = self;
    __int16 v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      id v12 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v29 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@No expired models to delete", buf, 0xCu);
    }
  }
}

id __59__HMDCameraRecordingReachabilityEventManager_cleanUpEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 hmbModelID];
  id v5 = [*(id *)(a1 + 32) hmbModelID];
  char v6 = [v4 isEqual:v5];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [v3 hmbModelID];
  }

  return v7;
}

- (void)configureWithMessageDispatcher:(id)a3 currentSettings:(id)a4 isCurrentDeviceConfirmedPrimaryResident:(BOOL)a5 isCurrentDeviceConnectedToNetwork:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v52 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  __int16 v11 = [(HMDCameraRecordingReachabilityEventManager *)self workQueue];
  dispatch_assert_queue_V2(v11);

  id v12 = (void *)MEMORY[0x1D9452090]();
  int v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = HMFGetLogIdentifier();
    uint64_t v16 = HMFBooleanToString();
    id v17 = HMFBooleanToString();
    *(_DWORD *)buf = 138544130;
    v61 = v15;
    __int16 v62 = 2112;
    id v63 = v10;
    __int16 v64 = 2112;
    v65 = v16;
    __int16 v66 = 2112;
    v67 = v17;
    _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Configuring with current settings: %@, isCurrentDeviceConfirmedPrimaryResident: %@, isCurrentDeviceConnectedToNetwork: %@", buf, 0x2Au);
  }
  int v18 = [(HMDCameraRecordingReachabilityEventManager *)v13 hapAccessory];
  __int16 v19 = [v18 home];
  [(HMDCameraRecordingReachabilityEventManager *)v13 setMessageDispatcher:v9];
  uint64_t v20 = +[HMDXPCMessagePolicy policyWithEntitlements:133];
  __int16 v21 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v19 userPrivilege:0 remoteAccessRequired:0 requiresCameraStreamingAccess:1];
  +[HMDUserMessagePolicy userMessagePolicyWithHome:v19 userPrivilege:4 remoteAccessRequired:0];
  uint64_t v22 = v50 = v6;
  id v23 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  +[HMDRemoteMessagePolicy defaultSecurePolicy];
  id v24 = v51 = v9;
  v59[0] = v24;
  v59[1] = v21;
  uint64_t v49 = v10;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  [v23 registerForMessage:@"HMDRemoteCameraReachabilityDidChangeMessage" receiver:v13 policies:v25 selector:sel_handleRemoteCameraReachabilityChange_];

  id v26 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  uint64_t v27 = *MEMORY[0x1E4F2CCA0];
  v58[0] = v20;
  v58[1] = v21;
  __int16 v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  [v26 registerForMessage:v27 receiver:v13 policies:v28 selector:sel_handleFetchEventsMessage_];

  int v29 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  uint64_t v30 = *MEMORY[0x1E4F2CC98];
  v57[0] = v20;
  v57[1] = v21;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  [v29 registerForMessage:v30 receiver:v13 policies:v31 selector:sel_handleFetchCountOfEventsMessage_];

  uint64_t v32 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  uint64_t v33 = *MEMORY[0x1E4F2CCF0];
  v56[0] = v20;
  v56[1] = v21;
  long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  [v32 registerForMessage:v33 receiver:v13 policies:v34 selector:sel_handleSubscribeMessage_];

  __int16 v35 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  uint64_t v36 = *MEMORY[0x1E4F2CCF8];
  v55[0] = v20;
  v55[1] = v21;
  __int16 v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:2];
  [v35 registerForMessage:v36 receiver:v13 policies:v37 selector:sel_handleUnsubscribeMessage_];

  id v38 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  uint64_t v39 = *MEMORY[0x1E4F2CCE8];
  v54[0] = v20;
  v54[1] = v21;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:2];
  [v38 registerForMessage:v39 receiver:v13 policies:v40 selector:sel_handlePerformCloudPullMessage_];

  v41 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:4];
  __int16 v42 = [(HMDCameraRecordingReachabilityEventManager *)v13 messageDispatcher];
  uint64_t v43 = *MEMORY[0x1E4F2CC88];
  v53[0] = v20;
  v53[1] = v22;
  v53[2] = v41;
  uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  [v42 registerForMessage:v43 receiver:v13 policies:v44 selector:sel_handleDeleteAllEventsMessage_];

  __int16 v45 = [(HMDCameraRecordingReachabilityEventManager *)v13 notificationCenter];
  [v45 addObserver:v13 selector:sel_handleResidentDeviceConfirmedStateChangedNotification_ name:@"HMDResidentDeviceConfirmedStateChangedNotification" object:0];

  uint64_t v46 = [(HMDCameraRecordingReachabilityEventManager *)v13 notificationCenter];
  [v46 addObserver:v13 selector:sel_handleCameraProfileSettingsDidChange_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v18];

  __int16 v47 = [(HMDCameraRecordingReachabilityEventManager *)v13 notificationCenter];
  uint64_t v48 = [(HMDCameraRecordingReachabilityEventManager *)v13 accountSettings];
  [v47 addObserver:v13 selector:sel_handleAppleAccountSettingsHomeStateUpdated_ name:@"HMDAppleAccountSettingsHomeStateUpdatedNotification" object:v48];

  [(HMDCameraRecordingReachabilityEventManager *)v13 setCurrentSettings:v49];
  [(HMDCameraRecordingReachabilityEventManager *)v13 setCurrentDeviceConfirmedPrimaryResident:v52];
  [(HMDCameraRecordingReachabilityEventManager *)v13 setCurrentDeviceConnectedToNetwork:v50];
}

- (HMDCameraRecordingReachabilityEventManager)initWithHAPAccessory:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 uuid];
  id v9 = +[HMDBulletinBoard sharedBulletinBoard];
  id v10 = +[HMDMetricsManager sharedLogEventSubmitter];
  __int16 v11 = +[HMDAppleAccountSettings sharedSettings];
  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v13 = [(HMDCameraRecordingReachabilityEventManager *)self initWithAccessory:v7 workQueue:v6 identifier:v8 bulletinBoard:v9 logEventSubmitter:v10 accountSettings:v11 notificationCenter:v12];

  return v13;
}

- (HMDCameraRecordingReachabilityEventManager)initWithAccessory:(id)a3 workQueue:(id)a4 identifier:(id)a5 bulletinBoard:(id)a6 logEventSubmitter:(id)a7 accountSettings:(id)a8 notificationCenter:(id)a9
{
  id v15 = a3;
  id v32 = a4;
  id v31 = a5;
  id v30 = a6;
  id v29 = a7;
  id v16 = a8;
  id v17 = a9;
  v33.receiver = self;
  v33.super_class = (Class)HMDCameraRecordingReachabilityEventManager;
  int v18 = [(HMDCameraRecordingReachabilityEventManager *)&v33 init];
  __int16 v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_uniqueIdentifier, a5);
    objc_storeWeak((id *)&v19->_hapAccessory, v15);
    objc_storeStrong((id *)&v19->_workQueue, a4);
    objc_storeStrong((id *)&v19->_bulletinBoard, a6);
    objc_storeStrong((id *)&v19->_logEventSubmitter, a7);
    objc_storeStrong((id *)&v19->_accountSettings, a8);
    objc_storeStrong((id *)&v19->_notificationCenter, a9);
    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28D30], "weakObjectsHashTable", v29, v30, v31, v32);
    clientConnections = v19->_clientConnections;
    v19->_clientConnections = (NSHashTable *)v20;

    uint64_t v22 = [MEMORY[0x1E4F1C9C8] distantPast];
    suppressNotificationsBeforeDate = v19->_suppressNotificationsBeforeDate;
    v19->_suppressNotificationsBeforeDate = (NSDate *)v22;

    id v24 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    didHandleInitialReachabilityFuture = v19->_didHandleInitialReachabilityFuture;
    v19->_didHandleInitialReachabilityFuture = v24;

    id initialReachabilityTimerFactory = v19->_initialReachabilityTimerFactory;
    v19->_id initialReachabilityTimerFactory = &__block_literal_global_129593;

    id reachabilityChangeDebounceTimerFactory = v19->_reachabilityChangeDebounceTimerFactory;
    v19->_id reachabilityChangeDebounceTimerFactory = &__block_literal_global_15_129594;
  }
  return v19;
}

id __152__HMDCameraRecordingReachabilityEventManager_initWithAccessory_workQueue_identifier_bulletinBoard_logEventSubmitter_accountSettings_notificationCenter___block_invoke_2(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

id __152__HMDCameraRecordingReachabilityEventManager_initWithAccessory_workQueue_identifier_bulletinBoard_logEventSubmitter_accountSettings_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t68_129602 != -1) {
    dispatch_once(&logCategory__hmf_once_t68_129602, &__block_literal_global_120_129603);
  }
  v2 = (void *)logCategory__hmf_once_v69_129604;
  return v2;
}

uint64_t __57__HMDCameraRecordingReachabilityEventManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v69_129604;
  logCategory__hmf_once_v69_129604 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end