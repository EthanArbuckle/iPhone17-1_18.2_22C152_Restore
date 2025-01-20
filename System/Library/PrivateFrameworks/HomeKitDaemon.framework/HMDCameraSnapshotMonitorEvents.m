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
- (void)_characteristicsUpdated:(void *)a3 modifiedCharacteristics:;
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
  uint64_t v34 = *MEMORY[0x263EF8340];
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
    v10 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Timer did fire for %@", buf, 0x16u);
    }
    if (self) {
      id v16 = objc_getProperty(v11, v15, 32, 1);
    }
    else {
      id v16 = 0;
    }
    if ([v16 containsObject:v9])
    {
      v17 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Posting notification as timer has expired for snapshot session %@", buf, 0x16u);
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
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __47__HMDCameraSnapshotMonitorEvents_timerDidFire___block_invoke;
      v27[3] = &unk_264A2E9D0;
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
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __71__HMDCameraSnapshotMonitorEvents__processPostedBulletin_responseTimer___block_invoke;
    block[3] = &unk_264A2F2F8;
    id v12 = v6;
    id v13 = self;
    id v14 = v8;
    dispatch_async(Property, block);
  }
}

void __71__HMDCameraSnapshotMonitorEvents__processPostedBulletin_responseTimer___block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([a1[4] count])
  {
    id Property = a1[5];
    if (Property) {
      id Property = objc_getProperty(Property, v2, 32, 1);
    }
    char v4 = [Property containsObject:a1[6]];
    id v5 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Updating the posted bulletin for %@", (uint8_t *)&v21, 0x16u);
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
        _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Timer has been already removed for %@, removing the posted bulletin", (uint8_t *)&v21, 0x16u);
      }
      id v19 = a1[4];
      id v18 = a1[5];
      v20 = [a1[6] sessionID];
      -[HMDCameraSnapshotMonitorEvents _removeBulletins:sessionID:](v18, v19, v20);
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@No bulletins were posted for snapshot %@", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (void)_removeBulletins:(void *)a3 sessionID:
{
  uint64_t v30 = *MEMORY[0x263EF8340];
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
          v11 = (void *)MEMORY[0x230FBD990]();
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
            _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@A bulletin with recordID %@ has already been posted for snapshot session %@, removing it", buf, 0x20u);
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
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __76__HMDCameraSnapshotMonitorEvents_handleCameraSettingsDidUpdateNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  id v9 = v5;
  uint64_t v10 = self;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __76__HMDCameraSnapshotMonitorEvents_handleCameraSettingsDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
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

    uint64_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Camera user settings changed.", (uint8_t *)&v12, 0xCu);
    }
    -[HMDCameraSnapshotMonitorEvents _enableNotificationsForCharacteristics:cameraSettings:](*(void **)(a1 + 40), v7, v5);
  }
}

- (void)_enableNotificationsForCharacteristics:(void *)a3 cameraSettings:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v7 = a3;
  if (a1)
  {
    id Property = objc_getProperty(a1, v6, 8, 1);
    dispatch_assert_queue_V2(Property);
    id v9 = [MEMORY[0x263EFF9C0] set];
    uint64_t v10 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
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

          objc_msgSend(objc_getProperty(a1, v17, v10[281], 1), "addObserver:selector:name:object:", a1, sel_handleBulletinBoardNotificationDidUpdateNotification_, @"HMDBulletinBoardNotificationDidUpdateNotification", v16);
          if ([v16 isEnabled]
            && -[HMDCameraSnapshotMonitorEvents _canEnableNotificationForCharacteristic:cameraSettings:](a1, v14, v7))
          {
            id v18 = (void *)MEMORY[0x230FBD990]();
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
              _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin snapshot characteristic: %@", buf, 0x16u);

              id v7 = v21;
              id v9 = v29;
            }

            [v9 addObject:v14];
            uint64_t v10 = &OBJC_IVAR___HMDSiriEndpointProfile__profileServices;
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
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id Property = objc_getProperty(a1, v7, 8, 1);
  dispatch_assert_queue_V2(Property);
  id v9 = (void *)MEMORY[0x230FBD990]();
  uint64_t v10 = a1;
  SEL v11 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = HMFGetLogIdentifier();
    int v55 = 138543618;
    v56 = v12;
    __int16 v57 = 2112;
    id v58 = v5;
    _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Checking if bulletin notification can be enabled for characteristic: %@", (uint8_t *)&v55, 0x16u);
  }
  id v13 = v5;
  self;
  uint64_t v14 = [v13 type];
  if ([v14 isEqualToString:*MEMORY[0x263F0C208]])
  {
    SEL v15 = [v13 service];
    id v16 = [v15 type];
    int v17 = [v16 isEqualToString:*MEMORY[0x263F0D6C0]];

    if (v17)
    {
      id v18 = (void *)MEMORY[0x230FBD990]();
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
        _os_log_impl(&dword_22F52A000, v23, v24, v22, (uint8_t *)&v55, 0xCu);

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
  if (([v26 isEqualToString:*MEMORY[0x263F0C288]] & 1) == 0)
  {

    goto LABEL_21;
  }
  __int16 v27 = [v25 service];
  id v28 = [v27 type];
  char v29 = [v28 isEqualToString:*MEMORY[0x263F0D7A8]];

  if ((v29 & 1) == 0)
  {
LABEL_21:
    v44 = (void *)MEMORY[0x230FBD990]();
    v45 = v10;
    v46 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
    {
      v47 = HMFGetLogIdentifier();
      int v55 = 138543362;
      v56 = v47;
      _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_DEBUG, "%{public}@Disallowing notifications to be enabled for non-doorbell, non-motion characteristic", (uint8_t *)&v55, 0xCu);
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
    id v18 = (void *)MEMORY[0x230FBD990]();
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
    v44 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v50, OS_LOG_TYPE_INFO, "%{public}@Disallowing notifications to be enabled because the camera's current access mode disallows motion detection: %@", (uint8_t *)&v55, 0x16u);
    }
LABEL_24:

    uint64_t v48 = 0;
    goto LABEL_29;
  }
  uint64_t v32 = [v6 notificationSettings];
  long long v33 = (void *)MEMORY[0x263F0E188];
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
  __int16 v39 = (void *)MEMORY[0x230FBD990](v37);
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
      _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Disallowing notifications to be enabled because smart notifications are enabled: %@", (uint8_t *)&v55, 0x16u);
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
    _os_log_impl(&dword_22F52A000, v41, OS_LOG_TYPE_INFO, "%{public}@Allowing notifications to be enabled for current access mode: %@, notification settings: %@", (uint8_t *)&v55, 0x20u);
  }
  uint64_t v48 = v38 ^ 1u;

LABEL_29:
  return v48;
}

- (void)_handleUpdatedBulletinSnapshotCharacteristics:(id *)a1
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id Property = objc_getProperty(a1, v4, 8, 1);
  dispatch_assert_queue_V2(Property);
  if (a1) {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
  }
  else {
    id WeakRetained = 0;
  }
  id v52 = WeakRetained;
  __int16 v57 = [WeakRetained home];
  SEL v7 = [a1 characteristicsAvailabilityListener];
  uint64_t v8 = [v7 availableCharacteristics];

  v51 = v8;
  v53 = v3;
  objc_msgSend(v8, "na_setByRemovingObjectsFromSet:", v3);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v64 objects:v73 count:16];
  id obj = v9;
  v56 = a1;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v65;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v65 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        SEL v15 = [v57 accessoryBulletinNotificationManager];
        id v16 = (void *)MEMORY[0x230FBD990]();
        int v17 = a1;
        id v18 = HMFGetOSLogHandle();
        id v19 = v18;
        if (!v15)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v45 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v70 = v45;
            _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);
          }
          v46 = obj;

          v47 = v52;
          uint64_t v48 = v53;
          v49 = v51;
          goto LABEL_33;
        }
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          long long v20 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v70 = v20;
          __int16 v71 = 2112;
          id v72 = v14;
          _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_INFO, "%{public}@Unregistering for notifications for characteristic: %@", buf, 0x16u);
        }
        id v21 = [MEMORY[0x263EFFA08] set];
        long long v22 = [MEMORY[0x263EFFA08] setWithObject:v14];
        __int16 v23 = [MEMORY[0x263EFFA08] set];
        v63[0] = MEMORY[0x263EF8330];
        v63[1] = 3221225472;
        v63[2] = __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke;
        v63[3] = &unk_264A2F370;
        v63[4] = v17;
        v63[5] = v14;
        [v15 updateRegistrationsWithEnabledCharacteristics:v21 disabledCharacteristics:v22 conditions:v23 completion:v63];

        a1 = v56;
      }
      id v9 = obj;
      uint64_t v11 = [obj countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v24 = v53;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v55 = *(void *)v60;
    while (2)
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v60 != v55) {
          objc_enumerationMutation(v24);
        }
        id v28 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        char v29 = [v57 accessoryBulletinNotificationManager];
        id v30 = (void *)MEMORY[0x230FBD990]();
        char v31 = a1;
        uint64_t v32 = HMFGetOSLogHandle();
        long long v33 = v32;
        if (!v29)
        {
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            v50 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v70 = v50;
            _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_ERROR, "%{public}@Accessory Bulletin Notification Manager is nil", buf, 0xCu);
          }

          goto LABEL_32;
        }
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v34 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543618;
          v70 = v34;
          __int16 v71 = 2112;
          id v72 = v28;
          _os_log_impl(&dword_22F52A000, v33, OS_LOG_TYPE_INFO, "%{public}@Registering for notifications for characteristic: %@", buf, 0x16u);
        }
        long long v35 = [v28 service];
        uint64_t v36 = [v35 bulletinBoardNotification];
        uint64_t v37 = [v36 condition];

        int v38 = [v29 conditionsFromPredicate:v37];
        __int16 v39 = [MEMORY[0x263EFFA08] setWithObject:v28];
        v40 = [MEMORY[0x263EFFA08] set];
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke_41;
        v58[3] = &unk_264A2F370;
        v58[4] = v31;
        v58[5] = v28;
        [v29 updateRegistrationsWithEnabledCharacteristics:v39 disabledCharacteristics:v40 conditions:v38 completion:v58];

        a1 = v56;
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v26) {
        continue;
      }
      break;
    }
  }

  v41 = (void *)MEMORY[0x230FBD990]();
  BOOL v42 = a1;
  v43 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    v44 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v70 = v44;
    __int16 v71 = 2112;
    id v72 = v24;
    _os_log_impl(&dword_22F52A000, v43, OS_LOG_TYPE_INFO, "%{public}@Setting the bulletin snapshot characteristics to %@", buf, 0x16u);
  }
  [v42 setBulletinSnapshotCharacteristics:v24];
LABEL_32:
  v49 = v51;
  v47 = v52;
  v46 = obj;
  uint64_t v48 = v53;
LABEL_33:
}

- (void)_updateHomedRelaunchRegistration
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id Property = objc_getProperty(a1, a2, 8, 1);
  dispatch_assert_queue_V2(Property);
  SEL v4 = [a1 bulletinSnapshotCharacteristics];
  uint64_t v5 = [v4 count];

  id v6 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Registering homed for relaunch", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = +[HMDLaunchHandler sharedHandler];
    uint64_t v12 = [v7 uniqueIdentifier];
    [v11 registerRelaunchClientWithUUID:v12];
  }
  else
  {
    if (v9)
    {
      id v13 = HMFGetLogIdentifier();
      int v14 = 138543362;
      SEL v15 = v13;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Deregistering homed for relaunch", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v11 = +[HMDLaunchHandler sharedHandler];
    uint64_t v12 = [v7 uniqueIdentifier];
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

void __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  SEL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      uint64_t v10 = "%{public}@Error unregistering for notifications from characteristic %@ : %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    uint64_t v10 = "%{public}@Unregistered for notifications from characteristic %@";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
}

void __80__HMDCameraSnapshotMonitorEvents__handleUpdatedBulletinSnapshotCharacteristics___block_invoke_41(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  SEL v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  id v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      __int16 v19 = 2112;
      id v20 = v3;
      uint64_t v10 = "%{public}@Error registering for notifications from characteristic %@ : %@";
      uint64_t v11 = v7;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 32;
LABEL_6:
      _os_log_impl(&dword_22F52A000, v11, v12, v10, (uint8_t *)&v15, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = HMFGetLogIdentifier();
    uint64_t v14 = *(void *)(a1 + 40);
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    uint64_t v10 = "%{public}@Registered for notifications from characteristic %@";
    uint64_t v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_INFO;
    uint32_t v13 = 22;
    goto LABEL_6;
  }
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
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__HMDCameraSnapshotMonitorEvents_handleCharacteristicsChangedNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __75__HMDCameraSnapshotMonitorEvents_handleCharacteristicsChangedNotification___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(id **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  id v31 = v2;
  if (v1)
  {
    uint64_t v3 = [v2 objectForKeyedSubscript:@"kModifiedCharacteristicsMapKey"];
    SEL v4 = objc_msgSend(v31, "hmf_arrayForKey:", @"kCharacteristicsToShowBulletinsKey");
    char v29 = v4;
    id v30 = (void *)v3;
    if (v4)
    {
      id v5 = v4;
    }
    else
    {
      objc_msgSend(v31, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v6 = v5;
    id v7 = [MEMORY[0x263EFF9C0] set];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      uint64_t v12 = *MEMORY[0x263F0C288];
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          int v15 = [v1 bulletinSnapshotCharacteristics];
          int v16 = [v15 containsObject:v14];

          if (v16)
          {
            __int16 v17 = [v14 type];
            int v18 = [v17 isEqualToString:v12];

            if (!v18
              || ([v14 value],
                  __int16 v19 = objc_claimAutoreleasedReturnValue(),
                  int v20 = [v19 BOOLValue],
                  v19,
                  v20))
            {
              [v7 addObject:v14];
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v10);
    }

    if (![v7 count]) {
      goto LABEL_26;
    }
    if (v29)
    {
      uint64_t v21 = [v7 allObjects];
      -[HMDCameraSnapshotMonitorEvents _characteristicsUpdated:modifiedCharacteristics:](v1, v21, v30);
LABEL_25:

LABEL_26:
      id v2 = v31;
      goto LABEL_27;
    }
    uint64_t v21 = objc_msgSend(v31, "hmf_dictionaryForKey:", @"kPresenceDictionaryForNotificationKey");
    uint64_t v22 = objc_msgSend(v31, "hmf_dictionaryForKey:", @"kPresencePairingIdentifierDictionaryForNotificationKey");
    id v28 = (void *)v22;
    if (v22)
    {
      __int16 v23 = -[HMDHomePresenceRemote initWithPresenceByPairingIdentity:]([HMDHomePresenceRemote alloc], "initWithPresenceByPairingIdentity:", v22, v22);
    }
    else
    {
      if (!v21)
      {
        id v24 = 0;
        goto LABEL_24;
      }
      __int16 v23 = -[HMDHomePresenceRemote initWithPresenceByUserId:]([HMDHomePresenceRemote alloc], "initWithPresenceByUserId:", v21, 0);
    }
    id v24 = v23;
LABEL_24:
    id WeakRetained = objc_loadWeakRetained(v1 + 5);
    uint64_t v26 = [WeakRetained home];
    __int16 v27 = [v7 allObjects];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __71__HMDCameraSnapshotMonitorEvents__handleCharacteristicsChangedPayload___block_invoke;
    v32[3] = &unk_264A29998;
    v32[4] = v1;
    id v33 = v30;
    [v26 evaluateNotificationConditionForCharacteristics:v27 homePresence:v24 completion:v32];

    goto LABEL_25;
  }
LABEL_27:
}

- (void)_characteristicsUpdated:(void *)a3 modifiedCharacteristics:
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v45 = a2;
  id v5 = a3;
  if (a1)
  {
    v44 = [MEMORY[0x263EFFA08] setWithArray:v45];
    id v6 = v44;
    if ([v44 count])
    {
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v7 = v44;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v53;
LABEL_5:
        uint64_t v10 = 0;
        while (1)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = [v5 objectForKey:*(void *)(*((void *)&v52 + 1) + 8 * v10)];
          uint64_t v12 = [v11 updateIdentifier];
          if (v12)
          {
            uint32_t v13 = [v11 remoteDevice];
            BOOL v14 = v13 == 0;

            if (!v14) {
              break;
            }
          }

          if (v8 == ++v10)
          {
            uint64_t v8 = [v7 countByEnumeratingWithState:&v52 objects:v60 count:16];
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

      int v15 = (void *)MEMORY[0x230FBD990]();
      int v16 = a1;
      __int16 v17 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v57 = v18;
        __int16 v58 = 2112;
        id v59 = v7;
        _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Taking a snapshot as the update characteristic %@ is being monitored", buf, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained(v16 + 3);
      id v19 = objc_loadWeakRetained(v16 + 5);
      if ([v19 isReachable]) {
        double v20 = 7.0;
      }
      else {
        double v20 = 15.0;
      }

      uint64_t v21 = [MEMORY[0x263F08C38] UUID];
      v43 = [v21 UUIDString];

      uint64_t v22 = [[HMDCameraSnapshotNotificationTimer alloc] initWithCameraSessionID:v43 changedCharacteristics:v7 timeInterval:v20];
      [(HMFTimer *)v22 setDelegate:v16];
      [(HMFTimer *)v22 setDelegateQueue:objc_getProperty(v16, v23, 8, 1)];
      objc_msgSend(objc_getProperty(v16, v24, 32, 1), "addObject:", v22);
      uint64_t v25 = [MEMORY[0x263EFF9A0] dictionary];
      [v25 setObject:v43 forKeyedSubscript:@"kCameraSessionID"];
      if (v11)
      {
        uint64_t v26 = [v11 updateIdentifier];
        [v25 setObject:v26 forKeyedSubscript:@"kCameraProactiveSessionID"];

        __int16 v27 = [v11 remoteDevice];
        [v25 setObject:v27 forKeyedSubscript:@"kIDSMessageSourceIDKey"];
      }
      id v28 = (void *)MEMORY[0x230FBD990]([v25 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:*MEMORY[0x263F0BD58]]);
      char v29 = v16;
      id v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        id v57 = v31;
        __int16 v58 = 2112;
        id v59 = v25;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Notification payload is: %@", buf, 0x16u);
      }
      objc_initWeak(&location, v29);
      uint64_t v32 = (void *)MEMORY[0x263F42568];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __82__HMDCameraSnapshotMonitorEvents__characteristicsUpdated_modifiedCharacteristics___block_invoke;
      v46[3] = &unk_264A291A8;
      objc_copyWeak(&v50, &location);
      uint64_t v33 = *MEMORY[0x263F0BD70];
      id v34 = v25;
      id v47 = v34;
      id v48 = v7;
      long long v35 = v22;
      v49 = v35;
      long long v36 = [v32 messageWithName:v33 messagePayload:v34 responseHandler:v46];
      long long v37 = (void *)MEMORY[0x230FBD990]([WeakRetained takeSnapshot:v36]);
      int v38 = v29;
      HMFGetOSLogHandle();
      uint64_t v39 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        id v40 = (id)objc_claimAutoreleasedReturnValue();
        v41 = [(HMDCameraSnapshotNotificationTimer *)v35 sessionID];
        *(_DWORD *)buf = 138543618;
        id v57 = v40;
        __int16 v58 = 2112;
        id v59 = v41;
        _os_log_impl(&dword_22F52A000, v39, OS_LOG_TYPE_INFO, "%{public}@Starting the notification timer for identifier %@", buf, 0x16u);
      }
      [(HMFTimer *)v35 resume];

      objc_destroyWeak(&v50);
      objc_destroyWeak(&location);

      id v6 = v44;
    }
  }
}

void __71__HMDCameraSnapshotMonitorEvents__handleCharacteristicsChangedPayload___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
}

void __82__HMDCameraSnapshotMonitorEvents__characteristicsUpdated_modifiedCharacteristics___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v75 = *MEMORY[0x263EF8340];
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
      int v16 = (void *)MEMORY[0x230FBD990]();
      __int16 v17 = self;
      int v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v68 = v19;
        __int16 v69 = 2112;
        id v70 = v12;
        __int16 v71 = 2112;
        id v72 = v11;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Failed to take a snapshot for session ID %@ with error %@", buf, 0x20u);
      }
      id WeakRetained = [v15 postedBulletins];
      uint64_t v21 = [v13 allObjects];
      -[HMDCameraSnapshotMonitorEvents _insertUpdateOrRemoveBulletins:forChangedCharacteristics:snapshotData:](v17, WeakRetained, v21, 0);
    }
    else
    {
      long long v64 = v15;
      id WeakRetained = objc_loadWeakRetained(self + 3);
      __int16 v58 = v14;
      uint64_t v62 = *MEMORY[0x263F0EBB0];
      uint64_t v21 = objc_msgSend(v14, "objectForKeyedSubscript:");
      uint64_t v22 = [v21 lastPathComponent];
      id Property = objc_getProperty(self, v23, 48, 1);
      uint64_t v25 = NSString;
      id v26 = Property;
      uint64_t v61 = (void *)v22;
      __int16 v27 = [v25 stringWithFormat:@"%@_%@.%@", v22, v12, @"jpg"];
      uint64_t v28 = [v26 stringByAppendingPathComponent:v27];

      char v29 = [MEMORY[0x263F08850] defaultManager];
      id v66 = 0;
      LOBYTE(v26) = [v29 linkItemAtPath:v21 toPath:v28 error:&v66];
      id v30 = v66;

      id v57 = v30;
      if (v26)
      {
        id v31 = (void *)v28;
      }
      else
      {
        uint64_t v32 = (void *)v28;
        id v59 = v13;
        id v33 = v12;
        id v34 = (void *)MEMORY[0x230FBD990]();
        long long v35 = self;
        long long v36 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          long long v37 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          v68 = v37;
          __int16 v69 = 2112;
          id v70 = v32;
          __int16 v71 = 2112;
          id v72 = v21;
          __int16 v73 = 2112;
          id v74 = v30;
          _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_ERROR, "%{public}@Failed to create hard link: %@ to file at path %@ with error %@", buf, 0x2Au);
        }

        id v31 = 0;
        id v12 = v33;
        id v13 = v59;
      }
      int v38 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v39 = *MEMORY[0x263F0DAE0];
      id v14 = v58;
      id v40 = [v58 objectForKeyedSubscript:*MEMORY[0x263F0DAE0]];
      [v38 setObject:v40 forKeyedSubscript:v39];

      long long v60 = v31;
      [v38 setObject:v31 forKeyedSubscript:v62];
      id v63 = v12;
      [v38 setObject:v12 forKeyedSubscript:@"kCameraSessionID"];
      uint64_t v41 = *MEMORY[0x263F0EBA8];
      BOOL v42 = [v58 objectForKeyedSubscript:*MEMORY[0x263F0EBA8]];
      [v38 setObject:v42 forKeyedSubscript:v41];

      v43 = [WeakRetained uniqueIdentifier];
      [v38 setObject:v43 forKeyedSubscript:@"HM.accessoryProfileUUID"];

      v44 = (void *)MEMORY[0x230FBD990]();
      id v45 = self;
      v46 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v68 = v47;
        __int16 v69 = 2112;
        id v70 = v58;
        _os_log_impl(&dword_22F52A000, v46, OS_LOG_TYPE_INFO, "%{public}@Took snapshot with response %@", buf, 0x16u);
      }
      id v48 = [v64 postedBulletins];
      v49 = [v13 allObjects];
      -[HMDCameraSnapshotMonitorEvents _insertUpdateOrRemoveBulletins:forChangedCharacteristics:snapshotData:](v45, v48, v49, v38);

      id v50 = [v58 objectForKeyedSubscript:*MEMORY[0x263F0D9C0]];
      v51 = (void *)MEMORY[0x230FBD990]();
      long long v52 = v45;
      long long v53 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        long long v55 = v54 = v13;
        *(_DWORD *)buf = 138543618;
        v68 = v55;
        __int16 v69 = 2112;
        id v70 = v50;
        _os_log_impl(&dword_22F52A000, v53, OS_LOG_TYPE_INFO, "%{public}@Releasing snapshot with slot identifier: %@", buf, 0x16u);

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
  uint64_t v25 = *MEMORY[0x263EF8340];
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
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__HMDCameraSnapshotMonitorEvents_handleBulletinBoardNotificationDidUpdateNotification___block_invoke;
  v8[3] = &unk_264A2F820;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(Property, v8);
}

void __87__HMDCameraSnapshotMonitorEvents_handleBulletinBoardNotificationDidUpdateNotification___block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = v2;
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

    id v7 = (void *)MEMORY[0x230FBD990]();
    id v39 = v1;
    id v8 = HMFGetOSLogHandle();
    id v9 = v8;
    if (!v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = HMFGetLogIdentifier();
        id v33 = [v3 object];
        *(_DWORD *)buf = 138543618;
        id v50 = v32;
        __int16 v51 = 2112;
        id v52 = v33;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unexpected notifier for HMDBulletinBoardNotificationDidUpdateNotification: %@", buf, 0x16u);
      }
      goto LABEL_33;
    }
    int v38 = v3;
    SEL v10 = v39;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      id v50 = v11;
      __int16 v51 = 2112;
      id v52 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated bulletin board notification: %@", buf, 0x16u);
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
              id v26 = (void *)MEMORY[0x230FBD990]();
              id v27 = v10;
              uint64_t v28 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                char v29 = HMFGetLogIdentifier();
                *(_DWORD *)id v45 = 138543618;
                v46 = v29;
                __int16 v47 = 2112;
                id v48 = v20;
                _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_INFO, "%{public}@Adding bulletin snapshot characteristic: %@", v45, 0x16u);

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
      uint64_t v3 = v38;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    id v34 = [v10 bulletinSnapshotCharacteristics];
    long long v35 = (id *)v10;
    uint64_t v3 = v38;
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
    uint64_t v3 = [v2 anyObject];
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
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v8 = a4;
  if (self) {
    id Property = objc_getProperty(self, v7, 8, 1);
  }
  else {
    id Property = 0;
  }
  dispatch_assert_queue_V2(Property);
  SEL v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  id v12 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = HMFGetLogIdentifier();
    int v15 = 138543362;
    uint64_t v16 = v13;
    _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_INFO, "%{public}@Available characteristics changed", (uint8_t *)&v15, 0xCu);
  }
  id v14 = -[HMDCameraSnapshotMonitorEvents currentCameraSettings]((uint64_t)v11);
  -[HMDCameraSnapshotMonitorEvents _enableNotificationsForCharacteristics:cameraSettings:](v11, v8, v14);
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  SEL v4 = self;
  id v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Deallocating %@", buf, 0x16u);
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
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = -[HMDCameraSnapshotMonitorEvents accessory]((id *)&self->super.super.isa);
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
    id v9 = (void *)MEMORY[0x230FBD990]();
    SEL v10 = self;
    id v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_super v12 = HMFGetLogIdentifier();
      int v14 = 138543362;
      __int16 v15 = v12;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@No bulletin board, not subscribing for notifications for doorbell or motion sensor", (uint8_t *)&v14, 0xCu);
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
  v57[1] = *MEMORY[0x263EF8340];
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
    uint64_t v21 = [MEMORY[0x263EFF9C0] set];
    snapShotNotificationResponseTimers = v20->_snapShotNotificationResponseTimers;
    v20->_snapShotNotificationResponseTimers = (NSMutableSet *)v21;

    int v23 = (void *)MEMORY[0x263F08C38];
    SEL v24 = [v14 uniqueIdentifier];
    v57[0] = @"HMDCameraSnapshotMonitorEvents";
    int v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:1];
    uint64_t v26 = objc_msgSend(v23, "hm_deriveUUIDFromBaseUUID:identifierSalt:withSalts:", v24, 0, v25);
    uniqueIdentifier = v20->_uniqueIdentifier;
    v20->_uniqueIdentifier = (NSUUID *)v26;

    uint64_t v28 = NSString;
    char v29 = [v15 name];
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
    uint64_t v38 = [MEMORY[0x263EFFA08] set];
    bulletinSnapshotCharacteristics = v20->_bulletinSnapshotCharacteristics;
    v20->_bulletinSnapshotCharacteristics = (NSSet *)v38;

    id v40 = [[HMDNotificationRegistration alloc] initWithRegisterer:v20];
    notificationRegistration = v20->_notificationRegistration;
    v20->_notificationRegistration = v40;

    v55[0] = *MEMORY[0x263F0D7A8];
    long long v42 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0C288]];
    v56[0] = v42;
    v55[1] = *MEMORY[0x263F0D6C0];
    long long v43 = [MEMORY[0x263EFFA08] setWithObject:*MEMORY[0x263F0C208]];
    v56[1] = v43;
    long long v44 = [NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:2];

    id v45 = [[HMDCharacteristicsAvailabilityListener alloc] initWithAccessory:v15 workQueue:v16 interestedCharacteristicTypesByServiceType:v44];
    characteristicsAvailabilityListener = v20->_characteristicsAvailabilityListener;
    v20->_characteristicsAvailabilityListener = v45;

    __int16 v47 = NSString;
    id v48 = [MEMORY[0x263F08C38] UUID];
    v49 = [v48 UUIDString];
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
  id v15 = [MEMORY[0x263F08A00] defaultCenter];
  id v16 = [(HMDCameraSnapshotMonitorEvents *)self initWithSnapshotManager:v13 accessory:v12 workQueue:v11 msgDispatcher:v10 bulletinBoard:v14 notificationCenter:v15];

  return v16;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t42_148359 != -1) {
    dispatch_once(&logCategory__hmf_once_t42_148359, &__block_literal_global_148360);
  }
  id v2 = (void *)logCategory__hmf_once_v43_148361;
  return v2;
}

void __45__HMDCameraSnapshotMonitorEvents_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = (void *)logCategory__hmf_once_v43_148361;
  logCategory__hmf_once_v43_148361 = v0;
}

@end