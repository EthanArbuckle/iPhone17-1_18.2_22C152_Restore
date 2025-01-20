@interface AMSAuthKitUpdateTask
- (ACAccount)account;
- (AMSAuthKitUpdateTask)initWithAccount:(id)a3 options:(id)a4;
- (AMSAuthenticateOptions)options;
- (BOOL)_canPresentBackgroundPrompt;
- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6;
- (id)_createAuthKitContext;
- (id)_createAuthKitController;
- (id)performAuthKitUpdate;
- (unint64_t)_authenticationType;
- (void)_configureAuthKitContext:(id)a3;
- (void)_configureClientInfoForContext:(id)a3;
- (void)_configureCompanionDeviceForContext:(id)a3;
- (void)_configureIdentifiersForContext:(id)a3;
- (void)_configureProxyIdentifiersForContext:(id)a3;
- (void)_configureStringsForContext:(id)a3;
- (void)_logPromptSummaryForResults:(id)a3 context:(id)a4;
@end

@implementation AMSAuthKitUpdateTask

- (AMSAuthKitUpdateTask)initWithAccount:(id)a3 options:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthKitUpdateTask;
  v9 = [(AMSTask *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

- (id)performAuthKitUpdate
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke;
  v4[3] = &unk_1E559EA38;
  v4[4] = self;
  v2 = [(AMSTask *)self performTaskWithPromiseBlock:v4];
  return v2;
}

id __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke(uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  v1 = +[AMSLogConfig sharedAccountsConfig];
  if (!v1)
  {
    v1 = +[AMSLogConfig sharedConfig];
  }
  v2 = [v1 OSLogObject];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (id *)(a1 + 32);
    uint64_t v34 = objc_opt_class();
    v36 = AMSLogKey();
    v37 = [*(id *)(a1 + 32) account];
    AMSHashIfNeeded(v37);
    v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    v4 = [*(id *)(a1 + 32) account];
    v5 = objc_msgSend(v4, "ams_password");
    v6 = @"****";
    if (v5) {
      id v7 = @"****";
    }
    else {
      id v7 = 0;
    }
    id v8 = [*v3 account];
    v9 = objc_msgSend(v8, "ams_rawPassword");
    if (!v9) {
      v6 = 0;
    }
    v10 = [*v3 options];
    v11 = AMSHashIfNeeded(v10);
    *(_DWORD *)buf = 138544642;
    *(void *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v36;
    *(_WORD *)&buf[22] = 2114;
    v51 = v35;
    *(_WORD *)v52 = 2114;
    *(void *)&v52[2] = v7;
    *(_WORD *)&v52[10] = 2114;
    *(void *)&v52[12] = v6;
    __int16 v53 = 2114;
    v54 = v11;
    _os_log_impl(&dword_18D554000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing an AuthKit authentication. account = %{public}@ | account.ams_password = %{public}@ | account.ams_rawPassword = %{public}@ | options = %{public}@", buf, 0x3Eu);
  }
  objc_super v12 = [*(id *)(a1 + 32) options];
  v13 = [v12 debugReason];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    v15 = +[AMSLogConfig sharedConfig];
    if (!v15)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      v19 = [*(id *)(a1 + 32) options];
      v20 = [v19 clientInfo];
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v51 = v20;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] An authentication was performed without a debugReason. client = %{public}@", buf, 0x20u);
    }
  }
  v21 = objc_opt_class();
  v22 = [*(id *)(a1 + 32) account];
  v23 = [*(id *)(a1 + 32) options];
  [v21 _updateAccountRawPasswordUsingSecondaryAccounts:v22 options:v23];

  v24 = objc_alloc_init(AMSMutablePromise);
  v25 = [*(id *)(a1 + 32) _createAuthKitContext];
  [*(id *)(a1 + 32) _configureAuthKitContext:v25];
  v26 = [*(id *)(a1 + 32) _createAuthKitController];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v51 = __Block_byref_object_copy__5;
  *(void *)v52 = __Block_byref_object_dispose__5;
  *(void *)&v52[8] = 0;
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_23;
  v46[3] = &unk_1E559F2D0;
  uint64_t v27 = *(void *)(a1 + 32);
  v49 = buf;
  v46[4] = v27;
  id v28 = v25;
  id v47 = v28;
  v29 = v24;
  v48 = v29;
  [v26 addSuccessBlock:v46];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_2;
  v44[3] = &unk_1E559F028;
  v30 = v29;
  v45 = v30;
  [v26 addErrorBlock:v44];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_3;
  v43[3] = &unk_1E559F2F8;
  v43[4] = buf;
  [(AMSPromise *)v30 addFinishBlock:v43];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_4;
  v41[3] = &unk_1E559F320;
  v41[4] = *(void *)(a1 + 32);
  id v31 = v28;
  id v42 = v31;
  v32 = [(AMSMutablePromise *)v30 thenWithBlock:v41];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_9;
  v40[3] = &unk_1E559F050;
  v40[4] = *(void *)(a1 + 32);
  [v32 addSuccessBlock:v40];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_37;
  v39[3] = &unk_1E559F028;
  v39[4] = *(void *)(a1 + 32);
  [v32 addErrorBlock:v39];

  _Block_object_dispose(buf, 8);
  return v32;
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_23(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDelegate:*(void *)(a1 + 32)];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) completionHandlerAdapter];
  [v5 authenticateWithContext:v6 completion:v7];
}

uint64_t __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDelegate:0];
}

id __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _logPromptSummaryForResults:v3 context:*(void *)(a1 + 40)];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4EDC0]];
  uint64_t v6 = [*(id *)(a1 + 32) options];
  id v7 = [v6 serviceIdentifier];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    v9 = [*(id *)(a1 + 32) options];
    v10 = [v9 serviceIdentifier];
    v11 = [v5 objectForKeyedSubscript:v10];
  }
  else
  {
    v11 = 0;
  }
  if ([v4 length]
    || ![v4 length]
    && [v11 length]
    && ([*(id *)(a1 + 32) options],
        v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 serviceTokenOnly],
        v18,
        v19))
  {
    objc_super v12 = [AMSAuthKitUpdateResult alloc];
    v13 = [*(id *)(a1 + 32) account];
    BOOL v14 = [*(id *)(a1 + 32) options];
    v15 = [(AMSAuthKitUpdateResult *)v12 initWithAccount:v13 authenticationResults:v3 options:v14];
    v16 = +[AMSPromise promiseWithResult:v15];
  }
  else if ([v4 length] || !objc_msgSend(v11, "length"))
  {
    uint64_t v17 = AMSError(101, @"Unknown AuthKit Failure", @"The AuthKit authentication succeeded, but the results did not contain a password.", 0);
    v16 = +[AMSPromise promiseWithError:v17];
  }
  else
  {
    v20 = [*(id *)(a1 + 32) _createAuthKitContext];
    [*(id *)(a1 + 32) _configureAuthKitContext:v20];
    [v20 setServiceIdentifiers:MEMORY[0x1E4F1CBF0]];
    v21 = objc_alloc_init(AMSMutablePromise);
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = __Block_byref_object_copy__5;
    v40[4] = __Block_byref_object_dispose__5;
    id v41 = 0;
    v22 = [*(id *)(a1 + 32) _createAuthKitController];
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_5;
    v36[3] = &unk_1E559F2D0;
    uint64_t v23 = *(void *)(a1 + 32);
    v39 = v40;
    v36[4] = v23;
    id v24 = v20;
    id v37 = v24;
    v25 = v21;
    v38 = v25;
    [v22 addSuccessBlock:v36];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_6;
    v34[3] = &unk_1E559F028;
    v26 = v25;
    v35 = v26;
    [v22 addErrorBlock:v34];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_7;
    v33[3] = &unk_1E559F2F8;
    v33[4] = v40;
    [(AMSPromise *)v26 addFinishBlock:v33];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_8;
    v30[3] = &unk_1E559F320;
    id v27 = v5;
    uint64_t v28 = *(void *)(a1 + 32);
    id v31 = v27;
    uint64_t v32 = v28;
    v16 = [(AMSMutablePromise *)v26 thenWithBlock:v30];

    _Block_object_dispose(v40, 8);
  }

  return v16;
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_5(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  id v4 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDelegate:*(void *)(a1 + 32)];
  v5 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) completionHandlerAdapter];
  [v5 authenticateWithContext:v6 completion:v7];
}

uint64_t __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

uint64_t __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_7(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setDelegate:0];
}

id __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F4EDE8]];
  if ([v4 length])
  {
    v5 = (void *)[v3 mutableCopy];
    [v5 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x1E4F4EDC0]];
    uint64_t v6 = [AMSAuthKitUpdateResult alloc];
    id v7 = [*(id *)(a1 + 40) account];
    uint64_t v8 = (void *)[v5 copy];
    v9 = [*(id *)(a1 + 40) options];
    v10 = [(AMSAuthKitUpdateResult *)v6 initWithAccount:v7 authenticationResults:v8 options:v9];

    v11 = +[AMSPromise promiseWithResult:v10];
  }
  else
  {
    v5 = AMSError(101, @"Unknown AuthKit Failure", @"The AuthKit authentication succeeded, but the results did not contain a password.", 0);
    v11 = +[AMSPromise promiseWithError:v5];
  }

  return v11;
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    id v7 = AMSHashIfNeeded(v2);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] The AuthKit authentication succeeded. result = %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 code];
  uint64_t v5 = +[AMSLogConfig sharedAccountsConfig];
  uint64_t v6 = (void *)v5;
  if (v4 == -7048)
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    id v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = AMSLogKey();
      __int16 v10 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      v22 = v9;
      __int16 v23 = 2114;
      id v24 = v10;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] User requested alternate action. error = %{public}@", buf, 0x20u);
    }
    v11 = [*(id *)(a1 + 32) options];
    __int16 v12 = [v11 clientInfo];
    v13 = +[AMSAuthenticateTask loadCreateAppleIDWithClientInfo:v12 bag:0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_39;
    v18[3] = &unk_1E559F028;
    v18[4] = *(void *)(a1 + 32);
    [v13 addErrorBlock:v18];
  }
  else
  {
    if (!v5)
    {
      uint64_t v6 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v14 = [v6 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      v16 = AMSLogKey();
      uint64_t v17 = AMSHashIfNeeded(v3);
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      v22 = v16;
      __int16 v23 = 2114;
      id v24 = v17;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The AuthKit authentication failed. error = %{public}@", buf, 0x20u);
    }
  }
}

void __44__AMSAuthKitUpdateTask_performAuthKitUpdate__block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = +[AMSLogConfig sharedAccountsConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = AMSLogKey();
    id v7 = AMSHashIfNeeded(v2);
    int v8 = 138543874;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error loading Create Apple ID Flow. error = %{public}@", (uint8_t *)&v8, 0x20u);
  }
}

- (BOOL)authenticationController:(id)a3 shouldContinueWithAuthenticationResults:(id)a4 error:(id)a5 forContext:(id)a6
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v48 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = off_1E559C000;
  __int16 v12 = +[AMSLogConfig sharedAccountsConfig];
  if (!v12)
  {
    __int16 v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  id v47 = v10;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = AMSLogKey();
    uint64_t v15 = NSString;
    uint64_t v16 = objc_opt_class();
    if (v14)
    {
      uint64_t v17 = AMSLogKey();
      NSStringFromSelector(a2);
      v11 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
      [v15 stringWithFormat:@"%@: [%@] %@ ", v16, v17, v11];
    }
    else
    {
      uint64_t v17 = NSStringFromSelector(a2);
      [v15 stringWithFormat:@"%@: %@ ", v16, v17];
    v18 = };
    *(_DWORD *)buf = 138543362;
    v51 = v18;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEBUG, "%{public}@began.", buf, 0xCu);
    if (v14)
    {

      v18 = v11;
    }

    id v10 = v47;
  }

  int v19 = +[AMSLogConfig sharedAccountsOversizeConfig];
  if (!v19)
  {
    int v19 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v20 = [v19 OSLogObject];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    __int16 v21 = v9;
    v22 = AMSLogKey();
    __int16 v23 = NSString;
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = v24;
    if (v22)
    {
      uint64_t v44 = AMSLogKey();
      [v23 stringWithFormat:@"%@: [%@] ", v25, v44];
    }
    else
    {
      [v23 stringWithFormat:@"%@: ", v24];
    v26 = };
    AMSHashIfNeeded(v49);
    id v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = objc_msgSend(v48, "ak_redactedCopy");
    v29 = AMSHashIfNeeded(v28);
    v30 = AMSLogableError(v21);
    id v31 = AMSHashIfNeeded(v10);
    *(_DWORD *)buf = 138544386;
    v51 = v26;
    __int16 v52 = 2114;
    __int16 v53 = v27;
    __int16 v54 = 2114;
    uint64_t v55 = v29;
    __int16 v56 = 2114;
    v57 = v30;
    __int16 v58 = 2114;
    v59 = v31;
    _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEBUG, "%{public}@controller = %{public}@ | results = %{public}@ | error = %{public}@ | context = %{public}@", buf, 0x34u);

    if (v22)
    {

      v26 = (void *)v44;
    }

    id v9 = v21;
    id v10 = v47;
  }

  id v32 = [v10 clientInfo];
  if (!v32)
  {
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v10 setClientInfo:v32];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = [v32 objectForKeyedSubscript:@"metricsAuthenticationAttempts"];
    if (!v33)
    {
      id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v32 setObject:v33 forKeyedSubscript:@"metricsAuthenticationAttempts"];
    }
  }
  else
  {
    id v33 = 0;
  }
  uint64_t v34 = +[AMSMetricsEvent metricsAuthenticationAttemptDictionaryForAuthKitError:v9];
  if (v34) {
    [v33 addObject:v34];
  }
  v35 = +[AMSLogConfig sharedAccountsConfig];
  if (!v35)
  {
    v35 = +[AMSLogConfig sharedConfig];
  }
  v36 = [v35 OSLogObject];
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
  {
    id v45 = v9;
    id v37 = AMSLogKey();
    v38 = NSString;
    uint64_t v39 = objc_opt_class();
    if (v37)
    {
      v40 = AMSLogKey();
      NSStringFromSelector(a2);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      [v38 stringWithFormat:@"%@: [%@] %@ ", v39, v40, v10];
    }
    else
    {
      v40 = NSStringFromSelector(a2);
      [v38 stringWithFormat:@"%@: %@ ", v39, v40];
    id v41 = };
    id v42 = @"false";
    id v9 = v45;
    if (!v45) {
      id v42 = @"true";
    }
    *(_DWORD *)buf = 138543618;
    v51 = v41;
    __int16 v52 = 2114;
    __int16 v53 = v42;
    _os_log_impl(&dword_18D554000, v36, OS_LOG_TYPE_DEBUG, "%{public}@returning %{public}@", buf, 0x16u);
    if (v37)
    {

      id v41 = v10;
    }

    id v10 = v47;
  }

  return v9 == 0;
}

- (BOOL)_canPresentBackgroundPrompt
{
  id v2 = [(AMSAuthKitUpdateTask *)self options];
  id v3 = [v2 debugReason];
  uint64_t v4 = [v3 length];

  if (v4) {
    return 1;
  }
  if (_MergedGlobals_1_0 != -1) {
    dispatch_once(&_MergedGlobals_1_0, &__block_literal_global_11);
  }
  id v6 = (id)qword_1EB38D038;
  id v7 = +[AMSProcessInfo currentProcess];
  int v8 = [v7 bundleIdentifier];
  char v9 = [v6 containsObject:v8];

  return v9;
}

void __51__AMSAuthKitUpdateTask__canPresentBackgroundPrompt__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [v0 addObject:@"amstool"];
  [v0 addObject:@"com.apple.amsaccountsd"];
  [v0 addObject:@"com.apple.dt.xctest.tool"];
  [v0 addObject:@"com.apple.AppleMediaServicesUITestsHost"];
  [v0 addObject:@"com.apple.AppleMediaServicesTests.xctrunner"];
  [v0 addObject:@"com.apple.appstoreagent"];
  [v0 addObject:@"com.apple.appstored"];
  [v0 addObject:@"com.apple.appstorecomponentsd"];
  [v0 addObject:@"com.apple.AppStoreOverlays.ViewService"];
  uint64_t v1 = [v0 copy];

  id v2 = (void *)qword_1EB38D038;
  qword_1EB38D038 = v1;
}

- (unint64_t)_authenticationType
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(AMSAuthKitUpdateTask *)self options];
  unint64_t v4 = [v3 authenticationType];

  uint64_t v5 = [(AMSAuthKitUpdateTask *)self options];
  int v6 = [v5 isRemoteProxyAuthentication];

  if (v6 && v4 == 2)
  {
    id v7 = +[AMSLogConfig sharedAccountsConfig];
    if (!v7)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    int v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      id v10 = AMSLogKey();
      int v16 = 138543618;
      uint64_t v17 = v9;
      __int16 v18 = 2114;
      int v19 = v10;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding authenticationType with AKAppleIDAuthenticationTypeSilentPreferred. Performing a remote proxy authentication.", (uint8_t *)&v16, 0x16u);
    }
    unint64_t v4 = 0;
  }
  if (![(AMSAuthKitUpdateTask *)self _canPresentBackgroundPrompt] && v4 != 1)
  {
    v11 = +[AMSLogConfig sharedAccountsConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    __int16 v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      uint64_t v14 = AMSLogKey();
      int v16 = 138543618;
      uint64_t v17 = v13;
      __int16 v18 = 2114;
      int v19 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding authenticationType with AKAppleIDAuthenticationTypeSilent. The current process cannot perform a background prompt.", (uint8_t *)&v16, 0x16u);
    }
    return 1;
  }
  return v4;
}

- (void)_configureAuthKitContext:(id)a3
{
  id v12 = a3;
  objc_msgSend(v12, "setAuthenticationType:", -[AMSAuthKitUpdateTask _authenticationType](self, "_authenticationType"));
  unint64_t v4 = [(AMSAuthKitUpdateTask *)self account];
  uint64_t v5 = objc_msgSend(v4, "ams_rawPassword");
  [v12 _setPassword:v5];

  [v12 setServiceType:2];
  int v6 = [(AMSAuthKitUpdateTask *)self options];
  objc_msgSend(v12, "setIsEphemeral:", objc_msgSend(v6, "ephemeral"));

  id v7 = [(AMSAuthKitUpdateTask *)self options];
  objc_msgSend(v12, "setServiceType:", objc_msgSend(v7, "serviceType"));

  int v8 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v9 = [v8 serviceIdentifier];

  if (v9)
  {
    id v10 = [(AMSAuthKitUpdateTask *)self options];
    v11 = [v10 serviceIdentifier];
    [v12 setServiceIdentifier:v11];
  }
  [(AMSAuthKitUpdateTask *)self _configureClientInfoForContext:v12];
  [(AMSAuthKitUpdateTask *)self _configureCompanionDeviceForContext:v12];
  [(AMSAuthKitUpdateTask *)self _configureIdentifiersForContext:v12];
  [(AMSAuthKitUpdateTask *)self _configureProxyIdentifiersForContext:v12];
  [(AMSAuthKitUpdateTask *)self _configureStringsForContext:v12];
}

- (void)_configureClientInfoForContext:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v5 = [v4 appProvidedContext];
  [v13 setAppProvidedContext:v5];

  int v6 = [(AMSAuthKitUpdateTask *)self options];
  id v7 = [v6 appProvidedData];
  [v13 setAppProvidedData:v7];

  id v8 = [v13 clientInfo];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v13 setClientInfo:v8];
  }
  uint64_t v9 = [(AMSAuthKitUpdateTask *)self options];
  id v10 = [v9 createAccountQueryParams];
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v10, @"AMSAuthenticateOptionsCreateAccountQueryParamsKey");

  v11 = [(AMSAuthKitUpdateTask *)self options];
  id v12 = [v11 userAgent];
  objc_msgSend(v8, "ams_setNullableObject:forKey:", v12, @"AMSAuthenticateOptionsUserAgentKey");
}

- (void)_configureCompanionDeviceForContext:(id)a3
{
  id v13 = a3;
  unint64_t v4 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v5 = [v4 companionDeviceClientInfo];
  if (v5)
  {
  }
  else
  {
    int v6 = [(AMSAuthKitUpdateTask *)self options];
    id v7 = [v6 companionDeviceUDID];

    if (!v7) {
      goto LABEL_5;
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F4F010]);
  [v8 setLinkType:2];
  uint64_t v9 = [(AMSAuthKitUpdateTask *)self options];
  id v10 = [v9 companionDeviceClientInfo];
  [v8 setServerFriendlyDescription:v10];

  v11 = [(AMSAuthKitUpdateTask *)self options];
  id v12 = [v11 companionDeviceUDID];
  [v8 setUniqueDeviceIdentifier:v12];

  [v13 setCompanionDevice:v8];
LABEL_5:
}

- (void)_configureIdentifiersForContext:(id)a3
{
  id v23 = a3;
  unint64_t v4 = [(AMSAuthKitUpdateTask *)self account];
  uint64_t v5 = objc_msgSend(v4, "ams_altDSID");
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [(AMSAuthKitUpdateTask *)self account];
    id v8 = objc_msgSend(v7, "ams_altDSID");
    [v23 setAltDSID:v8];
  }
  uint64_t v9 = [(AMSAuthKitUpdateTask *)self account];
  uint64_t v10 = objc_msgSend(v9, "ams_DSID");
  if (v10)
  {
    v11 = (void *)v10;
    id v12 = [(AMSAuthKitUpdateTask *)self account];
    id v13 = objc_msgSend(v12, "ams_DSID");
    char v14 = [v13 isEqualToNumber:&unk_1EDD00D48];

    if (v14) {
      goto LABEL_7;
    }
    uint64_t v9 = [(AMSAuthKitUpdateTask *)self account];
    uint64_t v15 = objc_msgSend(v9, "ams_DSID");
    int v16 = [v15 stringValue];
    [v23 setDSID:v16];
  }
LABEL_7:
  uint64_t v17 = [(AMSAuthKitUpdateTask *)self account];
  __int16 v18 = [v17 username];
  if ([v18 length])
  {
    int v19 = [(AMSAuthKitUpdateTask *)self account];
    uint64_t v20 = [v19 username];
    [v23 setUsername:v20];
  }
  else
  {
    [v23 setUsername:0];
  }

  __int16 v21 = [(AMSAuthKitUpdateTask *)self account];
  v22 = [v21 username];
  [v23 setIsUsernameEditable:v22 == 0];

  if ([v23 authenticationType] == 1) {
    [v23 setIsUsernameEditable:0];
  }
  if ([v23 isUsernameEditable])
  {
    [v23 setAltDSID:0];
    [v23 setDSID:0];
  }
}

- (void)_configureProxyIdentifiersForContext:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v5 = [v4 proxyAppBundleID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    [v14 _setProxyingForApp:1];
    id v7 = [(AMSAuthKitUpdateTask *)self options];
    id v8 = [v7 proxyAppBundleID];
    [v14 _setProxiedAppBundleID:v8];
  }
  uint64_t v9 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v10 = [v9 proxyAppName];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    [v14 _setProxyingForApp:1];
    id v12 = [(AMSAuthKitUpdateTask *)self options];
    id v13 = [v12 proxyAppName];
    [v14 _setProxiedAppName:v13];
  }
}

- (void)_configureStringsForContext:(id)a3
{
  id v20 = a3;
  unint64_t v4 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v5 = [v4 cancelButtonString];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v7 = [(AMSAuthKitUpdateTask *)self options];
    id v8 = [v7 cancelButtonString];
    [v20 setCancelButtonString:v8];
  }
  uint64_t v9 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v10 = [v9 defaultButtonString];
  uint64_t v11 = [v10 length];

  if (v11)
  {
    id v12 = [(AMSAuthKitUpdateTask *)self options];
    id v13 = [v12 defaultButtonString];
    [v20 setDefaultButtonString:v13];
  }
  id v14 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v15 = [v14 promptTitle];
  objc_msgSend(v20, "set_passwordPromptTitle:", v15);

  int v16 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v17 = [v16 reason];
  [v20 setReason:v17];

  __int16 v18 = [(AMSAuthKitUpdateTask *)self options];
  int v19 = [v18 promptTitle];
  [v20 setTitle:v19];
}

- (id)_createAuthKitContext
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4EF60]);
  return v2;
}

- (id)_createAuthKitController
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4EF68]);
  id v3 = +[AMSPromise promiseWithResult:v2];

  return v3;
}

- (void)_logPromptSummaryForResults:(id)a3 context:(id)a4
{
  v45[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F4EDF0];
  id v8 = a3;
  uint64_t v9 = [v8 objectForKeyedSubscript:v7];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F4EDB0]];

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    int v11 = 0;
LABEL_5:
    if (!v9) {
      goto LABEL_23;
    }
    goto LABEL_6;
  }
  int v11 = [v10 BOOLValue];
  if ((v11 & 1) == 0) {
    goto LABEL_5;
  }
LABEL_6:
  int v30 = v11;
  uint64_t v34 = v9;
  id v35 = v6;
  v44[0] = @"authType";
  id v33 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v6, "authenticationType"));
  v45[0] = v33;
  v44[1] = @"account";
  id v31 = [(AMSAuthKitUpdateTask *)self account];
  uint64_t v12 = AMSHashIfNeeded(v31);
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = &stru_1EDCA7308;
  }
  v45[1] = v14;
  v44[2] = @"reason";
  uint64_t v15 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v16 = [v15 debugReason];
  uint64_t v17 = (void *)v16;
  if (v16) {
    __int16 v18 = (__CFString *)v16;
  }
  else {
    __int16 v18 = &stru_1EDCA7308;
  }
  v45[2] = v18;
  v44[3] = @"client";
  int v19 = [(AMSAuthKitUpdateTask *)self options];
  id v20 = [v19 clientInfo];
  __int16 v21 = v20;
  if (!v20)
  {
    __int16 v21 = +[AMSProcessInfo currentProcess];
  }
  v45[3] = v21;
  void v44[4] = @"proxyApp";
  v22 = [(AMSAuthKitUpdateTask *)self options];
  uint64_t v23 = [v22 proxyAppBundleID];
  uint64_t v24 = (void *)v23;
  uint64_t v25 = &stru_1EDCA7308;
  if (v23) {
    uint64_t v25 = (__CFString *)v23;
  }
  v45[4] = v25;
  id v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:5];

  if (!v20) {
  v26 = +[AMSLogConfig sharedAccountsConfig];
  }
  if (!v26)
  {
    v26 = +[AMSLogConfig sharedConfig];
  }
  id v27 = [v26 OSLogObject];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v28 = objc_opt_class();
    v29 = AMSLogKey();
    *(_DWORD *)buf = 138544130;
    uint64_t v37 = v28;
    __int16 v38 = 2114;
    uint64_t v39 = v29;
    __int16 v40 = 1024;
    int v41 = v30;
    __int16 v42 = 2114;
    v43 = v32;
    _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Prompted for credentials. (%d) %{public}@", buf, 0x26u);
  }
  uint64_t v9 = v34;
  id v6 = v35;
LABEL_23:
}

- (ACAccount)account
{
  return self->_account;
}

- (AMSAuthenticateOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end