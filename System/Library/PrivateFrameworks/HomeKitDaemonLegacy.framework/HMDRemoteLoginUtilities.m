@interface HMDRemoteLoginUtilities
+ (ACAccount)primaryITunesAccount;
+ (BOOL)isTwoFactorAuthenticationEnabledForAccount;
+ (id)logCategory;
+ (int64_t)serviceTypeForAccountService:(unint64_t)a3;
+ (void)fetchIsTwoFactorAuthenticationEnabledForAccountWithReason:(id)a3 completionHandler:(id)a4;
@end

@implementation HMDRemoteLoginUtilities

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_179336 != -1) {
    dispatch_once(&logCategory__hmf_once_t4_179336, &__block_literal_global_179337);
  }
  v2 = (void *)logCategory__hmf_once_v5_179338;
  return v2;
}

uint64_t __38__HMDRemoteLoginUtilities_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v5_179338;
  logCategory__hmf_once_v5_179338 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (BOOL)isTwoFactorAuthenticationEnabledForAccount
{
  v2 = +[HMDAppleAccountManager sharedManager];
  v3 = [v2 accountContext];
  v4 = [v3 alternateDSID];

  v5 = [MEMORY[0x1E4F4EF40] sharedInstance];
  v6 = [v5 authKitAccountWithAltDSID:v4];
  BOOL v7 = (unint64_t)[v5 securityLevelForAccount:v6] > 2;

  return v7;
}

+ (void)fetchIsTwoFactorAuthenticationEnabledForAccountWithReason:(id)a3 completionHandler:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[HMDAppleAccountManager sharedManager];
  v9 = [v8 accountContext];
  v10 = [v9 username];

  v11 = +[HMDAppleAccountManager sharedManager];
  v12 = [v11 accountContext];
  v13 = [v12 alternateDSID];

  id v14 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  [v14 setUsername:v10];
  [v14 setAltDSID:v13];
  [v14 setIsUsernameEditable:0];
  [v14 setReason:v6];
  [v14 setServiceType:0];
  v15 = (void *)MEMORY[0x1D9452090]([v14 setShouldPreventInteractiveAuth:1]);
  id v16 = a1;
  v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138544130;
    v25 = v18;
    __int16 v26 = 2112;
    v27 = v10;
    __int16 v28 = 2112;
    v29 = v13;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_INFO, "%{public}@Querying 2FA status with username: %@ altDSID: %@ reason: %@", buf, 0x2Au);
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __103__HMDRemoteLoginUtilities_fetchIsTwoFactorAuthenticationEnabledForAccountWithReason_completionHandler___block_invoke;
  v21[3] = &unk_1E6A17818;
  id v22 = v7;
  id v23 = v16;
  id v20 = v7;
  [v19 authenticateWithContext:v14 completion:v21];
}

void __103__HMDRemoteLoginUtilities_fetchIsTwoFactorAuthenticationEnabledForAccountWithReason_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "hmf_BOOLForKey:", *MEMORY[0x1E4F4EDD0]);
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 40);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = HMFBooleanToString();
      int v17 = 138543618;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      v12 = "%{public}@Authentication result shows isTwoFactorAuthorizationEnabled=%@";
LABEL_8:
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v17, 0x16u);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1D9452090]();
    id v14 = *(id *)(a1 + 40);
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v16;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_INFO, "%{public}@Unable to directly determine 2FA authentication status: %@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 40) isTwoFactorAuthenticationEnabledForAccount];
    id v7 = (void *)MEMORY[0x1D9452090]();
    id v8 = *(id *)(a1 + 40);
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      v11 = HMFBooleanToString();
      int v17 = 138543618;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      v12 = "%{public}@Account security level shows isTwoFactorAuthorizationEnabled=%@";
      goto LABEL_8;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (ACAccount)primaryITunesAccount
{
  v2 = +[HMDAppleAccountManager sharedManager];
  v3 = [v2 accountStore];
  v4 = objc_msgSend(v3, "ams_activeiTunesAccount");

  return (ACAccount *)v4;
}

+ (int64_t)serviceTypeForAccountService:(unint64_t)a3
{
  return 2 * (a3 == 0);
}

@end