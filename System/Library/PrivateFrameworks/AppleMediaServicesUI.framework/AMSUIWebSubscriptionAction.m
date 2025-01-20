@interface AMSUIWebSubscriptionAction
- (AMSUIWebSubscriptionAction)initWithJSObject:(id)a3 context:(id)a4;
- (BOOL)extendedCarrierCheck;
- (id)runAction;
- (int64_t)cachePolicy;
- (int64_t)mediaType;
- (void)setCachePolicy:(int64_t)a3;
- (void)setExtendedCarrierCheck:(BOOL)a3;
- (void)setMediaType:(int64_t)a3;
@end

@implementation AMSUIWebSubscriptionAction

- (AMSUIWebSubscriptionAction)initWithJSObject:(id)a3 context:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AMSUIWebSubscriptionAction;
  v7 = [(AMSUIWebAction *)&v15 initWithJSObject:v6 context:a4];
  if (v7)
  {
    v8 = [v6 objectForKeyedSubscript:@"cachePolicy"];
    if (objc_opt_respondsToSelector())
    {
      v9 = [v6 objectForKeyedSubscript:@"cachePolicy"];
      v7->_cachePolicy = [v9 longLongValue];
    }
    else
    {
      v7->_cachePolicy = 0;
    }

    v10 = [v6 objectForKeyedSubscript:@"extendedCarrierCheck"];
    if (objc_opt_respondsToSelector())
    {
      v11 = [v6 objectForKeyedSubscript:@"extendedCarrierCheck"];
      v7->_extendedCarrierCheck = [v11 BOOLValue];
    }
    else
    {
      v7->_extendedCarrierCheck = 0;
    }

    v12 = [v6 objectForKeyedSubscript:@"mediaType"];
    if (objc_opt_respondsToSelector())
    {
      v13 = [v6 objectForKeyedSubscript:@"mediaType"];
      v7->_mediaType = [v13 longLongValue];
    }
    else
    {
      v7->_mediaType = 1;
    }
  }
  return v7;
}

- (id)runAction
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebSubscriptionAction;
  id v3 = [(AMSUIWebAction *)&v13 runAction];
  v4 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
  if (!v4)
  {
    v4 = [MEMORY[0x263F27CB8] sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    v7 = AMSLogKey();
    int64_t v8 = [(AMSUIWebSubscriptionAction *)self mediaType];
    *(_DWORD *)buf = 138543874;
    uint64_t v15 = v6;
    __int16 v16 = 2114;
    v17 = v7;
    __int16 v18 = 2048;
    int64_t v19 = v8;
    _os_log_impl(&dword_21C134000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Started subscription lookup for media type: %ld", buf, 0x20u);
  }
  v9 = objc_msgSend(objc_alloc(MEMORY[0x263F27EA0]), "initWithMediaType:", -[AMSUIWebSubscriptionAction mediaType](self, "mediaType"));
  objc_msgSend(v9, "setCachePolicy:", -[AMSUIWebSubscriptionAction cachePolicy](self, "cachePolicy"));
  objc_msgSend(v9, "setExtendedCarrierCheck:", -[AMSUIWebSubscriptionAction extendedCarrierCheck](self, "extendedCarrierCheck"));
  v10 = [v9 performExternalLookup];
  v11 = [v10 thenWithBlock:&__block_literal_global_30];

  return v11;
}

id __39__AMSUIWebSubscriptionAction_runAction__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F27E10];
  id v3 = [a2 exportObject];
  v4 = [v2 promiseWithResult:v3];

  return v4;
}

- (int64_t)cachePolicy
{
  return self->_cachePolicy;
}

- (void)setCachePolicy:(int64_t)a3
{
  self->_cachePolicy = a3;
}

- (BOOL)extendedCarrierCheck
{
  return self->_extendedCarrierCheck;
}

- (void)setExtendedCarrierCheck:(BOOL)a3
{
  self->_extendedCarrierCheck = a3;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
}

@end