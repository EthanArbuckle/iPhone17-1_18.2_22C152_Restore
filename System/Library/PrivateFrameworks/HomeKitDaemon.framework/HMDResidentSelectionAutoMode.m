@interface HMDResidentSelectionAutoMode
+ (id)logCategory;
- (HMDResidentSelectionAutoMode)initWithContext:(id)a3;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)currentModeType;
- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6;
@end

@implementation HMDResidentSelectionAutoMode

- (id)shortDescription
{
  v2 = NSString;
  v3 = [(HMDResidentSelectionMode *)self context];
  v4 = [v3 home];
  v5 = [v4 uuid];
  v6 = [v2 stringWithFormat:@"%@", v5];

  return v6;
}

- (id)logIdentifier
{
  v2 = [(HMDResidentSelectionMode *)self context];
  v3 = [v2 home];
  v4 = [v3 uuid];
  v5 = [v4 UUIDString];

  return v5;
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a6;
  v10 = [(HMDResidentSelectionMode *)self context];
  v11 = [v10 primaryResidentDevice];

  v12 = [(HMDResidentSelectionMode *)self sortedResidents];
  if ([v12 count])
  {
    v13 = (void *)[v12 mutableCopy];
    v14 = v13;
    if (v11)
    {
      [v13 removeObject:v11];
      [v14 insertObject:v11 atIndex:0];
    }
    v15 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      __int16 v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_INFO, "%{public}@Sorted list of residents for auto selection: %@.", buf, 0x16u);
    }
    v19 = (void *)[v14 copy];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke;
    v25[3] = &unk_264A1E820;
    v25[4] = v16;
    id v26 = v9;
    [(HMDResidentSelectionMode *)v16 selectPrimaryResidentFromResidents:v19 requireAutoUpdate:0 completion:v25];
  }
  else
  {
    v20 = (void *)MEMORY[0x230FBD990]();
    v21 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@There are no residents in the home. Auto mode selection failed.", buf, 0xCu);
    }
    v14 = [(HMDResidentSelectionMode *)v21 delegate];
    v24 = [MEMORY[0x263F087E8] hmfErrorWithCode:14];
    [v14 primarySelectionMode:v21 didFailToSelectWithError:v24];
  }
}

void __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2;
  v11[3] = &unk_264A2EE30;
  id v8 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v5;
  id v14 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, v11);
}

void __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = (void *)MEMORY[0x230FBD990]();
  id v5 = *(id *)(a1 + 32);
  id v6 = HMFGetOSLogHandle();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      id v8 = HMFGetLogIdentifier();
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543618;
      id v12 = v8;
      __int16 v13 = 2112;
      uint64_t v14 = v9;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Auto mode selection failed with error: %@.", (uint8_t *)&v11, 0x16u);
    }
    [v2 primarySelectionMode:*(void *)(a1 + 32) didFailToSelectWithError:*(void *)(a1 + 40)];
  }
  else
  {
    if (v7)
    {
      id v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      id v12 = v10;
      _os_log_impl(&dword_22F52A000, v6, OS_LOG_TYPE_INFO, "%{public}@Auto mode selection completed.", (uint8_t *)&v11, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (unint64_t)currentModeType
{
  return 3;
}

- (HMDResidentSelectionAutoMode)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDResidentSelectionAutoMode;
  return [(HMDResidentSelectionMode *)&v4 initWithContext:a3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_104931 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_104931, &__block_literal_global_104932);
  }
  v2 = (void *)logCategory__hmf_once_v5_104933;
  return v2;
}

void __43__HMDResidentSelectionAutoMode_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v5_104933;
  logCategory__hmf_once_v5_104933 = v0;
}

@end