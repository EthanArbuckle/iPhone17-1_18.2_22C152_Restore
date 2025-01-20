@interface AAFAnalyticsEvent
+ (id)ak_analyticsEventWithContext:(id)a3 client:(id)a4 eventName:(id)a5 error:(id)a6;
+ (id)ak_analyticsEventWithContext:(id)a3 eventName:(id)a4 error:(id)a5;
+ (id)ak_analyticsEventWithEventName:(id)a3 account:(id)a4 error:(id)a5;
+ (id)ak_analyticsEventWithEventName:(id)a3 error:(id)a4;
- (void)ak_updateTelemetryIdWithAccount:(id)a3;
- (void)ak_updateWithAuthenticationResults:(id)a3 authContext:(id)a4 error:(id)a5;
@end

@implementation AAFAnalyticsEvent

+ (id)ak_analyticsEventWithEventName:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AKAccountManager sharedInstance];
  v9 = [v8 primaryAuthKitAccount];
  v10 = objc_msgSend(a1, "ak_analyticsEventWithEventName:account:error:", v7, v9, v6);

  return v10;
}

+ (id)ak_analyticsEventWithEventName:(id)a3 account:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [objc_alloc((Class)AAFAnalyticsEvent) initWithEventName:v9 eventCategory:&off_10023AFF0 initData:0];

  [v10 populateUnderlyingErrorsStartingWithRootError:v7];
  objc_msgSend(v10, "ak_updateTelemetryIdWithAccount:", v8);

  return v10;
}

- (void)ak_updateTelemetryIdWithAccount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[AKAccountManager sharedInstance];
    id v6 = [v5 telemetryDeviceSessionIDForAccount:v4];
    [(AAFAnalyticsEvent *)self setObject:v6 forKeyedSubscript:kAAFDeviceSessionIdString];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100187424(v7);
    }
  }
}

+ (id)ak_analyticsEventWithContext:(id)a3 eventName:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 authKitAccount:0];
  v11 = +[AAFAnalyticsEvent ak_analyticsEventWithEventName:v9 account:v10 error:v8];

  v12 = [v7 telemetryFlowID];

  if (!v12)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_100187468(v13);
    }
  }
  v14 = [v7 telemetryFlowID];
  [v11 setObject:v14 forKeyedSubscript:kAAFFlowIdString];

  return v11;
}

+ (id)ak_analyticsEventWithContext:(id)a3 client:(id)a4 eventName:(id)a5 error:(id)a6
{
  id v9 = a4;
  id v10 = +[AAFAnalyticsEvent ak_analyticsEventWithContext:a3 eventName:a5 error:a6];
  v11 = [v9 name];

  [v10 setObject:v11 forKeyedSubscript:@"processName"];

  return v10;
}

- (void)ak_updateWithAuthenticationResults:(id)a3 authContext:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v22 = 0;
  id v9 = a4;
  id v10 = [v9 authKitAccount:&v22];
  id v11 = v22;
  v12 = v11;
  if (!v10 || v11)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_1001874AC((uint64_t)v8, v13);
    }
  }
  [(AAFAnalyticsEvent *)self ak_updateTelemetryIdWithAccount:v10];
  v14 = [v9 telemetryFlowID];

  [(AAFAnalyticsEvent *)self setObject:v14 forKeyedSubscript:kAAFFlowIdString];
  uint64_t v15 = kAAFDeviceSessionIdString;
  v16 = [(AAFAnalyticsEvent *)self objectForKeyedSubscript:kAAFDeviceSessionIdString];
  if (!v16)
  {
    v17 = +[AKAccountManager sharedInstance];
    unsigned int v18 = [v17 accountAccessTelemetryOptInForAccount:v10];

    if (!v18) {
      goto LABEL_10;
    }
    v16 = +[AKAccountManager sharedInstance];
    v19 = [v16 telemetryDeviceSessionIDForAccount:v10];
    [(AAFAnalyticsEvent *)self setObject:v19 forKeyedSubscript:v15];
  }
LABEL_10:
  if (a3)
  {
    [(AAFAnalyticsEvent *)self setObject:&__kCFBooleanTrue forKeyedSubscript:kAAFDidSucceed];
  }
  else
  {
    [(AAFAnalyticsEvent *)self setObject:&__kCFBooleanFalse forKeyedSubscript:kAAFDidSucceed];
    [(AAFAnalyticsEvent *)self populateUnderlyingErrorsStartingWithRootError:v8];
  }
  v20 = +[AKAccountManager sharedInstance];
  v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v20 securityLevelForAccount:v10]);
  [(AAFAnalyticsEvent *)self setObject:v21 forKeyedSubscript:@"securityLevel"];
}

@end