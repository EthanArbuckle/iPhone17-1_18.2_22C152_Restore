@interface AMSMediaProtocolHandler
- (AMSMediaProtocolHandler)initWithTokenService:(id)a3;
- (AMSMediaTokenServiceProtocol)tokenService;
- (void)handleResponse:(id)a3 task:(id)a4 completionHandler:(id)a5;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation AMSMediaProtocolHandler

void __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 value];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[AMSURLTaskInfo taskInfoForTask:*(void *)(a1 + 32)];
  v5 = v4;
  if (!v3)
  {
    v8 = [v4 properties];
    v9 = [v8 userInfo];
    v10 = [v9 objectForKeyedSubscript:0x1EDCB9308];

    if (v10)
    {
      id v11 = *(id *)(a1 + 40);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = (AMSOptional *)v11;
      }
      else {
        v6 = 0;
      }

      uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "ams_valueForHTTPHeaderField:", @"X-Apple-Invoke-Auth");
      if (v12
        && (v13 = (void *)v12,
            BOOL v14 = +[AMSMediaInvokeAuthenticationHandler isInvokeAuthenticationEnabled], v13, v14))
      {
        v15 = +[AMSMediaInvokeAuthenticationCoordinator sharedInstance];
        uint64_t v16 = [(AMSOptional *)v15 performAuthFromResponse:*(void *)(a1 + 40) taskInfo:v5];
      }
      else
      {
        if ([(AMSOptional *)v6 statusCode] == 401 || [(AMSOptional *)v6 statusCode] == 403)
        {
          v17 = [*(id *)(a1 + 48) tokenService];
          [v17 invalidateMediaToken];

          v15 = +[AMSURLAction retryAction];
          v18 = +[AMSOptional optionalWithValue:v15];
          v7 = +[AMSPromise promiseWithResult:v18];

LABEL_15:
          goto LABEL_16;
        }
        v15 = [[AMSOptional alloc] initWithValue:0];
        uint64_t v16 = +[AMSPromise promiseWithResult:v15];
      }
      v7 = (void *)v16;
      goto LABEL_15;
    }
  }
  v6 = [[AMSOptional alloc] initWithValue:v3];
  v7 = +[AMSPromise promiseWithResult:v6];
LABEL_16:

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke_2;
  v19[3] = &unk_1E55A3B00;
  id v20 = *(id *)(a1 + 56);
  [v7 addFinishBlock:v19];
}

- (void)handleResponse:(id)a3 task:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__AMSMediaProtocolHandler_handleResponse_task_completionHandler___block_invoke;
  v15[3] = &unk_1E55A3B28;
  id v16 = v9;
  id v17 = v8;
  v18 = self;
  id v19 = v10;
  v14.receiver = self;
  v14.super_class = (Class)AMSMediaProtocolHandler;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(AMSURLProtocolHandler *)&v14 handleResponse:v12 task:v13 completionHandler:v15];
}

- (AMSMediaTokenServiceProtocol)tokenService
{
  return self->_tokenService;
}

- (AMSMediaProtocolHandler)initWithTokenService:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6)
  {
    BOOL v7 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v8 = +[AMSLogConfig sharedMediaConfig];
    id v9 = (void *)v8;
    if (v7)
    {
      if (!v8)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      id v10 = [v9 OSLogObject];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = AMSLogKey();
        id v12 = NSString;
        objc_opt_class();
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
        v15 = };
        *(_DWORD *)buf = 138543362;
        v27 = v15;
        _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_ERROR, "%{public}@Expected a token service to be provided. The initialized instance will be unable to fetch media tokens.", buf, 0xCu);
        if (v11)
        {

          v15 = (void *)v3;
        }
      }
      id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v16 = +[AMSLogConfig sharedMediaConfig];
      [v9 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v16 userInfo:0];
    }
    else
    {
      if (!v8)
      {
        id v9 = +[AMSLogConfig sharedConfig];
      }
      id v16 = [v9 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        id v17 = AMSLogKey();
        v18 = NSString;
        objc_opt_class();
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
        v21 = };
        *(_DWORD *)buf = 138543362;
        v27 = v21;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_FAULT, "%{public}@Expected a token service to be provided. The initialized instance will be unable to fetch media tokens.", buf, 0xCu);
        if (v17)
        {

          v21 = (void *)v3;
        }
      }
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)AMSMediaProtocolHandler;
  v22 = [(AMSURLProtocolHandler *)&v25 init];
  v23 = v22;
  if (v22) {
    objc_storeStrong((id *)&v22->_tokenService, a3);
  }

  return v23;
}

- (void).cxx_destruct
{
}

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke;
  v15[3] = &unk_1E55A3B78;
  id v16 = v10;
  id v17 = self;
  id v18 = v11;
  v14.receiver = self;
  v14.super_class = (Class)AMSMediaProtocolHandler;
  id v12 = v11;
  id v13 = v10;
  [(AMSURLProtocolHandler *)&v14 reconfigureNewRequest:a3 originalTask:v13 redirect:v7 completionHandler:v15];
}

void __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[AMSURLTaskInfo taskInfoForTask:*(void *)(a1 + 32)];
  BOOL v7 = +[AMSPromise promiseWithResult:v5];
  if (!a3)
  {
    uint64_t v8 = [v6 properties];
    id v9 = [v8 userInfo];
    id v10 = [v9 objectForKeyedSubscript:0x1EDCB9308];

    if (v10)
    {
      id v11 = [*(id *)(a1 + 40) tokenService];

      if (v11)
      {
        id v12 = [*(id *)(a1 + 40) tokenService];
        id v13 = [v12 fetchMediaToken];
        objc_super v14 = [v13 promiseWithTimeout:30.0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2;
        v20[3] = &unk_1E55A3B50;
        id v15 = v6;
        uint64_t v16 = *(void *)(a1 + 40);
        id v21 = v15;
        uint64_t v22 = v16;
        id v23 = v5;
        uint64_t v17 = [v14 continueWithBlock:v20];

        BOOL v7 = (void *)v17;
      }
      else
      {
        id v18 = AMSError(0, @"Could not fetch media token", @"No token service was available", 0);
        uint64_t v19 = +[AMSPromise promiseWithError:v18];

        BOOL v7 = (void *)v19;
      }
    }
  }
  [v7 addFinishBlock:*(void *)(a1 + 48)];
}

id __89__AMSMediaProtocolHandler_reconfigureNewRequest_originalTask_redirect_completionHandler___block_invoke_2(id *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a2)
  {
    BOOL v7 = [a2 tokenString];
    uint64_t v8 = [@"Bearer " stringByAppendingString:v7];

    id v9 = (void *)[a1[6] mutableCopy];
    [v9 setValue:v8 forHTTPHeaderField:0x1EDCB9CC8];
    id v10 = +[AMSPromise promiseWithResult:v9];
  }
  else
  {
    id v11 = +[AMSLogConfig sharedMediaConfig];
    if (!v11)
    {
      id v11 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [a1[4] properties];
      objc_super v14 = [v13 logUUID];
      id v15 = NSString;
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = v16;
      if (v14)
      {
        a1 = [a1[4] properties];
        uint64_t v3 = [a1 logUUID];
        [v15 stringWithFormat:@"%@: [%@] ", v17, v3];
      }
      else
      {
        [v15 stringWithFormat:@"%@: ", v16];
      id v18 = };
      *(_DWORD *)buf = 138543618;
      id v21 = v18;
      __int16 v22 = 2048;
      uint64_t v23 = [v6 code];
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@We weren't provided a media token. Error code: %ld.", buf, 0x16u);
      if (v14)
      {

        id v18 = a1;
      }
    }
    id v10 = +[AMSPromise promiseWithError:v6];
  }

  return v10;
}

@end