@interface HMDPhotosPersonManager
+ (id)logCategory;
+ (id)zoneNameForZoneUUID:(id)a3;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)sharesFaceClassifications;
- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4;
- (HMDPhotosPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7 user:(id)a8;
- (HMDPhotosPersonManager)initWithUser:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5;
- (HMDUser)user;
- (HMIExternalPersonManager)hmiPersonManager;
- (HMPhotosPersonManagerSettings)dataUnavailableExternalSettings;
- (HMPhotosPersonManagerSettings)settings;
- (void)handleUpdatedSettings:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation HMDPhotosPersonManager

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_user);
  objc_storeStrong((id *)&self->_dataUnavailableExternalSettings, 0);
}

- (void)setUser:(id)a3
{
}

- (HMDUser)user
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_user);
  return (HMDUser *)WeakRetained;
}

- (HMPhotosPersonManagerSettings)dataUnavailableExternalSettings
{
  return (HMPhotosPersonManagerSettings *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = [(HMDPersonManager *)self zoneManager];
  v7 = [v6 home];
  char v8 = [v7 isOwnerUser];

  return v8;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isOwner];
  return (char)v6;
}

- (void)handleUpdatedSettings:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings changed: %@", buf, 0x16u);
  }
  [(HMDPersonManager *)v7 _createOrRemoveZonesForSettings:v4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = [(HMDPersonManager *)v7 dataInterfaces];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v16 + 1) + 8 * v14);
        if (objc_opt_respondsToSelector()) {
          [v15 handleUpdatedSettings:v4 mirrorOutputFuture:0];
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (HMPhotosPersonManagerSettings)settings
{
  v2 = [(HMDPhotosPersonManager *)self user];
  v3 = [v2 photosPersonManagerSettings];

  return (HMPhotosPersonManagerSettings *)v3;
}

- (HMIExternalPersonManager)hmiPersonManager
{
  v2 = [(HMDPersonManager *)self dataInterfaces];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_15720);
  id v4 = [v3 anyObject];

  return (HMIExternalPersonManager *)v4;
}

id __42__HMDPhotosPersonManager_hmiPersonManager__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 photosPersonManager];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)sharesFaceClassifications
{
  id v2 = [(HMDPhotosPersonManager *)self settings];
  char v3 = [v2 isSharingFaceClassificationsEnabled];

  return v3;
}

- (HMDPhotosPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7 user:(id)a8
{
  v18.receiver = self;
  v18.super_class = (Class)HMDPhotosPersonManager;
  id v13 = a8;
  uint64_t v14 = [(HMDPersonManager *)&v18 initWithUUID:a3 zoneManager:a4 coreDataManager:a5 dataInterfaces:a6 workQueue:a7];
  objc_storeWeak((id *)&v14->_user, v13);

  v15 = (HMPhotosPersonManagerSettings *)objc_alloc_init(MEMORY[0x263F0E650]);
  dataUnavailableExternalSettings = v14->_dataUnavailableExternalSettings;
  v14->_dataUnavailableExternalSettings = v15;

  return v14;
}

- (HMDPhotosPersonManager)initWithUser:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = (void *)MEMORY[0x263F0E648];
  id v10 = a4;
  uint64_t v11 = [v7 uuid];
  uint64_t v12 = [v9 personManagerUUIDFromUserUUID:v11];

  id v13 = [v7 home];
  uint64_t v14 = [MEMORY[0x263EFF9C0] set];
  v15 = +[HMDDeviceCapabilities deviceCapabilities];
  int v16 = [v15 supportsFaceClassification];

  if (v16)
  {
    long long v17 = [HMDHomeAIPhotosPersonDataInterface alloc];
    objc_super v18 = [v13 uuid];
    long long v19 = [(HMDHomeAIPhotosPersonDataInterface *)v17 initWithPersonManagerUUID:v12 homeUUID:v18 workQueue:v8];

    [v14 addObject:v19];
  }
  if ([v7 isCurrentUser])
  {
    v20 = [[HMDPhotoLibraryPersonImporter alloc] initWithUUID:v12];
    [v14 addObject:v20];
  }
  v21 = [HMDHomeKitPersonDataInterface alloc];
  v22 = [v13 msgDispatcher];
  __int16 v23 = [(HMDHomeKitPersonDataInterface *)v21 initWithUUID:v12 messageDispatcher:v22 workQueue:v8];
  [v14 addObject:v23];

  id v24 = [[HMDRemotePersonDataMessenger alloc] initWithUUID:v12 home:v13 workQueue:v8];
  [v14 addObject:v24];

  uint64_t v25 = +[HMDPhotosPersonManager zoneNameForZoneUUID:v10];

  v26 = [HMDDatabaseZoneManager alloc];
  v27 = +[HMDDatabase cameraClipsDatabase];
  v28 = [(HMDDatabaseZoneManager *)v26 initWithDatabase:v27 zoneName:v25 home:v13 messageTargetUUID:v12 workQueue:v8];

  v29 = [(HMDDatabaseZoneManager *)v28 defaultConfiguration];
  v30 = (void *)[v29 mutableCopy];

  objc_msgSend(v30, "setZoneOwner:", objc_msgSend(v7, "isCurrentUser"));
  v31 = [[HMDHomeKitVersion alloc] initWithVersionString:@"7.0"];
  [v30 setMinimumHomeKitVersion:v31];

  v32 = [MEMORY[0x263EFFA08] setWithObject:&unk_26E470A68];
  [v30 setRequiredSupportedFeatures:v32];

  [(HMDDatabaseZoneManager *)v28 setDefaultConfiguration:v30];
  v33 = [HMDPersonCoreDataManager alloc];
  v34 = [v7 uuid];
  v35 = [(HMDPersonCoreDataManager *)v33 initWithUUID:v12 workQueue:v8 home:v13 userUUID:v34];

  v36 = [(HMDPhotosPersonManager *)self initWithUUID:v12 zoneManager:v28 coreDataManager:v35 dataInterfaces:v14 workQueue:v8 user:v7];
  return v36;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_15748 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_15748, &__block_literal_global_21);
  }
  id v2 = (void *)logCategory__hmf_once_v2_15749;
  return v2;
}

void __37__HMDPhotosPersonManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_15749;
  logCategory__hmf_once_v2_15749 = v0;
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  char v3 = (void *)*MEMORY[0x263F0D498];
  id v4 = [a3 UUIDString];
  id v5 = [v3 stringByAppendingString:v4];

  return v5;
}

@end