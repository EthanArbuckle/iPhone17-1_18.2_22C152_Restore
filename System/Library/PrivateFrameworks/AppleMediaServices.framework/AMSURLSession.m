@interface AMSURLSession
+ (AKAppleIDSession)sharedAuthKitSession;
+ (AMSURLSession)loggingOnlySession;
+ (AMSURLSession)minimalSession;
+ (id)_taskFromSession:(id)a3 request:(id)a4 activity:(id)a5;
+ (id)defaultSession;
+ (id)imageSession;
+ (id)loggingOnlySessionUsing:(id)a3;
+ (id)minimalSessionUsing:(id)a3;
- (AMSRequestEncoding)requestEncoder;
- (AMSResponseDecoding)responseDecoder;
- (AMSURLDelegateProxy)delegateProxy;
- (AMSURLHandling)protocolHandler;
- (AMSURLSecurityPolicy)securityPolicy;
- (AMSURLSession)init;
- (AMSURLSession)initWithConfiguration:(id)a3;
- (AMSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5;
- (BOOL)_protocolHandler:(id)a3 canUseAlternateImplementationOfSelector:(SEL)a4;
- (BOOL)invalidated;
- (BOOL)useFallbackBag;
- (NSOperationQueue)delegateQueue;
- (NSURLSession)session;
- (NSURLSessionConfiguration)configuration;
- (NSURLSessionDelegate)delegate;
- (id)_createSharedDataForTask:(id)a3 properties:(id)a4 completionHandler:(id)a5;
- (id)_formatError:(id)a3 task:(id)a4 decodedObject:(id)a5;
- (id)_handleURLAction:(id)a3 task:(id)a4 contiguousActionIdentifier:(unint64_t)a5;
- (id)_prepareRequest:(id)a3 logUUID:(id)a4;
- (id)_reconfigureNewRequest:(id)a3 originalTask:(id)a4 protocolHandler:(id)a5 redirect:(BOOL)a6;
- (id)_retryTask:(id)a3 action:(id)a4;
- (id)dataTaskPromiseWithRequest:(id)a3;
- (id)dataTaskPromiseWithRequest:(id)a3 activity:(id)a4;
- (id)dataTaskPromiseWithRequestPromise:(id)a3;
- (id)dataTaskPromiseWithRequestPromise:(id)a3 activity:(id)a4;
- (id)dataTaskWithRequest:(id)a3;
- (id)dataTaskWithRequest:(id)a3 activity:(id)a4 completionHandler:(id)a5;
- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4;
- (id)dataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6;
- (id)dataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_completeTaskWithTaskInfo:(id)a3 result:(id)a4 decodedObject:(id)a5 error:(id)a6;
- (void)createDataTaskWithRequest:(id)a3 activity:(id)a4 dataTaskCreationCompletionHandler:(id)a5 requestCompletionHandler:(id)a6;
- (void)createDataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 activity:(id)a5 dataTaskCreationCompletionHandler:(id)a6 requestCompletionHandler:(id)a7;
- (void)dealloc;
- (void)finishTasksAndInvalidate;
- (void)invalidateAndCancel;
- (void)setDelegate:(id)a3;
- (void)setDelegateProxy:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setProtocolHandler:(id)a3;
- (void)setRequestEncoder:(id)a3;
- (void)setResponseDecoder:(id)a3;
- (void)setSecurityPolicy:(id)a3;
- (void)setUseFallbackBag:(BOOL)a3;
@end

@implementation AMSURLSession

AMSMutablePromise *__74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3_138(void *a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 first];
  uint64_t v5 = [v4 integerValue];

  v6 = [v3 second];

  v7 = objc_alloc_init(AMSMutablePromise);
  v8 = (void *)a1[4];
  uint64_t v9 = a1[7];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4_139;
  v17[3] = &unk_1E55A7CA8;
  id v18 = v8;
  id v19 = v6;
  v10 = (void *)a1[6];
  uint64_t v20 = a1[5];
  uint64_t v11 = a1[8];
  uint64_t v23 = v5;
  uint64_t v24 = v11;
  id v21 = v10;
  v12 = v7;
  v22 = v12;
  id v13 = v6;
  [v18 continueContiguousAsyncActionWithIdentifier:v9 block:v17];
  v14 = v22;
  v15 = v12;

  return v15;
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_141(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_142;
  v15[3] = &unk_1E55A7D20;
  id v16 = v5;
  id v17 = v6;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 40);
  uint64_t v21 = v7;
  id v20 = v10;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  id v19 = v11;
  uint64_t v22 = v12;
  id v13 = v6;
  id v14 = v5;
  [v9 continueContiguousAsyncActionWithIdentifier:v8 block:v15];
}

AMSMutablePromise *__66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init(AMSMutablePromise);
  uint64_t v6 = *(void *)(a1 + 64);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke_2;
  v15[3] = &unk_1E55A7DC0;
  id v16 = v4;
  uint64_t v7 = *(void **)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 72);
  id v18 = v8;
  uint64_t v22 = v9;
  id v19 = *(id *)(a1 + 56);
  id v20 = *(id *)(a1 + 32);
  v10 = v5;
  uint64_t v21 = v10;
  id v11 = v4;
  [v7 continueContiguousAsyncActionWithIdentifier:v6 block:v15];
  uint64_t v12 = v21;
  id v13 = v10;

  return v13;
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_6;
  v15[3] = &unk_1E55A4830;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v9 = *(void **)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  id v16 = v5;
  uint64_t v17 = v7;
  id v18 = v6;
  id v19 = v9;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 56);
  id v20 = v11;
  uint64_t v21 = v12;
  id v13 = v6;
  id v14 = v5;
  [v8 continueContiguousAsyncActionWithIdentifier:v10 block:v15];
}

AMSMutablePromise *__54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_182(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 64);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_183;
  v13[3] = &unk_1E55A7DC0;
  id v14 = v3;
  id v15 = v5;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  uint64_t v7 = v4;
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v18 = v7;
  uint64_t v19 = v8;
  uint64_t v20 = v9;
  id v10 = v3;
  [v15 continueContiguousAsyncActionWithIdentifier:v6 block:v13];
  id v11 = v7;

  return v11;
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_3_187(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_4;
  v8[3] = &unk_1E55A2258;
  int8x16_t v7 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v7.i64[0];
  int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v6 = v3;
  [v5 continueContiguousAsyncActionWithIdentifier:v4 block:v8];
}

- (void)setResponseDecoder:(id)a3
{
  uint64_t v4 = (AMSResponseDecoding *)a3;
  os_unfair_lock_lock_with_options();
  responseDecoder = self->_responseDecoder;
  self->_responseDecoder = v4;

  os_unfair_lock_unlock(&self->_propertiesLock);
}

- (void)setUseFallbackBag:(BOOL)a3
{
  self->_useFallbackBag = a3;
}

- (void)setRequestEncoder:(id)a3
{
  uint64_t v4 = (AMSRequestEncoding *)a3;
  os_unfair_lock_lock_with_options();
  requestEncoder = self->_requestEncoder;
  self->_requestEncoder = v4;

  os_unfair_lock_unlock(&self->_propertiesLock);
}

+ (AKAppleIDSession)sharedAuthKitSession
{
  if (qword_1EB38E090 != -1) {
    dispatch_once(&qword_1EB38E090, &__block_literal_global_17_3);
  }
  v2 = (void *)qword_1EB38E098;
  return (AKAppleIDSession *)v2;
}

void __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) properties];
  id v5 = [v4 logUUID];
  id v6 = AMSSetLogKey(v5);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_3;
  aBlock[3] = &unk_1E55A7FF0;
  id v20 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  uint64_t v26 = a2;
  uint64_t v8 = *(void *)(a1 + 48);
  int8x16_t v9 = *(void **)(a1 + 56);
  id v21 = v7;
  uint64_t v22 = v8;
  id v23 = v9;
  id v24 = *(id *)(a1 + 80);
  id v25 = *(id *)(a1 + 88);
  id v10 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  int v11 = [*(id *)(a1 + 48) _protocolHandler:*(void *)(a1 + 64) canUseAlternateImplementationOfSelector:sel_didCreateTask_fromRequest_error_];
  uint64_t v12 = *(void *)(a1 + 40);
  id v13 = *(void **)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 72);
  if (v11)
  {
    [v13 didCreateTask:v12 fromRequest:v14 completionHandler:v10];
  }
  else
  {
    id v18 = 0;
    [v13 didCreateTask:v12 fromRequest:v14 error:&v18];
    id v15 = v18;
    if (v15)
    {
      uint64_t v16 = 0;
      id v17 = v15;
    }
    else
    {
      uint64_t v16 = 1;
      id v17 = 0;
    }
    ((void (**)(void *, uint64_t, id))v10)[2](v10, v16, v17);
  }
}

uint64_t __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_6(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    BOOL v3 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
    id v5 = (void *)v4;
    if (v3)
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      id v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        id v7 = AMSLogKey();
        uint64_t v8 = NSString;
        uint64_t v9 = objc_opt_class();
        uint64_t v10 = v9;
        if (v7)
        {
          uint64_t v1 = AMSLogKey();
          [v8 stringWithFormat:@"%@: [%@] ", v10, v1];
        }
        else
        {
          [v8 stringWithFormat:@"%@: ", v9];
        int v11 = };
        id v18 = AMSLogableError(*(void **)(a1 + 48));
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v11;
        __int16 v23 = 2114;
        id v24 = v18;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when handling completed task. error = %{public}@", buf, 0x16u);
        if (v7)
        {

          int v11 = (void *)v1;
        }
      }
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v12 = +[AMSLogConfig sharedURLLoadingConfig];
      [v5 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v12 userInfo:0];
    }
    else
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v12 = [v5 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        id v13 = AMSLogKey();
        uint64_t v14 = NSString;
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = v15;
        if (v13)
        {
          uint64_t v1 = AMSLogKey();
          [v14 stringWithFormat:@"%@: [%@] ", v16, v1];
        }
        else
        {
          [v14 stringWithFormat:@"%@: ", v15];
        id v17 = };
        uint64_t v19 = AMSLogableError(*(void **)(a1 + 48));
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v17;
        __int16 v23 = 2114;
        id v24 = v19;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when handling completed task. error = %{public}@", buf, 0x16u);
        if (v13)
        {

          id v17 = (void *)v1;
        }
      }
    }
  }
  +[AMSURLTaskInfo removeTaskInfoForTask:*(void *)(a1 + 56)];
  return [*(id *)(a1 + 64) finishContiguousAsyncActionWithIdentifier:*(void *)(a1 + 72)];
}

uint64_t __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) properties];
  BOOL v3 = [v2 logUUID];
  id v4 = AMSSetLogKey(v3);

  id v5 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v5)
  {
    id v5 = +[AMSLogConfig sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = [*(id *)(a1 + 48) logUUID];
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = [*(id *)(a1 + 40) session];
    int v14 = 138544130;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 2114;
    uint64_t v19 = v9;
    __int16 v20 = 2114;
    id v21 = v10;
    _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task created: %{public}@ Session: %{public}@", (uint8_t *)&v14, 0x2Au);
  }
  if (*(void *)(a1 + 64) && (uint64_t v11 = *(void *)(a1 + 72)) != 0)
  {
    (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
  }
  else if (*(unsigned char *)(a1 + 96))
  {
    uint64_t v12 = *(void *)(a1 + 80);
    if (v12) {
      (*(void (**)(uint64_t, void))(v12 + 16))(v12, *(void *)(a1 + 56));
    }
  }
  return [*(id *)(a1 + 32) finishContiguousAsyncActionWithIdentifier:*(void *)(a1 + 88)];
}

void __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    id v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 32) session];
    uint64_t v8 = [v6 _taskFromSession:v7 request:v5 activity:*(void *)(a1 + 40)];

    uint64_t v9 = [*(id *)(a1 + 32) _createSharedDataForTask:v8 properties:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 64)];
    [v9 setSignpostID:*(void *)(a1 + 80)];
    if (*(void *)(a1 + 56))
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_2;
      v12[3] = &unk_1E55A8018;
      id v13 = v9;
      id v10 = v8;
      uint64_t v11 = *(void *)(a1 + 32);
      id v14 = v10;
      uint64_t v15 = v11;
      id v16 = *(id *)(a1 + 48);
      id v19 = *(id *)(a1 + 64);
      id v20 = *(id *)(a1 + 72);
      id v17 = *(id *)(a1 + 56);
      id v18 = v5;
      [v13 startContiguousAsyncActionWithInitialBlock:v12];
    }
  }
}

- (NSURLSession)session
{
  return self->_session;
}

+ (id)defaultSession
{
  if (_MergedGlobals_154 != -1) {
    dispatch_once(&_MergedGlobals_154, &__block_literal_global_137);
  }
  v2 = (void *)qword_1EB38E078;
  return v2;
}

- (id)_createSharedDataForTask:(id)a3 properties:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[AMSURLTaskInfo createTaskInfoForTask:a3];
  [v10 setCompletionBlock:v8];

  [v10 setProperties:v9];
  [v10 setSession:self];
  return v10;
}

+ (id)_taskFromSession:(id)a3 request:(id)a4 activity:(id)a5
{
  id v7 = a5;
  id v8 = [a3 dataTaskWithRequest:a4];
  id v9 = v8;
  if (v7) {
    objc_msgSend(v8, "set_nw_activity:", v7);
  }

  return v9;
}

void __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 resume];
  id v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_2;
  v6[3] = &unk_1E559F028;
  id v7 = v3;
  id v5 = v3;
  [v4 addErrorBlock:v6];
}

void __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_207;
    v25[3] = &unk_1E55A1B00;
    id v26 = v3;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_3;
    v23[3] = &unk_1E55A0F50;
    id v24 = v26;
    [WeakRetained createDataTaskWithRequest:v5 signpostID:0 activity:v6 dataTaskCreationCompletionHandler:v25 requestCompletionHandler:v23];

    id v7 = v26;
  }
  else
  {
    BOOL v8 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v9 = +[AMSLogConfig sharedURLLoadingConfig];
    id v10 = (void *)v9;
    if (v8)
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v11 = [v10 OSLogObject];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = objc_opt_class();
        id v13 = v12;
        id v14 = AMSLogKey();
        uint64_t v15 = [*(id *)(a1 + 32) URL];
        id v16 = AMSHashIfNeeded(v15);
        *(_DWORD *)buf = 138543874;
        v28 = v12;
        __int16 v29 = 2114;
        v30 = v14;
        __int16 v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] The AMSURLSession used to create this AMSLazyPromise is unexpectedly deallocated. No network request will be attempted. url = %{public}@", buf, 0x20u);
      }
      id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v17 = +[AMSLogConfig sharedURLLoadingConfig];
      [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v17 userInfo:0];
    }
    else
    {
      if (!v9)
      {
        id v10 = +[AMSLogConfig sharedConfig];
      }
      id v17 = [v10 OSLogObject];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        id v18 = objc_opt_class();
        id v19 = v18;
        id v20 = AMSLogKey();
        id v21 = [*(id *)(a1 + 32) URL];
        uint64_t v22 = AMSHashIfNeeded(v21);
        *(_DWORD *)buf = 138543874;
        v28 = v18;
        __int16 v29 = 2114;
        v30 = v20;
        __int16 v31 = 2114;
        v32 = v22;
        _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] The AMSURLSession used to create this AMSLazyPromise is unexpectedly deallocated. No network request will be attempted. url = %{public}@", buf, 0x20u);
      }
    }

    AMSError(0, @"AMSURLSession deallocated prematurely", @"The owning AMSURLSession instance was deallocated before running this associated AMSLazyPromise.", 0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v3 finishWithError:v7];
  }
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) properties];
  id v7 = [v6 logUUID];
  id v8 = AMSSetLogKey(v7);

  uint64_t v9 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [*(id *)(a1 + 32) properties];
    id v13 = [v12 logUUID];
    [*(id *)(a1 + 48) originalRequest];
    v15 = id v14 = v5;
    id v16 = AMSLogableURLRequest((uint64_t)v15);
    *(_DWORD *)buf = 138543874;
    uint64_t v79 = v11;
    __int16 v80 = 2114;
    v81 = v13;
    __int16 v82 = 2114;
    v83 = v16;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task finished loading for URL request %{public}@", buf, 0x20u);

    id v5 = v14;
  }

  id v17 = [*(id *)(a1 + 32) error];
  id v18 = v17;
  if (!v17) {
    id v18 = *(void **)(a1 + 56);
  }
  id v19 = v18;

  id v20 = [*(id *)(a1 + 40) protocolHandler];
  id v21 = objc_alloc_init(AMSMutablePromise);
  if (!v19 && v20 && [v5 length])
  {
    if ([*(id *)(a1 + 40) _protocolHandler:v20 canUseAlternateImplementationOfSelector:sel_decodeMutableData_task_error_]&& objc_msgSend(*(id *)(a1 + 40), "_protocolHandler:canUseAlternateImplementationOfSelector:", v20, sel_decodeData_task_error_))
    {
      uint64_t v22 = [*(id *)(a1 + 40) protocolHandler];
      uint64_t v23 = *(void *)(a1 + 48);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_165;
      v74[3] = &unk_1E55A7E88;
      v75 = (AMSMutablePromise *)*(id *)(a1 + 32);
      uint64_t v77 = a2;
      v76 = v21;
      [v22 decodeMutableData:v5 task:v23 completionHandler:v74];

      id v24 = v75;
    }
    else
    {
      id v57 = v5;
      id v26 = [*(id *)(a1 + 40) protocolHandler];
      char v27 = objc_opt_respondsToSelector();

      v28 = [*(id *)(a1 + 40) protocolHandler];
      __int16 v29 = v28;
      uint64_t v30 = *(void *)(a1 + 48);
      if (v27)
      {
        uint64_t v73 = 0;
        __int16 v31 = (id *)&v73;
        uint64_t v32 = [v28 decodeMutableData:v57 task:v30 error:&v73];
      }
      else
      {
        uint64_t v72 = 0;
        __int16 v31 = (id *)&v72;
        uint64_t v32 = [v28 decodeData:v57 task:v30 error:&v72];
      }
      uint64_t v33 = (void *)v32;
      id v34 = *v31;

      if (v34 || !v33)
      {
        if (v34)
        {
          v35 = [NSString stringWithFormat:@". Error: %@", v34];
        }
        else
        {
          v35 = &stru_1EDCA7308;
        }
        v36 = +[AMSLogConfig sharedURLLoadingConfig];
        if (!v36)
        {
          v36 = +[AMSLogConfig sharedConfig];
        }
        v55 = v36;
        log = [v36 OSLogObject];
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          v54 = v35;
          v52 = [*(id *)(a1 + 32) properties];
          v37 = [v52 logUUID];
          v51 = NSString;
          uint64_t v38 = objc_opt_class();
          uint64_t v39 = v38;
          v53 = v37;
          if (v37)
          {
            v37 = [*(id *)(a1 + 32) properties];
            v50 = [v37 logUUID];
            [v51 stringWithFormat:@"%@: [%@] ", v39, v50];
          }
          else
          {
            [v51 stringWithFormat:@"%@: ", v38];
          v40 = };
          *(_DWORD *)buf = 138543618;
          uint64_t v79 = (uint64_t)v40;
          __int16 v80 = 2114;
          v81 = v54;
          _os_log_impl(&dword_18D554000, log, OS_LOG_TYPE_DEFAULT, "%{public}@Protocol skipping data decoding%{public}@", buf, 0x16u);
          if (v53)
          {

            v40 = v37;
          }

          v35 = v54;
        }

        uint64_t v33 = 0;
      }
      v41 = *(void **)(a1 + 32);
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_174;
      v68[3] = &unk_1E55A22D0;
      id v69 = v34;
      id v70 = v33;
      v71 = v21;
      id v24 = v33;
      id v42 = v34;
      [v41 continueContiguousAsyncActionWithIdentifier:a2 block:v68];

      id v5 = v57;
    }
  }
  else
  {
    uint64_t v25 = *(void **)(a1 + 32);
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_176;
    v66[3] = &unk_1E559EA90;
    v67 = v21;
    [v25 continueContiguousAsyncActionWithIdentifier:a2 block:v66];
    id v24 = v67;
  }

  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_3;
  v58[3] = &unk_1E55A7F78;
  id v43 = *(id *)(a1 + 32);
  uint64_t v44 = *(void *)(a1 + 40);
  v45 = *(void **)(a1 + 48);
  id v59 = v43;
  uint64_t v60 = v44;
  id v46 = v45;
  uint64_t v47 = *(void *)(a1 + 64);
  uint64_t v64 = a2;
  uint64_t v65 = v47;
  id v61 = v46;
  id v62 = v19;
  id v63 = v20;
  id v48 = v20;
  id v49 = v19;
  [(AMSPromise *)v21 addFinishBlock:v58];
}

- (BOOL)_protocolHandler:(id)a3 canUseAlternateImplementationOfSelector:(SEL)a4
{
  id v5 = a3;
  if (v5)
  {
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      uint64_t v6 = objc_opt_class();
      BOOL v7 = +[AMSMethodImplementationCache implementationsOf:a4 areEqualIn:v6 and:objc_opt_class()];
    }
    else
    {
      BOOL v7 = 1;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_prepareRequest:(id)a3 logUUID:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v9)
  {
    uint64_t v9 = +[AMSLogConfig sharedConfig];
  }
  id v10 = [v9 OSLogObject];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    id v12 = v11;
    id v13 = AMSLogableURLRequest((uint64_t)v8);
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = (uint64_t)v11;
    __int16 v32 = 2114;
    id v33 = v7;
    __int16 v34 = 2114;
    v35 = v13;
    _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Preparing request: %{public}@", buf, 0x20u);
  }
  if ([(AMSURLSession *)self invalidated])
  {
    id v14 = AMSError(6, @"Task Failed", @"Session has been invalidated", 0);
    if (v8) {
      goto LABEL_7;
    }
LABEL_11:
    id v17 = @"Request is nil";
    goto LABEL_13;
  }
  id v14 = 0;
  if (!v8) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v15 = [v8 URL];

  if (!v15)
  {
    id v17 = @"Request URL is nil";
LABEL_13:
    uint64_t v18 = AMSError(2, @"Task Failed", v17, 0);

    id v14 = (void *)v18;
    if (v18) {
      goto LABEL_9;
    }
    goto LABEL_14;
  }
  if (v14)
  {
LABEL_9:
    id v16 = +[AMSPromise promiseWithError:v14];
    goto LABEL_23;
  }
LABEL_14:
  id v19 = [(AMSURLSession *)self requestEncoder];

  if (v19)
  {
    id v20 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v20)
    {
      id v20 = +[AMSLogConfig sharedConfig];
    }
    id v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = AMSLogableURLRequest((uint64_t)v8);
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v22;
      __int16 v32 = 2114;
      id v33 = v7;
      __int16 v34 = 2114;
      v35 = v23;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request encoder will encode request %{public}@", buf, 0x20u);
    }
    id v24 = [(AMSURLSession *)self requestEncoder];
    id v16 = [v24 requestByEncodingRequest:v8 parameters:0];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __41__AMSURLSession__prepareRequest_logUUID___block_invoke;
    v28[3] = &unk_1E559E7E8;
    v28[4] = self;
    id v29 = v7;
    [v16 addErrorBlock:v28];
  }
  else
  {
    id v16 = +[AMSPromise promiseWithResult:v8];
  }
  if (os_variant_has_internal_content())
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __41__AMSURLSession__prepareRequest_logUUID___block_invoke_261;
    v26[3] = &unk_1E55A7D98;
    v26[4] = self;
    id v27 = v7;
    [v16 addSuccessBlock:v26];
  }
LABEL_23:

  return v16;
}

- (AMSRequestEncoding)requestEncoder
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_requestEncoder;
  os_unfair_lock_unlock(p_propertiesLock);
  return v4;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) properties];
  id v5 = [v4 logUUID];
  id v6 = AMSSetLogKey(v5);

  [*(id *)(v3 + 32) setResponse:*(void *)(v3 + 40)];
  id v7 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  id v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    id v10 = [*(id *)(v3 + 32) properties];
    uint64_t v11 = [v10 logUUID];
    *(_DWORD *)buf = 138543618;
    uint64_t v72 = v9;
    __int16 v73 = 2114;
    v74 = v11;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task received response", buf, 0x16u);
  }
  if (os_variant_has_internal_content())
  {
    id v12 = +[AMSLogConfig sharedConfigOversize];
    if (!v12)
    {
      id v12 = +[AMSLogConfig sharedConfig];
    }
    id v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = [*(id *)(v3 + 32) properties];
      id v16 = [v15 logUUID];
      id v17 = objc_msgSend(*(id *)(v3 + 40), "ams_allHeaderFields");
      *(_DWORD *)buf = 138543874;
      uint64_t v72 = v14;
      __int16 v73 = 2114;
      v74 = v16;
      __int16 v75 = 2114;
      v76 = v17;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Response headers: %{public}@", buf, 0x20u);
    }
  }
  uint64_t v18 = [*(id *)(v3 + 48) protocolHandler];

  if (v18)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_24;
    aBlock[3] = &unk_1E55A7BB8;
    id v19 = *(void **)(v3 + 56);
    void aBlock[4] = *(void *)(v3 + 48);
    id v67 = v19;
    id v21 = *(void **)(v3 + 64);
    uint64_t v20 = *(void *)(v3 + 72);
    uint64_t v69 = a2;
    uint64_t v70 = v20;
    id v68 = v21;
    uint64_t v22 = _Block_copy(aBlock);
    uint64_t v23 = [*(id *)(v3 + 48) protocolHandler];
    char v24 = objc_opt_respondsToSelector();

    uint64_t v25 = [*(id *)(v3 + 48) protocolHandler];
    if (v24)
    {
      uint64_t v26 = *(void *)(v3 + 56);
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_47;
      v62[3] = &unk_1E55A7BE0;
      uint64_t v27 = *(void *)(v3 + 40);
      id v63 = *(id *)(v3 + 32);
      uint64_t v65 = a2;
      id v64 = v22;
      [v25 handleResponse:v27 task:v26 completionHandler:v62];

      v28 = v63;
    }
    else
    {
      char v31 = objc_opt_respondsToSelector();

      if (v31)
      {
        __int16 v32 = +[AMSLogConfig sharedURLLoadingConfig];
        if (!v32)
        {
          __int16 v32 = +[AMSLogConfig sharedConfig];
        }
        id v33 = [v32 OSLogObject];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v34 = AMSLogKey();
          v35 = NSString;
          uint64_t v36 = objc_opt_class();
          if (v34)
          {
            v37 = AMSLogKey();
            uint64_t v61 = NSStringFromSelector(*(SEL *)(v3 + 72));
            [v35 stringWithFormat:@"%@: [%@] %@ ", v36, v37, v61];
          }
          else
          {
            v37 = NSStringFromSelector(*(SEL *)(v3 + 72));
            [v35 stringWithFormat:@"%@: %@ ", v36, v37];
          uint64_t v38 = };
          v54 = NSStringFromSelector(sel_handleResponse_task_);
          v55 = NSStringFromSelector(sel_handleResponse_task_completionHandler_);
          *(_DWORD *)buf = 138543874;
          uint64_t v72 = (uint64_t)v38;
          __int16 v73 = 2114;
          v74 = v54;
          __int16 v75 = 2114;
          v76 = v55;
          _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@ is deprecated. Use %{public}@ instead.", buf, 0x20u);
          if (v34)
          {

            uint64_t v38 = (void *)v61;
          }
        }
        v56 = [*(id *)(v3 + 48) protocolHandler];
        v28 = [v56 handleResponse:*(void *)(v3 + 40) task:*(void *)(v3 + 56)];
      }
      else
      {
        BOOL v39 = +[AMSUnitTests isRunningUnitTests];
        uint64_t v40 = +[AMSLogConfig sharedURLLoadingConfig];
        v41 = (void *)v40;
        if (v39)
        {
          if (!v40)
          {
            v41 = +[AMSLogConfig sharedConfig];
          }
          id v42 = [v41 OSLogObject];
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            id v43 = AMSLogKey();
            uint64_t v44 = NSString;
            uint64_t v45 = objc_opt_class();
            if (v43)
            {
              id v46 = AMSLogKey();
              uint64_t v3 = NSStringFromSelector(*(SEL *)(v3 + 72));
              [v44 stringWithFormat:@"%@: [%@] %@ ", v45, v46, v3];
            }
            else
            {
              id v46 = NSStringFromSelector(*(SEL *)(v3 + 72));
              [v44 stringWithFormat:@"%@: %@ ", v45, v46];
            uint64_t v47 = };
            id v57 = NSStringFromProtocol((Protocol *)&unk_1EDD03F40);
            v58 = NSStringFromSelector(sel_handleResponse_task_completionHandler_);
            *(_DWORD *)buf = 138543874;
            uint64_t v72 = (uint64_t)v47;
            __int16 v73 = 2114;
            v74 = v57;
            __int16 v75 = 2114;
            v76 = v58;
            _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_ERROR, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
            if (v43)
            {

              uint64_t v47 = (void *)v3;
            }
          }
          v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
          id v48 = +[AMSLogConfig sharedURLLoadingConfig];
          [v41 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v48 userInfo:0];
        }
        else
        {
          if (!v40)
          {
            v41 = +[AMSLogConfig sharedConfig];
          }
          id v48 = [v41 OSLogObject];
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            id v49 = AMSLogKey();
            v50 = NSString;
            uint64_t v51 = objc_opt_class();
            if (v49)
            {
              v52 = AMSLogKey();
              uint64_t v3 = NSStringFromSelector(*(SEL *)(v3 + 72));
              [v50 stringWithFormat:@"%@: [%@] %@ ", v51, v52, v3];
            }
            else
            {
              v52 = NSStringFromSelector(*(SEL *)(v3 + 72));
              [v50 stringWithFormat:@"%@: %@ ", v51, v52];
            v53 = };
            id v59 = NSStringFromProtocol((Protocol *)&unk_1EDD03F40);
            uint64_t v60 = NSStringFromSelector(sel_handleResponse_task_completionHandler_);
            *(_DWORD *)buf = 138543874;
            uint64_t v72 = (uint64_t)v53;
            __int16 v73 = 2114;
            v74 = v59;
            __int16 v75 = 2114;
            v76 = v60;
            _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_FAULT, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
            if (v49)
            {

              v53 = (void *)v3;
            }
          }
        }

        v28 = +[AMSURLAction proceedAction];
      }
      (*((void (**)(void *, void *))v22 + 2))(v22, v28);
    }
  }
  else
  {
    id v29 = *(void **)(v3 + 64);
    uint64_t v30 = [[AMSPair alloc] initWithFirst:&unk_1EDD018B8 second:0];
    [v29 finishWithResult:v30];
  }
}

- (AMSURLHandling)protocolHandler
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_protocolHandler;
  os_unfair_lock_unlock(p_propertiesLock);
  return v4;
}

void __41__AMSURLSession__prepareRequest_logUUID___block_invoke_261(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfigOversize];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v9 = [v3 allHTTPHeaderFields];
    id v10 = [v8 dictionaryWithDictionary:v9];
    int v11 = 138543874;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    id v16 = v10;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Request headers: %{public}@", (uint8_t *)&v11, 0x20u);
  }
}

void __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_216(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    id v5 = [*(id *)(a1 + 32) session];
    [v4 URLSession:v5 task:*(void *)(a1 + 40) didCompleteWithError:*(void *)(a1 + 48)];
  }
  id v6 = *(id *)(a1 + 48);
  if (v6
    || !*(void *)(a1 + 56)
    && (AMSError(0, @"Unknown Error", @"Request finished without a result.", 0),
        (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = [*(id *)(a1 + 32) _formatError:v6 task:*(void *)(a1 + 40) decodedObject:*(void *)(a1 + 64)];
  }
  else
  {
    id v8 = 0;
  }
  uint64_t v7 = [*(id *)(a1 + 72) completionBlock];
  ((void (**)(void, void, id))v7)[2](v7, *(void *)(a1 + 56), v8);
}

uint64_t __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(void **)(a1 + 32);
  if (a3) {
    return objc_msgSend(v3, "finishWithError:");
  }
  else {
    return [v3 finishWithResult:a2];
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AMSURLTaskInfo taskInfoForTask:v8];
  [v10 appendData:v9];
  int v11 = [(AMSURLSession *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    __int16 v13 = [(AMSURLSession *)self delegate];
    [v13 URLSession:v14 dataTask:v8 didReceiveData:v9];
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AMSURLTaskInfo taskInfoForTask:v8];
  [v10 setMetrics:v9];
  int v11 = [(AMSURLSession *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    __int16 v13 = [(AMSURLSession *)self delegate];
    [v13 URLSession:v14 task:v8 didFinishCollectingMetrics:v9];
  }
}

void __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_214(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  char v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 40) properties];
    id v6 = [v5 logUUID];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    int v11 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Recording HAR log.", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v7 = [[AMSHTTPArchiveTaskInfo alloc] initWithURLTaskInfo:*(void *)(a1 + 40)];
  +[AMSHTTPArchiveService recordTrafficWithTaskInfo:v7];
}

- (id)_handleURLAction:(id)a3 task:(id)a4 contiguousActionIdentifier:(unint64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  __int16 v10 = +[AMSURLTaskInfo taskInfoForTask:v9];
  [v10 assertIsOnPrivateQueue];
  uint64_t v11 = [v8 actionType];
  uint64_t v12 = [v8 error];
  if (v12) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = v11;
  }
  if (v13)
  {
    id v14 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v14)
    {
      id v14 = +[AMSLogConfig sharedConfig];
    }
    __int16 v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v29 = a5;
      uint64_t v16 = objc_opt_class();
      [v10 properties];
      uint64_t v17 = v28 = self;
      uint64_t v18 = [v17 logUUID];
      *(_DWORD *)buf = 138543874;
      uint64_t v38 = v16;
      a5 = v29;
      __int16 v39 = 2114;
      uint64_t v40 = v18;
      __int16 v41 = 2114;
      id v42 = v8;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Handling URL action: %{public}@", buf, 0x20u);

      self = v28;
    }

    id v19 = +[AMSBinaryPromise promiseWithSuccess];
    if ((unint64_t)(v13 - 1) >= 2)
    {
      if (v13 == 3) {
        [v9 cancel];
      }
    }
    else
    {
      uint64_t v20 = [(AMSURLSession *)self _retryTask:v9 action:v8];

      id v19 = (void *)v20;
    }
  }
  else
  {
    id v19 = +[AMSBinaryPromise promiseWithSuccess];
  }
  id v21 = [v19 promiseAdapter];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke;
  v30[3] = &unk_1E55A80B8;
  id v31 = v10;
  id v32 = v12;
  unint64_t v35 = a5;
  uint64_t v36 = v13;
  id v33 = v8;
  id v34 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v12;
  id v25 = v10;
  uint64_t v26 = [v21 continueWithBlock:v30];

  return v26;
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_180(uint64_t a1, void *a2)
{
  char v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 assertIsOnPrivateQueue];
  id v5 = [v4 value];

  id v6 = [*(id *)(a1 + 32) properties];
  uint64_t v7 = [v6 logUUID];

  if (v5)
  {
    id v8 = [*(id *)(a1 + 40) _handleURLAction:v5 task:*(void *)(a1 + 48) contiguousActionIdentifier:*(void *)(a1 + 80)];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_181;
    v33[3] = &unk_1E55A0BD8;
    id v9 = *(id *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 40);
    id v34 = v9;
    uint64_t v35 = v10;
    id v36 = v7;
    uint64_t v11 = [v8 thenWithBlock:v33];
  }
  else
  {
    uint64_t v12 = [AMSPair alloc];
    uint64_t v13 = [(AMSPair *)v12 initWithFirst:MEMORY[0x1E4F1CC38] second:*(void *)(a1 + 56)];
    uint64_t v11 = +[AMSPromise promiseWithResult:v13];
  }
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_182;
  v27[3] = &unk_1E55A7F00;
  id v14 = *(id *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 80);
  id v28 = v14;
  uint64_t v32 = v15;
  id v29 = *(id *)(a1 + 64);
  id v16 = *(id *)(a1 + 72);
  uint64_t v17 = *(void *)(a1 + 40);
  id v30 = v16;
  uint64_t v31 = v17;
  uint64_t v18 = [v11 thenWithBlock:v27];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_5;
  v22[3] = &unk_1E55A7F28;
  id v19 = *(id *)(a1 + 32);
  uint64_t v26 = *(void *)(a1 + 80);
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = *(void **)(a1 + 48);
  id v23 = v19;
  uint64_t v24 = v20;
  id v25 = v21;
  [v18 addFinishBlock:v22];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = buf;
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  [v7 assertIsOnPrivateQueue];
  id v9 = [v8 value];

  uint64_t v10 = off_1E559C000;
  if (v6)
  {
    uint64_t v11 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v12 = [v11 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v66 = v9;
    id v13 = v6;
    id v14 = [*(id *)(a1 + 32) properties];
    uint64_t v15 = [v14 logUUID];
    id v16 = NSString;
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = v17;
    if (v15)
    {
      id v5 = [*(id *)(a1 + 32) properties];
      uint64_t v10 = [v5 logUUID];
      [v16 stringWithFormat:@"%@: [%@] ", v18, v10];
    }
    else
    {
      [v16 stringWithFormat:@"%@: ", v17];
    id v19 = };
    *(_DWORD *)buf = 138543618;
    __int16 v80 = v19;
    __int16 v81 = 2114;
    __int16 v82 = v13;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Object decoding failed. Continuing request completion handling without object. error = %{public}@", buf, 0x16u);
    if (v15)
    {

      id v19 = v5;
    }

    id v6 = v13;
    goto LABEL_17;
  }
  if (v9) {
    goto LABEL_19;
  }
  uint64_t v11 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v11)
  {
    uint64_t v11 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v66 = 0;
    uint64_t v20 = [*(id *)(a1 + 32) properties];
    id v21 = [v20 logUUID];
    id v22 = NSString;
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = v23;
    if (v21)
    {
      id v9 = [*(id *)(a1 + 32) properties];
      uint64_t v10 = [v9 logUUID];
      [v22 stringWithFormat:@"%@: [%@] ", v24, v10];
    }
    else
    {
      [v22 stringWithFormat:@"%@: ", v23];
    id v25 = };
    *(_DWORD *)buf = 138543362;
    __int16 v80 = v25;
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@Object decoding produced no object. Continuing request completion handling without object.", buf, 0xCu);
    if (v21)
    {

      id v25 = v9;
    }

    id v6 = 0;
LABEL_17:
    id v9 = v66;
  }
LABEL_18:

LABEL_19:
  uint64_t v26 = [*(id *)(a1 + 40) protocolHandler];
  char v27 = objc_opt_respondsToSelector();

  id v28 = "PromiseEZNS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE";
  if (v27)
  {
    id v29 = objc_alloc_init(AMSMutablePromise);
    id v30 = [*(id *)(a1 + 40) protocolHandler];
    uint64_t v31 = *(void *)(a1 + 48);
    uint64_t v32 = [*(id *)(a1 + 32) metrics];
    v75[0] = MEMORY[0x1E4F143A8];
    v75[1] = 3221225472;
    v75[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_178;
    v75[3] = &unk_1E55A7EB0;
    id v33 = *(id *)(a1 + 32);
    uint64_t v34 = *(void *)(a1 + 72);
    id v76 = v33;
    uint64_t v78 = v34;
    uint64_t v35 = v29;
    uint64_t v77 = v35;
    [v30 handleCompletionWithTask:v31 metrics:v32 decodedObject:v9 completionHandler:v75];

    id v36 = v77;
    v37 = v35;

    uint64_t v38 = v37;
  }
  else
  {
    uint64_t v39 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v40 = +[AMSLogConfig sharedURLLoadingConfig];
    __int16 v41 = (void *)v40;
    if (v39)
    {
      if (!v40)
      {
        __int16 v41 = +[AMSLogConfig sharedConfig];
      }
      id v42 = [v41 OSLogObject];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        id v64 = v6;
        uint64_t v43 = AMSLogKey();
        uint64_t v44 = NSString;
        uint64_t v45 = objc_opt_class();
        if (v43)
        {
          id v46 = AMSLogKey();
          uint64_t v39 = NSStringFromSelector(*(SEL *)(a1 + 80));
          [v44 stringWithFormat:@"%@: [%@] %@ ", v45, v46, v39];
        }
        else
        {
          id v46 = NSStringFromSelector(*(SEL *)(a1 + 80));
          [v44 stringWithFormat:@"%@: %@ ", v45, v46];
        uint64_t v47 = };
        v54 = NSStringFromProtocol((Protocol *)&unk_1EDD03F40);
        v55 = NSStringFromSelector(sel_handleCompletionWithTask_metrics_decodedObject_completionHandler_);
        *(_DWORD *)buf = 138543874;
        __int16 v80 = v47;
        __int16 v81 = 2114;
        __int16 v82 = v54;
        __int16 v83 = 2114;
        uint64_t v84 = v55;
        _os_log_impl(&dword_18D554000, v42, OS_LOG_TYPE_ERROR, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
        if (v43)
        {

          uint64_t v47 = (void *)v39;
        }

        id v6 = v64;
        id v28 = "NSt3__120__shared_ptr_pointerIPN7AMSCore4TaskINS1_22ExecuteHTTPRequestTask6ResultENS1_9HTTPErrorEE7Promise"
              "EZNS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE"
            + 99;
      }

      __int16 v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v48 = +[AMSLogConfig sharedURLLoadingConfig];
      [v41 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v48 userInfo:0];
    }
    else
    {
      if (!v40)
      {
        __int16 v41 = +[AMSLogConfig sharedConfig];
      }
      id v48 = [v41 OSLogObject];
      if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
      {
        id v65 = v6;
        id v49 = AMSLogKey();
        v50 = NSString;
        uint64_t v51 = objc_opt_class();
        if (v49)
        {
          v52 = AMSLogKey();
          uint64_t v39 = NSStringFromSelector(*(SEL *)(a1 + 80));
          [v50 stringWithFormat:@"%@: [%@] %@ ", v51, v52, v39];
        }
        else
        {
          v52 = NSStringFromSelector(*(SEL *)(a1 + 80));
          [v50 stringWithFormat:@"%@: %@ ", v51, v52];
        v53 = };
        v56 = NSStringFromProtocol((Protocol *)&unk_1EDD03F40);
        id v57 = NSStringFromSelector(sel_handleCompletionWithTask_metrics_decodedObject_completionHandler_);
        *(_DWORD *)buf = 138543874;
        __int16 v80 = v53;
        __int16 v81 = 2114;
        __int16 v82 = v56;
        __int16 v83 = 2114;
        uint64_t v84 = v57;
        _os_log_impl(&dword_18D554000, v48, OS_LOG_TYPE_FAULT, "%{public}@%{public}@ is a required method on %{public}@ and must be implemented.", buf, 0x20u);
        if (v49)
        {

          v53 = (void *)v39;
        }

        id v6 = v65;
        id v28 = "PromiseEZNS7_17get_return_objectEvE13DetachPromiseNS_9allocatorIS7_EEEE";
      }
    }

    v37 = +[AMSOptional optionalWithNil];
    uint64_t v38 = +[AMSPromise promiseWithResult:v37];
  }

  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = *((void *)v28 + 293);
  v67[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_180;
  v67[3] = &unk_1E55A7F50;
  id v58 = *(id *)(a1 + 32);
  uint64_t v59 = *(void *)(a1 + 40);
  uint64_t v60 = *(void **)(a1 + 48);
  id v68 = v58;
  uint64_t v69 = v59;
  id v61 = v60;
  uint64_t v62 = *(void *)(a1 + 72);
  id v70 = v61;
  uint64_t v74 = v62;
  id v71 = *(id *)(a1 + 56);
  id v72 = *(id *)(a1 + 64);
  id v73 = v9;
  id v63 = v9;
  [v38 addSuccessBlock:v67];
}

- (NSURLSessionDelegate)delegate
{
  v2 = [(AMSURLSession *)self delegateProxy];
  char v3 = [v2 delegate];

  return (NSURLSessionDelegate *)v3;
}

- (AMSURLDelegateProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (void)_completeTaskWithTaskInfo:(id)a3 result:(id)a4 decodedObject:(id)a5 error:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v79 = a5;
  id v12 = a6;
  [v10 assertIsOnPrivateQueue];
  uint64_t v78 = [v10 task];
  +[AMSNetworkQualityInquiry updateLastConnectionReportWithTask:](AMSNetworkQualityInquiry, "updateLastConnectionReportWithTask:");
  id v13 = [(AMSURLSession *)self responseDecoder];
  id v14 = v13;
  __int16 v80 = self;
  if (!v12 && v13)
  {
    id v92 = 0;
    uint64_t v15 = [v13 resultFromResult:v11 error:&v92];
    id v16 = v92;

    if (v16 || !v15)
    {
      uint64_t v17 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v17)
      {
        uint64_t v17 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v18 = [v17 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = [v10 properties];
        id v21 = [v20 logUUID];
        id v22 = AMSLogableError(v16);
        *(_DWORD *)buf = 138544130;
        uint64_t v94 = v19;
        self = v80;
        __int16 v95 = 2114;
        v96 = v21;
        __int16 v97 = 2114;
        v98 = v15;
        __int16 v99 = 2114;
        v100 = v22;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Session decoder failed. Result = %{public}@; Error = %{public}@",
          buf,
          0x2Au);
      }
      id v12 = v16;

      uint64_t v15 = 0;
    }
    else
    {
      id v12 = 0;
    }

    id v11 = v15;
  }
  uint64_t v23 = [v10 properties];
  uint64_t v24 = [v23 responseDecoder];

  if (!v12 && v24)
  {
    id v91 = 0;
    id v25 = [v24 resultFromResult:v11 error:&v91];
    id v26 = v91;

    if (v26 || !v25)
    {
      char v27 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v27)
      {
        char v27 = +[AMSLogConfig sharedConfig];
      }
      id v28 = [v27 OSLogObject];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64_t v29 = objc_opt_class();
        id v30 = [v10 properties];
        uint64_t v31 = [v30 logUUID];
        uint64_t v32 = AMSLogableError(v26);
        *(_DWORD *)buf = 138544130;
        uint64_t v94 = v29;
        __int16 v95 = 2114;
        v96 = v31;
        __int16 v97 = 2114;
        v98 = v25;
        __int16 v99 = 2114;
        v100 = v32;
        _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request decoder failed. Result = %{public}@; Error = %{public}@",
          buf,
          0x2Au);

        self = v80;
      }

      id v12 = v26;
      id v25 = 0;
    }
    else
    {
      id v12 = 0;
    }

    id v11 = v25;
  }
  if (os_variant_has_internal_content())
  {
    id v33 = [v10 properties];
    uint64_t v34 = [v33 account];
    int v35 = objc_msgSend(v34, "ams_isEphemeralAccount");

    if (v35)
    {
      v89[0] = MEMORY[0x1E4F143A8];
      v89[1] = 3221225472;
      v89[2] = __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke;
      v89[3] = &unk_1E559F1E0;
      v89[4] = self;
      id v90 = v10;
      [v90 performAsyncBlock:v89];
    }
    else if (+[AMSProcessInfo hasAMSEntitlement])
    {
      v87[0] = MEMORY[0x1E4F143A8];
      v87[1] = 3221225472;
      v87[2] = __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_214;
      v87[3] = &unk_1E559F1E0;
      v87[4] = self;
      id v88 = v10;
      [v88 performAsyncBlock:v87];
    }
    else
    {
      id v36 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v36)
      {
        id v36 = +[AMSLogConfig sharedConfig];
      }
      v37 = [v36 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v38 = objc_opt_class();
        uint64_t v39 = [v10 properties];
        uint64_t v40 = [v39 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v94 = v38;
        __int16 v95 = 2114;
        v96 = v40;
        _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Warning: missing AMS private entitlement, skipping HAR logging.", buf, 0x16u);
      }
    }
  }
  uint64_t v41 = +[AMSLogConfig sharedURLLoadingConfig];
  id v42 = (void *)v41;
  if (v12)
  {
    if (!v41)
    {
      id v42 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v43 = [v42 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      uint64_t v44 = objc_opt_class();
      uint64_t v45 = [v10 properties];
      id v46 = [v45 logUUID];
      uint64_t v47 = AMSLogableError(v12);
      *(_DWORD *)buf = 138543874;
      uint64_t v94 = v44;
      __int16 v95 = 2114;
      v96 = v46;
      __int16 v97 = 2114;
      v98 = v47;
      _os_log_impl(&dword_18D554000, v43, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Task completed with error = %{public}@", buf, 0x20u);
    }
    id v48 = +[AMSLogConfig sharedURLLoadingConfig];
    id v49 = v48;
    if (!v48)
    {
      id v49 = +[AMSLogConfig sharedConfig];
    }
    v50 = [v49 OSLogObject];
    BOOL v51 = os_signpost_enabled(v50);

    if (!v48) {
    if (v51)
    }
    {
      v52 = +[AMSLogConfig sharedURLLoadingConfig];
      v53 = v52;
      if (v52)
      {
        v54 = [v52 OSLogObject];
      }
      else
      {
        id v65 = +[AMSLogConfig sharedConfig];
        v54 = [v65 OSLogObject];
      }
      uint64_t v66 = [v10 signpostID];
      if ((unint64_t)(v66 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v67 = v66;
        if (os_signpost_enabled(v54))
        {
          id v68 = AMSLogableError(v12);
          *(_DWORD *)buf = 138543362;
          uint64_t v94 = (uint64_t)v68;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v54, OS_SIGNPOST_INTERVAL_END, v67, "URL Data Task", "Failed with error: %{public}@", buf, 0xCu);
        }
      }
LABEL_64:
    }
  }
  else
  {
    if (!v41)
    {
      id v42 = +[AMSLogConfig sharedConfig];
    }
    v55 = [v42 OSLogObject];
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v56 = objc_opt_class();
      id v57 = [v10 properties];
      id v58 = [v57 logUUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v94 = v56;
      __int16 v95 = 2114;
      v96 = v58;
      _os_log_impl(&dword_18D554000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task completed successfully", buf, 0x16u);

      id v12 = 0;
    }

    uint64_t v59 = +[AMSLogConfig sharedURLLoadingConfig];
    uint64_t v60 = v59;
    if (!v59)
    {
      uint64_t v60 = +[AMSLogConfig sharedConfig];
    }
    id v61 = [v60 OSLogObject];
    BOOL v62 = os_signpost_enabled(v61);

    if (!v59) {
    if (v62)
    }
    {
      id v63 = +[AMSLogConfig sharedURLLoadingConfig];
      id v64 = v63;
      if (v63)
      {
        v54 = [v63 OSLogObject];
      }
      else
      {
        uint64_t v69 = +[AMSLogConfig sharedConfig];
        v54 = [v69 OSLogObject];
      }
      uint64_t v70 = [v10 signpostID];
      if ((unint64_t)(v70 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v71 = v70;
        if (os_signpost_enabled(v54))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_18D554000, v54, OS_SIGNPOST_INTERVAL_END, v71, "URL Data Task", "Succeeded", buf, 2u);
        }
      }
      goto LABEL_64;
    }
  }
  id v72 = [(AMSURLSession *)v80 delegateQueue];
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke_216;
  v81[3] = &unk_1E55A2448;
  v81[4] = v80;
  id v82 = v78;
  id v83 = v12;
  id v84 = v11;
  id v85 = v79;
  id v86 = v10;
  id v73 = v10;
  id v74 = v79;
  id v75 = v11;
  id v76 = v12;
  id v77 = v78;
  [v72 addOperationWithBlock:v81];
}

- (void)createDataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 activity:(id)a5 dataTaskCreationCompletionHandler:(id)a6 requestCompletionHandler:(id)a7
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v48 = a5;
  id v13 = a6;
  id v47 = a7;
  id v14 = [(AMSURLSession *)self protocolHandler];
  uint64_t v15 = +[AMSLogConfig sharedURLLoadingConfig];
  id v16 = v15;
  if (!v15)
  {
    id v16 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v17 = [v16 OSLogObject];
  BOOL v18 = os_signpost_enabled(v17);
  if (a4) {
    BOOL v19 = 0;
  }
  else {
    BOOL v19 = v18;
  }

  if (!v15) {
  if (v19)
  }
  {
    uint64_t v20 = +[AMSLogConfig sharedURLLoadingConfig];
    id v21 = v20;
    if (!v20)
    {
      id v21 = +[AMSLogConfig sharedConfig];
    }
    id v22 = [v21 OSLogObject];
    a4 = os_signpost_id_make_with_pointer(v22, v12);

    if (!v20) {
    uint64_t v23 = +[AMSLogConfig sharedURLLoadingConfig];
    }
    uint64_t v24 = v23;
    if (v23)
    {
      id v25 = [v23 OSLogObject];
    }
    else
    {
      id v26 = +[AMSLogConfig sharedConfig];
      id v25 = [v26 OSLogObject];
    }
    if (a4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      char v27 = [v12 URL];
      *(_DWORD *)buf = 138543362;
      uint64_t v57 = (uint64_t)v27;
      _os_signpost_emit_with_name_impl(&dword_18D554000, v25, OS_SIGNPOST_INTERVAL_BEGIN, a4, "URL Data Task", "%{public}@", buf, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v28 = [v12 properties];
  }
  else
  {
    uint64_t v29 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v29)
    {
      uint64_t v29 = +[AMSLogConfig sharedConfig];
    }
    id v30 = [v29 OSLogObject];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = objc_opt_class();
      uint64_t v32 = AMSSetLogKeyIfNeeded();
      *(_DWORD *)buf = 138543618;
      uint64_t v57 = v31;
      __int16 v58 = 2114;
      uint64_t v59 = v32;
      _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Falling back to default properties since we don't have an AMSURLRequest", buf, 0x16u);
    }
    id v28 = objc_alloc_init(AMSURLRequestProperties);
    if ([(AMSURLSession *)self useFallbackBag])
    {
      id v33 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v33)
      {
        id v33 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v34 = [v33 OSLogObject];
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = objc_opt_class();
        id v36 = [(AMSURLRequestProperties *)v28 logUUID];
        *(_DWORD *)buf = 138543618;
        uint64_t v57 = v35;
        __int16 v58 = 2114;
        uint64_t v59 = v36;
        _os_log_impl(&dword_18D554000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Warning: falling back to default properties (this may cause an additional bag load)", buf, 0x16u);
      }
      v37 = +[AMSURLRequestEncoder bagSubProfile];
      uint64_t v38 = +[AMSURLRequestEncoder bagSubProfileVersion];
      uint64_t v39 = +[AMSBag bagForProfile:v37 profileVersion:v38];
      [(AMSURLRequestProperties *)v28 setBag:v39];
    }
  }
  uint64_t v40 = [(AMSURLRequestProperties *)v28 logUUID];
  uint64_t v41 = [(AMSURLSession *)self _prepareRequest:v12 logUUID:v40];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke;
  v49[3] = &unk_1E55A8040;
  v49[4] = self;
  id v50 = v48;
  id v54 = v13;
  unint64_t v55 = a4;
  BOOL v51 = v28;
  id v52 = v14;
  id v53 = v47;
  id v42 = v13;
  id v43 = v14;
  uint64_t v44 = v28;
  id v45 = v48;
  id v46 = v47;
  [v41 addFinishBlock:v49];
}

- (AMSResponseDecoding)responseDecoder
{
  p_propertiesLock = &self->_propertiesLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_responseDecoder;
  os_unfair_lock_unlock(p_propertiesLock);
  return v4;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AMSURLTaskInfo taskInfoForTask:v8];
  id v11 = [(AMSURLSession *)self protocolHandler];
  if (!v10)
  {
    id v15 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v15)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_opt_class();
      BOOL v18 = [0 properties];
      BOOL v19 = [v18 logUUID];
      uint64_t v20 = AMSLogableError(v9);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v17;
      __int16 v33 = 2114;
      uint64_t v34 = v19;
      __int16 v35 = 2114;
      id v36 = v20;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping completion - no task info. error = %{public}@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  id v12 = [v10 receivedAction];
  uint64_t v13 = [v12 actionType];

  if (v13) {
    BOOL v14 = v13 == 3;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14)
  {
    uint64_t v21 = +[AMSLogConfig sharedURLLoadingConfig];
    id v15 = (id)v21;
    if (!v21)
    {
      id v15 = +[AMSLogConfig sharedConfig];
    }
    id v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      uint64_t v23 = [v10 properties];
      uint64_t v24 = [v23 logUUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v22;
      __int16 v33 = 2114;
      uint64_t v34 = v24;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping completion", buf, 0x16u);
    }
LABEL_16:

    goto LABEL_17;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke;
  v25[3] = &unk_1E55A7FA0;
  id v26 = v10;
  char v27 = self;
  id v28 = v8;
  id v29 = v9;
  SEL v30 = a2;
  [v26 startContiguousAsyncActionWithInitialDataBlock:v25];

  id v15 = v26;
LABEL_17:
}

id __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_181(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 first];
  id v5 = [v3 second];

  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v7)
    {
      uint64_t v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = *(void *)(a1 + 48);
      id v11 = AMSLogableError(v6);
      int v18 = 138543874;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      uint64_t v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Protocol completed with error. %{public}@", (uint8_t *)&v18, 0x20u);
    }
  }
  else
  {
    id v6 = *(id *)(a1 + 32);
  }
  BOOL v12 = [v4 actionType] == 3 || objc_msgSend(v4, "actionType") == 0;
  uint64_t v13 = [AMSPair alloc];
  BOOL v14 = [MEMORY[0x1E4F28ED0] numberWithBool:v12];
  id v15 = [(AMSPair *)v13 initWithFirst:v14 second:v6];
  id v16 = +[AMSPromise promiseWithResult:v15];

  return v16;
}

uint64_t __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_48(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = [v2 logUUID];
  id v4 = AMSSetLogKey(v3);

  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v5();
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  if (a1[5])
  {
    v2 = (void *)a1[4];
    objc_msgSend(v2, "finishWithResult:error:", 0);
  }
  else
  {
    id v4 = [[AMSOptional alloc] initWithValue:a1[6]];
    [v1 finishWithResult:v4 error:a1[5]];
  }
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4_139(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = [*(id *)(a1 + 32) properties];
  id v4 = [v3 logUUID];
  id v5 = AMSSetLogKey(v4);

  if (*(void *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) error];

    if (v6)
    {
      uint64_t v7 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v7)
      {
        uint64_t v7 = +[AMSLogConfig sharedConfig];
      }
      id v8 = [v7 OSLogObject];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = AMSLogKey();
        uint64_t v10 = NSString;
        uint64_t v11 = objc_opt_class();
        if (v9)
        {
          BOOL v12 = AMSLogKey();
          uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 80));
          [v10 stringWithFormat:@"%@: [%@] %@ ", v11, v12, v1];
        }
        else
        {
          BOOL v12 = NSStringFromSelector(*(SEL *)(a1 + 80));
          [v10 stringWithFormat:@"%@: %@ ", v11, v12];
        uint64_t v13 = };
        id v15 = [*(id *)(a1 + 32) error];
        id v16 = AMSLogableError(v15);
        uint64_t v17 = AMSLogableError(*(void **)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        uint64_t v21 = v13;
        __int16 v22 = 2114;
        uint64_t v23 = v16;
        __int16 v24 = 2114;
        id v25 = v17;
        _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Error occurred when getting URLSessionResponseDisposition, but taskInfo already had an error set. taskInfoError = %{public}@ | receivedError = %{public}@", buf, 0x20u);

        if (v9)
        {

          uint64_t v13 = (void *)v1;
        }
      }
    }
    [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
    if (*(void *)(a1 + 72) == 1) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = *(void *)(a1 + 72);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 72);
  }
  int v18 = *(void **)(a1 + 64);
  uint64_t v19 = [MEMORY[0x1E4F28ED0] numberWithInteger:v14];
  [v18 finishWithResult:v19];
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) properties];
  id v3 = [v2 logUUID];
  id v4 = AMSSetLogKey(v3);

  if (*(void *)(a1 + 40) || *(void *)(a1 + 88) != 1)
  {
    uint64_t v19 = *(void **)(a1 + 80);
    __int16 v20 = [AMSPair alloc];
    uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 88)];
    id v26 = (id)v21;
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v23 = v20;
  }
  else
  {
    id v5 = [*(id *)(a1 + 48) delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      uint64_t v7 = [AMSDeallocGuard alloc];
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4;
      v30[3] = &unk_1E55A1998;
      uint64_t v8 = *(void *)(a1 + 96);
      void v30[4] = *(void *)(a1 + 48);
      v30[5] = v8;
      uint64_t v9 = [(AMSDeallocGuard *)v7 initWithDeallocGuardBlock:v30];
      uint64_t v10 = [[AMSMutablePromise alloc] initWithTimeout:10.0];
      uint64_t v11 = [*(id *)(a1 + 48) delegate];
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 64);
      uint64_t v14 = *(void *)(a1 + 72);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_131;
      v27[3] = &unk_1E55A7C30;
      id v28 = v9;
      id v29 = v10;
      id v15 = v10;
      id v16 = v9;
      [v11 URLSession:v12 dataTask:v13 didReceiveResponse:v14 completionHandler:v27];

      uint64_t v17 = *(void **)(a1 + 80);
      int v18 = [(AMSMutablePromise *)v15 continueWithBlock:&__block_literal_global_136];
      [v17 finishWithPromise:v18];

      return;
    }
    uint64_t v19 = *(void **)(a1 + 80);
    id v25 = [AMSPair alloc];
    uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 88)];
    id v26 = (id)v21;
    uint64_t v23 = v25;
    uint64_t v22 = 0;
  }
  __int16 v24 = [(AMSPair *)v23 initWithFirst:v21 second:v22];
  [v19 finishWithResult:v24];
}

uint64_t __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_142(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) integerValue];
  if (*(void *)(a1 + 40))
  {
    BOOL v3 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v4 = +[AMSLogConfig sharedURLLoadingConfig];
    id v5 = (void *)v4;
    if (v3)
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      char v6 = [v5 OSLogObject];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = AMSLogKey();
        uint64_t v8 = NSString;
        uint64_t v9 = objc_opt_class();
        if (v7)
        {
          uint64_t v10 = AMSLogKey();
          uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 72));
          [v8 stringWithFormat:@"%@: [%@] %@ ", v9, v10, v1];
        }
        else
        {
          uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
          [v8 stringWithFormat:@"%@: %@ ", v9, v10];
        uint64_t v11 = };
        int v18 = AMSLogableError(*(void **)(a1 + 40));
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v11;
        __int16 v23 = 2114;
        __int16 v24 = v18;
        _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when handling NSURLSessionResponseDisposition. Defaulting to cancelling the request. error = %{public}@.", buf, 0x16u);
        if (v7)
        {

          uint64_t v11 = (void *)v1;
        }
      }
      id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v12 = +[AMSLogConfig sharedURLLoadingConfig];
      [v5 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v12 userInfo:0];
    }
    else
    {
      if (!v4)
      {
        id v5 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v12 = [v5 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v13 = AMSLogKey();
        uint64_t v14 = NSString;
        uint64_t v15 = objc_opt_class();
        if (v13)
        {
          id v16 = AMSLogKey();
          uint64_t v1 = NSStringFromSelector(*(SEL *)(a1 + 72));
          [v14 stringWithFormat:@"%@: [%@] %@ ", v15, v16, v1];
        }
        else
        {
          id v16 = NSStringFromSelector(*(SEL *)(a1 + 72));
          [v14 stringWithFormat:@"%@: %@ ", v15, v16];
        uint64_t v17 = };
        uint64_t v19 = AMSLogableError(*(void **)(a1 + 40));
        *(_DWORD *)buf = 138543618;
        uint64_t v22 = v17;
        __int16 v23 = 2114;
        __int16 v24 = v19;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when handling NSURLSessionResponseDisposition. Defaulting to cancelling the request. error = %{public}@.", buf, 0x16u);
        if (v13)
        {

          uint64_t v17 = (void *)v1;
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  return [*(id *)(a1 + 56) finishContiguousAsyncActionWithIdentifier:*(void *)(a1 + 80)];
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 actionType] == 0;
    char v6 = [*(id *)(a1 + 32) _handleURLAction:v4 task:*(void *)(a1 + 40) contiguousActionIdentifier:*(void *)(a1 + 56)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2;
    v10[3] = &unk_1E55A7B90;
    uint64_t v7 = *(void *)(a1 + 64);
    v10[4] = *(void *)(a1 + 32);
    uint64_t v12 = v7;
    id v11 = *(id *)(a1 + 48);
    BOOL v13 = v5;
    [v6 addFinishBlock:v10];
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = [[AMSPair alloc] initWithFirst:&unk_1EDD018B8 second:0];
    [v8 finishWithResult:v9];
  }
}

void __66__AMSURLSession__handleURLAction_task_contiguousActionIdentifier___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v7 = v2;
    id v3 = *(id *)(a1 + 48);
  }
  else
  {
    id v7 = *(id *)(a1 + 40);
    id v3 = *(id *)(a1 + 48);
    if (!v7)
    {
      id v7 = 0;
      goto LABEL_7;
    }
  }
  if (*(void *)(a1 + 80) != 3)
  {
    [*(id *)(a1 + 56) cancel];
    uint64_t v4 = +[AMSURLAction actionWithError:v7];

    id v3 = (id)v4;
  }
LABEL_7:
  [*(id *)(a1 + 64) setReceivedAction:v3];
  BOOL v5 = *(void **)(a1 + 72);
  char v6 = [[AMSPair alloc] initWithFirst:v3 second:v7];
  [v5 finishWithResult:v6];
}

uint64_t __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _completeTaskWithTaskInfo:*(void *)(a1 + 40) result:*(void *)(a1 + 48) decodedObject:*(void *)(a1 + 56) error:0];
  v2 = *(void **)(a1 + 64);
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  return [v2 finishWithResult:v3];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_179(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2 = [[AMSOptional alloc] initWithValue:*(void *)(a1 + 40)];
  [v1 finishWithResult:v2];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_183(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) first];
  char v3 = [v2 BOOLValue];

  uint64_t v4 = [*(id *)(a1 + 32) second];
  [*(id *)(a1 + 40) setError:v4];
  BOOL v5 = [*(id *)(a1 + 40) properties];
  char v6 = [v5 account];
  char v7 = objc_msgSend(v6, "ams_isEphemeralAccount");

  if (v7 & 1) == 0 && *(void *)(a1 + 48) && (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [*(id *)(a1 + 40) createMetricsContextForDecodedObject:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) reportMetricsForContext:v8];
  }
  if (v3)
  {
    if (!v4)
    {
      uint64_t v9 = +[AMSURLResult URLResultPromiseWithTaskInfo:*(void *)(a1 + 40) object:*(void *)(a1 + 56)];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_3_187;
      v12[3] = &unk_1E55A7ED8;
      id v10 = *(id *)(a1 + 40);
      uint64_t v11 = *(void *)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 80);
      id v13 = v10;
      uint64_t v14 = v11;
      id v15 = *(id *)(a1 + 56);
      id v16 = *(id *)(a1 + 64);
      [v9 addFinishBlock:v12];

      goto LABEL_9;
    }
    [*(id *)(a1 + 72) _completeTaskWithTaskInfo:*(void *)(a1 + 40) result:0 decodedObject:*(void *)(a1 + 56) error:v4];
  }
  [*(id *)(a1 + 64) finishWithResult:MEMORY[0x1E4F1CC38]];
LABEL_9:
}

- (AMSURLSession)initWithConfiguration:(id)a3
{
  return [(AMSURLSession *)self initWithConfiguration:a3 delegate:0 delegateQueue:0];
}

- (void)setProtocolHandler:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [v4 setSession:self];
  protocolHandler = self->_protocolHandler;
  self->_protocolHandler = (AMSURLHandling *)v4;

  os_unfair_lock_unlock(&self->_propertiesLock);
}

id __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_126(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 first];
  uint64_t v5 = [v4 integerValue];

  char v6 = [v3 second];

  char v7 = objc_alloc_init(AMSMutablePromise);
  uint64_t v8 = [*(id *)(a1 + 32) delegateQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_127;
  v27[3] = &unk_1E55A7C80;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 72);
  id v28 = v9;
  uint64_t v35 = v10;
  id v11 = v6;
  uint64_t v12 = *(void *)(a1 + 32);
  id v29 = v11;
  uint64_t v30 = v12;
  uint64_t v13 = *(void *)(a1 + 80);
  uint64_t v36 = v5;
  uint64_t v37 = v13;
  id v31 = *(id *)(a1 + 48);
  id v32 = *(id *)(a1 + 56);
  id v33 = *(id *)(a1 + 64);
  uint64_t v34 = v7;
  uint64_t v14 = v7;
  [v8 addOperationWithBlock:v27];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3_138;
  v21[3] = &unk_1E55A7CD0;
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  id v22 = v15;
  uint64_t v23 = v16;
  uint64_t v17 = *(void *)(a1 + 80);
  uint64_t v25 = *(void *)(a1 + 72);
  uint64_t v26 = v17;
  id v24 = v11;
  id v18 = v11;
  uint64_t v19 = [(AMSMutablePromise *)v14 thenWithBlock:v21];

  return v19;
}

- (AMSURLSession)initWithConfiguration:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v32.receiver = self;
  v32.super_class = (Class)AMSURLSession;
  id v11 = [(AMSURLSession *)&v32 init];
  if (v11)
  {
    if (!v8)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F18DD0];
      uint64_t v13 = +[AMSProcessInfo currentProcess];
      objc_msgSend(v12, "ams_configurationWithProcessInfo:bag:", v13, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    p_configuration = (id *)&v11->_configuration;
    objc_storeStrong((id *)&v11->_configuration, v8);
    if (+[AMSUnitTests isRunningUnitTests])
    {
      id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v16 = [*p_configuration protocolClasses];
      uint64_t v17 = (void *)[v15 initWithArray:v16];

      [v17 insertObject:objc_opt_class() atIndex:0];
      [*p_configuration setProtocolClasses:v17];
    }
    id v18 = [[AMSURLDelegateProxy alloc] initWithSession:v11 delegate:v9];
    delegateProxy = v11->_delegateProxy;
    v11->_delegateProxy = v18;

    if (v10) {
      __int16 v20 = (NSOperationQueue *)v10;
    }
    else {
      __int16 v20 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    }
    delegateQueue = v11->_delegateQueue;
    v11->_delegateQueue = v20;

    [(NSOperationQueue *)v11->_delegateQueue setMaxConcurrentOperationCount:1];
    id v22 = objc_alloc_init(AMSURLProtocolHandler);
    protocolHandler = v11->_protocolHandler;
    v11->_protocolHandler = (AMSURLHandling *)v22;

    [(AMSURLHandling *)v11->_protocolHandler setSession:v11];
    id v24 = objc_alloc_init(AMSURLResponseDecoder);
    responseDecoder = v11->_responseDecoder;
    v11->_responseDecoder = (AMSResponseDecoding *)v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F18DC0];
    char v27 = v11->_delegateProxy;
    id v28 = [(AMSURLSession *)v11 delegateQueue];
    uint64_t v29 = [v26 sessionWithConfiguration:v8 delegate:v27 delegateQueue:v28];
    session = v11->_session;
    v11->_session = (NSURLSession *)v29;

    v11->_useFallbackBag = 1;
    v11->_propertiesLock._os_unfair_lock_opaque = 0;
  }

  return v11;
}

- (NSOperationQueue)delegateQueue
{
  return self->_delegateQueue;
}

uint64_t __31__AMSURLSession_defaultSession__block_invoke()
{
  qword_1EB38E078 = objc_alloc_init(AMSURLSession);
  return MEMORY[0x1F41817F8]();
}

- (AMSURLSession)init
{
  return [(AMSURLSession *)self initWithConfiguration:0 delegate:0 delegateQueue:0];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2;
  v11[3] = &unk_1E55A22D0;
  id v8 = *(void **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v5;
  id v9 = v5;
  id v10 = v6;
  [v8 continueContiguousAsyncActionWithIdentifier:v7 block:v11];
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_127(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 88);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_3;
  v8[3] = &unk_1E55A7C58;
  id v9 = v2;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  id v10 = v4;
  uint64_t v11 = v5;
  uint64_t v7 = *(void *)(a1 + 104);
  uint64_t v16 = *(void *)(a1 + 96);
  uint64_t v17 = v7;
  id v12 = v6;
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 72);
  id v15 = *(id *)(a1 + 80);
  [v9 continueContiguousAsyncActionWithIdentifier:v3 block:v8];
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_48;
  v8[3] = &unk_1E559F7F0;
  id v9 = v4;
  id v6 = *(id *)(a1 + 40);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  [v9 continueContiguousAsyncActionWithIdentifier:v5 block:v8];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_178(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_179;
  v7[3] = &unk_1E559F1E0;
  uint64_t v5 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  [v5 continueContiguousAsyncActionWithIdentifier:v4 block:v7];
}

void __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 80);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __122__AMSURLSession_createDataTaskWithRequest_signpostID_activity_dataTaskCreationCompletionHandler_requestCompletionHandler___block_invoke_4;
  v16[3] = &unk_1E55A7FC8;
  id v9 = v7;
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = *(void **)(a1 + 56);
  id v17 = v9;
  uint64_t v18 = v10;
  id v19 = v11;
  id v20 = v6;
  id v21 = v5;
  id v22 = *(id *)(a1 + 64);
  char v25 = a2;
  id v12 = *(id *)(a1 + 72);
  uint64_t v13 = *(void *)(a1 + 80);
  id v23 = v12;
  uint64_t v24 = v13;
  id v14 = v5;
  id v15 = v6;
  [v9 continueContiguousAsyncActionWithIdentifier:v8 block:v16];
}

- (void)createDataTaskWithRequest:(id)a3 activity:(id)a4 dataTaskCreationCompletionHandler:(id)a5 requestCompletionHandler:(id)a6
{
}

uint64_t __37__AMSURLSession_sharedAuthKitSession__block_invoke()
{
  qword_1EB38E098 = (uint64_t)objc_alloc_init(MEMORY[0x1E4F4EF78]);
  return MEMORY[0x1F41817F8]();
}

- (id)dataTaskPromiseWithRequest:(id)a3 activity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [AMSMutableLazyPromise alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke;
  v13[3] = &unk_1E55A8090;
  objc_copyWeak(&v16, &location);
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v11 = [(AMSMutableLazyPromise *)v8 initWithBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (NSURLSessionConfiguration)configuration
{
  return self->_configuration;
}

- (id)dataTaskPromiseWithRequest:(id)a3
{
  return [(AMSURLSession *)self dataTaskPromiseWithRequest:a3 activity:0];
}

- (void)invalidateAndCancel
{
  [(AMSURLSession *)self setInvalidated:1];
  id v3 = [(AMSURLSession *)self session];
  [v3 getAllTasksWithCompletionHandler:&__block_literal_global_21_3];
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void)dealloc
{
  id v3 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v3)
  {
    id v3 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_INFO, "AMSURLSession: dealloc", buf, 2u);
  }

  [(AMSURLDelegateProxy *)self->_delegateProxy invalidate];
  [(NSURLSession *)self->_session invalidateAndCancel];
  v5.receiver = self;
  v5.super_class = (Class)AMSURLSession;
  [(AMSURLSession *)&v5 dealloc];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSURLSession *)self delegateProxy];
  [v5 setDelegate:v4];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = +[AMSURLTaskInfo taskInfoForTask:v12];
  id v16 = objc_alloc_init(AMSMutablePromise);
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v42[3] = &unk_1E55A7C08;
  id v17 = v15;
  id v43 = v17;
  id v18 = v13;
  id v44 = v18;
  id v45 = self;
  id v19 = v12;
  id v47 = v16;
  SEL v48 = a2;
  id v46 = v19;
  id v20 = v16;
  uint64_t v21 = [v17 startContiguousAsyncActionWithInitialBlock:v42];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_126;
  v35[3] = &unk_1E55A7CF8;
  v35[4] = self;
  id v22 = v17;
  uint64_t v40 = v21;
  SEL v41 = a2;
  id v36 = v22;
  id v37 = v11;
  id v38 = v19;
  id v39 = v18;
  id v23 = v18;
  id v24 = v19;
  id v25 = v11;
  uint64_t v26 = [(AMSMutablePromise *)v20 thenWithBlock:v35];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_141;
  v29[3] = &unk_1E55A7D48;
  id v30 = v22;
  id v31 = self;
  uint64_t v33 = v21;
  SEL v34 = a2;
  id v32 = v14;
  id v27 = v14;
  id v28 = v22;
  [v26 addFinishBlock:v29];
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, uint64_t, void))a6;
  id v31 = +[AMSURLTaskInfo taskInfoForTask:v10];
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__75;
  id v47 = __Block_byref_object_dispose__75;
  id v48 = 0;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 1;
  id v13 = [v11 protectionSpace];
  id v14 = [v13 authenticationMethod];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4F18CB8]];

  if (v15
    && os_variant_has_internal_content()
    && (+[AMSDefaults QAMode]
     || +[AMSDefaults ignoreServerTrustEvaluation]
     || +[AMSDefaults ss_ignoreServerTrustEvaluation]))
  {
    id v16 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = objc_opt_class();
      id v19 = [v31 properties];
      id v20 = [v19 logUUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v50 = v18;
      __int16 v51 = 2114;
      id v52 = v20;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Ignoring server trust", buf, 0x16u);
    }
    uint64_t v21 = objc_msgSend(MEMORY[0x1E4F18D88], "credentialForTrust:", objc_msgSend(v13, "serverTrust"));
    id v22 = (void *)v44[5];
    v44[5] = v21;

    v40[3] = 0;
  }
  uint64_t v23 = v40[3];
  if (v23 != 1) {
    goto LABEL_15;
  }
  id v24 = [(AMSURLSession *)self delegate];
  char v25 = objc_opt_respondsToSelector();

  if ((v25 & 1) == 0)
  {
    uint64_t v23 = v40[3];
LABEL_15:
    v12[2](v12, v23, v44[5]);
    goto LABEL_16;
  }
  uint64_t v26 = [AMSDeallocGuard alloc];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke;
  v38[3] = &unk_1E55A1998;
  v38[4] = self;
  v38[5] = a2;
  id v27 = [(AMSDeallocGuard *)v26 initWithDeallocGuardBlock:v38];
  id v28 = [(AMSURLSession *)self delegate];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_152;
  v33[3] = &unk_1E55A7D70;
  id v36 = &v43;
  id v37 = &v39;
  uint64_t v35 = v12;
  uint64_t v29 = v27;
  SEL v34 = v29;
  [v28 URLSession:v32 didReceiveChallenge:v11 completionHandler:v33];

LABEL_16:
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

void __36__AMSURLSession_invalidateAndCancel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancel];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securityPolicy, 0);
  objc_storeStrong((id *)&self->_requestEncoder, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_responseDecoder, 0);
  objc_storeStrong((id *)&self->_protocolHandler, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (id)minimalSessionUsing:(id)a3
{
  id v3 = a3;
  id v4 = static AMSURLSession.minimalSession(using:)((uint64_t)v3);

  return v4;
}

+ (AMSURLSession)minimalSession
{
  id v2 = static AMSURLSession.minimalSession.getter();
  return (AMSURLSession *)v2;
}

+ (AMSURLSession)loggingOnlySession
{
  id v2 = static AMSURLSession.loggingOnlySession.getter();
  return (AMSURLSession *)v2;
}

+ (id)loggingOnlySessionUsing:(id)a3
{
  id v3 = a3;
  id v4 = static AMSURLSession.loggingOnlySession(using:)((uint64_t)v3);

  return v4;
}

+ (id)imageSession
{
  if (qword_1EB38E080 != -1) {
    dispatch_once(&qword_1EB38E080, &__block_literal_global_15_5);
  }
  id v2 = (void *)qword_1EB38E088;
  return v2;
}

void __29__AMSURLSession_imageSession__block_invoke()
{
  v0 = [AMSURLSession alloc];
  objc_msgSend(MEMORY[0x1E4F18DD0], "ams_imageConfiguration");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [(AMSURLSession *)v0 initWithConfiguration:v3];
  id v2 = (void *)qword_1EB38E088;
  qword_1EB38E088 = v1;
}

- (void)finishTasksAndInvalidate
{
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  long long v8 = off_1E559C000;
  if (v7)
  {
    BOOL v9 = +[AMSUnitTests isRunningUnitTests];
    uint64_t v10 = +[AMSLogConfig sharedURLLoadingConfig];
    id v11 = (void *)v10;
    if (v9)
    {
      if (!v10)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v12 = [v11 OSLogObject];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = AMSLogKey();
        id v14 = NSString;
        uint64_t v15 = objc_opt_class();
        uint64_t v16 = v15;
        if (v13)
        {
          uint64_t v3 = AMSLogKey();
          [v14 stringWithFormat:@"%@: [%@] ", v16, v3];
        }
        else
        {
          [v14 stringWithFormat:@"%@: ", v15];
        id v17 = };
        id v24 = AMSLogableError(v7);
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v17;
        __int16 v42 = 2114;
        uint64_t v43 = v24;
        _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected error occurred when handling action. error = %{public}@", buf, 0x16u);
        if (v13)
        {

          id v17 = (void *)v3;
        }
      }
      id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      uint64_t v18 = +[AMSLogConfig sharedURLLoadingConfig];
      [v11 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v18 userInfo:0];
    }
    else
    {
      if (!v10)
      {
        id v11 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v18 = [v11 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        id v19 = AMSLogKey();
        id v20 = NSString;
        uint64_t v21 = objc_opt_class();
        uint64_t v22 = v21;
        if (v19)
        {
          uint64_t v3 = AMSLogKey();
          [v20 stringWithFormat:@"%@: [%@] ", v22, v3];
        }
        else
        {
          [v20 stringWithFormat:@"%@: ", v21];
        uint64_t v23 = };
        char v25 = AMSLogableError(v7);
        *(_DWORD *)buf = 138543618;
        uint64_t v41 = v23;
        __int16 v42 = 2114;
        uint64_t v43 = v25;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_FAULT, "%{public}@Unexpected error occurred when handling action. error = %{public}@", buf, 0x16u);
        if (v19)
        {

          uint64_t v23 = (void *)v3;
        }
      }
    }
  }
  uint64_t v26 = [v6 second];
  if (v26)
  {
    id v27 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v27)
    {
      id v27 = +[AMSLogConfig sharedConfig];
    }
    id v28 = [v27 OSLogObject];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      id v39 = v6;
      uint64_t v29 = AMSLogKey();
      id v30 = NSString;
      uint64_t v31 = objc_opt_class();
      if (v29)
      {
        id v32 = AMSLogKey();
        NSStringFromSelector(*(SEL *)(a1 + 48));
        long long v8 = (__objc2_class **)objc_claimAutoreleasedReturnValue();
        [v30 stringWithFormat:@"%@: [%@] %@ ", v31, v32, v8];
      }
      else
      {
        id v32 = NSStringFromSelector(*(SEL *)(a1 + 48));
        [v30 stringWithFormat:@"%@: %@ ", v31, v32];
      uint64_t v33 = };
      SEL v34 = AMSLogableError(v26);
      *(_DWORD *)buf = 138543618;
      uint64_t v41 = v33;
      __int16 v42 = 2114;
      uint64_t v43 = v34;
      _os_log_impl(&dword_18D554000, v28, OS_LOG_TYPE_ERROR, "%{public}@Error occurred when handling URL action. error = %{public}@", buf, 0x16u);
      if (v29)
      {

        uint64_t v33 = v8;
      }

      id v6 = v39;
    }
  }
  uint64_t v35 = *(void **)(a1 + 40);
  id v36 = [AMSPair alloc];
  id v37 = [MEMORY[0x1E4F28ED0] numberWithInteger:*(void *)(a1 + 56)];
  id v38 = [(AMSPair *)v36 initWithFirst:v37 second:v26];
  [v35 finishWithResult:v38];
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v3 = +[AMSLogConfig sharedURLLoadingConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = AMSLogKey();
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      if (v6)
      {
        BOOL v9 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: [%@] %@ ", v8, v9, a1];
      }
      else
      {
        BOOL v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: %@ ", v8, v9];
      uint64_t v10 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v10;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        uint64_t v10 = (void *)a1;
      }
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v11 = +[AMSLogConfig sharedURLLoadingConfig];
    [v4 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
  }
  else
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v4 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = AMSLogKey();
      id v13 = NSString;
      uint64_t v14 = objc_opt_class();
      if (v12)
      {
        uint64_t v15 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a1];
      }
      else
      {
        uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: %@ ", v14, v15];
      uint64_t v16 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        uint64_t v16 = (void *)a1;
      }
    }
  }
}

void __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_131(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) invalidate];
  id v4 = *(void **)(a1 + 40);
  id v5 = [MEMORY[0x1E4F28ED0] numberWithInteger:a2];
  [v4 finishWithResult:v5];
}

id __74__AMSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke_2_133(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [[AMSPair alloc] initWithFirst:v5 second:v4];

  id v7 = +[AMSPromise promiseWithResult:v6];

  return v7;
}

void __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v3 = +[AMSLogConfig sharedURLLoadingConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = AMSLogKey();
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      if (v6)
      {
        BOOL v9 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: [%@] %@ ", v8, v9, a1];
      }
      else
      {
        BOOL v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: %@ ", v8, v9];
      uint64_t v10 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v10;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        uint64_t v10 = (void *)a1;
      }
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v11 = +[AMSLogConfig sharedURLLoadingConfig];
    [v4 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
  }
  else
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    id v11 = [v4 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = AMSLogKey();
      id v13 = NSString;
      uint64_t v14 = objc_opt_class();
      if (v12)
      {
        uint64_t v15 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a1];
      }
      else
      {
        uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: %@ ", v14, v15];
      uint64_t v16 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        uint64_t v16 = (void *)a1;
      }
    }
  }
}

void __71__AMSURLSession_URLSession_task_didReceiveChallenge_completionHandler___block_invoke_152(uint64_t a1, uint64_t a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v6 = obj;
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) invalidate];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = +[AMSURLTaskInfo taskInfoForTask:v14];
  [v18 setOriginalResponse:v15];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke;
  v25[3] = &unk_1E55A7E60;
  id v26 = v18;
  id v27 = self;
  id v28 = v16;
  id v29 = v14;
  id v30 = v13;
  id v31 = v15;
  id v32 = v17;
  SEL v33 = a2;
  id v19 = v17;
  id v20 = v15;
  id v21 = v13;
  id v22 = v14;
  id v23 = v16;
  id v24 = v18;
  [v24 startContiguousAsyncActionWithInitialBlock:v25];
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = [*(id *)(a1 + 32) properties];
  id v5 = [v4 logUUID];
  id v6 = AMSSetLogKey(v5);

  id v7 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v7)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = [*(id *)(a1 + 32) properties];
    id v11 = [v10 logUUID];
    uint64_t v12 = [*(id *)(a1 + 48) URL];
    id v13 = AMSLogableURL(v12);
    *(_DWORD *)buf = 138543874;
    uint64_t v34 = v9;
    __int16 v35 = 2114;
    id v36 = v11;
    __int16 v37 = 2114;
    id v38 = v13;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Task redirecting to URL: %{public}@", buf, 0x20u);
  }
  id v14 = [*(id *)(a1 + 40) protocolHandler];
  id v15 = [*(id *)(a1 + 40) _reconfigureNewRequest:*(void *)(a1 + 48) originalTask:*(void *)(a1 + 56) protocolHandler:v14 redirect:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_154;
  v26[3] = &unk_1E55A7DE8;
  int8x16_t v20 = *(int8x16_t *)(a1 + 32);
  id v16 = (id)v20.i64[0];
  int8x16_t v27 = vextq_s8(v20, v20, 8uLL);
  uint64_t v17 = *(void *)(a1 + 88);
  uint64_t v31 = a2;
  uint64_t v32 = v17;
  id v28 = *(id *)(a1 + 64);
  id v29 = *(id *)(a1 + 56);
  id v30 = *(id *)(a1 + 72);
  uint64_t v18 = [v15 thenWithBlock:v26];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_160;
  v21[3] = &unk_1E55A7E38;
  id v22 = *(id *)(a1 + 32);
  uint64_t v25 = a2;
  id v19 = *(id *)(a1 + 80);
  uint64_t v23 = *(void *)(a1 + 40);
  id v24 = v19;
  [v18 addFinishBlock:v21];
}

AMSMutablePromise *__89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_154(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = [*(id *)(a1 + 32) delegateQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E55A7C58;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v15 = v6;
  uint64_t v16 = v7;
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v22 = *(void *)(a1 + 72);
  uint64_t v23 = v8;
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v19 = *(id *)(a1 + 64);
  id v20 = v3;
  uint64_t v9 = v4;
  id v21 = v9;
  id v10 = v3;
  [v5 addOperationWithBlock:v14];

  id v11 = v21;
  uint64_t v12 = v9;

  return v12;
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3;
  v6[3] = &unk_1E55A7DC0;
  uint64_t v3 = *(void *)(a1 + 88);
  uint64_t v2 = *(void *)(a1 + 96);
  id v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 48);
  void v6[4] = *(void *)(a1 + 40);
  uint64_t v12 = v2;
  id v7 = v5;
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  id v11 = *(id *)(a1 + 80);
  [v4 continueContiguousAsyncActionWithIdentifier:v3 block:v6];
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [AMSDeallocGuard alloc];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4;
    v23[3] = &unk_1E55A1998;
    uint64_t v5 = *(void *)(a1 + 80);
    void v23[4] = *(void *)(a1 + 32);
    v23[5] = v5;
    id v6 = [(AMSDeallocGuard *)v4 initWithDeallocGuardBlock:v23];
    id v7 = [[AMSMutablePromise alloc] initWithTimeout:10.0];
    id v8 = [*(id *)(a1 + 32) delegate];
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_157;
    id v20 = &unk_1E55A7D98;
    id v21 = v7;
    uint64_t v22 = v6;
    id v13 = v6;
    id v14 = v7;
    [v8 URLSession:v9 task:v10 willPerformHTTPRedirection:v11 newRequest:v12 completionHandler:&v17];

    objc_msgSend(*(id *)(a1 + 72), "finishWithPromise:", v14, v17, v18, v19, v20);
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 64);
    id v15 = *(void **)(a1 + 72);
    [v15 finishWithResult:v16];
  }
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v2 = +[AMSUnitTests isRunningUnitTests];
  uint64_t v3 = +[AMSLogConfig sharedURLLoadingConfig];
  id v4 = (void *)v3;
  if (v2)
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = AMSLogKey();
      id v7 = NSString;
      uint64_t v8 = objc_opt_class();
      if (v6)
      {
        uint64_t v9 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: [%@] %@ ", v8, v9, a1];
      }
      else
      {
        uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v7 stringWithFormat:@"%@: %@ ", v8, v9];
      uint64_t v10 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v10;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v6)
      {

        uint64_t v10 = (void *)a1;
      }
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = +[AMSLogConfig sharedURLLoadingConfig];
    [v4 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v11 userInfo:0];
  }
  else
  {
    if (!v3)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v4 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v12 = AMSLogKey();
      id v13 = NSString;
      uint64_t v14 = objc_opt_class();
      if (v12)
      {
        id v15 = AMSLogKey();
        a1 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: [%@] %@ ", v14, v15, a1];
      }
      else
      {
        id v15 = NSStringFromSelector(*(SEL *)(a1 + 40));
        [v13 stringWithFormat:@"%@: %@ ", v14, v15];
      uint64_t v16 = };
      *(_DWORD *)buf = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_18D554000, v11, OS_LOG_TYPE_FAULT, "%{public}@Completion handler not called.", buf, 0xCu);
      if (v12)
      {

        uint64_t v16 = (void *)a1;
      }
    }
  }
}

uint64_t __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_157(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) finishWithResult:a2];
  uint64_t v3 = *(void **)(a1 + 40);
  return [v3 invalidate];
}

void __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_2_160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3_161;
  v14[3] = &unk_1E55A7E10;
  id v15 = v5;
  uint64_t v8 = *(void *)(a1 + 56);
  id v18 = *(id *)(a1 + 48);
  int8x16_t v13 = *(int8x16_t *)(a1 + 32);
  id v9 = (id)v13.i64[0];
  int8x16_t v16 = vextq_s8(v13, v13, 8uLL);
  uint64_t v10 = *(void *)(a1 + 56);
  id v17 = v6;
  uint64_t v19 = v10;
  id v11 = v6;
  id v12 = v5;
  [v7 continueContiguousAsyncActionWithIdentifier:v8 block:v14];
}

uint64_t __89__AMSURLSession_URLSession_task_willPerformHTTPRedirection_newRequest_completionHandler___block_invoke_3_161(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    BOOL v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  else
  {
    uint64_t v3 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v3)
    {
      uint64_t v3 = +[AMSLogConfig sharedConfig];
    }
    id v4 = [v3 OSLogObject];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = objc_opt_class();
      id v6 = [*(id *)(a1 + 48) properties];
      id v7 = [v6 logUUID];
      uint64_t v8 = AMSLogableError(*(void **)(a1 + 56));
      int v10 = 138543874;
      uint64_t v11 = v5;
      __int16 v12 = 2114;
      int8x16_t v13 = v7;
      __int16 v14 = 2114;
      id v15 = v8;
      _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Failed to redirect. Error = %{public}@", (uint8_t *)&v10, 0x20u);
    }
    [*(id *)(a1 + 48) setError:*(void *)(a1 + 56)];
    BOOL v2 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
  }
  v2();
  return [*(id *)(a1 + 48) finishContiguousAsyncActionWithIdentifier:*(void *)(a1 + 72)];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_174(uint64_t a1)
{
  BOOL v2 = [AMSPromiseResult alloc];
  uint64_t v3 = v2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = -[AMSPromiseResult initWithResult:error:](v2, "initWithResult:error:", 0);
  }
  else
  {
    uint64_t v5 = [[AMSOptional alloc] initWithValue:*(void *)(a1 + 40)];
    id v6 = [(AMSPromiseResult *)v3 initWithResult:v5 error:*(void *)(a1 + 32)];

    uint64_t v4 = (uint64_t)v6;
  }
  id v7 = (id)v4;
  [*(id *)(a1 + 48) finishWithPromiseResult:v4];
}

void __54__AMSURLSession_URLSession_task_didCompleteWithError___block_invoke_2_176(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[AMSOptional optionalWithNil];
  [v1 finishWithResult:v2];
}

- (id)dataTaskWithRequest:(id)a3
{
  return [(AMSURLSession *)self dataTaskWithRequest:a3 completionHandler:0];
}

- (id)dataTaskWithRequest:(id)a3 completionHandler:(id)a4
{
  return [(AMSURLSession *)self dataTaskWithRequest:a3 activity:0 completionHandler:a4];
}

- (id)dataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 completionHandler:(id)a5
{
  return [(AMSURLSession *)self dataTaskWithRequest:a3 signpostID:a4 activity:0 completionHandler:a5];
}

- (id)dataTaskWithRequest:(id)a3 activity:(id)a4 completionHandler:(id)a5
{
  return [(AMSURLSession *)self dataTaskWithRequest:a3 signpostID:0 activity:a4 completionHandler:a5];
}

- (id)dataTaskWithRequest:(id)a3 signpostID:(unint64_t)a4 activity:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  int8x16_t v13 = objc_alloc_init(AMSMutablePromise);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke;
  v22[3] = &unk_1E55A1B00;
  uint64_t v23 = v13;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke_2;
  v19[3] = &unk_1E55A8068;
  id v20 = v23;
  id v21 = v10;
  id v14 = v10;
  id v15 = v23;
  [(AMSURLSession *)self createDataTaskWithRequest:v12 signpostID:a4 activity:v11 dataTaskCreationCompletionHandler:v22 requestCompletionHandler:v19];

  uint64_t v16 = [(AMSPromise *)v15 resultWithError:0];
  id v17 = [v16 value];

  return v17;
}

void __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[AMSOptional optionalWithValue:a2];
  [v2 finishWithResult:v3 error:0 logDuplicateFinishes:0];
}

void __75__AMSURLSession_dataTaskWithRequest_signpostID_activity_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = +[AMSOptional optionalWithNil];
    [v6 finishWithResult:v7 error:0 logDuplicateFinishes:0];
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);
  }
}

void __53__AMSURLSession_dataTaskPromiseWithRequest_activity___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((objc_msgSend(v3, "ams_isTimeoutError") & 1) != 0 || objc_msgSend(v3, "ams_isUserCancelledError")) {
    [*(id *)(a1 + 32) cancel];
  }
}

- (id)dataTaskPromiseWithRequestPromise:(id)a3
{
  return [(AMSURLSession *)self dataTaskPromiseWithRequestPromise:a3 activity:0];
}

- (id)dataTaskPromiseWithRequestPromise:(id)a3 activity:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__AMSURLSession_dataTaskPromiseWithRequestPromise_activity___block_invoke;
  v10[3] = &unk_1E559FA68;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [a3 thenWithBlock:v10];

  return v8;
}

uint64_t __60__AMSURLSession_dataTaskPromiseWithRequestPromise_activity___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) dataTaskPromiseWithRequest:a2 activity:*(void *)(a1 + 40)];
}

void __70__AMSURLSession__completeTaskWithTaskInfo_result_decodedObject_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v2)
  {
    id v2 = +[AMSLogConfig sharedConfig];
  }
  id v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = objc_opt_class();
    id v5 = [*(id *)(a1 + 40) properties];
    id v6 = [v5 logUUID];
    int v8 = 138543618;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    id v11 = v6;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_INFO, "%{public}@: [%{public}@] Recording HAR log to ring buffer in progress (needs sysdiagnose or command to save to disk)", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [[AMSHTTPArchiveTaskInfo alloc] initWithURLTaskInfo:*(void *)(a1 + 40)];
  +[AMSStreamHTTPArchiveEntryController ams_addEntriesForTaskInfo:v7];
}

- (id)_formatError:(id)a3 task:(id)a4 decodedObject:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  __int16 v10 = [v9 userInfo];
  id v11 = (void *)[v10 mutableCopy];
  uint64_t v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v14 = v13;

  id v15 = [v14 objectForKeyedSubscript:@"AMSURL"];

  if (!v15)
  {
    uint64_t v16 = [v7 response];
    id v17 = [v16 URL];
    id v18 = [v17 absoluteString];
    [v14 setObject:v18 forKeyedSubscript:@"AMSURL"];
  }
  uint64_t v19 = [v14 objectForKeyedSubscript:@"AMSStatusCode"];

  if (!v19)
  {
    id v20 = (void *)MEMORY[0x1E4F28ED0];
    id v21 = [v7 response];
    uint64_t v22 = objc_msgSend(v20, "numberWithInteger:", objc_msgSend(v21, "ams_statusCode"));
    [v14 setObject:v22 forKeyedSubscript:@"AMSStatusCode"];
  }
  uint64_t v23 = [v14 objectForKeyedSubscript:@"AMSServerPayload"];

  if (!v23) {
    [v14 setObject:v8 forKeyedSubscript:@"AMSServerPayload"];
  }
  uint64_t v24 = [v9 domain];
  uint64_t v25 = (void *)v24;
  if (v24) {
    id v26 = (__CFString *)v24;
  }
  else {
    id v26 = @"AMSErrorDomainWasNil";
  }
  uint64_t v27 = [v9 code];
  id v28 = objc_msgSend(v9, "ams_title");
  id v29 = objc_msgSend(v9, "ams_message");
  id v30 = objc_msgSend(v9, "ams_underlyingError");

  uint64_t v31 = AMSCustomCodableError(v26, v27, v28, v29, v14, v30);

  return v31;
}

- (id)_retryTask:(id)a3 action:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AMSURLTaskInfo taskInfoForTask:v6];
  id v9 = [v8 properties];
  [v8 assertIsOnPrivateQueue];
  [v6 cancel];
  __int16 v10 = [AMSURLRequest alloc];
  id v11 = [v6 originalRequest];
  uint64_t v12 = (void *)[v11 copy];
  id v13 = [(AMSURLRequest *)v10 initWithRequest:v12];

  [(AMSURLRequest *)v13 setProperties:v9];
  id v14 = [v7 updatedHeaders];
  [(NSMutableURLRequest *)v13 ams_addHeaders:v14];

  id v15 = [v7 updatedBody];

  if (v15)
  {
    uint64_t v16 = [v7 updatedBody];
    [(AMSURLRequest *)v13 setHTTPBody:v16];
  }
  id v17 = [v7 updatedMethod];

  if (v17)
  {
    id v18 = [v7 updatedMethod];
    [(AMSURLRequest *)v13 setHTTPMethod:v18];
  }
  if ([v7 actionType] == 1
    && ([v7 redirectURL], uint64_t v19 = objc_claimAutoreleasedReturnValue(), v19, v19))
  {
    id v20 = [v7 redirectURL];
    [(AMSURLRequest *)v13 setURL:v20];

    id v21 = @"Redirecting";
    int v58 = 1;
  }
  else
  {
    int v58 = 0;
    id v21 = @"Retrying";
  }
  uint64_t v22 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v22)
  {
    uint64_t v22 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v23 = [v22 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = v21;
    uint64_t v25 = objc_opt_class();
    [v9 logUUID];
    id v56 = v7;
    id v26 = v8;
    uint64_t v27 = self;
    id v28 = v13;
    id v29 = v6;
    uint64_t v31 = v30 = v9;
    *(_DWORD *)buf = 138543874;
    uint64_t v63 = v25;
    __int16 v64 = 2114;
    id v65 = v31;
    __int16 v66 = 2114;
    os_signpost_id_t v67 = v24;
    _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@ the request...", buf, 0x20u);

    id v9 = v30;
    id v6 = v29;
    id v13 = v28;
    self = v27;
    id v8 = v26;
    id v7 = v56;
  }

  uint64_t v32 = [v7 retryIdentifier];

  if (v32
    && ([v8 retryIdentifiers],
        SEL v33 = objc_claimAutoreleasedReturnValue(),
        [v7 retryIdentifier],
        uint64_t v34 = objc_claimAutoreleasedReturnValue(),
        char v35 = [v33 containsObject:v34],
        v34,
        v33,
        (v35 & 1) == 0))
  {
    id v36 = [v7 retryIdentifier];
    [v8 addRetryIdentifier:v36];
  }
  else
  {
    objc_msgSend(v8, "setRetryCount:", objc_msgSend(v8, "retryCount") + 1);
    if (v58 && [v8 retryCount] >= 1) {
      [v8 setRetryCount:0];
    }
  }
  uint64_t v37 = [v8 retryCount];
  if (v37 <= [v9 maxRetryCount])
  {
    __int16 v42 = [(AMSURLSession *)self protocolHandler];
    if (v42)
    {
      uint64_t v45 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v45)
      {
        uint64_t v45 = +[AMSLogConfig sharedConfig];
      }
      id v46 = [v45 OSLogObject];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        id v47 = v6;
        id v48 = v9;
        uint64_t v49 = objc_opt_class();
        AMSLogKey();
        id v57 = v7;
        uint64_t v50 = v8;
        v52 = __int16 v51 = self;
        *(_DWORD *)buf = 138543618;
        uint64_t v63 = v49;
        id v9 = v48;
        id v6 = v47;
        __int16 v64 = 2114;
        id v65 = v52;
        _os_log_impl(&dword_18D554000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Protocol handler reconfigure request", buf, 0x16u);

        self = v51;
        id v8 = v50;
        id v7 = v57;
      }

      uint64_t v53 = [(AMSURLSession *)self _reconfigureNewRequest:v13 originalTask:v6 protocolHandler:v42 redirect:0];
    }
    else
    {
      uint64_t v53 = +[AMSPromise promiseWithResult:v13];
    }
    uint64_t v43 = (void *)v53;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __35__AMSURLSession__retryTask_action___block_invoke;
    v59[3] = &unk_1E55A1E88;
    v59[4] = self;
    id v60 = v8;
    id v61 = v6;
    id v54 = [v43 thenWithBlock:v59];
    uint64_t v44 = [v54 binaryPromiseAdapter];
  }
  else
  {
    id v38 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v38)
    {
      id v38 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v39 = [v38 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      uint64_t v40 = objc_opt_class();
      uint64_t v41 = [v9 logUUID];
      *(_DWORD *)buf = 138543618;
      uint64_t v63 = v40;
      __int16 v64 = 2114;
      id v65 = v41;
      _os_log_impl(&dword_18D554000, v39, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Exceeded max retry count", buf, 0x16u);
    }
    objc_msgSend(NSString, "stringWithFormat:", @"Task reached max retry count (%ld / %ld);",
      [v8 retryCount] - 1,
    __int16 v42 = [v9 maxRetryCount]);
    uint64_t v43 = AMSError(306, @"Reached max retry count", v42, 0);
    uint64_t v44 = +[AMSBinaryPromise promiseWithError:v43];
  }

  return v44;
}

AMSMutablePromise *__35__AMSURLSession__retryTask_action___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_alloc_init(AMSMutablePromise);
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) signpostID];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __35__AMSURLSession__retryTask_action___block_invoke_2;
  v14[3] = &unk_1E55A80E0;
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  id v17 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __35__AMSURLSession__retryTask_action___block_invoke_3;
  v11[3] = &unk_1E559EA10;
  id v7 = v17;
  uint64_t v12 = v7;
  id v13 = *(id *)(a1 + 40);
  [v5 createDataTaskWithRequest:v3 signpostID:v6 activity:0 dataTaskCreationCompletionHandler:v14 requestCompletionHandler:v11];

  id v8 = v13;
  id v9 = v7;

  return v9;
}

void __35__AMSURLSession__retryTask_action___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AMSURLTaskInfo taskInfoForTask:v3];
  [v4 migrateFromTaskInfo:*(void *)(a1 + 32)];
  +[AMSURLTaskInfo removeTaskInfoForTask:*(void *)(a1 + 40)];
  [v3 resume];

  [*(id *)(a1 + 48) finishWithResult:MEMORY[0x1E4F1CC38]];
}

void __35__AMSURLSession__retryTask_action___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v5 && ([*(id *)(a1 + 32) isFinished] & 1) == 0)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    id v7 = AMSError(300, @"Retry Failed", @"Encountered a <nil> task while redirecting the request", v5);
    [v6 finishWithError:v7];
  }
  id v8 = [*(id *)(a1 + 40) completionBlock];
  ((void (**)(void, id, id))v8)[2](v8, v9, v5);
}

void __41__AMSURLSession__prepareRequest_logUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = AMSLogableError(v3);
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Request encoding failed with error: %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)_reconfigureNewRequest:(id)a3 originalTask:(id)a4 protocolHandler:(id)a5 redirect:(BOOL)a6
{
  uint64_t v6 = a6;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  __int16 v13 = +[AMSURLTaskInfo taskInfoForTask:v11];
  [v13 assertIsOnPrivateQueue];
  id v14 = objc_alloc_init(AMSMutablePromise);
  if ([(AMSURLSession *)self _protocolHandler:v10 canUseAlternateImplementationOfSelector:sel_reconfigureNewRequest_originalTask_redirect_error_])
  {
    uint64_t v15 = [(AMSPromise *)v14 completionHandlerAdapter];
    [v10 reconfigureNewRequest:v12 originalTask:v11 redirect:v6 completionHandler:v15];
  }
  else
  {
    id v16 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v16)
    {
      id v16 = +[AMSLogConfig sharedConfig];
    }
    id v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v28 = v6;
      uint64_t v18 = AMSLogKey();
      uint64_t v27 = NSString;
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = v19;
      id v29 = (void *)v18;
      if (v18)
      {
        uint64_t v26 = AMSLogKey();
        [v27 stringWithFormat:@"%@: [%@] ", v20, v26];
      }
      else
      {
        [v27 stringWithFormat:@"%@: ", v19];
      id v21 = };
      uint64_t v22 = NSStringFromSelector(sel_reconfigureNewRequest_originalTask_redirect_error_);
      uint64_t v23 = NSStringFromSelector(sel_reconfigureNewRequest_originalTask_redirect_completionHandler_);
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v21;
      __int16 v33 = 2114;
      uint64_t v34 = v22;
      __int16 v35 = 2114;
      id v36 = v23;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@ is deprecated. %{public}@ should be used instead.", buf, 0x20u);
      if (v29)
      {

        id v21 = (void *)v26;
      }

      uint64_t v6 = v28;
    }

    uint64_t v15 = (void *)[v12 mutableCopy];
    id v30 = 0;
    [v10 reconfigureNewRequest:v15 originalTask:v11 redirect:v6 error:&v30];

    id v24 = v30;
    [(AMSMutablePromise *)v14 finishWithResult:v15 error:v24];
  }
  return v14;
}

- (void)setDelegateProxy:(id)a3
{
}

- (BOOL)useFallbackBag
{
  return self->_useFallbackBag;
}

- (AMSURLSecurityPolicy)securityPolicy
{
  return self->_securityPolicy;
}

- (void)setSecurityPolicy:(id)a3
{
}

@end