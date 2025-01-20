@interface HMDCHIPControllerFabricDataSource
+ (id)logCategory;
- (BOOL)removeValueForKey:(id)a3 completion:(id)a4;
- (BOOL)setValue:(id)a3 forKey:(id)a4 completion:(id)a5;
- (HMDCHIPControllerFabricDataSource)initWithHome:(id)a3;
- (HMDHome)home;
- (id)keyValueStore;
- (id)logIdentifier;
- (id)valueForKey:(id)a3;
- (void)setHome:(id)a3;
@end

@implementation HMDCHIPControllerFabricDataSource

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

- (id)logIdentifier
{
  v2 = [(HMDCHIPControllerFabricDataSource *)self home];
  v3 = NSString;
  v4 = [v2 logIdentifier];
  v5 = [v2 fabric];
  v6 = [v5 fabricID];
  v7 = [v3 stringWithFormat:@"%@/%@", v4, v6];

  return v7;
}

- (BOOL)removeValueForKey:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x230FBD990]();
  v9 = self;
  v10 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = HMFGetLogIdentifier();
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@Controller Fabric Data Source not implemented yet", (uint8_t *)&v13, 0xCu);
  }

  return 0;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  int v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_ERROR, "%{public}@Controller Fabric Data Source not implemented yet", (uint8_t *)&v16, 0xCu);
  }

  return 0;
}

- (id)valueForKey:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  id v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Controller Fabric Data Source not implemented yet", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (id)keyValueStore
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990](self, a2);
  id v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = HMFGetLogIdentifier();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_ERROR, "%{public}@Controller Fabric Data Source not implemented yet", (uint8_t *)&v8, 0xCu);
  }
  return 0;
}

- (HMDCHIPControllerFabricDataSource)initWithHome:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v11.receiver = self;
    v11.super_class = (Class)HMDCHIPControllerFabricDataSource;
    id v6 = [(HMDCHIPControllerFabricDataSource *)&v11 init];
    id v7 = v6;
    if (v6) {
      objc_storeWeak((id *)&v6->_home, v5);
    }

    return v7;
  }
  else
  {
    id v9 = (void *)_HMFPreconditionFailure();
    return (HMDCHIPControllerFabricDataSource *)+[HMDCHIPControllerFabricDataSource logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_268696 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_268696, &__block_literal_global_268697);
  }
  v2 = (void *)logCategory__hmf_once_v5_268698;
  return v2;
}

void __48__HMDCHIPControllerFabricDataSource_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_268698;
  logCategory__hmf_once_v5_268698 = v0;
}

@end