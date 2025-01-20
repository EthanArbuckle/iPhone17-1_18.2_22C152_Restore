@interface AMSBiometrics
+ (BOOL)_deleteKeysWithOptions:(id)a3 error:(id *)a4;
+ (BOOL)_shouldAddBiometricHeader;
+ (BOOL)deleteAllKeysWithError:(id *)a3;
+ (BOOL)deleteKeysWithError:(id *)a3;
+ (BOOL)hasKeysForAccount:(id)a3 forSignaturePurpose:(unint64_t)a4 withError:(id *)a5;
+ (BOOL)isActionSupported:(int64_t)a3 withAccessControl:(__SecAccessControl *)a4;
+ (BOOL)isActionSupported:(int64_t)a3 withConstraints:(id)a4;
+ (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6;
+ (BOOL)isAvailableForAccount:(id)a3;
+ (BOOL)isDeviceInBiometricLockout;
+ (BOOL)isIdentityMapValid;
+ (BOOL)proxyDeleteAllKeysWithError:(id *)a3;
+ (NSArray)identityMap;
+ (id)ACLVersionForAccessControl:(__SecAccessControl *)a3;
+ (id)ACLVersionForAccount:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)ACLVersionForConstraints:(id)a3;
+ (id)_stateHeaderValueForAccount:(id)a3;
+ (id)disableForAccount:(id)a3;
+ (id)handleResponse:(id)a3 financeResponse:(id)a4 session:(id)a5 taskInfo:(id)a6;
+ (id)headersWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5;
+ (id)minimumACLVersionForAction:(int64_t)a3;
+ (id)resumptionHeadersFromRequest:(id)a3;
+ (id)setState:(int64_t)a3 forAccount:(id)a4;
+ (id)signAndReturnChallenge:(id)a3 withAccount:(id)a4 clientInfo:(id)a5 options:(id)a6;
+ (id)signChallenge:(id)a3 withAccount:(id)a4 clientInfo:(id)a5 options:(id)a6;
+ (int64_t)deviceState;
+ (int64_t)stateForAccount:(id)a3;
+ (int64_t)type;
+ (void)saveIdentityMap;
+ (void)setDeviceState:(int64_t)a3;
@end

@implementation AMSBiometrics

+ (id)handleResponse:(id)a3 financeResponse:(id)a4 session:(id)a5 taskInfo:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = [v11 properties];
  int v13 = [v12 disableBiometricsResponseHandling];

  if (v13)
  {
    v14 = +[AMSURLAction proceedAction];
    v15 = +[AMSPromise promiseWithResult:v14];
    goto LABEL_25;
  }
  v16 = [v11 properties];
  v17 = [v16 logUUID];
  id v18 = AMSSetLogKey(v17);

  v14 = +[AMSBinaryPromise promiseWithSuccess];
  v19 = objc_msgSend(v9, "ams_valueForHTTPHeaderField:", @"X-Apple-TID-Action");
  if (v19)
  {
    id v50 = a1;
    v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v48 = v10;
      v22 = AMSLogKey();
      v23 = NSString;
      uint64_t v24 = objc_opt_class();
      uint64_t v25 = v24;
      if (v22)
      {
        v17 = AMSLogKey();
        [v23 stringWithFormat:@"%@: [%@] ", v25, v17];
      }
      else
      {
        [v23 stringWithFormat:@"%@: ", v24];
      v26 = };
      *(_DWORD *)buf = 138543618;
      v57 = v26;
      __int16 v58 = 2114;
      v59 = v19;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Received touch ID action: %{public}@", buf, 0x16u);
      if (v22)
      {

        v26 = v17;
      }

      id v10 = v48;
    }

    if ([v19 isEqualToString:@"RP"])
    {
      v27 = [AMSBiometricsTokenUpdateTask alloc];
      v28 = [v11 properties];
      v29 = [v28 account];
      v30 = [(AMSBiometricsTokenUpdateTask *)v27 initWithAccount:v29];

      uint64_t v31 = [(AMSBiometricsTokenUpdateTask *)v30 performUpdate];
      v32 = v14;
LABEL_22:

      v14 = (AMSBiometricsTokenUpdateTask *)v31;
      goto LABEL_23;
    }
    if (![v19 isEqualToString:@"EP"])
    {
LABEL_23:
      a1 = v50;
      goto LABEL_24;
    }
    v33 = [AMSBiometricsPresentationProxy alloc];
    v34 = [v11 task];
    id v49 = v10;
    v30 = [(AMSBiometricsPresentationProxy *)v33 initWithSession:v10 task:v34];

    v35 = [AMSBiometricsTokenUpdateTask alloc];
    v36 = [v11 properties];
    v37 = [v36 account];
    v32 = [(AMSBiometricsTokenUpdateTask *)v35 initWithAccount:v37];

    [(AMSBiometricsTokenUpdateTask *)v32 setPresentationDelegate:v30];
    [(AMSBiometricsTokenUpdateTask *)v32 setShouldRequestConfirmation:1];
    id v47 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v38 = [v11 properties];
    v39 = [v38 purchaseInfo];
    v40 = [v39 buyParams];
    v41 = [v40 parameterForKey:@"mtTopic"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = v41;

      if (v42)
      {
        v43 = v47;
        [v47 setObject:v42 forKeyedSubscript:@"topic"];
        id v10 = v49;
LABEL_21:
        [(AMSBiometricsTokenUpdateTask *)v32 setAdditionalDialogMetrics:v43];
        uint64_t v31 = [(AMSBiometricsTokenUpdateTask *)v32 performUpdate];

        goto LABEL_22;
      }
    }
    else
    {

      id v42 = 0;
    }
    v43 = v47;
    id v10 = v49;
    goto LABEL_21;
  }
LABEL_24:
  v44 = [(AMSBiometricsTokenUpdateTask *)v14 promiseAdapter];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __65__AMSBiometrics_handleResponse_financeResponse_session_taskInfo___block_invoke;
  v51[3] = &unk_1E55A0538;
  id v52 = v9;
  id v53 = v19;
  id v54 = v11;
  id v55 = a1;
  id v45 = v19;
  v15 = [v44 continueWithBlock:v51];

LABEL_25:
  return v15;
}

id __65__AMSBiometrics_handleResponse_financeResponse_session_taskInfo___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSURLAction proceedAction];
  v3 = objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", @"X-Apple-TID-Challenge");
  v4 = objc_msgSend(*(id *)(a1 + 32), "ams_valueForHTTPHeaderField:", @"X-Apple-TID-Pkeyid");
  int v5 = [v4 isEqualToString:@"EXT"];
  if (*(void *)(a1 + 40) || (v3 ? (BOOL v6 = v5 == 0) : (BOOL v6 = 1), v6))
  {
    v17 = +[AMSPromise promiseWithResult:v2];
  }
  else
  {
    v7 = [*(id *)(a1 + 48) properties];
    v8 = [v7 keychainOptions];
    id v9 = (void *)[v8 copy];

    [v9 setPurpose:1];
    id v10 = +[AMSLogConfig sharedBiometricsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = AMSLogKey();
      int v13 = NSString;
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = v14;
      if (v12)
      {
        uint64_t v26 = AMSLogKey();
        [v13 stringWithFormat:@"%@: [%@] ", v15, v26];
      }
      else
      {
        [v13 stringWithFormat:@"%@: ", v14];
      v16 = };
      id v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v9, "purpose"));
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      __int16 v33 = 2114;
      v34 = v18;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_DEBUG, "%{public}@Signing challenge: %{public}@", buf, 0x16u);

      if (v12)
      {

        v16 = (void *)v26;
      }
    }
    v19 = *(void **)(a1 + 56);
    v20 = [*(id *)(a1 + 48) properties];
    v21 = [v20 account];
    v22 = [*(id *)(a1 + 48) properties];
    v23 = [v22 clientInfo];
    uint64_t v24 = [v19 signAndReturnChallenge:v3 withAccount:v21 clientInfo:v23 options:v9];

    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__AMSBiometrics_handleResponse_financeResponse_session_taskInfo___block_invoke_107;
    v27[3] = &unk_1E55A0510;
    uint64_t v30 = *(void *)(a1 + 56);
    id v28 = v3;
    id v29 = *(id *)(a1 + 48);
    v17 = [v24 continueWithBlock:v27];
  }
  return v17;
}

+ (int64_t)deviceState
{
  unint64_t v2 = [a1 type];
  if (v2 <= 7
    && ((1 << v2) & 0x8C) != 0
    && +[AMSDefaults deviceBiometricsState] != 2)
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

+ (NSArray)identityMap
{
  if (+[AMSDevice deviceIsAudioAccessory])
  {
    unint64_t v2 = 0;
  }
  else
  {
    v3 = [getBiometricKitClass() manager];
    unint64_t v2 = [v3 identities:0];
  }
  v4 = (void *)[v2 copy];

  return (NSArray *)v4;
}

+ (BOOL)isIdentityMapValid
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = AMSSetLogKeyIfNeeded();
  if (!+[AMSDevice deviceIsAudioAccessory])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v5 = +[AMSDefaults deviceBiometricIdentities];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __35__AMSBiometrics_isIdentityMapValid__block_invoke;
    v31[3] = &unk_1E55A04C0;
    id v34 = a1;
    id v9 = v3;
    id v32 = v9;
    id v4 = v8;
    id v33 = v4;
    [v5 enumerateObjectsUsingBlock:v31];
    if ([v4 count])
    {
      id v10 = +[AMSBiometrics identityMap];
      uint64_t v11 = [v4 count];
      if (v11 == [v10 count])
      {
        v23 = v5;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id obj = v4;
        uint64_t v12 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = 0;
          uint64_t v15 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v28 != v15) {
                objc_enumerationMutation(obj);
              }
              v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) uuid];
              v25[0] = MEMORY[0x1E4F143A8];
              v25[1] = 3221225472;
              v25[2] = __35__AMSBiometrics_isIdentityMapValid__block_invoke_74;
              v25[3] = &unk_1E55A04E8;
              id v26 = v17;
              id v18 = v17;
              if ([v10 indexOfObjectPassingTest:v25] != 0x7FFFFFFFFFFFFFFFLL) {
                ++v14;
              }
            }
            uint64_t v13 = [obj countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v13);
        }
        else
        {
          uint64_t v14 = 0;
        }

        BOOL v7 = v14 == [v10 count];
        int v5 = v23;
        goto LABEL_27;
      }
    }
    else
    {
      id v10 = +[AMSLogConfig sharedConfig];
      if (!v10)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      v19 = [v10 OSLogObject];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        id v36 = v20;
        __int16 v37 = 2114;
        id v38 = v9;
        id v21 = v20;
        _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping identity map check for no cached identities", buf, 0x16u);
      }
    }
    BOOL v7 = 0;
LABEL_27:

    goto LABEL_28;
  }
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  int v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v36 = (id)objc_opt_class();
    __int16 v37 = 2114;
    id v38 = v3;
    id v6 = v36;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping identity map check for audio accessory", buf, 0x16u);
  }
  BOOL v7 = 0;
LABEL_28:

  return v7;
}

void __35__AMSBiometrics_isIdentityMapValid__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v12 = 0;
    int v5 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:getBiometricKitIdentityClass() fromData:v4 error:&v12];
    id v6 = v12;
    if (v6)
    {
      BOOL v7 = +[AMSLogConfig sharedConfig];
      if (!v7)
      {
        BOOL v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = objc_opt_class();
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = v9;
        __int16 v15 = 2114;
        uint64_t v16 = v10;
        __int16 v17 = 2114;
        id v18 = v6;
        id v11 = v9;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to serialize biometric identity with error: %{public}@", buf, 0x20u);
      }
    }
    else
    {
      getBiometricKitIdentityClass();
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [*(id *)(a1 + 40) addObject:v5];
      }
    }
  }
}

uint64_t __35__AMSBiometrics_isIdentityMapValid__block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

+ (int64_t)type
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = MGCopyAnswerWithError();
  id v3 = (const void *)v2;
  uint64_t v4 = (const void *)*MEMORY[0x1E4F1CFD0];
  if (v2 != *MEMORY[0x1E4F1CFD0])
  {
    int v5 = (const void *)MGCopyAnswerWithError();
    if (v5 == v4) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
    if (v5)
    {
      CFRelease(v5);
      if (!v3) {
        goto LABEL_15;
      }
    }
    else
    {
      BOOL v7 = +[AMSLogConfig sharedConfig];
      if (!v7)
      {
        BOOL v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v9;
        __int16 v18 = 2114;
        uint64_t v19 = v10;
        __int16 v20 = 1026;
        int v21 = 0;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain touch identifier capability: %{public}d", buf, 0x1Cu);
      }
      if (!v3) {
        goto LABEL_15;
      }
    }
LABEL_9:
    CFRelease(v3);
    return v6;
  }
  int64_t v6 = 3;
  if (v2) {
    goto LABEL_9;
  }
LABEL_15:
  id v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    id v11 = +[AMSLogConfig sharedConfig];
  }
  id v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = AMSSetLogKeyIfNeeded();
    *(_DWORD *)buf = 138543874;
    uint64_t v17 = v13;
    __int16 v18 = 2114;
    uint64_t v19 = v14;
    __int16 v20 = 1026;
    int v21 = 0;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to obtain pearl identifier capability: %{public}d", buf, 0x1Cu);
  }
  return v6;
}

+ (void)setDeviceState:(int64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v23 = AMSSetLogKey(0);
  +[AMSDefaults setDeviceBiometricsState:a3];
  if (a3 == 2)
  {
    id v30 = 0;
    [a1 deleteKeysWithError:&v30];
    id v4 = v30;
    if (v4)
    {
      int v5 = +[AMSLogConfig sharedAttestationConfig];
      if (!v5)
      {
        int v5 = +[AMSLogConfig sharedConfig];
      }
      int64_t v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = objc_opt_class();
        *(_DWORD *)buf = 138543874;
        uint64_t v34 = v7;
        __int16 v35 = 2114;
        id v36 = v23;
        __int16 v37 = 2114;
        id v38 = v4;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting biometrics keys: %{public}@", buf, 0x20u);
      }
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v31[0] = AMSAccountMediaTypeAppStore;
  v31[1] = AMSAccountMediaTypeBooks;
  v31[2] = AMSAccountMediaTypeiTunes;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v27;
    *(void *)&long long v11 = 138543874;
    long long v22 = v11;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        __int16 v15 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStoreForMediaType:", *(void *)(*((void *)&v26 + 1) + 8 * v14), v22);
        uint64_t v16 = objc_msgSend(v15, "ams_activeiTunesAccount");

        if (v16 && ([v8 containsObject:v16] & 1) == 0)
        {
          [v8 addObject:v16];
          uint64_t v17 = [a1 setState:0 forAccount:v16];
          id v25 = 0;
          [v17 resultWithError:&v25];
          id v18 = v25;

          if (v18)
          {
            uint64_t v19 = +[AMSLogConfig sharedAttestationConfig];
            if (!v19)
            {
              uint64_t v19 = +[AMSLogConfig sharedConfig];
            }
            __int16 v20 = [v19 OSLogObject];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              uint64_t v21 = objc_opt_class();
              *(_DWORD *)buf = v22;
              uint64_t v34 = v21;
              __int16 v35 = 2114;
              id v36 = v23;
              __int16 v37 = 2114;
              id v38 = v18;
              _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error unsetting biometrics state: %{public}@", buf, 0x20u);
            }
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v12);
  }
}

+ (id)ACLVersionForAccessControl:(__SecAccessControl *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    CFRetain(a3);
    int v5 = SecAccessControlGetConstraints();
    int64_t v6 = [a1 ACLVersionForConstraints:v5];
    CFRelease(a3);
  }
  else
  {
    uint64_t v7 = +[AMSLogConfig sharedConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = v9;
      long long v11 = AMSSetLogKeyIfNeeded();
      int v13 = 138543618;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] ACL version evaluation failed for no ACL", (uint8_t *)&v13, 0x16u);
    }
    int64_t v6 = 0;
  }
  return v6;
}

+ (id)ACLVersionForAccount:(id)a3 options:(id)a4 error:(id *)a5
{
  int64_t v6 = +[AMSKeychain copyAccessControlRefWithAccount:a3 options:a4 error:a5];
  return (id)[a1 ACLVersionForAccessControl:v6];
}

+ (id)ACLVersionForConstraints:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 isActionSupported:7 withConstraints:v4])
  {
    id v5 = a1;
    uint64_t v6 = 7;
LABEL_13:
    uint64_t v7 = [v5 minimumACLVersionForAction:v6];
    goto LABEL_14;
  }
  if ([a1 isActionSupported:6 withConstraints:v4])
  {
    id v5 = a1;
    uint64_t v6 = 6;
    goto LABEL_13;
  }
  if ([a1 isActionSupported:5 withConstraints:v4])
  {
    id v5 = a1;
    uint64_t v6 = 5;
    goto LABEL_13;
  }
  if ([a1 isActionSupported:3 withConstraints:v4])
  {
    id v5 = a1;
    uint64_t v6 = 3;
    goto LABEL_13;
  }
  if ([a1 isActionSupported:1 withConstraints:v4])
  {
    id v5 = a1;
    uint64_t v6 = 1;
    goto LABEL_13;
  }
  if ([a1 isActionSupported:0 withConstraints:v4])
  {
    id v5 = a1;
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = +[AMSLogConfig sharedConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    long long v11 = objc_opt_class();
    id v12 = v11;
    int v13 = AMSSetLogKeyIfNeeded();
    int v14 = 138543618;
    __int16 v15 = v11;
    __int16 v16 = 2114;
    uint64_t v17 = v13;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine version for ACL", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v7 = 0;
LABEL_14:

  return v7;
}

+ (id)disableForAccount:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v12 = 0;
  +[AMSBiometrics deleteKeysWithError:&v12];
  id v5 = v12;
  if (v5)
  {
    uint64_t v6 = +[AMSLogConfig sharedAttestationConfig];
    if (!v6)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v8;
      __int16 v15 = 2114;
      __int16 v16 = v9;
      __int16 v17 = 2114;
      id v18 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting biometrics keys: %{public}@", buf, 0x20u);
    }
  }
  id v10 = [a1 setState:2 forAccount:v4];

  return v10;
}

+ (BOOL)hasKeysForAccount:(id)a3 forSignaturePurpose:(unint64_t)a4 withError:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v8 setPurpose:a4];
  [(AMSKeychainOptions *)v8 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  unint64_t v9 = [(AMSKeychainOptions *)v8 style];
  if (v9 > 5)
  {
    id v13 = 0;
    goto LABEL_11;
  }
  if (((1 << v9) & 0x39) != 0)
  {
    uint64_t v19 = 0;
    id v10 = (id *)&v19;
    long long v11 = +[AMSKeychain copyCertificatePrivateKeyWithContext:0 account:v7 options:v8 error:&v19];
  }
  else
  {
    uint64_t v18 = 0;
    id v10 = (id *)&v18;
    long long v11 = +[AMSKeychain copyPrivateKeyWithContext:0 account:v7 options:v8 error:&v18];
  }
  id v12 = v11;
  id v13 = *v10;
  if (!v12)
  {
LABEL_11:
    if (a5)
    {
      __int16 v16 = @"There was no private key for account";
      goto LABEL_13;
    }
LABEL_14:
    BOOL v15 = 0;
    goto LABEL_15;
  }
  SecKeyRef v14 = SecKeyCopyPublicKey(v12);
  CFRelease(v12);
  if (!v14)
  {
    if (a5)
    {
      __int16 v16 = @"There was no public key for account";
LABEL_13:
      AMSError(7, v16, 0, v13);
      BOOL v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  CFRelease(v14);
  BOOL v15 = 1;
LABEL_15:

  return v15;
}

+ (BOOL)isDeviceInBiometricLockout
{
  uint64_t v2 = [getBiometricKitClass() manager];
  BOOL v3 = [v2 getBioLockoutState] != 0;

  return v3;
}

+ (BOOL)deleteKeysWithError:(id *)a3
{
  if (AMSIsEntitledForDirectKeychainAccess())
  {
    return +[AMSBiometrics deleteAllKeysWithError:a3];
  }
  else
  {
    return +[AMSBiometrics proxyDeleteAllKeysWithError:a3];
  }
}

+ (BOOL)deleteAllKeysWithError:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = AMSSetLogKey(0);
  uint64_t v6 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v6 setPurpose:0];
  [(AMSKeychainOptions *)v6 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  id v19 = 0;
  [a1 _deleteKeysWithOptions:v6 error:&v19];
  id v7 = v19;
  BOOL v8 = v7 == 0;
  if (v7)
  {
    unint64_t v9 = +[AMSLogConfig sharedAttestationConfig];
    if (!v9)
    {
      unint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v11;
      __int16 v22 = 2114;
      v23 = v5;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting primary keys: %{public}@", buf, 0x20u);
    }
  }
  id v12 = objc_alloc_init(AMSKeychainOptions);
  [(AMSKeychainOptions *)v12 setPurpose:1];
  [(AMSKeychainOptions *)v12 setStyle:+[AMSKeychainOptions preferredAttestationStyle]];
  id v18 = v7;
  [a1 _deleteKeysWithOptions:v12 error:&v18];
  id v13 = v18;

  if (v13)
  {
    SecKeyRef v14 = +[AMSLogConfig sharedAttestationConfig];
    if (!v14)
    {
      SecKeyRef v14 = +[AMSLogConfig sharedConfig];
    }
    BOOL v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      uint64_t v21 = v16;
      __int16 v22 = 2114;
      v23 = v5;
      __int16 v24 = 2114;
      id v25 = v13;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting extended keys: %{public}@", buf, 0x20u);
    }

    BOOL v8 = 0;
  }
  if (a3) {
    *a3 = v13;
  }

  return v8;
}

id __65__AMSBiometrics_handleResponse_financeResponse_session_taskInfo___block_invoke_107(uint64_t a1, void *a2, void *a3)
{
  v45[4] = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = +[AMSLogConfig sharedConfig];
  unint64_t v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      unint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = AMSLogKey();
      id v12 = NSString;
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = v13;
      if (v11)
      {
        uint64_t v3 = AMSLogKey();
        [v12 stringWithFormat:@"%@: [%@] ", v14, v3];
      }
      else
      {
        [v12 stringWithFormat:@"%@: ", v13];
      BOOL v15 = };
      *(_DWORD *)buf = 138543362;
      v41 = v15;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully signed extended action.", buf, 0xCu);
      if (v11)
      {

        BOOL v15 = (void *)v3;
      }
    }
    __int16 v22 = +[AMSURLAction retryAction];
    [v22 setReason:@"extended biometrics"];
    [v22 setRetryIdentifier:0x1EDCC3B28];
    v23 = [v6 publicKey];
    __int16 v24 = [v23 base64EncodedStringWithOptions:0];

    uint64_t v25 = *(void *)(a1 + 32);
    v44[0] = @"X-Apple-TID-Challenge";
    v44[1] = @"X-Apple-TID-Pkey";
    v45[0] = v25;
    v45[1] = v24;
    v44[2] = @"X-Apple-TID-Signature";
    uint64_t v26 = [v6 signature];
    v44[3] = @"X-Apple-TID-SignatureVersion";
    v45[2] = v26;
    v45[3] = @"1";
    long long v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:4];
    [v22 setUpdatedHeaders:v27];
  }
  else
  {
    if (!v8)
    {
      unint64_t v9 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v16 = [v9 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = AMSLogKey();
      id v18 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = v19;
      if (v17)
      {
        uint64_t v3 = AMSLogKey();
        [v18 stringWithFormat:@"%@: [%@] ", v20, v3];
      }
      else
      {
        [v18 stringWithFormat:@"%@: ", v19];
      uint64_t v21 = };
      *(_DWORD *)buf = 138543618;
      v41 = v21;
      __int16 v42 = 2114;
      id v43 = v7;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@Biometrics signature failed. Error: %{public}@", buf, 0x16u);
      if (v17)
      {

        uint64_t v21 = (void *)v3;
      }
    }
    if ([v7 code] == 6)
    {
      __int16 v22 = +[AMSURLAction actionWithError:v7];
      [*(id *)(a1 + 40) setError:v7];
    }
    else
    {
      long long v28 = +[AMSLogConfig sharedConfig];
      if (!v28)
      {
        long long v28 = +[AMSLogConfig sharedConfig];
      }
      long long v29 = [v28 OSLogObject];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = AMSLogKey();
        uint64_t v31 = NSString;
        uint64_t v32 = objc_opt_class();
        uint64_t v33 = v32;
        if (v30)
        {
          a1 = AMSLogKey();
          [v31 stringWithFormat:@"%@: [%@] ", v33, a1];
        }
        else
        {
          [v31 stringWithFormat:@"%@: ", v32];
        uint64_t v34 = };
        *(_DWORD *)buf = 138543362;
        v41 = v34;
        _os_log_impl(&dword_18D554000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@Falling back to password.", buf, 0xCu);
        if (v30)
        {

          uint64_t v34 = (void *)a1;
        }
      }
      __int16 v22 = +[AMSURLAction retryAction];
      [v22 setReason:@"extended biometric fallback"];
      [v22 setRetryIdentifier:0x1EDCC3B28];
      id v38 = @"X-Apple-TID-Action";
      uint64_t v39 = @"FB";
      __int16 v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      [v22 setUpdatedHeaders:v35];
    }
  }
  id v36 = +[AMSPromise promiseWithResult:v22];

  return v36;
}

+ (id)headersWithAccount:(id)a3 options:(id)a4 signatureResult:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v10 || ![v9 purpose] || objc_msgSend(v9, "purpose") == 1)
  {
    if (AMSIsEntitledForDirectKeychainAccess())
    {
      uint64_t v24 = 0;
      id v12 = +[AMSKeychain copyPublicKeyForAccount:v8 options:v9 error:&v24];
      if (v12)
      {
        uint64_t v13 = v12;
        CFErrorRef v23 = 0;
        CFDataRef v14 = SecKeyCopyExternalRepresentation(v12, &v23);
        CFRelease(v13);
        CFErrorRef v15 = v23;
        uint64_t v16 = [(__CFData *)v14 base64EncodedStringWithOptions:0];
        [v11 setObject:v16 forKeyedSubscript:@"X-Apple-TID-Pkey"];
      }
      else
      {
        CFErrorRef v15 = 0;
      }
    }
    else
    {
      __int16 v17 = +[AMSKeychain publicKeyHeaderWithAccount:v8 options:v9 signatureResult:v10];
      if (v17) {
        [v11 addEntriesFromDictionary:v17];
      }
    }
    [v11 setObject:@"1" forKeyedSubscript:@"X-Apple-TID-SignatureVersion"];
  }
  id v18 = [a1 _stateHeaderValueForAccount:v8];
  if (v18) {
    [v11 setObject:v18 forKeyedSubscript:@"X-Apple-TID-State"];
  }
  uint64_t v19 = [v10 originalRequest];
  uint64_t v20 = [v19 challenge];

  if (v20) {
    [v11 setObject:v20 forKeyedSubscript:@"X-Apple-TID-Challenge"];
  }
  if (v10)
  {
    uint64_t v21 = [v10 signature];
    if (v21)
    {
      [v11 setObject:v21 forKeyedSubscript:@"X-Apple-TID-Signature"];
      [v11 setObject:@"1" forKeyedSubscript:@"X-Apple-TID-SignatureVersion"];
    }
  }
  return v11;
}

+ (BOOL)isActionSupported:(int64_t)a3 withAccessControl:(__SecAccessControl *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    int64_t v6 = a3;
    CFRetain(a4);
    id v7 = SecAccessControlGetConstraints();
    LOBYTE(v6) = [a1 isActionSupported:v6 withConstraints:v7];
    CFRelease(a4);

    return v6;
  }
  else
  {
    id v9 = +[AMSLogConfig sharedConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v11 = objc_opt_class();
      id v12 = v11;
      uint64_t v13 = AMSSetLogKeyIfNeeded();
      int v14 = 138543618;
      CFErrorRef v15 = v11;
      __int16 v16 = 2114;
      __int16 v17 = v13;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] LocalAuth action evaluation failed for no ACL", (uint8_t *)&v14, 0x16u);
    }
    return 0;
  }
}

+ (BOOL)isActionSupported:(int64_t)a3 withConstraints:(id)a4
{
  uint64_t v167 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = +[AMSLogConfig sharedConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    id v11 = AMSSetLogKeyIfNeeded();
    id v12 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    *(_DWORD *)buf = 138543874;
    v160 = v9;
    __int16 v161 = 2114;
    v162 = v11;
    __int16 v163 = 2114;
    v164 = v12;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluating ACL constraints for LocalAuth action: %{public}@", buf, 0x20u);
  }
  switch(a3)
  {
    case 0:
      int v14 = [v6 objectForKeyedSubscript:@"oa"];
      id v30 = [v6 objectForKeyedSubscript:@"odel"];
      uint64_t v31 = [v6 objectForKeyedSubscript:@"ock"];
      id v18 = [v31 objectForKeyedSubscript:@"cbio"];

      uint64_t v32 = [v6 objectForKeyedSubscript:@"osgn"];
      uint64_t v20 = [v32 objectForKeyedSubscript:@"cbio"];

      if (objc_opt_respondsToSelector()) {
        int v33 = [v14 BOOLValue] ^ 1;
      }
      else {
        int v33 = 1;
      }
      if (objc_opt_respondsToSelector()) {
        int v89 = [v30 BOOLValue] ^ 1;
      }
      else {
        int v89 = 1;
      }
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v98 = [v18 objectForKey:@"pbiot"];
        BOOL v99 = (objc_opt_respondsToSelector() & 1) == 0 || [v98 integerValue] == 1;
      }
      else
      {
        BOOL v99 = 0;
      }
      objc_opt_class();
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v123 = [v18 objectForKey:@"pbiot"];
        BOOL v124 = (objc_opt_respondsToSelector() & 1) == 0 || [v123 integerValue] == 1;
      }
      else
      {
        BOOL v124 = 0;
      }
      if ((v33 | v89)) {
        goto LABEL_172;
      }
      LOBYTE(v47) = v99 && v124;
      goto LABEL_173;
    case 1:
      if (![a1 isActionSupported:0 withConstraints:v6]) {
        goto LABEL_20;
      }
      uint64_t v34 = [v6 objectForKeyedSubscript:@"ock"];
      __int16 v35 = [v34 objectForKeyedSubscript:@"ckon"];
      id v36 = [v35 objectForKeyedSubscript:@"cbtn"];

      __int16 v37 = [v6 objectForKeyedSubscript:@"ock"];
      id v38 = [v37 objectForKeyedSubscript:@"ckon"];
      uint64_t v39 = [v38 objectForKeyedSubscript:@"cbio"];
      uint64_t v40 = [v39 objectForKeyedSubscript:@"pbiot"];

      v41 = [v6 objectForKeyedSubscript:@"osgn"];
      __int16 v42 = [v41 objectForKeyedSubscript:@"ckon"];
      id v18 = [v42 objectForKeyedSubscript:@"cbtn"];

      int v14 = v36;
      id v43 = [v6 objectForKeyedSubscript:@"osgn"];
      v44 = [v43 objectForKeyedSubscript:@"ckon"];
      id v45 = [v44 objectForKeyedSubscript:@"cbio"];
      uint64_t v20 = [v45 objectForKeyedSubscript:@"pbiot"];

      if (objc_opt_respondsToSelector()) {
        int v46 = [v36 BOOLValue] ^ 1;
      }
      else {
        int v46 = 1;
      }
      id v30 = v40;
      BOOL v122 = (objc_opt_respondsToSelector() & 1) == 0 || [v40 integerValue] != 2;
      if (objc_opt_respondsToSelector()) {
        char v142 = [v18 BOOLValue];
      }
      else {
        char v142 = 0;
      }
      BOOL v143 = (objc_opt_respondsToSelector() & 1) != 0 && [v20 integerValue] == 2;
      if ((v46 | v122)) {
LABEL_172:
      }
        LOBYTE(v47) = 0;
      else {
        LOBYTE(v47) = v142 & v143;
      }
      goto LABEL_173;
    case 2:
      id v48 = [v6 objectForKeyedSubscript:@"ock"];
      int v14 = [v48 objectForKeyedSubscript:@"pmuc"];

      id v49 = [v6 objectForKeyedSubscript:@"ock"];
      id v50 = [v49 objectForKeyedSubscript:@"ckon"];
      id v30 = [v50 objectForKeyedSubscript:@"pmuc"];

      v51 = [v6 objectForKeyedSubscript:@"osgn"];
      id v18 = [v51 objectForKeyedSubscript:@"pmuc"];

      id v52 = [v6 objectForKeyedSubscript:@"osgn"];
      id v53 = [v52 objectForKeyedSubscript:@"ckon"];
      uint64_t v20 = [v53 objectForKeyedSubscript:@"pmuc"];

      BOOL v54 = (objc_opt_respondsToSelector() & 1) == 0 || [v14 integerValue] != 1;
      BOOL v90 = (objc_opt_respondsToSelector() & 1) == 0 || [v30 integerValue] != 1;
      BOOL v100 = (objc_opt_respondsToSelector() & 1) != 0 && [v18 integerValue] == 1;
      BOOL v120 = (objc_opt_respondsToSelector() & 1) != 0 && [v20 integerValue] == 1;
      if (v54 || v90) {
        goto LABEL_172;
      }
      LOBYTE(v47) = v100 && v120;
      goto LABEL_173;
    case 3:
    case 4:
      if (![a1 isActionSupported:1 withConstraints:v6])
      {
LABEL_20:
        LOBYTE(v47) = 0;
        goto LABEL_177;
      }
      uint64_t v13 = [v6 objectForKeyedSubscript:@"ock"];
      int v14 = [v13 objectForKeyedSubscript:@"pmuc"];

      CFErrorRef v15 = [v6 objectForKeyedSubscript:@"ock"];
      __int16 v16 = [v15 objectForKeyedSubscript:@"ckon"];
      v156 = [v16 objectForKeyedSubscript:@"pmuc"];

      __int16 v17 = [v6 objectForKeyedSubscript:@"osgn"];
      id v18 = [v17 objectForKeyedSubscript:@"pmoc"];

      uint64_t v19 = [v6 objectForKeyedSubscript:@"osgn"];
      uint64_t v20 = [v19 objectForKeyedSubscript:@"pmuc"];

      uint64_t v21 = [v6 objectForKeyedSubscript:@"osgn"];
      __int16 v22 = [v21 objectForKeyedSubscript:@"ckon"];
      CFErrorRef v23 = [v22 objectForKeyedSubscript:@"pmuc"];

      BOOL v24 = (objc_opt_respondsToSelector() & 1) == 0 || [v14 integerValue] != 2;
      BOOL v87 = (objc_opt_respondsToSelector() & 1) == 0 || [v156 integerValue] != 2;
      BOOL v93 = (objc_opt_respondsToSelector() & 1) == 0 || [v18 integerValue] != 1;
      BOOL v111 = (objc_opt_respondsToSelector() & 1) != 0 && [v20 integerValue] == 2;
      BOOL v121 = (objc_opt_respondsToSelector() & 1) != 0 && [v23 integerValue] == 2;
      LOBYTE(v47) = !v24 && !v87 && !v93 && v111 && v121;
      id v30 = v156;

LABEL_173:
      goto LABEL_174;
    case 5:
      int v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        int v14 = +[AMSLogConfig sharedConfig];
      }
      id v30 = [v14 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        id v55 = objc_opt_class();
        id v56 = v55;
        v57 = AMSSetLogKeyIfNeeded();
        *(_DWORD *)buf = 138543618;
        v160 = v55;
        __int16 v161 = 2114;
        v162 = v57;
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PSD2 Passcode ACL not supported on platform", buf, 0x16u);
      }
      goto LABEL_81;
    case 6:
      __int16 v58 = [v6 objectForKeyedSubscript:@"oa"];
      if (objc_opt_respondsToSelector()) {
        int v59 = [v58 BOOLValue] ^ 1;
      }
      else {
        int v59 = 1;
      }
      v91 = [v6 objectForKeyedSubscript:@"odel"];
      if (objc_opt_respondsToSelector()) {
        int v92 = [v91 BOOLValue] ^ 1;
      }
      else {
        int v92 = 1;
      }
      int v148 = v92;
      v101 = [v6 objectForKeyedSubscript:@"ock"];
      v102 = [v101 objectForKeyedSubscript:@"cbtn"];

      if (objc_opt_respondsToSelector()) {
        [v102 BOOLValue];
      }
      v152 = v102;
      v155 = v58;
      v103 = [v6 objectForKeyedSubscript:@"ock"];
      v104 = [v103 objectForKeyedSubscript:@"cup"];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v106 = v6;
        v107 = [v6 objectForKeyedSubscript:@"ock"];
        v108 = [v107 objectForKeyedSubscript:@"cup"];
        v109 = [v108 objectForKeyedSubscript:@"poffwrist"];

        if (objc_opt_respondsToSelector()) {
          char v110 = [v109 BOOLValue];
        }
        else {
          char v110 = 0;
        }
      }
      else
      {
        v106 = v6;
        char v110 = 0;
      }
      v125 = [v106 objectForKeyedSubscript:@"osgn"];
      v126 = [v125 objectForKeyedSubscript:@"cbtn"];

      v158 = v91;
      if (objc_opt_respondsToSelector()) {
        int v127 = [v126 BOOLValue] ^ 1;
      }
      else {
        int v127 = 1;
      }
      int v150 = v127;
      v128 = [v106 objectForKeyedSubscript:@"osgn"];
      v129 = [v128 objectForKeyedSubscript:@"pmuc"];

      if (objc_opt_respondsToSelector()) {
        int v130 = [v129 BOOLValue] ^ 1;
      }
      else {
        int v130 = 1;
      }
      v131 = v106;
      v132 = [v106 objectForKeyedSubscript:@"osgn"];
      v133 = [v132 objectForKeyedSubscript:@"cup"];
      objc_opt_class();
      char v134 = objc_opt_isKindOfClass();

      if (v134)
      {
        char v147 = v110;
        int v135 = v59;
        v136 = v131;
        v137 = [v131 objectForKeyedSubscript:@"osgn"];
        v138 = [v137 objectForKeyedSubscript:@"cup"];
        v139 = [v138 objectForKeyedSubscript:@"poffwrist"];

        if (objc_opt_respondsToSelector()) {
          char v140 = [v139 BOOLValue];
        }
        else {
          char v140 = 0;
        }
        int v14 = v155;
        int v141 = v148;

        id v6 = v136;
        int v59 = v135;
        char v110 = v147;
      }
      else
      {
        char v140 = 0;
        id v6 = v131;
        int v14 = v155;
        int v141 = v148;
      }
      if ((v59 | v141 | v150 | v130)) {
        LOBYTE(v47) = 0;
      }
      else {
        LOBYTE(v47) = v110 & v140;
      }

      id v30 = v158;
      goto LABEL_175;
    case 7:
      id v30 = [v6 objectForKeyedSubscript:@"ock"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v14 = 0;
        goto LABEL_81;
      }
      int v14 = v30;

      if (!v14) {
        goto LABEL_132;
      }
      id v30 = [v14 objectForKeyedSubscript:@"cbtn"];
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_81;
      }
      uint64_t v60 = [v14 objectForKeyedSubscript:@"cbtn"];
      int v61 = [v60 BOOLValue];

      if (!v61)
      {
LABEL_132:
        LOBYTE(v47) = 0;
        goto LABEL_176;
      }
      v62 = [v14 objectForKeyedSubscript:@"cbio"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v30 = v62;

        if (!v30) {
          goto LABEL_81;
        }
        id v18 = [v30 objectForKeyedSubscript:@"pbiot"];
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_180;
        }
        v63 = [v30 objectForKeyedSubscript:@"pbiot"];
        uint64_t v64 = [v63 integerValue];

        if (v64 != 3) {
          goto LABEL_81;
        }
        id v65 = [v6 objectForKeyedSubscript:@"osgn"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v65;

          if (!v18) {
            goto LABEL_180;
          }
          id v65 = [v18 objectForKeyedSubscript:@"cbtn"];
          if (objc_opt_respondsToSelector())
          {
            v66 = [v18 objectForKeyedSubscript:@"cbtn"];
            int v67 = [v66 BOOLValue];

            if (v67)
            {
              v68 = [v18 objectForKeyedSubscript:@"cbio"];
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                id v65 = v68;
              }
              else {
                id v65 = 0;
              }

              v145 = [v65 objectForKeyedSubscript:@"pbiot"];
              if (objc_opt_respondsToSelector())
              {
                v146 = [v65 objectForKeyedSubscript:@"pbiot"];
                LOBYTE(v47) = [v146 integerValue] == 3;
              }
              else
              {
                LOBYTE(v47) = 0;
              }

              goto LABEL_183;
            }
LABEL_180:
            LOBYTE(v47) = 0;
LABEL_174:

            goto LABEL_175;
          }
        }
        else
        {
          id v18 = 0;
        }
        LOBYTE(v47) = 0;
LABEL_183:

        goto LABEL_174;
      }

      id v30 = 0;
      goto LABEL_81;
    default:
      if ((unint64_t)(a3 - 101) < 2)
      {
        uint64_t v25 = [v6 objectForKeyedSubscript:@"oa"];
        uint64_t v26 = [v6 objectForKeyedSubscript:@"odel"];
        if (objc_opt_respondsToSelector()) {
          int v27 = [v25 BOOLValue] ^ 1;
        }
        else {
          int v27 = 1;
        }
        v154 = v25;
        v157 = v26;
        if (objc_opt_respondsToSelector()) {
          int v69 = [v26 BOOLValue] ^ 1;
        }
        else {
          int v69 = 1;
        }
        v74 = [v6 objectForKeyedSubscript:@"ock"];
        v75 = [v74 objectForKeyedSubscript:@"pmuc"];

        v76 = [v6 objectForKeyedSubscript:@"osgn"];
        v77 = [v76 objectForKeyedSubscript:@"pmuc"];

        BOOL v78 = (objc_opt_respondsToSelector() & 1) != 0 && [v75 integerValue] == 1;
        BOOL v79 = (objc_opt_respondsToSelector() & 1) != 0 && [v77 integerValue] == 1;
        if ((v27 | v69)) {
          uint64_t v47 = 0;
        }
        else {
          uint64_t v47 = v78 & v79;
        }
        id v151 = v6;
        v80 = +[AMSLogConfig sharedConfig];
        if (!v80)
        {
          v80 = +[AMSLogConfig sharedConfig];
        }
        v81 = [v80 OSLogObject];
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = objc_opt_class();
          id v83 = v82;
          v84 = AMSSetLogKeyIfNeeded();
          v85 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
          v86 = [MEMORY[0x1E4F28ED0] numberWithBool:v47];
          *(_DWORD *)buf = 138544130;
          v160 = v82;
          __int16 v161 = 2114;
          v162 = v84;
          __int16 v163 = 2114;
          v164 = v85;
          __int16 v165 = 2114;
          v166 = v86;
          _os_log_impl(&dword_18D554000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluated extended action %{public}@ with result: %{public}@", buf, 0x2Au);
        }
        id v6 = v151;
LABEL_115:
        int v14 = v154;
        id v30 = v157;
        goto LABEL_175;
      }
      if (a3 == 100)
      {
        long long v28 = [v6 objectForKeyedSubscript:@"oa"];
        v157 = [v6 objectForKeyedSubscript:@"odel"];
        if (objc_opt_respondsToSelector()) {
          int v29 = [v28 BOOLValue] ^ 1;
        }
        else {
          int v29 = 1;
        }
        if (objc_opt_respondsToSelector()) {
          int v88 = [v157 BOOLValue] ^ 1;
        }
        else {
          int v88 = 1;
        }
        v94 = [v6 objectForKeyedSubscript:@"ock"];
        uint64_t v95 = [v94 objectForKeyedSubscript:@"cbio"];

        v96 = [v6 objectForKeyedSubscript:@"osgn"];
        v97 = [v96 objectForKeyedSubscript:@"cbio"];

        if ((v29 | v88))
        {
          uint64_t v47 = 0;
        }
        else
        {
          if (v95) {
            BOOL v112 = v97 == 0;
          }
          else {
            BOOL v112 = 1;
          }
          uint64_t v47 = !v112;
        }
        v113 = (void *)v95;
        v154 = v28;
        v114 = +[AMSLogConfig sharedConfig];
        if (!v114)
        {
          v114 = +[AMSLogConfig sharedConfig];
        }
        v115 = [v114 OSLogObject];
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          v116 = objc_opt_class();
          id v149 = v116;
          AMSSetLogKeyIfNeeded();
          v117 = id v153 = v6;
          v118 = [MEMORY[0x1E4F28ED0] numberWithInteger:100];
          v119 = [MEMORY[0x1E4F28ED0] numberWithBool:v47];
          *(_DWORD *)buf = 138544130;
          v160 = v116;
          __int16 v161 = 2114;
          v162 = v117;
          __int16 v163 = 2114;
          v164 = v118;
          __int16 v165 = 2114;
          v166 = v119;
          _os_log_impl(&dword_18D554000, v115, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Evaluated extended action %{public}@ with result: %{public}@", buf, 0x2Au);

          id v6 = v153;
        }

        goto LABEL_115;
      }
      int v14 = +[AMSLogConfig sharedConfig];
      if (!v14)
      {
        int v14 = +[AMSLogConfig sharedConfig];
      }
      id v30 = [v14 OSLogObject];
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v70 = objc_opt_class();
        id v71 = v70;
        v72 = AMSSetLogKeyIfNeeded();
        v73 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
        *(_DWORD *)buf = 138543874;
        v160 = v70;
        __int16 v161 = 2114;
        v162 = v72;
        __int16 v163 = 2114;
        v164 = v73;
        _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] LocalAuth action evaluation failed for unrecognized action type: %{public}@", buf, 0x20u);
      }
LABEL_81:
      LOBYTE(v47) = 0;
LABEL_175:

LABEL_176:
LABEL_177:

      return v47;
  }
}

+ (BOOL)isAvailableForAccount:(id)a3
{
  if (+[AMSBiometrics stateForAccount:a3] != 1) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
  if ([v3 isPasscodeSet])
  {
    id v4 = +[AMSBiometrics identityMap];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

+ (id)minimumACLVersionForAction:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id result = @"1";
  if (a3 > 99)
  {
    if (a3 != 100)
    {
      if (a3 == 101)
      {
        return @"2";
      }
      else if (a3 == 102)
      {
        return @"3";
      }
      else
      {
LABEL_16:
        BOOL v5 = +[AMSLogConfig sharedConfig];
        if (!v5)
        {
          BOOL v5 = +[AMSLogConfig sharedConfig];
        }
        id v10 = [v5 OSLogObject];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = objc_opt_class();
          id v12 = v11;
          uint64_t v13 = AMSSetLogKeyIfNeeded();
          int v14 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
          int v15 = 138543874;
          __int16 v16 = v11;
          __int16 v17 = 2114;
          id v18 = v13;
          __int16 v19 = 2114;
          uint64_t v20 = v14;
          _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine ACL version for LocalAuth action type: %{public}@", (uint8_t *)&v15, 0x20u);
        }
LABEL_21:

        return 0;
      }
    }
  }
  else
  {
    switch(a3)
    {
      case 0:
        return result;
      case 1:
      case 2:
        id result = @"1.5";
        break;
      case 3:
      case 4:
        return @"3";
      case 5:
        BOOL v5 = +[AMSLogConfig sharedConfig];
        if (!v5)
        {
          BOOL v5 = +[AMSLogConfig sharedConfig];
        }
        id v6 = [v5 OSLogObject];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          id v7 = objc_opt_class();
          id v8 = v7;
          id v9 = AMSSetLogKeyIfNeeded();
          int v15 = 138543618;
          __int16 v16 = v7;
          __int16 v17 = 2114;
          id v18 = v9;
          _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Passcode ACLs not supported on platform", (uint8_t *)&v15, 0x16u);
        }
        goto LABEL_21;
      case 6:
        id result = @"4";
        break;
      case 7:
        id result = @"1.7";
        break;
      default:
        goto LABEL_16;
    }
  }
  return result;
}

+ (id)resumptionHeadersFromRequest:(id)a3
{
  v33[7] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 allHTTPHeaderFields];
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v32[0] = @"X-Apple-TID-Pkey";
  uint64_t v5 = objc_msgSend(v3, "objectForKeyedSubscript:");
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (__CFString *)v5;
  }
  else {
    id v7 = &stru_1EDCA7308;
  }
  v33[0] = v7;
  v32[1] = @"X-Apple-TID-Challenge";
  uint64_t v8 = objc_msgSend(v3, "objectForKeyedSubscript:");
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  else {
    id v10 = &stru_1EDCA7308;
  }
  v33[1] = v10;
  v32[2] = @"X-Apple-TID-Signature";
  uint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:");
  id v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (__CFString *)v11;
  }
  else {
    uint64_t v13 = &stru_1EDCA7308;
  }
  v33[2] = v13;
  v32[3] = @"X-Apple-TID-State";
  uint64_t v14 = objc_msgSend(v3, "objectForKeyedSubscript:");
  int v15 = (void *)v14;
  if (v14) {
    __int16 v16 = (__CFString *)v14;
  }
  else {
    __int16 v16 = &stru_1EDCA7308;
  }
  v33[3] = v16;
  v32[4] = @"X-Apple-TID-SignatureVersion";
  uint64_t v17 = objc_msgSend(v3, "objectForKeyedSubscript:");
  id v18 = (void *)v17;
  if (v17) {
    __int16 v19 = (__CFString *)v17;
  }
  else {
    __int16 v19 = &stru_1EDCA7308;
  }
  v33[4] = v19;
  v32[5] = @"X-Apple-AMD";
  uint64_t v20 = objc_msgSend(v3, "objectForKeyedSubscript:");
  uint64_t v21 = (void *)v20;
  if (v20) {
    __int16 v22 = (__CFString *)v20;
  }
  else {
    __int16 v22 = &stru_1EDCA7308;
  }
  v33[5] = v22;
  v32[6] = @"X-Apple-AMD-M";
  uint64_t v23 = objc_msgSend(v3, "objectForKeyedSubscript:");
  BOOL v24 = (void *)v23;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  else {
    uint64_t v25 = &stru_1EDCA7308;
  }
  v33[6] = v25;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:7];
  int v27 = (void *)[v4 initWithDictionary:v26];

  long long v28 = [v3 objectForKeyedSubscript:@"X-Apple-TID-Pkey"];

  if (v28)
  {
    int v29 = [v3 objectForKeyedSubscript:@"X-Apple-TID-Signature"];

    if (v29) {
      id v30 = @"PK";
    }
    else {
      id v30 = @"FB";
    }
    [v27 setObject:v30 forKey:@"X-Apple-TID-Action"];
  }

  return v27;
}

+ (void)saveIdentityMap
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[AMSBiometrics identityMap];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v5 = +[AMSBiometrics identityMap];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v28;
      unint64_t v10 = 0x1E4F28000uLL;
      *(void *)&long long v7 = 138543874;
      long long v23 = v7;
      BOOL v24 = v5;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * v11);
          uint64_t v13 = *(void **)(v10 + 3504);
          id v26 = 0;
          uint64_t v14 = objc_msgSend(v13, "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v26, v23);
          id v15 = v26;
          if (v14)
          {
            [v4 addObject:v14];
          }
          else
          {
            __int16 v16 = +[AMSLogConfig sharedConfig];
            if (!v16)
            {
              __int16 v16 = +[AMSLogConfig sharedConfig];
            }
            uint64_t v17 = [v16 OSLogObject];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = v8;
              uint64_t v19 = v9;
              id v20 = v4;
              uint64_t v21 = objc_opt_class();
              id v25 = v21;
              __int16 v22 = AMSSetLogKeyIfNeeded();
              *(_DWORD *)buf = v23;
              uint64_t v32 = v21;
              id v4 = v20;
              uint64_t v9 = v19;
              uint64_t v8 = v18;
              __int16 v33 = 2114;
              uint64_t v34 = v22;
              __int16 v35 = 2114;
              id v36 = v15;
              _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to archive identity. Error = %{public}@", buf, 0x20u);

              uint64_t v5 = v24;
              unint64_t v10 = 0x1E4F28000;
            }
          }

          ++v11;
        }
        while (v8 != v11);
        uint64_t v8 = [v5 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v4 = 0;
  }
  +[AMSDefaults setDeviceBiometricIdentities:v4];
}

+ (id)setState:(int64_t)a3 forAccount:(id)a4
{
  id v5 = a4;
  objc_msgSend(v5, "ams_setBiometricsState:", a3);
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  long long v7 = objc_msgSend(v6, "ams_saveAccount:", v5);

  return v7;
}

+ (id)signChallenge:(id)a3 withAccount:(id)a4 clientInfo:(id)a5 options:(id)a6
{
  uint64_t v6 = [a1 signAndReturnChallenge:a3 withAccount:a4 clientInfo:a5 options:a6];
  long long v7 = [v6 thenWithBlock:&__block_literal_global_20];

  return v7;
}

id __62__AMSBiometrics_signChallenge_withAccount_clientInfo_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 signature];
  uint64_t v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

+ (id)signAndReturnChallenge:(id)a3 withAccount:(id)a4 clientInfo:(id)a5 options:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v18 = 0;
  uint64_t v13 = [[AMSBiometricsSignatureRequest alloc] initWithAccount:v11 clientInfo:v10 challenge:v12 localAuthContext:0 options:v9 error:&v18];

  id v14 = v18;
  if (v13)
  {
    id v15 = [[AMSBiometricsSignatureTask alloc] initWithRequest:v13];
    __int16 v16 = [(AMSBiometricsSignatureTask *)v15 performSignature];
  }
  else
  {
    __int16 v16 = +[AMSPromise promiseWithError:v14];
  }

  return v16;
}

+ (int64_t)stateForAccount:(id)a3
{
  return +[AMSDefaults deviceBiometricsState];
}

+ (BOOL)_deleteKeysWithOptions:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 style];
  if (v6 > 5)
  {
    id v10 = 0;
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (((1 << v6) & 0x39) != 0)
  {
    uint64_t v17 = 0;
    long long v7 = (id *)&v17;
    BOOL v8 = +[AMSKeychain deleteCertificateChainWithOptions:v5 error:&v17];
  }
  else
  {
    uint64_t v16 = 0;
    long long v7 = (id *)&v16;
    BOOL v8 = +[AMSKeychain deleteKeyPairWithOptions:v5 error:&v16];
  }
  BOOL v9 = v8;
  id v10 = *v7;
  if (v10)
  {
    id v11 = +[AMSLogConfig sharedAttestationConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_opt_class();
      id v14 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543874;
      uint64_t v19 = v13;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      __int16 v22 = 2114;
      id v23 = v10;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error deleting keys: %{public}@", buf, 0x20u);
    }
  }
  if (a4) {
LABEL_12:
  }
    *a4 = v10;
LABEL_13:

  return v9;
}

+ (id)_stateHeaderValueForAccount:(id)a3
{
  id v4 = a3;
  if (![a1 _shouldAddBiometricHeader]) {
    goto LABEL_9;
  }
  int64_t v5 = +[AMSBiometrics stateForAccount:v4];
  unint64_t v6 = [a1 type];
  long long v7 = 0;
  if (v6 <= 7 && ((1 << v6) & 0x9C) != 0)
  {
    if (!v5)
    {
      long long v7 = @"U";
      goto LABEL_10;
    }
    if (v5 == 2)
    {
      long long v7 = @"D";
      goto LABEL_10;
    }
    if (v5 == 1 && v6 - 2 < 6)
    {
      long long v7 = off_1E55A0608[v6 - 2];
      goto LABEL_10;
    }
LABEL_9:
    long long v7 = 0;
  }
LABEL_10:

  return v7;
}

+ (BOOL)_shouldAddBiometricHeader
{
  uint64_t v2 = +[AMSBiometrics identityMap];
  if ([v2 count])
  {
    uint64_t v3 = [MEMORY[0x1E4F74230] sharedConnection];
    char v4 = [v3 isPasscodeSet];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)isActionSupportedForType:(int64_t)a3 account:(id)a4 options:(id)a5 error:(id *)a6
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__10;
  long long v27 = __Block_byref_object_dispose__10;
  long long v28 = objc_alloc_init(AMSDaemonConnection);
  id v10 = [(id)v24[5] securityServiceProxyWithDelegate:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke;
  v18[3] = &unk_1E55A05A8;
  int64_t v22 = a3;
  id v11 = v8;
  id v19 = v11;
  id v12 = v9;
  id v20 = v12;
  uint64_t v21 = &v23;
  uint64_t v13 = [v10 thenWithBlock:v18];
  id v17 = 0;
  id v14 = [v13 resultWithError:&v17];
  id v15 = v17;
  LOBYTE(v8) = [v14 BOOLValue];

  _Block_object_dispose(&v23, 8);
  return (char)v8;
}

AMSMutablePromise *__64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_alloc_init(AMSMutablePromise);
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[4];
  uint64_t v7 = a1[5];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke_2;
  v11[3] = &unk_1E55A0580;
  id v8 = v4;
  uint64_t v9 = a1[6];
  id v12 = v8;
  uint64_t v13 = v9;
  [v3 isActionSupportedForType:v5 account:v6 options:v7 completion:v11];

  return v8;
}

void __64__AMSBiometrics_isActionSupportedForType_account_options_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    [v4 finishWithResult:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

+ (BOOL)proxyDeleteAllKeysWithError:(id *)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__10;
  id v15 = __Block_byref_object_dispose__10;
  uint64_t v16 = objc_alloc_init(AMSDaemonConnection);
  id v3 = [(id)v12[5] securityServiceProxyWithDelegate:0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke;
  v10[3] = &unk_1E55A05D0;
  v10[4] = &v11;
  char v4 = [v3 thenWithBlock:v10];
  id v9 = 0;
  uint64_t v5 = [v4 resultWithError:&v9];
  id v6 = v9;
  char v7 = [v5 BOOLValue];

  _Block_object_dispose(&v11, 8);
  return v7;
}

AMSMutablePromise *__45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = objc_alloc_init(AMSMutablePromise);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke_2;
  v8[3] = &unk_1E55A0580;
  uint64_t v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  [v3 deleteAllKeysWithCompletion:v8];

  return v5;
}

void __45__AMSBiometrics_proxyDeleteAllKeysWithError___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28ED0] numberWithBool:a2];
    [v4 finishWithResult:v5];
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  char v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

@end