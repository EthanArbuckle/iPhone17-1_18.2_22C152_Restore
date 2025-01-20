@interface HMDUserPhotosPersonDataManager
+ (HMPhotosPersonManagerSettings)defaultSettings;
+ (id)logCategory;
+ (id)settingsModelUUIDWithUUID:(id)a3;
- (BOOL)supportsFaceClassification;
- (HMBLocalZone)localZone;
- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver;
- (HMDPhotosPersonManager)personManager;
- (HMDPhotosPersonManagerSettingsModel)settingsModel;
- (HMDUser)user;
- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 localZone:(id)a5 workQueue:(id)a6;
- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 localZone:(id)a5 workQueue:(id)a6 supportsFaceClassification:(BOOL)a7 notificationCenter:(id)a8 cloudPhotosSettingObserver:(id)a9;
- (HMFMessageDispatcher)messageDispatcher;
- (HMPhotosPersonManagerSettings)settings;
- (NSNotificationCenter)notificationCenter;
- (NSUUID)homeUUID;
- (NSUUID)userUUID;
- (NSUUID)zoneUUID;
- (OS_dispatch_queue)workQueue;
- (id)logIdentifier;
- (id)persistedSettingsModel;
- (id)personManagerFactory;
- (id)photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser;
- (id)settingsModelUUID;
- (id)updateSettingsModelWithSettings:(id)a3;
- (void)_handleUpdatedSettingsModel:(id)a3;
- (void)configure;
- (void)configurePhotosPersonManagerWithSettingsModel:(id)a3;
- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3;
- (void)handleUpdatePersonManagerSettingsMessage:(id)a3;
- (void)handleUpdatedSettingsModel:(id)a3;
- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3;
- (void)handleUserRemoteAccessDidChangeNotification:(id)a3;
- (void)recoverDueToUUIDChangeFromOldUUID:(id)a3;
- (void)removeCloudDataDueToUserRemoval;
- (void)removeCloudDataForZoneUUID:(id)a3 isDueToHomeGraphObjectRemoval:(BOOL)a4;
- (void)setPersonManager:(id)a3;
- (void)setPersonManagerFactory:(id)a3;
- (void)setSettingsModel:(id)a3;
- (void)setUser:(id)a3;
- (void)updateSettingsForCurrentCameraClipsAccess;
@end

@implementation HMDUserPhotosPersonDataManager

- (void).cxx_destruct
{
  objc_storeStrong(&self->_personManagerFactory, 0);
  objc_storeStrong((id *)&self->_settingsModel, 0);
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_cloudPhotosSettingObserver, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_personManager, 0);
}

- (void)setPersonManagerFactory:(id)a3
{
}

- (id)personManagerFactory
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setSettingsModel:(id)a3
{
}

- (HMDPhotosPersonManagerSettingsModel)settingsModel
{
  return (HMDPhotosPersonManagerSettingsModel *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUser:(id)a3
{
}

- (HMDUser)user
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  return (HMDUser *)WeakRetained;
}

- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver
{
  return (HMDCloudPhotosSettingObserver *)objc_getProperty(self, a2, 72, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)supportsFaceClassification
{
  return self->_supportsFaceClassification;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 56, 1);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 48, 1);
}

- (NSUUID)userUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPersonManager:(id)a3
{
}

- (HMDPhotosPersonManager)personManager
{
  return (HMDPhotosPersonManager *)objc_getProperty(self, a2, 16, 1);
}

- (id)logIdentifier
{
  v2 = [(HMDUserPhotosPersonDataManager *)self userUUID];
  v3 = [v2 UUIDString];

  return v3;
}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

void __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) user];
  v3 = v2;
  if (v2)
  {
    if ([v2 isCurrentUser])
    {
      v4 = [v3 home];
      v5 = [v4 personManagerSettings];

      if (v5 && ([v5 isFaceClassificationEnabled] & 1) == 0)
      {
        v6 = (void *)MEMORY[0x1D9452090]();
        id v7 = *(id *)(a1 + 32);
        v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = HMFGetLogIdentifier();
          int v17 = 138543362;
          v18 = v9;
          _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since Face Classification was disabled", (uint8_t *)&v17, 0xCu);
        }
        v10 = *(void **)(a1 + 32);
        v11 = [(id)objc_opt_class() defaultSettings];
        id v12 = (id)[v10 updateSettingsModelWithSettings:v11];
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 32);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__HMDUserPhotosPersonDataManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __78__HMDUserPhotosPersonDataManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSettingsForCurrentCameraClipsAccess];
}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_1E6A19B30;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSettingsForCurrentCameraClipsAccess];
}

- (void)handleUpdatePersonManagerSettingsMessage:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (void *)MEMORY[0x1D9452090]();
  v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v53 = v8;
    __int16 v54 = 2112;
    v55 = v9;
    _os_log_impl(&dword_1D49D5000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager settings message: %@", buf, 0x16u);
  }
  v10 = [(HMDUserPhotosPersonDataManager *)v6 user];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 home];
    if (v12)
    {
      if [v11 isCurrentUser] && (objc_msgSend(v11, "hasCameraClipsAccess"))
      {
        uint64_t v13 = *MEMORY[0x1E4F2E328];
        uint64_t v51 = objc_opt_class();
        id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
        v15 = [v4 unarchivedObjectForKey:v13 ofClasses:v14];

        if (v15)
        {
          if ([v15 isImportingFromPhotoLibraryEnabled]
            && ([(HMDUserPhotosPersonDataManager *)v6 cloudPhotosSettingObserver],
                v16 = objc_claimAutoreleasedReturnValue(),
                char v17 = [v16 isCloudPhotosEnabled],
                v16,
                (v17 & 1) == 0))
          {
            v42 = (void *)MEMORY[0x1D9452090]();
            v43 = v6;
            v44 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543362;
              v53 = v45;
              _os_log_impl(&dword_1D49D5000, v44, OS_LOG_TYPE_ERROR, "%{public}@Cannot enable importing from Photo Library because cloud photos is not enabled", buf, 0xCu);
            }
            v46 = [MEMORY[0x1E4F28C58] hmPrivateErrorWithCode:2007];
            [v4 respondWithError:v46];
          }
          else
          {
            v18 = [(HMDUserPhotosPersonDataManager *)v6 updateSettingsModelWithSettings:v15];
            v49[0] = MEMORY[0x1E4F143A8];
            v49[1] = 3221225472;
            v49[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke;
            v49[3] = &unk_1E6A19730;
            v49[4] = v6;
            id v19 = v4;
            id v50 = v19;
            v20 = [v18 addSuccessBlock:v49];
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2;
            v47[3] = &unk_1E6A197F0;
            id v48 = v19;
            id v21 = (id)[v20 addFailureBlock:v47];
          }
        }
        else
        {
          v36 = (void *)MEMORY[0x1D9452090]();
          v37 = v6;
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = HMFGetLogIdentifier();
            v40 = [v4 messagePayload];
            *(_DWORD *)buf = 138543618;
            v53 = v39;
            __int16 v54 = 2112;
            v55 = v40;
            _os_log_impl(&dword_1D49D5000, v38, OS_LOG_TYPE_ERROR, "%{public}@Could not find photos person manager settings in message payload: %@", buf, 0x16u);
          }
          v41 = [MEMORY[0x1E4F28C58] hmErrorWithCode:-1];
          [v4 respondWithError:v41];

          v15 = 0;
        }
        goto LABEL_21;
      }
      v26 = (void *)MEMORY[0x1D9452090]();
      v27 = v6;
      v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v53 = v29;
        __int16 v54 = 2112;
        v55 = v11;
        _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_ERROR, "%{public}@Person manager settings cannot be updated for user: %@", buf, 0x16u);
      }
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = 17;
    }
    else
    {
      v32 = (void *)MEMORY[0x1D9452090]();
      v33 = v6;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v53 = v35;
        _os_log_impl(&dword_1D49D5000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
      }
      v30 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = 48;
    }
    v15 = [v30 hmErrorWithCode:v31];
    [v4 respondWithError:v15];
LABEL_21:

    goto LABEL_22;
  }
  v22 = (void *)MEMORY[0x1D9452090]();
  v23 = v6;
  v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v53 = v25;
    _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);
  }
  id v12 = [MEMORY[0x1E4F28C58] hmErrorWithCode:48];
  [v4 respondWithError:v12];
LABEL_22:
}

void __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = [*(id *)(a1 + 32) settings];
  v3 = encodeRootObjectForIncomingXPCMessage(v2, 0);
  [v8 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F2E328]];

  id v4 = [*(id *)(a1 + 32) zoneUUID];
  v5 = [v4 UUIDString];
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F2E338]];

  v6 = *(void **)(a1 + 40);
  id v7 = (void *)[v8 copy];
  [v6 respondWithPayload:v7];
}

uint64_t __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)_handleUpdatedSettingsModel:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDUserPhotosPersonDataManager *)self settingsModel];
  if ([v4 hmbIsDifferentFromModel:v6 differingFields:0])
  {
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = [v4 debugDescription];
      id v12 = [v6 debugDescription];
      int v38 = 138543874;
      v39 = v10;
      __int16 v40 = 2112;
      v41 = v11;
      __int16 v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@ previous model: %@", (uint8_t *)&v38, 0x20u);
    }
    [(HMDUserPhotosPersonDataManager *)v8 setSettingsModel:v4];
    uint64_t v13 = [v4 zoneUUID];
    if (v13)
    {
      id v14 = (void *)v13;
      v15 = [v6 zoneUUID];
      v16 = [v4 zoneUUID];
      char v17 = [v15 isEqual:v16];

      if ((v17 & 1) == 0)
      {
        id v21 = (void *)MEMORY[0x1D9452090]();
        v22 = v8;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = HMFGetLogIdentifier();
          v25 = [v6 zoneUUID];
          v26 = [v4 zoneUUID];
          int v38 = 138543874;
          v39 = v24;
          __int16 v40 = 2112;
          v41 = v25;
          __int16 v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_1D49D5000, v23, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID changed from %@ to %@. Configuring photos person manager", (uint8_t *)&v38, 0x20u);
        }
        v27 = [v6 zoneUUID];
        [(HMDUserPhotosPersonDataManager *)v22 removeCloudDataForZoneUUID:v27 isDueToHomeGraphObjectRemoval:0];

        [(HMDUserPhotosPersonDataManager *)v22 configurePhotosPersonManagerWithSettingsModel:v4];
        goto LABEL_16;
      }
    }
    v18 = [v4 zoneUUID];
    if (v18)
    {
    }
    else
    {
      v28 = [v6 zoneUUID];

      if (v28)
      {
        v29 = (void *)MEMORY[0x1D9452090]();
        v30 = v8;
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          int v38 = 138543362;
          v39 = v32;
          _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID is now nil. Removing photos person manager", (uint8_t *)&v38, 0xCu);
        }
        v33 = [v6 zoneUUID];
        [(HMDUserPhotosPersonDataManager *)v30 removeCloudDataForZoneUUID:v33 isDueToHomeGraphObjectRemoval:0];

        goto LABEL_16;
      }
    }
    id v19 = [(HMDUserPhotosPersonDataManager *)v8 personManager];
    v20 = [v4 createSettings];
    [v19 handleUpdatedSettings:v20];

LABEL_16:
    v34 = [(HMDUserPhotosPersonDataManager *)v8 user];
    v35 = [v34 home];
    v36 = [v35 homeManager];
    v37 = [(HMDUserPhotosPersonDataManager *)v8 userUUID];
    [v36 updateGenerationCounterWithReason:@"Photos Person Manager Settings Updated" sourceUUID:v37 shouldNotifyClients:1];
  }
}

- (void)removeCloudDataForZoneUUID:(id)a3 isDueToHomeGraphObjectRemoval:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDUserPhotosPersonDataManager *)self personManager];
  id v9 = objc_alloc_init(MEMORY[0x1E4F2EA10]);
  [v8 handleUpdatedSettings:v9];

  if (v6)
  {
    v10 = [(HMDUserPhotosPersonDataManager *)self photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser];
    char v11 = [v10 isEqual:v6];
    id v12 = (void *)MEMORY[0x1D9452090]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        v16 = HMFGetLogIdentifier();
        int v21 = 138543618;
        v22 = v16;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Not removing user photos person cloud data for zone UUID %@ because another home current user exists that is still using the zone", (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      if (v15)
      {
        char v17 = HMFGetLogIdentifier();
        v18 = HMFBooleanToString();
        int v21 = 138543874;
        v22 = v17;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing user photos person cloud data for zone UUID: %@ isDueToHomeGraphObjectRemoval: %@", (uint8_t *)&v21, 0x20u);
      }
      id v19 = [(HMDUserPhotosPersonDataManager *)v13 personManager];
      id v20 = (id)[v19 removeAllAssociatedDataDueToHomeGraphObjectRemoval:v4];
    }
  }
  [(HMDUserPhotosPersonDataManager *)self setPersonManager:0];
}

- (void)updateSettingsForCurrentCameraClipsAccess
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  BOOL v4 = [(HMDUserPhotosPersonDataManager *)self user];
  v5 = v4;
  if (v4)
  {
    if (([v4 hasCameraClipsAccess] & 1) == 0)
    {
      id v6 = [(HMDUserPhotosPersonDataManager *)self settings];
      id v7 = [(id)objc_opt_class() defaultSettings];
      char v8 = [v6 isEqual:v7];

      if ((v8 & 1) == 0)
      {
        id v9 = (void *)MEMORY[0x1D9452090]();
        v10 = self;
        char v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          int v19 = 138543618;
          id v20 = v12;
          __int16 v21 = 2112;
          v22 = v5;
          _os_log_impl(&dword_1D49D5000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since user does not have access to camera clips: %@", (uint8_t *)&v19, 0x16u);
        }
        uint64_t v13 = [(id)objc_opt_class() defaultSettings];
        id v14 = [(HMDUserPhotosPersonDataManager *)v10 updateSettingsModelWithSettings:v13];
      }
    }
  }
  else
  {
    BOOL v15 = (void *)MEMORY[0x1D9452090]();
    v16 = self;
    char v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)configurePhotosPersonManagerWithSettingsModel:(id)a3
{
  *(void *)&v33[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDUserPhotosPersonDataManager *)self user];
  if (!v6)
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    int v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v30 = 138543362;
      uint64_t v31 = v21;
      v22 = "%{public}@User reference is nil";
      uint64_t v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      uint32_t v25 = 12;
LABEL_16:
      _os_log_impl(&dword_1D49D5000, v23, v24, v22, (uint8_t *)&v30, v25);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (![(HMDUserPhotosPersonDataManager *)self supportsFaceClassification]
    && ([v6 isCurrentUser] & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1D9452090]();
    int v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v30 = 138543874;
      uint64_t v31 = v21;
      __int16 v32 = 1024;
      *(_DWORD *)v33 = [(HMDUserPhotosPersonDataManager *)v19 supportsFaceClassification];
      v33[2] = 1024;
      *(_DWORD *)&v33[3] = [v6 isCurrentUser];
      v22 = "%{public}@Not configuring photos person manager because self.supportsFaceClassification=%d and user.isCurrentUser=%d";
      uint64_t v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_DEBUG;
      uint32_t v25 = 24;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  id v7 = [v4 zoneUUID];
  if (v7)
  {
    char v8 = [(HMDUserPhotosPersonDataManager *)self personManagerFactory];
    id v9 = [(HMDUserPhotosPersonDataManager *)self workQueue];
    v10 = ((void (**)(void, void *, void *, void *))v8)[2](v8, v6, v7, v9);
    [(HMDUserPhotosPersonDataManager *)self setPersonManager:v10];

    char v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = self;
    uint64_t v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = HMFGetLogIdentifier();
      BOOL v15 = [(HMDUserPhotosPersonDataManager *)v12 personManager];
      int v30 = 138543618;
      uint64_t v31 = v14;
      __int16 v32 = 2112;
      *(void *)v33 = v15;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring photos person manager: %@", (uint8_t *)&v30, 0x16u);
    }
    v16 = [(HMDUserPhotosPersonDataManager *)v12 personManager];
    char v17 = [v6 home];
    [v16 configureWithHome:v17];
  }
  else
  {
    v26 = (void *)MEMORY[0x1D9452090]();
    uint64_t v27 = self;
    v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = HMFGetLogIdentifier();
      int v30 = 138543362;
      uint64_t v31 = v29;
      _os_log_impl(&dword_1D49D5000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Not configuring photos person manager because zoneUUID is nil", (uint8_t *)&v30, 0xCu);
    }
  }

LABEL_18:
}

- (id)photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPhotosPersonDataManager *)self user];
  v5 = v4;
  if (v4)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v6 = objc_msgSend(v4, "home", 0);
    id v7 = [v6 homeManager];
    char v8 = [v7 homes];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) currentUser];
          id v14 = [v13 uuid];
          BOOL v15 = [v5 uuid];
          char v16 = [v14 isEqual:v15];

          if ((v16 & 1) == 0)
          {
            char v17 = [v13 photosPersonDataManager];
            v18 = [v17 zoneUUID];

            if (v18)
            {
              uint64_t v23 = (void *)MEMORY[0x1D9452090]();
              os_log_type_t v24 = self;
              uint32_t v25 = HMFGetOSLogHandle();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                v26 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v33 = v26;
                __int16 v34 = 2112;
                v35 = v13;
                __int16 v36 = 2112;
                v37 = v18;
                _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_INFO, "%{public}@Found current user %@ using photos person manager zone UUID: %@", buf, 0x20u);
              }

              goto LABEL_19;
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v38 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    int v19 = (void *)MEMORY[0x1D9452090]();
    id v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_1D49D5000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);
    }
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (id)persistedSettingsModel
{
  v3 = [(HMDUserPhotosPersonDataManager *)self localZone];
  id v4 = [(HMDUserPhotosPersonDataManager *)self settingsModelUUID];
  v5 = [v3 fetchModelWithModelID:v4 ofType:objc_opt_class() error:0];

  return v5;
}

- (id)settingsModelUUID
{
  v3 = objc_opt_class();
  id v4 = [(HMDUserPhotosPersonDataManager *)self userUUID];
  v5 = [v3 settingsModelUUIDWithUUID:v4];

  return v5;
}

- (void)handleUpdatedSettingsModel:(id)a3
{
  id v5 = a3;
  id v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  [(HMDUserPhotosPersonDataManager *)self _handleUpdatedSettingsModel:v5];
}

- (id)updateSettingsModelWithSettings:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v42 = 138543618;
    v43 = v9;
    __int16 v44 = 2112;
    id v45 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating photos person manager settings: %@", (uint8_t *)&v42, 0x16u);
  }
  uint64_t v10 = [HMDPhotosPersonManagerSettingsModel alloc];
  uint64_t v11 = [(HMDUserPhotosPersonDataManager *)v7 settingsModelUUID];
  id v12 = [(HMDPhotosPersonManagerSettingsModel *)v10 initWithModelID:v11 settings:v4];

  uint64_t v13 = [(HMDUserPhotosPersonDataManager *)v7 settingsModel];
  if ([v4 isImportingFromPhotoLibraryEnabled])
  {
    id v14 = [v13 zoneUUID];

    if (!v14)
    {
      os_log_type_t v24 = [(HMDUserPhotosPersonDataManager *)v7 photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser];
      if (v24)
      {
        uint32_t v25 = (void *)MEMORY[0x1D9452090]();
        v26 = v7;
        uint64_t v27 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          long long v28 = HMFGetLogIdentifier();
          int v42 = 138543618;
          v43 = v28;
          __int16 v44 = 2112;
          id v45 = v24;
          _os_log_impl(&dword_1D49D5000, v27, OS_LOG_TYPE_INFO, "%{public}@Using existing Photo Library person manager zone UUID for current user from another home: %@", (uint8_t *)&v42, 0x16u);
        }
        uint64_t v29 = [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:v24];
      }
      else
      {
        long long v30 = [MEMORY[0x1E4F29128] UUID];
        [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:v30];
      }
      long long v31 = (void *)MEMORY[0x1D9452090](v29);
      __int16 v32 = v7;
      v33 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        __int16 v34 = HMFGetLogIdentifier();
        v35 = [(HMDPhotosPersonManagerSettingsModel *)v12 zoneUUID];
        int v42 = 138543618;
        v43 = v34;
        __int16 v44 = 2112;
        id v45 = v35;
        _os_log_impl(&dword_1D49D5000, v33, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now enabled. Updating settings with new photos person manager zone UUID: %@", (uint8_t *)&v42, 0x16u);
      }
      goto LABEL_21;
    }
  }
  if (([v4 isImportingFromPhotoLibraryEnabled] & 1) != 0
    || ([v13 zoneUUID], BOOL v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    id v20 = (void *)MEMORY[0x1D9452090]();
    __int16 v21 = v7;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      int v42 = 138543362;
      v43 = v23;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library has not changed. Not changing zone UUID", (uint8_t *)&v42, 0xCu);
    }
    os_log_type_t v24 = [v13 zoneUUID];
    [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:v24];
LABEL_21:

    goto LABEL_22;
  }
  char v16 = (void *)MEMORY[0x1D9452090]();
  char v17 = v7;
  v18 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = HMFGetLogIdentifier();
    int v42 = 138543362;
    v43 = v19;
    _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now disabled. Updating settings to remove zone UUID", (uint8_t *)&v42, 0xCu);
  }
  [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:0];
LABEL_22:
  __int16 v36 = [(HMDUserPhotosPersonDataManager *)v7 localZone];
  v37 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
  int v38 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Update photos person manager settings"];
  uint64_t v39 = [v36 addModels:v37 options:v38];
  __int16 v40 = [v39 flatMap:&__block_literal_global_39];

  return v40;
}

uint64_t __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke()
{
  return [MEMORY[0x1E4F7A0D8] futureWithNoResult];
}

- (void)removeCloudDataDueToUserRemoval
{
  v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPhotosPersonDataManager *)self zoneUUID];
  [(HMDUserPhotosPersonDataManager *)self removeCloudDataForZoneUUID:v4 isDueToHomeGraphObjectRemoval:1];
}

- (void)recoverDueToUUIDChangeFromOldUUID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x1D9452090]();
  id v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = HMFGetLogIdentifier();
    int v28 = 138543362;
    uint64_t v29 = v9;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Migrating photos person manager settings to use new user UUID", (uint8_t *)&v28, 0xCu);
  }
  uint64_t v10 = [(id)objc_opt_class() settingsModelUUIDWithUUID:v4];
  uint64_t v11 = [(HMDUserPhotosPersonDataManager *)v7 localZone];
  id v12 = [v11 fetchModelWithModelID:v10 ofType:objc_opt_class() error:0];

  if (v12)
  {
    uint64_t v13 = [HMDPhotosPersonManagerSettingsModel alloc];
    id v14 = [(HMDUserPhotosPersonDataManager *)v7 settingsModelUUID];
    BOOL v15 = +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID];
    char v16 = [(HMBModel *)v13 initWithModelID:v14 parentModelID:v15];

    [(HMBModel *)v16 hmbMergeSetPropertiesFromModel:v12];
    char v17 = [(HMDUserPhotosPersonDataManager *)v7 localZone];
    v18 = [MEMORY[0x1E4F1CAD0] setWithObject:v16];
    int v19 = (void *)MEMORY[0x1E4F1CAD0];
    id v20 = [v12 hmbModelID];
    __int16 v21 = [v19 setWithObject:v20];
    v22 = [MEMORY[0x1E4F69EF0] optionsWithLabel:@"Migrate photos person manager settings"];
    id v23 = (id)[v17 addModels:v18 andRemoveModelIDs:v21 options:v22];
  }
  else
  {
    os_log_type_t v24 = (void *)MEMORY[0x1D9452090]();
    uint32_t v25 = v7;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      int v28 = 138543362;
      uint64_t v29 = v27;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_INFO, "%{public}@No old settings model exists to migrate", (uint8_t *)&v28, 0xCu);
    }
  }
}

- (void)configure
{
  v37[3] = *MEMORY[0x1E4F143B8];
  v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPhotosPersonDataManager *)self user];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 home];
    if (!v6)
    {
      int v28 = (void *)MEMORY[0x1D9452090]();
      uint64_t v29 = self;
      uint64_t v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        long long v31 = HMFGetLogIdentifier();
        int v33 = 138543362;
        __int16 v34 = v31;
        _os_log_impl(&dword_1D49D5000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", (uint8_t *)&v33, 0xCu);
      }
      goto LABEL_16;
    }
    id v7 = [(HMDUserPhotosPersonDataManager *)self messageDispatcher];
    uint64_t v8 = *MEMORY[0x1E4F2E3D0];
    uint64_t v9 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v37[0] = v9;
    uint64_t v10 = +[HMDXPCMessagePolicy policyWithEntitlements:8197];
    v37[1] = v10;
    uint64_t v11 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:0 remoteAccessRequired:0];
    v37[2] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:3];
    [v7 registerForMessage:v8 receiver:self policies:v12 selector:sel_handleUpdatePersonManagerSettingsMessage_];

    uint64_t v13 = [(HMDUserPhotosPersonDataManager *)self notificationCenter];
    [v13 addObserver:self selector:sel_handleUserCamerasAccessLevelDidChangeNotification_ name:@"HMDUserCamerasAccessLevelDidChangeNotification" object:v5];

    id v14 = [(HMDUserPhotosPersonDataManager *)self notificationCenter];
    [v14 addObserver:self selector:sel_handleUserRemoteAccessDidChangeNotification_ name:@"HMDUserRemoteAccessDidChangeNotification" object:v5];

    BOOL v15 = [(HMDUserPhotosPersonDataManager *)self notificationCenter];
    [v15 addObserver:self selector:sel_handleHomePersonManagerSettingsDidChangeNotification_ name:@"HMDHomePersonManagerSettingsDidChangeNotification" object:v6];

    char v16 = [(HMDUserPhotosPersonDataManager *)self persistedSettingsModel];
    if (v16)
    {
      char v17 = (void *)MEMORY[0x1D9452090]([(HMDUserPhotosPersonDataManager *)self setSettingsModel:v16]);
      v18 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        __int16 v21 = [(HMDUserPhotosPersonDataManager *)v18 settingsModel];
        v22 = [v21 createSettings];
        int v33 = 138543618;
        __int16 v34 = v20;
        __int16 v35 = 2112;
        __int16 v36 = v22;
        id v23 = "%{public}@Initialized photos person data manager with settings: %@";
LABEL_14:
        _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_INFO, v23, (uint8_t *)&v33, 0x16u);
      }
    }
    else
    {
      char v17 = (void *)MEMORY[0x1D9452090]();
      __int16 v32 = self;
      int v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = HMFGetLogIdentifier();
        __int16 v21 = [(HMDUserPhotosPersonDataManager *)v32 settingsModel];
        v22 = [v21 createSettings];
        int v33 = 138543618;
        __int16 v34 = v20;
        __int16 v35 = 2112;
        __int16 v36 = v22;
        id v23 = "%{public}@Initialized photos person data manager with default settings: %@";
        goto LABEL_14;
      }
    }

    [(HMDUserPhotosPersonDataManager *)self configurePhotosPersonManagerWithSettingsModel:v16];

LABEL_16:
    goto LABEL_17;
  }
  os_log_type_t v24 = (void *)MEMORY[0x1D9452090]();
  uint32_t v25 = self;
  v26 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = HMFGetLogIdentifier();
    int v33 = 138543362;
    __int16 v34 = v27;
    _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v33, 0xCu);
  }
LABEL_17:
}

- (NSUUID)zoneUUID
{
  v2 = [(HMDUserPhotosPersonDataManager *)self settingsModel];
  v3 = [v2 zoneUUID];

  return (NSUUID *)v3;
}

- (HMPhotosPersonManagerSettings)settings
{
  v2 = [(HMDUserPhotosPersonDataManager *)self settingsModel];
  v3 = [v2 createSettings];

  return (HMPhotosPersonManagerSettings *)v3;
}

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 localZone:(id)a5 workQueue:(id)a6 supportsFaceClassification:(BOOL)a7 notificationCenter:(id)a8 cloudPhotosSettingObserver:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v36 = a8;
  id v18 = a9;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v15)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    uint64_t v33 = _HMFPreconditionFailure();
    return (HMDUserPhotosPersonDataManager *)__158__HMDUserPhotosPersonDataManager_initWithUser_messageDispatcher_localZone_workQueue_supportsFaceClassification_notificationCenter_cloudPhotosSettingObserver___block_invoke(v33);
  }
  __int16 v35 = v18;
  v37.receiver = self;
  v37.super_class = (Class)HMDUserPhotosPersonDataManager;
  int v19 = [(HMDUserPhotosPersonDataManager *)&v37 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a6);
    uint64_t v21 = [v14 uuid];
    userUUID = v20->_userUUID;
    v20->_userUUID = (NSUUID *)v21;

    id v23 = [v14 home];
    uint64_t v24 = [v23 uuid];
    homeUUID = v20->_homeUUID;
    v20->_homeUUID = (NSUUID *)v24;

    objc_storeStrong((id *)&v20->_messageDispatcher, a4);
    objc_storeStrong((id *)&v20->_localZone, a5);
    objc_storeWeak((id *)&v20->_user, v14);
    v20->_supportsFaceClassification = a7;
    objc_storeStrong((id *)&v20->_notificationCenter, a8);
    objc_storeStrong((id *)&v20->_cloudPhotosSettingObserver, a9);
    v26 = [HMDPhotosPersonManagerSettingsModel alloc];
    uint64_t v27 = [(id)objc_opt_class() settingsModelUUIDWithUUID:v20->_userUUID];
    int v28 = +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID];
    uint64_t v29 = [(HMBModel *)v26 initWithModelID:v27 parentModelID:v28];
    settingsModel = v20->_settingsModel;
    v20->_settingsModel = (HMDPhotosPersonManagerSettingsModel *)v29;

    id personManagerFactory = v20->_personManagerFactory;
    v20->_id personManagerFactory = &__block_literal_global_16343;
  }
  return v20;
}

HMDPhotosPersonManager *__158__HMDUserPhotosPersonDataManager_initWithUser_messageDispatcher_localZone_workQueue_supportsFaceClassification_notificationCenter_cloudPhotosSettingObserver___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [[HMDPhotosPersonManager alloc] initWithUser:v8 zoneUUID:v7 workQueue:v6];

  return v9;
}

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 localZone:(id)a5 workQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = +[HMDDeviceCapabilities deviceCapabilities];
  uint64_t v15 = [v14 supportsFaceClassification];
  id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v17 = +[HMDCloudPhotosSettingObserver sharedInstance];
  id v18 = [(HMDUserPhotosPersonDataManager *)self initWithUser:v13 messageDispatcher:v12 localZone:v11 workQueue:v10 supportsFaceClassification:v15 notificationCenter:v16 cloudPhotosSettingObserver:v17];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t32 != -1) {
    dispatch_once(&logCategory__hmf_once_t32, &__block_literal_global_53_16365);
  }
  v2 = (void *)logCategory__hmf_once_v33;
  return v2;
}

uint64_t __45__HMDUserPhotosPersonDataManager_logCategory__block_invoke()
{
  logCategory__hmf_once_uint64_t v33 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)settingsModelUUIDWithUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithUUIDString:@"F378F892-E6AD-4A6E-927A-C04D01A75448"];
  id v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [v5 data];
  id v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v4, v7);

  return v8;
}

+ (HMPhotosPersonManagerSettings)defaultSettings
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F2EA10]);
  return (HMPhotosPersonManagerSettings *)v2;
}

@end