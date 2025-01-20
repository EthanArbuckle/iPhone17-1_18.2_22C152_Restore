@interface AMSPACTokenTask
+ (id)signatureForSimLabelID:(id)a3 fromSignatures:(id)a4;
+ (id)signatureMapFromServerSignatures:(id)a3;
+ (id)tokenForSimLabelID:(id)a3 withQueue:(id)a4 signingData:(id)a5;
- (AMSPACTokenTask)initWithSimLabelID:(id)a3;
- (NSData)signingData;
- (NSString)simLabelID;
- (id)perform;
- (void)setSigningData:(id)a3;
@end

@implementation AMSPACTokenTask

- (AMSPACTokenTask)initWithSimLabelID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSPACTokenTask;
  v6 = [(AMSTask *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_simLabelID, a3);
  }

  return v7;
}

- (id)perform
{
  v3 = [(AMSPACTokenTask *)self simLabelID];

  if (v3)
  {
    v4 = [(AMSPACTokenTask *)self simLabelID];
    id v5 = dispatch_get_global_queue(0, 0);
    v6 = [(AMSPACTokenTask *)self signingData];
    v7 = +[AMSPACTokenTask tokenForSimLabelID:v4 withQueue:v5 signingData:v6];
  }
  else
  {
    v4 = AMSError(12, @"Cannot fetch PAC token", @"SIM labelID is missing", 0);
    v7 = +[AMSPromise promiseWithError:v4];
  }

  return v7;
}

+ (id)tokenForSimLabelID:(id)a3 withQueue:(id)a4 signingData:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = objc_opt_new();
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F6AB60]) initWithQueue:v10];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __60__AMSPACTokenTask_tokenForSimLabelID_withQueue_signingData___block_invoke;
  v18[3] = &unk_1E55A5028;
  id v13 = v11;
  id v20 = v8;
  id v21 = a1;
  id v19 = v13;
  id v14 = v8;
  [v12 generatePhoneAuthenticationSignatureOverData:v9 withCompletion:v18];

  v15 = v20;
  id v16 = v13;

  return v16;
}

void __60__AMSPACTokenTask_tokenForSimLabelID_withQueue_signingData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v11 = a1 + 40;
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = *(void **)(v11 + 8);
    v12 = [v5 authenticationCertificateSignatures];
    id v13 = [v10 signatureForSimLabelID:v9 fromSignatures:v12];
    [v8 finishWithResult:v13];
  }
  else if (v6)
  {
    id v14 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      v17 = AMSLogKey();
      v18 = AMSLogableError(v7);
      int v25 = 138543874;
      uint64_t v26 = v16;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PAC retrieval failed: %{public}@", (uint8_t *)&v25, 0x20u);
    }
    [*(id *)(a1 + 32) finishWithError:v7];
  }
  else
  {
    id v19 = AMSError(0, @"Signing result missing", @"No signing result or error provided", 0);
    id v20 = +[AMSLogConfig sharedPrivacyConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    id v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = objc_opt_class();
      v23 = AMSLogKey();
      v24 = AMSLogableError(v19);
      int v25 = 138543874;
      uint64_t v26 = v22;
      __int16 v27 = 2114;
      v28 = v23;
      __int16 v29 = 2114;
      v30 = v24;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] PAC retrieval failed: %{public}@", (uint8_t *)&v25, 0x20u);
    }
    [*(id *)(a1 + 32) finishWithError:v19];
  }
}

+ (id)signatureMapFromServerSignatures:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "serverVerifiableEncoding", (void)v15);
        v12 = [v10 subscriptionIdentifier];
        [v4 setObject:v11 forKeyedSubscript:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  id v13 = (void *)[v4 copy];
  return v13;
}

+ (id)signatureForSimLabelID:(id)a3 fromSignatures:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 signatureMapFromServerSignatures:a4];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (NSString)simLabelID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)signingData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSigningData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingData, 0);
  objc_storeStrong((id *)&self->_simLabelID, 0);
}

@end