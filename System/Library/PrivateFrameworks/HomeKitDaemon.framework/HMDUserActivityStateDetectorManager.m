@interface HMDUserActivityStateDetectorManager
+ (BOOL)shouldRunManagerForHome:(id)a3;
- (HMDHomeActivityStateManagerDataSource)dataSource;
- (HMDUserActivityReportCoordinator)userActivityReportCoordinator;
- (HMDUserActivityStateDetectorManager)initWithDataSource:(id)a3 userActivityReportCoordinator:(id)a4 detectors:(id)a5;
- (HMDUserActivityStateDetectorManager)initWithHome:(id)a3;
- (NSArray)detectors;
- (void)configure;
- (void)handlePrimaryResidentDidChangeNotification:(id)a3;
- (void)registerForNotifications;
@end

@implementation HMDUserActivityStateDetectorManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_storeStrong((id *)&self->_userActivityReportCoordinator, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (NSArray)detectors
{
  return self->_detectors;
}

- (HMDUserActivityReportCoordinator)userActivityReportCoordinator
{
  return self->_userActivityReportCoordinator;
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)handlePrimaryResidentDidChangeNotification:(id)a3
{
  id v3 = [(HMDUserActivityStateDetectorManager *)self userActivityReportCoordinator];
  [v3 sendCoordinatedReportsForReason:7];
}

- (void)registerForNotifications
{
  id v4 = [(HMDUserActivityStateDetectorManager *)self dataSource];
  id v3 = [v4 notificationCenter];
  [v3 addObserver:self selector:sel_handlePrimaryResidentDidChangeNotification_ name:@"HMDResidentDeviceManagerUpdatePrimaryResidentGenerationIDNotification" object:0];
}

- (void)configure
{
  id v3 = [(HMDUserActivityStateDetectorManager *)self dataSource];
  id v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __48__HMDUserActivityStateDetectorManager_configure__block_invoke(uint64_t a1)
{
  dispatch_group_t v2 = dispatch_group_create();
  id v3 = [*(id *)(a1 + 32) detectors];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke_2;
  v9[3] = &unk_264A2F278;
  uint64_t v4 = *(void *)(a1 + 32);
  dispatch_group_t v10 = v2;
  uint64_t v11 = v4;
  v5 = v2;
  objc_msgSend(v3, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v9);

  v6 = [*(id *)(a1 + 32) dataSource];
  v7 = [v6 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke_4;
  block[3] = &unk_264A2F7F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_group_notify(v5, v7, block);
}

void __48__HMDUserActivityStateDetectorManager_configure__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(NSObject **)(a1 + 32);
  id v4 = a2;
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__HMDUserActivityStateDetectorManager_configure__block_invoke_3;
  v7[3] = &unk_264A2F820;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  [v4 configureWithCompletion:v7];
}

uint64_t __48__HMDUserActivityStateDetectorManager_configure__block_invoke_4(uint64_t a1)
{
  dispatch_group_t v2 = [*(id *)(a1 + 32) userActivityReportCoordinator];
  id v3 = [*(id *)(a1 + 32) detectors];
  [v2 configureWithDetectors:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 registerForNotifications];
}

void __48__HMDUserActivityStateDetectorManager_configure__block_invoke_3(uint64_t a1)
{
}

- (HMDUserActivityStateDetectorManager)initWithDataSource:(id)a3 userActivityReportCoordinator:(id)a4 detectors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDUserActivityStateDetectorManager;
  v12 = [(HMDUserActivityStateDetectorManager *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataSource, a3);
    objc_storeStrong((id *)&v13->_userActivityReportCoordinator, a4);
    objc_storeStrong((id *)&v13->_detectors, a5);
  }

  return v13;
}

- (HMDUserActivityStateDetectorManager)initWithHome:(id)a3
{
  v14[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[HMDHomeActivityStateManagerDataSource alloc] initWithHome:v4];
  int8x16_t v6 = +[HMDUserActivityReportCoordinatorFactory coordinatorWithHome:v4];

  v7 = [[HMDHomeAwayStateDetector alloc] initWithDataSource:v5];
  v14[0] = v7;
  int8x16_t v8 = [[HMDUserActivityType3Detector alloc] initWithDataSource:v5];
  v14[1] = v8;
  id v9 = [[HMDUserActivityType6Detector alloc] initWithDataSource:v5];
  v14[2] = v9;
  id v10 = [[HMDUserActivityStateType4Detector alloc] initWithDataSource:v5];
  v14[3] = v10;
  id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:4];

  v12 = [(HMDUserActivityStateDetectorManager *)self initWithDataSource:v5 userActivityReportCoordinator:v6 detectors:v11];
  return v12;
}

+ (BOOL)shouldRunManagerForHome:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 currentUser];
  int8x16_t v6 = v5;
  if (v5 && ([v5 isAllowedToContributeActivityStates] & 1) != 0)
  {
    char v7 = isThisDeviceDesignatedFMFDevice();
  }
  else
  {
    int8x16_t v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = a1;
    id v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = HMFGetLogIdentifier();
      int v13 = 138543362;
      v14 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@HMDUserActivityStateDetectorManager is not allowed due to user policy", (uint8_t *)&v13, 0xCu);
    }
    char v7 = 0;
  }

  return v7;
}

@end