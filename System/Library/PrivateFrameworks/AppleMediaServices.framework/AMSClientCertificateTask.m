@interface AMSClientCertificateTask
- (AMSClientCertificateTask)initWithOptions:(id)a3;
- (AMSKeychainOptions)options;
- (id)performClientCertChainRequest;
@end

@implementation AMSClientCertificateTask

- (AMSClientCertificateTask)initWithOptions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSClientCertificateTask;
  v5 = [(AMSTask *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    options = v5->_options;
    v5->_options = (AMSKeychainOptions *)v6;
  }
  return v5;
}

- (id)performClientCertChainRequest
{
  v3 = +[AMSProcessInfo currentProcess];
  id v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.amsaccountsd"];

  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__19;
  v21 = __Block_byref_object_dispose__19;
  id v22 = 0;
  if (!v5
    || (uint64_t v6 = NSClassFromString(&cfstr_Amsdsecurityse.isa)) == 0
    || (id v7 = objc_alloc_init(v6),
        +[AMSPromise promiseWithResult:v7],
        v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    objc_super v9 = objc_alloc_init(AMSDaemonConnection);
    v10 = (void *)v18[5];
    v18[5] = (uint64_t)v9;

    v8 = [(id)v18[5] securityServiceProxyWithDelegate:0];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke;
  v16[3] = &unk_1E55A1130;
  v16[4] = self;
  v11 = [v8 thenWithBlock:v16];
  v12 = v11;
  if (v18[5])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_2;
    v15[3] = &unk_1E55A1158;
    v15[4] = &v17;
    [v11 addFinishBlock:v15];
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_3;
  v14[3] = &unk_1E559F028;
  v14[4] = self;
  [v12 addErrorBlock:v14];
  _Block_object_dispose(&v17, 8);

  return v12;
}

AMSPromise *__57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init(AMSPromise);
  int v5 = [*(id *)(a1 + 32) options];
  uint64_t v6 = [(AMSPromise *)v4 completionHandlerAdapter];
  [v3 performClientCertChainRequestWithOptions:v5 completion:v6];

  return v4;
}

void __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __57__AMSClientCertificateTask_performClientCertChainRequest__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = +[AMSLogConfig sharedConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  int v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = AMSLogKey();
    id v7 = NSString;
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = v8;
    if (v6)
    {
      a1 = AMSLogKey();
      [v7 stringWithFormat:@"%@: [%@] ", v9, a1];
    }
    else
    {
      [v7 stringWithFormat:@"%@: ", v8];
    v10 = };
    v11 = AMSLogableError(v3);
    *(_DWORD *)buf = 138543618;
    v13 = v10;
    __int16 v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_ERROR, "%{public}@Failed to perform client cert chain request: %{public}@", buf, 0x16u);
    if (v6)
    {

      v10 = (void *)a1;
    }
  }
}

- (AMSKeychainOptions)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end