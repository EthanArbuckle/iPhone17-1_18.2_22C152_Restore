@interface HMDHomePersonManager
+ (id)logCategory;
+ (id)zoneNameForZoneUUID:(id)a3;
- (BOOL)manager:(id)a3 shouldGrantWriteAccessToUser:(id)a4;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)sharesFaceClassifications;
- (BOOL)syncsPersonData;
- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4;
- (HMDHome)home;
- (HMDHomePersonManager)initWithHome:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5;
- (HMDHomePersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7 home:(id)a8;
- (HMHomePersonManagerSettings)settings;
- (HMIHomePersonManager)hmiPersonManager;
- (void)configureWithHome:(id)a3;
- (void)handleUpdatedSettings:(id)a3;
- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3;
- (void)handleUserRemoteAccessDidChangeNotification:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDHomePersonManager

- (void).cxx_destruct
{
}

- (void)setHome:(id)a3
{
}

- (HMDHome)home
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_home);
  return (HMDHome *)WeakRetained;
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isOwner];
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldGrantWriteAccessToUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isAdministrator];
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 hasCameraClipsAccess];
  return (char)v6;
}

- (void)handleUserRemoteAccessDidChangeNotification:(id)a3
{
  v4 = [(HMDPersonManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__HMDHomePersonManager_handleUserRemoteAccessDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __68__HMDHomePersonManager_handleUserRemoteAccessDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 updateShareParticipants];
}

- (void)handleUserCamerasAccessLevelDidChangeNotification:(id)a3
{
  v4 = [(HMDPersonManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__HMDHomePersonManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __74__HMDHomePersonManager_handleUserCamerasAccessLevelDidChangeNotification___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) zoneManager];
  [v1 updateShareParticipants];
}

- (void)handleUpdatedSettings:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v22 = v9;
    __int16 v23 = 2112;
    id v24 = v4;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@Home person manager settings changed: %@", buf, 0x16u);
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

- (void)configureWithHome:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDPersonManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)HMDHomePersonManager;
    [(HMDPersonManager *)&v10 configureWithHome:v4];
    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:self selector:sel_handleUserCamerasAccessLevelDidChangeNotification_ name:@"HMDUserCamerasAccessLevelDidChangeNotification" object:0];

    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 addObserver:self selector:sel_handleUserRemoteAccessDidChangeNotification_ name:@"HMDUserRemoteAccessDidChangeNotification" object:0];
  }
  else
  {
    v8 = (HMDHomePersonManager *)_HMFPreconditionFailure();
    [(HMDHomePersonManager *)v8 settings];
  }
}

- (HMHomePersonManagerSettings)settings
{
  v2 = [(HMDHomePersonManager *)self home];
  v3 = [v2 personManagerSettings];

  return (HMHomePersonManagerSettings *)v3;
}

- (HMIHomePersonManager)hmiPersonManager
{
  v2 = [(HMDPersonManager *)self dataInterfaces];
  v3 = objc_msgSend(v2, "na_map:", &__block_literal_global_112591);
  id v4 = [v3 anyObject];

  return (HMIHomePersonManager *)v4;
}

id __40__HMDHomePersonManager_hmiPersonManager__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 homePersonManager];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)sharesFaceClassifications
{
  return 1;
}

- (BOOL)syncsPersonData
{
  return 1;
}

- (HMDHomePersonManager)initWithUUID:(id)a3 zoneManager:(id)a4 coreDataManager:(id)a5 dataInterfaces:(id)a6 workQueue:(id)a7 home:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)HMDHomePersonManager;
  id v13 = a8;
  uint64_t v14 = [(HMDPersonManager *)&v16 initWithUUID:a3 zoneManager:a4 coreDataManager:a5 dataInterfaces:a6 workQueue:a7];
  objc_storeWeak((id *)&v14->_home, v13);

  return v14;
}

- (HMDHomePersonManager)initWithHome:(id)a3 zoneUUID:(id)a4 workQueue:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = (void *)MEMORY[0x263F0E3D0];
  id v11 = a4;
  uint64_t v12 = [v8 uuid];
  id v13 = [v10 personManagerUUIDFromHomeUUID:v12];

  uint64_t v14 = [MEMORY[0x263EFF9C0] set];
  v15 = +[HMDDeviceCapabilities deviceCapabilities];
  if (![(HMDHomeAIHomePersonDataInterface *)v15 supportsFaceClassification]) {
    goto LABEL_4;
  }
  int v16 = [v8 isOwnerUser];

  if (v16)
  {
    long long v17 = [HMDHomeAIHomePersonDataInterface alloc];
    long long v18 = [v8 uuid];
    v15 = [(HMDHomeAIHomePersonDataInterface *)v17 initWithPersonManagerUUID:v13 homeUUID:v18 workQueue:v9];

    [v14 addObject:v15];
LABEL_4:
  }
  long long v19 = [HMDHomeKitPersonDataInterface alloc];
  v20 = [v8 msgDispatcher];
  v21 = [(HMDHomeKitPersonDataInterface *)v19 initWithUUID:v13 messageDispatcher:v20 workQueue:v9];
  [v14 addObject:v21];

  v22 = [[HMDRemotePersonDataMessenger alloc] initWithUUID:v13 home:v8 workQueue:v9];
  [v14 addObject:v22];

  __int16 v23 = +[HMDHomePersonManager zoneNameForZoneUUID:v11];

  id v24 = [HMDDatabaseZoneManager alloc];
  uint64_t v25 = +[HMDDatabase cameraClipsDatabase];
  v26 = [(HMDDatabaseZoneManager *)v24 initWithDatabase:v25 zoneName:v23 home:v8 messageTargetUUID:v13 workQueue:v9];

  v27 = [(HMDDatabaseZoneManager *)v26 defaultConfiguration];
  v28 = (void *)[v27 mutableCopy];

  objc_msgSend(v28, "setZoneOwner:", objc_msgSend(v8, "isOwnerUser"));
  v29 = [[HMDHomeKitVersion alloc] initWithVersionString:@"7.0"];
  [v28 setMinimumHomeKitVersion:v29];

  [(HMDDatabaseZoneManager *)v26 setDefaultConfiguration:v28];
  v30 = [[HMDPersonCoreDataManager alloc] initWithUUID:v13 workQueue:v9 home:v8 userUUID:0];
  v31 = [(HMDHomePersonManager *)self initWithUUID:v13 zoneManager:v26 coreDataManager:v30 dataInterfaces:v14 workQueue:v9 home:v8];

  return v31;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_112614 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_112614, &__block_literal_global_25_112615);
  }
  id v2 = (void *)logCategory__hmf_once_v2_112616;
  return v2;
}

void __35__HMDHomePersonManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  id v1 = (void *)logCategory__hmf_once_v2_112616;
  logCategory__hmf_once_v2_112616 = v0;
}

+ (id)zoneNameForZoneUUID:(id)a3
{
  v3 = (void *)*MEMORY[0x263F0CD50];
  id v4 = [a3 UUIDString];
  id v5 = [v3 stringByAppendingString:v4];

  return v5;
}

@end