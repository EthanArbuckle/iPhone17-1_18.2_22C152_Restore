@interface HMDResidentSelectionManualMode
+ (id)logCategory;
- (HMDResidentSelectionManualMode)initWithContext:(id)a3;
- (id)logIdentifier;
- (id)shortDescription;
- (unint64_t)currentModeType;
- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6;
@end

@implementation HMDResidentSelectionManualMode

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
  BOOL v7 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a6;
  if (v9)
  {
    v11 = [MEMORY[0x263EFF8C0] arrayWithObject:v9];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke;
    v16[3] = &unk_264A2EE08;
    v16[4] = self;
    id v17 = v10;
    [(HMDResidentSelectionMode *)self selectPrimaryResidentFromResidents:v11 requireAutoUpdate:v7 completion:v16];
  }
  else
  {
    v12 = (void *)MEMORY[0x230FBD990]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform selection with no preferred primary info.", buf, 0xCu);
    }
  }
}

void __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = [*(id *)(a1 + 32) queue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2;
  v12[3] = &unk_264A2EE30;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v8;
  id v15 = v5;
  id v16 = v9;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, v12);
}

uint64_t __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = *(id *)(a1 + 40);
  id v5 = HMFGetOSLogHandle();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      BOOL v7 = HMFGetLogIdentifier();
      uint64_t v8 = *(void *)(a1 + 32);
      int v12 = 138543618;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Manual mode selection failed with error: %@.", (uint8_t *)&v12, 0x16u);
    }
    id v9 = [*(id *)(a1 + 40) delegate];
    [v9 primarySelectionMode:*(void *)(a1 + 40) didFailToSelectWithError:*(void *)(a1 + 32)];
  }
  else
  {
    if (v6)
    {
      id v10 = HMFGetLogIdentifier();
      int v12 = 138543362;
      id v13 = v10;
      _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_INFO, "%{public}@Manual mode selection completed.", (uint8_t *)&v12, 0xCu);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (unint64_t)currentModeType
{
  return 2;
}

- (HMDResidentSelectionManualMode)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HMDResidentSelectionManualMode;
  return [(HMDResidentSelectionMode *)&v4 initWithContext:a3];
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_105871 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_105871, &__block_literal_global_105872);
  }
  uint64_t v2 = (void *)logCategory__hmf_once_v4_105873;
  return v2;
}

void __45__HMDResidentSelectionManualMode_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_105873;
  logCategory__hmf_once_v4_105873 = v0;
}

@end