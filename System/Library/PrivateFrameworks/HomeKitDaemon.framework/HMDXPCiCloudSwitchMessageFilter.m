@interface HMDXPCiCloudSwitchMessageFilter
+ (BOOL)isHomeiCloudSwitchEnabled;
+ (id)logCategory;
+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5;
+ (void)setHomeiCloudSwitchEnabledOverride:(BOOL)a3;
+ (void)stopOverridingHomeiCloudSwitchEnabled;
@end

@implementation HMDXPCiCloudSwitchMessageFilter

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_110010 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_110010, &__block_literal_global_110011);
  }
  v2 = (void *)logCategory__hmf_once_v7_110012;
  return v2;
}

void __46__HMDXPCiCloudSwitchMessageFilter_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_110012;
  logCategory__hmf_once_v7_110012 = v0;
}

+ (BOOL)isHomeiCloudSwitchEnabled
{
  v2 = (void *)homeiCloudSwitchEnabledOverrideNumber;
  if (homeiCloudSwitchEnabledOverrideNumber)
  {
    return [v2 BOOLValue];
  }
  else
  {
    v4 = +[HMDAppleAccountSettings sharedSettings];
    char v5 = [v4 isHomeEnabled];

    return v5;
  }
}

+ (void)stopOverridingHomeiCloudSwitchEnabled
{
  v2 = (void *)homeiCloudSwitchEnabledOverrideNumber;
  homeiCloudSwitchEnabledOverrideNumber = 0;
}

+ (void)setHomeiCloudSwitchEnabledOverride:(BOOL)a3
{
  uint64_t v3 = [NSNumber numberWithBool:a3];
  v4 = (void *)homeiCloudSwitchEnabledOverrideNumber;
  homeiCloudSwitchEnabledOverrideNumber = v3;
}

+ (int64_t)filterMessage:(id)a3 withPolicies:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    _HMFPreconditionFailure();
LABEL_28:
    _HMFPreconditionFailure();
  }
  v10 = v9;
  if (!v9) {
    goto LABEL_28;
  }
  v11 = [v8 proxyConnection];

  if (!v11)
  {
    int64_t v12 = 0;
    goto LABEL_26;
  }
  if (([a1 isHomeiCloudSwitchEnabled] & 1) == 0)
  {
    v13 = [a1 requiredPolicyOfClass:objc_opt_class() fromPolicies:v10 error:0];
    if (!v13)
    {
      v19 = (void *)MEMORY[0x230FBD990]();
      id v20 = a1;
      v21 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = HMFGetLogIdentifier();
        v23 = [v8 shortDescription];
        int v33 = 138543618;
        v34 = v22;
        __int16 v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_INFO, "%{public}@Rejecting message because iCloud switch is disabled and no explicit policy exists: %@", (uint8_t *)&v33, 0x16u);
      }
      if (a5)
      {
        *a5 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2013];
      }
      int64_t v12 = -1;
      goto LABEL_25;
    }
    v14 = [v8 proxyConnection];
    v15 = [v14 processInfo];
    v16 = [v15 bundleIdentifier];

    if (v16)
    {
      v17 = [v13 bundleIdentifiers];
      char v18 = [v17 containsObject:v16];

      if (v18)
      {
        int64_t v12 = 1;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        v28 = [v8 shortDescription];
        int v33 = 138543874;
        v34 = v27;
        __int16 v35 = 2112;
        v36 = v28;
        __int16 v37 = 2112;
        v38 = v16;
        v29 = "%{public}@Rejecting message because iCloud switch is disabled and bundle identifier is not allowed: %@ / %@";
        v30 = v26;
        uint32_t v31 = 32;
        goto LABEL_20;
      }
    }
    else
    {
      v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = HMFGetLogIdentifier();
        v28 = [v8 shortDescription];
        int v33 = 138543618;
        v34 = v27;
        __int16 v35 = 2112;
        v36 = v28;
        v29 = "%{public}@Rejecting message because iCloud switch is disabled and no bundle identifier was found: %@";
        v30 = v26;
        uint32_t v31 = 22;
LABEL_20:
        _os_log_impl(&dword_22F52A000, v30, OS_LOG_TYPE_INFO, v29, (uint8_t *)&v33, v31);
      }
    }

    if (a5)
    {
      *a5 = [MEMORY[0x263F087E8] hmPrivateErrorWithCode:2013];
    }
    int64_t v12 = -1;
    goto LABEL_24;
  }
  int64_t v12 = 1;
LABEL_26:

  return v12;
}

@end