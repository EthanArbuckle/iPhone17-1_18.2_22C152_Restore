@interface HMDCameraBulletinNotificationManager
+ (id)_cameraAccessModeRegistrationsForSource:(id)a3 context:(id)a4;
+ (id)_cameraReachabilityRegistrationsForSource:(id)a3 context:(id)a4;
+ (id)_cameraSignificantEventRegistrationsForSource:(id)a3 context:(id)a4;
+ (id)logCategory;
- (BOOL)_filterPassesForCameraSignificantEvent:(id)a3 registration:(id)a4;
- (BOOL)_shouldNotifyForActivityForSignificantEvent:(id)a3 remoteRegistration:(id)a4;
- (BOOL)_shouldNotifyForDoorbellPressForSignificantEvent:(id)a3 registration:(id)a4;
- (BOOL)_updateLocalStoreWithCameraAccessModeBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6;
- (BOOL)_updateLocalStoreWithCameraReachabilityBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6;
- (BOOL)_updateLocalStoreWithCameraSignificantEventBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6;
- (BOOL)currentPrimary;
- (HMDAppleAccountManager)accountManager;
- (HMDBulletinNotificationRegistrationSource)source;
- (HMDCameraBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5 accountManager:(id)a6 faceClassificationResolver:(id)a7 doorbellPressTracker:(id)a8 evaluator:(id)a9 notificationCenter:(id)a10;
- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver;
- (HMDDoorbellPressTracker)doorbellPressTracker;
- (HMDHome)home;
- (HMDNotificationConditionEvaluator)evaluator;
- (HMFMessageDispatcher)messageDispatcher;
- (HMFTimer)synchronizeWithPrimaryDebounceTimer;
- (NSArray)cameraAccessModeRegistrations;
- (NSArray)cameraAccessModeRegistrationsForCurrentDevice;
- (NSArray)cameraReachabilityRegistrations;
- (NSArray)cameraReachabilityRegistrationsForCurrentDevice;
- (NSArray)cameraSignificantEventRegistrations;
- (NSArray)cameraSignificantEventRegistrationsForCurrentDevice;
- (NSMutableDictionary)observersByCameraIdentifier;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)messageTargetUUID;
- (OS_dispatch_queue)workQueue;
- (id)_cameraAccessModeBulletinNotificationRegistrationsForAccessory:(id)a3;
- (id)_cameraProfileWithUUID:(id)a3;
- (id)_cameraReachabilityBulletinNotificationRegistrationsForAccessory:(id)a3;
- (id)_cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier:(id)a3;
- (id)_currentHomeCameraAccessoryUUIDs;
- (id)_deviceToNotifyForRegistration:(id)a3 source:(id)a4;
- (id)_mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:(id)a3;
- (id)_mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:(id)a3;
- (id)_mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:(id)a3;
- (id)_recentDoorbellPressIntervalForSignificantEventDate:(id)a3;
- (id)cameraUserNotificationSettingsForAccessory:(id)a3;
- (id)conditionsFromPredicate:(id)a3;
- (id)devicesToNotifyForAccessModeChangeForAccessory:(id)a3;
- (id)devicesToNotifyForCameraReachabilityForAccessory:(id)a3;
- (id)logIdentifier;
- (id)synchronizeWithPrimaryDebounceTimerFactory;
- (os_unfair_lock_s)lock;
- (void)_handleCameraSignificantEventBulletinNotificationRegistration:(id)a3 removed:(BOOL)a4;
- (void)_handleCameraSignificantEventBulletinNotifyPrimaryResidentMessage:(id)a3;
- (void)_handleCameraSignificantEventNotificationMessage:(id)a3;
- (void)_handleCurrentDeviceOrAccountUpdatedNotification:(id)a3;
- (void)_handleDeviceBecameNotPrimary;
- (void)_handleDeviceBecamePrimary;
- (void)_handlePrimaryResidentUpdateNotification:(id)a3;
- (void)_handleSignificantEvent:(id)a3 cameraProfile:(id)a4;
- (void)_handleSignificantEvent:(id)a3 remoteRegistration:(id)a4;
- (void)_handleSignificantEventWithUUID:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassifications:(id)a7 cameraProfile:(id)a8;
- (void)_notifyDevice:(id)a3 aboutSignificantEvent:(id)a4 notificationReasons:(unint64_t)a5;
- (void)_notifyObserversOfSignificantEventUUID:(id)a3 cameraProfileUUID:(id)a4 notificationReasons:(unint64_t)a5;
- (void)_notifyPrimaryResidentOfSignificantEvent:(id)a3 withCameraProfileUUID:(id)a4;
- (void)_requestSynchronizeRegistrations;
- (void)_synchronizeLocalRegistrationsWithPrimaryResident;
- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4;
- (void)addCameraSignificantEventNotificationObserver:(id)a3 cameraIdentifier:(id)a4;
- (void)configureWithDeviceIsResidentCapable:(BOOL)a3;
- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3;
- (void)handlePrimaryResidentUpdateNotification:(id)a3;
- (void)handleRemovedCameraAccessory:(id)a3;
- (void)handleSignificantEvent:(id)a3 cameraProfile:(id)a4;
- (void)removeCameraSignificantEventNotificationObserver:(id)a3 cameraIdentifier:(id)a4;
- (void)setCurrentPrimary:(BOOL)a3;
- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3;
- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3;
- (void)timerDidFire:(id)a3;
- (void)updateNotificationRegistrationsWithSettings:(id)a3 accessory:(id)a4 doorbellPressNotificationEnabled:(BOOL)a5 completion:(id)a6;
@end

@implementation HMDCameraBulletinNotificationManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_synchronizeWithPrimaryDebounceTimerFactory, 0);
  objc_storeStrong((id *)&self->_synchronizeWithPrimaryDebounceTimer, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_doorbellPressTracker, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_faceClassificationResolver, 0);
  objc_storeStrong((id *)&self->_observersByCameraIdentifier, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_home);
  objc_storeStrong((id *)&self->_messageTargetUUID, 0);
}

- (void)setSynchronizeWithPrimaryDebounceTimerFactory:(id)a3
{
}

- (id)synchronizeWithPrimaryDebounceTimerFactory
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setSynchronizeWithPrimaryDebounceTimer:(id)a3
{
}

- (HMFTimer)synchronizeWithPrimaryDebounceTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCurrentPrimary:(BOOL)a3
{
  self->_currentPrimary = a3;
}

- (BOOL)currentPrimary
{
  return self->_currentPrimary;
}

- (HMDNotificationConditionEvaluator)evaluator
{
  return (HMDNotificationConditionEvaluator *)objc_getProperty(self, a2, 88, 1);
}

- (HMDDoorbellPressTracker)doorbellPressTracker
{
  return (HMDDoorbellPressTracker *)objc_getProperty(self, a2, 80, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (HMDAppleAccountManager)accountManager
{
  return (HMDAppleAccountManager *)objc_getProperty(self, a2, 64, 1);
}

- (HMDCameraSignificantEventFaceClassificationResolver)faceClassificationResolver
{
  return (HMDCameraSignificantEventFaceClassificationResolver *)objc_getProperty(self, a2, 56, 1);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (NSMutableDictionary)observersByCameraIdentifier
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (NSUUID)messageTargetUUID
{
  return self->_messageTargetUUID;
}

- (id)logIdentifier
{
  v2 = [(HMDCameraBulletinNotificationManager *)self home];
  v3 = [v2 uuid];
  v4 = [v3 UUIDString];

  return v4;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];

  if (v6 == v4)
  {
    v11 = [(HMDCameraBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
    [v11 suspend];

    [(HMDCameraBulletinNotificationManager *)self _synchronizeLocalRegistrationsWithPrimaryResident];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unrecognized timer, ignoring", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __88__HMDCameraBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __88__HMDCameraBulletinNotificationManager_handleCurrentDeviceOrAccountUpdatedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleCurrentDeviceOrAccountUpdatedNotification:*(void *)(a1 + 40)];
}

- (void)handlePrimaryResidentUpdateNotification:(id)a3
{
  id v4 = a3;
  v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__HMDCameraBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke;
  v7[3] = &unk_264A2F820;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __80__HMDCameraBulletinNotificationManager_handlePrimaryResidentUpdateNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePrimaryResidentUpdateNotification:*(void *)(a1 + 40)];
}

- (void)_handleCameraSignificantEventBulletinNotifyPrimaryResidentMessage:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDCameraBulletinNotificationManager *)self home];
  char v7 = [v6 isCurrentDeviceConfirmedPrimaryResident];

  if (v7)
  {
    id v8 = [v4 dictionaryForKey:@"HMDBulletinNotificationSignificantEventParamsKey"];
    id v37 = 0;
    v9 = +[HMDCameraSignificantEventBulletinParamsDictionaryTransformer reverseTransformedValue:v8 error:&v37];
    id v10 = v37;
    if (v9)
    {
      v11 = [v9 cameraProfileUUID];
      int v12 = [(HMDCameraBulletinNotificationManager *)self _cameraProfileWithUUID:v11];

      if (v12)
      {
        v36 = [v9 UUID];
        uint64_t v13 = [v9 reason];
        uint64_t v14 = [v9 dateOfOccurrence];
        uint64_t v15 = [v9 confidenceLevel];
        [v9 faceClassifications];
        v16 = v9;
        id v17 = v4;
        v18 = v8;
        v20 = id v19 = v10;
        [(HMDCameraBulletinNotificationManager *)self _handleSignificantEventWithUUID:v36 reason:v13 dateOfOccurrence:v14 confidenceLevel:v15 faceClassifications:v20 cameraProfile:v12];

        id v10 = v19;
        id v8 = v18;
        id v4 = v17;
        v9 = v16;

        [v4 respondWithSuccess];
      }
      else
      {
        v30 = (void *)MEMORY[0x230FBD990]();
        v31 = self;
        v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = HMFGetLogIdentifier();
          v34 = [v4 messagePayload];
          *(_DWORD *)buf = 138543618;
          v39 = v33;
          __int16 v40 = 2112;
          v41 = v34;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera profile in message payload: %@", buf, 0x16u);
        }
        v35 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
        [v4 respondWithError:v35];

        int v12 = 0;
      }
    }
    else
    {
      v25 = (void *)MEMORY[0x230FBD990]();
      v26 = self;
      v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = HMFGetLogIdentifier();
        v29 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2112;
        v41 = v29;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_ERROR, "%{public}@Could not find significant event in message payload: %@", buf, 0x16u);
      }
      int v12 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      [v4 respondWithError:v12];
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v22 = self;
    v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v39 = v24;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Received HMDCameraSignificantEventBulletinNotifyPrimaryMessage on non-primary device, ignoring", buf, 0xCu);
    }
  }
}

- (id)_cameraProfileWithUUID:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = [(HMDCameraBulletinNotificationManager *)self home];
  id v6 = [v5 cameraAccessories];

  uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v21)
  {
    uint64_t v7 = *(void *)v27;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v6);
        }
        v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v10 = objc_msgSend(v9, "cameraProfiles", v20);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * j);
              v16 = [v15 uniqueIdentifier];
              char v17 = [v16 isEqual:v4];

              if (v17)
              {
                id v18 = v15;

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
      }
      id v18 = 0;
      uint64_t v21 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v21);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)_handleCameraSignificantEventNotificationMessage:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 uuidForKey:@"HMDBulletinNotificationCameraSignificantEventUUIDMessageKey"];
  if (v6)
  {
    uint64_t v7 = [v4 uuidForKey:@"HMDBulletinNotificationCameraProfileUUIDMessageKey"];
    if (v7)
    {
      id v8 = [v4 remoteSourceDevice];
      if (v8)
      {
        v9 = [v4 numberForKey:@"HMDBulletinNotificationCameraSignificantEventModesMessageKey"];
        if (!v9)
        {
          id v10 = (void *)MEMORY[0x230FBD990]();
          uint64_t v11 = self;
          uint64_t v12 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = HMFGetLogIdentifier();
            uint64_t v14 = [v4 messagePayload];
            *(_DWORD *)buf = 138543618;
            id v37 = v13;
            __int16 v38 = 2112;
            id v39 = v14;
            _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Notification reasons missing from payload: %@, populating with hard-coded value", buf, 0x16u);
          }
          v9 = &unk_26E471128;
        }
        uint64_t v15 = [v9 unsignedIntegerValue];
        v16 = (void *)MEMORY[0x230FBD990]();
        char v17 = self;
        id v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = HMFGetLogIdentifier();
          NSPrintF();
          uint64_t v20 = v35 = v16;
          *(_DWORD *)buf = 138544386;
          id v37 = v19;
          __int16 v38 = 2112;
          id v39 = v6;
          __int16 v40 = 2112;
          v41 = v7;
          __int16 v42 = 2112;
          v43 = v20;
          __int16 v44 = 2112;
          v45 = v8;
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Received message for camera significant event with UUID: %@ cameraProfileUUID: %@ notificationReasons: %@ from device: %@", buf, 0x34u);

          v16 = v35;
        }

        [(HMDCameraBulletinNotificationManager *)v17 _notifyObserversOfSignificantEventUUID:v6 cameraProfileUUID:v7 notificationReasons:v15];
        [v4 respondWithSuccess];
      }
      else
      {
        v31 = (void *)MEMORY[0x230FBD990]();
        uint64_t v32 = self;
        v33 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v37 = v34;
          __int16 v38 = 2112;
          id v39 = v4;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Failed to get remote device for message: %@", buf, 0x16u);
        }
        v9 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
        [v4 respondWithError:v9];
      }
    }
    else
    {
      long long v26 = (void *)MEMORY[0x230FBD990]();
      long long v27 = self;
      long long v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        long long v29 = HMFGetLogIdentifier();
        v30 = [v4 messagePayload];
        *(_DWORD *)buf = 138543618;
        id v37 = v29;
        __int16 v38 = 2112;
        id v39 = v30;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera profile UUID in message payload: %@", buf, 0x16u);
      }
      id v8 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
      [v4 respondWithError:v8];
    }
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x230FBD990]();
    long long v22 = self;
    long long v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      long long v24 = HMFGetLogIdentifier();
      long long v25 = [v4 messagePayload];
      *(_DWORD *)buf = 138543618;
      id v37 = v24;
      __int16 v38 = 2112;
      id v39 = v25;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Could not find camera significant event UUID in message payload: %@", buf, 0x16u);
    }
    uint64_t v7 = [MEMORY[0x263F087E8] hmfErrorWithCode:3];
    [v4 respondWithError:v7];
  }
}

- (void)_notifyObserversOfSignificantEventUUID:(id)a3 cameraProfileUUID:(id)a4 notificationReasons:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  os_unfair_lock_lock_with_options();
  id v10 = [(HMDCameraBulletinNotificationManager *)self observersByCameraIdentifier];
  uint64_t v11 = [v10 objectForKeyedSubscript:v9];
  uint64_t v12 = [v11 allObjects];

  os_unfair_lock_unlock(&self->_lock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __117__HMDCameraBulletinNotificationManager__notifyObserversOfSignificantEventUUID_cameraProfileUUID_notificationReasons___block_invoke;
  v15[3] = &unk_264A1B0B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  unint64_t v18 = a5;
  id v13 = v9;
  id v14 = v8;
  objc_msgSend(v12, "na_each:", v15);
}

void __117__HMDCameraBulletinNotificationManager__notifyObserversOfSignificantEventUUID_cameraProfileUUID_notificationReasons___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 32);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = NSPrintF();
      *(_DWORD *)buf = 138544386;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2112;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Notifying observer: %@ about camera significant event with UUID: %@ cameraProfileUUID: %@ notificationReasons: %@", buf, 0x34u);
    }
    [v3 notificationManager:*(void *)(a1 + 32) didReceiveNotificationForCameraSignificantEventIdentifier:*(void *)(a1 + 40) notificationReasons:*(void *)(a1 + 56)];
  }
}

- (BOOL)_updateLocalStoreWithCameraAccessModeBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v10)
  {
    __int16 v13 = (void *)MEMORY[0x263EFF240];
    id v14 = +[MKFLocalBulletinCameraAccessModeRegistration entity];
    __int16 v15 = [v14 name];
    id v10 = [v13 insertNewObjectForEntityForName:v15 inManagedObjectContext:v11];

    uint64_t v16 = [v9 accessoryUUID];
    [v10 setAccessoryModelID:v16];

    goto LABEL_5;
  }
  if ([v10 enabled] != v7)
  {
LABEL_5:
    [v10 setEnabled:v7];
    BOOL v12 = 1;
    goto LABEL_6;
  }
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

- (BOOL)_updateLocalStoreWithCameraReachabilityBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v10)
  {
    __int16 v13 = (void *)MEMORY[0x263EFF240];
    id v14 = +[MKFLocalBulletinCameraReachabilityRegistration entity];
    __int16 v15 = [v14 name];
    id v10 = [v13 insertNewObjectForEntityForName:v15 inManagedObjectContext:v11];

    uint64_t v16 = [v9 accessoryUUID];
    [v10 setAccessoryModelID:v16];

    goto LABEL_5;
  }
  if ([v10 enabled] != v7)
  {
LABEL_5:
    [v10 setEnabled:v7];
    BOOL v12 = 1;
    goto LABEL_6;
  }
  BOOL v12 = 0;
LABEL_6:

  return v12;
}

- (BOOL)_updateLocalStoreWithCameraSignificantEventBulletinRegistration:(id)a3 existingMKFLocalRegistration:(id)a4 enabled:(BOOL)a5 moc:(id)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (!v10)
  {
    uint64_t v16 = (void *)MEMORY[0x263EFF240];
    __int16 v17 = +[MKFLocalBulletinCameraSignificantEventRegistration entity];
    uint64_t v18 = [v17 name];
    id v10 = [v16 insertNewObjectForEntityForName:v18 inManagedObjectContext:v11];

    __int16 v19 = [v9 cameraIdentifier];
    [v10 setAccessoryModelID:v19];

    [v10 setEnabled:v7];
    objc_msgSend(v10, "setNotificationModes:", objc_msgSend(v9, "notificationModes"));
    objc_msgSend(v10, "setSignificantEventTypes:", objc_msgSend(v9, "significantEventTypes"));
LABEL_11:
    objc_msgSend(v10, "setPersonFamiliarityOptions:", objc_msgSend(v9, "personFamiliarityOptions"));
    LOBYTE(v12) = 1;
    goto LABEL_12;
  }
  int v12 = [v10 enabled] ^ v7;
  if (v12 == 1) {
    [v10 setEnabled:v7];
  }
  uint64_t v13 = [v10 notificationModes];
  if (v13 != [v9 notificationModes])
  {
    objc_msgSend(v10, "setNotificationModes:", objc_msgSend(v9, "notificationModes"));
    LOBYTE(v12) = 1;
  }
  uint64_t v14 = [v10 significantEventTypes];
  if (v14 != [v9 significantEventTypes])
  {
    objc_msgSend(v10, "setSignificantEventTypes:", objc_msgSend(v9, "significantEventTypes"));
    LOBYTE(v12) = 1;
  }
  uint64_t v15 = [v10 personFamiliarityOptions];
  if (v15 != [v9 personFamiliarityOptions]) {
    goto LABEL_11;
  }
LABEL_12:
  uint64_t v20 = [v10 conditions];
  uint64_t v21 = [MEMORY[0x263EFFA08] set];
  if (v20)
  {
    uint64_t v22 = +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:v20];

    uint64_t v21 = (void *)v22;
  }
  long long v23 = [v9 conditions];
  char v24 = [v21 isEqualToSet:v23];

  if ((v24 & 1) == 0)
  {
    if (v20) {
      [v10 removeConditions:v20];
    }
    long long v25 = [v9 conditions];
    id v26 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v10 moc:v11 conditions:v25];

    LOBYTE(v12) = 1;
  }

  return v12;
}

- (id)_mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraBulletinNotificationManager *)self _currentHomeCameraAccessoryUUIDs];
  id v6 = +[MKFLocalBulletinCameraAccessModeRegistration fetchRequest];
  id v17 = 0;
  BOOL v7 = [v4 executeFetchRequest:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __103__HMDCameraBulletinNotificationManager__mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_264A1B090;
    id v16 = v5;
    id v9 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera access mode registrations, error: %@", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __103__HMDCameraBulletinNotificationManager__mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraBulletinNotificationManager *)self _currentHomeCameraAccessoryUUIDs];
  id v6 = +[MKFLocalBulletinCameraReachabilityRegistration fetchRequest];
  id v17 = 0;
  BOOL v7 = [v4 executeFetchRequest:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __105__HMDCameraBulletinNotificationManager__mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_264A1B068;
    id v16 = v5;
    id v9 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera reachability registrations, error: %@", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __105__HMDCameraBulletinNotificationManager__mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraBulletinNotificationManager *)self _currentHomeCameraAccessoryUUIDs];
  id v6 = +[MKFLocalBulletinCameraSignificantEventRegistration fetchRequest];
  id v17 = 0;
  BOOL v7 = [v4 executeFetchRequest:v6 error:&v17];
  id v8 = v17;
  if (v7)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __109__HMDCameraBulletinNotificationManager__mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext___block_invoke;
    v15[3] = &unk_264A1B040;
    id v16 = v5;
    id v9 = objc_msgSend(v7, "na_filter:", v15);
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = self;
    int v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      __int16 v19 = v13;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch local camera significant event registrations, error: %@", buf, 0x16u);
    }
    id v9 = (void *)MEMORY[0x263EFFA68];
  }

  return v9;
}

uint64_t __109__HMDCameraBulletinNotificationManager__mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 accessoryModelID];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (id)_currentHomeCameraAccessoryUUIDs
{
  v2 = [(HMDCameraBulletinNotificationManager *)self home];
  id v3 = [v2 cameraAccessories];
  uint64_t v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_139);

  id v5 = [MEMORY[0x263EFFA08] setWithArray:v4];

  return v5;
}

uint64_t __72__HMDCameraBulletinNotificationManager__currentHomeCameraAccessoryUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uuid];
}

- (void)_updateRegistrationsOnPrimaryWithEnabledRegistrations:(id)a3 disabledRegistrations:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)MEMORY[0x230FBD990]();
  id v10 = self;
  id v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543874;
    long long v29 = v12;
    __int16 v30 = 2112;
    id v31 = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating registrations on primary resident, [enabled : %@], [disabled : %@]", buf, 0x20u);
  }
  uint64_t v13 = [(HMDCameraBulletinNotificationManager *)v10 home];
  if ([v13 bulletinNotificationsSupported])
  {
    uint64_t v14 = [(HMDCameraBulletinNotificationManager *)v10 source];
    uint64_t v15 = v14;
    if (v14)
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __116__HMDCameraBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke;
      v24[3] = &unk_264A28C88;
      v24[4] = v10;
      id v25 = v14;
      id v26 = v6;
      id v27 = v7;
      [v13 updateBulletinRegistrationOnPrimaryResidentWithSource:v25 enableRegistrations:v26 disableRegistration:v27 completionHandler:v24];
    }
    else
    {
      __int16 v20 = (void *)MEMORY[0x230FBD990]();
      id v21 = v10;
      uint64_t v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        long long v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        long long v29 = v23;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when updating notification registrations", buf, 0xCu);
      }
    }
  }
  else
  {
    id v16 = (void *)MEMORY[0x230FBD990]();
    id v17 = v10;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v29 = v19;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Bulletin notifications are not supported, only modifying local registrations", buf, 0xCu);
    }
  }
}

void __116__HMDCameraBulletinNotificationManager__updateRegistrationsOnPrimaryWithEnabledRegistrations_disabledRegistrations___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      uint64_t v11 = *(void *)(a1 + 56);
      int v19 = 138544386;
      __int16 v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      uint64_t v24 = v10;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      __int16 v27 = 2112;
      id v28 = v3;
      int v12 = "%{public}@Unable to update camera registrations on primary resident: source: %@, [enabled : %@], [disabled : %@], error: %@";
      uint64_t v13 = v7;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 52;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v13, v14, v12, (uint8_t *)&v19, v15);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    int v19 = 138544130;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    uint64_t v22 = v16;
    __int16 v23 = 2112;
    uint64_t v24 = v17;
    __int16 v25 = 2112;
    uint64_t v26 = v18;
    int v12 = "%{public}@Updating camera registrations with primary resident was successful, source: %@, [enabled: %@], [disabled: %@]";
    uint64_t v13 = v7;
    os_log_type_t v14 = OS_LOG_TYPE_INFO;
    uint32_t v15 = 42;
    goto LABEL_6;
  }
}

- (void)_handleCurrentDeviceOrAccountUpdatedNotification:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling current device or account updated notification", (uint8_t *)&v10, 0xCu);
  }
  [(HMDCameraBulletinNotificationManager *)v7 _requestSynchronizeRegistrations];
}

- (void)_handlePrimaryResidentUpdateNotification:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v17 = 138543362;
    uint64_t v18 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Handling primary resident update notification", (uint8_t *)&v17, 0xCu);
  }
  [(HMDCameraBulletinNotificationManager *)v7 _requestSynchronizeRegistrations];
  int v10 = [(HMDCameraBulletinNotificationManager *)v7 home];
  int v11 = [v10 isCurrentDeviceConfirmedPrimaryResident];

  BOOL v12 = [(HMDCameraBulletinNotificationManager *)v7 currentPrimary];
  if (v11)
  {
    if (v12)
    {
      uint64_t v13 = (void *)MEMORY[0x230FBD990]();
      os_log_type_t v14 = v7;
      uint32_t v15 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = HMFGetLogIdentifier();
        int v17 = 138543362;
        uint64_t v18 = v16;
        _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@We are already the primary", (uint8_t *)&v17, 0xCu);
      }
    }
    else
    {
      [(HMDCameraBulletinNotificationManager *)v7 _handleDeviceBecamePrimary];
    }
  }
  else if (v12)
  {
    [(HMDCameraBulletinNotificationManager *)v7 _handleDeviceBecameNotPrimary];
  }
}

- (void)_synchronizeLocalRegistrationsWithPrimaryResident
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = HMFGetLogIdentifier();
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Synchronizing local registrations with primary resident", (uint8_t *)&buf, 0xCu);
  }
  id v8 = [(HMDCameraBulletinNotificationManager *)v5 source];
  if (v8)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v106 = 0x3032000000;
    v107 = __Block_byref_object_copy__55678;
    v108 = __Block_byref_object_dispose__55679;
    id v109 = [MEMORY[0x263EFF9C0] set];
    uint64_t v93 = 0;
    v94 = &v93;
    uint64_t v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__55678;
    v97 = __Block_byref_object_dispose__55679;
    id v98 = [MEMORY[0x263EFF9C0] set];
    uint64_t v87 = 0;
    v88 = &v87;
    uint64_t v89 = 0x3032000000;
    v90 = __Block_byref_object_copy__55678;
    v91 = __Block_byref_object_dispose__55679;
    id v92 = [MEMORY[0x263EFF9C0] set];
    uint64_t v9 = [(HMDCameraBulletinNotificationManager *)v5 home];
    int v10 = [v9 backingStore];
    int v11 = [v10 context];

    v81[0] = MEMORY[0x263EF8330];
    v81[1] = 3221225472;
    v81[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke;
    v81[3] = &unk_264A1AE88;
    v81[4] = v5;
    id v82 = v8;
    id v12 = v11;
    id v83 = v12;
    p_long long buf = &buf;
    v85 = &v93;
    v86 = &v87;
    [v12 unsafeSynchronousBlock:v81];
    uint64_t v75 = 0;
    v76 = &v75;
    uint64_t v77 = 0x3032000000;
    v78 = __Block_byref_object_copy__55678;
    v79 = __Block_byref_object_dispose__55679;
    id v80 = [MEMORY[0x263EFF9C0] set];
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__55678;
    v73 = __Block_byref_object_dispose__55679;
    id v74 = [MEMORY[0x263EFF9C0] set];
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__55678;
    v67 = __Block_byref_object_dispose__55679;
    id v68 = [MEMORY[0x263EFF9C0] set];
    uint64_t v13 = [v12 managedObjectContext];
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5;
    v58[3] = &unk_264A1AF28;
    v58[4] = v5;
    id v14 = v13;
    id v59 = v14;
    v60 = &v75;
    v61 = &v69;
    v62 = &v63;
    uint32_t v15 = (void *)MEMORY[0x230FBD990]([v14 performBlockAndWait:v58]);
    uint64_t v16 = v5;
    HMFGetOSLogHandle();
    int v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      uint64_t v19 = v76[5];
      uint64_t v20 = *(void *)(*((void *)&buf + 1) + 40);
      *(_DWORD *)v99 = 138543874;
      v100 = v18;
      __int16 v101 = 2112;
      uint64_t v102 = v19;
      __int16 v103 = 2112;
      uint64_t v104 = v20;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalSignificantEventRegistrations: %@ remoteSignificantEventRegistrations: %@", v99, 0x20u);
    }
    __int16 v21 = (void *)MEMORY[0x230FBD990]();
    uint64_t v22 = v16;
    HMFGetOSLogHandle();
    __int16 v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v24 = HMFGetLogIdentifier();
      uint64_t v25 = v70[5];
      uint64_t v26 = v94[5];
      *(_DWORD *)v99 = 138543874;
      v100 = v24;
      __int16 v101 = 2112;
      uint64_t v102 = v25;
      __int16 v103 = 2112;
      uint64_t v104 = v26;
      _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalReachabilityRegistrations: %@ remoteReachabilityRegistrations: %@", v99, 0x20u);
    }
    __int16 v27 = (void *)MEMORY[0x230FBD990]();
    id v28 = v22;
    HMFGetOSLogHandle();
    uint64_t v29 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      __int16 v30 = HMFGetLogIdentifier();
      uint64_t v31 = v64[5];
      uint64_t v32 = v88[5];
      *(_DWORD *)v99 = 138543874;
      v100 = v30;
      __int16 v101 = 2112;
      uint64_t v102 = v31;
      __int16 v103 = 2112;
      uint64_t v104 = v32;
      _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@enabledLocalAccessModeRegistrations: %@ remoteAccessModeRegistrations: %@", v99, 0x20u);
    }
    id v33 = [MEMORY[0x263EFF9C0] set];
    uint64_t v34 = [MEMORY[0x263EFF9C0] set];
    v35 = (void *)v76[5];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_124;
    v55[3] = &unk_264A1AF78;
    v57 = &buf;
    id v36 = v33;
    id v56 = v36;
    objc_msgSend(v35, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v55);
    [v34 unionSet:*(void *)(*((void *)&buf + 1) + 40)];
    id v37 = (void *)v70[5];
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3_128;
    v52[3] = &unk_264A1AFC8;
    v54 = &v93;
    id v38 = v36;
    id v53 = v38;
    objc_msgSend(v37, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v52);
    [v34 unionSet:v94[5]];
    id v39 = (void *)v64[5];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5_132;
    v49[3] = &unk_264A1B018;
    v51 = &v87;
    id v40 = v38;
    id v50 = v40;
    objc_msgSend(v39, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v49);
    [v34 unionSet:v88[5]];
    if (objc_msgSend(v40, "hmf_isEmpty") && objc_msgSend(v34, "hmf_isEmpty"))
    {
      v41 = (void *)MEMORY[0x230FBD990]();
      __int16 v42 = v28;
      HMFGetOSLogHandle();
      v43 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        __int16 v44 = HMFGetLogIdentifier();
        *(_DWORD *)v99 = 138543362;
        v100 = v44;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@No changes detected to sync with primary", v99, 0xCu);
      }
    }
    else
    {
      [(HMDCameraBulletinNotificationManager *)v28 _updateRegistrationsOnPrimaryWithEnabledRegistrations:v40 disabledRegistrations:v34];
    }

    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v69, 8);

    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v87, 8);

    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v45 = (void *)MEMORY[0x230FBD990]();
    uint64_t v46 = v5;
    v47 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = HMFGetLogIdentifier();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v48;
      _os_log_impl(&dword_22F52A000, v47, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve bulletin notification registration source for current device when synchronizing registrations with primary", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke(uint64_t a1)
{
  v2 = objc_opt_class();
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) managedObjectContext];
  id v5 = [v2 _cameraSignificantEventRegistrationsForSource:v3 context:v4];

  id v6 = objc_opt_class();
  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v9 = [v6 _cameraReachabilityRegistrationsForSource:v7 context:v8];

  int v10 = objc_opt_class();
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v13 = [v10 _cameraAccessModeRegistrationsForSource:v11 context:v12];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2;
  v16[3] = &unk_264A1AE10;
  v16[4] = *(void *)(a1 + 56);
  objc_msgSend(v5, "na_each:", v16);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3;
  v15[3] = &unk_264A1AE38;
  void v15[4] = *(void *)(a1 + 64);
  objc_msgSend(v9, "na_each:", v15);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4;
  v14[3] = &unk_264A1AE60;
  v14[4] = *(void *)(a1 + 72);
  objc_msgSend(v13, "na_each:", v14);
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) _mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) _mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6;
  v7[3] = &unk_264A1AEB0;
  v7[4] = *(void *)(a1 + 48);
  objc_msgSend(v2, "na_each:", v7);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_7;
  v6[3] = &unk_264A1AED8;
  v6[4] = *(void *)(a1 + 56);
  objc_msgSend(v3, "na_each:", v6);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_8;
  v5[3] = &unk_264A1AF00;
  v5[4] = *(void *)(a1 + 64);
  objc_msgSend(v4, "na_each:", v5);
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_124(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_125;
  v7[3] = &unk_264A1AF50;
  id v5 = v3;
  id v8 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  if (v6)
  {
    if (([v5 isEqual:v6] & 1) == 0) {
      [*(id *)(a1 + 32) addObject:v5];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v6];
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3_128(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4_129;
  v7[3] = &unk_264A1AFA0;
  id v5 = v3;
  id v8 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v6];
  }
  else {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_5_132(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6_133;
  v7[3] = &unk_264A1AFF0;
  id v5 = v3;
  id v8 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v7);
  if (v6) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v6];
  }
  else {
    [*(id *)(a1 + 32) addObject:v5];
  }
}

uint64_t __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6_133(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryUUID];
  id v4 = [*(id *)(a1 + 32) accessoryUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4_129(uint64_t a1, void *a2)
{
  id v3 = [a2 accessoryUUID];
  id v4 = [*(id *)(a1 + 32) accessoryUUID];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

uint64_t __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2_125(uint64_t a1, void *a2)
{
  id v3 = [a2 cameraIdentifier];
  id v4 = [*(id *)(a1 + 32) cameraIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_6(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 enabled])
  {
    id v3 = +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromLocalRegistration:v4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_7(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 enabled])
  {
    id v3 = +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromLocalRegistration:v4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 enabled])
  {
    id v3 = +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromLocalRegistration:v4];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v5 = +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromMKFRegistration:a2];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [v5 registration];
  [v3 addObject:v4];
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v5 = +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromMKFRegistration:a2];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [v5 registration];
  [v3 addObject:v4];
}

void __89__HMDCameraBulletinNotificationManager__synchronizeLocalRegistrationsWithPrimaryResident__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v5 = +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromMKFRegistration:a2];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [v5 registration];
  [v3 addObject:v4];
}

- (void)_requestSynchronizeRegistrations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    uint64_t v7 = [(HMDCameraBulletinNotificationManager *)v4 synchronizeWithPrimaryDebounceTimer];
    [v7 isRunning];
    id v8 = HMFBooleanToString();
    int v10 = 138543618;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v8;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Requesting synchronize registrations, debounce timer running: %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = [(HMDCameraBulletinNotificationManager *)v4 synchronizeWithPrimaryDebounceTimer];
  [v9 resume];
}

- (id)_recentDoorbellPressIntervalForSignificantEventDate:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF910];
  id v4 = a3;
  id v5 = [v3 dateWithTimeInterval:v4 sinceDate:-60.0];
  id v6 = [MEMORY[0x263EFF910] dateWithTimeInterval:v4 sinceDate:60.0];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08798]) initWithStartDate:v5 endDate:v6];
  return v7;
}

- (void)_handleDeviceBecameNotPrimary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became non-primary resident", buf, 0xCu);
  }
  [(HMDCameraBulletinNotificationManager *)v5 setCurrentPrimary:0];
  id v8 = [(HMDCameraBulletinNotificationManager *)v5 cameraSignificantEventRegistrations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __69__HMDCameraBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke;
  v9[3] = &unk_264A1ADE8;
  v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);
}

uint64_t __69__HMDCameraBulletinNotificationManager__handleDeviceBecameNotPrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleCameraSignificantEventBulletinNotificationRegistration:a2 removed:1];
}

- (void)_handleDeviceBecamePrimary
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Handling device became primary resident", buf, 0xCu);
  }
  [(HMDCameraBulletinNotificationManager *)v5 setCurrentPrimary:1];
  id v8 = [(HMDCameraBulletinNotificationManager *)v5 cameraSignificantEventRegistrations];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__HMDCameraBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke;
  v9[3] = &unk_264A1ADE8;
  v9[4] = v5;
  objc_msgSend(v8, "na_each:", v9);
}

uint64_t __66__HMDCameraBulletinNotificationManager__handleDeviceBecamePrimary__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleCameraSignificantEventBulletinNotificationRegistration:a2 removed:0];
}

- (void)_handleCameraSignificantEventBulletinNotificationRegistration:(id)a3 removed:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = self;
  uint64_t v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = HMFGetLogIdentifier();
    uint64_t v11 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    __int16 v27 = v10;
    __int16 v28 = 2112;
    id v29 = v6;
    __int16 v30 = 2112;
    uint64_t v31 = v11;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling Camera Significant Event Bulletin Notification Registration: %@, removed: %@", buf, 0x20u);
  }
  uint64_t v12 = [v6 registration];
  uint64_t v13 = [(HMDCameraBulletinNotificationManager *)v8 home];
  uint64_t v14 = [v13 cameraAccessories];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __110__HMDCameraBulletinNotificationManager__handleCameraSignificantEventBulletinNotificationRegistration_removed___block_invoke;
  v24[3] = &unk_264A28A10;
  id v15 = v12;
  id v25 = v15;
  uint64_t v16 = objc_msgSend(v14, "na_firstObjectPassingTest:", v24);

  if (v16)
  {
    int v17 = [v16 findCharacteristicType:*MEMORY[0x263F0C208] forServiceType:*MEMORY[0x263F0D6C0]];
    if (v17)
    {
      if (!a4 && ([v15 notificationModes] & 2) != 0)
      {
        if (([v15 notificationModes] & 2) == 0) {
          goto LABEL_9;
        }
        uint64_t v18 = [(HMDCameraBulletinNotificationManager *)v8 doorbellPressTracker];
        [v18 startTrackingPressesForDoorbellAccessory:v16 registration:v15];
      }
      else
      {
        uint64_t v18 = [(HMDCameraBulletinNotificationManager *)v8 doorbellPressTracker];
        [v18 stopTrackingPressesForDoorbellAccessory:v16 registration:v15];
      }
    }
LABEL_9:

    goto LABEL_13;
  }
  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  uint64_t v20 = v8;
  __int16 v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    uint64_t v22 = HMFGetLogIdentifier();
    __int16 v23 = [v15 cameraIdentifier];
    *(_DWORD *)long long buf = 138543618;
    __int16 v27 = v22;
    __int16 v28 = 2112;
    id v29 = v23;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to find HAP Accessory with UUID: %@", buf, 0x16u);
  }
LABEL_13:
}

uint64_t __110__HMDCameraBulletinNotificationManager__handleCameraSignificantEventBulletinNotificationRegistration_removed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [*(id *)(a1 + 32) cameraIdentifier];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)_notifyDevice:(id)a3 aboutSignificantEvent:(id)a4 notificationReasons:(unint64_t)a5
{
  v31[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v30[0] = @"HMDBulletinNotificationCameraSignificantEventUUIDMessageKey";
  int v10 = [v9 uniqueIdentifier];
  uint64_t v11 = [v10 UUIDString];
  v31[0] = v11;
  v30[1] = @"HMDBulletinNotificationCameraProfileUUIDMessageKey";
  uint64_t v12 = [v9 cameraProfileUUID];
  uint64_t v13 = [v12 UUIDString];
  v31[1] = v13;
  v30[2] = @"HMDBulletinNotificationCameraSignificantEventModesMessageKey";
  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a5];
  v31[2] = v14;
  id v15 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

  uint64_t v16 = [HMDRemoteDeviceMessageDestination alloc];
  int v17 = [(HMDCameraBulletinNotificationManager *)self messageTargetUUID];
  uint64_t v18 = [(HMDRemoteDeviceMessageDestination *)v16 initWithTarget:v17 device:v8];

  uint64_t v19 = [[HMDRemoteMessage alloc] initWithName:@"HMDBulletinNotificationCameraSignificantEventMessage" destination:v18 payload:v15 type:3 timeout:1 secure:60.0];
  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  id v25 = __96__HMDCameraBulletinNotificationManager__notifyDevice_aboutSignificantEvent_notificationReasons___block_invoke;
  uint64_t v26 = &unk_264A2AEE8;
  __int16 v27 = self;
  id v28 = v8;
  id v29 = v9;
  id v20 = v9;
  id v21 = v8;
  [(HMDRemoteMessage *)v19 setResponseHandler:&v23];
  uint64_t v22 = [(HMDCameraBulletinNotificationManager *)self messageDispatcher];
  [v22 sendMessage:v19];
}

void __96__HMDCameraBulletinNotificationManager__notifyDevice_aboutSignificantEvent_notificationReasons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      int v20 = 138544130;
      id v21 = v11;
      __int16 v22 = 2112;
      uint64_t v23 = v12;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      id v27 = v5;
      uint64_t v14 = "%{public}@Failed to notify device: %@ of significant event: %@ error: %@";
      id v15 = v10;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      uint32_t v17 = 42;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v15, v16, v14, (uint8_t *)&v20, v17);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    uint64_t v18 = *(void *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 48);
    int v20 = 138543874;
    id v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v18;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    uint64_t v14 = "%{public}@Successfully notified device: %@ of significant event: %@";
    id v15 = v10;
    os_log_type_t v16 = OS_LOG_TYPE_INFO;
    uint32_t v17 = 32;
    goto LABEL_6;
  }
}

- (void)_handleSignificantEvent:(id)a3 remoteRegistration:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [v7 source];
  int v10 = [v9 device];

  uint64_t v11 = (void *)MEMORY[0x230FBD990]();
  uint64_t v12 = self;
  uint64_t v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = HMFGetLogIdentifier();
    id v15 = [v6 uniqueIdentifier];
    *(_DWORD *)long long buf = 138543874;
    v35 = v14;
    __int16 v36 = 2114;
    id v37 = v15;
    __int16 v38 = 2112;
    id v39 = v7;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Checking if significant event %{public}@ matches registration: %@", buf, 0x20u);
  }
  os_log_type_t v16 = [v7 registration];
  BOOL v17 = [(HMDCameraBulletinNotificationManager *)v12 _shouldNotifyForDoorbellPressForSignificantEvent:v6 registration:v16];
  BOOL v18 = [(HMDCameraBulletinNotificationManager *)v12 _shouldNotifyForActivityForSignificantEvent:v6 remoteRegistration:v7];
  if (v17 || v18)
  {
    uint64_t v19 = 2;
    if (!v17) {
      uint64_t v19 = 0;
    }
    uint64_t v20 = v19 | v18;
    int v21 = [v10 isCurrentDevice];
    __int16 v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v12;
    __int16 v24 = HMFGetOSLogHandle();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v21)
    {
      if (v25)
      {
        HMFGetLogIdentifier();
        __int16 v26 = v33 = v22;
        id v27 = [v6 uniqueIdentifier];
        uint64_t v28 = NSPrintF();
        *(_DWORD *)long long buf = 138543874;
        v35 = v26;
        __int16 v36 = 2114;
        id v37 = v27;
        __int16 v38 = 2112;
        id v39 = v28;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Notifying current device of significant event: %{public}@ notification reasons: %@", buf, 0x20u);

        __int16 v22 = v33;
      }

      id v29 = [v6 uniqueIdentifier];
      __int16 v30 = [v6 cameraProfileUUID];
      [(HMDCameraBulletinNotificationManager *)v23 _notifyObserversOfSignificantEventUUID:v29 cameraProfileUUID:v30 notificationReasons:v20];
    }
    else
    {
      if (v25)
      {
        uint64_t v31 = HMFGetLogIdentifier();
        uint64_t v32 = NSPrintF();
        *(_DWORD *)long long buf = 138544130;
        v35 = v31;
        __int16 v36 = 2112;
        id v37 = v6;
        __int16 v38 = 2112;
        id v39 = v32;
        __int16 v40 = 2112;
        v41 = v10;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Sending notification for significant event: %@ notification reasons: %@ to remote device: %@", buf, 0x2Au);
      }
      [(HMDCameraBulletinNotificationManager *)v23 _notifyDevice:v10 aboutSignificantEvent:v6 notificationReasons:v20];
    }
  }
}

- (BOOL)_shouldNotifyForActivityForSignificantEvent:(id)a3 remoteRegistration:(id)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 registration];
  id v9 = [v7 source];
  if ([v8 notificationModes])
  {
    if ([(HMDCameraBulletinNotificationManager *)self _filterPassesForCameraSignificantEvent:v6 registration:v8])
    {
      int v10 = [(HMDCameraBulletinNotificationManager *)self home];
      uint64_t v11 = [v9 userUUID];
      uint64_t v12 = [v10 userWithUUID:v11];

      if (v12)
      {
        uint64_t v13 = [(HMDCameraBulletinNotificationManager *)self evaluator];
        uint64_t v14 = [v8 conditions];
        char v15 = [v13 conditionsPass:v14 registrationUser:v12];

        if (v15)
        {
          BOOL v16 = 1;
LABEL_16:

          goto LABEL_17;
        }
        __int16 v22 = (void *)MEMORY[0x230FBD990]();
        __int16 v26 = self;
        __int16 v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          BOOL v25 = HMFGetLogIdentifier();
          id v27 = [v6 uniqueIdentifier];
          int v29 = 138543618;
          __int16 v30 = v25;
          __int16 v31 = 2114;
          uint64_t v32 = v27;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Condition(s) did not pass for significant event: %{public}@", (uint8_t *)&v29, 0x16u);

          goto LABEL_14;
        }
      }
      else
      {
        __int16 v22 = (void *)MEMORY[0x230FBD990]();
        uint64_t v23 = self;
        __int16 v24 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          BOOL v25 = HMFGetLogIdentifier();
          int v29 = 138543874;
          __int16 v30 = v25;
          __int16 v31 = 2112;
          uint64_t v32 = v8;
          __int16 v33 = 2112;
          uint64_t v34 = v9;
          _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to evaluate registration: %@, no matching user for source: %@", (uint8_t *)&v29, 0x20u);
LABEL_14:
        }
      }

      BOOL v16 = 0;
      goto LABEL_16;
    }
    BOOL v17 = (void *)MEMORY[0x230FBD990]();
    BOOL v18 = self;
    uint64_t v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = HMFGetLogIdentifier();
      int v21 = [v6 uniqueIdentifier];
      int v29 = 138543618;
      __int16 v30 = v20;
      __int16 v31 = 2114;
      uint64_t v32 = v21;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Filter did not pass for significant event: %{public}@", (uint8_t *)&v29, 0x16u);
    }
  }
  BOOL v16 = 0;
LABEL_17:

  return v16;
}

- (BOOL)_shouldNotifyForDoorbellPressForSignificantEvent:(id)a3 registration:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (([v7 notificationModes] & 2) != 0)
  {
    id v9 = [(HMDCameraBulletinNotificationManager *)self home];
    int v10 = [v9 cameraAccessories];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __102__HMDCameraBulletinNotificationManager__shouldNotifyForDoorbellPressForSignificantEvent_registration___block_invoke;
    v23[3] = &unk_264A28A10;
    id v11 = v6;
    id v24 = v11;
    uint64_t v12 = objc_msgSend(v10, "na_firstObjectPassingTest:", v23);

    uint64_t v13 = [v11 dateOfOccurrence];
    uint64_t v14 = [(HMDCameraBulletinNotificationManager *)self _recentDoorbellPressIntervalForSignificantEventDate:v13];

    char v15 = [(HMDCameraBulletinNotificationManager *)self doorbellPressTracker];
    char v8 = [v15 doorbellPressInDateInterval:v14 doorbellAccessory:v12];

    BOOL v16 = (void *)MEMORY[0x230FBD990]();
    BOOL v17 = self;
    BOOL v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = HMFGetLogIdentifier();
      HMFBooleanToString();
      uint64_t v20 = v22 = v12;
      *(_DWORD *)long long buf = 138543874;
      __int16 v26 = v19;
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = v20;
      _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Doorbell press near significant event: %@, %@", buf, 0x20u);

      uint64_t v12 = v22;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

uint64_t __102__HMDCameraBulletinNotificationManager__shouldNotifyForDoorbellPressForSignificantEvent_registration___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 cameraProfiles];
  id v4 = objc_msgSend(v3, "na_map:", &__block_literal_global_114);

  id v5 = [*(id *)(a1 + 32) cameraProfileUUID];
  uint64_t v6 = [v4 containsObject:v5];

  return v6;
}

uint64_t __102__HMDCameraBulletinNotificationManager__shouldNotifyForDoorbellPressForSignificantEvent_registration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (void)_notifyPrimaryResidentOfSignificantEvent:(id)a3 withCameraProfileUUID:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = [[HMDCameraSignificantEventBulletinParams alloc] initWithSignificantEvent:v6 cameraProfileUUID:v7];
  id v30 = 0;
  int v10 = +[HMDCameraSignificantEventBulletinParamsDictionaryTransformer transformedValue:v9 error:&v30];
  id v11 = v30;
  uint64_t v12 = (void *)MEMORY[0x230FBD990]();
  uint64_t v13 = self;
  uint64_t v14 = HMFGetOSLogHandle();
  char v15 = v14;
  if (v10)
  {
    id v27 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v16 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v34 = v16;
      __int16 v35 = 2112;
      id v36 = v6;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying primary resident of significant event: %@", buf, 0x16u);
    }
    uint64_t v31 = @"HMDBulletinNotificationSignificantEventParamsKey";
    uint64_t v32 = v10;
    BOOL v17 = [NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    BOOL v18 = [(HMDCameraBulletinNotificationManager *)v13 home];
    uint64_t v19 = [v18 primaryResident];

    uint64_t v20 = [HMDRemoteDeviceMessageDestination alloc];
    int v21 = [(HMDCameraBulletinNotificationManager *)v13 messageTargetUUID];
    __int16 v22 = [v19 device];
    uint64_t v23 = [(HMDRemoteDeviceMessageDestination *)v20 initWithTarget:v21 device:v22];

    id v24 = [[HMDRemoteMessage alloc] initWithName:@"HMDBulletinNotificationNotifyPrimaryResidentOfCameraSignificantEventMessage" destination:v23 payload:v17 type:3 timeout:1 secure:60.0];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __103__HMDCameraBulletinNotificationManager__notifyPrimaryResidentOfSignificantEvent_withCameraProfileUUID___block_invoke;
    v28[3] = &unk_264A2D870;
    v28[4] = v13;
    id v29 = v6;
    [(HMDRemoteMessage *)v24 setResponseHandler:v28];
    BOOL v25 = [(HMDCameraBulletinNotificationManager *)v13 messageDispatcher];
    [v25 sendMessage:v24];

    id v11 = v27;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v26 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      uint64_t v34 = v26;
      __int16 v35 = 2112;
      id v36 = v11;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unable to transform significant event payload: %@", buf, 0x16u);
    }
  }
}

void __103__HMDCameraBulletinNotificationManager__notifyPrimaryResidentOfSignificantEvent_withCameraProfileUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  int v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v11 = HMFGetLogIdentifier();
      uint64_t v12 = *(void *)(a1 + 40);
      int v18 = 138543874;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      __int16 v22 = 2112;
      id v23 = v5;
      uint64_t v13 = "%{public}@Failed to notify primary resident of significant event: %@ error: %@";
      uint64_t v14 = v10;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v14, v15, v13, (uint8_t *)&v18, v16);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v11 = HMFGetLogIdentifier();
    uint64_t v17 = *(void *)(a1 + 40);
    int v18 = 138543618;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v17;
    uint64_t v13 = "%{public}@Successfully notified primary resident of significant event: %@";
    uint64_t v14 = v10;
    os_log_type_t v15 = OS_LOG_TYPE_INFO;
    uint32_t v16 = 22;
    goto LABEL_6;
  }
}

- (BOOL)_filterPassesForCameraSignificantEvent:(id)a3 registration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 reason] == 6) {
    goto LABEL_7;
  }
  id v7 = (void *)MEMORY[0x263EFFA08];
  id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "reason"));
  id v9 = [v7 setWithObject:v8];
  uint64_t v10 = HMCameraSignificantEventTypesFromReasons();

  if (([v6 significantEventTypes] & v10) == 0)
  {
    BOOL v15 = 0;
    goto LABEL_13;
  }
  if ([v5 reason] == 2 && objc_msgSend(v6, "personFamiliarityOptions"))
  {
    id v11 = [v5 faceClassification];
    uint64_t v12 = [v11 person];
    uint64_t v13 = [v12 name];

    if (v13)
    {
      uint64_t v14 = 4;
    }
    else
    {
      uint32_t v16 = [v5 faceClassification];

      if (v16) {
        uint64_t v14 = 2;
      }
      else {
        uint64_t v14 = 1;
      }
    }
    BOOL v15 = ([v6 personFamiliarityOptions] & v14) != 0;
  }
  else
  {
LABEL_7:
    BOOL v15 = 1;
  }
LABEL_13:

  return v15;
}

- (void)_handleSignificantEvent:(id)a3 cameraProfile:(id)a4
{
  id v15 = a4;
  id v6 = a3;
  id v7 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDCameraBulletinNotificationManager *)self home];
  int v9 = [v8 isCurrentDeviceConfirmedPrimaryResident];

  if (v9)
  {
    uint64_t v10 = [v6 UUID];
    uint64_t v11 = [v6 reason];
    uint64_t v12 = [v6 dateOfOccurrence];
    uint64_t v13 = [v6 confidenceLevel];
    uint64_t v14 = [v6 faceClassifications];

    [(HMDCameraBulletinNotificationManager *)self _handleSignificantEventWithUUID:v10 reason:v11 dateOfOccurrence:v12 confidenceLevel:v13 faceClassifications:v14 cameraProfile:v15];
    id v6 = (id)v12;
  }
  else
  {
    uint64_t v10 = [v15 uniqueIdentifier];
    [(HMDCameraBulletinNotificationManager *)self _notifyPrimaryResidentOfSignificantEvent:v6 withCameraProfileUUID:v10];
  }
}

- (void)_handleSignificantEventWithUUID:(id)a3 reason:(unint64_t)a4 dateOfOccurrence:(id)a5 confidenceLevel:(unint64_t)a6 faceClassifications:(id)a7 cameraProfile:(id)a8
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  int v18 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  dispatch_assert_queue_V2(v18);

  uint64_t v19 = (void *)MEMORY[0x230FBD990]();
  __int16 v20 = self;
  uint64_t v21 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    __int16 v22 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138544898;
    uint64_t v42 = v22;
    __int16 v43 = 2112;
    id v44 = v14;
    __int16 v45 = 2048;
    unint64_t v46 = a4;
    __int16 v47 = 2112;
    id v48 = v15;
    __int16 v49 = 2048;
    unint64_t v50 = a6;
    __int16 v51 = 2112;
    id v52 = v16;
    __int16 v53 = 2112;
    id v54 = v17;
    _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Handling significant event: [UUID: %@, Reason: %lu, DateOfOccurrence: %@, ConfidenceLevel: %lu, FaceClassifications: %@] from camera: %@", buf, 0x48u);
  }
  id v23 = [(HMDCameraBulletinNotificationManager *)v20 home];
  uint64_t v24 = [v17 hapAccessory];
  BOOL v25 = [v24 uuid];

  __int16 v26 = [(HMDCameraBulletinNotificationManager *)v20 _cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier:v25];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __146__HMDCameraBulletinNotificationManager__handleSignificantEventWithUUID_reason_dateOfOccurrence_confidenceLevel_faceClassifications_cameraProfile___block_invoke;
  v32[3] = &unk_264A1ADA0;
  id v33 = v16;
  id v34 = v23;
  __int16 v35 = v20;
  id v36 = v14;
  unint64_t v39 = a4;
  unint64_t v40 = a6;
  id v37 = v15;
  id v38 = v17;
  id v27 = v17;
  id v28 = v15;
  id v29 = v14;
  id v30 = v23;
  id v31 = v16;
  objc_msgSend(v26, "na_each:", v32);
}

void __146__HMDCameraBulletinNotificationManager__handleSignificantEventWithUUID_reason_dateOfOccurrence_confidenceLevel_faceClassifications_cameraProfile___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  if (*(void *)(a1 + 80) == 2 && [*(id *)(a1 + 32) count])
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = [v16 source];
    id v5 = [v4 userUUID];
    id v6 = [v3 userWithUUID:v5];

    id v7 = [*(id *)(a1 + 48) faceClassificationResolver];
    id v8 = [v7 faceClassificationForSignificantEventFaceClassifications:*(void *)(a1 + 32) user:v6];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = objc_alloc(MEMORY[0x263F0E200]);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  id v14 = [*(id *)(a1 + 72) uniqueIdentifier];
  id v15 = (void *)[v9 initWithUniqueIdentifier:v10 reason:v13 dateOfOccurrence:v11 confidenceLevel:v12 cameraProfileUUID:v14 faceClassification:v8];

  [*(id *)(a1 + 48) _handleSignificantEvent:v15 remoteRegistration:v16];
}

- (id)_cameraAccessModeBulletinNotificationRegistrationsForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__55678;
  int v18 = __Block_byref_object_dispose__55679;
  id v19 = (id)MEMORY[0x263EFFA68];
  id v5 = [(HMDCameraBulletinNotificationManager *)self home];
  id v6 = [v5 backingStore];
  id v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __103__HMDCameraBulletinNotificationManager__cameraAccessModeBulletinNotificationRegistrationsForAccessory___block_invoke;
  v11[3] = &unk_264A2F0A0;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 unsafeSynchronousBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __103__HMDCameraBulletinNotificationManager__cameraAccessModeBulletinNotificationRegistrationsForAccessory___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  id v8 = +[HMCContext findAccessoryWithModelID:v2];

  id v3 = [v8 cameraAccessModeBulletinRegistrations];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_102_55728);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

id __103__HMDCameraBulletinNotificationManager__cameraAccessModeBulletinNotificationRegistrationsForAccessory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromMKFRegistration:a2];
}

- (id)_cameraReachabilityBulletinNotificationRegistrationsForAccessory:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__55678;
  int v18 = __Block_byref_object_dispose__55679;
  id v19 = (id)MEMORY[0x263EFFA68];
  uint64_t v5 = [(HMDCameraBulletinNotificationManager *)self home];
  uint64_t v6 = [v5 backingStore];
  id v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __105__HMDCameraBulletinNotificationManager__cameraReachabilityBulletinNotificationRegistrationsForAccessory___block_invoke;
  v11[3] = &unk_264A2F0A0;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 unsafeSynchronousBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __105__HMDCameraBulletinNotificationManager__cameraReachabilityBulletinNotificationRegistrationsForAccessory___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  id v8 = +[HMCContext findAccessoryWithModelID:v2];

  id v3 = [v8 cameraReachabilityBulletinRegistrations];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = objc_msgSend(v3, "na_map:", &__block_literal_global_100_55731);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

id __105__HMDCameraBulletinNotificationManager__cameraReachabilityBulletinNotificationRegistrationsForAccessory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromMKFRegistration:a2];
}

- (id)_cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__55678;
  int v18 = __Block_byref_object_dispose__55679;
  id v19 = (id)MEMORY[0x263EFFA68];
  uint64_t v5 = [(HMDCameraBulletinNotificationManager *)self home];
  uint64_t v6 = [v5 backingStore];
  id v7 = [v6 context];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __116__HMDCameraBulletinNotificationManager__cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier___block_invoke;
  v11[3] = &unk_264A2F0A0;
  id v8 = v4;
  id v12 = v8;
  uint64_t v13 = &v14;
  [v7 unsafeSynchronousBlock:v11];
  id v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __116__HMDCameraBulletinNotificationManager__cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier___block_invoke(uint64_t a1)
{
  id v7 = +[HMCContext findAccessoryWithModelID:*(void *)(a1 + 32)];
  v2 = [v7 cameraSignificantEventBulletinRegistrations];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = objc_msgSend(v2, "na_map:", &__block_literal_global_98);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

id __116__HMDCameraBulletinNotificationManager__cameraSignificantEventBulletinNotificationRegistrationsForCameraIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromMKFRegistration:a2];
}

- (void)handleRemovedCameraAccessory:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  uint64_t v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    *(_DWORD *)long long buf = 138543618;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    id v22 = v4;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling removed camera: %@", buf, 0x16u);
  }
  id v9 = [(HMDCameraBulletinNotificationManager *)v6 home];
  uint64_t v10 = [v9 backingStore];
  uint64_t v11 = [v10 context];

  id v12 = [v11 managedObjectContext];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__HMDCameraBulletinNotificationManager_handleRemovedCameraAccessory___block_invoke;
  v15[3] = &unk_264A2F2F8;
  id v16 = v4;
  id v17 = v12;
  int v18 = v6;
  id v13 = v12;
  id v14 = v4;
  [v13 performBlock:v15];
}

void __69__HMDCameraBulletinNotificationManager_handleRemovedCameraAccessory___block_invoke(id *a1)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v2 = [a1[4] uuid];
  id v3 = +[MKFLocalBulletinCameraSignificantEventRegistration fetchCameraSignificantEventRegistrationForAccessoryUUID:v2 managedObjectContext:a1[5]];

  if (v3)
  {
    [a1[5] deleteObject:v3];
  }
  else
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = a1[6];
    uint64_t v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = HMFGetLogIdentifier();
      id v8 = a1[4];
      *(_DWORD *)long long buf = 138543618;
      id v33 = v7;
      __int16 v34 = 2112;
      __int16 v35 = v8;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local significant event registration to match removed camera: %@", buf, 0x16u);
    }
  }
  id v9 = [a1[4] uuid];
  uint64_t v10 = +[MKFLocalBulletinCameraAccessModeRegistration fetchCameraAccessModeRegistrationForAccessoryUUID:v9 managedObjectContext:a1[5]];

  if (v10)
  {
    [a1[5] deleteObject:v10];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = a1[6];
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      id v15 = a1[4];
      *(_DWORD *)long long buf = 138543618;
      id v33 = v14;
      __int16 v34 = 2112;
      __int16 v35 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local access mode registration to match removed camera: %@", buf, 0x16u);
    }
  }
  id v16 = [a1[4] uuid];
  id v17 = +[MKFLocalBulletinCameraReachabilityRegistration fetchCameraReachabilityRegistrationForAccessoryUUID:v16 managedObjectContext:a1[5]];

  if (v17)
  {
    [a1[5] deleteObject:v17];
  }
  else
  {
    int v18 = (void *)MEMORY[0x230FBD990]();
    id v19 = a1[6];
    __int16 v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      __int16 v21 = HMFGetLogIdentifier();
      id v22 = a1[4];
      *(_DWORD *)long long buf = 138543618;
      id v33 = v21;
      __int16 v34 = 2112;
      __int16 v35 = v22;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to find local reachability registration to match removed camera: %@", buf, 0x16u);
    }
  }
  id v23 = a1[5];
  id v31 = 0;
  [v23 save:&v31];
  id v24 = v31;
  BOOL v25 = (void *)MEMORY[0x230FBD990]();
  id v26 = a1[6];
  id v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    id v28 = HMFGetLogIdentifier();
    id v30 = a1[4];
    id v29 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138544898;
    id v33 = v28;
    __int16 v34 = 2112;
    __int16 v35 = v3;
    __int16 v36 = 2112;
    id v37 = v10;
    __int16 v38 = 2112;
    unint64_t v39 = v17;
    __int16 v40 = 2112;
    id v41 = v30;
    __int16 v42 = 2112;
    __int16 v43 = v29;
    __int16 v44 = 2112;
    id v45 = v24;
    _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Removing local registrations: %@, %@, %@ for removed camera: %@ was successful: %@ error: %@", buf, 0x48u);
  }
  [a1[5] reset];
}

- (id)conditionsFromPredicate:(id)a3
{
  return +[HMDNotificationConditionConverter conditionsFromPredicate:a3];
}

- (void)removeCameraSignificantEventNotificationObserver:(id)a3 cameraIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v15 = 138543874;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing camera significant event notification observer: %@ for camera identifier: %@", (uint8_t *)&v15, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  id v13 = [(HMDCameraBulletinNotificationManager *)v9 observersByCameraIdentifier];
  id v14 = [v13 objectForKeyedSubscript:v7];

  [v14 removeObject:v6];
  os_unfair_lock_unlock(p_lock);
}

- (void)addCameraSignificantEventNotificationObserver:(id)a3 cameraIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x230FBD990]();
  id v9 = self;
  uint64_t v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = HMFGetLogIdentifier();
    int v16 = 138543874;
    __int16 v17 = v11;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Adding camera significant event notification observer: %@ for camera identifier: %@", (uint8_t *)&v16, 0x20u);
  }
  p_lock = &v9->_lock;
  os_unfair_lock_lock_with_options();
  id v13 = [(HMDCameraBulletinNotificationManager *)v9 observersByCameraIdentifier];
  id v14 = [v13 objectForKeyedSubscript:v7];

  if (!v14)
  {
    id v14 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    int v15 = [(HMDCameraBulletinNotificationManager *)v9 observersByCameraIdentifier];
    [v15 setObject:v14 forKeyedSubscript:v7];
  }
  [v14 addObject:v6];

  os_unfair_lock_unlock(p_lock);
}

- (void)handleSignificantEvent:(id)a3 cameraProfile:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__HMDCameraBulletinNotificationManager_handleSignificantEvent_cameraProfile___block_invoke;
  block[3] = &unk_264A2F2F8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __77__HMDCameraBulletinNotificationManager_handleSignificantEvent_cameraProfile___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleSignificantEvent:*(void *)(a1 + 40) cameraProfile:*(void *)(a1 + 48)];
}

- (id)devicesToNotifyForAccessModeChangeForAccessory:(id)a3
{
  id v4 = [(HMDCameraBulletinNotificationManager *)self _cameraAccessModeBulletinNotificationRegistrationsForAccessory:a3];
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __87__HMDCameraBulletinNotificationManager_devicesToNotifyForAccessModeChangeForAccessory___block_invoke;
  id v12 = &unk_264A1AD78;
  id v13 = self;
  id v14 = v5;
  id v6 = v5;
  objc_msgSend(v4, "na_each:", &v9);
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __87__HMDCameraBulletinNotificationManager_devicesToNotifyForAccessModeChangeForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 registration];
  id v6 = [v4 source];

  id v8 = [v3 _deviceToNotifyForRegistration:v5 source:v6];

  id v7 = v8;
  if (v8)
  {
    [*(id *)(a1 + 40) addObject:v8];
    id v7 = v8;
  }
}

- (id)devicesToNotifyForCameraReachabilityForAccessory:(id)a3
{
  id v4 = [(HMDCameraBulletinNotificationManager *)self _cameraReachabilityBulletinNotificationRegistrationsForAccessory:a3];
  id v5 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v4, "count"));
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __89__HMDCameraBulletinNotificationManager_devicesToNotifyForCameraReachabilityForAccessory___block_invoke;
  id v12 = &unk_264A1AD50;
  id v13 = self;
  id v14 = v5;
  id v6 = v5;
  objc_msgSend(v4, "na_each:", &v9);
  id v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12, v13);

  return v7;
}

void __89__HMDCameraBulletinNotificationManager_devicesToNotifyForCameraReachabilityForAccessory___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 registration];
  id v6 = [v4 source];

  uint64_t v9 = [v3 _deviceToNotifyForRegistration:v5 source:v6];

  id v7 = v9;
  if (v9)
  {
    char v8 = [v9 isCurrentDevice];
    id v7 = v9;
    if ((v8 & 1) == 0)
    {
      [*(id *)(a1 + 40) addObject:v9];
      id v7 = v9;
    }
  }
}

- (id)_deviceToNotifyForRegistration:(id)a3 source:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HMDCameraBulletinNotificationManager *)self home];
  uint64_t v9 = [v7 userUUID];
  uint64_t v10 = [v8 userWithUUID:v9];

  if (v10)
  {
    uint64_t v11 = [(HMDCameraBulletinNotificationManager *)self evaluator];
    id v12 = [v6 conditions];
    int v13 = [v11 conditionsPass:v12 registrationUser:v10];

    id v14 = (void *)MEMORY[0x230FBD990]();
    int v15 = self;
    int v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v17 = HMFGetLogIdentifier();
      __int16 v18 = HMFBooleanToString();
      int v31 = 138544130;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      id v38 = v7;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Condition(s) passed: %@ for registration: %@ from source: %@", (uint8_t *)&v31, 0x2Au);
    }
    id v19 = [v7 device];
    __int16 v20 = v19;
    if (v13 && ([v19 isCurrentDevice] & 1) == 0)
    {
      id v26 = (void *)MEMORY[0x230FBD990]();
      id v27 = v15;
      id v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = HMFGetLogIdentifier();
        int v31 = 138544130;
        uint64_t v32 = v29;
        __int16 v33 = 2112;
        id v34 = v20;
        __int16 v35 = 2112;
        id v36 = v7;
        __int16 v37 = 2112;
        id v38 = v6;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Resolved remote device: %@ to notify from source %@ for registration %@", (uint8_t *)&v31, 0x2Au);
      }
      id v21 = v20;
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x230FBD990]();
    id v23 = self;
    id v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      BOOL v25 = HMFGetLogIdentifier();
      int v31 = 138543874;
      uint64_t v32 = v25;
      __int16 v33 = 2112;
      id v34 = v6;
      __int16 v35 = 2112;
      id v36 = v7;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Unable to evaluate registration: %@, no matching user for source: %@", (uint8_t *)&v31, 0x20u);
    }
    id v21 = 0;
  }

  return v21;
}

- (void)updateNotificationRegistrationsWithSettings:(id)a3 accessory:(id)a4 doorbellPressNotificationEnabled:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v99 = *MEMORY[0x263EF8340];
  v79 = (HMDCameraAccessModeBulletinNotificationRegistration *)a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x230FBD990]();
  int v13 = self;
  id v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = HMFGetLogIdentifier();
    int v16 = [v10 shortDescription];
    __int16 v17 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138544130;
    id v92 = v15;
    __int16 v93 = 2112;
    v94 = v16;
    __int16 v95 = 2112;
    v96 = v79;
    __int16 v97 = 2112;
    id v98 = v17;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Updating notification registrations for accessory: %@, settings: %@, doorbellPressNotificationEnabled: %@", buf, 0x2Au);
  }
  __int16 v18 = [(HMDCameraBulletinNotificationManager *)v13 home];
  id v19 = [v10 home];
  __int16 v20 = [v19 uuid];
  id v21 = [v18 uuid];
  char v22 = [v20 isEqual:v21];

  if ((v22 & 1) == 0) {
    _HMFPreconditionFailure();
  }
  v78 = v11;
  uint64_t v71 = v18;
  if (v7) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 0;
  }
  uint64_t v24 = v23 | [(HMDCameraAccessModeBulletinNotificationRegistration *)v79 isSmartBulletinBoardNotificationEnabled];
  uint64_t v25 = [(HMDCameraAccessModeBulletinNotificationRegistration *)v79 smartBulletinBoardNotificationCondition];
  [(HMDCameraBulletinNotificationManager *)v13 conditionsFromPredicate:v25];
  v27 = BOOL v26 = v7;
  uint64_t v75 = [MEMORY[0x263F0E668] bitwiseAndValueWithKeyPath:*MEMORY[0x263F0BD38] inPredicate:v25 validValues:31];
  uint64_t v28 = [v75 integerValue];
  uint64_t v77 = (void *)v25;
  id v74 = [MEMORY[0x263F0E668] bitwiseAndValueWithKeyPath:*MEMORY[0x263F0BD40] inPredicate:v25 validValues:7];
  uint64_t v29 = [v74 integerValue];
  id v30 = [HMDCameraSignificantEventBulletinNotificationRegistration alloc];
  int v31 = v10;
  uint64_t v32 = [v10 uuid];
  v76 = (void *)v27;
  uint64_t v33 = [(HMDCameraSignificantEventBulletinNotificationRegistration *)v30 initWithCameraIdentifier:v32 notificationModes:v24 significantEventTypes:v28 personFamiliarityOptions:v29 conditions:v27];

  int v34 = [(HMDCameraAccessModeBulletinNotificationRegistration *)v79 isSmartBulletinBoardNotificationEnabled] | v26;
  __int16 v35 = (void *)MEMORY[0x230FBD990]();
  id v36 = v13;
  __int16 v37 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    id v38 = HMFGetLogIdentifier();
    uint64_t v39 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    id v92 = v38;
    __int16 v93 = 2112;
    v94 = v39;
    __int16 v95 = 2112;
    v96 = (HMDCameraAccessModeBulletinNotificationRegistration *)v33;
    _os_log_impl(&dword_22F52A000, v37, OS_LOG_TYPE_INFO, "%{public}@Setting significant event registration enabled to %@ for %@", buf, 0x20u);
  }
  char v72 = v34;
  v73 = (void *)v33;

  __int16 v40 = [HMDCameraReachabilityBulletinNotificationRegistration alloc];
  id v41 = v31;
  __int16 v42 = [v31 uuid];
  __int16 v43 = [MEMORY[0x263EFFA08] set];
  __int16 v44 = [(HMDCameraReachabilityBulletinNotificationRegistration *)v40 initWithAccessoryUUID:v42 conditions:v43];

  char v45 = [(HMDCameraAccessModeBulletinNotificationRegistration *)v79 isReachabilityEventNotificationEnabled];
  uint64_t v46 = (void *)MEMORY[0x230FBD990]();
  __int16 v47 = v36;
  id v48 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    __int16 v49 = HMFGetLogIdentifier();
    unint64_t v50 = HMFBooleanToString();
    *(_DWORD *)long long buf = 138543874;
    id v92 = v49;
    __int16 v93 = 2112;
    v94 = v50;
    __int16 v95 = 2112;
    v96 = (HMDCameraAccessModeBulletinNotificationRegistration *)v44;
    _os_log_impl(&dword_22F52A000, v48, OS_LOG_TYPE_INFO, "%{public}@Setting reachability registration enabled to %@ for %@", buf, 0x20u);
  }
  __int16 v51 = [HMDCameraAccessModeBulletinNotificationRegistration alloc];
  id v52 = [v31 uuid];
  __int16 v53 = [MEMORY[0x263EFFA08] set];
  id v54 = [(HMDCameraAccessModeBulletinNotificationRegistration *)v51 initWithAccessoryUUID:v52 conditions:v53];

  char v55 = [(HMDCameraAccessModeBulletinNotificationRegistration *)v79 isAccessModeChangeNotificationEnabled];
  id v56 = (void *)MEMORY[0x230FBD990]();
  v57 = v47;
  v58 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    id v59 = HMFGetLogIdentifier();
    HMFBooleanToString();
    v61 = char v60 = v45;
    *(_DWORD *)long long buf = 138543874;
    id v92 = v59;
    __int16 v93 = 2112;
    v94 = v61;
    __int16 v95 = 2112;
    v96 = v54;
    _os_log_impl(&dword_22F52A000, v58, OS_LOG_TYPE_INFO, "%{public}@Setting access mode registration enabled to %@ for %@", buf, 0x20u);

    char v45 = v60;
  }

  v62 = [v71 backingStore];
  uint64_t v63 = [v62 context];

  v64 = [v63 managedObjectContext];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke;
  v80[3] = &unk_264A1AD28;
  id v81 = v41;
  id v82 = v64;
  id v83 = v57;
  id v84 = v73;
  char v88 = v72;
  char v89 = v45;
  v85 = v44;
  v86 = v54;
  char v90 = v55;
  id v87 = v78;
  id v65 = v78;
  v66 = v54;
  v67 = v44;
  id v68 = v73;
  id v69 = v64;
  id v70 = v41;
  [v69 performBlock:v80];
}

void __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke(uint64_t a1)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9C0] set];
  id v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [*(id *)(a1 + 32) uuid];
  id v5 = +[MKFLocalBulletinCameraSignificantEventRegistration fetchCameraSignificantEventRegistrationForAccessoryUUID:v4 managedObjectContext:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) uuid];
  BOOL v7 = +[MKFLocalBulletinCameraReachabilityRegistration fetchCameraReachabilityRegistrationForAccessoryUUID:v6 managedObjectContext:*(void *)(a1 + 40)];

  char v8 = [*(id *)(a1 + 32) uuid];
  uint64_t v9 = +[MKFLocalBulletinCameraAccessModeRegistration fetchCameraAccessModeRegistrationForAccessoryUUID:v8 managedObjectContext:*(void *)(a1 + 40)];

  char v45 = (void *)v9;
  if (v5 || v7 || v9)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 48);
    int v16 = HMFGetOSLogHandle();
    id v12 = v16;
    if (v5 && v7 && v9)
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_14;
      }
      __int16 v17 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) uuid];
      id v19 = v18 = v3;
      *(_DWORD *)long long buf = 138543618;
      __int16 v49 = v17;
      __int16 v50 = 2112;
      __int16 v51 = v19;
      __int16 v20 = "%{public}@Updating existing local registrations for camera: %@";
      id v21 = v12;
      os_log_type_t v22 = OS_LOG_TYPE_INFO;
      uint32_t v23 = 22;
    }
    else
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_14;
      }
      __int16 v17 = HMFGetLogIdentifier();
      [*(id *)(a1 + 32) uuid];
      id v19 = v18 = v3;
      *(_DWORD *)long long buf = 138544386;
      __int16 v49 = v17;
      __int16 v50 = 2112;
      __int16 v51 = v19;
      __int16 v52 = 2112;
      __int16 v53 = v5;
      __int16 v54 = 2112;
      id v55 = v7;
      __int16 v56 = 2112;
      v57 = v45;
      __int16 v20 = "%{public}@updateNotificationRegistrationWithSettings detected inconsistent registrations for camera: %@, sig"
            "nificantEvent: %@, reachability: %@, accessMode: %@";
      id v21 = v12;
      os_log_type_t v22 = OS_LOG_TYPE_FAULT;
      uint32_t v23 = 52;
    }
    _os_log_impl(&dword_22F52A000, v21, v22, v20, buf, v23);

    id v3 = v18;
  }
  else
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 48);
    id v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      id v14 = v13 = v3;
      int v15 = [*(id *)(a1 + 32) uuid];
      *(_DWORD *)long long buf = 138543618;
      __int16 v49 = v14;
      __int16 v50 = 2112;
      __int16 v51 = v15;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Creating initial local registrations for camera: %@", buf, 0x16u);

      id v3 = v13;
    }
  }
LABEL_14:

  if ([*(id *)(a1 + 48) _updateLocalStoreWithCameraSignificantEventBulletinRegistration:*(void *)(a1 + 56) existingMKFLocalRegistration:v5 enabled:*(unsigned __int8 *)(a1 + 88) moc:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 88)) {
      uint64_t v24 = v2;
    }
    else {
      uint64_t v24 = v3;
    }
    [v24 addObject:*(void *)(a1 + 56)];
  }
  uint64_t v25 = v45;
  if ([*(id *)(a1 + 48) _updateLocalStoreWithCameraReachabilityBulletinRegistration:*(void *)(a1 + 64) existingMKFLocalRegistration:v7 enabled:*(unsigned __int8 *)(a1 + 89) moc:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 89)) {
      BOOL v26 = v2;
    }
    else {
      BOOL v26 = v3;
    }
    [v26 addObject:*(void *)(a1 + 64)];
  }
  if ([*(id *)(a1 + 48) _updateLocalStoreWithCameraAccessModeBulletinRegistration:*(void *)(a1 + 72) existingMKFLocalRegistration:v45 enabled:*(unsigned __int8 *)(a1 + 90) moc:*(void *)(a1 + 40)])
  {
    if (*(unsigned char *)(a1 + 90)) {
      uint64_t v27 = v2;
    }
    else {
      uint64_t v27 = v3;
    }
    [v27 addObject:*(void *)(a1 + 72)];
  }
  if (objc_msgSend(v2, "hmf_isEmpty") && objc_msgSend(v3, "hmf_isEmpty"))
  {
    uint64_t v28 = (void *)MEMORY[0x230FBD990]();
    id v29 = *(id *)(a1 + 48);
    id v30 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v31 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543362;
      __int16 v49 = v31;
      _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Skipping save and not messaging primary because notification registration update resulted in no changes", buf, 0xCu);
    }
    uint64_t v32 = *(void *)(a1 + 80);
    if (v32) {
      (*(void (**)(uint64_t, void))(v32 + 16))(v32, 0);
    }
  }
  else
  {
    uint64_t v33 = v3;
    int v34 = *(void **)(a1 + 40);
    id v47 = 0;
    int v35 = [v34 save:&v47];
    id v36 = v47;
    __int16 v37 = (void *)MEMORY[0x230FBD990]([*(id *)(a1 + 40) reset]);
    id v38 = *(id *)(a1 + 48);
    uint64_t v39 = HMFGetOSLogHandle();
    __int16 v40 = v39;
    if (v35)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        id v41 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543874;
        __int16 v49 = v41;
        __int16 v50 = 2112;
        __int16 v51 = v2;
        __int16 v52 = 2112;
        __int16 v53 = v33;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_INFO, "%{public}@Successfully updated local enabled registrations: %@, disabled registrations: %@", buf, 0x20u);
      }
      __int16 v42 = [*(id *)(a1 + 48) workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke_76;
      block[3] = &unk_264A2F7F8;
      block[4] = *(void *)(a1 + 48);
      dispatch_async(v42, block);
    }
    else
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        __int16 v43 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138544130;
        __int16 v49 = v43;
        __int16 v50 = 2112;
        __int16 v51 = v2;
        __int16 v52 = 2112;
        __int16 v53 = v33;
        __int16 v54 = 2112;
        id v55 = v36;
        _os_log_impl(&dword_22F52A000, v40, OS_LOG_TYPE_ERROR, "%{public}@Failed to update local enabled registrations: %@, disabled registrations: %@ due to error: %@", buf, 0x2Au);
      }
    }
    uint64_t v44 = *(void *)(a1 + 80);
    id v3 = v33;
    if (v44) {
      (*(void (**)(uint64_t, id))(v44 + 16))(v44, v36);
    }

    uint64_t v25 = v45;
  }
}

uint64_t __138__HMDCameraBulletinNotificationManager_updateNotificationRegistrationsWithSettings_accessory_doorbellPressNotificationEnabled_completion___block_invoke_76(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestSynchronizeRegistrations];
}

- (id)cameraUserNotificationSettingsForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDCameraBulletinNotificationManager *)self home];
  id v6 = [v4 home];
  BOOL v7 = [v6 uuid];
  char v8 = [v5 uuid];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    __int16 v17 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v30, 8);
    _Block_object_dispose(&v34, 8);
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v42, 8);
    _Block_object_dispose(&v48, 8);
    _Unwind_Resume(v17);
  }
  uint64_t v48 = 0;
  __int16 v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v42 = 0;
  __int16 v43 = &v42;
  uint64_t v44 = 0x3032000000;
  char v45 = __Block_byref_object_copy__55678;
  uint64_t v46 = __Block_byref_object_dispose__55679;
  id v47 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  int v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  id v10 = [v5 backingStore];
  id v11 = [v10 context];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  __int16 v20 = __83__HMDCameraBulletinNotificationManager_cameraUserNotificationSettingsForAccessory___block_invoke;
  id v21 = &unk_264A1AD00;
  id v12 = v11;
  id v22 = v12;
  id v13 = v4;
  uint64_t v25 = &v48;
  BOOL v26 = &v42;
  uint64_t v27 = &v38;
  uint64_t v28 = &v34;
  id v29 = &v30;
  id v23 = v13;
  uint64_t v24 = self;
  [v12 unsafeSynchronousBlock:&v18];
  if (*((unsigned char *)v31 + 24))
  {
    id v14 = objc_alloc_init(MEMORY[0x263F0E598]);
    objc_msgSend(v14, "setSmartBulletinBoardNotificationEnabled:", *((unsigned __int8 *)v49 + 24), v18, v19, v20, v21, v22);
    [v14 setSmartBulletinBoardNotificationCondition:v43[5]];
    [v14 setReachabilityEventNotificationEnabled:*((unsigned __int8 *)v39 + 24)];
    [v14 setAccessModeChangeNotificationEnabled:*((unsigned __int8 *)v35 + 24)];
    int v15 = (void *)[v14 copy];
  }
  else
  {
    int v15 = 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(&v48, 8);
  return v15;
}

void __83__HMDCameraBulletinNotificationManager_cameraUserNotificationSettingsForAccessory___block_invoke(uint64_t a1)
{
  v41[3] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = [*(id *)(a1 + 40) uuid];
  id v4 = +[MKFLocalBulletinCameraSignificantEventRegistration fetchCameraSignificantEventRegistrationForAccessoryUUID:v3 managedObjectContext:v2];

  id v5 = [*(id *)(a1 + 40) uuid];
  id v6 = +[MKFLocalBulletinCameraReachabilityRegistration fetchCameraReachabilityRegistrationForAccessoryUUID:v5 managedObjectContext:v2];

  BOOL v7 = [*(id *)(a1 + 40) uuid];
  char v8 = +[MKFLocalBulletinCameraAccessModeRegistration fetchCameraAccessModeRegistrationForAccessoryUUID:v7 managedObjectContext:v2];

  if (!v4 || !v6 || !v8)
  {
    id v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = *(id *)(a1 + 48);
    id v12 = HMFGetOSLogHandle();
    id v13 = v12;
    if (v4 || v6 || v8)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v14 = HMFGetLogIdentifier();
        int v15 = [*(id *)(a1 + 40) uuid];
        *(_DWORD *)long long buf = 138544386;
        uint64_t v32 = v14;
        __int16 v33 = 2112;
        uint64_t v34 = v15;
        __int16 v35 = 2112;
        uint64_t v36 = v4;
        __int16 v37 = 2112;
        uint64_t v38 = v6;
        __int16 v39 = 2112;
        uint64_t v40 = v8;
        int v16 = "%{public}@cameraUserNotificationSettingsForAccessory detected inconsistent registrations for camera: %@, s"
              "ignificantEvent: %@, reachability: %@, accessMode: %@";
        __int16 v17 = v13;
        os_log_type_t v18 = OS_LOG_TYPE_FAULT;
        uint32_t v19 = 52;
        goto LABEL_13;
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = [*(id *)(a1 + 40) uuid];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v32 = v14;
      __int16 v33 = 2112;
      uint64_t v34 = v15;
      int v16 = "%{public}@Did not find any local registrations for camera: %@";
      __int16 v17 = v13;
      os_log_type_t v18 = OS_LOG_TYPE_INFO;
      uint32_t v19 = 22;
LABEL_13:
      _os_log_impl(&dword_22F52A000, v17, v18, v16, buf, v19);
    }
    goto LABEL_19;
  }
  if ([v4 enabled]) {
    char v9 = [v4 notificationModes] & 1;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v9;
  __int16 v20 = +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromLocalRegistration:v4];
  uint64_t v21 = [v20 predicate];
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  id v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [v6 enabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [v8 enabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
  uint64_t v24 = (void *)MEMORY[0x230FBD990]();
  id v25 = *(id *)(a1 + 48);
  BOOL v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    v41[0] = v4;
    v41[1] = v6;
    v41[2] = v8;
    [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];
    uint64_t v28 = v30 = v24;
    id v29 = [*(id *)(a1 + 40) uuid];
    *(_DWORD *)long long buf = 138543874;
    uint64_t v32 = v27;
    __int16 v33 = 2112;
    uint64_t v34 = v28;
    __int16 v35 = 2112;
    uint64_t v36 = v29;
    _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_DEBUG, "%{public}@Found local registrations: %@ for camera: %@", buf, 0x20u);

    uint64_t v24 = v30;
  }

LABEL_19:
}

- (void)configureWithDeviceIsResidentCapable:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  if (self)
  {
    id v5 = [(HMDCameraBulletinNotificationManager *)self home];
    if ([v5 cameraNotificationSettingsMigrationFileExistsOnDisk])
    {
      id v6 = [v5 loadMigrationCameraNotificationSettingsFromDisk];
      BOOL v7 = (void *)MEMORY[0x230FBD990]();
      if (v6)
      {
        id v8 = v6;
        char v9 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
        *(void *)&long long buf = MEMORY[0x263EF8330];
        *((void *)&buf + 1) = 3221225472;
        char v51 = __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke;
        __int16 v52 = &unk_264A1B0E0;
        __int16 v53 = self;
        id v10 = (HMDCameraBulletinNotificationManager *)v8;
        __int16 v54 = v10;
        id v11 = v9;
        id v55 = v11;
        [(HMDCameraBulletinNotificationManager *)v10 hmf_enumerateWithAutoreleasePoolUsingBlock:&buf];
        if ([v11 count])
        {
          id v12 = [(HMDCameraBulletinNotificationManager *)self home];
          id v13 = [v12 backingStore];
          id v14 = [v13 context];

          int v15 = [v14 managedObjectContext];
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_152;
          v45[3] = &unk_264A2F2F8;
          v45[4] = self;
          uint64_t v46 = v11;
          id v47 = v15;
          id v16 = v15;
          [v16 performBlockAndWait:v45];
        }
      }
      else
      {
        id v10 = self;
        id v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          __int16 v17 = HMFGetLogIdentifier();
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v17;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to load camera notification settings from migration file", (uint8_t *)&buf, 0xCu);
        }
      }
    }
  }
  os_log_type_t v18 = [(HMDCameraBulletinNotificationManager *)self home];
  uint32_t v19 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v18 userPrivilege:0 remoteAccessRequired:0];
  __int16 v20 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
  uint64_t v21 = [(HMDCameraBulletinNotificationManager *)self messageDispatcher];
  v49[0] = v20;
  v49[1] = v19;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
  [v21 registerForMessage:@"HMDBulletinNotificationCameraSignificantEventMessage" receiver:self policies:v22 selector:sel__handleCameraSignificantEventNotificationMessage_];

  id v23 = [(HMDCameraBulletinNotificationManager *)self messageDispatcher];
  v48[0] = v20;
  v48[1] = v19;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v48 count:2];
  [v23 registerForMessage:@"HMDBulletinNotificationNotifyPrimaryResidentOfCameraSignificantEventMessage" receiver:self policies:v24 selector:sel__handleCameraSignificantEventBulletinNotifyPrimaryResidentMessage_];

  id v25 = [(HMDCameraBulletinNotificationManager *)self notificationCenter];
  BOOL v26 = [v18 residentDeviceManager];
  [v25 addObserver:self selector:sel_handlePrimaryResidentUpdateNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentNotification" object:v26];

  uint64_t v27 = [(HMDCameraBulletinNotificationManager *)self notificationCenter];
  uint64_t v28 = [(HMDCameraBulletinNotificationManager *)self accountManager];
  [v27 addObserver:self selector:sel_handleCurrentDeviceOrAccountUpdatedNotification_ name:@"HMDAppleAccountManagerDeviceUpdatedNotification" object:v28];

  id v29 = [(HMDCameraBulletinNotificationManager *)self notificationCenter];
  uint64_t v30 = [(HMDCameraBulletinNotificationManager *)self accountManager];
  [v29 addObserver:self selector:sel_handleCurrentDeviceOrAccountUpdatedNotification_ name:@"HMDAppleAccountManagerAccountUpdatedNotification" object:v30];

  int v31 = [(HMDCameraBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimerFactory];
  uint64_t v32 = v31[2](v31, 28, 5.0);
  [(HMDCameraBulletinNotificationManager *)self setSynchronizeWithPrimaryDebounceTimer:v32];

  __int16 v33 = [(HMDCameraBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
  [v33 setDelegate:self];

  uint64_t v34 = [(HMDCameraBulletinNotificationManager *)self workQueue];
  __int16 v35 = [(HMDCameraBulletinNotificationManager *)self synchronizeWithPrimaryDebounceTimer];
  [v35 setDelegateQueue:v34];

  if (v3)
  {
    [(HMDCameraBulletinNotificationManager *)self setCurrentPrimary:0];
    int v36 = [v18 isCurrentDeviceConfirmedPrimaryResident];
    __int16 v37 = (void *)MEMORY[0x230FBD990]();
    uint64_t v38 = self;
    __int16 v39 = HMFGetOSLogHandle();
    BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);
    if (v36)
    {
      if (v40)
      {
        char v41 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v41;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Configuring as primary resident", (uint8_t *)&buf, 0xCu);
      }
      uint64_t v42 = [(HMDCameraBulletinNotificationManager *)v38 workQueue];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __77__HMDCameraBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke;
      v44[3] = &unk_264A2F7F8;
      v44[4] = v38;
      dispatch_async(v42, v44);
    }
    else
    {
      if (v40)
      {
        __int16 v43 = HMFGetLogIdentifier();
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v43;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Configuring as non-primary resident", (uint8_t *)&buf, 0xCu);
      }
    }
  }
}

uint64_t __77__HMDCameraBulletinNotificationManager_configureWithDeviceIsResidentCapable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDeviceBecamePrimary];
}

void __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  BOOL v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    id v6 = [(__CFString *)v5 objectForKeyedSubscript:@"HMD.CNS.A"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v7 = v6;
    }
    else {
      BOOL v7 = 0;
    }
    id v8 = v7;

    if (v8)
    {
      char v9 = [(__CFString *)v5 objectForKeyedSubscript:@"HMD.CNS"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
      id v11 = v10;

      if (v11)
      {
        [*(id *)(a1 + 48) setObject:v11 forKeyedSubscript:v8];
      }
      else
      {
        uint64_t v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = *(id *)(a1 + 32);
        id v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          uint64_t v24 = HMFGetLogIdentifier();
          int v25 = 138543874;
          BOOL v26 = v24;
          __int16 v27 = 2112;
          uint64_t v28 = @"HMD.CNS";
          __int16 v29 = 2112;
          uint64_t v30 = v3;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", (uint8_t *)&v25, 0x20u);
        }
      }
    }
    else
    {
      __int16 v17 = (void *)MEMORY[0x230FBD990]();
      id v18 = *(id *)(a1 + 32);
      uint32_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        __int16 v20 = HMFGetLogIdentifier();
        int v25 = 138543874;
        BOOL v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = @"HMD.CNS.A";
        __int16 v29 = 2112;
        uint64_t v30 = v3;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Invalid object for %@: %@", (uint8_t *)&v25, 0x20u);
      }
    }
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = HMFGetLogIdentifier();
      id v16 = *(__CFString **)(a1 + 40);
      int v25 = 138543874;
      BOOL v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v3;
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unexpected object type: %@, %@", (uint8_t *)&v25, 0x20u);
    }
  }
}

void __74__HMDCameraBulletinNotificationManager_validateRegistrationsForMigration___block_invoke_152(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)[*(id *)(a1 + 40) copy];
  id v4 = *(void **)(a1 + 48);
  id v21 = v3;
  id v5 = v4;
  id v6 = v5;
  if (v2)
  {
    BOOL v7 = (void *)MEMORY[0x230FBD990](objc_msgSend(v5, "hmd_assertIsExecuting"));
    id v8 = v2;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Migrating bulletin registrations: %@", buf, 0x16u);
    }
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __69__HMDCameraBulletinNotificationManager_migrateRegistrations_context___block_invoke;
    uint64_t v28 = &unk_264A1B108;
    id v29 = v8;
    id v11 = v6;
    id v30 = v11;
    [v21 enumerateKeysAndObjectsUsingBlock:buf];
    if ([v11 hasChanges])
    {
      id v22 = 0;
      char v12 = objc_msgSend(v11, "hmd_saveWithTransactionAuthor:error:", 7, &v22);
      id v13 = v22;
      id v14 = (void *)MEMORY[0x230FBD990]();
      id v15 = v8;
      id v16 = HMFGetOSLogHandle();
      __int16 v17 = v16;
      if (v12)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          id v18 = HMFGetLogIdentifier();
          *(_DWORD *)id v23 = 138543362;
          uint64_t v24 = v18;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Successfully migrated bulletin registrations", v23, 0xCu);
        }
        uint32_t v19 = [v15 home];
        [v19 removeCameraNotificationSettingsMigrationFileFromDisk];
      }
      else
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          __int16 v20 = HMFGetLogIdentifier();
          *(_DWORD *)id v23 = 138543618;
          uint64_t v24 = v20;
          __int16 v25 = 2112;
          id v26 = v21;
          _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to migrate bulletin registrations: %@", v23, 0x16u);
        }
        [v11 rollback];
      }
    }
  }
}

void __69__HMDCameraBulletinNotificationManager_migrateRegistrations_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v73 = a2;
  id v69 = a3;
  id v6 = v4;
  if (v5)
  {
    id v72 = v6;
    objc_msgSend(v6, "hmd_assertIsExecuting");
    id v70 = +[MKFLocalBulletinAccessoryRegistration fetchRequest];
    BOOL v7 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"accessoryModelID", v73];
    [v70 setPredicate:v7];

    id v92 = 0;
    uint64_t v71 = [v72 executeFetchRequest:v70 error:&v92];
    id v68 = v92;
    id v8 = v71;
    if (!v71)
    {
      char v9 = (void *)MEMORY[0x230FBD990]();
      id v10 = v5;
      id v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        char v12 = HMFGetLogIdentifier();
        *(_DWORD *)long long buf = 138543618;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v68;
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch existing registrations: %@", buf, 0x16u);
      }
      id v8 = 0;
    }
    uint64_t v86 = 0;
    id v87 = &v86;
    uint64_t v88 = 0x3032000000;
    char v89 = __Block_byref_object_copy__55678;
    char v90 = __Block_byref_object_dispose__55679;
    id v91 = 0;
    uint64_t v80 = 0;
    id v81 = &v80;
    uint64_t v82 = 0x3032000000;
    id v83 = __Block_byref_object_copy__55678;
    id v84 = __Block_byref_object_dispose__55679;
    id v85 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = &v74;
    uint64_t v76 = 0x3032000000;
    uint64_t v77 = __Block_byref_object_copy__55678;
    v78 = __Block_byref_object_dispose__55679;
    id v79 = 0;
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __89__HMDCameraBulletinNotificationManager_ensureRegistrationsForAccessory_settings_context___block_invoke;
    v94 = &unk_264A1B130;
    __int16 v97 = &v80;
    id v98 = &v74;
    __int16 v95 = v5;
    v96 = &v86;
    objc_msgSend(v8, "hmf_enumerateWithAutoreleasePoolUsingBlock:", buf);
    id v13 = (id)v87[5];
    id v14 = v73;
    id v15 = v69;
    id v16 = v72;
    uint64_t v17 = objc_msgSend(v16, "hmd_assertIsExecuting");
    if (v13)
    {
      id v18 = (void *)MEMORY[0x230FBD990](v17);
      id v19 = v5;
      __int16 v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v99 = 138543618;
        v100 = v21;
        __int16 v101 = 2112;
        id v102 = v13;
        _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Already have a camera access mode registration: %@", v99, 0x16u);
      }
    }
    else
    {
      id v22 = [[MKFLocalBulletinCameraAccessModeRegistration alloc] initWithContext:v16];
      [(MKFLocalBulletinCameraAccessModeRegistration *)v22 setAccessoryModelID:v14];
      id v23 = [MEMORY[0x263EFFA08] set];
      [(MKFLocalBulletinCameraAccessModeRegistration *)v22 setConditions:v23];

      if (isTVOSDevice()) {
        uint64_t v24 = 0;
      }
      else {
        uint64_t v24 = [v15 isAccessModeChangeNotificationEnabled];
      }
      __int16 v25 = (void *)MEMORY[0x230FBD990]([(MKFLocalBulletinCameraAccessModeRegistration *)v22 setEnabled:v24]);
      id v26 = v5;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v99 = 138543618;
        v100 = v28;
        __int16 v101 = 2112;
        id v102 = v22;
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, "%{public}@Created new camera access mode registration: %@", v99, 0x16u);
      }
    }
    id v29 = (id)v81[5];
    id v30 = v14;
    id v31 = v15;
    id v32 = v16;
    uint64_t v33 = objc_msgSend(v32, "hmd_assertIsExecuting");
    if (v29)
    {
      uint64_t v34 = (void *)MEMORY[0x230FBD990](v33);
      id v35 = v5;
      int v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        __int16 v37 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v99 = 138543618;
        v100 = v37;
        __int16 v101 = 2112;
        id v102 = v29;
        _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Already have a camera reachability registration: %@", v99, 0x16u);
      }
    }
    else
    {
      uint64_t v38 = [[MKFLocalBulletinCameraReachabilityRegistration alloc] initWithContext:v32];
      [(MKFLocalBulletinCameraReachabilityRegistration *)v38 setAccessoryModelID:v30];
      __int16 v39 = [MEMORY[0x263EFFA08] set];
      [(MKFLocalBulletinCameraReachabilityRegistration *)v38 setConditions:v39];

      if (isTVOSDevice()) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = [v31 isReachabilityEventNotificationEnabled];
      }
      char v41 = (void *)MEMORY[0x230FBD990]([(MKFLocalBulletinCameraReachabilityRegistration *)v38 setEnabled:v40]);
      id v42 = v5;
      __int16 v43 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v99 = 138543618;
        v100 = v44;
        __int16 v101 = 2112;
        id v102 = v38;
        _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Created new camera reachability registration: %@", v99, 0x16u);
      }
    }
    id v45 = (id)v75[5];
    id v46 = v30;
    id v47 = v31;
    id v48 = v32;
    uint64_t v49 = objc_msgSend(v48, "hmd_assertIsExecuting");
    if (v45)
    {
      uint64_t v50 = (void *)MEMORY[0x230FBD990](v49);
      id v51 = v5;
      __int16 v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        __int16 v53 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v99 = 138543618;
        v100 = v53;
        __int16 v101 = 2112;
        id v102 = v45;
        _os_log_impl(&dword_22F52A000, v52, OS_LOG_TYPE_INFO, "%{public}@Already have a camera significant event registration: %@", v99, 0x16u);
      }
    }
    else
    {
      __int16 v54 = [[MKFLocalBulletinCameraSignificantEventRegistration alloc] initWithContext:v48];
      [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setAccessoryModelID:v46];
      id v55 = [MEMORY[0x263EFFA08] set];
      [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setConditions:v55];

      [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setNotificationModes:0];
      [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setSignificantEventTypes:0];
      [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setPersonFamiliarityOptions:0];
      if (isHomePod()) {
        uint64_t v56 = 0;
      }
      else {
        uint64_t v56 = [v47 isSmartBulletinBoardNotificationEnabled];
      }
      [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setEnabled:v56];
      if ([v47 isSmartBulletinBoardNotificationEnabled])
      {
        [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setNotificationModes:1];
        v57 = [v47 smartBulletinBoardNotificationCondition];
        v67 = [MEMORY[0x263F0E668] bitwiseAndValueWithKeyPath:*MEMORY[0x263F0BD38] inPredicate:v57 validValues:31];
        uint64_t v58 = [v67 integerValue];
        id v59 = [MEMORY[0x263F0E668] bitwiseAndValueWithKeyPath:*MEMORY[0x263F0BD40] inPredicate:v57 validValues:7];
        uint64_t v60 = [v59 integerValue];
        [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setSignificantEventTypes:v58];
        [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setPersonFamiliarityOptions:v60];
        v61 = [v5 conditionsFromPredicate:v57];
        v62 = +[HMDBulletinNotificationRegistrationUtilities createAndAddLocalConditionsToRegistration:v54 moc:v48 conditions:v61];
        [(MKFLocalBulletinCameraSignificantEventRegistration *)v54 setConditions:v62];
      }
      uint64_t v63 = (void *)MEMORY[0x230FBD990]();
      id v64 = v5;
      id v65 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        v66 = HMFGetLogIdentifier();
        *(_DWORD *)uint64_t v99 = 138543618;
        v100 = v66;
        __int16 v101 = 2112;
        id v102 = v54;
        _os_log_impl(&dword_22F52A000, v65, OS_LOG_TYPE_INFO, "%{public}@Created new camera significant event registration: %@", v99, 0x16u);
      }
    }
    _Block_object_dispose(&v74, 8);

    _Block_object_dispose(&v80, 8);
    _Block_object_dispose(&v86, 8);

    id v6 = v72;
  }
}

void __89__HMDCameraBulletinNotificationManager_ensureRegistrationsForAccessory_settings_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a2;
  id v5 = [v4 entity];
  id v6 = +[MKFLocalBulletinCameraAccessModeRegistration entity];
  int v7 = [v5 isKindOfEntity:v6];

  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 40);
LABEL_7:
    objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), a2);
    goto LABEL_8;
  }
  char v9 = [v4 entity];
  id v10 = +[MKFLocalBulletinCameraReachabilityRegistration entity];
  int v11 = [v9 isKindOfEntity:v10];

  if (v11)
  {
    uint64_t v8 = *(void *)(a1 + 48);
    goto LABEL_7;
  }
  char v12 = [v4 entity];
  id v13 = +[MKFLocalBulletinCameraSignificantEventRegistration entity];
  int v14 = [v12 isKindOfEntity:v13];

  if (v14)
  {
    uint64_t v8 = *(void *)(a1 + 56);
    goto LABEL_7;
  }
  id v15 = [v4 entity];
  id v16 = +[MKFLocalBulletinCharacteristicRegistration entity];
  char v17 = [v15 isKindOfEntity:v16];

  if ((v17 & 1) == 0)
  {
    id v18 = [v4 entity];
    id v19 = +[MKFLocalBulletinServiceRegistration entity];
    char v20 = [v18 isKindOfEntity:v19];

    if ((v20 & 1) == 0)
    {
      id v21 = (void *)MEMORY[0x230FBD990]();
      id v22 = *(id *)(a1 + 32);
      id v23 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = HMFGetLogIdentifier();
        int v25 = 138543618;
        id v26 = v24;
        __int16 v27 = 2112;
        id v28 = v4;
        _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unknown type of local registration, ignoring: %@", (uint8_t *)&v25, 0x16u);
      }
    }
  }
LABEL_8:
}

- (HMDBulletinNotificationRegistrationSource)source
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = [(HMDCameraBulletinNotificationManager *)self accountManager];
  id v4 = [v3 account];
  id v5 = [v4 currentDevice];
  id v6 = [v5 deviceAddress];

  if (v6)
  {
    int v7 = [(HMDCameraBulletinNotificationManager *)self home];
    uint64_t v8 = [v7 currentUser];
    char v9 = [v8 uuid];

    if (v9)
    {
      id v10 = [[HMDBulletinNotificationRegistrationSource alloc] initWithUserUUID:v9 deviceAddress:v6];
    }
    else
    {
      id v15 = (void *)MEMORY[0x230FBD990]();
      id v16 = self;
      char v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = HMFGetLogIdentifier();
        int v20 = 138543362;
        id v21 = v18;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device user", (uint8_t *)&v20, 0xCu);
      }
      id v10 = 0;
    }
  }
  else
  {
    int v11 = (void *)MEMORY[0x230FBD990]();
    char v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      int v20 = 138543362;
      id v21 = v14;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to retrieve current device address", (uint8_t *)&v20, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

- (NSArray)cameraAccessModeRegistrationsForCurrentDevice
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__55678;
  char v17 = __Block_byref_object_dispose__55679;
  id v18 = (id)MEMORY[0x263EFFA68];
  BOOL v3 = [(HMDCameraBulletinNotificationManager *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  id v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_264A2F698;
  v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  char v12 = &v13;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

void __85__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _mkfLocalCameraAccessModeRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v5, "na_map:", &__block_literal_global_50_55811);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __85__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 enabled])
  {
    uint64_t v3 = +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromLocalRegistration:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)cameraAccessModeRegistrations
{
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__55678;
  uint64_t v15 = __Block_byref_object_dispose__55679;
  id v16 = (id)MEMORY[0x263EFFA68];
  id v2 = [(HMDCameraBulletinNotificationManager *)self home];
  uint64_t v3 = [v2 backingStore];
  id v4 = [v3 context];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke;
  v8[3] = &unk_264A2F0A0;
  id v5 = v2;
  id v9 = v5;
  id v10 = &v11;
  [v4 unsafeSynchronousBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

void __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [v4 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_2;
  v10[3] = &unk_264A2A450;
  id v11 = v2;
  id v6 = v2;
  objc_msgSend(v5, "na_each:", v10);

  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_47_55815);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bulletinRegistrations];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_3;
  v4[3] = &unk_264A24B08;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

id __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraAccessModeRegistrationFromMKFRegistration:a2];
}

void __69__HMDCameraBulletinNotificationManager_cameraAccessModeRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 castIfCameraAccessModeBulletinRegistration];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v3 = v4;
  }
}

- (NSArray)cameraReachabilityRegistrationsForCurrentDevice
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__55678;
  char v17 = __Block_byref_object_dispose__55679;
  id v18 = (id)MEMORY[0x263EFFA68];
  uint64_t v3 = [(HMDCameraBulletinNotificationManager *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  id v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __87__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_264A2F698;
  void v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  char v12 = &v13;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

void __87__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _mkfLocalCameraReachabilityRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v5, "na_map:", &__block_literal_global_44_55818);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __87__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 enabled])
  {
    uint64_t v3 = +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromLocalRegistration:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)cameraReachabilityRegistrations
{
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__55678;
  uint64_t v15 = __Block_byref_object_dispose__55679;
  id v16 = (id)MEMORY[0x263EFFA68];
  id v2 = [(HMDCameraBulletinNotificationManager *)self home];
  uint64_t v3 = [v2 backingStore];
  id v4 = [v3 context];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke;
  v8[3] = &unk_264A2F0A0;
  id v5 = v2;
  id v9 = v5;
  id v10 = &v11;
  [v4 unsafeSynchronousBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

void __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [v4 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_2;
  v10[3] = &unk_264A2A450;
  id v11 = v2;
  id v6 = v2;
  objc_msgSend(v5, "na_each:", v10);

  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_41_55821);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bulletinRegistrations];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_3;
  v4[3] = &unk_264A24B08;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

id __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraReachabilityRegistrationFromMKFRegistration:a2];
}

void __71__HMDCameraBulletinNotificationManager_cameraReachabilityRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 castIfCameraReachabilityBulletinRegistration];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v3 = v4;
  }
}

- (NSArray)cameraSignificantEventRegistrationsForCurrentDevice
{
  uint64_t v13 = 0;
  int v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__55678;
  char v17 = __Block_byref_object_dispose__55679;
  id v18 = (id)MEMORY[0x263EFFA68];
  uint64_t v3 = [(HMDCameraBulletinNotificationManager *)self home];
  id v4 = [v3 backingStore];
  id v5 = [v4 context];

  id v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrationsForCurrentDevice__block_invoke;
  v10[3] = &unk_264A2F698;
  void v10[4] = self;
  id v7 = v6;
  id v11 = v7;
  char v12 = &v13;
  [v7 performBlockAndWait:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return (NSArray *)v8;
}

void __91__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrationsForCurrentDevice__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _mkfLocalCameraSignificantEventRegistrationsWithManagedObjectContext:*(void *)(a1 + 40)];
  uint64_t v2 = objc_msgSend(v5, "na_map:", &__block_literal_global_38_55823);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

id __91__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrationsForCurrentDevice__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 enabled])
  {
    uint64_t v3 = +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromLocalRegistration:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (NSArray)cameraSignificantEventRegistrations
{
  uint64_t v11 = 0;
  char v12 = &v11;
  uint64_t v13 = 0x3032000000;
  int v14 = __Block_byref_object_copy__55678;
  uint64_t v15 = __Block_byref_object_dispose__55679;
  id v16 = (id)MEMORY[0x263EFFA68];
  id v2 = [(HMDCameraBulletinNotificationManager *)self home];
  uint64_t v3 = [v2 backingStore];
  id v4 = [v3 context];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke;
  v8[3] = &unk_264A2F0A0;
  id v5 = v2;
  id v9 = v5;
  id v10 = &v11;
  [v4 unsafeSynchronousBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (NSArray *)v6;
}

void __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [*(id *)(a1 + 32) uuid];
  id v4 = +[HMCContext findHomeWithModelID:v3];

  id v5 = [v4 users];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_2;
  v10[3] = &unk_264A2A450;
  id v11 = v2;
  id v6 = v2;
  objc_msgSend(v5, "na_each:", v10);

  uint64_t v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_33);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 bulletinRegistrations];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_3;
  v4[3] = &unk_264A24B08;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

id __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return +[HMDBulletinNotificationRegistrationUtilities cameraSignificantEventRegistrationFromMKFRegistration:a2];
}

void __75__HMDCameraBulletinNotificationManager_cameraSignificantEventRegistrations__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 castIfCameraSignificantEventBulletinRegistration];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    uint64_t v3 = v4;
  }
}

- (HMDCameraBulletinNotificationManager)initWithHome:(id)a3 workQueue:(id)a4 messageDispatcher:(id)a5 accountManager:(id)a6 faceClassificationResolver:(id)a7 doorbellPressTracker:(id)a8 evaluator:(id)a9 notificationCenter:(id)a10
{
  id v16 = a3;
  id v31 = a4;
  id v30 = a5;
  id v29 = a6;
  id v28 = a7;
  id v27 = a8;
  id v26 = a9;
  id v17 = a10;
  v32.receiver = self;
  v32.super_class = (Class)HMDCameraBulletinNotificationManager;
  id v18 = [(HMDCameraBulletinNotificationManager *)&v32 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_home, v16);
    objc_storeStrong((id *)&v19->_workQueue, a4);
    objc_storeStrong((id *)&v19->_messageDispatcher, a5);
    uint64_t v20 = objc_msgSend(v16, "uuid", v26, v27, v28, v29, v30, v31);
    messageTargetUUID = v19->_messageTargetUUID;
    v19->_messageTargetUUID = (NSUUID *)v20;

    uint64_t v22 = [MEMORY[0x263EFF9A0] dictionary];
    observersByCameraIdentifier = v19->_observersByCameraIdentifier;
    v19->_observersByCameraIdentifier = (NSMutableDictionary *)v22;

    v19->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v19->_accountManager, a6);
    objc_storeStrong((id *)&v19->_faceClassificationResolver, a7);
    objc_storeStrong((id *)&v19->_doorbellPressTracker, a8);
    objc_storeStrong((id *)&v19->_notificationCenter, a10);
    objc_storeStrong((id *)&v19->_evaluator, a9);
    id synchronizeWithPrimaryDebounceTimerFactory = v19->_synchronizeWithPrimaryDebounceTimerFactory;
    v19->_id synchronizeWithPrimaryDebounceTimerFactory = &__block_literal_global_55828;
  }
  return v19;
}

id __173__HMDCameraBulletinNotificationManager_initWithHome_workQueue_messageDispatcher_accountManager_faceClassificationResolver_doorbellPressTracker_evaluator_notificationCenter___block_invoke(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F42658]) initWithTimeInterval:a3 options:a1];
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t97 != -1) {
    dispatch_once(&logCategory__hmf_once_t97, &__block_literal_global_165_55839);
  }
  id v2 = (void *)logCategory__hmf_once_v98;
  return v2;
}

void __51__HMDCameraBulletinNotificationManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v98;
  logCategory__hmf_once_id v98 = v0;
}

+ (id)_cameraReachabilityRegistrationsForSource:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_MKFCameraReachabilityBulletinRegistration fetchRequest];
  id v9 = (void *)MEMORY[0x263F08A98];
  id v10 = [v6 userUUID];
  id v11 = [v6 deviceAddress];
  char v12 = [v11 idsIdentifier];
  uint64_t v13 = [v6 deviceAddress];
  int v14 = [v13 idsDestination];
  uint64_t v15 = [v9 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"user.modelID", v10, @"deviceIdsIdentifier", v12, @"deviceIdsDestination", v14];
  [v8 setPredicate:v15];

  id v24 = 0;
  id v16 = [v7 executeFetchRequest:v8 error:&v24];
  id v17 = v24;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v26 = v22;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch camera reachability bulletin registrations for source: %@", buf, 0x16u);
    }
    id v18 = (id)MEMORY[0x263EFFA68];
  }

  return v18;
}

+ (id)_cameraAccessModeRegistrationsForSource:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_MKFCameraAccessModeBulletinRegistration fetchRequest];
  id v9 = (void *)MEMORY[0x263F08A98];
  id v10 = [v6 userUUID];
  id v11 = [v6 deviceAddress];
  char v12 = [v11 idsIdentifier];
  uint64_t v13 = [v6 deviceAddress];
  int v14 = [v13 idsDestination];
  uint64_t v15 = [v9 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"user.modelID", v10, @"deviceIdsIdentifier", v12, @"deviceIdsDestination", v14];
  [v8 setPredicate:v15];

  id v24 = 0;
  id v16 = [v7 executeFetchRequest:v8 error:&v24];
  id v17 = v24;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v26 = v22;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch camera access mode bulletin registrations for source: %@", buf, 0x16u);
    }
    id v18 = (id)MEMORY[0x263EFFA68];
  }

  return v18;
}

+ (id)_cameraSignificantEventRegistrationsForSource:(id)a3 context:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[_MKFCameraSignificantEventBulletinRegistration fetchRequest];
  id v9 = (void *)MEMORY[0x263F08A98];
  id v10 = [v6 userUUID];
  id v11 = [v6 deviceAddress];
  char v12 = [v11 idsIdentifier];
  uint64_t v13 = [v6 deviceAddress];
  int v14 = [v13 idsDestination];
  uint64_t v15 = [v9 predicateWithFormat:@"(%K == %@) && (%K == %@) && (%K == %@)", @"user.modelID", v10, @"deviceIdsIdentifier", v12, @"deviceIdsDestination", v14];
  [v8 setPredicate:v15];

  id v24 = 0;
  id v16 = [v7 executeFetchRequest:v8 error:&v24];
  id v17 = v24;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    id v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = HMFGetLogIdentifier();
      *(_DWORD *)long long buf = 138543618;
      id v26 = v22;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch camera significant event bulletin registrations for source: %@", buf, 0x16u);
    }
    id v18 = (id)MEMORY[0x263EFFA68];
  }

  return v18;
}

@end