@interface AMSUIWebMetricsEvent
- (AMSUIWebMetricsEvent)initWithJSObject:(id)a3 context:(id)a4;
@end

@implementation AMSUIWebMetricsEvent

- (AMSUIWebMetricsEvent)initWithJSObject:(id)a3 context:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"topic"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    v29.receiver = self;
    v29.super_class = (Class)AMSUIWebMetricsEvent;
    v10 = [(AMSUIWebMetricsEvent *)&v29 initWithTopic:v9];
    if (v10)
    {
      v11 = [v6 objectForKeyedSubscript:@"account"];
      v12 = [v7 iTunesAccountFromJSAccount:v11];
      [(AMSUIWebMetricsEvent *)v10 setAccount:v12];

      v13 = [v6 objectForKeyedSubscript:@"checkDiagnosticsAndUsageSetting"];
      if (objc_opt_respondsToSelector())
      {
        v14 = [v6 objectForKeyedSubscript:@"checkDiagnosticsAndUsageSetting"];
        -[AMSUIWebMetricsEvent setCheckDiagnosticsAndUsageSetting:](v10, "setCheckDiagnosticsAndUsageSetting:", [v14 BOOLValue]);
      }
      else
      {
        [(AMSUIWebMetricsEvent *)v10 setCheckDiagnosticsAndUsageSetting:0];
      }

      v20 = [v6 objectForKeyedSubscript:@"anonymous"];
      if (objc_opt_respondsToSelector())
      {
        v21 = [v6 objectForKeyedSubscript:@"anonymous"];
        -[AMSUIWebMetricsEvent setAnonymous:](v10, "setAnonymous:", [v21 BOOLValue]);
      }
      else
      {
        [(AMSUIWebMetricsEvent *)v10 setAnonymous:0];
      }

      v22 = [v6 objectForKeyedSubscript:@"suppressEngagement"];
      if (objc_opt_respondsToSelector())
      {
        v23 = [v6 objectForKeyedSubscript:@"suppressEngagement"];
        -[AMSUIWebMetricsEvent setSuppressEngagement:](v10, "setSuppressEngagement:", [v23 BOOLValue]);
      }
      else
      {
        [(AMSUIWebMetricsEvent *)v10 setSuppressEngagement:0];
      }

      v24 = [v7 metricsOverlay];

      if (v24)
      {
        v25 = [v7 metricsOverlay];
        [(AMSUIWebMetricsEvent *)v10 addPropertiesWithDictionary:v25];
      }
      v26 = [v6 objectForKeyedSubscript:@"fields"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v27 = v26;
      }
      else {
        id v27 = 0;
      }

      if (v27) {
        [(AMSUIWebMetricsEvent *)v10 addPropertiesWithDictionary:v27];
      }
    }
    self = v10;
    v19 = self;
  }
  else
  {
    v15 = [MEMORY[0x263F27CB8] sharedWebUIConfig];
    if (!v15)
    {
      v15 = [MEMORY[0x263F27CB8] sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = objc_opt_class();
      v18 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v31 = v17;
      __int16 v32 = 2114;
      v33 = v18;
      __int16 v34 = 2112;
      id v35 = v6;
      _os_log_impl(&dword_21C134000, v16, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Metrics event does not contain topic: %@", buf, 0x20u);
    }
    v19 = 0;
  }

  return v19;
}

@end