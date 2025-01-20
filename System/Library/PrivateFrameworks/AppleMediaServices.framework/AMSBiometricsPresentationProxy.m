@interface AMSBiometricsPresentationProxy
- (AMSBiometricsPresentationProxy)initWithSession:(id)a3 task:(id)a4;
- (AMSURLSession)session;
- (NSURLSessionTask)task;
- (OS_dispatch_queue)delegateQueue;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)setDelegateQueue:(id)a3;
@end

@implementation AMSBiometricsPresentationProxy

- (AMSBiometricsPresentationProxy)initWithSession:(id)a3 task:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AMSBiometricsPresentationProxy;
  v9 = [(AMSBiometricsPresentationProxy *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_task, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AppleMediaServices.AMSBiometricsPresentationProxy.delegatePresentQueue", v11);
    delegateQueue = v10->_delegateQueue;
    v10->_delegateQueue = (OS_dispatch_queue *)v12;
  }
  return v10;
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSBiometricsPresentationProxy *)self session];
  v9 = [v8 delegate];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__AMSBiometricsPresentationProxy_handleAuthenticateRequest_completion___block_invoke;
    block[3] = &unk_1E55A0640;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_async(delegateQueue, block);
  }
  else
  {
    dispatch_queue_t v12 = AMSError(6, @"Biometrics presentation error", @"Delegate doesn't respond to AMSURLSession:task:handleAuthenticateRequest:completion:", 0);
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __71__AMSBiometricsPresentationProxy_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = +[AMSLogConfig sharedConfig];
  if (!v2)
  {
    v2 = +[AMSLogConfig sharedConfig];
  }
  v3 = [v2 OSLogObject];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_opt_class();
    id v5 = v4;
    id v6 = AMSLogKey();
    id v7 = AMSHashIfNeeded(*(void **)(a1 + 40));
    int v12 = 138543874;
    v13 = v4;
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_18D554000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running on delegate queue, calling handleAuthenticateRequest with Request: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  id v8 = [*(id *)(a1 + 32) session];
  v9 = [v8 delegate];
  char v10 = [*(id *)(a1 + 32) session];
  v11 = [*(id *)(a1 + 32) task];
  [v9 AMSURLSession:v10 task:v11 handleAuthenticateRequest:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [(AMSBiometricsPresentationProxy *)self session];
  id v8 = [v7 delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    char v10 = [(AMSBiometricsPresentationProxy *)self session];
    v11 = [v10 delegate];
    int v12 = [(AMSBiometricsPresentationProxy *)self session];
    v13 = [(AMSBiometricsPresentationProxy *)self task];
    [v11 AMSURLSession:v12 task:v13 handleDialogRequest:v14 completion:v6];

    id v6 = v11;
  }
  else
  {
    char v10 = AMSError(6, @"Biometrics presentation error", @"Delegate doesn't respond to AMSURLSession:task:handleDialogRequest:completion:", 0);
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);
  }
}

- (AMSURLSession)session
{
  return self->_session;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end