@interface HMDResidentSelectionManagerDefaultDataSource
- (HMDHomeKitVersion)minimumHomeKitVersionForResidentSelection;
- (HMDResidentSelectionManagerDefaultDataSource)init;
- (NSBackgroundActivityScheduler)autoModeEvaluationScheduler;
- (NSNotificationCenter)notificationCenter;
- (id)createCoordinationElectionModeWithContext:(id)a3;
- (id)createResidentSelectionModeWithType:(unint64_t)a3 context:(id)a4;
- (id)idsServerBagForHome:(id)a3;
@end

@implementation HMDResidentSelectionManagerDefaultDataSource

- (id)idsServerBagForHome:(id)a3
{
  v3 = [a3 homeManager];
  v4 = [v3 idsServerBag];

  return v4;
}

- (HMDHomeKitVersion)minimumHomeKitVersionForResidentSelection
{
  v2 = [[HMDHomeKitVersion alloc] initWithVersionString:@"12.0"];
  return v2;
}

- (NSBackgroundActivityScheduler)autoModeEvaluationScheduler
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F086C0]) initWithIdentifier:@"com.apple.homed.HMDResidentSelectionManager"];
  return (NSBackgroundActivityScheduler *)v2;
}

- (NSNotificationCenter)notificationCenter
{
  return (NSNotificationCenter *)[MEMORY[0x263F08A00] defaultCenter];
}

- (id)createCoordinationElectionModeWithContext:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = HMFGetLogIdentifier();
    int v11 = 138543874;
    v12 = v8;
    __int16 v13 = 1024;
    int v14 = [v4 residentCapable];
    __int16 v15 = 1024;
    int v16 = [v4 isActingAsResident];
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_INFO, "%{public}@Current Device resident capable: %d, acting as a resident: %d", (uint8_t *)&v11, 0x18u);
  }
  if ([v4 residentCapable] && objc_msgSend(v4, "isActingAsResident")) {
    v9 = [[HMDResidentSelectionCoordinationElection alloc] initWithContext:v4];
  }
  else {
    v9 = 0;
  }

  return v9;
}

- (id)createResidentSelectionModeWithType:(unint64_t)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a4;
  switch(a3)
  {
    case 0uLL:
      v7 = (void *)MEMORY[0x230FBD990]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = HMFGetLogIdentifier();
        int v11 = @"unknown";
        int v16 = 138543618;
        uint64_t v17 = v10;
        __int16 v18 = 2112;
        v19 = @"unknown";
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@%@ is not supported.", (uint8_t *)&v16, 0x16u);
      }
      goto LABEL_5;
    case 1uLL:
      uint64_t v13 = [(HMDResidentSelectionManagerDefaultDataSource *)self createCoordinationElectionModeWithContext:v6];
      goto LABEL_10;
    case 2uLL:
      int v14 = HMDResidentSelectionManualMode;
      goto LABEL_9;
    case 3uLL:
      int v14 = HMDResidentSelectionAutoMode;
LABEL_9:
      uint64_t v13 = [[v14 alloc] initWithContext:v6];
LABEL_10:
      v12 = (void *)v13;
      break;
    default:
LABEL_5:
      v12 = 0;
      break;
  }

  return v12;
}

- (HMDResidentSelectionManagerDefaultDataSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMDResidentSelectionManagerDefaultDataSource;
  return [(HMDResidentSelectionManagerDefaultDataSource *)&v3 init];
}

@end