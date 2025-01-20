@interface APMetricsEvent
+ (id)metricsEventWithAccount:(id)a3 request:(id)a4;
+ (id)nonIdentifiableMetricsFieldsForAccount:(id)a3;
- (APMetricsEvent)initWithAccount:(id)a3 request:(id)a4;
@end

@implementation APMetricsEvent

- (APMetricsEvent)initWithAccount:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 metricsTopic];
  v9 = [v7 metricsApp];
  v22.receiver = self;
  v22.super_class = (Class)APMetricsEvent;
  v10 = [(APMetricsEvent *)&v22 initWithTopic:v8];
  v11 = v10;
  if (v10)
  {
    [(APMetricsEvent *)v10 setEventVersion:&unk_26D8E1620];
    [(APMetricsEvent *)v11 setProperty:v9 forBodyKey:@"app"];
    v12 = objc_msgSend(v6, "ams_DSID");
    [(APMetricsEvent *)v11 setProperty:v12 forBodyKey:@"dsId"];

    v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v6, "isAuthenticated"));
    v14 = [v13 stringValue];
    [(APMetricsEvent *)v11 setProperty:v14 forBodyKey:@"isSignedIn"];

    v15 = [v7 itemIdentifier];
    [(APMetricsEvent *)v11 setProperty:v15 forBodyKey:@"pageId"];

    v16 = [MEMORY[0x263F27BF8] operatingSystem];
    [(APMetricsEvent *)v11 setProperty:v16 forBodyKey:@"os"];

    v17 = [MEMORY[0x263F27BF8] buildVersion];
    [(APMetricsEvent *)v11 setProperty:v17 forBodyKey:@"osBuildNumber"];

    uint64_t v18 = objc_msgSend(v6, "ams_storefront");
    v19 = (void *)v18;
    if (v18) {
      v20 = (__CFString *)v18;
    }
    else {
      v20 = @"Unknown";
    }
    [(APMetricsEvent *)v11 setProperty:v20 forBodyKey:@"storeFrontHeader"];
  }
  return v11;
}

+ (id)metricsEventWithAccount:(id)a3 request:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v7 lineOfBusiness] == 1)
  {
    v8 = [a1 nonIdentifiableMetricsFieldsForAccount:v6];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __50__APMetricsEvent_metricsEventWithAccount_request___block_invoke;
    v15[3] = &unk_26474E468;
    id v16 = v6;
    id v17 = v7;
    v9 = [(APMetricsEvent *)v8 continueWithBlock:v15];
  }
  else
  {
    v10 = +[APLogConfig sharedFrameworkConfig];
    if (!v10)
    {
      v10 = +[APLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v19 = (id)objc_opt_class();
      id v12 = v19;
      _os_log_impl(&dword_2256FB000, v11, OS_LOG_TYPE_ERROR, "%{public}@: LOB is not App Store. Enqueueing standard metrics.", buf, 0xCu);
    }
    v13 = (void *)MEMORY[0x263F27E10];
    v8 = [[APMetricsEvent alloc] initWithAccount:v6 request:v7];
    v9 = [v13 promiseWithResult:v8];
  }

  return v9;
}

id __50__APMetricsEvent_metricsEventWithAccount_request___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    v13 = (void *)MEMORY[0x263F27E10];
    id v7 = [[APMetricsEvent alloc] initWithAccount:*(void *)(a1 + 32) request:*(void *)(a1 + 40)];
    id v12 = [v13 promiseWithResult:v7];
  }
  else
  {
    id v7 = [v5 objectForKeyedSubscript:@"userId"];
    v8 = [v6 objectForKeyedSubscript:@"xpAccountsMatch"];
    v9 = [v6 objectForKeyedSubscript:@"xpUserIdSyncState"];
    v10 = [v6 objectForKeyedSubscript:@"clientId"];
    v11 = [[APMetricsEvent alloc] initWithAccount:*(void *)(a1 + 32) request:*(void *)(a1 + 40)];
    [(APMetricsEvent *)v11 setProperty:0 forBodyKey:@"dsId"];
    [(APMetricsEvent *)v11 setProperty:v7 forBodyKey:@"userId"];
    [(APMetricsEvent *)v11 setProperty:v10 forBodyKey:@"clientId"];
    [(APMetricsEvent *)v11 setProperty:@"APPSTORE_ENGAGEMENT" forBodyKey:@"userNs"];
    [(APMetricsEvent *)v11 setProperty:v8 forBodyKey:@"xpAccountsMatch"];
    [(APMetricsEvent *)v11 setProperty:v9 forBodyKey:@"xpUserIdSyncState"];
    id v12 = [MEMORY[0x263F27E10] promiseWithResult:v11];
  }
  return v12;
}

+ (id)nonIdentifiableMetricsFieldsForAccount:(id)a3
{
  v4 = (void *)MEMORY[0x263F27D60];
  id v5 = (void *)MEMORY[0x263F27B28];
  id v6 = a3;
  id v7 = [v5 sharedBag];
  v8 = [v4 identifierStoreWithAccount:v6 bagNamespace:@"APPSTORE_ENGAGEMENT" bag:v7];

  v9 = (void *)MEMORY[0x263F27D60];
  v10 = [MEMORY[0x263F27B28] sharedBag];
  v11 = [v9 identifierForAccount:v6 bag:v10 bagNamespace:@"APPSTORE_ENGAGEMENT_CLIENT" keyName:@"clientId"];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __57__APMetricsEvent_nonIdentifiableMetricsFieldsForAccount___block_invoke;
  v15[3] = &unk_26474E4B8;
  id v16 = v8;
  id v17 = a1;
  id v12 = v8;
  v13 = [v11 continueWithBlock:v15];

  return v13;
}

id __57__APMetricsEvent_nonIdentifiableMetricsFieldsForAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[APLogConfig sharedFrameworkConfig];
  v8 = (void *)v7;
  if (v6)
  {
    if (!v7)
    {
      v8 = +[APLogConfig sharedConfig];
    }
    v9 = [v8 OSLogObject];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_opt_class();
      id v11 = v10;
      id v12 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_2256FB000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Error loading Metrics clientID: %@", buf, 0x16u);
    }
    v13 = [MEMORY[0x263F27E10] promiseWithError:v6];
  }
  else
  {
    if (!v7)
    {
      v8 = +[APLogConfig sharedConfig];
    }
    v14 = [v8 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v22 = (id)objc_opt_class();
      __int16 v23 = 2112;
      id v24 = v5;
      id v15 = v22;
      _os_log_impl(&dword_2256FB000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Loaded Metrics clientID: %@", buf, 0x16u);
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __57__APMetricsEvent_nonIdentifiableMetricsFieldsForAccount___block_invoke_51;
    v18[3] = &unk_26474E490;
    id v16 = *(void **)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 40);
    id v19 = v5;
    v13 = [v16 continueWithBlock:v18];
  }
  return v13;
}

id __57__APMetricsEvent_nonIdentifiableMetricsFieldsForAccount___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = +[APLogConfig sharedFrameworkConfig];
    if (!v7)
    {
      uint64_t v7 = +[APLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      id v10 = v9;
      id v11 = AMSLogableError();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v9;
      __int16 v26 = 2112;
      v27 = v11;
      _os_log_impl(&dword_2256FB000, v8, OS_LOG_TYPE_ERROR, "%{public}@: Error loading Metrics Store for userID: %@", buf, 0x16u);
    }
    id v12 = [MEMORY[0x263F27E10] promiseWithError:v6];
  }
  else
  {
    [v5 setIncludeAccountMatchStatus:1];
    v13 = [MEMORY[0x263F27D58] keyWithName:@"userId" crossDeviceSync:1];
    __int16 v23 = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v23 count:1];
    id v15 = [v5 generateEventFieldsForKeys:v14];
    id v16 = (void *)[v15 mutableCopy];

    id v17 = +[APLogConfig sharedFrameworkConfig];
    if (!v17)
    {
      id v17 = +[APLogConfig sharedConfig];
    }
    uint64_t v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = objc_opt_class();
      id v20 = v19;
      v21 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v19;
      __int16 v26 = 2112;
      v27 = v21;
      _os_log_impl(&dword_2256FB000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Loaded Metrics event fields: %@", buf, 0x16u);
    }
    [v16 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"clientId"];
    id v12 = [MEMORY[0x263F27E10] promiseWithResult:v16];
  }
  return v12;
}

@end