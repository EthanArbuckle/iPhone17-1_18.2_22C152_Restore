@interface HMDNotificationConditionEvaluator
+ (id)logCategory;
- (BOOL)conditionsPass:(id)a3 registrationUser:(id)a4;
- (HMDNotificationConditionEvaluator)initWithConditionHandlers:(id)a3;
- (NSSet)conditionHandlers;
@end

@implementation HMDNotificationConditionEvaluator

- (void).cxx_destruct
{
}

- (NSSet)conditionHandlers
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)conditionsPass:(id)a3 registrationUser:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Conditions to evaluate is empty, passing by default", buf, 0xCu);
    }
    char v12 = 1;
  }
  else
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke;
    v14[3] = &unk_264A1B830;
    v14[4] = self;
    id v15 = v7;
    char v12 = objc_msgSend(v6, "na_all:", v14);
  }
  return v12;
}

uint64_t __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) conditionHandlers];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke_2;
  v13[3] = &unk_264A1B808;
  id v5 = v3;
  id v14 = v5;
  id v6 = objc_msgSend(v4, "na_firstObjectPassingTest:", v13);

  if (v6)
  {
    uint64_t v7 = [v6 conditionPasses:v5 registrationUser:*(void *)(a1 + 40)];
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    id v9 = *(id *)(a1 + 32);
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_ERROR, "%{public}@No handler found for condition: %@", buf, 0x16u);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 canHandleCondition:*(void *)(a1 + 32)];
}

- (HMDNotificationConditionEvaluator)initWithConditionHandlers:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNotificationConditionEvaluator;
  id v6 = [(HMDNotificationConditionEvaluator *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_conditionHandlers, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_59515 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_59515, &__block_literal_global_59516);
  }
  v2 = (void *)logCategory__hmf_once_v3_59517;
  return v2;
}

void __48__HMDNotificationConditionEvaluator_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_59517;
  logCategory__hmf_once_v3_59517 = v0;
}

@end