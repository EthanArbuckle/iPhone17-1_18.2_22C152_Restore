@interface HMDAccessoryFirmwareUpdateManager
+ (id)logCategory;
- (BOOL)_registerAccessory:(id)a3 source:(int64_t)a4 path:(id)a5;
- (BOOL)checkForUpdateForAccessory:(id)a3;
- (BOOL)hasReachedMaximumFirmwareUpdateRetriesForAccessory:(id)a3 assetID:(id)a4;
- (BOOL)isAccessoryRegistered:(id)a3;
- (BOOL)isFirmwareUpdateRetryAllowedForAccessory:(id)a3 forAsset:(id)a4;
- (BOOL)registerAccessory:(id)a3;
- (BOOL)startUARPPacketCapture:(id)a3;
- (BOOL)supportsFirmwareUpdate;
- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)logEventManager;
- (HMDAccessoryFirmwareUpdateManager)init;
- (HMDAccessoryFirmwareUpdateManager)initWithHomeManager:(id)a3;
- (HMDAccessoryFirmwareUpdateManager)initWithHomeManager:(id)a3 wingman:(id)a4;
- (HMDAccessoryFirmwareUpdateManagerWingman)wingman;
- (HMDDefaultUARPControllerDelegate)defaultUARPControllerDelegate;
- (HMDHomeManager)homeManager;
- (HMDMatterUARPControllerDelegate)matterUARPControllerDelegate;
- (HMFTimer)statusTimer;
- (NSMapTable)registeredAccessories;
- (NSMutableDictionary)accessoryRetries;
- (NSMutableDictionary)activeSessions;
- (NSURL)documentationPath;
- (OS_dispatch_queue)workQueue;
- (UARPController)defaultUARPController;
- (id)UARPAccessoryForHMDAccessory:(id)a3;
- (id)UARPControllerForAccessory:(id)a3;
- (id)addSessionForUARPAccessory:(id)a3;
- (id)availableSoftwareAssetForMatterAccessory:(id)a3 error:(id *)a4;
- (id)changeAccessory:(id)a3 source:(int64_t)a4 path:(id)a5 documentationPath:(id)a6 userInitiatedStaging:(BOOL)a7;
- (id)findHMDHAPAccessoryWithUARPAccessory:(id)a3;
- (id)matterUARPController;
- (id)registerAndCreateSessionForAccessory:(id)a3 updateUARPParameters:(BOOL)a4;
- (id)sessionForAccessory:(id)a3;
- (id)sessionForUARPAccessory:(id)a3;
- (int64_t)defaultProductDataUpdateAssetSource;
- (int64_t)defaultUpdateAssetSourceWithAccessory:(id)a3;
- (void)_handleAccessoryFirmwareVersionUpdateNotification:(id)a3;
- (void)_handleHomeAccessoryRemovedNotification:(id)a3;
- (void)_handleMatterSettingsUpdateNotification:(id)a3;
- (void)dealloc;
- (void)handleAccessoryFirmwareVersionUpdateNotification:(id)a3;
- (void)handleHomeAccessoryRemovedNotification:(id)a3;
- (void)handleMatterSettingsUpdateNotification:(id)a3;
- (void)removeSession:(id)a3;
- (void)rescindStagedAsset:(id)a3 completion:(id)a4;
- (void)resetFirmwareUpdateAccessoryRetryTracking:(id)a3 forAsset:(id)a4;
- (void)setAccessoryRetries:(id)a3;
- (void)setActiveSessions:(id)a3;
- (void)setRegisteredAccessories:(id)a3;
- (void)setStatusTimer:(id)a3;
- (void)startStatusTimer;
- (void)stopUARPPacketCapture;
- (void)timerDidFire:(id)a3;
- (void)unregisterAccessory:(id)a3;
@end

@implementation HMDAccessoryFirmwareUpdateManager

- (id)sessionForAccessory:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v6 = [(HMDAccessoryFirmwareUpdateManager *)self activeSessions];
  v7 = [v4 uuid];
  v8 = [v6 objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (NSMutableDictionary)activeSessions
{
  return self->_activeSessions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_matterUARPControllerDelegate, 0);
  objc_storeStrong((id *)&self->_defaultUARPControllerDelegate, 0);
  objc_storeStrong((id *)&self->_accessoryRetries, 0);
  objc_storeStrong((id *)&self->_registeredAccessories, 0);
  objc_storeStrong((id *)&self->_wingman, 0);
  objc_storeStrong((id *)&self->_logEventManager, 0);
  objc_storeStrong((id *)&self->_activeSessions, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_documentationPath, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)setStatusTimer:(id)a3
{
}

- (HMFTimer)statusTimer
{
  return self->_statusTimer;
}

- (HMDMatterUARPControllerDelegate)matterUARPControllerDelegate
{
  return self->_matterUARPControllerDelegate;
}

- (HMDDefaultUARPControllerDelegate)defaultUARPControllerDelegate
{
  return self->_defaultUARPControllerDelegate;
}

- (void)setAccessoryRetries:(id)a3
{
}

- (NSMutableDictionary)accessoryRetries
{
  return self->_accessoryRetries;
}

- (void)setRegisteredAccessories:(id)a3
{
}

- (NSMapTable)registeredAccessories
{
  return self->_registeredAccessories;
}

- (HMDAccessoryFirmwareUpdateManagerWingman)wingman
{
  return (HMDAccessoryFirmwareUpdateManagerWingman *)objc_getProperty(self, a2, 56, 1);
}

- (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager)logEventManager
{
  return self->_logEventManager;
}

- (void)setActiveSessions:(id)a3
{
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSURL)documentationPath
{
  return self->_documentationPath;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)rescindStagedAsset:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v8 = [v6 workQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke;
  v11[3] = &unk_1E6A10B58;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke(id *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if ([WeakRetained isAccessoryRegistered:a1[4]])
  {
    v3 = [WeakRetained sessionForAccessory:a1[4]];
    if (v3)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke_105;
      v15[3] = &unk_1E6A19358;
      id v16 = a1[5];
      [v3 rescindStagedAsset:v15];
      id v4 = v16;
    }
    else
    {
      id v10 = (void *)MEMORY[0x1D9452090]();
      id v11 = WeakRetained;
      id v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = HMFGetLogIdentifier();
        id v14 = [a1[4] shortDescription];
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not available session for accessory", buf, 0x16u);
      }
      id v4 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:0 reason:@"Invalid state: session not available for accessory" suggestion:0];
      (*((void (**)(void))a1[5] + 2))();
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = WeakRetained;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = HMFGetLogIdentifier();
      id v9 = [a1[4] shortDescription];
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_ERROR, "%{public}@[%@] Accessory not registered", buf, 0x16u);
    }
    v3 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3 description:0 reason:@"accessory not registered" suggestion:0];
    (*((void (**)(void))a1[5] + 2))();
  }
}

uint64_t __67__HMDAccessoryFirmwareUpdateManager_rescindStagedAsset_completion___block_invoke_105(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)stopUARPPacketCapture
{
  id v2 = [(HMDAccessoryFirmwareUpdateManager *)self defaultUARPController];
  [v2 stopPacketCapture];
}

- (BOOL)startUARPPacketCapture:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self defaultUARPController];
  char v6 = [v5 startPacketCapture:v4];

  return v6;
}

- (void)resetFirmwareUpdateAccessoryRetryTracking:(id)a3 forAsset:(id)a4
{
  char v6 = NSString;
  id v7 = a4;
  v8 = [a3 uuid];
  id v9 = [v8 UUIDString];
  id v10 = [v7 assetVersion];

  id v12 = [v6 stringWithFormat:@"%@-%@", v9, v10];

  id v11 = [(HMDAccessoryFirmwareUpdateManager *)self accessoryRetries];
  [v11 removeObjectForKey:v12];
}

- (BOOL)isFirmwareUpdateRetryAllowedForAccessory:(id)a3 forAsset:(id)a4
{
  char v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = [v8 uuid];
  id v10 = [v9 UUIDString];
  id v11 = [v7 assetVersion];
  id v12 = [v6 stringWithFormat:@"%@-%@", v10, v11];

  id v13 = [(HMDAccessoryFirmwareUpdateManager *)self accessoryRetries];
  id v14 = [v13 objectForKeyedSubscript:v12];

  v15 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
  id v16 = [(HMDAccessoryFirmwareUpdateManager *)self accessoryRetries];
  [v16 setObject:v15 forKeyedSubscript:v12];

  LOBYTE(self) = [(HMDAccessoryFirmwareUpdateManager *)self hasReachedMaximumFirmwareUpdateRetriesForAccessory:v8 assetID:v7];
  return self ^ 1;
}

- (BOOL)hasReachedMaximumFirmwareUpdateRetriesForAccessory:(id)a3 assetID:(id)a4
{
  char v6 = NSString;
  id v7 = a4;
  id v8 = [a3 uuid];
  id v9 = [v8 UUIDString];
  id v10 = [v7 assetVersion];

  id v11 = [v6 stringWithFormat:@"%@-%@", v9, v10];

  id v12 = [(HMDAccessoryFirmwareUpdateManager *)self accessoryRetries];
  id v13 = [v12 objectForKeyedSubscript:v11];

  LOBYTE(v12) = [v13 intValue] > 0xA;
  return (char)v12;
}

- (id)UARPAccessoryForHMDAccessory:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 identityType])
  {
    v5 = [(HMDAccessoryFirmwareUpdateManager *)self registeredAccessories];
    char v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      char v6 = (void *)[objc_alloc(MEMORY[0x1E4F5E018]) initWithHMDHAPAccessory:v4];
      id v7 = (void *)MEMORY[0x1D9452090]();
      id v8 = self;
      id v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v10 = HMFGetLogIdentifier();
        id v11 = [v4 shortDescription];
        id v12 = [v4 name];
        int v21 = 138544130;
        v22 = v10;
        __int16 v23 = 2112;
        v24 = v11;
        __int16 v25 = 2112;
        v26 = v6;
        __int16 v27 = 2112;
        v28 = v12;
        _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Initialized UARP Accessory %@ from HAP Accessory %@", (uint8_t *)&v21, 0x2Au);
      }
      if (v6)
      {
        id v13 = [(HMDAccessoryFirmwareUpdateManager *)v8 registeredAccessories];
        [v13 setObject:v6 forKey:v4];
      }
    }
  }
  else
  {
    id v14 = (void *)MEMORY[0x1D9452090]();
    v15 = self;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = HMFGetLogIdentifier();
      v18 = [v4 shortDescription];
      __int16 v19 = [v4 name];
      int v21 = 138543874;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, "%{public}@[%@] Unknown identity type for %@", (uint8_t *)&v21, 0x20u);
    }
    char v6 = 0;
  }

  return v6;
}

- (id)findHMDHAPAccessoryWithUARPAccessory:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self homeManager];
  char v6 = [v4 uuid];
  id v7 = [v5 accessoryWithUUID:v6];

  if (v7)
  {
    id v8 = v7;
    objc_opt_class();
    int v9 = objc_opt_isKindOfClass() & 1;
    if (v9) {
      id v10 = v8;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;

    if (v9)
    {
      id v12 = v8;
    }
    else
    {
      v18 = (void *)MEMORY[0x1D9452090]();
      __int16 v19 = self;
      v20 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = HMFGetLogIdentifier();
        int v23 = 138543618;
        v24 = v21;
        __int16 v25 = 2112;
        id v26 = v8;
        _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory %@ is not a HAPAccessory", (uint8_t *)&v23, 0x16u);
      }
      id v12 = 0;
    }
  }
  else
  {
    id v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = HMFGetLogIdentifier();
      v17 = [v4 uuid];
      int v23 = 138543618;
      v24 = v16;
      __int16 v25 = 2112;
      id v26 = v17;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@Accessory %@ not found in homes", (uint8_t *)&v23, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

- (id)sessionForUARPAccessory:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  char v6 = [(HMDAccessoryFirmwareUpdateManager *)self activeSessions];
  id v7 = [v4 uuid];
  id v8 = [v6 objectForKeyedSubscript:v7];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)addSessionForUARPAccessory:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDAccessoryFirmwareUpdateManager *)self supportsFirmwareUpdate])
  {
    v5 = [(HMDAccessoryFirmwareUpdateManager *)self findHMDHAPAccessoryWithUARPAccessory:v4];
    if (v5)
    {
      char v6 = [(HMDAccessoryFirmwareUpdateManager *)self wingman];
      id v7 = [(HMDAccessoryFirmwareUpdateManager *)self logEventManager];
      id v8 = (void *)[v6 newAccessoryFirmwareUpdateSessionWithHAPAccessory:v5 uarpAccessory:v4 accessoryFirmwareUpdateManager:self logEventManager:v7];

      [v8 configure];
      os_unfair_lock_lock_with_options();
      int v9 = [(HMDAccessoryFirmwareUpdateManager *)self activeSessions];
      id v10 = [v4 uuid];
      [v9 setObject:v8 forKey:v10];

      os_unfair_lock_unlock(&self->_lock);
      id v11 = (void *)MEMORY[0x1D9452090]();
      id v12 = self;
      id v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = HMFGetLogIdentifier();
        v15 = [v5 shortDescription];
        int v28 = 138543874;
        uint64_t v29 = v14;
        __int16 v30 = 2112;
        id v31 = v15;
        __int16 v32 = 2112;
        id v33 = v4;
        _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] Created session %@ for accessory", (uint8_t *)&v28, 0x20u);
      }
      id v16 = (void *)MEMORY[0x1D9452090]();
      v17 = v12;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v19 = HMFGetLogIdentifier();
        v20 = [v5 shortDescription];
        int v28 = 138543874;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        id v31 = v20;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] New firmwareUpdateSession %@", (uint8_t *)&v28, 0x20u);
      }
    }
    else
    {
      id v16 = (void *)MEMORY[0x1D9452090]();
      __int16 v25 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v26 = HMFGetLogIdentifier();
        int v28 = 138543618;
        uint64_t v29 = v26;
        __int16 v30 = 2112;
        id v31 = v4;
        _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Couldn't find HAPAccessory from UARPHomeKitAccessory %@", (uint8_t *)&v28, 0x16u);
      }
      id v8 = 0;
    }
  }
  else
  {
    int v21 = (void *)MEMORY[0x1D9452090]();
    v22 = self;
    int v23 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v24;
      _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not enabled on this device; ignoring",
        (uint8_t *)&v28,
        0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

- (void)removeSession:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 hapAccessory];
  char v6 = [v5 uuid];

  id v7 = (void *)MEMORY[0x1D9452090]();
  id v8 = self;
  int v9 = HMFGetOSLogHandle();
  id v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      id v12 = [v4 hapAccessory];
      id v13 = [v12 shortDescription];
      int v17 = 138543874;
      v18 = v11;
      __int16 v19 = 2112;
      v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Removing session %@", (uint8_t *)&v17, 0x20u);
    }
    p_lock = &v8->_lock;
    os_unfair_lock_lock_with_options();
    v15 = [(HMDAccessoryFirmwareUpdateManager *)v8 activeSessions];
    [v15 removeObjectForKey:v6];

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_ERROR, "%{public}@removeSession: No accessory UUID exists", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)timerDidFire:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  char v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  id v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = HMFGetLogIdentifier();
    [(HMDAccessoryFirmwareUpdateManager *)v7 defaultProductDataUpdateAssetSource];
    id v10 = HMSoftwareUpdateAssetSourceAsString();
    int v12 = 138543618;
    id v13 = v9;
    __int16 v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Default asset source: %@", (uint8_t *)&v12, 0x16u);
  }
  id v11 = [(HMDAccessoryFirmwareUpdateManager *)v7 activeSessions];
  [v11 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_93_125667];
}

uint64_t __50__HMDAccessoryFirmwareUpdateManager_timerDidFire___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 logDebugStates];
}

- (void)startStatusTimer
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F65580]) initWithTimeInterval:13 options:86400.0];
  [(HMDAccessoryFirmwareUpdateManager *)self setStatusTimer:v3];

  id v4 = [(HMDAccessoryFirmwareUpdateManager *)self statusTimer];
  [v4 setDelegate:self];

  v5 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  char v6 = [(HMDAccessoryFirmwareUpdateManager *)self statusTimer];
  [v6 setDelegateQueue:v5];

  id v7 = [(HMDAccessoryFirmwareUpdateManager *)self statusTimer];
  [v7 resume];
}

- (BOOL)checkForUpdateForAccessory:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self UARPControllerForAccessory:v4];
  char v6 = [(HMDAccessoryFirmwareUpdateManager *)self UARPAccessoryForHMDAccessory:v4];
  if (v6)
  {
    char v7 = [v5 checkForUpdate:v6];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1D9452090]();
    int v9 = self;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = HMFGetLogIdentifier();
      int v12 = [v4 shortDescription];
      int v14 = 138543618;
      v15 = v11;
      __int16 v16 = 2112;
      int v17 = v12;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Cannot check for update for accessory - unsupported", (uint8_t *)&v14, 0x16u);
    }
    char v7 = 0;
  }

  return v7;
}

- (void)unregisterAccessory:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self UARPControllerForAccessory:v4];
  char v6 = [(HMDAccessoryFirmwareUpdateManager *)self UARPAccessoryForHMDAccessory:v4];
  if (v6)
  {
    char v7 = [(HMDAccessoryFirmwareUpdateManager *)self sessionForAccessory:v4];
    id v8 = v7;
    if (v7)
    {
      [v7 unregisterAccessory];
      [(HMDAccessoryFirmwareUpdateManager *)self removeSession:v8];
    }
    int v9 = [v5 accessoryList];
    int v10 = [v9 containsObject:v6];

    if (!v10) {
      goto LABEL_15;
    }
    int v11 = [v5 removeAccessory:v6];
    int v12 = (void *)MEMORY[0x1D9452090]();
    id v13 = self;
    int v14 = HMFGetOSLogHandle();
    v15 = v14;
    if (v11)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v16 = HMFGetLogIdentifier();
        int v17 = [v4 shortDescription];
        *(_DWORD *)int v28 = 138543874;
        *(void *)&v28[4] = v16;
        *(_WORD *)&v28[12] = 2112;
        *(void *)&v28[14] = v17;
        *(_WORD *)&v28[22] = 2112;
        uint64_t v29 = v6;
        uint64_t v18 = "%{public}@[%@] Unregistering accessory %@";
        __int16 v19 = v15;
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_13:
        _os_log_impl(&dword_1D49D5000, v19, v20, v18, v28, 0x20u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __int16 v16 = HMFGetLogIdentifier();
      int v17 = [v4 shortDescription];
      *(_DWORD *)int v28 = 138543874;
      *(void *)&v28[4] = v16;
      *(_WORD *)&v28[12] = 2112;
      *(void *)&v28[14] = v17;
      *(_WORD *)&v28[22] = 2112;
      uint64_t v29 = v6;
      uint64_t v18 = "%{public}@[%@] Not unregistering accessory %@ - failed";
      __int16 v19 = v15;
      os_log_type_t v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_13;
    }

LABEL_15:
    uint64_t v27 = [(HMDAccessoryFirmwareUpdateManager *)self registeredAccessories];
    [v27 removeObjectForKey:v4];

    goto LABEL_16;
  }
  __int16 v21 = (void *)MEMORY[0x1D9452090]();
  id v22 = self;
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = HMFGetLogIdentifier();
    __int16 v25 = [v4 shortDescription];
    id v26 = [v4 name];
    *(_DWORD *)int v28 = 138543874;
    *(void *)&v28[4] = v24;
    *(_WORD *)&v28[12] = 2112;
    *(void *)&v28[14] = v25;
    *(_WORD *)&v28[22] = 2112;
    uint64_t v29 = v26;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not unregistering accessory %@ - unsupported", v28, 0x20u);
  }
LABEL_16:
}

- (void)_handleHomeAccessoryRemovedNotification:(id)a3
{
  id v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"HMDAccessoryNotificationKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = v5;
  }
  else {
    char v6 = 0;
  }
  id v8 = v6;

  char v7 = v8;
  if (v8)
  {
    [(HMDAccessoryFirmwareUpdateManager *)self unregisterAccessory:v8];
    char v7 = v8;
  }
}

- (void)handleHomeAccessoryRemovedNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HMDAccessoryFirmwareUpdateManager_handleHomeAccessoryRemovedNotification___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __76__HMDAccessoryFirmwareUpdateManager_handleHomeAccessoryRemovedNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleHomeAccessoryRemovedNotification:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (id)changeAccessory:(id)a3 source:(int64_t)a4 path:(id)a5 documentationPath:(id)a6 userInitiatedStaging:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  v15 = [(HMDAccessoryFirmwareUpdateManager *)self UARPControllerForAccessory:v12];
  __int16 v16 = [(HMDAccessoryFirmwareUpdateManager *)self UARPAccessoryForHMDAccessory:v12];
  int v17 = (void *)MEMORY[0x1D9452090]();
  uint64_t v18 = self;
  __int16 v19 = HMFGetOSLogHandle();
  os_log_type_t v20 = v19;
  if (v16)
  {
    id v74 = v14;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = HMFGetLogIdentifier();
      [v12 shortDescription];
      id v75 = v12;
      v71 = v16;
      uint64_t v23 = v22 = v15;
      HMFBooleanToString();
      int64_t v24 = a4;
      v26 = id v25 = v13;
      *(_DWORD *)buf = 138543874;
      v78 = v21;
      __int16 v79 = 2112;
      v80 = v23;
      __int16 v81 = 2112;
      v82 = v26;
      _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Setting userInitiatedFirmwareStaging to %@", buf, 0x20u);

      id v13 = v25;
      a4 = v24;

      v15 = v22;
      __int16 v16 = v71;
      id v12 = v75;
    }
    [v16 setUserInitiatedFirmwareStaging:v7];
    v76 = v15;
    uint64_t v27 = [v15 accessoryList];
    char v28 = [v27 containsObject:v16];

    if ((v28 & 1) == 0)
    {
      v37 = (void *)MEMORY[0x1D9452090]();
      v38 = v18;
      v39 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = HMFGetLogIdentifier();
        v41 = [v12 shortDescription];
        *(_DWORD *)buf = 138543618;
        v78 = v40;
        __int16 v79 = 2112;
        v80 = v41;
        _os_log_impl(&dword_1D49D5000, v39, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot change source for unregistered accessory", buf, 0x16u);
      }
      v42 = (void *)MEMORY[0x1D9452090]();
      v43 = v38;
      v44 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      {
        v45 = HMFGetLogIdentifier();
        v46 = [v12 shortDescription];
        [v76 accessoryList];
        v48 = id v47 = v13;
        *(_DWORD *)buf = 138544130;
        v78 = v45;
        __int16 v79 = 2112;
        v80 = v46;
        __int16 v81 = 2112;
        v82 = v16;
        __int16 v83 = 2112;
        v84 = v48;
        _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Looking for %@ in accessoryList %@", buf, 0x2Au);

        id v13 = v47;
      }

      v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
      id v14 = v74;
      goto LABEL_33;
    }
    if (a4 == 2)
    {
      id v14 = v74;
      if (![v13 length])
      {
        v61 = (void *)MEMORY[0x1D9452090]();
        v62 = v18;
        v63 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          v64 = HMFGetLogIdentifier();
          v65 = [v12 shortDescription];
          HMSoftwareUpdateAssetSourceAsString();
          v67 = id v66 = v13;
          *(_DWORD *)buf = 138543874;
          v78 = v64;
          __int16 v79 = 2112;
          v80 = v65;
          __int16 v81 = 2112;
          v82 = v67;
          _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@[%@] Invalid path for asset source %@", buf, 0x20u);

          id v13 = v66;
          id v14 = v74;
        }
        v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:3];
        goto LABEL_33;
      }
      id v29 = objc_alloc(MEMORY[0x1E4F5E020]);
      uint64_t v30 = 0;
    }
    else
    {
      id v29 = objc_alloc(MEMORY[0x1E4F5E020]);
      uint64_t v30 = 1;
      id v14 = v74;
      switch(a4)
      {
        case 1:
          uint64_t v30 = 2;
          break;
        case 3:
          uint64_t v30 = 5;
          break;
        case 4:
          uint64_t v30 = 6;
          break;
        case 5:
          uint64_t v30 = 7;
          break;
        case 6:
          uint64_t v30 = 8;
          break;
        case 7:
          uint64_t v30 = 3;
          break;
        case 8:
          uint64_t v30 = 15;
          break;
        case 9:
          uint64_t v30 = 16;
          break;
        default:
          break;
      }
    }
    if (v13)
    {
      id v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
      if (v14)
      {
LABEL_10:
        __int16 v32 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v14 isDirectory:0];
        id v33 = (void *)[v29 initWithLocationType:v30 remoteURL:v31 releaseNotesRemoteURL:v32];

LABEL_23:
        if (v13) {

        }
        int v49 = [v76 changeAssetLocation:v16 assetID:v33];
        v50 = (void *)MEMORY[0x1D9452090]();
        v51 = v18;
        v52 = HMFGetOSLogHandle();
        v53 = v52;
        if (v49)
        {
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            v54 = HMFGetLogIdentifier();
            [v12 shortDescription];
            v55 = v72 = v50;
            v56 = HMSoftwareUpdateAssetSourceAsString();
            v57 = [v33 assetVersion];
            *(_DWORD *)buf = 138544898;
            v78 = v54;
            __int16 v79 = 2112;
            v80 = v55;
            __int16 v81 = 2112;
            v82 = v56;
            __int16 v83 = 2112;
            v84 = v57;
            __int16 v85 = 2112;
            id v86 = v13;
            __int16 v87 = 2112;
            id v88 = v12;
            __int16 v89 = 2112;
            v90 = v33;
            _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@[%@] Successfully changed source to %@ %@ %@ for accessory <%@> asset <%@>", buf, 0x48u);

            id v14 = v74;
            v50 = v72;
          }
          v36 = 0;
        }
        else
        {
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            v70 = HMFGetLogIdentifier();
            v68 = [v12 shortDescription];
            v69 = HMSoftwareUpdateAssetSourceAsString();
            v58 = [v33 assetVersion];
            [v12 name];
            v59 = id v73 = v13;
            *(_DWORD *)buf = 138544642;
            v78 = v70;
            __int16 v79 = 2112;
            v80 = v68;
            __int16 v81 = 2112;
            v82 = v69;
            __int16 v83 = 2112;
            v84 = v58;
            __int16 v85 = 2112;
            id v86 = v73;
            __int16 v87 = 2112;
            id v88 = v59;
            _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to change source to %@ %@ %@ for accessory %@", buf, 0x3Eu);

            id v13 = v73;
            id v14 = v74;
          }
          v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
        }

LABEL_33:
        v15 = v76;
        goto LABEL_34;
      }
    }
    else
    {
      id v31 = 0;
      if (v14) {
        goto LABEL_10;
      }
    }
    id v33 = (void *)[v29 initWithLocationType:v30 remoteURL:v31 releaseNotesRemoteURL:0];
    goto LABEL_23;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    uint64_t v34 = HMFGetLogIdentifier();
    v35 = [v12 shortDescription];
    *(_DWORD *)buf = 138543618;
    v78 = v34;
    __int16 v79 = 2112;
    v80 = v35;
    _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@[%@] Cannot change source for unsupported accessory", buf, 0x16u);
  }
  v36 = [MEMORY[0x1E4F28C58] hmErrorWithCode:2];
LABEL_34:

  return v36;
}

- (BOOL)_registerAccessory:(id)a3 source:(int64_t)a4 path:(id)a5
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  dispatch_assert_queue_V2(v10);

  int v11 = [v8 home];
  char v12 = [v11 isOwnerUser];

  id v13 = [v8 firmwareVersion];

  id v14 = [v8 firmwareUpdateProfile];

  if (![(HMDAccessoryFirmwareUpdateManager *)self isAccessoryRegistered:v8])
  {
    int64_t v163 = a4;
    if (((_os_feature_enabled_impl() & 1) != 0
       || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v8 supportsCHIP])
    {
      __int16 v21 = [v8 matterVendorID];
      if (v21)
      {
        id v22 = [v8 matterVendorID];
        int v23 = [v22 isEqualToNumber:&unk_1F2DC8AB8] ^ 1;
      }
      else
      {
        int v23 = 0;
      }

      int64_t v24 = [v8 matterProductID];
      if (v24)
      {
        id v25 = [v8 matterProductID];
        int v160 = [v25 isEqualToNumber:&unk_1F2DC8AB8] ^ 1;
      }
      else
      {
        int v160 = 0;
      }

      v157 = [v8 name];

      char v153 = v12;
      if (v14)
      {
        id v26 = [v8 firmwareUpdateProfile];
        uint64_t v27 = [v26 matterFirmwareUpdateProfile];

        if (v27)
        {
          char v28 = [v8 firmwareUpdateProfile];
          uint64_t v27 = [v28 matterFirmwareUpdateProfile];
          id v29 = [v27 matterFirmwareRevisionNumber];
          BOOL v30 = v29 != 0;

          BOOL v31 = v30;
          LODWORD(v27) = 1;
        }
        else
        {
          BOOL v31 = 0;
        }
      }
      else
      {
        BOOL v31 = 0;
        LODWORD(v27) = 0;
      }
      context = (void *)MEMORY[0x1D9452090]();
      __int16 v32 = self;
      id v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        int v150 = v23;
        v145 = HMFGetLogIdentifier();
        v149 = [v8 shortDescription];
        HMFBooleanToString();
        uint64_t v34 = v146 = v32;
        HMFBooleanToString();
        v35 = id v166 = v9;
        HMFBooleanToString();
        uint64_t v27 = v147 = (int)v27;
        HMFBooleanToString();
        v36 = BOOL v148 = v31;
        HMFBooleanToString();
        v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        v170 = v145;
        __int16 v171 = 2112;
        v172 = v149;
        __int16 v173 = 2112;
        v174 = v34;
        __int16 v175 = 2112;
        v176 = v35;
        __int16 v177 = 2112;
        v178 = v27;
        __int16 v179 = 2112;
        v180 = v36;
        __int16 v181 = 2112;
        v182 = v37;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@[%@] Matter AFU Settings: hasMatterFirmwareUpdateProfile: %@, hasMatterFirmwareRevisionNumber: %@, hasMatterVendorID: %@, hasMatterProductID: %@, hasHapAccessoryName: %@", buf, 0x48u);

        int v23 = v150;
        BOOL v31 = v148;

        LODWORD(v27) = v147;
        id v9 = v166;

        __int16 v32 = v146;
      }

      char v12 = v153;
      if ((v27 & v31 & v23 & v160) != 1 || !v157)
      {
        v61 = (void *)MEMORY[0x1D9452090]();
        v62 = v32;
        v63 = HMFGetOSLogHandle();
        if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
LABEL_56:

LABEL_57:
          BOOL v20 = 0;
          goto LABEL_97;
        }
        v64 = HMFGetLogIdentifier();
        v65 = [v8 shortDescription];
        *(_DWORD *)buf = 138543618;
        v170 = v64;
        __int16 v171 = 2112;
        v172 = v65;
        _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not registering with FirmwareUpdateManager due to invalid matter AFU settings", buf, 0x16u);
LABEL_55:

        goto LABEL_56;
      }
    }
    if (![v8 identityType])
    {
      v51 = [v8 matterVendorID];
      v52 = [v8 matterProductID];
      v53 = (void *)MEMORY[0x1D9452090]();
      v54 = self;
      v55 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        v56 = HMFGetLogIdentifier();
        v57 = [v8 shortDescription];
        v58 = [v8 manufacturer];
        [v8 model];
        v59 = id v168 = v9;
        [v8 productData];
        v60 = v164 = v53;
        *(_DWORD *)buf = 138545154;
        v170 = v56;
        __int16 v171 = 2112;
        v172 = v57;
        __int16 v173 = 2112;
        v174 = v58;
        __int16 v175 = 2112;
        v176 = v59;
        __int16 v177 = 2112;
        v178 = v60;
        __int16 v179 = 2112;
        v180 = v51;
        __int16 v181 = 2112;
        v182 = v52;
        __int16 v183 = 2112;
        id v184 = v8;
        _os_log_impl(&dword_1D49D5000, v55, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not registering with FirmwareUpdateManager due to unknown identity type for manufacturer: %@ model: %@ productData: %@ vendorID: %@ productID: %@ accessory: %@", buf, 0x52u);

        v53 = v164;
        id v9 = v168;
      }

      goto LABEL_57;
    }
    id v167 = v9;
    if (v14) {
      char v38 = v12;
    }
    else {
      char v38 = 0;
    }
    if (v13) {
      char v39 = v38;
    }
    else {
      char v39 = 0;
    }
    v40 = (void *)MEMORY[0x1D9452090]();
    v41 = self;
    v42 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
LABEL_46:

      if (v39)
      {
        uint64_t v67 = [v8 softwareUpdate];
        id v9 = v167;
        if (!v67) {
          goto LABEL_60;
        }
        v68 = (void *)v67;
        v69 = [v8 softwareUpdate];
        if ([v69 state] == 2)
        {
          v70 = [v8 firmwareVersion];
          v71 = [v8 softwareUpdate];
          v72 = [v71 version];
          int v73 = [v70 isAtLeastVersion:v72];

          if (!v73) {
            goto LABEL_60;
          }
          id v74 = (void *)MEMORY[0x1D9452090]();
          id v75 = v41;
          v76 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v77 = HMFGetLogIdentifier();
            v78 = [v8 shortDescription];
            *(_DWORD *)buf = 138543618;
            v170 = v77;
            __int16 v171 = 2112;
            v172 = v78;
            _os_log_impl(&dword_1D49D5000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Verifying pending firmware version on registered accessory", buf, 0x16u);
          }
          v68 = [v8 softwareUpdate];
          [v68 updateLocalState:4];
        }
        else
        {
        }
LABEL_60:
        v82 = [(HMDAccessoryFirmwareUpdateManager *)v41 UARPAccessoryForHMDAccessory:v8];
        if (!v82)
        {
          __int16 v83 = (void *)MEMORY[0x1D9452090]();
          v84 = v41;
          __int16 v85 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            id v86 = HMFGetLogIdentifier();
            __int16 v87 = [v8 shortDescription];
            *(_DWORD *)buf = 138543618;
            v170 = v86;
            __int16 v171 = 2112;
            v172 = v87;
            _os_log_impl(&dword_1D49D5000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Not registering accessory with FirmwareUpdateManager - unsupported accessory type", buf, 0x16u);
          }
          BOOL v20 = 0;
          goto LABEL_96;
        }
        if (v167)
        {
          v162 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v167 isDirectory:0];
        }
        else
        {
          v162 = 0;
        }
        id v88 = objc_alloc(MEMORY[0x1E4F5E020]);
        if ((unint64_t)(v163 - 1) > 8) {
          uint64_t v89 = 1;
        }
        else {
          uint64_t v89 = qword_1D54D3FF0[v163 - 1];
        }
        v90 = (void *)[v88 initWithLocationType:v89 remoteURL:v162];
        uint64_t v91 = [(HMDAccessoryFirmwareUpdateManager *)v41 UARPControllerForAccessory:v8];
        v92 = (void *)MEMORY[0x1D9452090]();
        v93 = v41;
        v94 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
        {
          v95 = HMFGetLogIdentifier();
          v96 = [v8 shortDescription];
          *(_DWORD *)buf = 138544130;
          v170 = v95;
          __int16 v171 = 2112;
          v172 = v96;
          __int16 v173 = 2112;
          v174 = v82;
          __int16 v175 = 2112;
          v176 = v90;
          _os_log_impl(&dword_1D49D5000, v94, OS_LOG_TYPE_INFO, "%{public}@[%@] Registering UARP Accessory %@ with AssetID %@", buf, 0x2Au);

          id v9 = v167;
        }

        if ([v91 addAccessory:v82 assetID:v90])
        {
          v97 = [v8 firmwareVersion];
          uint64_t v98 = [v97 versionString];

          if (![v8 supportsCHIP]) {
            goto LABEL_75;
          }
          v99 = [v8 firmwareUpdateProfile];
          [v99 matterFirmwareUpdateProfile];
          v100 = v90;
          v101 = v91;
          v103 = v102 = (void *)v98;
          v104 = [v103 matterFirmwareRevisionNumber];
          uint64_t v105 = [v104 stringValue];

          uint64_t v91 = v101;
          v90 = v100;

          id v9 = v167;
          uint64_t v98 = v105;
          if (v105)
          {
LABEL_75:
            v165 = (void *)v98;
            v106 = (void *)MEMORY[0x1D9452090]();
            v107 = v93;
            v108 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
            {
              v109 = HMFGetLogIdentifier();
              v110 = [v8 shortDescription];
              v111 = [v8 name];
              *(_DWORD *)buf = 138544386;
              v170 = v109;
              __int16 v171 = 2112;
              v172 = v110;
              __int16 v173 = 2112;
              v174 = v111;
              __int16 v175 = 2112;
              v176 = v82;
              __int16 v177 = 2112;
              v178 = v165;
              _os_log_impl(&dword_1D49D5000, v108, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Registered accessory %@ %@, version %@ with FirmwareUpdateManager", buf, 0x34u);

              id v9 = v167;
            }

            if (([v91 updateProperty:4 value:v165 forAccessory:v82] & 1) == 0)
            {
              v112 = (void *)MEMORY[0x1D9452090]();
              v113 = v107;
              v114 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
              {
                v115 = HMFGetLogIdentifier();
                v116 = [v8 shortDescription];
                *(_DWORD *)buf = 138543618;
                v170 = v115;
                __int16 v171 = 2112;
                v172 = v116;
                _os_log_impl(&dword_1D49D5000, v114, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to update UARP accessory firmware version property for accessory", buf, 0x16u);
              }
              id v9 = v167;
            }
            if ([v8 isAppleAccessory])
            {
              v117 = [(HMDAccessoryFirmwareUpdateManager *)v107 sessionForUARPAccessory:v82];
              if (v117)
              {
                v118 = (void *)MEMORY[0x1D9452090]();
                v119 = v107;
                v120 = HMFGetOSLogHandle();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  HMFGetLogIdentifier();
                  v121 = v158 = v117;
                  [v8 shortDescription];
                  v122 = v155 = v118;
                  v123 = [v82 uuid];
                  *(_DWORD *)buf = 138543874;
                  v170 = v121;
                  __int16 v171 = 2112;
                  v172 = v122;
                  __int16 v173 = 2112;
                  v174 = v123;
                  _os_log_impl(&dword_1D49D5000, v120, OS_LOG_TYPE_ERROR, "%{public}@[%@] Session already created when trying to register accessory %@ with FirmwareUpdateSession", buf, 0x20u);

                  v118 = v155;
                  v117 = v158;
                }
              }
              v124 = (void *)MEMORY[0x1D9452090]();
              v125 = v107;
              v126 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
              {
                HMFGetLogIdentifier();
                v127 = v159 = v117;
                v128 = [v8 shortDescription];
                [v82 uuid];
                v129 = v156 = v124;
                *(_DWORD *)buf = 138543874;
                v170 = v127;
                __int16 v171 = 2112;
                v172 = v128;
                __int16 v173 = 2112;
                v174 = v129;
                _os_log_impl(&dword_1D49D5000, v126, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Creating session to register accessory %@ with FirmwareUpdateSession", buf, 0x20u);

                v124 = v156;
                v117 = v159;
              }

              v130 = [(HMDAccessoryFirmwareUpdateManager *)v125 addSessionForUARPAccessory:v82];

              [v130 registerAccessory];
              id v9 = v167;
            }
            v131 = (void *)MEMORY[0x1D9452090]();
            v132 = v107;
            v133 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
            {
              v134 = HMFGetLogIdentifier();
              v135 = [v8 shortDescription];
              v136 = [v8 firmwareVersion];
              *(_DWORD *)buf = 138544130;
              v170 = v134;
              __int16 v171 = 2112;
              v172 = v135;
              __int16 v173 = 2112;
              v174 = v136;
              __int16 v175 = 2112;
              v176 = v165;
              _os_log_impl(&dword_1D49D5000, v133, OS_LOG_TYPE_INFO, "%{public}@[%@] Accessory firmware version updated to %@ (%@)", buf, 0x2Au);

              id v9 = v167;
            }

            BOOL v20 = 1;
            goto LABEL_95;
          }
          v137 = (void *)MEMORY[0x1D9452090]();
          v138 = v93;
          v139 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            v143 = HMFGetLogIdentifier();
            v144 = [v8 shortDescription];
            *(_DWORD *)buf = 138543874;
            v170 = v143;
            __int16 v171 = 2112;
            v172 = v144;
            __int16 v173 = 2112;
            v174 = 0;
            _os_log_impl(&dword_1D49D5000, v139, OS_LOG_TYPE_ERROR, "%{public}@[%@] Matter firmware version is invalid: %@", buf, 0x20u);
          }
        }
        else
        {
          v137 = (void *)MEMORY[0x1D9452090]();
          v138 = v93;
          v139 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            v140 = HMFGetLogIdentifier();
            v141 = [v8 shortDescription];
            *(_DWORD *)buf = 138543874;
            v170 = v140;
            __int16 v171 = 2112;
            v172 = v141;
            __int16 v173 = 2112;
            v174 = v82;
            _os_log_impl(&dword_1D49D5000, v139, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to register UARP accessory %@", buf, 0x20u);

            id v9 = v167;
          }
        }

        BOOL v20 = 0;
LABEL_95:

LABEL_96:
        goto LABEL_97;
      }
      v61 = (void *)MEMORY[0x1D9452090]();
      v62 = v41;
      v63 = HMFGetOSLogHandle();
      id v9 = v167;
      if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        goto LABEL_56;
      }
      v64 = HMFGetLogIdentifier();
      v65 = [v8 shortDescription];
      __int16 v79 = [v8 name];
      v80 = HMFBooleanToString();
      __int16 v81 = HMFBooleanToString();
      *(_DWORD *)buf = 138544386;
      v170 = v64;
      __int16 v171 = 2112;
      v172 = v65;
      __int16 v173 = 2112;
      v174 = v79;
      __int16 v175 = 2112;
      v176 = v80;
      __int16 v177 = 2112;
      v178 = v81;
      _os_log_impl(&dword_1D49D5000, v63, OS_LOG_TYPE_ERROR, "%{public}@[%@] Not registering accessory %@ with FirmwareUpdateManager. Details: validAFUSettings = %@, validDynamicAssetUpdateSettings = %@", buf, 0x34u);

      goto LABEL_55;
    }
    v161 = HMFGetLogIdentifier();
    contexta = [v8 shortDescription];
    uint64_t v43 = HMFBooleanToString();
    uint64_t v44 = HMFBooleanToString();
    uint64_t v45 = HMFBooleanToString();
    v46 = HMFBooleanToString();
    uint64_t v47 = [v8 identityType];
    v154 = (void *)v45;
    v48 = (void *)v44;
    if (!v47) {
      goto LABEL_44;
    }
    if (v47 != 3)
    {
      int v49 = (void *)v43;
      v50 = @"AppleModelNumber";
      if (v47 == 1) {
        v50 = @"ProductData";
      }
      goto LABEL_45;
    }
    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      int v49 = (void *)v43;
      v50 = @"VendorProductID";
    }
    else
    {
LABEL_44:
      int v49 = (void *)v43;
      v50 = @"Unknown";
    }
LABEL_45:
    id v66 = v50;
    *(_DWORD *)buf = 138544898;
    v170 = v161;
    __int16 v171 = 2112;
    v172 = contexta;
    __int16 v173 = 2112;
    v174 = v49;
    __int16 v175 = 2112;
    v176 = v48;
    __int16 v177 = 2112;
    v178 = v154;
    __int16 v179 = 2112;
    v180 = v46;
    __int16 v181 = 2112;
    v182 = v66;
    _os_log_impl(&dword_1D49D5000, v42, OS_LOG_TYPE_INFO, "%{public}@[%@] Valid AFU settings = %@ : isOwner = %@, hasFirmwareUpdateProfile = %@, hasFirmwareVersion = %@, identityType = %@", buf, 0x48u);

    goto LABEL_46;
  }
  v15 = (void *)MEMORY[0x1D9452090]();
  __int16 v16 = self;
  int v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v18 = HMFGetLogIdentifier();
    __int16 v19 = [v8 shortDescription];
    *(_DWORD *)buf = 138543618;
    v170 = v18;
    __int16 v171 = 2112;
    v172 = v19;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Accessory already registered with FirmwareUpdateManager", buf, 0x16u);
  }
  BOOL v20 = 1;
LABEL_97:

  return v20;
}

- (BOOL)registerAccessory:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__HMDAccessoryFirmwareUpdateManager_registerAccessory___block_invoke;
  v8[3] = &unk_1E6A197C8;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  dispatch_async(v5, v8);

  return 1;
}

void __55__HMDAccessoryFirmwareUpdateManager_registerAccessory___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1D9452090]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    id v6 = [*(id *)(a1 + 40) shortDescription];
    int v12 = 138543618;
    id v13 = v5;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1D49D5000, v4, OS_LOG_TYPE_INFO, "%{public}@[%@] Registering accessory with FirmwareUpdateManager", (uint8_t *)&v12, 0x16u);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_registerAccessory:source:path:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "defaultUpdateAssetSourceWithAccessory:", *(void *)(a1 + 40)), 0) & 1) == 0)
  {
    BOOL v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 32);
    id v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = HMFGetLogIdentifier();
      int v11 = [*(id *)(a1 + 40) shortDescription];
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2112;
      v15 = v11;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@[%@] FirmwareUpdateManager Registration failed for accessory", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (int64_t)defaultProductDataUpdateAssetSource
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HMDAccessoryFirmwareUpdateManager_defaultProductDataUpdateAssetSource__block_invoke;
  block[3] = &unk_1E6A19B30;
  void block[4] = self;
  if (defaultProductDataUpdateAssetSource_onceToken != -1) {
    dispatch_once(&defaultProductDataUpdateAssetSource_onceToken, block);
  }
  return defaultProductDataUpdateAssetSource_updateAssetSource;
}

void __72__HMDAccessoryFirmwareUpdateManager_defaultProductDataUpdateAssetSource__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F65530] sharedPreferences];
  id v3 = [v2 preferenceForKey:@"firmwareUpdateiCloudContainer"];
  id v4 = [v3 stringValue];

  if (v4 && isValidHMSoftwareUpdateAssetSourceString()) {
    defaultProductDataUpdateAssetSource_updateAssetSource = stringToHMSoftwareUpdateAssetSource();
  }
  v5 = (void *)MEMORY[0x1D9452090]();
  id v6 = *(id *)(a1 + 32);
  BOOL v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = HMFGetLogIdentifier();
    id v9 = HMSoftwareUpdateAssetSourceAsString();
    int v10 = 138543618;
    int v11 = v8;
    __int16 v12 = 2112;
    id v13 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Setting MFi default container to: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (int64_t)defaultUpdateAssetSourceWithAccessory:(id)a3
{
  int64_t result = [a3 identityType];
  if (result)
  {
    if (result == 3)
    {
      if (_os_feature_enabled_impl()) {
        return 8;
      }
      else {
        return 8
      }
             * (CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0) != 0);
    }
    else if (result == 1)
    {
      return [(HMDAccessoryFirmwareUpdateManager *)self defaultProductDataUpdateAssetSource];
    }
    else
    {
      return 7;
    }
  }
  return result;
}

- (void)_handleMatterSettingsUpdateNotification:(id)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = (void *)MEMORY[0x1D9452090]();
  id v9 = self;
  int v10 = HMFGetOSLogHandle();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v7)
  {
    if (v11)
    {
      uint64_t v34 = HMFGetLogIdentifier();
      int v84 = 138543362;
      __int16 v85 = v34;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received matter settings update notification", (uint8_t *)&v84, 0xCu);
    }
    uint64_t v35 = MEMORY[0x1D9452090]();
    v36 = v9;
    v37 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    char v38 = HMFGetLogIdentifier();
    char v39 = [v4 object];
    v40 = objc_opt_class();
    id v41 = v40;
    uint64_t v42 = objc_opt_class();
    int v84 = 138543874;
    __int16 v85 = v38;
    __int16 v86 = 2112;
    __int16 v87 = v40;
    __int16 v88 = 2112;
    uint64_t v89 = v42;
    _os_log_impl(&dword_1D49D5000, v37, OS_LOG_TYPE_ERROR, "%{public}@The notification object of type %@ is not of expected type %@", (uint8_t *)&v84, 0x20u);

    goto LABEL_30;
  }
  if (v11)
  {
    __int16 v12 = HMFGetLogIdentifier();
    id v13 = [v7 shortDescription];
    int v84 = 138543618;
    __int16 v85 = v12;
    __int16 v86 = 2112;
    __int16 v87 = v13;
    _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Received matter settings update notification", (uint8_t *)&v84, 0x16u);
  }
  if (![(HMDAccessoryFirmwareUpdateManager *)v9 supportsFirmwareUpdate])
  {
    uint64_t v35 = MEMORY[0x1D9452090]();
    v36 = v9;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      char v38 = HMFGetLogIdentifier();
      uint64_t v43 = [v7 shortDescription];
      int v84 = 138543618;
      __int16 v85 = v38;
      __int16 v86 = 2112;
      __int16 v87 = v43;
      uint64_t v44 = "%{public}@[%@] Firmware Update not enabled on this device; ignoring";
      uint64_t v45 = v37;
      os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
LABEL_29:
      _os_log_impl(&dword_1D49D5000, v45, v46, v44, (uint8_t *)&v84, 0x16u);

LABEL_30:
    }
LABEL_31:

    id v33 = (void *)v35;
    goto LABEL_32;
  }
  if (([v7 supportsCHIP] & 1) == 0)
  {
    uint64_t v35 = MEMORY[0x1D9452090]();
    v36 = v9;
    v37 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      char v38 = HMFGetLogIdentifier();
      uint64_t v43 = [v7 shortDescription];
      int v84 = 138543618;
      __int16 v85 = v38;
      __int16 v86 = 2112;
      __int16 v87 = v43;
      uint64_t v44 = "%{public}@[%@] Matter firmware update not supported";
      uint64_t v45 = v37;
      os_log_type_t v46 = OS_LOG_TYPE_DEBUG;
      goto LABEL_29;
    }
    goto LABEL_31;
  }
  uint64_t v14 = [v4 name];
  int v15 = [v14 isEqualToString:@"HMDAccessoryVendorIDProductIDUpdatedNotification"];

  if (v15)
  {
    uint64_t v16 = (void *)MEMORY[0x1D9452090]();
    int v17 = v9;
    uint64_t v18 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = HMFGetLogIdentifier();
      BOOL v20 = [v7 shortDescription];
      int v84 = 138543618;
      __int16 v85 = v19;
      __int16 v86 = 2112;
      __int16 v87 = v20;
      _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@[%@] Received VID/PID update notification", (uint8_t *)&v84, 0x16u);
    }
    uint64_t v21 = [v7 matterVendorID];
    if (!v21) {
      goto LABEL_17;
    }
    id v22 = (void *)v21;
    uint64_t v23 = [v7 matterProductID];
    if (!v23) {
      goto LABEL_16;
    }
    int64_t v24 = (void *)v23;
    id v25 = [v7 matterVendorID];
    if ([v25 isEqualToNumber:&unk_1F2DC8AB8])
    {

LABEL_16:
LABEL_17:
      uint64_t v26 = MEMORY[0x1D9452090]();
      uint64_t v27 = v17;
      char v28 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
LABEL_20:

        id v33 = (void *)v26;
LABEL_32:
        goto LABEL_33;
      }
      id v29 = HMFGetLogIdentifier();
      BOOL v30 = [v7 shortDescription];
      BOOL v31 = [v7 matterVendorID];
      __int16 v32 = [v7 matterProductID];
      int v84 = 138544130;
      __int16 v85 = v29;
      __int16 v86 = 2112;
      __int16 v87 = v30;
      __int16 v88 = 2112;
      uint64_t v89 = (uint64_t)v31;
      __int16 v90 = 2112;
      uint64_t v91 = v32;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Ignoring invalid VID: %@, PID: %@", (uint8_t *)&v84, 0x2Au);

LABEL_19:
      goto LABEL_20;
    }
    uint64_t v47 = [v7 matterProductID];
    char v48 = [v47 isEqualToNumber:&unk_1F2DC8AB8];

    if (v48) {
      goto LABEL_17;
    }
  }
  int v49 = [v4 name];
  int v50 = [v49 isEqualToString:@"HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"];

  if (v50)
  {
    v51 = (void *)MEMORY[0x1D9452090]();
    v52 = v9;
    v53 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      v54 = HMFGetLogIdentifier();
      v55 = [v7 shortDescription];
      int v84 = 138543618;
      __int16 v85 = v54;
      __int16 v86 = 2112;
      __int16 v87 = v55;
      _os_log_impl(&dword_1D49D5000, v53, OS_LOG_TYPE_INFO, "%{public}@[%@] Received matter firmware revision number update notification", (uint8_t *)&v84, 0x16u);
    }
    v56 = [v7 firmwareUpdateProfile];
    v57 = [v56 matterFirmwareUpdateProfile];
    v58 = [v57 matterFirmwareRevisionNumber];

    v59 = (void *)MEMORY[0x1D9452090]();
    v60 = v52;
    v61 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      v62 = HMFGetLogIdentifier();
      v63 = [v7 shortDescription];
      int v84 = 138543874;
      __int16 v85 = v62;
      __int16 v86 = 2112;
      __int16 v87 = v63;
      __int16 v88 = 2112;
      uint64_t v89 = (uint64_t)v58;
      _os_log_impl(&dword_1D49D5000, v61, OS_LOG_TYPE_INFO, "%{public}@[%@] Firmware Update Manager: Received matter firmware revision number update notification, request change to %@", (uint8_t *)&v84, 0x20u);
    }
    if (!v58)
    {
      uint64_t v26 = MEMORY[0x1D9452090]();
      uint64_t v27 = v60;
      char v28 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
        goto LABEL_20;
      }
      id v29 = HMFGetLogIdentifier();
      BOOL v30 = [v7 shortDescription];
      int v84 = 138543874;
      __int16 v85 = v29;
      __int16 v86 = 2112;
      __int16 v87 = v30;
      __int16 v88 = 2112;
      uint64_t v89 = 0;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_INFO, "%{public}@[%@] Ignoring invalid matterFirmwareRevisionNumber: %@", (uint8_t *)&v84, 0x20u);
      goto LABEL_19;
    }
  }
  v64 = [(HMDAccessoryFirmwareUpdateManager *)v9 registerAndCreateSessionForAccessory:v7 updateUARPParameters:0];
  if (v64)
  {
    v65 = (void *)MEMORY[0x1D9452090]();
    id v66 = v9;
    uint64_t v67 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      v68 = HMFGetLogIdentifier();
      v69 = [v7 shortDescription];
      int v84 = 138543618;
      __int16 v85 = v68;
      __int16 v86 = 2112;
      __int16 v87 = v69;
      _os_log_impl(&dword_1D49D5000, v67, OS_LOG_TYPE_ERROR, "%{public}@Failed to register and create session for accessory: %@", (uint8_t *)&v84, 0x16u);
    }
  }
  else
  {
    v70 = [v4 name];
    int v71 = [v70 isEqualToString:@"HMDAccessoryVendorIDProductIDUpdatedNotification"];

    if (v71)
    {
      v72 = (void *)MEMORY[0x1D9452090]();
      int v73 = v9;
      id v74 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        id v75 = HMFGetLogIdentifier();
        v76 = [v7 shortDescription];
        int v84 = 138543874;
        __int16 v85 = v75;
        __int16 v86 = 2112;
        __int16 v87 = v76;
        __int16 v88 = 2112;
        uint64_t v89 = 0;
        _os_log_impl(&dword_1D49D5000, v74, OS_LOG_TYPE_INFO, "%{public}@[%@] Updating accessory vendor ID and product ID with new session %@", (uint8_t *)&v84, 0x20u);
      }
      [0 updateAccessoryVendorIDAndProductID];
    }
    else
    {
      v77 = [v4 name];
      int v78 = [v77 isEqualToString:@"HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification"];

      if (v78)
      {
        __int16 v79 = (void *)MEMORY[0x1D9452090]();
        v80 = v9;
        __int16 v81 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
        {
          v82 = HMFGetLogIdentifier();
          __int16 v83 = [v7 shortDescription];
          int v84 = 138543874;
          __int16 v85 = v82;
          __int16 v86 = 2112;
          __int16 v87 = v83;
          __int16 v88 = 2112;
          uint64_t v89 = 0;
          _os_log_impl(&dword_1D49D5000, v81, OS_LOG_TYPE_INFO, "%{public}@[%@] Updating matter firmware version number with new session %@", (uint8_t *)&v84, 0x20u);
        }
        [0 updateAccessoryFirmwareVersion];
      }
    }
  }

LABEL_33:
}

- (void)handleMatterSettingsUpdateNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HMDAccessoryFirmwareUpdateManager_handleMatterSettingsUpdateNotification___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __76__HMDAccessoryFirmwareUpdateManager_handleMatterSettingsUpdateNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleMatterSettingsUpdateNotification:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (void)_handleAccessoryFirmwareVersionUpdateNotification:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(HMDAccessoryFirmwareUpdateManager *)self supportsFirmwareUpdate])
  {
    v5 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    id v8 = (void *)MEMORY[0x1D9452090]();
    id v9 = self;
    int v10 = HMFGetOSLogHandle();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (!v7)
    {
      if (v11)
      {
        id v29 = HMFGetLogIdentifier();
        int v57 = 138543362;
        v58 = v29;
        _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware version update notification", (uint8_t *)&v57, 0xCu);
      }
      BOOL v30 = (void *)MEMORY[0x1D9452090]();
      BOOL v31 = v9;
      __int16 v32 = HMFGetOSLogHandle();
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      id v33 = HMFGetLogIdentifier();
      uint64_t v34 = [v4 object];
      uint64_t v35 = objc_opt_class();
      id v36 = v35;
      uint64_t v37 = objc_opt_class();
      int v57 = 138543874;
      v58 = v33;
      __int16 v59 = 2112;
      v60 = v35;
      __int16 v61 = 2112;
      uint64_t v62 = v37;
      _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@The notification object of type %@ is not of expected type %@", (uint8_t *)&v57, 0x20u);

      goto LABEL_28;
    }
    if (v11)
    {
      __int16 v12 = HMFGetLogIdentifier();
      id v13 = [v7 shortDescription];
      int v57 = 138543618;
      v58 = v12;
      __int16 v59 = 2112;
      v60 = v13;
      _os_log_impl(&dword_1D49D5000, v10, OS_LOG_TYPE_INFO, "%{public}@[%@] Received accessory firmware version update notification", (uint8_t *)&v57, 0x16u);
    }
    if ([(HMDAccessoryFirmwareUpdateManager *)v9 registerAccessory:v7])
    {
      if ([(HMDAccessoryFirmwareUpdateManager *)v9 isAccessoryRegistered:v7])
      {
        uint64_t v14 = [(HMDAccessoryFirmwareUpdateManager *)v9 sessionForAccessory:v7];
        if (v14)
        {
          int v15 = (void *)v14;
          uint64_t v16 = (void *)MEMORY[0x1D9452090]();
          int v17 = v9;
          uint64_t v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            __int16 v19 = HMFGetLogIdentifier();
            BOOL v20 = [v7 shortDescription];
            int v57 = 138543874;
            v58 = v19;
            __int16 v59 = 2112;
            v60 = v20;
            __int16 v61 = 2112;
            uint64_t v62 = (uint64_t)v15;
            _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_DEBUG, "%{public}@[%@] Do not need to establish a new session with existing session: %@", (uint8_t *)&v57, 0x20u);
          }
          goto LABEL_48;
        }
        v40 = [(HMDAccessoryFirmwareUpdateManager *)v9 UARPAccessoryForHMDAccessory:v7];
        if (v40)
        {
          uint64_t v41 = [(HMDAccessoryFirmwareUpdateManager *)v9 addSessionForUARPAccessory:v40];
          if (v41)
          {
            int v15 = (void *)v41;
            int v42 = [v7 supportsCHIP];
            uint64_t v43 = (void *)MEMORY[0x1D9452090]();
            uint64_t v44 = v9;
            uint64_t v45 = HMFGetOSLogHandle();
            os_log_type_t v46 = v45;
            if (v42)
            {
              if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              {
                uint64_t v47 = HMFGetLogIdentifier();
                char v48 = [v7 shortDescription];
                int v57 = 138543618;
                v58 = v47;
                __int16 v59 = 2112;
                v60 = v48;
                _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_ERROR, "%{public}@[%@] Ignoring this notification for updating UARP with firmware version", (uint8_t *)&v57, 0x16u);
              }
            }
            else
            {
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                v55 = HMFGetLogIdentifier();
                v56 = [v7 shortDescription];
                int v57 = 138543874;
                v58 = v55;
                __int16 v59 = 2112;
                v60 = v56;
                __int16 v61 = 2112;
                uint64_t v62 = (uint64_t)v15;
                _os_log_impl(&dword_1D49D5000, v46, OS_LOG_TYPE_INFO, "%{public}@[%@] Updating accessory firmware version with new session %@", (uint8_t *)&v57, 0x20u);
              }
              [v15 updateAccessoryFirmwareVersion];
            }
            goto LABEL_47;
          }
          int v49 = (void *)MEMORY[0x1D9452090]();
          int v50 = v9;
          v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = HMFGetLogIdentifier();
            v53 = [v7 shortDescription];
            int v57 = 138543618;
            v58 = v52;
            __int16 v59 = 2112;
            v60 = v53;
            v54 = "%{public}@[%@] Failed to start update for accessory because a session could not be established";
            goto LABEL_42;
          }
        }
        else
        {
          int v49 = (void *)MEMORY[0x1D9452090]();
          int v50 = v9;
          v51 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v52 = HMFGetLogIdentifier();
            v53 = [v7 shortDescription];
            int v57 = 138543618;
            v58 = v52;
            __int16 v59 = 2112;
            v60 = v53;
            v54 = "%{public}@[%@] UARP accessory is not found for accessory";
LABEL_42:
            _os_log_impl(&dword_1D49D5000, v51, OS_LOG_TYPE_ERROR, v54, (uint8_t *)&v57, 0x16u);
          }
        }

        int v15 = 0;
LABEL_47:

LABEL_48:
        goto LABEL_30;
      }
      BOOL v30 = (void *)MEMORY[0x1D9452090]();
      BOOL v31 = v9;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v33 = HMFGetLogIdentifier();
        char v38 = [v7 shortDescription];
        int v57 = 138543618;
        v58 = v33;
        __int16 v59 = 2112;
        v60 = v38;
        char v39 = "%{public}@[%@] Accessory not registered with FirmwareUpdateManager";
        goto LABEL_27;
      }
    }
    else
    {
      BOOL v30 = (void *)MEMORY[0x1D9452090]();
      BOOL v31 = v9;
      __int16 v32 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        id v33 = HMFGetLogIdentifier();
        char v38 = [v7 shortDescription];
        int v57 = 138543618;
        v58 = v33;
        __int16 v59 = 2112;
        v60 = v38;
        char v39 = "%{public}@[%@] Failed to register accessory with FirmwareUpdateManager";
LABEL_27:
        _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_DEBUG, v39, (uint8_t *)&v57, 0x16u);

LABEL_28:
      }
    }
LABEL_29:

LABEL_30:

    goto LABEL_31;
  }
  uint64_t v21 = (void *)MEMORY[0x1D9452090]();
  id v22 = self;
  uint64_t v23 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    int64_t v24 = HMFGetLogIdentifier();
    int v57 = 138543362;
    v58 = v24;
    _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Received accessory firmware version update notification", (uint8_t *)&v57, 0xCu);
  }
  id v25 = (void *)MEMORY[0x1D9452090]();
  uint64_t v26 = v22;
  uint64_t v27 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    char v28 = HMFGetLogIdentifier();
    int v57 = 138543362;
    v58 = v28;
    _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@Firmware Update not enabled on this device; ignoring",
      (uint8_t *)&v57,
      0xCu);
  }
LABEL_31:
}

- (void)handleAccessoryFirmwareVersionUpdateNotification:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__HMDAccessoryFirmwareUpdateManager_handleAccessoryFirmwareVersionUpdateNotification___block_invoke;
  block[3] = &unk_1E6A16CE0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __86__HMDAccessoryFirmwareUpdateManager_handleAccessoryFirmwareVersionUpdateNotification___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _handleAccessoryFirmwareVersionUpdateNotification:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

- (BOOL)isAccessoryRegistered:(id)a3
{
  id v4 = a3;
  v5 = [(HMDAccessoryFirmwareUpdateManager *)self registeredAccessories];
  id v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

- (id)matterUARPController
{
  id v2 = [(HMDAccessoryFirmwareUpdateManager *)self wingman];
  id v3 = [v2 matterUARPController];

  return v3;
}

- (UARPController)defaultUARPController
{
  id v2 = [(HMDAccessoryFirmwareUpdateManager *)self wingman];
  id v3 = [v2 defaultUARPController];

  return (UARPController *)v3;
}

- (id)UARPControllerForAccessory:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))&& [v4 supportsCHIP])
  {
    v5 = (void *)MEMORY[0x1D9452090]();
    id v6 = self;
    id v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = HMFGetLogIdentifier();
      id v9 = [v4 shortDescription];
      int v18 = 138543618;
      __int16 v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@[%@] UARPControllerForAccessory: Returning Matter UARP Controller", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v10 = [(HMDAccessoryFirmwareUpdateManager *)v6 matterUARPController];
  }
  else
  {
    BOOL v11 = (void *)MEMORY[0x1D9452090]();
    __int16 v12 = self;
    id v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      int v15 = [v4 shortDescription];
      int v18 = 138543618;
      __int16 v19 = v14;
      __int16 v20 = 2112;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@[%@] UARPControllerForAccessory: Returning default UARP Controller", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v10 = [(HMDAccessoryFirmwareUpdateManager *)v12 defaultUARPController];
  }
  uint64_t v16 = (void *)v10;

  return v16;
}

- (id)registerAndCreateSessionForAccessory:(id)a3 updateUARPParameters:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![(HMDAccessoryFirmwareUpdateManager *)self supportsFirmwareUpdate])
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = HMFGetLogIdentifier();
      __int16 v19 = [v6 shortDescription];
      int v38 = 138543618;
      char v39 = v18;
      __int16 v40 = 2112;
      uint64_t v41 = v19;
      __int16 v20 = "%{public}@[CHECK_AFU_SESSION][%@] Firmware Update not enabled on this device; ignoring";
      uint64_t v21 = v17;
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
LABEL_18:
      _os_log_impl(&dword_1D49D5000, v21, v22, v20, (uint8_t *)&v38, 0x16u);

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (([v6 supportsCHIP] & 1) == 0)
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    int v18 = HMFGetLogIdentifier();
    __int16 v19 = [v6 shortDescription];
    int v38 = 138543618;
    char v39 = v18;
    __int16 v40 = 2112;
    uint64_t v41 = v19;
    __int16 v20 = "%{public}@[CHECK_AFU_SESSION][%@] Matter firmware update not supported";
LABEL_17:
    uint64_t v21 = v17;
    os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
    goto LABEL_18;
  }
  if (![(HMDAccessoryFirmwareUpdateManager *)self registerAccessory:v6])
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_19;
    }
    int v18 = HMFGetLogIdentifier();
    __int16 v19 = [v6 shortDescription];
    int v38 = 138543618;
    char v39 = v18;
    __int16 v40 = 2112;
    uint64_t v41 = v19;
    __int16 v20 = "%{public}@[CHECK_AFU_SESSION][%@] Failed to register accessory";
    goto LABEL_17;
  }
  if (![(HMDAccessoryFirmwareUpdateManager *)self isAccessoryRegistered:v6])
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    uint64_t v16 = self;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = HMFGetLogIdentifier();
      __int16 v19 = [v6 shortDescription];
      int v38 = 138543618;
      char v39 = v18;
      __int16 v40 = 2112;
      uint64_t v41 = v19;
      __int16 v20 = "%{public}@[CHECK_AFU_SESSION][%@] accessory not registered";
      goto LABEL_17;
    }
LABEL_19:

    uint64_t v14 = 0;
    goto LABEL_20;
  }
  uint64_t v7 = [(HMDAccessoryFirmwareUpdateManager *)self sessionForAccessory:v6];
  if (v7)
  {
    id v8 = (id)v7;
    id v9 = (void *)MEMORY[0x1D9452090]();
    uint64_t v10 = self;
    BOOL v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = HMFGetLogIdentifier();
      id v13 = [v6 shortDescription];
      int v38 = 138543874;
      char v39 = v12;
      __int16 v40 = 2112;
      uint64_t v41 = v13;
      __int16 v42 = 2112;
      id v43 = v8;
      _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_DEBUG, "%{public}@[CHECK_AFU_SESSION][%@] Do not need to establish a new session, existing session found: %@", (uint8_t *)&v38, 0x20u);
    }
    uint64_t v14 = 0;
    goto LABEL_37;
  }
  int64_t v24 = [(HMDAccessoryFirmwareUpdateManager *)self UARPAccessoryForHMDAccessory:v6];
  if (v24)
  {
    id v25 = [(HMDAccessoryFirmwareUpdateManager *)self addSessionForUARPAccessory:v24];
    if (v25)
    {
      uint64_t v26 = v25;
      if (v4)
      {
        [v25 updateAccessoryVendorIDAndProductID];
        [v26 updateAccessoryFirmwareVersion];
      }
      uint64_t v27 = (void *)MEMORY[0x1D9452090]();
      char v28 = self;
      id v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        BOOL v30 = HMFGetLogIdentifier();
        BOOL v31 = [v6 shortDescription];
        int v38 = 138543618;
        char v39 = v30;
        __int16 v40 = 2112;
        uint64_t v41 = v31;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_INFO, "%{public}@[CHECK_AFU_SESSION][%@] Firmware update registration and session creation complete", (uint8_t *)&v38, 0x16u);
      }
      id v8 = v26;
      goto LABEL_36;
    }
    __int16 v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = self;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      id v36 = [v6 shortDescription];
      int v38 = 138543618;
      char v39 = v35;
      __int16 v40 = 2112;
      uint64_t v41 = v36;
      uint64_t v37 = "%{public}@[CHECK_AFU_SESSION][%@] Failed to establish session for accessory";
      goto LABEL_34;
    }
  }
  else
  {
    __int16 v32 = (void *)MEMORY[0x1D9452090]();
    id v33 = self;
    uint64_t v34 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = HMFGetLogIdentifier();
      id v36 = [v6 shortDescription];
      int v38 = 138543618;
      char v39 = v35;
      __int16 v40 = 2112;
      uint64_t v41 = v36;
      uint64_t v37 = "%{public}@[CHECK_AFU_SESSION][%@] UARP accessory is not found for accessory";
LABEL_34:
      _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_ERROR, v37, (uint8_t *)&v38, 0x16u);
    }
  }

  id v8 = 0;
LABEL_36:

  uint64_t v14 = v8;
LABEL_37:

LABEL_20:
  return v14;
}

- (id)availableSoftwareAssetForMatterAccessory:(id)a3 error:(id *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0
    && !CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
  {
    int v17 = (void *)MEMORY[0x1D9452090]();
    int v18 = self;
    __int16 v19 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    __int16 v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v6 shortDescription];
    *(_DWORD *)buf = 138543874;
    int v38 = v20;
    __int16 v39 = 2112;
    __int16 v40 = v21;
    __int16 v41 = 2080;
    __int16 v42 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
    os_log_type_t v22 = "%{public}@[%@] %s: Matter Accessory Software Update not enabled.";
    goto LABEL_14;
  }
  if ([v6 supportsCHIP])
  {
    uint64_t v7 = [(HMDAccessoryFirmwareUpdateManager *)self sessionForAccessory:v6];
    id v8 = v7;
    if (!v7)
    {
      uint64_t v23 = (void *)MEMORY[0x1D9452090]();
      int64_t v24 = self;
      id v25 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = HMFGetLogIdentifier();
        uint64_t v27 = [v6 shortDescription];
        *(_DWORD *)buf = 138543874;
        int v38 = v26;
        __int16 v39 = 2112;
        __int16 v40 = v27;
        __int16 v41 = 2080;
        __int16 v42 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
        _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@[%@] %s: no session", buf, 0x20u);
      }
      id v9 = 0;
      if (!a4) {
        goto LABEL_32;
      }
      uint64_t v11 = 4;
      goto LABEL_31;
    }
    id v9 = [v7 uarpAssetID];
    uint64_t v10 = [v9 updateAvailabilityStatus];
    if ((unint64_t)(v10 - 6) < 3)
    {
      __int16 v12 = (void *)MEMORY[0x1D9452090]();
      char v28 = self;
      uint64_t v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v29 = HMFGetLogIdentifier();
        BOOL v30 = [v6 shortDescription];
        [v9 updateAvailabilityStatus];
        BOOL v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
        *(_DWORD *)buf = 138544130;
        int v38 = v29;
        __int16 v39 = 2112;
        __int16 v40 = v30;
        __int16 v41 = 2080;
        __int16 v42 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
        __int16 v43 = 2114;
        uint64_t v44 = v31;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] %s: Image is not available %{public}@", buf, 0x2Au);
      }
      uint64_t v11 = 4;
    }
    else
    {
      uint64_t v11 = v10;
      if ((unint64_t)(v10 - 1) >= 2)
      {
        if (v10 == 3) {
          goto LABEL_30;
        }
        __int16 v12 = (void *)MEMORY[0x1D9452090]();
        __int16 v32 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v33 = HMFGetLogIdentifier();
          uint64_t v34 = [v6 shortDescription];
          [v9 updateAvailabilityStatus];
          uint64_t v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPFirmwareUpdateAvailabilityStatusToString());
          *(_DWORD *)buf = 138544130;
          int v38 = v33;
          __int16 v39 = 2112;
          __int16 v40 = v34;
          __int16 v41 = 2080;
          __int16 v42 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
          __int16 v43 = 2114;
          uint64_t v44 = v35;
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] %s: These statuses should never be seen, ignore status %{public}@.", buf, 0x2Au);
        }
        uint64_t v11 = 1;
      }
      else
      {
        __int16 v12 = (void *)MEMORY[0x1D9452090]();
        id v13 = self;
        uint64_t v14 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = HMFGetLogIdentifier();
          uint64_t v16 = [v6 shortDescription];
          *(_DWORD *)buf = 138543874;
          int v38 = v15;
          __int16 v39 = 2112;
          __int16 v40 = v16;
          __int16 v41 = 2080;
          __int16 v42 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
          _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] %s: Image is busy downloading", buf, 0x20u);
        }
        uint64_t v11 = 2;
      }
    }

    id v9 = 0;
LABEL_30:
    if (!a4)
    {
LABEL_32:

      goto LABEL_33;
    }
LABEL_31:
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDAccessoryMatterUARPAssetErrorDomain" code:v11 userInfo:0];
    goto LABEL_32;
  }
  int v17 = (void *)MEMORY[0x1D9452090]();
  int v18 = self;
  __int16 v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    __int16 v20 = HMFGetLogIdentifier();
    uint64_t v21 = [v6 shortDescription];
    *(_DWORD *)buf = 138543874;
    int v38 = v20;
    __int16 v39 = 2112;
    __int16 v40 = v21;
    __int16 v41 = 2080;
    __int16 v42 = "-[HMDAccessoryFirmwareUpdateManager availableSoftwareAssetForMatterAccessory:error:]";
    os_log_type_t v22 = "%{public}@[%@] %s: Accessory does not support Matter.";
LABEL_14:
    _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, v22, buf, 0x20u);
  }
LABEL_15:

  if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:@"HMDAccessoryMatterUARPAssetErrorDomain" code:1 userInfo:0];
    id v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = 0;
  }
LABEL_33:

  return v9;
}

- (BOOL)supportsFirmwareUpdate
{
  id v2 = +[HMDDeviceCapabilities deviceCapabilities];
  char v3 = [v2 supportsFirmwareUpdate];

  return v3;
}

- (void)dealloc
{
  char v3 = [(HMDAccessoryFirmwareUpdateManager *)self defaultUARPController];
  [v3 stopPacketCapture];

  v4.receiver = self;
  v4.super_class = (Class)HMDAccessoryFirmwareUpdateManager;
  [(HMDAccessoryFirmwareUpdateManager *)&v4 dealloc];
}

- (HMDAccessoryFirmwareUpdateManager)initWithHomeManager:(id)a3 wingman:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HMDAccessoryFirmwareUpdateManager;
  id v8 = [(HMDAccessoryFirmwareUpdateManager *)&v56 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_homeManager, v6);
    if (v7) {
      uint64_t v10 = (HMDAccessoryFirmwareUpdateManagerWingman *)v7;
    }
    else {
      uint64_t v10 = objc_alloc_init(HMDAccessoryFirmwareUpdateManagerWingman);
    }
    wingman = v9->_wingman;
    v9->_wingman = v10;

    __int16 v12 = [[HMDDefaultUARPControllerDelegate alloc] initWithAccessoryFirmwareUpdateManager:v9];
    defaultUARPControllerDelegate = v9->_defaultUARPControllerDelegate;
    v9->_defaultUARPControllerDelegate = v12;

    uint64_t v14 = v9->_defaultUARPControllerDelegate;
    int v15 = [(HMDAccessoryFirmwareUpdateManagerWingman *)v9->_wingman defaultUARPController];
    [v15 setDelegate:v14];

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      uint64_t v16 = [[HMDMatterUARPControllerDelegate alloc] initWithAccessoryFirmwareUpdateManager:v9];
      matterUARPControllerDelegate = v9->_matterUARPControllerDelegate;
      v9->_matterUARPControllerDelegate = v16;

      int v18 = v9->_matterUARPControllerDelegate;
      __int16 v19 = [(HMDAccessoryFirmwareUpdateManagerWingman *)v9->_wingman matterUARPController];
      [v19 setDelegate:v18];
    }
    __int16 v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeSessions = v9->_activeSessions;
    v9->_activeSessions = v20;

    os_log_type_t v22 = [HMDAccessoryFirmwareUpdateConcurrencyLogEventManager alloc];
    uint64_t v23 = [v6 metricsManager];
    int64_t v24 = [v23 legacyCountersManager];
    uint64_t v25 = [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)v22 initWithCountersManager:v24];
    logEventManager = v9->_logEventManager;
    v9->_logEventManager = (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)v25;

    v9->_lock._os_unfair_lock_opaque = 0;
    uint64_t v27 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    registeredAccessories = v9->_registeredAccessories;
    v9->_registeredAccessories = (NSMapTable *)v27;

    id v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    accessoryRetries = v9->_accessoryRetries;
    v9->_accessoryRetries = v29;

    uint64_t v31 = [v6 workQueue];
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v31;

    id v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v9 selector:sel_handleAccessoryFirmwareVersionUpdateNotification_ name:@"HMDAccessoryFirmwareVersionUpdatedNotification" object:0];

    uint64_t v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v9 selector:sel_handleHomeAccessoryRemovedNotification_ name:@"HMDHomeAccessoryRemovedNotification" object:0];

    if ((_os_feature_enabled_impl() & 1) != 0
      || CFPreferencesGetAppBooleanValue(@"MatterOTA", @"/Library/Managed Preferences/mobile/com.apple.homed.plist", 0))
    {
      uint64_t v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v35 addObserver:v9 selector:sel_handleMatterSettingsUpdateNotification_ name:@"HMDAccessoryVendorIDProductIDUpdatedNotification" object:0];

      id v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v36 addObserver:v9 selector:sel_handleMatterSettingsUpdateNotification_ name:@"HMDAccessoryFirmwareUpdateMatterFirmwareRevisionNumberChangedNotification" object:0];
    }
    uint64_t v37 = [MEMORY[0x1E4F65530] sharedPreferences];
    int v38 = [v37 preferenceForKey:@"firmwareUpdateUARPCapturePath"];

    __int16 v39 = [v38 stringValue];
    if (v39)
    {
      id v55 = v7;
      id v40 = objc_alloc_init(MEMORY[0x1E4F28C10]);
      [v40 setDateFormat:@"yyyy-MM-dd_HH-mm-ss"];
      __int16 v41 = NSString;
      __int16 v42 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v43 = [v40 stringFromDate:v42];
      uint64_t v44 = [v41 stringWithFormat:@"%@_%@", v39, v43];

      uint64_t v45 = [(HMDAccessoryFirmwareUpdateManager *)v9 defaultUARPController];
      LOBYTE(v43) = [v45 startPacketCapture:v44];

      if ((v43 & 1) == 0)
      {
        os_log_type_t v46 = (void *)MEMORY[0x1D9452090]();
        uint64_t v47 = v9;
        char v48 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          int v49 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v58 = v49;
          _os_log_impl(&dword_1D49D5000, v48, OS_LOG_TYPE_ERROR, "%{public}@Error starting UARP packet capture for UARP Controller", buf, 0xCu);
        }
      }
      int v50 = (void *)MEMORY[0x1D9452090]();
      v51 = v9;
      v52 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v58 = v53;
        __int16 v59 = 2112;
        v60 = v44;
        _os_log_impl(&dword_1D49D5000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@Started UARP packet capture for UARP Controller in: %@", buf, 0x16u);
      }

      id v7 = v55;
    }
    [(HMDAccessoryFirmwareUpdateManager *)v9 startStatusTimer];
  }
  return v9;
}

- (HMDAccessoryFirmwareUpdateManager)initWithHomeManager:(id)a3
{
  return [(HMDAccessoryFirmwareUpdateManager *)self initWithHomeManager:a3 wingman:0];
}

- (HMDAccessoryFirmwareUpdateManager)init
{
  id v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  objc_super v4 = NSString;
  v5 = NSStringFromSelector(a2);
  id v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t80 != -1) {
    dispatch_once(&logCategory__hmf_once_t80, &__block_literal_global_125785);
  }
  id v2 = (void *)logCategory__hmf_once_v81;
  return v2;
}

uint64_t __48__HMDAccessoryFirmwareUpdateManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v81;
  logCategory__hmf_once___int16 v81 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end