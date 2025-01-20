@interface HMDXPCBackgroundMessageFilter
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
@end

@implementation HMDXPCBackgroundMessageFilter

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = [v8 proxyConnection];

    int v11 = [v8 isBackground];
    int64_t v12 = 0;
    if (v10 && v11)
    {
      v13 = [a1 requiredPolicyOfClass:objc_opt_class() fromPolicies:v9 error:0];

      if (v13)
      {
        v14 = [a1 requiredPolicyOfClass:objc_opt_class() fromPolicies:v9 error:0];
        v15 = v14;
        if (v14)
        {
          if (![v14 requiresEntitlement]
            || ([v8 proxyConnection],
                v16 = objc_claimAutoreleasedReturnValue(),
                char v17 = [v16 entitlements],
                v16,
                (v17 & 2) != 0))
          {
            int64_t v12 = 1;
LABEL_19:

            goto LABEL_20;
          }
          v18 = (void *)MEMORY[0x1D9452090]();
          id v19 = a1;
          v20 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = HMFGetLogIdentifier();
            int v27 = 138543362;
            v28 = v21;
            _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Handler does not support background access", (uint8_t *)&v27, 0xCu);
          }
          if (a5)
          {
            *a5 = [MEMORY[0x1E4F28C58] hmErrorWithCode:80 description:0 reason:@"Handler does not support background access" suggestion:0];
          }
        }
        else
        {
          v22 = (void *)MEMORY[0x1D9452090]();
          id v23 = a1;
          v24 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v25 = HMFGetLogIdentifier();
            int v27 = 138543362;
            v28 = v25;
            _os_log_impl(&dword_1D49D5000, v24, OS_LOG_TYPE_ERROR, "%{public}@Missing background policy", (uint8_t *)&v27, 0xCu);
          }
        }
        int64_t v12 = -1;
        goto LABEL_19;
      }
      int64_t v12 = -1;
    }
  }
  else
  {
    int64_t v12 = 0;
  }
LABEL_20:

  return v12;
}

@end