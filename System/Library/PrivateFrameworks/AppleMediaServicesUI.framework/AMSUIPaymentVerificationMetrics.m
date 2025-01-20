@interface AMSUIPaymentVerificationMetrics
+ (id)_event;
+ (id)_metricsInstanceWithBag:(id)a3;
- (AMSBagProtocol)bag;
- (AMSUIPaymentVerificationMetrics)initWithBag:(id)a3 appID:(id)a4;
- (NSString)appID;
- (NSString)displayReason;
- (id)_propertiesWithPageId:(id)a3 displayReason:(id)a4;
- (id)_propertiesWithTargetId:(id)a3 pageId:(id)a4 displayReason:(id)a5;
- (void)enqueueEventWithPageId:(id)a3 displayReason:(id)a4;
- (void)enqueueEventWithTargetId:(id)a3 pageId:(id)a4 displayReason:(id)a5;
- (void)flushEvents;
- (void)setAppID:(id)a3;
- (void)setBag:(id)a3;
- (void)setDisplayReason:(id)a3;
@end

@implementation AMSUIPaymentVerificationMetrics

- (AMSUIPaymentVerificationMetrics)initWithBag:(id)a3 appID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AMSUIPaymentVerificationMetrics;
  v9 = [(AMSUIPaymentVerificationMetrics *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appID, a4);
    objc_storeStrong((id *)&v10->_bag, a3);
  }

  return v10;
}

- (void)enqueueEventWithPageId:(id)a3 displayReason:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  v9 = [(AMSUIPaymentVerificationMetrics *)self bag];
  id v12 = [v8 _metricsInstanceWithBag:v9];

  v10 = [(id)objc_opt_class() _event];
  v11 = [(AMSUIPaymentVerificationMetrics *)self _propertiesWithPageId:v7 displayReason:v6];

  [v10 addPropertiesWithDictionary:v11];
  [v12 enqueueEvent:v10];
}

- (void)enqueueEventWithTargetId:(id)a3 pageId:(id)a4 displayReason:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_class();
  id v12 = [(AMSUIPaymentVerificationMetrics *)self bag];
  id v15 = [v11 _metricsInstanceWithBag:v12];

  v13 = [(id)objc_opt_class() _event];
  v14 = [(AMSUIPaymentVerificationMetrics *)self _propertiesWithTargetId:v10 pageId:v9 displayReason:v8];

  [v13 addPropertiesWithDictionary:v14];
  [v15 enqueueEvent:v13];
}

- (void)flushEvents
{
  v3 = objc_opt_class();
  v4 = [(AMSUIPaymentVerificationMetrics *)self bag];
  id v6 = [v3 _metricsInstanceWithBag:v4];

  id v5 = (id)[v6 flush];
}

+ (id)_metricsInstanceWithBag:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F27D40];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithContainerID:@"com.apple.AppleMediaServices" bag:v4];

  return v5;
}

+ (id)_event
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F27D48]) initWithTopic:@"xp_its_main"];
  return v2;
}

- (id)_propertiesWithPageId:(id)a3 displayReason:(id)a4
{
  v18[1] = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  if (v7
    || ([(AMSUIPaymentVerificationMetrics *)self displayReason],
        (id v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v17 = @"displayReason";
    v18[0] = v7;
    id v8 = [NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:1];
  }
  else
  {
    id v8 = (void *)MEMORY[0x263EFFA78];
  }
  v15[0] = @"app";
  v15[1] = @"eventType";
  uint64_t v9 = *MEMORY[0x263F27998];
  v16[0] = @"commerce-app";
  v16[1] = v9;
  v15[2] = @"hostApp";
  id v10 = [(AMSUIPaymentVerificationMetrics *)self appID];
  v16[2] = v10;
  v16[3] = v8;
  v15[3] = @"pageDetails";
  v15[4] = @"pageId";
  if (v6) {
    v11 = v6;
  }
  else {
    v11 = &stru_26CC491D8;
  }
  v15[5] = @"pageType";
  uint64_t v12 = *MEMORY[0x263F27988];
  v16[4] = v11;
  v16[5] = v12;
  v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];

  return v13;
}

- (id)_propertiesWithTargetId:(id)a3 pageId:(id)a4 displayReason:(id)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  id v8 = (__CFString *)a3;
  uint64_t v9 = (__CFString *)a4;
  id v10 = a5;
  if (v10
    || ([(AMSUIPaymentVerificationMetrics *)self displayReason],
        (id v10 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v21 = @"displayReason";
    v22[0] = v10;
    v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  }
  else
  {
    v11 = (void *)MEMORY[0x263EFFA78];
  }
  v19[0] = @"actionDetails";
  v19[1] = @"actionType";
  v20[0] = v11;
  v20[1] = @"navigate";
  v19[2] = @"app";
  v19[3] = @"eventType";
  uint64_t v12 = *MEMORY[0x263F27990];
  v20[2] = @"commerce-app";
  v20[3] = v12;
  v19[4] = @"hostApp";
  v13 = [(AMSUIPaymentVerificationMetrics *)self appID];
  v20[4] = v13;
  v20[5] = v11;
  v19[5] = @"pageDetails";
  v19[6] = @"pageId";
  if (v9) {
    v14 = v9;
  }
  else {
    v14 = &stru_26CC491D8;
  }
  uint64_t v15 = *MEMORY[0x263F27988];
  v20[6] = v14;
  v20[7] = v15;
  v19[7] = @"pageType";
  v19[8] = @"targetId";
  if (v8) {
    v16 = v8;
  }
  else {
    v16 = &stru_26CC491D8;
  }
  v19[9] = @"targetType";
  v20[8] = v16;
  v20[9] = @"button";
  v17 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:10];

  return v17;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (NSString)displayReason
{
  return self->_displayReason;
}

- (void)setDisplayReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayReason, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_appID, 0);
}

@end