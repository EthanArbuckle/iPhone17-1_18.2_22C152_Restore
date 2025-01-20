@interface HMDHomeAIPhotosPersonDataInterface
+ (id)logCategory;
- (HMDHomeAIPhotosPersonDataInterface)initWithPersonManagerUUID:(id)a3 homeUUID:(id)a4 workQueue:(id)a5;
- (HMDHomeAIPhotosPersonDataInterface)initWithPhotosPersonManager:(id)a3 workQueue:(id)a4;
- (HMIExternalPersonManager)photosPersonManager;
- (id)logIdentifier;
- (void)fetchSettingsWithCompletion:(id)a3;
- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4;
@end

@implementation HMDHomeAIPhotosPersonDataInterface

- (void).cxx_destruct
{
}

- (HMIExternalPersonManager)photosPersonManager
{
  return (HMIExternalPersonManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)handleUpdatedSettings:(id)a3 mirrorOutputFuture:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  dispatch_assert_queue_V2(v8);

  v9 = [v6 createHMIExternalPersonManagerSettings];
  if (v9)
  {
    v10 = [(HMDHomeAIPhotosPersonDataInterface *)self photosPersonManager];
    [v10 handleUpdatedSettings:v9];
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v12 = self;
    v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Updated settings could not be converted into HMIExternalPersonManagerSettings: %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)fetchSettingsWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDHomeAIPersonDataInterface *)self workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__HMDHomeAIPhotosPersonDataInterface_fetchSettingsWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __66__HMDHomeAIPhotosPersonDataInterface_fetchSettingsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x230FBD990]();
  id v3 = *(id *)(a1 + 32);
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = HMFGetLogIdentifier();
    int v15 = 138543362;
    v16 = v5;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@Fetching settings", (uint8_t *)&v15, 0xCu);
  }
  id v6 = [*(id *)(a1 + 32) dataSource];
  id v7 = [v6 settings];

  id v8 = [v7 createHMIExternalPersonManagerSettings];
  if (v8)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    id v10 = *(id *)(a1 + 32);
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v12;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@Fetched settings could not be converted into HMIExternalPersonManagerSettings: %@", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [MEMORY[0x263F087E8] hmfErrorWithCode:15];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v14);
  }
}

- (id)logIdentifier
{
  v2 = [(HMDHomeAIPhotosPersonDataInterface *)self photosPersonManager];
  id v3 = [v2 UUID];
  id v4 = [v3 UUIDString];

  return v4;
}

- (HMDHomeAIPhotosPersonDataInterface)initWithPhotosPersonManager:(id)a3 workQueue:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDHomeAIPhotosPersonDataInterface;
  id v8 = [(HMDHomeAIPersonDataInterface *)&v11 initWithPersonManager:v7 workQueue:a4];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_photosPersonManager, a3);
  }

  return v9;
}

- (HMDHomeAIPhotosPersonDataInterface)initWithPersonManagerUUID:(id)a3 homeUUID:(id)a4 workQueue:(id)a5
{
  id v8 = (objc_class *)MEMORY[0x263F47C88];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithUUID:v11 homeUUID:v10];

  uint64_t v13 = [(HMDHomeAIPhotosPersonDataInterface *)self initWithPhotosPersonManager:v12 workQueue:v9];
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_80523 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_80523, &__block_literal_global_80524);
  }
  v2 = (void *)logCategory__hmf_once_v1_80525;
  return v2;
}

void __49__HMDHomeAIPhotosPersonDataInterface_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_80525;
  logCategory__hmf_once_v1_80525 = v0;
}

@end