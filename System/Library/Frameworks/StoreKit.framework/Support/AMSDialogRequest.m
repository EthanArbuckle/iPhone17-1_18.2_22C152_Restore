@interface AMSDialogRequest
- (NSDictionary)lib_analyticsEventInfo;
- (NSString)lib_analyticsDialogName;
- (id)_lib_analyticsEventDictionary;
- (void)_lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4 usingBlock:(id)a5;
- (void)_lib_setAnalyticsEventDictionary:(id)a3;
- (void)lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4;
- (void)lib_setAnalyticsActionName:(id)a3 forAction:(id)a4;
- (void)lib_setAnalyticsDialogName:(id)a3;
- (void)lib_setAnalyticsDialogName:(id)a3 eventInfo:(id)a4;
- (void)lib_setAnalyticsEventInfo:(id)a3;
@end

@implementation AMSDialogRequest

- (NSDictionary)lib_analyticsEventInfo
{
  v2 = [(AMSDialogRequest *)self _lib_analyticsEventDictionary];
  v3 = [v2 objectForKeyedSubscript:@"AnalyticsEventInfo"];

  return (NSDictionary *)v3;
}

- (void)lib_setAnalyticsEventInfo:(id)a3
{
  id v7 = a3;
  v4 = [(AMSDialogRequest *)self _lib_analyticsEventDictionary];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = [v7 copy];
  [v5 setObject:v6 forKeyedSubscript:@"AnalyticsEventInfo"];

  [(AMSDialogRequest *)self _lib_setAnalyticsEventDictionary:v5];
}

- (NSString)lib_analyticsDialogName
{
  v2 = [(AMSDialogRequest *)self _lib_analyticsEventDictionary];
  v3 = [v2 objectForKeyedSubscript:@"AnalyticsDialogName"];

  return (NSString *)v3;
}

- (void)lib_setAnalyticsDialogName:(id)a3
{
  id v7 = a3;
  v4 = [(AMSDialogRequest *)self _lib_analyticsEventDictionary];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = [v7 copy];
  [v5 setObject:v6 forKeyedSubscript:@"AnalyticsDialogName"];

  [(AMSDialogRequest *)self _lib_setAnalyticsEventDictionary:v5];
}

- (void)lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4
{
}

- (void)lib_setAnalyticsActionName:(id)a3 forAction:(id)a4
{
}

- (void)lib_setAnalyticsDialogName:(id)a3 eventInfo:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = [(AMSDialogRequest *)self _lib_analyticsEventDictionary];
  id v8 = [v7 mutableCopy];

  if (!v8) {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v9 = [v11 copy];
  [v8 setObject:v9 forKeyedSubscript:@"AnalyticsEventInfo"];

  id v10 = [v6 copy];
  [v8 setObject:v10 forKeyedSubscript:@"AnalyticsDialogName"];

  [(AMSDialogRequest *)self _lib_setAnalyticsEventDictionary:v8];
}

- (id)_lib_analyticsEventDictionary
{
  v2 = [(AMSDialogRequest *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.storekit.AnalyticsEvent"];

  return v3;
}

- (void)_lib_setAnalyticsEventDictionary:(id)a3
{
  id v7 = a3;
  v4 = [(AMSDialogRequest *)self userInfo];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = [v7 copy];
  [v5 setObject:v6 forKeyedSubscript:@"com.apple.storekit.AnalyticsEvent"];

  [(AMSDialogRequest *)self setUserInfo:v5];
}

- (void)_lib_postAnalyticsEventWithResult:(id)a3 error:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, const __CFString *, void *))a5;
  id v11 = [(AMSDialogRequest *)self _lib_analyticsEventDictionary];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 objectForKeyedSubscript:@"AnalyticsDialogName"];
    v14 = v13;
    if (v13 && [v13 length])
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100066AB0;
      v15[3] = &unk_1003594C0;
      id v16 = v12;
      id v17 = v8;
      v18 = self;
      id v19 = v9;
      id v20 = v14;
      v10[2](v10, @"com.apple.storekit.dialog", v15);
    }
  }
}

@end