@interface AMSAnisette
+ (AMSBagKeySet)bagKeySet;
+ (BOOL)_shouldRetryAfterError:(id)a3;
+ (BOOL)handleResponse:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_eraseProvisioningForType:(int64_t)a3 account:(id)a4;
+ (id)_handleActionName:(id)a3 actionData:(id)a4 account:(id)a5 type:(int64_t)a6 bag:(id)a7;
+ (id)_headersForRequest:(id)a3 account:(id)a4 type:(int64_t)a5;
+ (id)_provisionMachineWithActionData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6;
+ (id)_syncMachineWithActionData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6;
+ (id)createBagForSubProfile;
+ (id)handleResponse:(id)a3 type:(int64_t)a4 bag:(id)a5 account:(id)a6;
+ (id)headersForRequest:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6;
+ (unint64_t)_accountIDForType:(int64_t)a3 account:(id)a4;
+ (void)_bagDomainExistsForURL:(id)a3 type:(int64_t)a4 bag:(id)a5 completion:(id)a6;
@end

@implementation AMSAnisette

+ (id)headersForRequest:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  v49[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v32 = objc_alloc_init(AMSMutablePromise);
  v13 = AMSLogKey();
  v14 = objc_alloc_init(AMSMutablePromise);
  v15 = [v10 URL];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke;
  v42[3] = &unk_1E559ED20;
  id v16 = v13;
  id v43 = v16;
  int64_t v47 = a5;
  id v48 = a1;
  id v17 = v10;
  id v44 = v17;
  id v18 = v11;
  id v45 = v18;
  v46 = v14;
  v19 = v14;
  [a1 _bagDomainExistsForURL:v15 type:1 bag:v12 completion:v42];

  v20 = objc_alloc_init(AMSMutablePromise);
  v21 = [v17 URL];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_10;
  v35[3] = &unk_1E559ED20;
  int64_t v40 = a5;
  id v41 = a1;
  id v36 = v16;
  id v37 = v17;
  id v38 = v18;
  v39 = v20;
  v22 = v20;
  id v23 = v18;
  id v24 = v17;
  id v25 = v16;
  [a1 _bagDomainExistsForURL:v21 type:2 bag:v12 completion:v35];

  v49[0] = v19;
  v49[1] = v22;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  v27 = +[AMSPromise promiseWithAll:v26];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_13;
  v33[3] = &unk_1E559ED48;
  v28 = v32;
  v34 = v28;
  [v27 addFinishBlock:v33];
  v29 = v34;
  v30 = v28;

  return v30;
}

+ (void)_bagDomainExistsForURL:(id)a3 type:(int64_t)a4 bag:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  if (a4 == 2)
  {
    id v12 = AMSBagKeyAnisetteAMDDomains;
  }
  else
  {
    if (a4 != 1)
    {
      v14 = 0;
LABEL_10:
      v11[2](v11, 0);
      goto LABEL_13;
    }
    id v12 = AMSBagKeyAnisetteMDDomains;
  }
  v13 = *v12;
  v14 = v13;
  if (!v10 || !v13) {
    goto LABEL_10;
  }
  v15 = [v10 arrayForKey:v13];
  if (v15)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__AMSAnisette__bagDomainExistsForURL_type_bag_completion___block_invoke;
    v16[3] = &unk_1E559ED70;
    id v17 = v9;
    id v18 = v11;
    [v15 valueWithCompletion:v16];
  }
  else
  {
    v11[2](v11, 0);
  }

LABEL_13:
}

+ (id)handleResponse:(id)a3 type:(int64_t)a4 bag:(id)a5 account:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = v9;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;

    if (!v13)
    {
      id v17 = 0;
      goto LABEL_12;
    }
    v14 = objc_msgSend(v13, "ams_actionNameV1");
    if (v14)
    {
      v15 = objc_msgSend(v13, "ams_actionDataV1");
      id v16 = [a1 _handleActionName:v14 actionData:v15 account:v11 type:1 bag:v10];
    }
    else
    {
      id v16 = 0;
    }
    v19 = objc_msgSend(v13, "ams_actionNameV1");
    if (v19)
    {
      v20 = objc_msgSend(v13, "ams_actionDataV1");
      uint64_t v21 = [a1 _handleActionName:v19 actionData:v20 account:v11 type:2 bag:v10];

      id v16 = (void *)v21;
    }
    id v18 = v16;

    id v17 = v18;
  }
  else
  {
    id v13 = 0;
    id v17 = 0;
    id v18 = v12;
  }

LABEL_12:
  return v17;
}

void __58__AMSAnisette__bagDomainExistsForURL_type_bag_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  if (!a4)
  {
    v7 = [*(id *)(a1 + 32) host];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v16 = a1;
      id v17 = v6;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v13, "hasPrefix:", @".", v16, v17, (void)v18))
          {
            if ([v7 hasSuffix:v13]) {
              goto LABEL_16;
            }
          }
          else if ([v13 hasPrefix:@"*"])
          {
            v14 = [v13 substringFromIndex:1];
            char v15 = [v7 hasSuffix:v14];

            if (v15) {
              goto LABEL_16;
            }
          }
          else if (![v13 caseInsensitiveCompare:v7])
          {
            goto LABEL_16;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
LABEL_16:
      a1 = v16;
      id v6 = v17;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_10(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  if ((a2 & 1) != 0 || *(void *)(a1 + 64) == 2)
  {
    v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = AMSLogKey();
      int v12 = 138543874;
      id v13 = v7;
      __int16 v14 = 2114;
      char v15 = v9;
      __int16 v16 = 1024;
      int v17 = 2;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching anisette headers for type: %d", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = [*(id *)(a1 + 72) _headersForRequest:*(void *)(a1 + 40) account:*(void *)(a1 + 48) type:2];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  [*(id *)(a1 + 56) finishWithResult:v11];
}

void __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke(uint64_t a1, char a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  if ((a2 & 1) != 0 || *(void *)(a1 + 64) == 1)
  {
    v5 = +[AMSLogConfig sharedConfig];
    if (!v5)
    {
      v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      id v8 = v7;
      uint64_t v9 = AMSLogKey();
      int v12 = 138543874;
      id v13 = v7;
      __int16 v14 = 2114;
      char v15 = v9;
      __int16 v16 = 1024;
      int v17 = 1;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Fetching anisette headers for type: %d", (uint8_t *)&v12, 0x1Cu);
    }
    uint64_t v10 = [*(id *)(a1 + 72) _headersForRequest:*(void *)(a1 + 40) account:*(void *)(a1 + 48) type:1];
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (v10) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  [*(id *)(a1 + 56) finishWithResult:v11];
}

void __50__AMSAnisette_headersForRequest_account_type_bag___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addEntriesFromDictionary:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) finishWithResult:v4];
}

+ (BOOL)handleResponse:(id)a3 account:(id)a4 type:(int64_t)a5 bag:(id)a6
{
  uint64_t v6 = [a1 handleResponse:a3 type:a5 bag:a6 account:a4];
  BOOL v7 = [v6 actionType] == 2;

  return v7;
}

+ (NSString)bagSubProfile
{
  if (_MergedGlobals_79 != -1) {
    dispatch_once(&_MergedGlobals_79, &__block_literal_global_6);
  }
  v2 = (void *)qword_1EB38D5D8;
  return (NSString *)v2;
}

void __28__AMSAnisette_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D5D8;
  qword_1EB38D5D8 = @"AMSAnisette";
}

+ (NSString)bagSubProfileVersion
{
  if (qword_1EB38D5E0 != -1) {
    dispatch_once(&qword_1EB38D5E0, &__block_literal_global_21);
  }
  v2 = (void *)qword_1EB38D5E8;
  return (NSString *)v2;
}

void __35__AMSAnisette_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D5E8;
  qword_1EB38D5E8 = @"1";
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (unint64_t)_accountIDForType:(int64_t)a3 account:(id)a4
{
  if (a3 == 2) {
    return -1;
  }
  id v5 = objc_msgSend(a4, "ams_DSID");
  unint64_t v6 = [v5 unsignedLongLongValue];

  return v6;
}

+ (id)_eraseProvisioningForType:(int64_t)a3 account:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  +[AMSAnisette _accountIDForType:a3 account:a4];
  id v5 = +[AMSLogConfig sharedAccountsConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  unint64_t v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = AMSLogKey();
    int v13 = 138543874;
    __int16 v14 = v7;
    __int16 v15 = 2114;
    __int16 v16 = v9;
    __int16 v17 = 2048;
    int64_t v18 = a3;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Erasing provisioning for type: %ld.", (uint8_t *)&v13, 0x20u);
  }
  p435tmhbla();
  if (v10)
  {
    long long v11 = 0;
  }
  else
  {
    long long v11 = +[AMSURLAction retryAction];
    [v11 setReason:@"anisette-RP"];
    [v11 setRetryIdentifier:0x1EDCA8A48];
  }
  return v11;
}

+ (id)_handleActionName:(id)a3 actionData:(id)a4 account:(id)a5 type:(int64_t)a6 bag:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  __int16 v16 = +[AMSLogConfig sharedConfig];
  if (!v16)
  {
    __int16 v16 = +[AMSLogConfig sharedConfig];
  }
  __int16 v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v15;
    id v19 = a1;
    id v20 = v13;
    int64_t v21 = a6;
    v22 = objc_opt_class();
    id v27 = v22;
    uint64_t v23 = AMSLogKey();
    *(_DWORD *)buf = 138544130;
    v29 = v22;
    a6 = v21;
    id v13 = v20;
    a1 = v19;
    id v15 = v18;
    __int16 v30 = 2114;
    v31 = v23;
    __int16 v32 = 2114;
    id v33 = v12;
    __int16 v34 = 2048;
    int64_t v35 = a6;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling anisette action name: %{public}@ type: %ld", buf, 0x2Au);
  }
  if ([v12 isEqualToString:@"SP"])
  {
    uint64_t v24 = [a1 _provisionMachineWithActionData:v13 type:a6 account:v14 bag:v15];
LABEL_11:
    id v25 = (void *)v24;
    goto LABEL_12;
  }
  if ([v12 isEqualToString:@"SM"])
  {
    uint64_t v24 = [a1 _syncMachineWithActionData:v13 type:a6 account:v14 bag:v15];
    goto LABEL_11;
  }
  if ([v12 isEqualToString:@"RP"])
  {
    uint64_t v24 = [a1 _eraseProvisioningForType:a6 account:v14];
    goto LABEL_11;
  }
  id v25 = 0;
LABEL_12:

  return v25;
}

+ (id)_headersForRequest:(id)a3 account:(id)a4 type:(int64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  unsigned int v25 = 0;
  uint64_t v24 = 0;
  unsigned int v23 = 0;
  qi864985u0(+[AMSAnisette _accountIDForType:a5 account:a4], (uint64_t)&v26, (uint64_t)&v25, (uint64_t)&v24, (uint64_t)&v23);
  if (v6)
  {
    int v7 = v6;
    id v8 = +[AMSLogConfig sharedAccountsConfig];
    if (!v8)
    {
      id v8 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      v28 = v10;
      __int16 v29 = 2114;
      __int16 v30 = v12;
      __int16 v31 = 1024;
      int v32 = a5;
      __int16 v33 = 1024;
      int v34 = v7;
      _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to generate Anisette (type: %d) headers. error = %d", buf, 0x22u);
    }
    id v13 = 0;
  }
  else
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v26)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v15 = (void *)[v14 initWithBytesNoCopy:v26 length:v25 freeWhenDone:0];
      __int16 v16 = [v15 base64EncodedStringWithOptions:0];
      if (v16)
      {
        __int16 v17 = AMSHTTPHeaderXAppleAMDM;
        if (a5 != 2) {
          __int16 v17 = AMSHTTPHeaderXAppleMDM;
        }
        [v8 setObject:v16 forKeyedSubscript:*v17];
      }
      jk24uiwqrg(v26);
    }
    if (v24)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      id v19 = (void *)[v18 initWithBytesNoCopy:v24 length:v23 freeWhenDone:0];
      id v20 = [v19 base64EncodedStringWithOptions:0];
      if (v20)
      {
        int64_t v21 = AMSHTTPHeaderXAppleAMD;
        if (a5 != 2) {
          int64_t v21 = AMSHTTPHeaderXAppleMD;
        }
        [v8 setObject:v20 forKeyedSubscript:*v21];
      }
      jk24uiwqrg(v24);
    }
    id v13 = (void *)[v8 copy];
  }

  return v13;
}

+ (id)_provisionMachineWithActionData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = 0;
  uint64_t v13 = 5;
  *(void *)&long long v14 = 138543618;
  long long v28 = v14;
  id v29 = v11;
  do
  {
    id v15 = v12;
    __int16 v16 = [[AMSAnisetteProvisionTask alloc] initWithData:v9 type:a4 account:v10 bag:v11];
    __int16 v17 = [(AMSAnisetteProvisionTask *)v16 performProvisioning];
    id v32 = v12;
    int v18 = [v17 resultWithError:&v32];
    id v12 = v32;

    if (v18)
    {

      uint64_t v26 = +[AMSURLAction retryAction];
      [v26 setReason:@"anisette-SP"];
      [v26 setRetryIdentifier:0x1EDCA8A68];
      goto LABEL_12;
    }
    if (![a1 _shouldRetryAfterError:v12])
    {

      if (!v12) {
        goto LABEL_14;
      }
LABEL_10:
      uint64_t v26 = +[AMSURLAction actionWithError:](AMSURLAction, "actionWithError:", v12, v28);
LABEL_12:

      goto LABEL_15;
    }
    id v19 = +[AMSLogConfig sharedAccountsConfig];
    if (!v19)
    {
      id v19 = +[AMSLogConfig sharedConfig];
    }
    id v20 = objc_msgSend(v19, "OSLogObject", v28);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      int64_t v21 = a4;
      id v22 = v9;
      unsigned int v23 = objc_opt_class();
      id v30 = v23;
      AMSLogKey();
      v25 = id v24 = v10;
      *(_DWORD *)buf = v28;
      int v34 = v23;
      id v9 = v22;
      a4 = v21;
      __int16 v35 = 2114;
      uint64_t v36 = v25;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Retrying machine data proivsioning", buf, 0x16u);

      id v10 = v24;
      id v11 = v29;
    }
    --v13;
  }
  while (v13);
  if (v12) {
    goto LABEL_10;
  }
LABEL_14:
  uint64_t v26 = 0;
LABEL_15:

  return v26;
}

+ (id)_syncMachineWithActionData:(id)a3 type:(int64_t)a4 account:(id)a5 bag:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v29 = a5;
  id v28 = a6;
  id v10 = 0;
  uint64_t v11 = 5;
  p_base_prots = &ExpressCheckoutCard.base_prots;
  *(void *)&long long v13 = 138543618;
  long long v25 = v13;
  int64_t v26 = a4;
  while (1)
  {

    long long v14 = (void *)[objc_alloc((Class)(p_base_prots + 126)) initWithData:v30 type:a4 account:v29 bag:v28];
    id v15 = [v14 performSync];
    id v31 = 0;
    char v16 = [v15 resultWithError:&v31];
    id v10 = v31;

    if (v16)
    {

      unsigned int v23 = +[AMSURLAction retryAction];
      [v23 setReason:@"anisette-SM"];
      [v23 setRetryIdentifier:0x1EDCA8A88];
      goto LABEL_13;
    }
    if (![a1 _shouldRetryAfterError:v10]) {
      break;
    }
    __int16 v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      __int16 v17 = +[AMSLogConfig sharedConfig];
    }
    int v18 = objc_msgSend(v17, "OSLogObject", v25);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v19 = p_base_prots;
      id v20 = a1;
      int64_t v21 = objc_opt_class();
      id v27 = v21;
      id v22 = AMSLogKey();
      *(_DWORD *)buf = v25;
      __int16 v33 = v21;
      a1 = v20;
      p_base_prots = v19;
      __int16 v34 = 2114;
      __int16 v35 = v22;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Retrying machine data sync", buf, 0x16u);

      a4 = v26;
    }

    if (!--v11) {
      goto LABEL_12;
    }
  }

LABEL_12:
  unsigned int v23 = 0;
LABEL_13:

  return v23;
}

+ (BOOL)_shouldRetryAfterError:(id)a3
{
  id v3 = [a3 domain];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F289A0]];

  return v4;
}

+ (AMSBagKeySet)bagKeySet
{
  v2 = objc_alloc_init(AMSBagKeySet);
  return v2;
}

@end