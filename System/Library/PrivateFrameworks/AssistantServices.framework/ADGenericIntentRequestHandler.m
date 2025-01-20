@interface ADGenericIntentRequestHandler
- (void)_handleGenericIntentRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation ADGenericIntentRequestHandler

- (void)handleSiriRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ADGenericIntentService.m", 122, @"Invalid parameter not satisfying: %@", @"[request isKindOfClass:[STGenericIntentRequest class]]" object file lineNumber description];
  }
  [(ADGenericIntentRequestHandler *)self _handleGenericIntentRequest:v12 deliveryHandler:v9 completionHandler:v10];
}

- (void)_handleGenericIntentRequest:(id)a3 deliveryHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = +[AFAnalytics sharedAnalytics];
  v11 = objc_msgSend(v7, "_af_analyticsContextDescription");
  id v12 = [v7 appIdentifier];
  v13 = sub_1001FB5B4(v12);
  [v11 setObject:v13 forKeyedSubscript:AFAnalyticsContextKey[1]];

  [v10 logEventWithType:501 context:v11 contextNoCopy:0];
  v14 = [v7 appIdentifier];
  v15 = +[AFSiriTaskmaster taskmasterForUIApplicationWithBundleIdentifier:v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1002865E0;
  v19[3] = &unk_100509478;
  id v20 = v7;
  id v21 = v10;
  id v22 = v8;
  id v16 = v8;
  id v17 = v10;
  id v18 = v7;
  [v15 handleSiriRequest:v18 deliveryHandler:v9 completionHandler:v19];
}

@end