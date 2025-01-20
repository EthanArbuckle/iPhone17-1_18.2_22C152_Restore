@interface HMDXPCEntitlementMessageFilter
+ (id)logCategory;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDXPCEntitlementMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [v8 proxyConnection];

    if (v10)
    {
      v11 = [a1 requiredPolicyOfClass:objc_opt_class() fromPolicies:v9 error:0];
      v12 = v11;
      if (v11)
      {
        uint64_t v13 = [v11 entitlements];
        v14 = [v8 proxyConnection];
        unint64_t v15 = v13 & ~[v14 entitlements];

        if (!v15)
        {
          int64_t v22 = 1;
          goto LABEL_15;
        }
        v16 = (void *)MEMORY[0x1D9452090]();
        id v17 = a1;
        v18 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = HMFGetLogIdentifier();
          v20 = [v8 shortDescription];
          v21 = HMXPCClientEntitlementsToComponents(v15);
          int v28 = 138543874;
          v29 = v19;
          __int16 v30 = 2112;
          v31 = v20;
          __int16 v32 = 2112;
          v33 = v21;
          _os_log_impl(&dword_1D49D5000, v18, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message, %@, client is missing the following entitlements: %@", (uint8_t *)&v28, 0x20u);
        }
        if (a5)
        {
          *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:80];
        }
      }
      else
      {
        v23 = (void *)MEMORY[0x1D9452090]();
        id v24 = a1;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          int v28 = 138543362;
          v29 = v26;
          _os_log_impl(&dword_1D49D5000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing XPC policy", (uint8_t *)&v28, 0xCu);
        }
      }
      int64_t v22 = -1;
LABEL_15:

      goto LABEL_16;
    }
  }
  int64_t v22 = 0;
LABEL_16:

  return v22;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_121180 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_121180, &__block_literal_global_121181);
  }
  v2 = (void *)logCategory__hmf_once_v3_121182;
  return v2;
}

uint64_t __45__HMDXPCEntitlementMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_121182;
  logCategory__hmf_once_v3_121182 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end