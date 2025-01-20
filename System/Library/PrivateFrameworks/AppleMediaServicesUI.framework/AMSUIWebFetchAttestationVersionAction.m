@interface AMSUIWebFetchAttestationVersionAction
- (ACAccount)account;
- (AMSUIWebFetchAttestationVersionAction)initWithJSObject:(id)a3 context:(id)a4;
- (id)minimumVersions;
- (id)runAction;
- (void)setAccount:(id)a3;
@end

@implementation AMSUIWebFetchAttestationVersionAction

- (AMSUIWebFetchAttestationVersionAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebFetchAttestationVersionAction;
  v8 = [(AMSUIWebAction *)&v13 initWithJSObject:v6 context:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"account"];
    uint64_t v10 = [v7 iTunesAccountFromJSAccount:v9];
    account = v8->_account;
    v8->_account = (ACAccount *)v10;
  }
  return v8;
}

- (id)runAction
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)AMSUIWebFetchAttestationVersionAction;
  id v3 = [(AMSUIWebAction *)&v27 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v31 = v6;
    __int16 v32 = 2114;
    v33 = v7;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching current attestation version.", buf, 0x16u);
  }
  id v8 = objc_alloc_init(MEMORY[0x263F27C98]);
  [v8 setPurpose:0];
  objc_msgSend(v8, "setStyle:", objc_msgSend(MEMORY[0x263F27C98], "preferredAttestationStyle"));
  v9 = (void *)MEMORY[0x263F27B60];
  uint64_t v10 = [(AMSUIWebFetchAttestationVersionAction *)self account];
  id v26 = 0;
  v11 = [v9 ACLVersionForAccount:v10 options:v8 error:&v26];
  id v12 = v26;

  if (v11)
  {
    objc_super v13 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v13)
    {
      objc_super v13 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v15;
      __int16 v32 = 2114;
      v33 = v16;
      __int16 v34 = 2114;
      id v35 = v11;
      _os_log_impl(&dword_21C134000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully fetched current attestation version. %{public}@", buf, 0x20u);
    }
    v17 = (void *)MEMORY[0x263F27E10];
    v28[0] = @"currentVersion";
    v28[1] = @"minimumVersions";
    v29[0] = v11;
    v18 = [(AMSUIWebFetchAttestationVersionAction *)self minimumVersions];
    v29[1] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];
    v20 = [v17 promiseWithResult:v19];
  }
  else
  {
    if (!v12)
    {
      AMSError();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v21)
    {
      v21 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v23;
      __int16 v32 = 2114;
      v33 = v24;
      __int16 v34 = 2114;
      id v35 = v12;
      _os_log_impl(&dword_21C134000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to fetch current attestation version. %{public}@", buf, 0x20u);
    }
    v20 = [MEMORY[0x263F27E10] promiseWithError:v12];
  }

  return v20;
}

- (id)minimumVersions
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (minimumVersions_ams_once_token___COUNTER__ != -1) {
    dispatch_once(&minimumVersions_ams_once_token___COUNTER__, &__block_literal_global_22);
  }
  id v2 = (id)minimumVersions_ams_once_object___COUNTER__;
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(MEMORY[0x263F27B60], "minimumACLVersionForAction:", objc_msgSend(v9, "integerValue", (void)v13));
        if (v10)
        {
          v11 = [v4 objectForKey:v9];
          [v3 setObject:v10 forKey:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

void __56__AMSUIWebFetchAttestationVersionAction_minimumVersions__block_invoke()
{
  v3[8] = *MEMORY[0x263EF8340];
  v2[0] = &unk_26CC73718;
  v2[1] = &unk_26CC73730;
  v3[0] = AMSUIWebBiometricsActionTypePrimaryTouchID;
  v3[1] = AMSUIWebBiometricsActionTypePrimaryFaceID;
  v2[2] = &unk_26CC73748;
  v2[3] = &unk_26CC73760;
  v3[2] = AMSUIWebBiometricsActionTypePrimarySecurityPreventReplay;
  v3[3] = AMSUIWebBiometricsActionTypePrimaryCardEnrollment;
  v2[4] = &unk_26CC73778;
  v2[5] = &unk_26CC73790;
  v3[4] = AMSUIWebBiometricsActionTypePrimaryPaymentDirectivePassword;
  v3[5] = AMSUIWebBiometricsActionTypePrimaryPaymentDirectivePasscode;
  v2[6] = &unk_26CC737A8;
  v2[7] = &unk_26CC737C0;
  v3[6] = AMSUIWebBiometricsActionTypeExtendedTouchID;
  v3[7] = AMSUIWebBiometricsActionTypeExtendedFaceID;
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:8];
  v1 = (void *)minimumVersions_ams_once_object___COUNTER__;
  minimumVersions_ams_once_object___COUNTER__ = v0;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end