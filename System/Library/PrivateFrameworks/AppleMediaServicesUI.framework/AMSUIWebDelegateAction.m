@interface AMSUIWebDelegateAction
- (AMSUIWebDelegateAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSDictionary)delegateData;
- (id)_didResolveWithResult:(id)a3 error:(id)a4;
- (id)_handleActionObject:(id)a3;
- (id)_handleResolveActionWithData:(id)a3;
- (id)_infoWithBuyParams:(id)a3 additionalInfo:(id)a4;
- (id)runAction;
- (void)setDelegateData:(id)a3;
@end

@implementation AMSUIWebDelegateAction

- (AMSUIWebDelegateAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebDelegateAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"data"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    delegateData = v7->_delegateData;
    v7->_delegateData = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebDelegateAction;
  id v3 = [(AMSUIWebAction *)&v15 runAction];
  v4 = [(AMSUIWebDelegateAction *)self delegateData];
  v5 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v5)
  {
    v5 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v17 = v7;
    __int16 v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_21C134000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Running delegate action", buf, 0x16u);
  }
  v9 = [(AMSUIWebDelegateAction *)self _handleResolveActionWithData:v4];
  if (!v9)
  {
    v9 = [(AMSUIWebDelegateAction *)self _handleActionObject:v4];
    if (!v9)
    {
      v10 = (void *)MEMORY[0x263F27E10];
      v11 = AMSError();
      v9 = [v10 promiseWithError:v11];
    }
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __35__AMSUIWebDelegateAction_runAction__block_invoke;
  v14[3] = &unk_2643E3570;
  v14[4] = self;
  [v9 addErrorBlock:v14];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__AMSUIWebDelegateAction_runAction__block_invoke_51;
  v13[3] = &unk_2643E4C58;
  v13[4] = self;
  [v9 addSuccessBlock:v13];

  return v9;
}

void __35__AMSUIWebDelegateAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 32) context];
    v8 = [v7 logKey];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    objc_super v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Delegate action failed. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void __35__AMSUIWebDelegateAction_runAction__block_invoke_51(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 32) context];
    v8 = [v7 logKey];
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    objc_super v12 = v8;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate action succeeded. %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

- (id)_handleResolveActionWithData:(id)a3
{
  v57[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"action"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  if ([v6 isEqualToString:@"resolve"])
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"state"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }

    if ([v8 isEqualToString:@"success"])
    {
      __int16 v11 = [v4 objectForKeyedSubscript:@"buyParams"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }

      uint64_t v15 = (void *)MEMORY[0x263EFFA08];
      v57[0] = @"buyParams";
      v57[1] = @"action";
      v57[2] = @"state";
      v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:3];
      uint64_t v17 = [v15 setWithArray:v16];

      uint64_t v48 = MEMORY[0x263EF8330];
      uint64_t v49 = 3221225472;
      v50 = __55__AMSUIWebDelegateAction__handleResolveActionWithData___block_invoke;
      v51 = &unk_2643E4278;
      id v52 = v17;
      id v18 = v17;
      v19 = objc_msgSend(v4, "ams_filterUsingTest:", &v48);
      uint64_t v10 = [(AMSUIWebDelegateAction *)self _infoWithBuyParams:v12 additionalInfo:v19];

      uint64_t v9 = 0;
    }
    else
    {
      if ([v8 isEqualToString:@"failed"])
      {
        __int16 v13 = [v4 objectForKeyedSubscript:@"error"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v14 = v13;
        }
        else {
          id v14 = 0;
        }

        if (v14)
        {
          uint64_t v20 = [v14 objectForKeyedSubscript:@"code"];
          if (objc_opt_respondsToSelector())
          {
            v21 = [v14 objectForKeyedSubscript:@"code"];
            [v21 longLongValue];
          }
          v22 = [v14 objectForKeyedSubscript:@"message"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            v23 = v22;
          }
          else {
            v23 = 0;
          }

          v24 = @"Unknown Error";
          if (v23) {
            v24 = v23;
          }
          v25 = v24;

          v26 = [v14 objectForKeyedSubscript:@"userInfo"];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v27 = v26;
          }
          else {
            id v27 = 0;
          }

          uint64_t v9 = AMSCustomError();
        }
        else
        {
          uint64_t v9 = AMSError();
        }
      }
      else
      {
        uint64_t v9 = 0;
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  v28 = [v4 objectForKeyedSubscript:@"actionName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v29 = v28;
  }
  else {
    id v29 = 0;
  }

  if (!(v10 | v9))
  {
    if (![v29 isEqualToString:@"interruptionResolved"])
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      goto LABEL_53;
    }
    v30 = [v4 objectForKeyedSubscript:@"options"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v31 = v30;
    }
    else {
      id v31 = 0;
    }

    v32 = [v31 objectForKeyedSubscript:@"status"];
    if (objc_opt_respondsToSelector())
    {
      v33 = [v31 objectForKeyedSubscript:@"status"];
      uint64_t v34 = [v33 longLongValue];

      if (v34)
      {
        id v35 = [NSNumber numberWithLong:v34];
        id v47 = v35;
        uint64_t v9 = AMSErrorWithFormat();
        uint64_t v10 = 0;
LABEL_52:

        goto LABEL_53;
      }
    }
    else
    {
    }
    v36 = [v31 objectForKeyedSubscript:@"buyParams"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v35 = v36;
    }
    else {
      id v35 = 0;
    }

    uint64_t v10 = [(AMSUIWebDelegateAction *)self _infoWithBuyParams:v35 additionalInfo:v31];
    uint64_t v9 = 0;
    goto LABEL_52;
  }
LABEL_53:
  uint64_t v37 = objc_msgSend(MEMORY[0x263F27CB8], "sharedWebUIConfig", v47, v48, v49, v50, v51);
  v38 = (void *)v37;
  if (v10 | v9)
  {
    if (!v37)
    {
      v38 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v43 = [v38 OSLogObject];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v44 = objc_opt_class();
      v45 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v54 = v44;
      __int16 v55 = 2114;
      v56 = v45;
      _os_log_impl(&dword_21C134000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action is a resolve action", buf, 0x16u);
    }
    v42 = [(AMSUIWebDelegateAction *)self _didResolveWithResult:v10 error:v9];
  }
  else
  {
    if (!v37)
    {
      v38 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v39 = [v38 OSLogObject];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = objc_opt_class();
      v41 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v54 = v40;
      __int16 v55 = 2114;
      v56 = v41;
      _os_log_impl(&dword_21C134000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Action is not a resolve action", buf, 0x16u);
    }
    v42 = 0;
  }

  return v42;
}

uint64_t __55__AMSUIWebDelegateAction__handleResolveActionWithData___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

- (id)_infoWithBuyParams:(id)a3 additionalInfo:(id)a4
{
  id v5 = a3;
  id v6 = (void *)[a4 mutableCopy];
  uint64_t v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  uint64_t v9 = v8;

  [v9 setObject:v5 forKeyedSubscript:*MEMORY[0x263F27848]];
  return v9;
}

- (id)_handleActionObject:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSUIWebAction *)self context];
  id v6 = [v5 actionDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(AMSUIWebAction *)self context];
    uint64_t v9 = [v8 actionDelegate];
    uint64_t v10 = [v9 action:self handleActionObject:v4];
  }
  else
  {
    __int16 v11 = (void *)MEMORY[0x263F27E10];
    id v8 = [(AMSUIWebAction *)self context];
    uint64_t v9 = [v8 actionDelegate];
    id v12 = AMSErrorWithFormat();
    uint64_t v10 = objc_msgSend(v11, "promiseWithError:", v12, v9);
  }
  return v10;
}

- (id)_didResolveWithResult:(id)a3 error:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AMSUIWebAction *)self context];
  uint64_t v9 = [v8 actionDelegate];
  char v10 = objc_opt_respondsToSelector();

  uint64_t v11 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  id v12 = (void *)v11;
  if (v10)
  {
    if (!v11)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    __int16 v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      uint64_t v15 = AMSLogKey();
      *(_DWORD *)buf = 138544130;
      uint64_t v26 = v14;
      __int16 v27 = 2114;
      v28 = v15;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2114;
      id v32 = v7;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Forwarding resolve payload to delegate: Result=%{public}@ Error=%{public}@", buf, 0x2Au);
    }
    v16 = [(AMSUIWebAction *)self context];
    uint64_t v17 = [v16 actionDelegate];
    id v18 = [v17 action:self didResolveWithResult:v6 error:v7];
  }
  else
  {
    if (!v11)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v19 = [v12 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = v20;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_impl(&dword_21C134000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Delegate does not handle resolve action.", buf, 0x16u);
    }
    v22 = (void *)MEMORY[0x263F27E10];
    v16 = [(AMSUIWebAction *)self context];
    uint64_t v17 = [v16 actionDelegate];
    v23 = AMSErrorWithFormat();
    id v18 = objc_msgSend(v22, "promiseWithError:", v23, v17);
  }
  return v18;
}

- (NSDictionary)delegateData
{
  return self->_delegateData;
}

- (void)setDelegateData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end