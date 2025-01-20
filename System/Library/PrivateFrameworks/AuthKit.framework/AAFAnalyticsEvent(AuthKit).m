@interface AAFAnalyticsEvent(AuthKit)
+ (id)ak_analyticsEventWithContext:()AuthKit client:eventName:error:;
+ (id)ak_analyticsEventWithContext:()AuthKit eventName:error:;
+ (id)ak_analyticsEventWithEventName:()AuthKit account:error:;
+ (id)ak_analyticsEventWithEventName:()AuthKit error:;
- (void)ak_updateTelemetryIdWithAccount:()AuthKit;
- (void)ak_updateWithAuthenticationResults:()AuthKit authContext:error:;
@end

@implementation AAFAnalyticsEvent(AuthKit)

+ (id)ak_analyticsEventWithEventName:()AuthKit error:
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[AKAccountManager sharedInstance];
  v9 = [v8 primaryAuthKitAccount];
  v10 = objc_msgSend(a1, "ak_analyticsEventWithEventName:account:error:", v7, v9, v6);

  return v10;
}

+ (id)ak_analyticsEventWithEventName:()AuthKit account:error:
{
  id v7 = (objc_class *)MEMORY[0x1E4F46FC8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithEventName:v10 eventCategory:0x1EE43E8D8 initData:0];

  [v11 populateUnderlyingErrorsStartingWithRootError:v8];
  objc_msgSend(v11, "ak_updateTelemetryIdWithAccount:", v9);

  return v11;
}

- (void)ak_updateTelemetryIdWithAccount:()AuthKit
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[AKAccountManager sharedInstance];
    id v6 = [v5 telemetryDeviceSessionIDForAccount:v4];
    [a1 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F47020]];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[AAFAnalyticsEvent(AuthKit) ak_updateTelemetryIdWithAccount:](v7);
    }
  }
}

+ (id)ak_analyticsEventWithContext:()AuthKit eventName:error:
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [v7 authKitAccount:0];
  v11 = objc_msgSend(MEMORY[0x1E4F46FC8], "ak_analyticsEventWithEventName:account:error:", v9, v10, v8);

  v12 = [v7 telemetryFlowID];

  if (!v12)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[AAFAnalyticsEvent(AuthKit) ak_analyticsEventWithContext:eventName:error:](v13);
    }
  }
  v14 = [v7 telemetryFlowID];
  [v11 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F47038]];

  return v11;
}

+ (id)ak_analyticsEventWithContext:()AuthKit client:eventName:error:
{
  id v9 = (void *)MEMORY[0x1E4F46FC8];
  id v10 = a4;
  v11 = objc_msgSend(v9, "ak_analyticsEventWithContext:eventName:error:", a3, a5, a6);
  v12 = [v10 name];

  [v11 setObject:v12 forKeyedSubscript:@"processName"];

  return v11;
}

- (void)ak_updateWithAuthenticationResults:()AuthKit authContext:error:
{
  id v8 = a5;
  id v23 = 0;
  id v9 = a4;
  id v10 = [v9 authKitAccount:&v23];
  id v11 = v23;
  v12 = v11;
  if (!v10 || v11)
  {
    v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[AAFAnalyticsEvent(AuthKit) ak_updateWithAuthenticationResults:authContext:error:]((uint64_t)v8, v13);
    }
  }
  objc_msgSend(a1, "ak_updateTelemetryIdWithAccount:", v10);
  v14 = [v9 telemetryFlowID];

  [a1 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F47038]];
  uint64_t v15 = *MEMORY[0x1E4F47020];
  v16 = [a1 objectForKeyedSubscript:*MEMORY[0x1E4F47020]];
  if (!v16)
  {
    v17 = +[AKAccountManager sharedInstance];
    int v18 = [v17 accountAccessTelemetryOptInForAccount:v10];

    if (!v18) {
      goto LABEL_10;
    }
    v16 = +[AKAccountManager sharedInstance];
    v19 = [v16 telemetryDeviceSessionIDForAccount:v10];
    [a1 setObject:v19 forKeyedSubscript:v15];
  }
LABEL_10:
  uint64_t v20 = *MEMORY[0x1E4F47028];
  if (a3)
  {
    [a1 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v20];
  }
  else
  {
    [a1 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v20];
    [a1 populateUnderlyingErrorsStartingWithRootError:v8];
  }
  v21 = +[AKAccountManager sharedInstance];
  v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "securityLevelForAccount:", v10));
  [a1 setObject:v22 forKeyedSubscript:@"securityLevel"];
}

- (void)ak_updateTelemetryIdWithAccount:()AuthKit .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Not updating analytics event with nil account", v1, 2u);
}

+ (void)ak_analyticsEventWithContext:()AuthKit eventName:error:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_193494000, log, OS_LOG_TYPE_DEBUG, "Received nil flowId in AKAppleIDAuthenticationContext", v1, 2u);
}

- (void)ak_updateWithAuthenticationResults:()AuthKit authContext:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_193494000, a2, OS_LOG_TYPE_FAULT, "Error getting account from context during auth for telemetry: %@", (uint8_t *)&v2, 0xCu);
}

@end