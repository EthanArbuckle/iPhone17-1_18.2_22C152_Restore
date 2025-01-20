@interface AMSDialogAction
- (NSString)lib_analyticsActionName;
- (id)_lib_analyticsEventDictionary;
- (void)_lib_setAnalyticsEventDictionary:(id)a3;
- (void)lib_setAnalyticsActionName:(id)a3;
@end

@implementation AMSDialogAction

- (NSString)lib_analyticsActionName
{
  v2 = [(AMSDialogAction *)self _lib_analyticsEventDictionary];
  v3 = [v2 objectForKeyedSubscript:@"AnalyticsEventAction"];

  return (NSString *)v3;
}

- (void)lib_setAnalyticsActionName:(id)a3
{
  id v7 = a3;
  v4 = [(AMSDialogAction *)self _lib_analyticsEventDictionary];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = [v7 copy];
  [v5 setObject:v6 forKeyedSubscript:@"AnalyticsEventAction"];

  [(AMSDialogAction *)self _lib_setAnalyticsEventDictionary:v5];
}

- (id)_lib_analyticsEventDictionary
{
  v2 = [(AMSDialogAction *)self userInfo];
  v3 = [v2 objectForKeyedSubscript:@"com.apple.storekit.AnalyticsEvent"];

  return v3;
}

- (void)_lib_setAnalyticsEventDictionary:(id)a3
{
  id v7 = a3;
  v4 = [(AMSDialogAction *)self userInfo];
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = [v7 copy];
  [v5 setObject:v6 forKeyedSubscript:@"com.apple.storekit.AnalyticsEvent"];

  [(AMSDialogAction *)self setUserInfo:v5];
}

@end