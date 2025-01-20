@interface HMDPhotosPersonManager
+ (id)logCategory;
+ (id)zoneNameForZoneUUID:(id)a3;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)sharesFaceClassifications;
- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4;
- (HMDPhotosPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 dataInterfaces:(id)a5 workQueue:(id)a6 user:(id)a7;
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
  return (HMPhotosPersonManagerSettings *)objc_getProperty(self, a2, 96, 1);
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
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D9452090]();
  v7 = self;
  char v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_1D49D5000, v8, OS_LOG_TYPE_INFO, "%{public}@Photos person manager settings changed: %@", buf, 0x16u);
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
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_11810);
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

- (HMDPhotosPersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 dataInterfaces:(id)a5 workQueue:(id)a6 user:(id)a7
{
  v16.receiver = self;
  v16.super_class = (Class)HMDPhotosPersonManager;
  id v11 = a7;
  uint64_t v12 = [(HMDPersonManager *)&v16 initWithUUID:a3 zoneManager:a4 dataInterfaces:a5 workQueue:a6];
  objc_storeWeak((id *)&v12->_user, v11);

  uint64_t v13 = (HMPhotosPersonManagerSettings *)objc_alloc_init(MEMORY[0x1E4F2EA10]);
  dataUnavailableExternalSettings = v12->_dataUnavailableExternalSettings;
  v12->_dataUnavailableExternalSettings = v13;

  return v12;
}

- (HMDPhotosPersonManager)initWithUser:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)MEMORY[0x1E4F2EA08];
  id v11 = a4;
  uint64_t v12 = [v8 uuid];
  uint64_t v13 = [v10 personManagerUUIDFromUserUUID:v12];

  uint64_t v14 = [v8 home];
  v15 = [MEMORY[0x1E4F1CA80] set];
  objc_super v16 = +[HMDDeviceCapabilities deviceCapabilities];
  int v17 = [v16 supportsFaceClassification];

  if (v17)
  {
    long long v18 = [HMDHomeAIPhotosPersonDataInterface alloc];
    long long v19 = [v14 uuid];
    v20 = [(HMDHomeAIPhotosPersonDataInterface *)v18 initWithPersonManagerUUID:v13 homeUUID:v19 workQueue:v9];

    [v15 addObject:v20];
  }
  if ([v8 isCurrentUser])
  {
    v21 = [[HMDPhotoLibraryPersonImporter alloc] initWithUUID:v13];
    [v15 addObject:v21];
  }
  v22 = [HMDHomeKitPersonDataInterface alloc];
  __int16 v23 = [v14 msgDispatcher];
  id v24 = [(HMDHomeKitPersonDataInterface *)v22 initWithUUID:v13 messageDispatcher:v23 workQueue:v9];
  [v15 addObject:v24];

  uint64_t v25 = [[HMDRemotePersonDataMessenger alloc] initWithUUID:v13 home:v14 workQueue:v9];
  [v15 addObject:v25];

  v26 = +[HMDPhotosPersonManager zoneNameForZoneUUID:v11];

  v27 = [HMDDatabaseZoneManager alloc];
  v28 = +[HMDDatabase cameraClipsDatabase];
  v29 = [(HMDDatabaseZoneManager *)v27 initWithDatabase:v28 zoneName:v26 home:v14 messageTargetUUID:v13 workQueue:v9];

  v30 = [(HMDDatabaseZoneManager *)v29 defaultConfiguration];
  v31 = (void *)[v30 mutableCopy];

  objc_msgSend(v31, "setZoneOwner:", objc_msgSend(v8, "isCurrentUser"));
  v32 = [[HMDHomeKitVersion alloc] initWithVersionString:@"7.0"];
  [v31 setMinimumHomeKitVersion:v32];

  v33 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F2DC7660];
  [v31 setRequiredSupportedFeatures:v33];

  [(HMDDatabaseZoneManager *)v29 setDefaultConfiguration:v31];
  v34 = [(HMDPhotosPersonManager *)self initWithUUID:v13 zoneManager:v29 dataInterfaces:v15 workQueue:v9 user:v8];

  return v34;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_11838 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_11838, &__block_literal_global_20);
  }
  id v2 = (void *)logCategory__hmf_once_v2_11839;
  return v2;
}

uint64_t __37__HMDPhotosPersonManager_logCategory__block_invoke()
{
  logCategory__hmf_once_v2_11839 = HMFCreateOSLogHandle();
  return MEMORY[0x1F41817F8]();
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  char v3 = (void *)*MEMORY[0x1E4F2DC98];
  id v4 = [a3 UUIDString];
  id v5 = [v3 stringByAppendingString:v4];

  return v5;
}

@end