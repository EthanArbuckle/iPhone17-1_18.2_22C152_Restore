@interface AMSFollowUpAction
- (AMSFollowUpAction)initWithAction:(id)a3;
- (AMSFollowUpAction)initWithAction:(id)a3 parentIdentifier:(id)a4;
- (AMSFollowUpAction)initWithItem:(id)a3 action:(id)a4;
- (AMSFollowUpAction)initWithJSONDictionary:(id)a3 parentIdentifier:(id)a4;
- (AMSFollowUpAction)initWithLabel:(id)a3;
- (AMSFollowUpAction)initWithLabel:(id)a3 parentIdentifier:(id)a4;
- (AMSMetricsEvent)metricsEvent;
- (BOOL)requiresFollowUpUI;
- (BOOL)shouldClear;
- (NSMutableDictionary)userInfo;
- (NSString)backingIdentifier;
- (NSString)identifier;
- (NSString)label;
- (NSString)logKey;
- (NSString)parentIdentifier;
- (NSString)preferredClient;
- (NSURL)url;
- (NSURLRequest)request;
- (OS_dispatch_queue)actionQueue;
- (OS_dispatch_queue)internalQueue;
- (id)generateAction;
- (id)performActionsWithBag:(id)a3 account:(id)a4;
- (id)performActionsWithContract:(id)a3 account:(id)a4;
- (id)postMetricsWithBag:(id)a3;
- (id)postMetricsWithBagContract:(id)a3;
- (void)_setUserInfoProperty:(id)a3 forKey:(id)a4;
- (void)setActionQueue:(id)a3;
- (void)setBackingIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLogKey:(id)a3;
- (void)setMetricsEvent:(id)a3;
- (void)setParentIdentifier:(id)a3;
- (void)setPreferredClient:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRequiresFollowUpUI:(BOOL)a3;
- (void)setShouldClear:(BOOL)a3;
- (void)setUrl:(id)a3;
- (void)setUserInfo:(id)a3;
@end

@implementation AMSFollowUpAction

- (AMSFollowUpAction)initWithLabel:(id)a3 parentIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AMSFollowUpAction;
  v9 = [(AMSFollowUpAction *)&v18 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.AppleMediaServices.followUpAction", 0);
    actionQueue = v9->_actionQueue;
    v9->_actionQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.AppleMediaServices.followUpActionInternal", 0);
    internalQueue = v9->_internalQueue;
    v9->_internalQueue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v9->_label, a3);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v15 = v14;
    if (v8) {
      [(NSMutableDictionary *)v14 setObject:v8 forKey:@"AMSParentIdentifier"];
    }
    userInfo = v9->_userInfo;
    v9->_userInfo = v15;
  }
  return v9;
}

- (AMSFollowUpAction)initWithAction:(id)a3 parentIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 label];
  v9 = [(AMSFollowUpAction *)self initWithLabel:v8 parentIdentifier:v7];

  if (v9)
  {
    dispatch_queue_t v10 = [v6 userInfo];

    if (v10)
    {
      uint64_t v11 = [v6 url];
      url = v9->_url;
      v9->_url = (NSURL *)v11;

      v13 = [v6 userInfo];
      v14 = (NSMutableDictionary *)[v13 mutableCopy];

      v15 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:@"AMSMetrics"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v15;

        if (v16)
        {
          v17 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v16];
          metricsEvent = v9->_metricsEvent;
          v9->_metricsEvent = v17;

          [(NSMutableDictionary *)v14 removeObjectForKey:@"AMSMetrics"];
        }
      }
      else
      {

        id v16 = 0;
      }
      userInfo = v9->_userInfo;
      v9->_userInfo = v14;
    }
  }

  return v9;
}

- (AMSFollowUpAction)initWithItem:(id)a3 action:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[AMSFollowUpItem alloc] initWithFollowUpItem:v6];
  v9 = [(AMSFollowUpItem *)v8 identifier];
  dispatch_queue_t v10 = [(AMSFollowUpAction *)self initWithAction:v7 parentIdentifier:v9];

  if (v10)
  {
    uint64_t v11 = [v6 uniqueIdentifier];
    backingIdentifier = v10->_backingIdentifier;
    v10->_backingIdentifier = (NSString *)v11;
  }
  return v10;
}

- (AMSFollowUpAction)initWithJSONDictionary:(id)a3 parentIdentifier:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKeyedSubscript:@"title"];
  v9 = [(AMSFollowUpAction *)self initWithLabel:v8 parentIdentifier:v7];

  if (v9)
  {
    dispatch_queue_t v10 = [v6 objectForKeyedSubscript:@"clear"];
    if (objc_opt_respondsToSelector()) {
      uint64_t v11 = [v10 BOOLValue];
    }
    else {
      uint64_t v11 = 0;
    }
    dispatch_queue_t v12 = [v6 objectForKeyedSubscript:@"clientActionDeepLink"];
    v13 = [v6 objectForKeyedSubscript:@"financeLink"];
    v14 = [v6 objectForKeyedSubscript:@"metrics"];
    v15 = [v6 objectForKeyedSubscript:@"serverActionUrl"];
    id v16 = v15;
    v43 = v14;
    if (v15)
    {
      unsigned int v40 = v11;
      v41 = v13;
      v17 = [v15 objectForKeyedSubscript:@"url"];
      objc_super v18 = [v16 objectForKeyedSubscript:@"method"];
      v19 = [v16 objectForKeyedSubscript:@"body"];
      if (v17)
      {
        v39 = v12;
        uint64_t v20 = [MEMORY[0x1E4F1CB10] URLWithString:v17];
        if (v20)
        {
          v21 = (void *)v20;
          v22 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v20];
          v23 = v22;
          if (v18) {
            v24 = v18;
          }
          else {
            v24 = @"GET";
          }
          [v22 setHTTPMethod:v24];
          [v19 dataUsingEncoding:4];
          v38 = v8;
          v26 = v25 = v10;
          [v23 setHTTPBody:v26];

          dispatch_queue_t v10 = v25;
          id v8 = v38;
        }
        else
        {
          v23 = 0;
        }
        dispatch_queue_t v12 = v39;
      }
      else
      {
        v23 = 0;
      }

      v13 = v41;
      v14 = v43;
      uint64_t v11 = v40;
    }
    else
    {
      v23 = 0;
    }
    [(AMSFollowUpAction *)v9 setRequest:v23];
    [(AMSFollowUpAction *)v9 setShouldClear:v11];
    if (v14)
    {
      v27 = [[AMSMetricsEvent alloc] initWithUnderlyingDictionary:v14];
      metricsEvent = v9->_metricsEvent;
      v9->_metricsEvent = v27;
    }
    if (v13)
    {
      [(AMSFollowUpAction *)v9 setRequiresFollowUpUI:1];
      uint64_t v29 = [MEMORY[0x1E4F1CB10] URLWithString:v13];
      url = v9->_url;
      v9->_url = (NSURL *)v29;

      if (v12)
      {
        v31 = +[AMSLogConfig sharedFollowUpConfig];
        if (!v31)
        {
          v31 = +[AMSLogConfig sharedConfig];
        }
        v32 = [v31 OSLogObject];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v45 = (id)objc_opt_class();
          v42 = v13;
          v33 = v12;
          id v34 = v45;
          _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring clientActionDeepLink due to existance of financeLink", buf, 0xCu);

          dispatch_queue_t v12 = v33;
          v13 = v42;
        }

        v14 = v43;
      }
    }
    else if (v12)
    {
      uint64_t v35 = [MEMORY[0x1E4F1CB10] URLWithString:v12];
      v36 = v9->_url;
      v9->_url = (NSURL *)v35;
    }
  }

  return v9;
}

- (NSString)logKey
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__33;
  uint64_t v11 = __Block_byref_object_dispose__33;
  id v12 = 0;
  v3 = [(AMSFollowUpAction *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__AMSFollowUpAction_logKey__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __27__AMSFollowUpAction_logKey__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSLogKey"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v5 = AMSGenerateLogCorrelationKey();
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:@"AMSLogKey"];

    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSLogKey"];
    MEMORY[0x1F41817F8]();
  }
}

- (NSString)parentIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__33;
  uint64_t v11 = __Block_byref_object_dispose__33;
  id v12 = 0;
  uint64_t v3 = [(AMSFollowUpAction *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__AMSFollowUpAction_parentIdentifier__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __37__AMSFollowUpAction_parentIdentifier__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSParentIdentifier"];
  return MEMORY[0x1F41817F8]();
}

- (NSString)preferredClient
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__33;
  uint64_t v11 = __Block_byref_object_dispose__33;
  id v12 = 0;
  uint64_t v3 = [(AMSFollowUpAction *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__AMSFollowUpAction_preferredClient__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

uint64_t __36__AMSFollowUpAction_preferredClient__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSPreferredClient"];
  return MEMORY[0x1F41817F8]();
}

- (NSURLRequest)request
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__33;
  uint64_t v11 = __Block_byref_object_dispose__33;
  id v12 = 0;
  uint64_t v3 = [(AMSFollowUpAction *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__AMSFollowUpAction_request__block_invoke;
  v6[3] = &unk_1E55A30A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSURLRequest *)v4;
}

void __28__AMSFollowUpAction_request__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSRequest"];
  if (v2)
  {
    id v11 = v2;
    uint64_t v3 = [v2 objectForKeyedSubscript:@"AMSRequestURL"];
    id v4 = [v11 objectForKeyedSubscript:@"AMSRequestBody"];
    v5 = [v11 objectForKeyedSubscript:@"AMSRequestMethod"];
    id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    if (v6)
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v6];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      if (v5) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHTTPMethod:v5];
      }
      if (v4)
      {
        dispatch_queue_t v10 = [v4 dataUsingEncoding:4];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setHTTPBody:v10];
      }
    }

    uint64_t v2 = v11;
  }
}

- (BOOL)requiresFollowUpUI
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(AMSFollowUpAction *)self internalQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AMSFollowUpAction_requiresFollowUpUI__block_invoke;
  v5[3] = &unk_1E55A30A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __39__AMSFollowUpAction_requiresFollowUpUI__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSRequiresFollowUpUI"];
  if (objc_opt_respondsToSelector()) {
    char v2 = [v3 BOOLValue];
  }
  else {
    char v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (BOOL)shouldClear
{
  char v2 = self;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v3 = [(AMSFollowUpAction *)self internalQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__AMSFollowUpAction_shouldClear__block_invoke;
  v5[3] = &unk_1E55A30A0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __32__AMSFollowUpAction_shouldClear__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:@"AMSShouldClear"];
  if (objc_opt_respondsToSelector()) {
    char v2 = [v3 BOOLValue];
  }
  else {
    char v2 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (NSMutableDictionary)userInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  dispatch_queue_t v10 = __Block_byref_object_copy__33;
  id v11 = __Block_byref_object_dispose__33;
  id v12 = 0;
  id v3 = [(AMSFollowUpAction *)self internalQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __29__AMSFollowUpAction_userInfo__block_invoke;
  v6[3] = &unk_1E559F2A8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSMutableDictionary *)v4;
}

void __29__AMSFollowUpAction_userInfo__block_invoke(uint64_t a1)
{
}

- (void)setLogKey:(id)a3
{
}

- (void)setParentIdentifier:(id)a3
{
}

- (void)setPreferredClient:(id)a3
{
}

- (void)setRequest:(id)a3
{
  id v13 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v13)
  {
    v5 = [v13 HTTPMethod];
    id v6 = [NSString alloc];
    uint64_t v7 = [v13 HTTPBody];
    uint64_t v8 = (void *)[v6 initWithData:v7 encoding:4];

    uint64_t v9 = [v13 URL];
    dispatch_queue_t v10 = [v9 absoluteString];

    if (v10) {
      [v4 setObject:v10 forKeyedSubscript:@"AMSRequestURL"];
    }
    if (v8) {
      [v4 setObject:v8 forKeyedSubscript:@"AMSRequestBody"];
    }
    if (v5) {
      [v4 setObject:v5 forKeyedSubscript:@"AMSRequestMethod"];
    }
  }
  if ([v4 count]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  [(AMSFollowUpAction *)self _setUserInfoProperty:v12 forKey:@"AMSRequest"];
}

- (void)setRequiresFollowUpUI:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSFollowUpAction *)self _setUserInfoProperty:v4 forKey:@"AMSRequiresFollowUpUI"];
}

- (void)setShouldClear:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSFollowUpAction *)self _setUserInfoProperty:v4 forKey:@"AMSShouldClear"];
}

- (void)setUserInfo:(id)a3
{
  id v4 = a3;
  v5 = [(AMSFollowUpAction *)self internalQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__AMSFollowUpAction_setUserInfo___block_invoke;
  v7[3] = &unk_1E559F1E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __33__AMSFollowUpAction_setUserInfo___block_invoke(uint64_t a1)
{
}

- (id)generateAction
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  id v3 = (void *)_MergedGlobals_110;
  uint64_t v19 = _MergedGlobals_110;
  if (!_MergedGlobals_110)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __getFLFollowUpActionClass_block_invoke;
    v15[3] = &unk_1E559EC70;
    v15[4] = &v16;
    __getFLFollowUpActionClass_block_invoke((uint64_t)v15);
    id v3 = (void *)v17[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v16, 8);
  v5 = [(AMSFollowUpAction *)self label];
  id v6 = [(AMSFollowUpAction *)self url];
  uint64_t v7 = [v4 actionWithLabel:v5 url:v6];

  id v8 = [(AMSFollowUpAction *)self identifier];
  [v7 setIdentifier:v8];

  uint64_t v9 = [(AMSFollowUpAction *)self userInfo];
  dispatch_queue_t v10 = (void *)[v9 mutableCopy];

  id v11 = [(AMSFollowUpAction *)self metricsEvent];

  if (v11)
  {
    id v12 = [(AMSFollowUpAction *)self metricsEvent];
    id v13 = [v12 underlyingDictionary];
    [v10 setObject:v13 forKeyedSubscript:@"AMSMetrics"];
  }
  [v7 setUserInfo:v10];

  return v7;
}

- (id)performActionsWithBag:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(AMSMutableBinaryPromise);
  uint64_t v9 = [(AMSFollowUpAction *)self actionQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __51__AMSFollowUpAction_performActionsWithBag_account___block_invoke;
  v16[3] = &unk_1E55A2280;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  dispatch_queue_t v10 = v8;
  uint64_t v19 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v16);

  id v13 = v19;
  v14 = v10;

  return v14;
}

void __51__AMSFollowUpAction_performActionsWithBag_account___block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) request];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = +[AMSLogConfig sharedFollowUpConfig];
    if (!v4)
    {
      id v4 = +[AMSLogConfig sharedConfig];
    }
    v5 = [v4 OSLogObject];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_opt_class();
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      uint64_t v9 = [v7 logKey];
      *(_DWORD *)buf = 138543618;
      unsigned int v40 = v6;
      __int16 v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_18D554000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing request", buf, 0x16u);
    }
    dispatch_queue_t v10 = [[AMSURLRequestEncoder alloc] initWithBag:*(void *)(a1 + 40)];
    [(AMSURLRequestEncoder *)v10 setAccount:*(void *)(a1 + 48)];
    id v11 = [*(id *)(a1 + 32) logKey];
    [(AMSURLRequestEncoder *)v10 setLogUUID:v11];

    id v12 = [*(id *)(a1 + 32) request];
    id v13 = [(AMSURLRequestEncoder *)v10 requestByEncodingRequest:v12 parameters:0];
    id v38 = 0;
    v14 = [v13 resultWithError:&v38];
    id v15 = v38;

    if (!v15)
    {
      uint64_t v16 = +[AMSURLSession defaultSession];
      id v17 = [v16 dataTaskPromiseWithRequest:v14];
      id v37 = 0;
      id v18 = (id)[v17 resultWithError:&v37];
      id v15 = v37;
    }
  }
  else
  {
    v14 = 0;
    id v15 = 0;
  }
  uint64_t v19 = [*(id *)(a1 + 32) url];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    char v21 = [*(id *)(a1 + 32) requiresFollowUpUI];

    if ((v21 & 1) == 0)
    {
      v22 = +[AMSLogConfig sharedFollowUpConfig];
      if (!v22)
      {
        v22 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v22 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_opt_class();
        v25 = *(void **)(a1 + 32);
        id v26 = v24;
        v27 = [v25 logKey];
        v28 = [*(id *)(a1 + 32) url];
        *(_DWORD *)buf = 138543874;
        unsigned int v40 = v24;
        __int16 v41 = 2114;
        v42 = v27;
        __int16 v43 = 2112;
        v44 = v28;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Opening url: %@", buf, 0x20u);
      }
      uint64_t v29 = [*(id *)(a1 + 32) url];
      +[AMSOpenURL openStandardURL:v29];
    }
  }
  if ([*(id *)(a1 + 32) shouldClear])
  {
    v30 = [*(id *)(a1 + 32) backingIdentifier];

    if (v30)
    {
      v31 = objc_alloc_init(AMSFollowUp);
      v32 = [*(id *)(a1 + 32) backingIdentifier];
      id v33 = [(AMSFollowUp *)v31 clearFollowUpWithBackingIdentifier:v32];
    }
    else
    {
      id v34 = [*(id *)(a1 + 32) parentIdentifier];

      if (!v34) {
        goto LABEL_23;
      }
      v31 = objc_alloc_init(AMSFollowUp);
      v32 = [*(id *)(a1 + 32) parentIdentifier];
      id v35 = [(AMSFollowUp *)v31 clearFollowUpWithIdentifier:v32 account:*(void *)(a1 + 48)];
    }
  }
LABEL_23:
  v36 = *(void **)(a1 + 56);
  if (v15) {
    [v36 finishWithError:v15];
  }
  else {
    [v36 finishWithSuccess];
  }
}

- (id)postMetricsWithBag:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AMSMutablePromise);
  id v6 = [(AMSFollowUpAction *)self metricsEvent];

  if (v6)
  {
    id v7 = [(AMSFollowUpAction *)self metricsEvent];
    id v8 = [v7 underlyingDictionary];
    uint64_t v9 = +[AMSFollowUpMetricsEvent eventFromMetricsDictionary:v8];

    dispatch_queue_t v10 = +[AMSMetrics internalInstanceUsingBag:v4];
    [v10 enqueueEvent:v9];
    id v11 = [v10 flush];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __40__AMSFollowUpAction_postMetricsWithBag___block_invoke;
    v13[3] = &unk_1E559EE78;
    v14 = v5;
    [v11 addFinishBlock:v13];
  }
  else
  {
    [(AMSMutablePromise *)v5 finishWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v5;
}

uint64_t __40__AMSFollowUpAction_postMetricsWithBag___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = 0;
  }
  return [*(id *)(a1 + 32) finishWithResult:v4 error:a3];
}

- (void)_setUserInfoProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(AMSFollowUpAction *)self internalQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__AMSFollowUpAction__setUserInfoProperty_forKey___block_invoke;
  v11[3] = &unk_1E55A1108;
  objc_copyWeak(&v14, &location);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __49__AMSFollowUpAction__setUserInfoProperty_forKey___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v2 = (void *)WeakRetained[1];
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  else {
    [v2 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (AMSFollowUpAction)initWithLabel:(id)a3
{
  return [(AMSFollowUpAction *)self initWithLabel:a3 parentIdentifier:0];
}

- (AMSFollowUpAction)initWithAction:(id)a3
{
  return [(AMSFollowUpAction *)self initWithAction:a3 parentIdentifier:0];
}

- (id)performActionsWithContract:(id)a3 account:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[AMSContractBagShim alloc] initWithBagContract:v7];

  id v9 = [(AMSFollowUpAction *)self performActionsWithBag:v8 account:v6];

  return v9;
}

- (id)postMetricsWithBagContract:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(AMSPromise);
  id v6 = [(AMSFollowUpAction *)self metricsEvent];

  if (v6)
  {
    id v7 = [(AMSFollowUpAction *)self metricsEvent];
    id v8 = [v7 underlyingDictionary];
    id v9 = +[AMSFollowUpMetricsEvent eventFromMetricsDictionary:v8];

    id v10 = [[AMSContractBagShim alloc] initWithBagContract:v4];
    id v11 = +[AMSMetrics internalInstanceUsingBag:v10];
    [v11 enqueueEvent:v9];
    id v12 = [v11 flush];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __48__AMSFollowUpAction_postMetricsWithBagContract___block_invoke;
    v14[3] = &unk_1E559EE78;
    id v15 = v5;
    [v12 addFinishBlock:v14];
  }
  else
  {
    [(AMSPromise *)v5 finishWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v5;
}

uint64_t __48__AMSFollowUpAction_postMetricsWithBagContract___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v4 = MEMORY[0x1E4F1CC38];
  }
  else {
    uint64_t v4 = 0;
  }
  return [*(id *)(a1 + 32) finishWithResult:v4 error:a3];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (AMSMetricsEvent)metricsEvent
{
  return self->_metricsEvent;
}

- (void)setMetricsEvent:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)backingIdentifier
{
  return self->_backingIdentifier;
}

- (void)setBackingIdentifier:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)actionQueue
{
  return self->_actionQueue;
}

- (void)setActionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_backingIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_metricsEvent, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end