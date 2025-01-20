@interface AMSUIWebLocalApproveAction
- (AMSUIWebLocalApproveAction)initWithJSObject:(id)a3 context:(id)a4;
- (NSString)itemIdentifier;
- (id)runAction;
- (void)setItemIdentifier:(id)a3;
@end

@implementation AMSUIWebLocalApproveAction

- (AMSUIWebLocalApproveAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIWebLocalApproveAction;
  v7 = [(AMSUIWebAction *)&v12 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"itemIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v8;
    }
    else {
      v9 = 0;
    }

    itemIdentifier = v7->_itemIdentifier;
    v7->_itemIdentifier = v9;
  }
  return v7;
}

- (id)runAction
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v22.receiver = self;
  v22.super_class = (Class)AMSUIWebLocalApproveAction;
  id v3 = [(AMSUIWebAction *)&v22 runAction];
  v4 = [(AMSUIWebLocalApproveAction *)self itemIdentifier];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    v14 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v14)
    {
      v14 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      v17 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v17;
      _os_log_impl(&dword_21C134000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] No itemIdentifier found", buf, 0x16u);
    }
    v18 = (void *)MEMORY[0x263F27E10];
    AMSError();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = [v18 promiseWithError:v12];
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x263F27E10]);
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x2050000000;
    v7 = (void *)getAPRequestHandlerClass_softClass_0;
    uint64_t v26 = getAPRequestHandlerClass_softClass_0;
    if (!getAPRequestHandlerClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getAPRequestHandlerClass_block_invoke_0;
      v28 = &unk_2643E33D8;
      v29 = &v23;
      __getAPRequestHandlerClass_block_invoke_0((uint64_t)buf);
      v7 = (void *)v24[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v23, 8);
    v9 = [(AMSUIWebLocalApproveAction *)self itemIdentifier];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __39__AMSUIWebLocalApproveAction_runAction__block_invoke;
    v20[3] = &unk_2643E37F8;
    v20[4] = self;
    id v10 = v6;
    id v21 = v10;
    [v8 localApproveRequestWithItemIdentifier:v9 completion:v20];

    v11 = v21;
    id v12 = v10;

    v13 = v12;
  }

  return v13;
}

void __39__AMSUIWebLocalApproveAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v4)
    {
      v4 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    BOOL v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = objc_opt_class();
      v7 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      __int16 v17 = 2114;
      id v18 = v3;
      _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] APRequestHandler encountered error: %{public}@", buf, 0x20u);
    }
  }
  id v8 = objc_msgSend(NSNumber, "numberWithBool:", v3 == 0, @"approved");
  v11[1] = @"itemIdentifier";
  v12[0] = v8;
  v9 = [*(id *)(a1 + 32) itemIdentifier];
  v12[1] = v9;
  id v10 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  [*(id *)(a1 + 40) finishWithResult:v10];
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end