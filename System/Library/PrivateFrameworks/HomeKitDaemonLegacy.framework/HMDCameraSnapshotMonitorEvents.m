@interface HMDCameraSnapshotMonitorEvents
+ (id)logCategory;
- (HMDCameraSnapshotMonitorEvents)initWithSnapshotManager:(id)a3 accessory:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6;
- (HMDCameraSnapshotMonitorEvents)initWithSnapshotManager:(id)a3 accessory:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6 bulletinBoard:(id)a7 notificationCenter:(id)a8;
- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener;
- (NSSet)bulletinSnapshotCharacteristics;
- (NSString)clientIdentifier;
- (NSString)logIdentifier;
- (NSUUID)uniqueIdentifier;
- (OS_dispatch_queue)messageReceiveQueue;
- (id)accessory;
- (id)currentCameraSettings;
- (uint64_t)_canEnableNotificationForCharacteristic:(void *)a3 cameraSettings:;
- (void)_enableNotificationsForCharacteristics:(void *)a3 cameraSettings:;
- (void)_handleUpdatedBulletinSnapshotCharacteristics:(id *)a1;
- (void)_insertUpdateOrRemoveBulletins:(void *)a3 forChangedCharacteristics:(void *)a4 snapshotData:;
- (void)_removeBulletins:(void *)a3 sessionID:;
- (void)_updateHomedRelaunchRegistration;
- (void)dealloc;
- (void)handleBulletinBoardNotificationDidUpdateNotification:(id)a3;
- (void)handleCameraSettingsDidUpdateNotification:(id)a3;
- (void)handleCharacteristicsChangedNotification:(id)a3;
- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4;
- (void)registerForMessages;
- (void)setBulletinSnapshotCharacteristics:(id)a3;
- (void)setCharacteristicsAvailabilityListener:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDCameraSnapshotMonitorEvents

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_characteristicsAvailabilityListener, 0);
  objc_storeStrong((id *)&self->_bulletinSnapshotCharacteristics, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_storeStrong((id *)&self->_notificationRegistration, 0);
  objc_storeStrong((id *)&self->_bulletinBoard, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_bulletinImagesDirectory, 0);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_snapShotNotificationResponseTimers, 0);
  objc_destroyWeak((id *)&self->_snapshotManager);
  objc_storeStrong((id *)&self->_msgDispatcher, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCharacteristicsAvailabilityListener:(id)a3
{
}

- (HMDCharacteristicsAvailabilityListener)characteristicsAvailabilityListener
{
  return (HMDCharacteristicsAvailabilityListener *)objc_getProperty(self, a2, 104, 1);
}

- (void)setBulletinSnapshotCharacteristics:(id)a3
{
}

- (NSSet)bulletinSnapshotCharacteristics
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (OS_dispatch_queue)messageReceiveQueue
{
  if (self)
  {
    self = (HMDCameraSnapshotMonitorEvents *)objc_getProperty(self, a2, 8, 1);
    uint64_t v2 = vars8;
  }
  return (OS_dispatch_queue *)self;
}

- (void)timerDidFire:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    Property = objc_getProperty(self, v4, 8, 1);
  }
  else {
    Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  id v7 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  if (v9)
  {
    v10 = (void *)MEMORY[0x1D9452090]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = HMFGetLogIdentifier();
      v14 = [v9 sessionID];
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      __int16 v32 = 2112;
      v33 = v14;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for %@", buf, 0x16u);
    }
    if (self) {
      id v16 = objc_getProperty(v11, v15, 32, 1);
    }
    else {
      id v16 = 0;
    }
    if ([v16 containsObject:v9])
    {
      v17 = (void *)MEMORY[0x1D9452090]();
      v18 = v11;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = HMFGetLogIdentifier();
        v21 = [v9 sessionID];
        *(_DWORD *)buf = 138543618;
        v31 = v20;
        __int16 v32 = 2112;
        v33 = v21;
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, "%{public}@Posting notification as timer has expired for snapshot session %@", buf, 0x16u);
      }
      objc_initWeak((id *)buf, v18);
      if (self) {
        id v23 = objc_getProperty(v18, v22, 64, 1);
      }
      else {
        id v23 = 0;
      }
      id v24 = v23;
      v25 = [v9 changedCharacteristics];
      v26 = [v25 allObjects];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __47__HMDCameraSnapshotMonitorEvents_timerDidFire___block_invoke;
      v27[3] = &unk_1E6A191F8;
      objc_copyWeak(&v29, (id *)buf);
      id v28 = v9;
      [v24 insertImageBulletinsForChangedCharacteristics:v26 snapshotData:0 completion:v27];

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __47__HMDCameraSnapshotMonitorEvents_timerDidFire___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  self = objc_loadWeakRetained(v3);
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v8 = v5;
  if (self)
  {
    Property = objc_getProperty(self, v7, 8, 1);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HMDCameraSnapshotMonitorEvents__processPostedBulletin_responseTimer___block_invoke;
    block[3] = &unk_1E6A19668;
    id v12 = v6;
    id v13 = self;
    id v14 = v8;
    dispatch_async(Property, block);
  }
}

void __71__HMDCameraSnapshotMonitorEvents__processPostedBulletin_responseTimer___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a1[4] count])
  {
    id Property = a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v2, 32, 1);
    }
    char v4 = [Property containsObject:a1[6]];
    id v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = a1[5];
    id v7 = HMFGetOSLogHandle();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v8)
      {
        id v9 = HMFGetLogIdentifier();
        v10 = [a1[6] sessionID];
        int v21 = 138543618;
        v22 = v9;
        __int16 v23 = 2112;
        id v24 = v10;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating the posted bulletin for %@", (uint8_t *)&v21, 0x16u);
      }
      [a1[6] setPostedBulletins:a1[4]];
    }
    else
    {
      if (v8)
      {
        id v16 = HMFGetLogIdentifier();
        v17 = [a1[6] sessionID];
        int v21 = 138543618;
        v22 = v16;
        __int16 v23 = 2112;
        id v24 = v17;
        _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Timer has been already removed for %@, removing the posted bulletin", (uint8_t *)&v21, 0x16u);
      }
      id v19 = a1[4];
      id v18 = a1[5];
      v20 = [a1[6] sessionID];
      -[HMDCameraSnapshotMonitorEvents _removeBulletins:sessionID:](v18, v19, v20);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1[5];
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      v15 = [a1[6] sessionID];
      int v21 = 138543618;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@No bulletins were posted for snapshot %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)_removeBulletins:(void *)a3 sessionID:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v17 = a3;
  if (a1)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v5;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1D9452090]();
          id v12 = a1;
          id v13 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543874;
            id v24 = v14;
            __int16 v25 = 2112;
            uint64_t v26 = v10;
            __int16 v27 = 2112;
            id v28 = v17;
            _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@A bulletin with recordID %@ has already been posted for snapshot session %@, removing it", buf, 0x20u);
          }
          objc_msgSend(objc_getProperty(v12, v15, 64, 1), "removeBulletinWithRecordID:", v10);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
      }
      while (v7);
    }

    id v5 = v16;
  }
}

- (void)handleCameraSettingsDidUpdateNotification:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 8, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__HMDCameraSnapshotMonitorEvents_handleCameraSettingsDidUpdateNotification___block_invoke;
  v8[3] = &unk_1E6A197C8;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __76__HMDCameraSnapshotMonitorEvents_handleCameraSettingsDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  v3 = [v2 objectForKeyedSubscript:@"HMDCameraProfileSettingsNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  id v5 = v4;

  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) characteristicsAvailabilityListener];
    id v7 = [v6 availableCharacteristics];

    uint64_t v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera user settings changed.", (uint8_t *)&v12, 0xCu);
    }
    -[HMDCameraSnapshotMonitorEvents _enableNotificationsForCharacteristics:cameraSettings:](*(void **)(a1 + 40), v7, v5);
  }
}

- (void)_enableNotificationsForCharacteristics:(void *)a3 cameraSettings:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id Property = objc_getProperty(a1, v6, 8, 1);
    dispatch_assert_queue_V2(Property);
    id v9 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v10 = &OBJC_IVAR___HMDActionSetEvent__clientMetricIdentifier;
    objc_msgSend(objc_getProperty(a1, v11, 56, 1), "removeObserver:name:object:", a1, @"HMDBulletinBoardNotificationDidUpdateNotification", 0);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v28 = v5;
    id v12 = v5;
    uint64_t v32 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v34;
      id v29 = v9;
      id v30 = v12;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v34 != v31) {
            objc_enumerationMutation(v12);
          }
          uint64_t v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          SEL v15 = [v14 service];
          id v16 = [v15 bulletinBoardNotification];

          objc_msgSend(objc_getProperty(a1, v17, v10[770], 1), "addObserver:selector:name:object:", a1, sel_handleBulletinBoardNotificationDidUpdateNotification_, @"HMDBulletinBoardNotificationDidUpdateNotification", v16);
          if ([v16 isEnabled]
            && -[HMDCameraSnapshotMonitorEvents _canEnableNotificationForCharacteristic:cameraSettings:](a1, v14, v7))
          {
            id v18 = (void *)MEMORY[0x1D9452090]();
            id v19 = a1;
            long long v20 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v22 = id v21 = v7;
              *(_DWORD *)buf = 138543618;
              v38 = v22;
              __int16 v39 = 2112;
              v40 = v14;
              _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin snapshot characteristic: %@", buf, 0x16u);

              id v7 = v21;
              id v9 = v29;
            }

            [v9 addObject:v14];
            uint64_t v10 = &OBJC_IVAR___HMDActionSetEvent__clientMetricIdentifier;
            id v12 = v30;
          }
        }
        uint64_t v32 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v32);
    }

    __int16 v23 = [a1 bulletinSnapshotCharacteristics];
    uint64_t v24 = [v23 count];
    if (v24 == [v9 count])
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)a1, v9);
      id v5 = v28;
LABEL_21:

      goto LABEL_22;
    }
    __int16 v25 = [a1 bulletinSnapshotCharacteristics];
    if ([v25 count])
    {
      uint64_t v26 = [v9 count];

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)a1, v9);
      id v5 = v28;
      if (v26) {
        goto LABEL_21;
      }
    }
    else
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)a1, v9);
      id v5 = v28;
    }
    [(HMDCameraSnapshotMonitorEvents *)a1 _updateHomedRelaunchRegistration];
    goto LABEL_21;
  }
LABEL_22:
}

- (uint64_t)_canEnableNotificationForCharacteristic:(void *)a3 cameraSettings:
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  id v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = a1;
  SEL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v55 = 138543618;
    v56 = v12;
    __int16 v57 = 2112;
    id v58 = v5;
    _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Checking if bulletin notification can be enabled for characteristic: %@", (uint8_t *)&v55, 0x16u);
  }
  id v13 = v5;
  self;
  uint64_t v14 = [v13 type];
  if ([v14 isEqualToString:*MEMORY[0x1E4F2CF08]])
  {
    SEL v15 = [v13 service];
    id v16 = [v15 type];
    int v17 = [v16 isEqualToString:*MEMORY[0x1E4F2DE20]];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x1D9452090]();
      id v19 = v10;
      long long v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        id v21 = HMFGetLogIdentifier();
        int v55 = 138543362;
        v56 = v21;
        long long v22 = "%{public}@Allowing notifications to be enabled for doorbell characteristic";
        __int16 v23 = v20;
        os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
LABEL_27:
        _os_log_impl(&dword_1D49D5000, v23, v24, v22, (uint8_t *)&v55, 0xCu);

        goto LABEL_28;
      }
      goto LABEL_28;
    }
  }
  else
  {
  }
  id v25 = v13;
  self;
  uint64_t v26 = [v25 type];
  if (([v26 isEqualToString:*MEMORY[0x1E4F2CF38]] & 1) == 0)
  {

    goto LABEL_21;
  }
  __int16 v27 = [v25 service];
  id v28 = [v27 type];
  char v29 = [v28 isEqualToString:*MEMORY[0x1E4F2DE98]];

  if ((v29 & 1) == 0)
  {
LABEL_21:
    v44 = (void *)MEMORY[0x1D9452090]();
    v45 = v10;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      v47 = HMFGetLogIdentifier();
      int v55 = 138543362;
      v56 = v47;
      _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Disallowing notifications to be enabled for non-doorbell, non-motion characteristic", (uint8_t *)&v55, 0xCu);
    }
    goto LABEL_24;
  }
  if (v10) {
    id WeakRetained = objc_loadWeakRetained(v10 + 5);
  }
  else {
    id WeakRetained = 0;
  }
  char v31 = [WeakRetained isCameraRecordingFeatureSupported];

  if ((v31 & 1) == 0)
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    id v19 = v10;
    long long v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = HMFGetLogIdentifier();
      int v55 = 138543362;
      v56 = v21;
      long long v22 = "%{public}@Allowing notifications to be enabled because recording is not supported for this camera";
      __int16 v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_INFO;
      goto LABEL_27;
    }
LABEL_28:

    uint64_t v48 = 1;
    goto LABEL_29;
  }
  [v6 currentAccessMode];
  if ((HMIsMotionDetectionAllowedForCameraAccessMode() & 1) == 0)
  {
    v44 = (void *)MEMORY[0x1D9452090]();
    v45 = v10;
    v50 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = HMFGetLogIdentifier();
      v52 = HMCameraAccessModeAsString();
      int v55 = 138543618;
      v56 = v51;
      __int16 v57 = 2112;
      id v58 = v52;
      _os_log_impl(&dword_1D49D5000, v50, OS_LOG_TYPE_INFO, "%{public}@Disallowing notifications to be enabled because the camera's current access mode disallows motion detection: %@", (uint8_t *)&v55, 0x16u);
    }
LABEL_24:

    uint64_t v48 = 0;
    goto LABEL_29;
  }
  uint64_t v32 = [v6 notificationSettings];
  long long v33 = (void *)MEMORY[0x1E4F2E6C8];
  long long v34 = [v32 smartBulletinBoardNotificationCondition];
  long long v35 = [v33 significantEventTypesInPredicate:v34];
  uint64_t v36 = [v35 integerValue];

  uint64_t v37 = [v32 isSmartBulletinBoardNotificationEnabled];
  if (v36) {
    int v38 = v37;
  }
  else {
    int v38 = 0;
  }
  __int16 v39 = (void *)MEMORY[0x1D9452090](v37);
  v40 = v10;
  v41 = HMFGetOSLogHandle();
  BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_INFO);
  if (v38 == 1)
  {
    if (v42)
    {
      v43 = HMFGetLogIdentifier();
      int v55 = 138543618;
      v56 = v43;
      __int16 v57 = 2112;
      id v58 = v32;
      _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Disallowing notifications to be enabled because smart notifications are enabled: %@", (uint8_t *)&v55, 0x16u);
    }
  }
  else if (v42)
  {
    v53 = HMFGetLogIdentifier();
    v54 = HMCameraAccessModeAsString();
    int v55 = 138543874;
    v56 = v53;
    __int16 v57 = 2112;
    id v58 = v54;
    __int16 v59 = 2112;
    v60 = v32;
    _os_log_impl(&dword_1D49D5000, v41, OS_LOG_TYPE_INFO, "%{public}@Allowing notifications to be enabled for current access mode: %@, notification settings: %@", (uint8_t *)&v55, 0x20u);
  }
  uint64_t v48 = v38 ^ 1u;

LABEL_29:
  return v48;
}

- (void)_handleUpdatedBulletinSnapshotCharacteristics:(id *)a1
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id Property = objc_getProperty(a1, v4, 8, 1);
  dispatch_assert_queue_V2(Property);
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  SEL v7 = [a1 characteristicsAvailabilityListener];
  uint64_t v8 = [v7 availableCharacteristics];

  BOOL v42 = v8;
  v43 = v3;
  objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v3);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        uint64_t v14 = (void *)MEMORY[0x1D9452090]();
        SEL v15 = a1;
        id v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v17 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          id v58 = v17;
          __int16 v59 = 2112;
          id v60 = v13;
          _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_INFO, "%{public}@Disabling notifications for characteristic: %@", buf, 0x16u);
        }
        v56 = v13;
        id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
        id v19 = [v15 clientIdentifier];
        [WeakRetained setNotificationsEnabled:0 forCharacteristics:v18 clientIdentifier:v19];
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v10);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v20 = v43;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v47;
    do
    {
      uint64_t v24 = 0;
      uint64_t v44 = v22;
      do
      {
        if (*(void *)v47 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v46 + 1) + 8 * v24);
        uint64_t v26 = [a1 bulletinSnapshotCharacteristics];
        char v27 = [v26 containsObject:v25];

        if ((v27 & 1) == 0)
        {
          id v28 = (void *)MEMORY[0x1D9452090]();
          char v29 = a1;
          id v30 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            char v31 = a1;
            uint64_t v32 = v23;
            id v33 = WeakRetained;
            v35 = id v34 = v20;
            *(_DWORD *)buf = 138543618;
            id v58 = v35;
            __int16 v59 = 2112;
            id v60 = v25;
            _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Enabling notifications for characteristic: %@", buf, 0x16u);

            id v20 = v34;
            id WeakRetained = v33;
            uint64_t v23 = v32;
            a1 = v31;
            uint64_t v22 = v44;
          }

          v54 = v25;
          uint64_t v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
          uint64_t v37 = [v29 clientIdentifier];
          [WeakRetained setNotificationsEnabled:1 forCharacteristics:v36 clientIdentifier:v37];
        }
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v22);
  }

  int v38 = (void *)MEMORY[0x1D9452090]();
  __int16 v39 = a1;
  v40 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v58 = v41;
    __int16 v59 = 2112;
    id v60 = v20;
    _os_log_impl(&dword_1D49D5000, v40, OS_LOG_TYPE_INFO, "%{public}@Setting the bulletin snapshot characteristics to %@", buf, 0x16u);
  }
  [v39 setBulletinSnapshotCharacteristics:v20];
}

- (void)_updateHomedRelaunchRegistration
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id Property = objc_getProperty(a1, a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  SEL v4 = [a1 bulletinSnapshotCharacteristics];
  uint64_t v5 = [v4 count];

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = a1;
  uint64_t v8 = HMFGetOSLogHandle();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = HMFGetLogIdentifier();
      int v14 = 138543362;
      SEL v15 = v10;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering homed for relaunch", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = +[HMDLaunchHandler sharedHandler];
    id v12 = [v7 uniqueIdentifier];
    [v11 registerRelaunchClientWithUUID:v12];
  }
  else
  {
    if (v9)
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      SEL v15 = v13;
      _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Deregistering homed for relaunch", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = +[HMDLaunchHandler sharedHandler];
    id v12 = [v7 uniqueIdentifier];
    [v11 deregisterRelaunchClientWithUUID:v12];
  }
}

- (id)accessory
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 5);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)handleCharacteristicsChangedNotification:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 8, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraSnapshotMonitorEvents_handleCharacteristicsChangedNotification___block_invoke;
  v8[3] = &unk_1E6A197C8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __75__HMDCameraSnapshotMonitorEvents_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  id v26 = v2;
  if (v1)
  {
    id v25 = [v2 objectForKeyedSubscript:@"kModifiedCharacteristicsMapKey"];
    id v3 = objc_msgSend(v26, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
    SEL v4 = [MEMORY[0x1E4F1CA80] set];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      uint64_t v9 = *MEMORY[0x1E4F2CF38];
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v12 = [v1 bulletinSnapshotCharacteristics];
          int v13 = [v12 containsObject:v11];

          if (v13)
          {
            int v14 = [v11 type];
            int v15 = [v14 isEqualToString:v9];

            if (!v15
              || ([v11 value],
                  uint64_t v16 = objc_claimAutoreleasedReturnValue(),
                  int v17 = [v16 BOOLValue],
                  v16,
                  v17))
            {
              [v4 addObject:v11];
            }
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v7);
    }

    if (![v4 count]) {
      goto LABEL_20;
    }
    id v18 = objc_msgSend(v26, "hmf_dictionaryForKey:", @"kPresenceDictionaryForNotificationKey");
    id v19 = objc_msgSend(v26, "hmf_dictionaryForKey:", @"kPresencePairingIdentifierDictionaryForNotificationKey");
    if (v19)
    {
      id v20 = [[HMDHomePresenceRemote alloc] initWithPresenceByPairingIdentity:v19];
    }
    else
    {
      if (!v18)
      {
        uint64_t v21 = 0;
        goto LABEL_19;
      }
      id v20 = [[HMDHomePresenceRemote alloc] initWithPresenceByUserId:v18];
    }
    uint64_t v21 = v20;
LABEL_19:
    id WeakRetained = objc_loadWeakRetained(v1 + 5);
    uint64_t v23 = [WeakRetained home];
    uint64_t v24 = [v4 allObjects];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __71__HMDCameraSnapshotMonitorEvents__handleCharacteristicsChangedPayload___block_invoke;
    v27[3] = &unk_1E6A14DC8;
    void v27[4] = v1;
    id v28 = v25;
    [v23 evaluateNotificationConditionForCharacteristics:v24 homePresence:v21 completion:v27];

LABEL_20:
    id v2 = v26;
  }
}

void __71__HMDCameraSnapshotMonitorEvents__handleCharacteristicsChangedPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  SEL v4 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v45 = a3;
  id v5 = v3;
  if (v4)
  {
    uint64_t v44 = [MEMORY[0x1E4F1CAD0] setWithArray:v45];
    uint64_t v6 = v44;
    if ([v44 count])
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v7 = v44;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v61 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v48;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = [v5 objectForKey:*(void *)(*((void *)&v47 + 1) + 8 * v10)];
          id v12 = [v11 updateIdentifier];
          if (v12)
          {
            int v13 = [v11 remoteDevice];
            BOOL v14 = v13 == 0;

            if (!v14) {
              break;
            }
          }

          if (v8 == ++v10)
          {
            uint64_t v8 = [v7 countByEnumeratingWithState:&v47 objects:v61 count:16];
            if (v8) {
              goto LABEL_5;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:
        uint64_t v11 = 0;
      }

      int v15 = (void *)MEMORY[0x1D9452090]();
      uint64_t v16 = v4;
      int v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v18;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Taking a snapshot as the update characteristic %@ is being monitored", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained(v16 + 3);
      id v19 = objc_loadWeakRetained(v16 + 5);
      if ([v19 isReachable]) {
        double v20 = 7.0;
      }
      else {
        double v20 = 15.0;
      }

      uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      v43 = [v21 UUIDString];

      uint64_t v22 = [[HMDCameraSnapshotNotificationTimer alloc] initWithCameraSessionID:v43 changedCharacteristics:v7 timeInterval:v20];
      [(HMFTimer *)v22 setDelegate:v16];
      [(HMFTimer *)v22 setDelegateQueue:objc_getProperty(v16, v23, 8, 1)];
      objc_msgSend(objc_getProperty(v16, v24, 32, 1), "addObject:", v22);
      id v25 = [MEMORY[0x1E4F1CA60] dictionary];
      [v25 setObject:v43 forKeyedSubscript:@"kCameraSessionID"];
      if (v11)
      {
        id v26 = [v11 updateIdentifier];
        [v25 setObject:v26 forKeyedSubscript:@"kCameraProactiveSessionID"];

        char v27 = [v11 remoteDevice];
        [v25 setObject:v27 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
      }
      id v28 = (void *)MEMORY[0x1D9452090]([v25 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F2CD10]]);
      long long v29 = v16;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v25;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_INFO, "%{public}@Notification payload is: %@", buf, 0x16u);
      }
      objc_initWeak(&location, v29);
      long long v32 = (void *)MEMORY[0x1E4F65480];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __82__HMDCameraSnapshotMonitorEvents__characteristicsUpdated_modifiedCharacteristics___block_invoke;
      v56 = &unk_1E6A14860;
      objc_copyWeak(&v60, &location);
      uint64_t v33 = *MEMORY[0x1E4F2CD28];
      id v34 = v25;
      id v57 = v34;
      id v58 = v7;
      long long v35 = v22;
      __int16 v59 = v35;
      uint64_t v36 = [v32 messageWithName:v33 messagePayload:v34 responseHandler:buf];
      uint64_t v37 = (void *)MEMORY[0x1D9452090]([WeakRetained takeSnapshot:v36]);
      int v38 = v29;
      HMFGetOSLogHandle();
      __int16 v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        v41 = [(HMDCameraSnapshotNotificationTimer *)v35 sessionID];
        *(_DWORD *)long long v51 = 138543618;
        id v52 = v40;
        __int16 v53 = 2112;
        v54 = v41;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_INFO, "%{public}@Starting the notification timer for identifier %@", v51, 0x16u);
      }
      [(HMFTimer *)v35 resume];

      objc_destroyWeak(&v60);
      objc_destroyWeak(&location);

      uint64_t v6 = v44;
    }
  }
}

void __82__HMDCameraSnapshotMonitorEvents__characteristicsUpdated_modifiedCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v5 = (id *)(a1 + 56);
  id v6 = a3;
  id v7 = a2;
  self = (id *)objc_loadWeakRetained(v5);
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"kCameraSessionID"];
  uint64_t v10 = *(void **)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  id v11 = v7;
  id v12 = v8;
  id v13 = v10;
  id v14 = v6;
  id v15 = v9;
  if (self)
  {
    if (v11)
    {
      uint64_t v16 = (void *)MEMORY[0x1D9452090]();
      int v17 = self;
      id v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v68 = v19;
        __int16 v69 = 2112;
        id v70 = v12;
        __int16 v71 = 2112;
        id v72 = v11;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to take a snapshot for session ID %@ with error %@", buf, 0x20u);
      }
      id WeakRetained = [v15 postedBulletins];
      uint64_t v21 = [v13 allObjects];
      -[HMDCameraSnapshotMonitorEvents _insertUpdateOrRemoveBulletins:forChangedCharacteristics:snapshotData:](v17, WeakRetained, v21, 0);
    }
    else
    {
      v64 = v15;
      id WeakRetained = objc_loadWeakRetained(self + 3);
      id v58 = v14;
      uint64_t v62 = *MEMORY[0x1E4F2EE88];
      uint64_t v21 = objc_msgSend(v14, "objectForKeyedSubscript:");
      uint64_t v22 = [v21 lastPathComponent];
      id Property = objc_getProperty(self, v23, 48, 1);
      id v25 = NSString;
      id v26 = Property;
      uint64_t v61 = (void *)v22;
      char v27 = [v25 stringWithFormat:@"%@_%@.%@", v22, v12, @"jpg"];
      uint64_t v28 = [v26 stringByAppendingPathComponent:v27];

      long long v29 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v66 = 0;
      LOBYTE(v26) = [v29 linkItemAtPath:v21 toPath:v28 error:&v66];
      id v30 = v66;

      id v57 = v30;
      if (v26)
      {
        long long v31 = (void *)v28;
      }
      else
      {
        long long v32 = (void *)v28;
        id v59 = v13;
        id v33 = v12;
        id v34 = (void *)MEMORY[0x1D9452090]();
        long long v35 = self;
        uint64_t v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v68 = v37;
          __int16 v69 = 2112;
          id v70 = v32;
          __int16 v71 = 2112;
          id v72 = v21;
          __int16 v73 = 2112;
          id v74 = v30;
          _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hard link: %@ to file at path %@ with error %@", buf, 0x2Au);
        }

        long long v31 = 0;
        id v12 = v33;
        id v13 = v59;
      }
      int v38 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v39 = *MEMORY[0x1E4F2E160];
      id v14 = v58;
      id v40 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F2E160]];
      [v38 setObject:v40 forKeyedSubscript:v39];

      id v60 = v31;
      [v38 setObject:v31 forKeyedSubscript:v62];
      id v63 = v12;
      [v38 setObject:v12 forKeyedSubscript:@"kCameraSessionID"];
      uint64_t v41 = *MEMORY[0x1E4F2EE80];
      BOOL v42 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F2EE80]];
      [v38 setObject:v42 forKeyedSubscript:v41];

      v43 = [WeakRetained uniqueIdentifier];
      [v38 setObject:v43 forKeyedSubscript:@"HM.accessoryProfileUUID"];

      uint64_t v44 = (void *)MEMORY[0x1D9452090]();
      id v45 = self;
      long long v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        long long v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        __int16 v69 = 2112;
        id v70 = v58;
        _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@Took snapshot with response %@", buf, 0x16u);
      }
      long long v48 = [v64 postedBulletins];
      long long v49 = [v13 allObjects];
      -[HMDCameraSnapshotMonitorEvents _insertUpdateOrRemoveBulletins:forChangedCharacteristics:snapshotData:](v45, v48, v49, v38);

      long long v50 = [v58 objectForKeyedSubscript:*MEMORY[0x1E4F2E028]];
      long long v51 = (void *)MEMORY[0x1D9452090]();
      id v52 = v45;
      __int16 v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        int v55 = v54 = v13;
        *(_DWORD *)buf = 138543618;
        v68 = v55;
        __int16 v69 = 2112;
        id v70 = v50;
        _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot with slot identifier: %@", buf, 0x16u);

        id v13 = v54;
        id v11 = 0;
      }

      [WeakRetained releaseSnapshotWithSlotIdentifier:v50];

      id v12 = v63;
      id v15 = v64;
    }

    objc_msgSend(objc_getProperty(self, v56, 32, 1), "removeObject:", v15);
  }
}

- (void)_insertUpdateOrRemoveBulletins:(void *)a3 forChangedCharacteristics:(void *)a4 snapshotData:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id Property = objc_getProperty(a1, v10, 64, 1);
  if (v7)
  {
    if (objc_opt_respondsToSelector())
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v7;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v13)
      {
        uint64_t v15 = v13;
        uint64_t v16 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8 * i);
            id v19 = objc_getProperty(a1, v14, 64, 1);
            objc_msgSend(v19, "updateBulletinWithRecordID:forChangedCharacteristics:snapshotData:", v18, v8, v9, (void)v20);
          }
          uint64_t v15 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v15);
      }
    }
    else
    {
      id v12 = [v9 objectForKeyedSubscript:@"kCameraSessionID"];
      -[HMDCameraSnapshotMonitorEvents _removeBulletins:sessionID:](a1, v7, v12);
    }
  }
  else
  {
    [Property insertImageBulletinsForChangedCharacteristics:v8 snapshotData:v9 completion:0];
  }
}

- (void)handleBulletinBoardNotificationDidUpdateNotification:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 8, 1);
  }
  else {
    id Property = 0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__HMDCameraSnapshotMonitorEvents_handleBulletinBoardNotificationDidUpdateNotification___block_invoke;
  v8[3] = &unk_1E6A197C8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __87__HMDCameraSnapshotMonitorEvents_handleBulletinBoardNotificationDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  id v3 = v2;
  if (v1)
  {
    SEL v4 = [v2 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;

    id v7 = (void *)MEMORY[0x1D9452090]();
    id v39 = v1;
    id v8 = HMFGetOSLogHandle();
    id v9 = v8;
    if (!v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        long long v32 = HMFGetLogIdentifier();
        id v33 = [v3 object];
        *(_DWORD *)buf = 138543618;
        long long v50 = v32;
        __int16 v51 = 2112;
        id v52 = v33;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected notifier for HMDBulletinBoardNotificationDidUpdateNotification: %@", buf, 0x16u);
      }
      goto LABEL_33;
    }
    int v38 = v3;
    SEL v10 = v39;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v50 = v11;
      __int16 v51 = 2112;
      id v52 = v6;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated bulletin board notification: %@", buf, 0x16u);
    }
    id v12 = [v39 characteristicsAvailabilityListener];
    uint64_t v13 = [v12 availableCharacteristics];

    id v14 = [v39 bulletinSnapshotCharacteristics];
    uint64_t v15 = (void *)[v14 mutableCopy];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v13;
    uint64_t v16 = [obj countByEnumeratingWithState:&v41 objects:buf count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(obj);
          }
          long long v20 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          long long v21 = [v6 service];
          long long v22 = [v21 characteristics];
          int v23 = [v22 containsObject:v20];

          if (v23)
          {
            if ([v6 isEnabled]
              && (-[HMDCameraSnapshotMonitorEvents currentCameraSettings]((uint64_t)v10),
                  SEL v24 = objc_claimAutoreleasedReturnValue(),
                  int v25 = -[HMDCameraSnapshotMonitorEvents _canEnableNotificationForCharacteristic:cameraSettings:](v10, v20, v24), v24, v25))
            {
              id v26 = (void *)MEMORY[0x1D9452090]();
              id v27 = v10;
              uint64_t v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                long long v29 = HMFGetLogIdentifier();
                *(_DWORD *)id v45 = 138543618;
                long long v46 = v29;
                __int16 v47 = 2112;
                long long v48 = v20;
                _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin snapshot characteristic: %@", v45, 0x16u);

                SEL v10 = v39;
              }

              [v15 addObject:v20];
            }
            else
            {
              [v15 removeObject:v20];
            }
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v41 objects:buf count:16];
      }
      while (v17);
    }

    id v30 = [v10 bulletinSnapshotCharacteristics];
    uint64_t v31 = [v30 count];
    if (v31 == [v15 count])
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:]((id *)v10, v15);
      id v3 = v38;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    id v34 = [v10 bulletinSnapshotCharacteristics];
    long long v35 = (id *)v10;
    id v3 = v38;
    if ([v34 count])
    {
      uint64_t v36 = [v15 count];

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:](v35, v15);
      if (v36) {
        goto LABEL_32;
      }
    }
    else
    {

      -[HMDCameraSnapshotMonitorEvents _handleUpdatedBulletinSnapshotCharacteristics:](v35, v15);
    }
    [(HMDCameraSnapshotMonitorEvents *)v35 _updateHomedRelaunchRegistration];
    goto LABEL_32;
  }
LABEL_34:
}

- (id)currentCameraSettings
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v2 = [WeakRetained cameraProfiles];
    id v3 = [v2 anyObject];
    SEL v4 = [v3 currentSettings];
  }
  else
  {
    SEL v4 = 0;
  }
  return v4;
}

- (void)listener:(id)a3 didUpdateAvailableCharacteristics:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 8, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  SEL v10 = (void *)MEMORY[0x1D9452090]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v13;
    _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_INFO, "%{public}@Available characteristics changed", (uint8_t *)&v15, 0xCu);
  }
  id v14 = -[HMDCameraSnapshotMonitorEvents currentCameraSettings]((uint64_t)v11);
  -[HMDCameraSnapshotMonitorEvents _enableNotificationsForCharacteristics:cameraSettings:](v11, v8, v14);
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1D9452090](self, a2);
  SEL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_1D49D5000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);
  }
  if (v4)
  {
    objc_msgSend(objc_getProperty(v4, v7, 16, 1), "deregisterReceiver:", v4);
    id Property = objc_getProperty(v4, v8, 56, 1);
  }
  else
  {
    [0 deregisterReceiver:0];
    id Property = 0;
  }
  [Property removeObserver:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&v4->_accessory);
  id v11 = [(NSSet *)v4->_bulletinSnapshotCharacteristics allObjects];
  [WeakRetained setNotificationsEnabled:0 forCharacteristics:v11 clientIdentifier:v4->_clientIdentifier];

  v12.receiver = v4;
  v12.super_class = (Class)HMDCameraSnapshotMonitorEvents;
  [(HMDCameraSnapshotMonitorEvents *)&v12 dealloc];
}

- (void)registerForMessages
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = -[HMDCameraSnapshotMonitorEvents accessory]((id *)&self->super.super.isa);
  SEL v4 = [(HMDCameraSnapshotMonitorEvents *)self characteristicsAvailabilityListener];
  [v4 setDelegate:self];

  id v5 = [(HMDCameraSnapshotMonitorEvents *)self characteristicsAvailabilityListener];
  [v5 start];

  if (self && objc_getProperty(self, v6, 64, 1))
  {
    objc_msgSend(objc_getProperty(self, v7, 56, 1), "addObserver:selector:name:object:", self, sel_handleCharacteristicsChangedNotification_, @"HMDAccessoryCharacteristicsChangedNotification", v3);
  }
  else
  {
    id v9 = (void *)MEMORY[0x1D9452090]();
    SEL v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_super v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      __int16 v15 = v12;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@No bulletin board, not subscribing for notifications for doorbell or motion sensor", (uint8_t *)&v14, 0xCu);
    }
    if (!self)
    {
      id Property = 0;
      goto LABEL_8;
    }
  }
  id Property = objc_getProperty(self, v8, 72, 1);
LABEL_8:
  [Property addObserver:sel_handleCameraSettingsDidUpdateNotification_ name:@"HMDCameraProfileSettingsDidChangeNotification" object:v3];
}

- (HMDCameraSnapshotMonitorEvents)initWithSnapshotManager:(id)a3 accessory:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6 bulletinBoard:(id)a7 notificationCenter:(id)a8
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v53 = a8;
  v54.receiver = self;
  v54.super_class = (Class)HMDCameraSnapshotMonitorEvents;
  id v19 = [(HMDCameraSnapshotMonitorEvents *)&v54 init];
  long long v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_snapshotManager, v14);
    objc_storeWeak((id *)&v20->_accessory, v15);
    objc_storeStrong((id *)&v20->_workQueue, a5);
    objc_storeStrong((id *)&v20->_msgDispatcher, a6);
    objc_storeStrong((id *)&v20->_notificationCenter, a8);
    uint64_t v21 = [MEMORY[0x1E4F1CA80] set];
    snapShotNotificationResponseTimers = v20->_snapShotNotificationResponseTimers;
    v20->_snapShotNotificationResponseTimers = (NSMutableSet *)v21;

    int v23 = (void *)MEMORY[0x1E4F29128];
    SEL v24 = [v14 uniqueIdentifier];
    v57[0] = @"HMDCameraSnapshotMonitorEvents";
    int v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    uint64_t v26 = objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v24, 0, v25);
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = (NSUUID *)v26;

    uint64_t v28 = NSString;
    long long v29 = [v15 name];
    id v30 = [(NSUUID *)v20->_uniqueIdentifier UUIDString];
    uint64_t v31 = [v28 stringWithFormat:@"%@/%@", v29, v30];
    logIdentifier = v20->_logIdentifier;
    v20->_logIdentifier = (NSString *)v31;

    if (v18)
    {
      objc_storeStrong((id *)&v20->_bulletinBoard, a7);
      id v33 = getBulletinImagesPath();
      id v34 = [v15 uuid];
      long long v35 = [v34 UUIDString];
      uint64_t v36 = [v33 stringByAppendingPathComponent:v35];
      bulletinImagesDirectory = v20->_bulletinImagesDirectory;
      v20->_bulletinImagesDirectory = (NSString *)v36;

      createDirectory(v20->_bulletinImagesDirectory);
    }
    uint64_t v38 = [MEMORY[0x1E4F1CAD0] set];
    bulletinSnapshotCharacteristics = v20->_bulletinSnapshotCharacteristics;
    v20->_bulletinSnapshotCharacteristics = (NSSet *)v38;

    id v40 = [[HMDNotificationRegistration alloc] initWithRegisterer:v20];
    notificationRegistration = v20->_notificationRegistration;
    v20->_notificationRegistration = v40;

    v55[0] = *MEMORY[0x1E4F2DE98];
    long long v42 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CF38]];
    v56[0] = v42;
    v55[1] = *MEMORY[0x1E4F2DE20];
    long long v43 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F2CF08]];
    v56[1] = v43;
    long long v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v56 forKeys:v55 count:2];

    id v45 = [[HMDCharacteristicsAvailabilityListener alloc] initWithAccessory:v15 workQueue:v16 interestedCharacteristicTypesByServiceType:v44];
    characteristicsAvailabilityListener = v20->_characteristicsAvailabilityListener;
    v20->_characteristicsAvailabilityListener = v45;

    __int16 v47 = NSString;
    long long v48 = [MEMORY[0x1E4F29128] UUID];
    long long v49 = [v48 UUIDString];
    uint64_t v50 = [v47 stringWithFormat:@"%@.%@", @"com.apple.HomeKitDaemon.serviceGroupAssociation", v49];
    clientIdentifier = v20->_clientIdentifier;
    v20->_clientIdentifier = (NSString *)v50;
  }
  return v20;
}

- (HMDCameraSnapshotMonitorEvents)initWithSnapshotManager:(id)a3 accessory:(id)a4 workQueue:(id)a5 msgDispatcher:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[HMDCameraProfile bulletinBoard];
  id v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v16 = [(HMDCameraSnapshotMonitorEvents *)self initWithSnapshotManager:v13 accessory:v12 workQueue:v11 msgDispatcher:v10 bulletinBoard:v14 notificationCenter:v15];

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t36 != -1) {
    dispatch_once(&logCategory__hmf_once_t36, &__block_literal_global_101127);
  }
  id v2 = (void *)logCategory__hmf_once_v37;
  return v2;
}

uint64_t __45__HMDCameraSnapshotMonitorEvents_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v37;
  logCategory__hmf_once_uint64_t v37 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end