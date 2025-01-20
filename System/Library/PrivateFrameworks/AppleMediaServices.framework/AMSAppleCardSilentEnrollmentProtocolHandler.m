@interface AMSAppleCardSilentEnrollmentProtocolHandler
- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation AMSAppleCardSilentEnrollmentProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __109__AMSAppleCardSilentEnrollmentProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
  v13[3] = &unk_1E559EE00;
  BOOL v15 = v6;
  v13[4] = self;
  id v14 = v10;
  v12.receiver = self;
  v12.super_class = (Class)AMSAppleCardSilentEnrollmentProtocolHandler;
  id v11 = v10;
  [(AMSURLProtocolHandler *)&v12 reconfigureNewRequest:a3 originalTask:a4 redirect:v6 completionHandler:v13];
}

void __109__AMSAppleCardSilentEnrollmentProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_7:
    v10();
    goto LABEL_14;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    id v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_7;
  }
  v7 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  v8 = objc_msgSend(v7, "ams_activeiCloudAccount");

  if (v8)
  {
    v9 = (void *)[v5 mutableCopy];
    objc_msgSend(v9, "ams_addSilentEnrollmentHeadersForAccount:", v8);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v11 = +[AMSLogConfig sharedConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    objc_super v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = objc_opt_class();
      id v14 = v13;
      BOOL v15 = AMSSetLogKeyIfNeeded();
      int v16 = 138543618;
      v17 = v13;
      __int16 v18 = 2114;
      v19 = v15;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to find active iCloud account", (uint8_t *)&v16, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }

LABEL_14:
}

- (void)AMSURLSession:(id)a3 task:(id)a4 handleAuthenticateRequest:(id)a5 completion:(id)a6
{
  id v7 = a6;
  id v8 = a5;
  id v10 = [[AMSAuthenticateTask alloc] initWithRequest:v8];

  v9 = [(AMSAuthenticateTask *)v10 performAuthentication];
  [v9 addFinishBlock:v7];
}

@end