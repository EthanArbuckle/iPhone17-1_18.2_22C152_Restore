@interface AMSBiometricsIdentityMapChangeTask
- (ACAccount)account;
- (AMSBiometricsIdentityMapChangeTask)initWithAccount:(id)a3 session:(id)a4 task:(id)a5;
- (AMSURLSession)session;
- (NSURLSessionTask)task;
- (id)perform;
- (void)setAccount:(id)a3;
- (void)setSession:(id)a3;
- (void)setTask:(id)a3;
@end

@implementation AMSBiometricsIdentityMapChangeTask

- (AMSBiometricsIdentityMapChangeTask)initWithAccount:(id)a3 session:(id)a4 task:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSBiometricsIdentityMapChangeTask;
  v12 = [(AMSTask *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_account, a3);
    objc_storeStrong((id *)&v13->_session, a4);
    objc_storeStrong((id *)&v13->_task, a5);
  }

  return v13;
}

- (id)perform
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke;
  v4[3] = &unk_1E559EDC0;
  v4[4] = self;
  v2 = [(AMSTask *)self performBinaryTaskWithBlock:v4];
  return v2;
}

BOOL __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  v4 = AMSSetLogKeyIfNeeded();
  v5 = +[AMSBiometricsSecurityService isIdentityMapValid];
  id v56 = 0;
  uint64_t v6 = [v5 resultWithError:&v56];
  id v7 = v56;

  v8 = +[AMSLogConfig sharedConfig];
  if (!v8)
  {
    v8 = +[AMSLogConfig sharedConfig];
  }
  id v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = objc_opt_class();
    id v11 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v12 = a1;
    v13 = a2;
    id v14 = v10;
    objc_super v15 = [v11 numberWithBool:v6];
    *(_DWORD *)buf = 138413058;
    v58 = v10;
    __int16 v59 = 2112;
    v60 = v4;
    __int16 v61 = 2114;
    v62 = v15;
    __int16 v63 = 2114;
    id v64 = v7;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEFAULT, "%@: [%@] Identity map check completed with result: %{public}@, error: %{public}@", buf, 0x2Au);

    a2 = v13;
    a1 = v12;
  }

  if ((v6 & 1) == 0)
  {

    v16 = +[AMSLogConfig sharedConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v58 = v18;
      __int16 v59 = 2114;
      v60 = v4;
      id v19 = v18;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to pre-authenticate purchase for invalid biometric identity map", buf, 0x16u);
    }
    v20 = objc_alloc_init(AMSAuthenticateOptions);
    [(AMSAuthenticateOptions *)v20 setAuthenticationType:2];
    [(AMSAuthenticateOptions *)v20 setCanMakeAccountActive:0];
    [(AMSAuthenticateOptions *)v20 setDebugReason:@"identity map"];
    int64_t v21 = +[AMSBiometrics type];
    switch(v21)
    {
      case 7:
        v22 = [*(id *)(a1 + 32) account];
        if (v22)
        {
          v23 = NSString;
          v24 = @"PROMPT_REASON_NEW_OPTIC_FORMAT_%@";
          goto LABEL_19;
        }
        v33 = @"PROMPT_REASON_NEW_OPTIC_ANONYMOUS";
        break;
      case 3:
        v22 = [*(id *)(a1 + 32) account];
        if (v22)
        {
          v23 = NSString;
          v24 = @"PROMPT_REASON_NEW_FACE_FORMAT_%@";
          goto LABEL_19;
        }
        v33 = @"PROMPT_REASON_NEW_FACE_ANONYMOUS";
        break;
      case 2:
        v22 = [*(id *)(a1 + 32) account];
        if (v22)
        {
          v23 = NSString;
          v24 = @"PROMPT_REASON_NEW_FINGERS_FORMAT_%@";
LABEL_19:
          v25 = AMSLocalizedString(v24, 0);
          v26 = [*(id *)(a1 + 32) account];
          v27 = [v26 username];
          v28 = objc_msgSend(v23, "stringWithFormat:", v25, v27);
          [(AMSAuthenticateOptions *)v20 setReason:v28];

LABEL_30:
LABEL_31:
          v34 = [AMSAuthenticateRequest alloc];
          v35 = [*(id *)(a1 + 32) account];
          v36 = [(AMSAuthenticateRequest *)v34 initWithAccount:v35 options:v20];

          [(AMSAuthenticateRequest *)v36 setLogKey:v4];
          v37 = objc_alloc_init(AMSPromise);
          v38 = [*(id *)(a1 + 32) session];
          v39 = [v38 delegate];
          char v40 = objc_opt_respondsToSelector();

          if (v40)
          {
            v52 = [*(id *)(a1 + 32) session];
            v41 = [v52 delegate];
            v42 = [*(id *)(a1 + 32) session];
            [*(id *)(a1 + 32) task];
            uint64_t v43 = a1;
            v44 = v4;
            v46 = v45 = a2;
            [(AMSPromise *)v37 completionHandlerAdapter];
            v48 = v47 = v20;
            [v41 AMSURLSession:v42 task:v46 handleAuthenticateRequest:v36 completion:v48];

            v20 = v47;
            a2 = v45;
            v4 = v44;
            a1 = v43;

            v49 = 0;
          }
          else
          {
            v49 = AMSError(2, @"Biometric Identity Map Change Failed", @"Failed to complete biometric map change, session delegate not observing callback", 0);
          }
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke_40;
          v54[3] = &unk_1E559E7E8;
          v54[4] = *(void *)(a1 + 32);
          id v55 = v4;
          [(AMSPromise *)v37 addErrorBlock:v54];
          id v53 = v49;
          id v50 = [(AMSPromise *)v37 resultWithError:&v53];
          id v7 = v53;

LABEL_35:
          goto LABEL_36;
        }
        v33 = @"PROMPT_REASON_NEW_FINGERS_ANONYMOUS";
        break;
      default:
        v29 = +[AMSLogConfig sharedConfig];
        if (!v29)
        {
          v29 = +[AMSLogConfig sharedConfig];
        }
        v30 = [v29 OSLogObject];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v58 = v31;
          __int16 v59 = 2114;
          v60 = v4;
          id v32 = v31;
          _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine biometric type", buf, 0x16u);
        }
        AMSError(12, @"Identity Map Failure", @"Failed to determine biometric type", 0);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        if (v7) {
          goto LABEL_35;
        }
        goto LABEL_31;
    }
    v25 = AMSLocalizedString(v33, 0);
    [(AMSAuthenticateOptions *)v20 setReason:v25];
    goto LABEL_30;
  }
LABEL_36:
  if (a2) {
    *a2 = v7;
  }

  return v7 == 0;
}

void __45__AMSBiometricsIdentityMapChangeTask_perform__block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    v4 = +[AMSLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v3;
    id v8 = v6;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Identity map authentication failed with error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (AMSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end