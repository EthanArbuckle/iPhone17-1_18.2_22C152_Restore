@interface HMDXPCEntitlementMessageFilter
+ (id)logCategory;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDXPCEntitlementMessageFilter

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_176231 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_176231, &__block_literal_global_176232);
  }
  v2 = (void *)logCategory__hmf_once_v3_176233;
  return v2;
}

void __45__HMDXPCEntitlementMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v3_176233;
  logCategory__hmf_once_v3_176233 = v0;
}

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
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
        v16 = (void *)MEMORY[0x230FBD990]();
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
          _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Rejecting message, %@, client is missing the following entitlements: %@", (uint8_t *)&v28, 0x20u);
        }
        if (a5)
        {
          *a5 = [MEMORY[0x263F087E8] hmErrorWithCode:80];
        }
      }
      else
      {
        v23 = (void *)MEMORY[0x230FBD990]();
        id v24 = a1;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          int v28 = 138543362;
          v29 = v26;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@Missing XPC policy", (uint8_t *)&v28, 0xCu);
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

@end