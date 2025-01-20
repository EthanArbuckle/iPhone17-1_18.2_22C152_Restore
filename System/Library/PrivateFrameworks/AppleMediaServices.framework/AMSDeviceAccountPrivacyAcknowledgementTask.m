@interface AMSDeviceAccountPrivacyAcknowledgementTask
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (ACAccount)account;
- (AMSBagProtocol)bag;
- (AMSDeviceAccountPrivacyAcknowledgementTask)initWithAccount:(id)a3 bag:(id)a4;
- (id)_presentEngagementRequest:(id)a3;
- (id)_presentGDPREngagementRequestForAccount:(id)a3 bundleOwnerStatus:(BOOL)a4;
- (id)_verifyGDPRStatusForAccount:(id)a3;
- (id)performPrivacyAcknowledgement;
@end

@implementation AMSDeviceAccountPrivacyAcknowledgementTask

- (AMSDeviceAccountPrivacyAcknowledgementTask)initWithAccount:(id)a3 bag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSDeviceAccountPrivacyAcknowledgementTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_bag, a4);
  }

  return v10;
}

- (id)performPrivacyAcknowledgement
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __75__AMSDeviceAccountPrivacyAcknowledgementTask_performPrivacyAcknowledgement__block_invoke;
  v4[3] = &unk_1E559EDC0;
  v4[4] = self;
  v2 = [(AMSTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

uint64_t __75__AMSDeviceAccountPrivacyAcknowledgementTask_performPrivacyAcknowledgement__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = *(void **)(a1 + 32);
  v4 = [v3 account];
  v5 = [v3 _verifyGDPRStatusForAccount:v4];
  uint64_t v6 = [v5 resultWithError:a2];

  id v7 = +[AMSLogConfig sharedAccountsConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    v10 = AMSLogKey();
    int v12 = 138543874;
    uint64_t v13 = v9;
    __int16 v14 = 2114;
    v15 = v10;
    __int16 v16 = 1024;
    int v17 = v6;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task complete. Result: %d", (uint8_t *)&v12, 0x1Cu);
  }
  return v6;
}

- (id)_verifyGDPRStatusForAccount:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(AMSBinaryPromise);
  uint64_t v6 = objc_msgSend(v4, "ams_isBundleOwner");
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 BOOLValue];
    if (v8) {
      +[AMSAcknowledgePrivacyTask _appleBundleOwnerPrivacyIdentifier];
    }
    else {
    v15 = +[AMSAcknowledgePrivacyTask _appleBundleHolderPrivacyIdentifier];
    }
    BOOL v16 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:v15 account:v4];
    uint64_t v17 = +[AMSLogConfig sharedAccountsConfig];
    uint64_t v18 = (void *)v17;
    if (v16)
    {
      if (!v17)
      {
        uint64_t v18 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v18 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = objc_opt_class();
        AMSLogKey();
        v21 = v31 = self;
        v22 = [v4 hashedDescription];
        *(_DWORD *)buf = 138544130;
        uint64_t v36 = v20;
        __int16 v37 = 2114;
        v38 = v21;
        __int16 v39 = 2114;
        v40 = v15;
        __int16 v41 = 2114;
        v42 = v22;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Requesting gdpr presentation for id: %{public}@ for %{public}@", buf, 0x2Au);

        self = v31;
      }

      v23 = [(AMSDeviceAccountPrivacyAcknowledgementTask *)self _presentGDPREngagementRequestForAccount:v4 bundleOwnerStatus:v8];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __74__AMSDeviceAccountPrivacyAcknowledgementTask__verifyGDPRStatusForAccount___block_invoke;
      v32[3] = &unk_1E55A1D20;
      v32[4] = self;
      id v33 = v4;
      id v34 = v15;
      v24 = [v23 continueWithBlock:v32];
      [(AMSBinaryPromise *)v5 finishWithPromise:v24];
      v25 = v5;
    }
    else
    {
      if (!v17)
      {
        uint64_t v18 = +[AMSLogConfig sharedConfig];
      }
      v26 = [v18 OSLogObject];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = objc_opt_class();
        v28 = AMSLogKey();
        *(_DWORD *)buf = 138543618;
        uint64_t v36 = v27;
        __int16 v37 = 2114;
        v38 = v28;
        _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping subscription bundle acknowledgement - already acknowledged", buf, 0x16u);
      }
      [(AMSBinaryPromise *)v5 finishWithSuccess];
      v29 = v5;
    }
  }
  else
  {
    uint64_t v9 = +[AMSLogConfig sharedAccountsConfig];
    if (!v9)
    {
      uint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v36 = v11;
      __int16 v37 = 2114;
      v38 = v12;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine bundle owner status", buf, 0x16u);
    }
    uint64_t v13 = AMSError(7, @"Missing bundle owner status", 0, 0);
    [(AMSBinaryPromise *)v5 finishWithError:v13];

    __int16 v14 = v5;
  }

  return v5;
}

id __74__AMSDeviceAccountPrivacyAcknowledgementTask__verifyGDPRStatusForAccount___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = +[AMSLogConfig sharedAccountsConfig];
  id v7 = (void *)v6;
  if (v5)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      uint64_t v11 = AMSLogableError(v5);
      int v28 = 138543874;
      uint64_t v29 = v9;
      __int16 v30 = 2114;
      v31 = v10;
      __int16 v32 = 2114;
      id v33 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Presentation error %{public}@", (uint8_t *)&v28, 0x20u);
    }
    uint64_t v12 = +[AMSBinaryPromise promiseWithError:v5];
    goto LABEL_7;
  }
  if (a2)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    __int16 v14 = [v7 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = objc_opt_class();
      BOOL v16 = AMSLogKey();
      int v28 = 138543618;
      uint64_t v29 = v15;
      __int16 v30 = 2114;
      v31 = v16;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presentation succeeded. Verifying that privacy criteria is met.", (uint8_t *)&v28, 0x16u);
    }
    [*(id *)(a1 + 40) reload];
    BOOL v17 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:*(void *)(a1 + 48) account:*(void *)(a1 + 40)];
    uint64_t v18 = +[AMSLogConfig sharedAccountsConfig];
    if (!v18)
    {
      uint64_t v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      int v28 = 138543874;
      uint64_t v29 = v20;
      __int16 v30 = 2114;
      v31 = v21;
      __int16 v32 = 1024;
      LODWORD(v33) = !v17;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Did acknowledge: %d", (uint8_t *)&v28, 0x1Cu);
    }
    if (!v17)
    {
      uint64_t v12 = +[AMSBinaryPromise promiseWithSuccess];
LABEL_7:
      uint64_t v13 = (void *)v12;
      goto LABEL_24;
    }
    v22 = AMSError(0, @"Presentation ended without privacy being acknowledgement", 0, 0);
    uint64_t v13 = +[AMSBinaryPromise promiseWithError:v22];
  }
  else
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v7 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      v25 = AMSLogKey();
      int v28 = 138543618;
      uint64_t v29 = v24;
      __int16 v30 = 2114;
      v31 = v25;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Presentation errored silently.", (uint8_t *)&v28, 0x16u);
    }
    v26 = AMSError(0, @"Presentation returned false with no error", 0, 0);
    uint64_t v13 = +[AMSBinaryPromise promiseWithError:v26];
  }
LABEL_24:

  return v13;
}

- (id)_presentGDPREngagementRequestForAccount:(id)a3 bundleOwnerStatus:(BOOL)a4
{
  BOOL v4 = a4;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  uint64_t v8 = [(AMSDeviceAccountPrivacyAcknowledgementTask *)self bag];
  uint64_t v9 = [v8 URLForKey:@"dynamic-ui-bundle-gdpr-url"];
  id v18 = 0;
  v10 = [v9 valueWithError:&v18];
  uint64_t v11 = (AMSEngagementRequest *)v18;

  if (!v10 || v11)
  {
    if (!v11)
    {
      AMSError(7, @"Missing dynamic ui gdpr route", 0, 0);
      uint64_t v11 = (AMSEngagementRequest *)objc_claimAutoreleasedReturnValue();
    }
    [v7 finishWithError:v11];
    id v15 = v7;
  }
  else
  {
    uint64_t v11 = objc_alloc_init(AMSEngagementRequest);
    [(AMSEngagementRequest *)v11 setSuppressInteractiveModalDismissal:1];
    [(AMSEngagementRequest *)v11 setAccount:v6];
    uint64_t v12 = [v10 absoluteURL];
    [(AMSEngagementRequest *)v11 setURL:v12];

    v19[0] = @"bundleOwner";
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithBool:v4];
    v19[1] = @"context";
    v20[0] = v13;
    v20[1] = @"auth-plugin";
    __int16 v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [(AMSEngagementRequest *)v11 setClientData:v14];

    id v15 = [(AMSDeviceAccountPrivacyAcknowledgementTask *)self _presentEngagementRequest:v11];
  }
  BOOL v16 = v15;

  return v16;
}

- (id)_presentEngagementRequest:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v7;
    __int16 v20 = 2114;
    v21 = v8;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Presenting engagement to get GDPR consent", buf, 0x16u);
  }
  uint64_t v9 = objc_opt_new();
  v10 = [[AMSSystemEngagementTask alloc] initWithRequest:v4];

  uint64_t v11 = [(AMSSystemEngagementTask *)v10 present];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__AMSDeviceAccountPrivacyAcknowledgementTask__presentEngagementRequest___block_invoke;
  v16[3] = &unk_1E55A0E60;
  v16[4] = self;
  id v12 = v9;
  id v17 = v12;
  [v11 addFinishBlock:v16];

  uint64_t v13 = v17;
  id v14 = v12;

  return v14;
}

void __72__AMSDeviceAccountPrivacyAcknowledgementTask__presentEngagementRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedAccountsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      uint64_t v9 = AMSLogableError(v4);
      int v10 = 138543874;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Task failed %{public}@", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithError:v4];
  }
  else
  {
    [*(id *)(a1 + 40) finishWithSuccess];
  }
}

+ (NSString)bagSubProfile
{
  return +[AMSURLRequestEncoder bagSubProfile];
}

+ (NSString)bagSubProfileVersion
{
  return +[AMSURLRequestEncoder bagSubProfileVersion];
}

+ (id)createBagForSubProfile
{
  return +[AMSURLRequestEncoder createBagForSubProfile];
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end