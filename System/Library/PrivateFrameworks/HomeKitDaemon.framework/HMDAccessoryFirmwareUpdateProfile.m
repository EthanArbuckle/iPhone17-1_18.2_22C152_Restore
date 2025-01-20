@interface HMDAccessoryFirmwareUpdateProfile
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)notificationsEnabled;
- (HMDAccessoryFirmwareUpdateProfile)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5;
- (HMDAccessoryFirmwareUpdateProfile)updateProfileWithCompletion:(id)a3;
- (HMDAccessoryFirmwareUpdateProfile)updateProfileWithStagedFirmwareVersion:(id)a3;
- (HMDAccessoryMatterFirmwareUpdateProfile)matterFirmwareUpdateProfile;
- (HMDHAPAccessory)accessory;
- (HMDService)service;
- (HMFSoftwareVersion)currentVersion;
- (HMFSoftwareVersion)stagedFirmwareVersion;
- (NSNotificationCenter)notificationCenter;
- (NSString)description;
- (OS_dispatch_queue)workQueue;
- (id)characteristics;
- (id)firmwareVersionCharacteristic;
- (id)logIdentifier;
- (id)matterFirmwareVersionCharacteristic;
- (id)privateDescription;
- (id)readinessCharacteristic;
- (id)statusCharacteristic;
- (int64_t)updateState;
- (unint64_t)stagingNotReadyReasons;
- (unint64_t)updateDuration;
- (unint64_t)updateNotReadyReasons;
- (void)__handleAccessoryIsReachable;
- (void)__handleFirmwareUpdateReadinessUpdate:(id)a3;
- (void)__handleFirmwareUpdateStatusUpdate:(id)a3;
- (void)__handleFirmwareVersionUpdate:(id)a3;
- (void)__handleStagedFirmwareVersionUpdate:(id)a3;
- (void)_enableCharacteristicsNotifications:(BOOL)a3;
- (void)_handleCharacteristicChanges:(id)a3;
- (void)_registerForNotifications;
- (void)_updateAccessoryFirmwareVersion:(id)a3;
- (void)_updateFirmwareStagingNotReadyReasons:(unint64_t)a3;
- (void)_updateFirmwareUpdateNotReadyReasons:(unint64_t)a3;
- (void)_updateFirmwareUpdateState:(int64_t)a3;
- (void)_updateStagedFirmwareVersion:(id)a3;
- (void)configure;
- (void)dealloc;
- (void)handleAccessoryIsReachable:(id)a3;
- (void)handleCharacteristicValuesChanged:(id)a3;
- (void)monitorCharacteristics:(BOOL)a3;
- (void)readAndProcessCharacteristics:(id)a3 withCompletion:(id)a4;
- (void)setCurrentVersion:(id)a3;
- (void)setMatterFirmwareUpdateProfile:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
- (void)setStagedFirmwareVersion:(id)a3;
- (void)setStagingNotReadyReasons:(unint64_t)a3;
- (void)setUpdateDuration:(unint64_t)a3;
- (void)setUpdateNotReadyReasons:(unint64_t)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation HMDAccessoryFirmwareUpdateProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterFirmwareUpdateProfile, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_service);
  objc_destroyWeak((id *)&self->_accessory);
  objc_storeStrong((id *)&self->_currentVersion, 0);
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
}

- (void)setMatterFirmwareUpdateProfile:(id)a3
{
}

- (HMDAccessoryMatterFirmwareUpdateProfile)matterFirmwareUpdateProfile
{
  return self->_matterFirmwareUpdateProfile;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  self->_notificationsEnabled = a3;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (HMDService)service
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_service);
  return (HMDService *)WeakRetained;
}

- (HMDHAPAccessory)accessory
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessory);
  return (HMDHAPAccessory *)WeakRetained;
}

- (void)setCurrentVersion:(id)a3
{
}

- (HMFSoftwareVersion)currentVersion
{
  return self->_currentVersion;
}

- (void)setStagedFirmwareVersion:(id)a3
{
}

- (HMFSoftwareVersion)stagedFirmwareVersion
{
  return self->_stagedFirmwareVersion;
}

- (void)setUpdateNotReadyReasons:(unint64_t)a3
{
  self->_updateNotReadyReasons = a3;
}

- (unint64_t)updateNotReadyReasons
{
  return self->_updateNotReadyReasons;
}

- (void)setStagingNotReadyReasons:(unint64_t)a3
{
  self->_stagingNotReadyReasons = a3;
}

- (unint64_t)stagingNotReadyReasons
{
  return self->_stagingNotReadyReasons;
}

- (void)setUpdateState:(int64_t)a3
{
  self->_updateState = a3;
}

- (int64_t)updateState
{
  return self->_updateState;
}

- (void)setUpdateDuration:(unint64_t)a3
{
  self->_updateDuration = a3;
}

- (unint64_t)updateDuration
{
  return self->_updateDuration;
}

- (void)__handleFirmwareVersionUpdate:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  v6 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F42630]) initWithVersionString:v8];
    [(HMDAccessoryFirmwareUpdateProfile *)self setCurrentVersion:v9];
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    v11 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v13;
      __int16 v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Update fetched firmware version not available for accessory %@", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_updateStagedFirmwareVersion:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5) {
    v6 = (void *)[objc_alloc(MEMORY[0x263F42630]) initWithVersionString:v5];
  }
  else {
    v6 = 0;
  }
  v7 = [(HMDAccessoryFirmwareUpdateProfile *)self stagedFirmwareVersion];
  if (!v7
    || ([(HMDAccessoryFirmwareUpdateProfile *)self stagedFirmwareVersion],
        v3 = objc_claimAutoreleasedReturnValue(),
        ([v3 isEqualToVersion:v6] & 1) != 0))
  {
    id v8 = [(HMDAccessoryFirmwareUpdateProfile *)self stagedFirmwareVersion];
    if (v8) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v6 == 0;
    }
    int v10 = !v9;

    if (v7)
    {

      if ((v10 & 1) == 0) {
        goto LABEL_20;
      }
    }
    else if (!v10)
    {
      goto LABEL_20;
    }
  }
  else
  {
  }
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v14 = HMFGetLogIdentifier();
    v15 = [(HMDAccessoryFirmwareUpdateProfile *)v12 stagedFirmwareVersion];
    int v17 = 138543874;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@StagedFirmwareVersion changed from %@ to %@", (uint8_t *)&v17, 0x20u);
  }
  [(HMDAccessoryFirmwareUpdateProfile *)v12 setStagedFirmwareVersion:v6];
  __int16 v16 = [MEMORY[0x263F08A00] defaultCenter];
  [v16 postNotificationName:@"HMDAccessoryStagedFirmwareVersionChangedNotification" object:v12];

LABEL_20:
}

- (void)__handleStagedFirmwareVersionUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 value];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  [(HMDAccessoryFirmwareUpdateProfile *)self _updateStagedFirmwareVersion:v8];
}

- (void)__handleFirmwareUpdateReadinessUpdate:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  id v18 = 0;
  BOOL v9 = [MEMORY[0x263F359A8] parsedFromData:v8 error:&v18];
  id v10 = v18;
  if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      v15 = [v4 value];
      *(_DWORD *)buf = 138544386;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v4;
      __int16 v23 = 2112;
      v24 = v15;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse firmware update readiness (%@) - characteristic %@ value %@ error %@", buf, 0x34u);
    }
  }
  else
  {
    __int16 v16 = [v9 stagingNotReadyReasons];
    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareStagingNotReadyReasons:](self, "_updateFirmwareStagingNotReadyReasons:", [v16 value]);

    int v17 = [v9 updateNotReadyReasons];
    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateNotReadyReasons:](self, "_updateFirmwareUpdateNotReadyReasons:", [v17 value]);
  }
}

- (void)__handleFirmwareUpdateStatusUpdate:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  id v28 = 0;
  BOOL v9 = [MEMORY[0x263F359B0] parsedFromData:v8 error:&v28];
  id v10 = v28;
  if (v10)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = HMFGetLogIdentifier();
      v15 = [v4 value];
      *(_DWORD *)buf = 138544386;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v4;
      __int16 v33 = 2112;
      v34 = v15;
      __int16 v35 = 2112;
      id v36 = v8;
      __int16 v37 = 2112;
      id v38 = v10;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse firmware update status (%@) - characteristic %@ value %@ error %@", buf, 0x34u);

LABEL_15:
    }
LABEL_16:

    goto LABEL_17;
  }
  __int16 v16 = [v9 state];

  if (!v16)
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    int v14 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v30 = v14;
    __int16 v19 = "%{public}@Missing update state in Firmware Update Status TLV";
    v20 = v13;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    goto LABEL_14;
  }
  int v17 = [v9 state];
  if ([v17 value] == 3)
  {
    id v18 = [v9 stagedFirmwareVersion];

    if (!v18)
    {
      v11 = (void *)MEMORY[0x230FBD990]();
      v12 = self;
      v13 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
        goto LABEL_16;
      }
      int v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v30 = v14;
      __int16 v19 = "%{public}@Dropping Firmware Staging Status Success without a Staged Firmware Version";
      v20 = v13;
      os_log_type_t v21 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl(&dword_22F52A000, v20, v21, v19, buf, 0xCu);
      goto LABEL_15;
    }
  }
  else
  {
  }
  id v22 = [v9 state];

  if (v22)
  {
    __int16 v23 = [v9 state];
    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateState:](self, "_updateFirmwareUpdateState:", [v23 value]);
  }
  v24 = [v9 updateDuration];

  if (v24)
  {
    __int16 v25 = [v9 updateDuration];
    id v26 = [v25 value];

    -[HMDAccessoryFirmwareUpdateProfile _updateFirmwareUpdateDuration:](self, "_updateFirmwareUpdateDuration:", [v26 unsignedIntegerValue]);
  }
  __int16 v27 = [v9 stagedFirmwareVersion];
  [(HMDAccessoryFirmwareUpdateProfile *)self _updateStagedFirmwareVersion:v27];

LABEL_17:
}

- (void)_handleCharacteristicChanges:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    uint64_t v34 = *MEMORY[0x263F0C190];
    uint64_t v33 = *MEMORY[0x263F354F0];
    *(void *)&long long v9 = 138543362;
    long long v31 = v9;
    id v32 = v6;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        int v14 = objc_msgSend(v13, "type", v31);
        int v15 = [v14 isEqualToString:@"00000235-0000-1000-8000-0026BB765291"];

        if (v15)
        {
          [(HMDAccessoryFirmwareUpdateProfile *)self __handleFirmwareUpdateStatusUpdate:v13];
          continue;
        }
        __int16 v16 = [v13 type];
        int v17 = [v16 isEqualToString:@"00000234-0000-1000-8000-0026BB765291"];

        if (v17)
        {
          [(HMDAccessoryFirmwareUpdateProfile *)self __handleFirmwareUpdateReadinessUpdate:v13];
          continue;
        }
        id v18 = [v13 type];
        int v19 = [v18 isEqualToString:@"00000249-0000-1000-8000-0026BB765291"];

        if (v19)
        {
          [(HMDAccessoryFirmwareUpdateProfile *)self __handleStagedFirmwareVersionUpdate:v13];
          continue;
        }
        v20 = [v13 type];
        int v21 = [v20 isEqualToString:v34];

        if (v21)
        {
          id v22 = (void *)MEMORY[0x230FBD990]();
          __int16 v23 = self;
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            __int16 v25 = HMFGetLogIdentifier();
            *(_DWORD *)buf = v31;
            v40 = v25;
            _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Firmware Update Profile _handleCharacteristicChanges: characteristic update for HMCharacteristicTypeFirmwareVersion", buf, 0xCu);

            v6 = v32;
          }

          if ([v6 supportsHAP]) {
            goto LABEL_21;
          }
        }
        else
        {
          id v26 = [v13 type];
          int v27 = [v26 isEqualToString:v33];

          if (v27)
          {
            id v28 = (void *)MEMORY[0x230FBD990]();
            __int16 v23 = self;
            uint64_t v29 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              v30 = HMFGetLogIdentifier();
              *(_DWORD *)buf = v31;
              v40 = v30;
              _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_DEBUG, "%{public}@Firmware Update Profile _handleCharacteristicChanges: characteristic update for HAPCharacteristicUUID_MatterFirmwareRevisionNumber", buf, 0xCu);

              v6 = v32;
            }

            if ([v6 supportsCHIP])
            {
LABEL_21:
              [(HMDAccessoryFirmwareUpdateProfile *)v23 __handleFirmwareVersionUpdate:v13];
              continue;
            }
          }
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v10);
  }
}

- (void)__handleAccessoryIsReachable
{
  v3 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ([(HMDAccessoryFirmwareUpdateProfile *)self notificationsEnabled])
  {
    [(HMDAccessoryFirmwareUpdateProfile *)self _enableCharacteristicsNotifications:1];
  }
}

- (void)handleAccessoryIsReachable:(id)a3
{
  id v4 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HMDAccessoryFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __64__HMDAccessoryFirmwareUpdateProfile_handleAccessoryIsReachable___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    int v7 = 138543362;
    uint64_t v8 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Accessory is now reachable", (uint8_t *)&v7, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "__handleAccessoryIsReachable");
}

- (void)handleCharacteristicValuesChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__HMDAccessoryFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke;
  v7[3] = &unk_264A2F820;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __71__HMDAccessoryFirmwareUpdateProfile_handleCharacteristicValuesChanged___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userInfo];
  int v3 = objc_msgSend(v2, "hmf_BOOLForKey:", @"HMDAccessoryFirmwareUpdateHasHandledFirmwareVersionUpdatedNotificationKey");

  if (v3)
  {
    id v4 = (void *)MEMORY[0x230FBD990]();
    id v5 = *(id *)(a1 + 40);
    id v6 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      int v27 = v7;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_DEBUG, "%{public}@Already handled updated accessory firmware version", buf, 0xCu);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) userInfo];
    uint64_t v9 = objc_msgSend(v8, "hmf_arrayForKey:", @"kModifiedCharacteristicsKey");

    if ([v9 count])
    {
      uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v20 = v9;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v22;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v11);
            }
            __int16 v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
            int v17 = [*(id *)(a1 + 40) accessory];
            id v18 = [v16 accessory];
            int v19 = HMFEqualObjects();

            if (v19) {
              [v10 addObject:v16];
            }
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v13);
      }

      [*(id *)(a1 + 40) _handleCharacteristicChanges:v10];
      uint64_t v9 = v20;
    }
  }
}

- (void)_registerForNotifications
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  if (v3)
  {
    id v4 = [(HMDAccessoryFirmwareUpdateProfile *)self notificationCenter];
    [v4 addObserver:self selector:sel_handleCharacteristicValuesChanged_ name:@"HMDAccessoryCharacteristicsChangedNotification" object:v3];

    id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self notificationCenter];
    [v5 addObserver:self selector:sel_handleAccessoryIsReachable_ name:@"HMDAccessoryIsReachableNotification" object:v3];
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    id v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_ERROR, "%{public}@Not registering for notifications as accessory is nil", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_updateAccessoryFirmwareVersion:(id)a3
{
  v31[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  int v7 = [v6 firmwareVersion];
  int v8 = [v4 isGreaterThanVersion:v7];

  if (v8)
  {
    if ([v6 supportsCHIP])
    {
      v30[0] = @"kModifiedCharacteristicsKey";
      uint64_t v9 = [(HMDAccessoryFirmwareUpdateProfile *)self matterFirmwareVersionCharacteristic];
      uint64_t v29 = v9;
      int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
      v30[1] = @"HMDAccessoryFirmwareUpdateHasHandledFirmwareVersionUpdatedNotificationKey";
      v31[0] = v10;
      v31[1] = MEMORY[0x263EFFA88];
      id v11 = NSDictionary;
      uint64_t v12 = v31;
      uint64_t v13 = v30;
    }
    else
    {
      v27[0] = @"kModifiedCharacteristicsKey";
      uint64_t v9 = [(HMDAccessoryFirmwareUpdateProfile *)self firmwareVersionCharacteristic];
      id v26 = v9;
      int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v26 count:1];
      v27[1] = @"HMDAccessoryFirmwareUpdateHasHandledFirmwareVersionUpdatedNotificationKey";
      v28[0] = v10;
      v28[1] = MEMORY[0x263EFFA88];
      id v11 = NSDictionary;
      uint64_t v12 = v28;
      uint64_t v13 = v27;
    }
    uint64_t v14 = [v11 dictionaryWithObjects:v12 forKeys:v13 count:2];

    uint64_t v15 = (void *)MEMORY[0x230FBD990]();
    __int16 v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = HMFGetLogIdentifier();
      int v19 = [v6 firmwareVersion];
      int v20 = 138543874;
      long long v21 = v18;
      __int16 v22 = 2112;
      long long v23 = v19;
      __int16 v24 = 2112;
      id v25 = v4;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Accessory version=%@ is different than fetched version=%@", (uint8_t *)&v20, 0x20u);
    }
    logAndPostNotification(@"HMDAccessoryCharacteristicsChangedNotification", v6, v14);
  }
}

- (void)_updateFirmwareUpdateNotReadyReasons:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDAccessoryFirmwareUpdateProfile *)self updateNotReadyReasons] == a3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      [(HMDAccessoryFirmwareUpdateProfile *)v7 updateNotReadyReasons];
      int v10 = HAPUpdateNotReadyReasonsAsString();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Update Not Ready Reasons not changed: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(HMDAccessoryFirmwareUpdateProfile *)self setUpdateNotReadyReasons:a3];
    id v11 = [(HMDAccessoryFirmwareUpdateProfile *)self notificationCenter];
    [v11 postNotificationName:@"HMDAccessoryFirmwareUpdateApplyNotReadyReasonsChangedNotification" object:self userInfo:0];
  }
}

- (void)_updateFirmwareStagingNotReadyReasons:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if ([(HMDAccessoryFirmwareUpdateProfile *)self stagingNotReadyReasons] == a3)
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    int v7 = self;
    int v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      [(HMDAccessoryFirmwareUpdateProfile *)v7 stagingNotReadyReasons];
      int v10 = HAPStagingNotReadyReasonsAsString();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Staging Not Ready Reasons not changed: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(HMDAccessoryFirmwareUpdateProfile *)self setStagingNotReadyReasons:a3];
    id v11 = [(HMDAccessoryFirmwareUpdateProfile *)self notificationCenter];
    [v11 postNotificationName:@"HMDAccessoryFirmwareUpdateStagingNotReadyReasonsChangedNotification" object:self userInfo:0];
  }
}

- (void)_updateFirmwareUpdateState:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int64_t v5 = [(HMDAccessoryFirmwareUpdateProfile *)self updateState];
  id v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  uint64_t v9 = v8;
  if (v5 == a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v10 = HMFGetLogIdentifier();
      [(HMDAccessoryFirmwareUpdateProfile *)v7 updateState];
      id v11 = HAPFirmwareUpdateStateAsString();
      *(_DWORD *)buf = 138543618;
      long long v21 = v10;
      __int16 v22 = 2112;
      long long v23 = v11;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEBUG, "%{public}@State not changed: %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = HMFGetLogIdentifier();
      [(HMDAccessoryFirmwareUpdateProfile *)v7 updateState];
      uint64_t v13 = HAPFirmwareUpdateStateAsString();
      __int16 v14 = HAPFirmwareUpdateStateAsString();
      *(_DWORD *)buf = 138543874;
      long long v21 = v12;
      __int16 v22 = 2112;
      long long v23 = v13;
      __int16 v24 = 2112;
      id v25 = v14;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Updating firmware update state from %@ to %@", buf, 0x20u);
    }
    [(HMDAccessoryFirmwareUpdateProfile *)v7 setUpdateState:a3];
    uint64_t v15 = [(HMDAccessoryFirmwareUpdateProfile *)v7 notificationCenter];
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"HMDAccessoryFirmwareUpdateStateKey");
    int v19 = v16;
    int v17 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v15 postNotificationName:@"HMDAccessoryFirmwareUpdateStateChangedNotification" object:v7 userInfo:v17];
  }
}

- (void)readAndProcessCharacteristics:(id)a3 withCompletion:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = (void (**)(void))a4;
  int v8 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v8);

  BOOL v9 = [v6 count] == 0;
  int v10 = (void *)MEMORY[0x230FBD990]();
  id v11 = self;
  uint64_t v12 = HMFGetOSLogHandle();
  uint64_t v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      long long v36 = v25;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_DEBUG, "%{public}@No characteristics to read and process", buf, 0xCu);
    }
    v7[2](v7);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      long long v36 = v14;
      __int16 v37 = 2112;
      id v38 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Reading characteristics: %@", buf, 0x16u);
    }
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v6, "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v16 = v6;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v31;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v16);
          }
          int v20 = +[HMDCharacteristicRequest requestWithCharacteristic:*(void *)(*((void *)&v30 + 1) + 8 * v19)];
          [v15 addObject:v20];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }

    objc_initWeak((id *)buf, v11);
    long long v21 = [(HMDAccessoryFirmwareUpdateProfile *)v11 accessory];
    __int16 v22 = [v21 home];

    long long v23 = (void *)[v15 copy];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke;
    v26[3] = &unk_264A2B560;
    objc_copyWeak(&v29, (id *)buf);
    uint64_t v28 = v7;
    id v24 = v15;
    id v27 = v24;
    [v22 readCharacteristicValues:v23 source:7 qualityOfService:-1 withCompletionHandler:v26];

    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)buf);
  }
}

void __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  long long v33 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v34 = WeakRetained;
    int v8 = v5;
    if (v5)
    {
      *(void *)v49 = 0;
      *(void *)&v49[8] = v49;
      *(void *)&v49[16] = 0x3032000000;
      v50 = __Block_byref_object_copy__223668;
      v51 = __Block_byref_object_dispose__223669;
      uint64_t v32 = a1;
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = *(id *)(a1 + 32);
      uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v41 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            uint64_t v13 = [v12 characteristic];
            id v39 = 0;
            __int16 v14 = objc_msgSend(v8, "hmd_valueOfCharacteristic:error:", v13, &v39);
            id v15 = v39;

            if (v14)
            {
              id v16 = *(void **)(*(void *)&v49[8] + 40);
              uint64_t v17 = [v12 characteristic];
              [v16 addObject:v17];
            }
            else
            {
              uint64_t v18 = (void *)MEMORY[0x230FBD990]();
              id v19 = v34;
              HMFGetOSLogHandle();
              int v20 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                HMFGetLogIdentifier();
                id v21 = (id)objc_claimAutoreleasedReturnValue();
                __int16 v22 = [v12 characteristic];
                *(_DWORD *)buf = 138543618;
                id v45 = v21;
                __int16 v46 = 2112;
                v47 = v22;
                _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Read failed for %@", buf, 0x16u);
              }
            }
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v9);
      }

      long long v23 = [v34 workQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_52;
      block[3] = &unk_264A287B0;
      block[4] = v34;
      id v38 = v49;
      id v37 = *(id *)(v32 + 40);
      dispatch_async(v23, block);

      _Block_object_dispose(v49, 8);
    }
    else
    {
      uint64_t v26 = a1;
      id v27 = (void *)MEMORY[0x230FBD990]();
      id v28 = v7;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        long long v30 = HMFGetLogIdentifier();
        uint64_t v31 = *(void *)(v26 + 32);
        *(_DWORD *)v49 = 138543874;
        *(void *)&v49[4] = v30;
        *(_WORD *)&v49[12] = 2112;
        *(void *)&v49[14] = v31;
        *(_WORD *)&v49[22] = 2112;
        v50 = v33;
        _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@Read of characteristics %@ failed with error %@", v49, 0x20u);
      }
      (*(void (**)(void))(*(void *)(v26 + 40) + 16))();
    }
    int v7 = v34;
  }
  else
  {
    int v8 = v5;
    id v24 = _Block_copy(*(const void **)(a1 + 40));
    id v25 = v24;
    if (v24) {
      (*((void (**)(void *))v24 + 2))(v24);
    }
  }
}

uint64_t __82__HMDAccessoryFirmwareUpdateProfile_readAndProcessCharacteristics_withCompletion___block_invoke_52(void *a1)
{
  v2 = (void *)a1[4];
  int v3 = (void *)[*(id *)(*(void *)(a1[6] + 8) + 40) copy];
  [v2 _handleCharacteristicChanges:v3];

  id v4 = *(uint64_t (**)(void))(a1[5] + 16);
  return v4();
}

- (HMDAccessoryFirmwareUpdateProfile)updateProfileWithCompletion:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  int v7 = self;
  int v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    id v29 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating accessory firmware update profile", buf, 0xCu);
  }
  uint64_t v10 = [(HMDAccessoryFirmwareUpdateProfile *)v7 characteristics];
  id v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v10, "count") + 1);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(v11, "addObject:", *(void *)(*((void *)&v23 + 1) + 8 * v16++), (void)v23);
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  uint64_t v17 = [(HMDAccessoryFirmwareUpdateProfile *)v7 firmwareVersionCharacteristic];
  if (v17) {
    [v11 addObject:v17];
  }
  uint64_t v18 = [(HMDAccessoryFirmwareUpdateProfile *)v7 accessory];
  int v19 = [v18 supportsCHIP];

  if (v19)
  {
    int v20 = [(HMDAccessoryFirmwareUpdateProfile *)v7 matterFirmwareVersionCharacteristic];
    if (v20) {
      [v11 addObject:v20];
    }
  }
  id v21 = [v11 allObjects];
  [(HMDAccessoryFirmwareUpdateProfile *)v7 readAndProcessCharacteristics:v21 withCompletion:v4];

  return result;
}

- (HMDAccessoryFirmwareUpdateProfile)updateProfileWithStagedFirmwareVersion:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDAccessoryFirmwareUpdateProfile *)self _updateFirmwareUpdateState:3];
  [(HMDAccessoryFirmwareUpdateProfile *)self _updateStagedFirmwareVersion:v6];

  return result;
}

- (id)characteristics
{
  int v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"00000235-0000-1000-8000-0026BB765291", @"00000234-0000-1000-8000-0026BB765291", 0);
  id v4 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  id v5 = [v4 findCharacteristicsByTypes:v3 forServiceType:@"00000236-0000-1000-8000-0026BB765291"];

  return v5;
}

- (id)statusCharacteristic
{
  v2 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  int v3 = [v2 findCharacteristicType:@"00000235-0000-1000-8000-0026BB765291" forServiceType:@"00000236-0000-1000-8000-0026BB765291"];

  return v3;
}

- (id)matterFirmwareVersionCharacteristic
{
  v2 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  if ([v2 supportsCHIP])
  {
    int v3 = [v2 findCharacteristicType:*MEMORY[0x263F354F0] forServiceType:*MEMORY[0x263F0D610]];
  }
  else
  {
    int v3 = 0;
  }

  return v3;
}

- (id)firmwareVersionCharacteristic
{
  v2 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  int v3 = [v2 findCharacteristicType:*MEMORY[0x263F0C190] forServiceType:*MEMORY[0x263F0D610]];

  return v3;
}

- (id)readinessCharacteristic
{
  v2 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  int v3 = [v2 findCharacteristicType:@"00000234-0000-1000-8000-0026BB765291" forServiceType:@"00000236-0000-1000-8000-0026BB765291"];

  return v3;
}

- (void)_enableCharacteristicsNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v14 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  id v6 = (void *)MEMORY[0x263EFF980];
  int v7 = [(HMDAccessoryFirmwareUpdateProfile *)self characteristics];
  int v8 = [v6 arrayWithArray:v7];

  uint64_t v9 = [(HMDAccessoryFirmwareUpdateProfile *)self firmwareVersionCharacteristic];
  if (v9) {
    [v8 addObject:v9];
  }
  int v10 = [v14 supportsCHIP];
  id v11 = v14;
  if (v10)
  {
    id v12 = [(HMDAccessoryFirmwareUpdateProfile *)self matterFirmwareVersionCharacteristic];
    if (v12) {
      [v8 addObject:v12];
    }

    id v11 = v14;
  }
  [v11 setNotificationsEnabled:v3 forCharacteristics:v8 clientIdentifier:@"com.apple.HomeKitDaemon.accessoryfirmwareUpdate"];
  [(HMDAccessoryFirmwareUpdateProfile *)self setNotificationsEnabled:v3];
  if (v3)
  {
    uint64_t v13 = [(HMDAccessoryFirmwareUpdateProfile *)self characteristics];
    [(HMDAccessoryFirmwareUpdateProfile *)self readAndProcessCharacteristics:v13 withCompletion:&__block_literal_global_49_223675];
  }
}

- (void)monitorCharacteristics:(BOOL)a3
{
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __60__HMDAccessoryFirmwareUpdateProfile_monitorCharacteristics___block_invoke;
  v6[3] = &unk_264A2B870;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_async(v5, v6);
}

uint64_t __60__HMDAccessoryFirmwareUpdateProfile_monitorCharacteristics___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    id v6 = HMFBooleanToString();
    int v9 = 138543618;
    int v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Monitoring characteristics set to %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t result = [*(id *)(a1 + 32) notificationsEnabled];
  int v8 = *(unsigned __int8 *)(a1 + 40);
  if (v8 != result) {
    return [*(id *)(a1 + 32) _enableCharacteristicsNotifications:v8 != 0];
  }
  return result;
}

- (void)configure
{
  v10[3] = *MEMORY[0x263EF8340];
  id v3 = [(HMDAccessoryFirmwareUpdateProfile *)self workQueue];
  dispatch_assert_queue_V2(v3);

  if ((_os_feature_enabled_impl() & 1) != 0
    || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    id v4 = [(HMDAccessoryFirmwareUpdateProfile *)self matterFirmwareUpdateProfile];
    [v4 configure];
  }
  [(HMDAccessoryFirmwareUpdateProfile *)self _registerForNotifications];
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  if ([v5 isReachable])
  {
    id v6 = (void *)MEMORY[0x263EFFA08];
    v10[0] = @"00000234-0000-1000-8000-0026BB765291";
    v10[1] = @"00000235-0000-1000-8000-0026BB765291";
    v10[2] = @"00000249-0000-1000-8000-0026BB765291";
    BOOL v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:3];
    int v8 = [v6 setWithArray:v7];

    int v9 = [v5 findCharacteristicsByTypes:v8 forServiceType:@"00000236-0000-1000-8000-0026BB765291"];
    [(HMDAccessoryFirmwareUpdateProfile *)self _handleCharacteristicChanges:v9];
  }
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (HMDAccessoryFirmwareUpdateProfile)initWithAccessory:(id)a3 service:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDAccessoryFirmwareUpdateProfile;
  __int16 v11 = [(HMDAccessoryFirmwareUpdateProfile *)&v18 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_accessory, v8);
    objc_storeWeak((id *)&v12->_service, v9);
    objc_storeStrong((id *)&v12->_workQueue, a5);
    uint64_t v13 = [v8 firmwareVersion];
    currentVersion = v12->_currentVersion;
    v12->_currentVersion = (HMFSoftwareVersion *)v13;

    uint64_t v15 = [[HMDAccessoryMatterFirmwareUpdateProfile alloc] initWithAccessory:v8 workQueue:v10];
    matterFirmwareUpdateProfile = v12->_matterFirmwareUpdateProfile;
    v12->_matterFirmwareUpdateProfile = v15;
  }
  return v12;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateProfile;
  [(HMDAccessoryFirmwareUpdateProfile *)&v4 dealloc];
}

- (id)logIdentifier
{
  v2 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  id v3 = [v2 logIdentifier];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (HMDAccessoryFirmwareUpdateProfile *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v6 = v5;
      }
      else {
        id v6 = 0;
      }
      BOOL v7 = v6;

      id v8 = [(HMDAccessoryFirmwareUpdateProfile *)self service];
      id v9 = [v8 uuid];
      id v10 = [(HMDAccessoryFirmwareUpdateProfile *)v7 service];

      __int16 v11 = [v10 uuid];
      char v12 = [v9 isEqual:v11];
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (id)privateDescription
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  id v6 = [v5 uuid];
  BOOL v7 = [v6 UUIDString];
  id v8 = [v3 stringWithFormat:@"<%@ %@>", v4, v7];

  return v8;
}

- (NSString)description
{
  v2 = [(HMDAccessoryFirmwareUpdateProfile *)self accessory];
  id v3 = NSString;
  uint64_t v4 = [v2 name];
  id v5 = [v2 uniqueIdentifier];
  id v6 = [v3 stringWithFormat:@"Accessory Firmware Update Profile %@, %@", v4, v5];

  return (NSString *)v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_223703 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_223703, &__block_literal_global_223704);
  }
  v2 = (void *)logCategory__hmf_once_v2_223705;
  return v2;
}

void __48__HMDAccessoryFirmwareUpdateProfile_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_223705;
  logCategory__hmf_once_v2_223705 = v0;
}

@end