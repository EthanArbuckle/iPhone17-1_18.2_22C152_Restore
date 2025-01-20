@interface AMSUIWebAction
- (AMSMetricsEvent)actionEvent;
- (AMSUIWebAction)initWithJSObject:(id)a3 context:(id)a4;
- (AMSUIWebClientContext)context;
- (NSArray)acceptedResponseVersions;
- (NSString)presentingSceneBundleIdentifier;
- (NSString)presentingSceneIdentifier;
- (id)_initWithContext:(id)a3;
- (id)presentingSceneBundleIdentifierPromise;
- (id)presentingSceneIdentifierPromise;
- (id)runAction;
- (void)setAcceptedResponseVersions:(id)a3;
- (void)setContext:(id)a3;
@end

@implementation AMSUIWebAction

- (AMSUIWebAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(AMSUIWebAction *)self _initWithContext:v7];
  if (v8)
  {
    v9 = [v6 objectForKeyedSubscript:@"actionEvent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v9;
    }
    else {
      id v10 = 0;
    }

    if (v10)
    {
      v11 = [[AMSUIWebMetricsEvent alloc] initWithJSObject:v10 context:v7];
      actionEvent = v8->_actionEvent;
      v8->_actionEvent = &v11->super;
    }
    v13 = [v6 objectForKeyedSubscript:@"acceptedResponseVersions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }

    if (v14) {
      objc_storeStrong((id *)&v8->_acceptedResponseVersions, v14);
    }
  }
  return v8;
}

- (id)_initWithContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSUIWebAction;
  id v6 = [(AMSUIWebAction *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_context, a3);
  }

  return v7;
}

- (id)runAction
{
  v3 = [(AMSUIWebAction *)self actionEvent];

  if (v3)
  {
    v4 = [(AMSUIWebAction *)self context];
    id v5 = [v4 metrics];
    id v6 = [(AMSUIWebAction *)self actionEvent];
    [v5 enqueueEvent:v6];
  }
  id v7 = (void *)MEMORY[0x263F27E10];
  uint64_t v8 = MEMORY[0x263EFFA88];
  return (id)[v7 promiseWithResult:v8];
}

- (NSString)presentingSceneBundleIdentifier
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [(AMSUIWebAction *)self context];
  v4 = [v3 clientInfo];
  id v5 = [v4 bundleIdentifier];

  id v6 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v6)
  {
    id v6 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  id v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = AMSLogKey();
    objc_super v9 = NSString;
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = v10;
    if (v8)
    {
      AMSLogKey();
      self = (AMSUIWebAction *)objc_claimAutoreleasedReturnValue();
      [v9 stringWithFormat:@"%@: [%@] ", v11, self];
    }
    else
    {
      [v9 stringWithFormat:@"%@: ", v10];
    v12 = };
    v13 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    __int16 v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_21C134000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Using scene bundle identifier: %{public}@", buf, 0x16u);
    if (v8)
    {

      v12 = self;
    }
  }
  return (NSString *)v5;
}

- (id)presentingSceneBundleIdentifierPromise
{
  id v3 = objc_alloc_init(MEMORY[0x263F27D90]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __56__AMSUIWebAction_presentingSceneBundleIdentifierPromise__block_invoke;
  v11[3] = &unk_2643E34D0;
  v11[4] = self;
  id v4 = v3;
  id v12 = v4;
  id v5 = v11;
  id v6 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_5;
  block[3] = &unk_2643E33B0;
  id v14 = v6;
  id v15 = v5;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  uint64_t v8 = v12;
  id v9 = v4;

  return v9;
}

void __56__AMSUIWebAction_presentingSceneBundleIdentifierPromise__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentingSceneBundleIdentifier];
  id v3 = *(void **)(a1 + 40);
  id v5 = (id)v2;
  if (v2) {
    [MEMORY[0x263F27DD0] optionalWithValue:v2];
  }
  else {
  id v4 = [MEMORY[0x263F27DD0] optionalWithNil];
  }
  [v3 finishWithResult:v4];
}

- (NSString)presentingSceneIdentifier
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v4 = [(AMSUIWebAction *)self context];
  id v5 = [v4 flowController];
  id v6 = [v5 currentContainer];
  id v7 = [v6 view];
  uint64_t v8 = [v7 window];
  id v9 = [v8 windowScene];
  uint64_t v10 = [v9 session];
  uint64_t v11 = [v10 persistentIdentifier];

  if (v11)
  {
    id v12 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v12)
    {
      id v12 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = AMSLogKey();
      id v15 = NSString;
      uint64_t v16 = objc_opt_class();
      v30 = a2;
      if (v14)
      {
        __int16 v17 = AMSLogKey();
        uint64_t v29 = NSStringFromSelector(a2);
        [v15 stringWithFormat:@"%@: [%@] %@ ", v16, v17, v29];
      }
      else
      {
        __int16 v17 = NSStringFromSelector(a2);
        [v15 stringWithFormat:@"%@: %@ ", v16, v17];
      v18 = };
      uint64_t v19 = AMSHashIfNeeded();
      id v5 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543874;
      v32 = v18;
      __int16 v33 = 2114;
      v34 = v19;
      __int16 v35 = 2114;
      v36 = v5;
      _os_log_impl(&dword_21C134000, v13, OS_LOG_TYPE_DEBUG, "%{public}@Found scene identifier %{public}@ in %{public}@", buf, 0x20u);
      if (v14)
      {

        v18 = (void *)v29;
      }

      a2 = v30;
    }
  }
  v20 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v20)
  {
    v20 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v21 = [v20 OSLogObject];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = AMSLogKey();
    v23 = NSString;
    uint64_t v24 = objc_opt_class();
    if (v22)
    {
      v25 = AMSLogKey();
      id v5 = NSStringFromSelector(a2);
      [v23 stringWithFormat:@"%@: [%@] %@ ", v24, v25, v5];
    }
    else
    {
      v25 = NSStringFromSelector(a2);
      [v23 stringWithFormat:@"%@: %@ ", v24, v25];
    v26 = };
    v27 = AMSHashIfNeeded();
    *(_DWORD *)buf = 138543618;
    v32 = v26;
    __int16 v33 = 2114;
    v34 = v27;
    _os_log_impl(&dword_21C134000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Using scene identifier: %{public}@", buf, 0x16u);
    if (v22)
    {

      v26 = v5;
    }
  }
  return (NSString *)v11;
}

- (id)presentingSceneIdentifierPromise
{
  id v3 = objc_alloc_init(MEMORY[0x263F27D90]);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __50__AMSUIWebAction_presentingSceneIdentifierPromise__block_invoke;
  v11[3] = &unk_2643E34D0;
  v11[4] = self;
  id v4 = v3;
  id v12 = v4;
  id v5 = v11;
  id v6 = AMSLogKey();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __AMSDispatchAsync_block_invoke_5;
  block[3] = &unk_2643E33B0;
  id v14 = v6;
  id v15 = v5;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  uint64_t v8 = v12;
  id v9 = v4;

  return v9;
}

void __50__AMSUIWebAction_presentingSceneIdentifierPromise__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentingSceneIdentifier];
  id v3 = *(void **)(a1 + 40);
  id v5 = (id)v2;
  if (v2) {
    [MEMORY[0x263F27DD0] optionalWithValue:v2];
  }
  else {
  id v4 = [MEMORY[0x263F27DD0] optionalWithNil];
  }
  [v3 finishWithResult:v4];
}

- (NSArray)acceptedResponseVersions
{
  return self->_acceptedResponseVersions;
}

- (void)setAcceptedResponseVersions:(id)a3
{
}

- (AMSUIWebClientContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (AMSMetricsEvent)actionEvent
{
  return self->_actionEvent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionEvent, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_acceptedResponseVersions, 0);
}

@end