@interface HMDUserPhotosPersonDataManager
+ (HMPhotosPersonManagerSettings)defaultSettings;
+ (id)logCategory;
+ (id)settingsModelFromSharedUserDataRoot:(id)a3;
+ (id)settingsModelUUIDWithUUID:(id)a3;
- (BOOL)shouldUseUserModelForSettings;
- (BOOL)supportsFaceClassification;
- (HMCContext)backingStoreContext;
- (HMDCloudPhotosSettingObserver)cloudPhotosSettingObserver;
- (HMDCoreDataCloudTransform)cloudTransform;
- (HMDPhotosPersonManager)personManager;
- (HMDPhotosPersonManagerSettingsModel)settingsModel;
- (HMDUser)user;
- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 backingStoreContext:(id)a5 cloudTransform:(id)a6 workQueue:(id)a7 supportsFaceClassification:(BOOL)a8 notificationCenter:(id)a9 cloudPhotosSettingObserver:(id)a10;
- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 backingStoreContext:(id)a5 workQueue:(id)a6;
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
- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4;
- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3;
- (void)handleUpdatePersonManagerOwnerSettingsMessage:(id)a3;
- (void)handleUpdatePersonManagerSettingsMessage:(id)a3;
- (void)handleUpdatedUserModel:(id)a3;
- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3;
- (void)handleUserRemoteAccessDidChangeNotification:(id)a3;
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
  objc_storeStrong((id *)&self->_cloudTransform, 0);
  objc_storeStrong((id *)&self->_backingStoreContext, 0);
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
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setSettingsModel:(id)a3
{
}

- (HMDPhotosPersonManagerSettingsModel)settingsModel
{
  return (HMDPhotosPersonManagerSettingsModel *)objc_getProperty(self, a2, 96, 1);
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
  return (HMDCloudPhotosSettingObserver *)objc_getProperty(self, a2, 80, 1);
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)supportsFaceClassification
{
  return self->_supportsFaceClassification;
}

- (HMDCoreDataCloudTransform)cloudTransform
{
  return (HMDCoreDataCloudTransform *)objc_getProperty(self, a2, 64, 1);
}

- (HMCContext)backingStoreContext
{
  return (HMCContext *)objc_getProperty(self, a2, 56, 1);
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

- (void)didInsertOrUpdateModel:(id)a3 changedProperties:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  if (v10)
  {
    v11 = [v10 homeModelID];
    v12 = [(HMDUserPhotosPersonDataManager *)self user];
    v13 = [v12 home];
    v14 = [v13 uuid];
    int v15 = [v11 isEqual:v14];

    if (v15)
    {
      v16 = (void *)MEMORY[0x230FBD990]();
      v17 = self;
      v18 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v26 = v19;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_INFO, "%{public}@Received notification about modified shared user data root: %@", buf, 0x16u);
      }
      v20 = [(id)objc_opt_class() settingsModelFromSharedUserDataRoot:v10];
      v21 = [(HMDUserPhotosPersonDataManager *)v17 workQueue];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __75__HMDUserPhotosPersonDataManager_didInsertOrUpdateModel_changedProperties___block_invoke;
      v23[3] = &unk_264A2F820;
      v23[4] = v17;
      id v24 = v20;
      id v22 = v20;
      dispatch_async(v21, v23);
    }
  }
}

uint64_t __75__HMDUserPhotosPersonDataManager_didInsertOrUpdateModel_changedProperties___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleUpdatedSettingsModel:*(void *)(a1 + 40)];
}

- (void)handleHomePersonManagerSettingsDidChangeNotification:(id)a3
{
  v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __87__HMDUserPhotosPersonDataManager_handleHomePersonManagerSettingsDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
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
        id v6 = (void *)MEMORY[0x230FBD990]();
        id v7 = *(id *)(a1 + 32);
        id v8 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = HMFGetLogIdentifier();
          int v17 = 138543362;
          v18 = v9;
          _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since Face Classification was disabled", (uint8_t *)&v17, 0xCu);
        }
        id v10 = *(void **)(a1 + 32);
        v11 = [(id)objc_opt_class() defaultSettings];
        id v12 = (id)[v10 updateSettingsModelWithSettings:v11];
      }
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x230FBD990]();
    id v14 = *(id *)(a1 + 32);
    int v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__HMDUserPhotosPersonDataManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
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
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __84__HMDUserPhotosPersonDataManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSettingsForCurrentCameraClipsAccess];
}

- (void)handleUpdatePersonManagerOwnerSettingsMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager owner settings message: %@", buf, 0x16u);
  }
  id v10 = [(HMDUserPhotosPersonDataManager *)v6 user];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 home];
    if (v12)
    {
      v13 = v12;
      id v14 = [v12 residentSyncManager];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke;
      v24[3] = &unk_264A2AFF0;
      v24[4] = v6;
      id v25 = v4;
      [v14 interceptRemoteResidentRequest:v25 proceed:v24];
    }
    else
    {
      uint64_t v19 = (void *)MEMORY[0x230FBD990]();
      v20 = v6;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        __int16 v27 = v22;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
      }
      v23 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
      [v4 respondWithError:v23];

      v13 = 0;
    }
  }
  else
  {
    int v15 = (void *)MEMORY[0x230FBD990]();
    v16 = v6;
    int v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      __int16 v27 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);
    }
    v13 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
    [v4 respondWithError:v13];
  }
}

void __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke(uint64_t a1, void *a2)
{
  v26[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *MEMORY[0x263F0DCE0];
  v26[0] = objc_opt_class();
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  id v6 = [v3 unarchivedObjectForKey:v4 ofClasses:v5];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) updateSettingsModelWithSettings:v6];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_54;
    v20[3] = &unk_264A2F3C0;
    v20[4] = *(void *)(a1 + 32);
    id v8 = v3;
    id v21 = v8;
    v9 = [v7 addSuccessBlock:v20];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_2;
    v18[3] = &unk_264A2F3E8;
    id v19 = v8;
    id v10 = (id)[v9 addFailureBlock:v18];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    id v12 = *(id *)(a1 + 32);
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = HMFGetLogIdentifier();
      int v15 = [v3 messagePayload];
      *(_DWORD *)buf = 138543618;
      v23 = v14;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not find photos person manager settings in message payload: %@", buf, 0x16u);
    }
    v16 = *(void **)(a1 + 40);
    int v17 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
    [v16 respondWithError:v17];
  }
}

void __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_54(uint64_t a1)
{
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  v2 = [*(id *)(a1 + 32) settings];
  id v3 = encodeRootObjectForIncomingXPCMessage(v2, 0);
  [v8 setObject:v3 forKeyedSubscript:*MEMORY[0x263F0DCE0]];

  uint64_t v4 = [*(id *)(a1 + 32) zoneUUID];
  v5 = [v4 UUIDString];
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F0DCF0]];

  id v6 = *(void **)(a1 + 40);
  id v7 = (void *)[v8 copy];
  [v6 respondWithPayload:v7];
}

uint64_t __80__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerOwnerSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)handleUpdatePersonManagerSettingsMessage:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = HMFGetLogIdentifier();
    v9 = [v4 shortDescription];
    *(_DWORD *)buf = 138543618;
    v54 = v8;
    __int16 v55 = 2112;
    v56 = v9;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Handling update person manager settings message: %@", buf, 0x16u);
  }
  id v10 = [(HMDUserPhotosPersonDataManager *)v6 user];
  v11 = v10;
  if (v10)
  {
    id v12 = [v10 home];
    if (v12)
    {
      if [v11 isCurrentUser] && (objc_msgSend(v11, "hasCameraClipsAccess"))
      {
        uint64_t v13 = *MEMORY[0x263F0DCE0];
        uint64_t v52 = objc_opt_class();
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
        int v15 = [v4 unarchivedObjectForKey:v13 ofClasses:v14];

        if (!v15)
        {
          v36 = (void *)MEMORY[0x230FBD990]();
          v37 = v6;
          v38 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v39 = HMFGetLogIdentifier();
            v40 = [v4 messagePayload];
            *(_DWORD *)buf = 138543618;
            v54 = v39;
            __int16 v55 = 2112;
            v56 = v40;
            _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_ERROR, "%{public}@Could not find photos person manager settings in message payload: %@", buf, 0x16u);
          }
          v41 = [MEMORY[0x263F087E8] hmErrorWithCode:-1];
          [v4 respondWithError:v41];

          int v15 = 0;
          goto LABEL_23;
        }
        if ([v15 isImportingFromPhotoLibraryEnabled]
          && ([(HMDUserPhotosPersonDataManager *)v6 cloudPhotosSettingObserver],
              v16 = objc_claimAutoreleasedReturnValue(),
              char v17 = [v16 isCloudPhotosEnabled],
              v16,
              (v17 & 1) == 0))
        {
          v42 = (void *)MEMORY[0x230FBD990]();
          v43 = v6;
          v44 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            v45 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543362;
            v54 = v45;
            _os_log_impl(&dword_22F52A000, v44, OS_LOG_TYPE_ERROR, "%{public}@Cannot enable importing from Photo Library because cloud photos is not enabled", buf, 0xCu);
          }
          v46 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2007];
          [v4 respondWithError:v46];
        }
        else
        {
          if (![v11 isOwner]
            || ([v12 isCurrentDeviceConfirmedPrimaryResident] & 1) != 0)
          {
            v18 = [(HMDUserPhotosPersonDataManager *)v6 updateSettingsModelWithSettings:v15];
            v50[0] = MEMORY[0x263EF8330];
            v50[1] = 3221225472;
            v50[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke;
            v50[3] = &unk_264A2F3C0;
            v50[4] = v6;
            id v19 = v4;
            id v51 = v19;
            v20 = [v18 addSuccessBlock:v50];
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v48[2] = __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2;
            v48[3] = &unk_264A2F3E8;
            id v49 = v19;
            id v21 = (id)[v20 addFailureBlock:v48];

LABEL_23:
            goto LABEL_24;
          }
          v46 = (void *)[v4 mutableCopy];
          [v46 setName:@"HMDUPPM.m.updateOwnerSettings"];
          v47 = [v12 residentSyncManager];
          [v47 performResidentRequest:v46 options:0];
        }
        goto LABEL_23;
      }
      v26 = (void *)MEMORY[0x230FBD990]();
      __int16 v27 = v6;
      __int16 v28 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v54 = v29;
        __int16 v55 = 2112;
        v56 = v11;
        _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@Person manager settings cannot be updated for user: %@", buf, 0x16u);
      }
      uint64_t v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = 17;
    }
    else
    {
      v32 = (void *)MEMORY[0x230FBD990]();
      v33 = v6;
      v34 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v54 = v35;
        _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", buf, 0xCu);
      }
      uint64_t v30 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = 48;
    }
    int v15 = [v30 hmErrorWithCode:v31];
    [v4 respondWithError:v15];
    goto LABEL_23;
  }
  id v22 = (void *)MEMORY[0x230FBD990]();
  v23 = v6;
  __int16 v24 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543362;
    v54 = v25;
    _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);
  }
  id v12 = [MEMORY[0x263F087E8] hmErrorWithCode:48];
  [v4 respondWithError:v12];
LABEL_24:
}

void __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  v2 = [*(id *)(a1 + 32) settings];
  id v3 = encodeRootObjectForIncomingXPCMessage(v2, 0);
  [v8 setObject:v3 forKeyedSubscript:*MEMORY[0x263F0DCE0]];

  id v4 = [*(id *)(a1 + 32) zoneUUID];
  v5 = [v4 UUIDString];
  [v8 setObject:v5 forKeyedSubscript:*MEMORY[0x263F0DCF0]];

  id v6 = *(void **)(a1 + 40);
  id v7 = (void *)[v8 copy];
  [v6 respondWithPayload:v7];
}

uint64_t __75__HMDUserPhotosPersonDataManager_handleUpdatePersonManagerSettingsMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) respondWithError:a2];
}

- (void)_handleUpdatedSettingsModel:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDUserPhotosPersonDataManager *)self settingsModel];
  if ([v4 hmbIsDifferentFromModel:v6 differingFields:0])
  {
    id v7 = (void *)MEMORY[0x230FBD990]();
    id v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = HMFGetLogIdentifier();
      v11 = [v4 debugDescription];
      id v12 = [v6 debugDescription];
      int v38 = 138543874;
      v39 = v10;
      __int16 v40 = 2112;
      v41 = v11;
      __int16 v42 = 2112;
      v43 = v12;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Handling updated settings model: %@ previous model: %@", (uint8_t *)&v38, 0x20u);
    }
    [(HMDUserPhotosPersonDataManager *)v8 setSettingsModel:v4];
    uint64_t v13 = [v4 zoneUUID];
    if (v13)
    {
      id v14 = (void *)v13;
      int v15 = [v6 zoneUUID];
      v16 = [v4 zoneUUID];
      char v17 = [v15 isEqual:v16];

      if ((v17 & 1) == 0)
      {
        id v21 = (void *)MEMORY[0x230FBD990]();
        id v22 = v8;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          __int16 v24 = HMFGetLogIdentifier();
          id v25 = [v6 zoneUUID];
          v26 = [v4 zoneUUID];
          int v38 = 138543874;
          v39 = v24;
          __int16 v40 = 2112;
          v41 = v25;
          __int16 v42 = 2112;
          v43 = v26;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID changed from %@ to %@. Configuring photos person manager", (uint8_t *)&v38, 0x20u);
        }
        __int16 v27 = [v6 zoneUUID];
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
      __int16 v28 = [v6 zoneUUID];

      if (v28)
      {
        uint64_t v29 = (void *)MEMORY[0x230FBD990]();
        uint64_t v30 = v8;
        uint64_t v31 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          v32 = HMFGetLogIdentifier();
          int v38 = 138543362;
          v39 = v32;
          _os_log_impl(&dword_22F52A000, v31, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings zone UUID is now nil. Removing photos person manager", (uint8_t *)&v38, 0xCu);
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
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v7);

  id v8 = [(HMDUserPhotosPersonDataManager *)self personManager];
  id v9 = objc_alloc_init(MEMORY[0x263F0E650]);
  [v8 handleUpdatedSettings:v9];

  if (v6)
  {
    id v10 = [(HMDUserPhotosPersonDataManager *)self photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser];
    char v11 = [v10 isEqual:v6];
    id v12 = (void *)MEMORY[0x230FBD990]();
    uint64_t v13 = self;
    id v14 = HMFGetOSLogHandle();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v15)
      {
        v16 = HMFGetLogIdentifier();
        int v21 = 138543618;
        id v22 = v16;
        __int16 v23 = 2112;
        id v24 = v6;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Not removing user photos person cloud data for zone UUID %@ because another home current user exists that is still using the zone", (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      if (v15)
      {
        char v17 = HMFGetLogIdentifier();
        v18 = HMFBooleanToString();
        int v21 = 138543874;
        id v22 = v17;
        __int16 v23 = 2112;
        id v24 = v6;
        __int16 v25 = 2112;
        v26 = v18;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_INFO, "%{public}@Removing user photos person cloud data for zone UUID: %@ isDueToHomeGraphObjectRemoval: %@", (uint8_t *)&v21, 0x20u);
      }
      id v19 = [(HMDUserPhotosPersonDataManager *)v13 personManager];
      id v20 = (id)[v19 removeAllAssociatedDataDueToHomeGraphObjectRemoval:v4];
    }
  }
  [(HMDUserPhotosPersonDataManager *)self setPersonManager:0];
}

- (void)updateSettingsForCurrentCameraClipsAccess
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
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
        id v9 = (void *)MEMORY[0x230FBD990]();
        id v10 = self;
        char v11 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = HMFGetLogIdentifier();
          int v19 = 138543618;
          id v20 = v12;
          __int16 v21 = 2112;
          id v22 = v5;
          _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_INFO, "%{public}@Updating settings to default settings since user does not have access to camera clips: %@", (uint8_t *)&v19, 0x16u);
        }
        uint64_t v13 = [(id)objc_opt_class() defaultSettings];
        id v14 = [(HMDUserPhotosPersonDataManager *)v10 updateSettingsModelWithSettings:v13];
      }
    }
  }
  else
  {
    BOOL v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    char v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      int v19 = 138543362;
      id v20 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)configurePhotosPersonManagerWithSettingsModel:(id)a3
{
  *(void *)&v33[5] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(HMDUserPhotosPersonDataManager *)self user];
  if (!v6)
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = self;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = HMFGetLogIdentifier();
      int v30 = 138543362;
      uint64_t v31 = v21;
      id v22 = "%{public}@User reference is nil";
      uint64_t v23 = v20;
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      uint32_t v25 = 12;
LABEL_16:
      _os_log_impl(&dword_22F52A000, v23, v24, v22, (uint8_t *)&v30, v25);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (![(HMDUserPhotosPersonDataManager *)self supportsFaceClassification]
    && ([v6 isCurrentUser] & 1) == 0)
  {
    v18 = (void *)MEMORY[0x230FBD990]();
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
      id v22 = "%{public}@Not configuring photos person manager because self.supportsFaceClassification=%d and user.isCurrentUser=%d";
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
    id v10 = ((void (**)(void, void *, void *, void *))v8)[2](v8, v6, v7, v9);
    [(HMDUserPhotosPersonDataManager *)self setPersonManager:v10];

    char v11 = (void *)MEMORY[0x230FBD990]();
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
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Configuring photos person manager: %@", (uint8_t *)&v30, 0x16u);
    }
    v16 = [(HMDUserPhotosPersonDataManager *)v12 personManager];
    char v17 = [v6 home];
    [v16 configureWithHome:v17];
  }
  else
  {
    v26 = (void *)MEMORY[0x230FBD990]();
    uint64_t v27 = self;
    __int16 v28 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = HMFGetLogIdentifier();
      int v30 = 138543362;
      uint64_t v31 = v29;
      _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Not configuring photos person manager because zoneUUID is nil", (uint8_t *)&v30, 0xCu);
    }
  }

LABEL_18:
}

- (id)photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
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
              uint64_t v23 = (void *)MEMORY[0x230FBD990]();
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
                _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_INFO, "%{public}@Found current user %@ using photos person manager zone UUID: %@", buf, 0x20u);
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
    int v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = self;
    __int16 v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v33 = v22;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", buf, 0xCu);
    }
  }
  v18 = 0;
LABEL_19:

  return v18;
}

- (id)persistedSettingsModel
{
  id v3 = [HMDPhotosPersonManagerSettingsModel alloc];
  id v4 = [(HMDUserPhotosPersonDataManager *)self settingsModelUUID];
  v5 = +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID];
  id v6 = [(HMBModel *)v3 initWithModelID:v4 parentModelID:v5];

  id v7 = [(HMDUserPhotosPersonDataManager *)self backingStoreContext];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__HMDUserPhotosPersonDataManager_persistedSettingsModel__block_invoke;
  v12[3] = &unk_264A2F820;
  v12[4] = self;
  char v8 = v6;
  uint64_t v13 = v8;
  [v7 unsafeSynchronousBlock:v12];

  uint64_t v9 = v13;
  uint64_t v10 = v8;

  return v10;
}

void __56__HMDUserPhotosPersonDataManager_persistedSettingsModel__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) shouldUseUserModelForSettings];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 userUUID];
    v5 = [*(id *)(a1 + 32) backingStoreContext];
    id v6 = [v5 managedObjectContext];
    id v12 = +[_MKFModel modelWithModelID:v4 context:v6];

    [v12 sharePhotosFaceClassifications];
  }
  else
  {
    id v7 = [v3 homeUUID];
    char v8 = [*(id *)(a1 + 32) backingStoreContext];
    uint64_t v9 = [v8 managedObjectContext];
    id v12 = +[MKFCKModel modelWithModelID:v7 context:v9 error:0];

    objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "sharePhotosFaceClassifications"));
  uint64_t v10 = };
  [*(id *)(a1 + 40) setSharingFaceClassificationsEnabled:v10];

  uint64_t v11 = [v12 photosPersonDataZoneUUID];
  [*(id *)(a1 + 40) setZoneUUID:v11];
}

- (BOOL)shouldUseUserModelForSettings
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserPhotosPersonDataManager *)self user];
  id v4 = v3;
  if (v3)
  {
    if ([v3 isOwner])
    {
      char v5 = 1;
    }
    else
    {
      uint64_t v10 = [v4 home];
      char v5 = [v10 isOwnerUser];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x230FBD990]();
    id v7 = self;
    char v8 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = HMFGetLogIdentifier();
      int v12 = 138543362;
      uint64_t v13 = v9;
      _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v12, 0xCu);
    }
    char v5 = 0;
  }

  return v5;
}

- (id)settingsModelUUID
{
  id v3 = objc_opt_class();
  id v4 = [(HMDUserPhotosPersonDataManager *)self userUUID];
  char v5 = [v3 settingsModelUUIDWithUUID:v4];

  return v5;
}

- (void)handleUpdatedUserModel:(id)a3
{
  id v13 = a3;
  id v4 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v4);

  if ([(HMDUserPhotosPersonDataManager *)self shouldUseUserModelForSettings])
  {
    char v5 = [HMDPhotosPersonManagerSettingsModel alloc];
    id v6 = [MEMORY[0x263F08C38] UUID];
    id v7 = +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID];
    char v8 = [(HMBModel *)v5 initWithModelID:v6 parentModelID:v7];

    id v9 = objc_alloc(MEMORY[0x263F08C38]);
    uint64_t v10 = [v13 photosPersonDataZoneUUIDString];
    uint64_t v11 = (void *)[v9 initWithUUIDString:v10];
    [(HMDPhotosPersonManagerSettingsModel *)v8 setZoneUUID:v11];

    int v12 = [v13 sharePhotosFaceClassifications];
    [(HMDPhotosPersonManagerSettingsModel *)v8 setSharingFaceClassificationsEnabled:v12];

    [(HMDUserPhotosPersonDataManager *)self _handleUpdatedSettingsModel:v8];
  }
}

- (id)updateSettingsModelWithSettings:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)MEMORY[0x230FBD990]();
  id v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Updating photos person manager settings: %@", buf, 0x16u);
  }
  uint64_t v10 = [HMDPhotosPersonManagerSettingsModel alloc];
  uint64_t v11 = [(HMDUserPhotosPersonDataManager *)v7 settingsModelUUID];
  int v12 = [(HMDPhotosPersonManagerSettingsModel *)v10 initWithModelID:v11 settings:v4];

  id v13 = [(HMDUserPhotosPersonDataManager *)v7 settingsModel];
  if ([v4 isImportingFromPhotoLibraryEnabled]
    && ([v13 zoneUUID],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        BOOL v15 = v14 == 0,
        v14,
        v15))
  {
    uint64_t v27 = [(HMDUserPhotosPersonDataManager *)v7 photosPersonManagerZoneUUIDForAnyOtherHomeCurrentUser];
    if (v27)
    {
      long long v28 = (void *)MEMORY[0x230FBD990]();
      long long v29 = v7;
      long long v30 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        long long v31 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v27;
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, "%{public}@Using existing Photo Library person manager zone UUID for current user from another home: %@", buf, 0x16u);
      }
      uint64_t v32 = [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:v27];
    }
    else
    {
      v33 = [MEMORY[0x263F08C38] UUID];
      [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:v33];
    }
    __int16 v34 = (void *)MEMORY[0x230FBD990](v32);
    v35 = v7;
    __int16 v36 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = HMFGetLogIdentifier();
      int v38 = [(HMDPhotosPersonManagerSettingsModel *)v12 zoneUUID];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v38;
      _os_log_impl(&dword_22F52A000, v36, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now enabled. Updating settings with new photos person manager zone UUID: %@", buf, 0x16u);
    }
  }
  else if (([v4 isImportingFromPhotoLibraryEnabled] & 1) != 0 {
         || ([v13 zoneUUID],
  }
             char v16 = objc_claimAutoreleasedReturnValue(),
             BOOL v17 = v16 == 0,
             v16,
             v17))
  {
    id v22 = (void *)MEMORY[0x230FBD990]();
    uint64_t v23 = v7;
    os_log_type_t v24 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint32_t v25 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v25;
      _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library has not changed. Not changing zone UUID", buf, 0xCu);
    }
    v26 = [v13 zoneUUID];
    [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:v26];
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    int v19 = v7;
    id v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      __int16 v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v21;
      _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_INFO, "%{public}@Importing from Photo Library is now disabled. Updating settings to remove zone UUID", buf, 0xCu);
    }
    [(HMDPhotosPersonManagerSettingsModel *)v12 setZoneUUID:0];
  }
  id v39 = objc_alloc_init(MEMORY[0x263F58190]);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  __int16 v55 = __Block_byref_object_copy__23133;
  v56 = __Block_byref_object_dispose__23134;
  id v57 = 0;
  __int16 v40 = [(HMDUserPhotosPersonDataManager *)v7 backingStoreContext];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke;
  v50[3] = &unk_264A2F000;
  v50[4] = v7;
  v41 = v12;
  id v51 = v41;
  v53 = buf;
  id v42 = v39;
  id v52 = v42;
  [v40 performBlock:v50];

  v43 = (void *)MEMORY[0x263F581B8];
  uint64_t v44 = [(HMDUserPhotosPersonDataManager *)v7 workQueue];
  v45 = [v43 schedulerWithDispatchQueue:v44];
  v46 = [v42 reschedule:v45];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke_41;
  v49[3] = &unk_264A17DE8;
  v49[4] = v7;
  v49[5] = buf;
  v47 = [v46 flatMap:v49];

  _Block_object_dispose(buf, 8);
  return v47;
}

void __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) shouldUseUserModelForSettings];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v4 = [v3 userUUID];
    char v5 = [*(id *)(a1 + 32) backingStoreContext];
    id v6 = [v5 managedObjectContext];
    id v7 = +[_MKFModel modelWithModelID:v4 context:v6];

    char v8 = [*(id *)(a1 + 40) sharingFaceClassificationsEnabled];
    [v7 setSharePhotosFaceClassifications:v8];

    id v9 = [*(id *)(a1 + 40) zoneUUID];
    [v7 setPhotosPersonDataZoneUUID:v9];
  }
  else
  {
    uint64_t v10 = [v3 homeUUID];
    uint64_t v11 = [*(id *)(a1 + 32) backingStoreContext];
    int v12 = [v11 managedObjectContext];
    id v7 = +[MKFCKModel modelWithModelID:v10 context:v12 error:0];

    id v13 = [*(id *)(a1 + 40) sharingFaceClassificationsEnabled];
    objc_msgSend(v7, "setSharePhotosFaceClassifications:", objc_msgSend(v13, "BOOLValue"));

    uint64_t v14 = [*(id *)(a1 + 40) zoneUUID];
    [v7 setPhotosPersonDataZoneUUID:v14];

    uint64_t v15 = [(id)objc_opt_class() settingsModelFromSharedUserDataRoot:v7];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  BOOL v17 = [*(id *)(a1 + 32) backingStoreContext];
  id v24 = 0;
  int v18 = [v17 save:&v24];
  id v19 = v24;

  if (v18)
  {
    [*(id *)(a1 + 48) finishWithNoResult];
  }
  else
  {
    id v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = *(id *)(a1 + 32);
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v23;
      __int16 v27 = 2112;
      id v28 = v19;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Failed to update settings model with settings: %@", buf, 0x16u);
    }
    [*(id *)(a1 + 48) finishWithError:v19];
  }
}

uint64_t __66__HMDUserPhotosPersonDataManager_updateSettingsModelWithSettings___block_invoke_41(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "_handleUpdatedSettingsModel:");
  }
  v1 = (void *)MEMORY[0x263F58190];
  return [v1 futureWithNoResult];
}

- (void)removeCloudDataDueToUserRemoval
{
  id v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPhotosPersonDataManager *)self zoneUUID];
  [(HMDUserPhotosPersonDataManager *)self removeCloudDataForZoneUUID:v4 isDueToHomeGraphObjectRemoval:1];
}

- (void)configure
{
  v47[3] = *MEMORY[0x263EF8340];
  id v3 = [(HMDUserPhotosPersonDataManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDUserPhotosPersonDataManager *)self user];
  char v5 = v4;
  if (v4)
  {
    id v6 = [v4 home];
    if (!v6)
    {
      __int16 v36 = (void *)MEMORY[0x230FBD990]();
      v37 = self;
      int v38 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = HMFGetLogIdentifier();
        int v41 = 138543362;
        id v42 = v39;
        _os_log_impl(&dword_22F52A000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@Home reference is nil", (uint8_t *)&v41, 0xCu);
      }
      goto LABEL_18;
    }
    id v7 = [(HMDUserPhotosPersonDataManager *)self messageDispatcher];
    uint64_t v8 = *MEMORY[0x263F0DDA0];
    id v9 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v47[0] = v9;
    uint64_t v10 = +[HMDXPCMessagePolicy policyWithEntitlements:8197];
    v47[1] = v10;
    uint64_t v11 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:0 remoteAccessRequired:0];
    v47[2] = v11;
    int v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:3];
    [v7 registerForMessage:v8 receiver:self policies:v12 selector:sel_handleUpdatePersonManagerSettingsMessage_];

    id v13 = +[HMDRemoteMessagePolicy defaultSecurePolicy];
    objc_msgSend(v13, "setRoles:", objc_msgSend(v13, "roles") | 4);
    uint64_t v14 = [(HMDUserPhotosPersonDataManager *)self messageDispatcher];
    uint64_t v15 = +[HMDConfigurationMessagePolicy policyWithOperationTypes:2];
    v46[0] = v15;
    uint64_t v16 = +[HMDUserMessagePolicy userMessagePolicyWithHome:v6 userPrivilege:3 remoteAccessRequired:0];
    v46[1] = v16;
    v46[2] = v13;
    BOOL v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:3];
    [v14 registerForMessage:@"HMDUPPM.m.updateOwnerSettings" receiver:self policies:v17 selector:sel_handleUpdatePersonManagerOwnerSettingsMessage_];

    int v18 = [(HMDUserPhotosPersonDataManager *)self notificationCenter];
    [v18 addObserver:self selector:sel_handleUserCamerasAccessLevelDidChangeNotification_ name:@"HMDUserCamerasAccessLevelDidChangeNotification" object:v5];

    id v19 = [(HMDUserPhotosPersonDataManager *)self notificationCenter];
    [v19 addObserver:self selector:sel_handleUserRemoteAccessDidChangeNotification_ name:@"HMDUserRemoteAccessDidChangeNotification" object:v5];

    id v20 = [(HMDUserPhotosPersonDataManager *)self notificationCenter];
    [v20 addObserver:self selector:sel_handleHomePersonManagerSettingsDidChangeNotification_ name:@"HMDHomePersonManagerSettingsDidChangeNotification" object:v6];

    if (![(HMDUserPhotosPersonDataManager *)self shouldUseUserModelForSettings])
    {
      id v21 = [(HMDUserPhotosPersonDataManager *)self cloudTransform];
      id v22 = +[MKFCKSharedUserDataRoot entity];
      v45 = v22;
      uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      [v21 registerCloudChangeListener:self forEntities:v23];
    }
    id v24 = [(HMDUserPhotosPersonDataManager *)self persistedSettingsModel];
    if (v24)
    {
      uint32_t v25 = (void *)MEMORY[0x230FBD990]([(HMDUserPhotosPersonDataManager *)self setSettingsModel:v24]);
      v26 = self;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        uint64_t v29 = [(HMDUserPhotosPersonDataManager *)v26 settingsModel];
        long long v30 = [v29 createSettings];
        int v41 = 138543618;
        id v42 = v28;
        __int16 v43 = 2112;
        uint64_t v44 = v30;
        long long v31 = "%{public}@Initialized photos person data manager with settings: %@";
LABEL_16:
        _os_log_impl(&dword_22F52A000, v27, OS_LOG_TYPE_INFO, v31, (uint8_t *)&v41, 0x16u);
      }
    }
    else
    {
      uint32_t v25 = (void *)MEMORY[0x230FBD990]();
      __int16 v40 = self;
      __int16 v27 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = HMFGetLogIdentifier();
        uint64_t v29 = [(HMDUserPhotosPersonDataManager *)v40 settingsModel];
        long long v30 = [v29 createSettings];
        int v41 = 138543618;
        id v42 = v28;
        __int16 v43 = 2112;
        uint64_t v44 = v30;
        long long v31 = "%{public}@Initialized photos person data manager with default settings: %@";
        goto LABEL_16;
      }
    }

    [(HMDUserPhotosPersonDataManager *)self configurePhotosPersonManagerWithSettingsModel:v24];

LABEL_18:
    goto LABEL_19;
  }
  uint64_t v32 = (void *)MEMORY[0x230FBD990]();
  v33 = self;
  __int16 v34 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = HMFGetLogIdentifier();
    int v41 = 138543362;
    id v42 = v35;
    _os_log_impl(&dword_22F52A000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@User reference is nil", (uint8_t *)&v41, 0xCu);
  }
LABEL_19:
}

- (NSUUID)zoneUUID
{
  int v2 = [(HMDUserPhotosPersonDataManager *)self settingsModel];
  id v3 = [v2 zoneUUID];

  return (NSUUID *)v3;
}

- (HMPhotosPersonManagerSettings)settings
{
  int v2 = [(HMDUserPhotosPersonDataManager *)self settingsModel];
  id v3 = [v2 createSettings];

  return (HMPhotosPersonManagerSettings *)v3;
}

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 backingStoreContext:(id)a5 cloudTransform:(id)a6 workQueue:(id)a7 supportsFaceClassification:(BOOL)a8 notificationCenter:(id)a9 cloudPhotosSettingObserver:(id)a10
{
  id v15 = a3;
  id v16 = a4;
  id v38 = a5;
  id v37 = a6;
  id v17 = a7;
  id v36 = a9;
  id v18 = a10;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v16)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v38)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    uint64_t v33 = _HMFPreconditionFailure();
    return (HMDUserPhotosPersonDataManager *)__183__HMDUserPhotosPersonDataManager_initWithUser_messageDispatcher_backingStoreContext_cloudTransform_workQueue_supportsFaceClassification_notificationCenter_cloudPhotosSettingObserver___block_invoke(v33);
  }
  v35 = v18;
  v39.receiver = self;
  v39.super_class = (Class)HMDUserPhotosPersonDataManager;
  id v19 = [(HMDUserPhotosPersonDataManager *)&v39 init];
  id v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_workQueue, a7);
    uint64_t v21 = [v15 uuid];
    userUUID = v20->_userUUID;
    v20->_userUUID = (NSUUID *)v21;

    uint64_t v23 = [v15 home];
    uint64_t v24 = [v23 uuid];
    homeUUID = v20->_homeUUID;
    v20->_homeUUID = (NSUUID *)v24;

    objc_storeStrong((id *)&v20->_messageDispatcher, a4);
    objc_storeStrong((id *)&v20->_backingStoreContext, a5);
    objc_storeStrong((id *)&v20->_cloudTransform, a6);
    objc_storeWeak((id *)&v20->_user, v15);
    v20->_supportsFaceClassification = a8;
    objc_storeStrong((id *)&v20->_notificationCenter, a9);
    objc_storeStrong((id *)&v20->_cloudPhotosSettingObserver, a10);
    v26 = [HMDPhotosPersonManagerSettingsModel alloc];
    __int16 v27 = [(id)objc_opt_class() settingsModelUUIDWithUUID:v20->_userUUID];
    id v28 = +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID];
    uint64_t v29 = [(HMBModel *)v26 initWithModelID:v27 parentModelID:v28];
    settingsModel = v20->_settingsModel;
    v20->_settingsModel = (HMDPhotosPersonManagerSettingsModel *)v29;

    id personManagerFactory = v20->_personManagerFactory;
    v20->_id personManagerFactory = &__block_literal_global_23157;
  }
  return v20;
}

HMDPhotosPersonManager *__183__HMDUserPhotosPersonDataManager_initWithUser_messageDispatcher_backingStoreContext_cloudTransform_workQueue_supportsFaceClassification_notificationCenter_cloudPhotosSettingObserver___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  id v9 = [[HMDPhotosPersonManager alloc] initWithUser:v8 zoneUUID:v7 workQueue:v6];

  return v9;
}

- (HMDUserPhotosPersonDataManager)initWithUser:(id)a3 messageDispatcher:(id)a4 backingStoreContext:(id)a5 workQueue:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = +[HMDCoreDataCloudTransform sharedInstance];
  id v15 = +[HMDDeviceCapabilities deviceCapabilities];
  uint64_t v16 = [v15 supportsFaceClassification];
  id v17 = [MEMORY[0x263F08A00] defaultCenter];
  id v18 = +[HMDCloudPhotosSettingObserver sharedInstance];
  id v19 = [(HMDUserPhotosPersonDataManager *)self initWithUser:v13 messageDispatcher:v12 backingStoreContext:v11 cloudTransform:v14 workQueue:v10 supportsFaceClassification:v16 notificationCenter:v17 cloudPhotosSettingObserver:v18];

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t38 != -1) {
    dispatch_once(&logCategory__hmf_once_t38, &__block_literal_global_57);
  }
  int v2 = (void *)logCategory__hmf_once_v39;
  return v2;
}

void __45__HMDUserPhotosPersonDataManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v39;
  logCategory__hmf_once_objc_super v39 = v0;
}

+ (id)settingsModelFromSharedUserDataRoot:(id)a3
{
  id v3 = a3;
  id v4 = [HMDPhotosPersonManagerSettingsModel alloc];
  char v5 = [MEMORY[0x263F08C38] UUID];
  id v6 = +[HMDPhotosPersonManagerSettingsModel sentinelParentUUID];
  id v7 = [(HMBModel *)v4 initWithModelID:v5 parentModelID:v6];

  id v8 = [v3 photosPersonDataZoneUUID];
  [(HMDPhotosPersonManagerSettingsModel *)v7 setZoneUUID:v8];

  id v9 = NSNumber;
  uint64_t v10 = [v3 sharePhotosFaceClassifications];

  id v11 = [v9 numberWithBool:v10];
  [(HMDPhotosPersonManagerSettingsModel *)v7 setSharingFaceClassificationsEnabled:v11];

  return v7;
}

+ (id)settingsModelUUIDWithUUID:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  char v5 = (void *)[[v3 alloc] initWithUUIDString:@"F378F892-E6AD-4A6E-927A-C04D01A75448"];
  id v6 = (void *)MEMORY[0x263F08C38];
  id v7 = [v5 data];
  id v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v4, v7);

  return v8;
}

+ (HMPhotosPersonManagerSettings)defaultSettings
{
  id v2 = objc_alloc_init(MEMORY[0x263F0E650]);
  return (HMPhotosPersonManagerSettings *)v2;
}

@end