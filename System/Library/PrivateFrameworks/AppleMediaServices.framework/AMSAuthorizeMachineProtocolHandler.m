@interface AMSAuthorizeMachineProtocolHandler
- (id)reconfigureRequestHandler;
- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6;
- (void)setReconfigureRequestHandler:(id)a3;
@end

@implementation AMSAuthorizeMachineProtocolHandler

- (void)reconfigureNewRequest:(id)a3 originalTask:(id)a4 redirect:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = +[AMSLogConfig sharedConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = a6;
    v15 = objc_opt_class();
    id v16 = v15;
    v17 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    v30 = v15;
    a6 = v14;
    __int16 v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Reconfiguring request for authorization/deauthorization", buf, 0x16u);
  }
  v18 = [(AMSAuthorizeMachineProtocolHandler *)self reconfigureRequestHandler];

  if (v18)
  {
    v19 = [(AMSAuthorizeMachineProtocolHandler *)self reconfigureRequestHandler];
    ((void (**)(void, id))v19)[2](v19, v10);
  }
  v20 = [v11 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v21 = v20;
  }
  else {
    id v21 = 0;
  }

  if ([v21 statusCode] < 300 || objc_msgSend(v21, "statusCode") >= 400)
  {
    v22 = +[AMSLogConfig sharedConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = a6;
      v25 = objc_opt_class();
      id v26 = v25;
      v27 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      v30 = v25;
      a6 = v24;
      __int16 v31 = 2114;
      v32 = v27;
      _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Overriding redirect on reconfigured request for authorization/deauthorization", buf, 0x16u);
    }
    BOOL v7 = 0;
  }
  v28.receiver = self;
  v28.super_class = (Class)AMSAuthorizeMachineProtocolHandler;
  [(AMSURLProtocolHandler *)&v28 reconfigureNewRequest:v10 originalTask:v11 redirect:v7 error:a6];
}

- (id)reconfigureRequestHandler
{
  return self->_reconfigureRequestHandler;
}

- (void)setReconfigureRequestHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end