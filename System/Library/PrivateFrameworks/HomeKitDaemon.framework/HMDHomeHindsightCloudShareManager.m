@interface HMDHomeHindsightCloudShareManager
+ (id)logCategory;
- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4;
- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4;
- (HMDDatabaseZoneManager)zoneManager;
- (HMDHomeHindsightCloudShareManager)initWithHome:(id)a3 workQueue:(id)a4;
- (HMDHomeHindsightCloudShareManager)initWithUUID:(id)a3 workQueue:(id)a4 zoneManager:(id)a5;
- (NSString)logIdentifier;
- (NSUUID)UUID;
- (OS_dispatch_queue)workQueue;
- (void)_startZoneManager;
- (void)_synchronize;
- (void)configure;
- (void)removeZones;
- (void)synchronize;
- (void)zoneManagerDidStart:(id)a3;
@end

@implementation HMDHomeHindsightCloudShareManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

- (HMDDatabaseZoneManager)zoneManager
{
  return (HMDDatabaseZoneManager *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)zoneManagerDidStart:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@HomeKit events zone manager started", (uint8_t *)&v11, 0xCu);
  }
  v10 = [v4 localZone];
  [v10 startUp];
}

- (BOOL)zoneManager:(id)a3 shouldRequestShareInvitationFromUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isOwner];
  return (char)v6;
}

- (BOOL)manager:(id)a3 shouldShareWithUser:(id)a4
{
  id v5 = a4;
  v6 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v6);

  LOBYTE(v6) = [v5 isAllowedToAccessActivityHistory];
  return (char)v6;
}

- (void)_startZoneManager
{
  v3 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  id v5 = [v4 defaultConfiguration];
  id v9 = (id)[v5 mutableCopy];

  v6 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  v7 = [v6 home];
  objc_msgSend(v9, "setShouldCreateZone:", objc_msgSend(v7, "isEventLogEnabled"));

  v8 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  [v8 startWithConfiguration:v9];
}

- (void)_synchronize
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  id v5 = [v4 cloudZone];

  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  id v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Synchronizing hindsight cloud share manager by performing cloud pull", buf, 0xCu);
    }
    int v11 = [MEMORY[0x263F49318] optionsWithLabel:@"Synchronizing for hindsight cloud share manager"];
    v12 = [v5 performCloudPullWithOptions:v11];
    uint64_t v13 = (void *)MEMORY[0x263F581B8];
    v14 = [(HMDHomeHindsightCloudShareManager *)v7 workQueue];
    v15 = [v13 schedulerWithDispatchQueue:v14];
    v16 = [v12 reschedule:v15];

    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __49__HMDHomeHindsightCloudShareManager__synchronize__block_invoke;
    v19[3] = &unk_264A2D1D0;
    v19[4] = v7;
    id v17 = (id)[v16 addCompletionBlock:v19];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v21 = v18;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Synchronizing hindsight cloud share manager by starting zone manager", buf, 0xCu);
    }
    [(HMDHomeHindsightCloudShareManager *)v7 _startZoneManager];
  }
}

void __49__HMDHomeHindsightCloudShareManager__synchronize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)MEMORY[0x230FBD990]();
  id v8 = *(id *)(a1 + 32);
  id v9 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = HMFGetLogIdentifier();
    int v11 = 138543362;
    v12 = v10;
    _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Finished performing cloud pull for synchronization", (uint8_t *)&v11, 0xCu);
  }
  [*(id *)(a1 + 32) _startZoneManager];
}

- (void)removeZones
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = self;
  id v6 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = HMFGetLogIdentifier();
    int v10 = 138543362;
    int v11 = v7;
    _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Removing HomeKit events zone", (uint8_t *)&v10, 0xCu);
  }
  id v8 = [(HMDHomeHindsightCloudShareManager *)v5 zoneManager];
  id v9 = (id)[v8 remove];
}

- (void)synchronize
{
  v3 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDHomeHindsightCloudShareManager_synchronize__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __48__HMDHomeHindsightCloudShareManager_synchronize__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _synchronize];
}

- (void)configure
{
  v3 = [(HMDHomeHindsightCloudShareManager *)self workQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  [v4 setDelegate:self];

  id v5 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  [v5 setDataSource:self];

  id v6 = [(HMDHomeHindsightCloudShareManager *)self zoneManager];
  [v6 configure];

  [(HMDHomeHindsightCloudShareManager *)self _startZoneManager];
}

- (HMDHomeHindsightCloudShareManager)initWithUUID:(id)a3 workQueue:(id)a4 zoneManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  int v11 = v10;
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v9)
  {
LABEL_9:
    v20 = (HMDHomeHindsightCloudShareManager *)_HMFPreconditionFailure();
    return [(HMDHomeHindsightCloudShareManager *)v20 initWithHome:v22 workQueue:v23];
  }
  v24.receiver = self;
  v24.super_class = (Class)HMDHomeHindsightCloudShareManager;
  uint64_t v12 = [(HMDHomeHindsightCloudShareManager *)&v24 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    UUID = v12->_UUID;
    v12->_UUID = (NSUUID *)v13;

    objc_storeStrong((id *)&v12->_workQueue, a4);
    objc_storeStrong((id *)&v12->_zoneManager, a5);
    v15 = NSString;
    v16 = [v11 zoneName];
    uint64_t v17 = [v15 stringWithFormat:@"%@/%@", v8, v16];
    logIdentifier = v12->_logIdentifier;
    v12->_logIdentifier = (NSString *)v17;
  }
  return v12;
}

- (HMDHomeHindsightCloudShareManager)initWithHome:(id)a3 workQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = v7;
    if (v7)
    {
      id v9 = [v6 spiClientIdentifier];
      id v10 = HMVConfigurationZoneUUIDForHomeIdentifier();

      int v11 = HMVConfigurationZoneNameForZoneUUID();
      uint64_t v12 = [HMDDatabaseZoneManager alloc];
      uint64_t v13 = +[HMDDatabase hindsightDatabase];
      v14 = [(HMDDatabaseZoneManager *)v12 initWithDatabase:v13 zoneName:v11 home:v6 messageTargetUUID:v10 workQueue:v8];

      v15 = [(HMDDatabaseZoneManager *)v14 defaultConfiguration];
      v16 = (void *)[v15 mutableCopy];

      objc_msgSend(v16, "setZoneOwner:", objc_msgSend(v6, "isOwnerUser"));
      uint64_t v17 = [[HMDHomeKitVersion alloc] initWithVersionString:@"11.1"];
      [v16 setMinimumHomeKitVersion:v17];

      [v16 setShouldCreateZone:0];
      id v18 = objc_alloc_init(MEMORY[0x263F492F8]);
      [v18 setShouldSkipCloudPulls:1];
      [v16 setCloudZoneConfiguration:v18];
      [(HMDDatabaseZoneManager *)v14 setDefaultConfiguration:v16];
      v19 = [(HMDHomeHindsightCloudShareManager *)self initWithUUID:v10 workQueue:v8 zoneManager:v14];

      return v19;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  SEL v21 = (void *)_HMFPreconditionFailure();
  return (HMDHomeHindsightCloudShareManager *)+[HMDHomeHindsightCloudShareManager logCategory];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_253039 != -1) {
    dispatch_once(&logCategory__hmf_once_t5_253039, &__block_literal_global_253040);
  }
  v2 = (void *)logCategory__hmf_once_v6_253041;
  return v2;
}

void __48__HMDHomeHindsightCloudShareManager_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v6_253041;
  logCategory__hmf_once_v6_253041 = v0;
}

@end