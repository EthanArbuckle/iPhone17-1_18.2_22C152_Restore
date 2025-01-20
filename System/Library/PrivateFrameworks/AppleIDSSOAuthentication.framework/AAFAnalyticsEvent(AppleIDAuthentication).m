@interface AAFAnalyticsEvent(AppleIDAuthentication)
+ (__CFString)eventNameForService:()AppleIDAuthentication;
+ (__CFString)finishEventNameForService:()AppleIDAuthentication;
+ (__CFString)startEventNameForService:()AppleIDAuthentication;
+ (id)accountForAuthenticationResults:()AppleIDAuthentication accountManager:;
+ (id)aida_analyticsDurationEventForAIDAServiceType:()AppleIDAuthentication accountManager:authenticationResults:;
+ (id)aida_analyticsEventWithEventName:()AppleIDAuthentication;
+ (id)aida_analyticsEventWithEventName:()AppleIDAuthentication accountManager:authenticationResults:;
+ (id)aida_analyticsFinishEventForAIDAServiceType:()AppleIDAuthentication accountManager:authenticationResults:success:error:;
+ (id)aida_analyticsStartEventForAIDAServiceType:()AppleIDAuthentication accountManager:authenticationResults:;
- (void)aida_updateEventWithSuccess:()AppleIDAuthentication error:;
- (void)aida_updateTelemetryIdsWithAuthenticationResults:()AppleIDAuthentication accountManager:;
@end

@implementation AAFAnalyticsEvent(AppleIDAuthentication)

+ (id)aida_analyticsStartEventForAIDAServiceType:()AppleIDAuthentication accountManager:authenticationResults:
{
  v8 = (void *)MEMORY[0x1E4F46FC8];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 startEventNameForService:a3];
  v12 = objc_msgSend(a1, "aida_analyticsEventWithEventName:accountManager:authenticationResults:", v11, v10, v9);

  return v12;
}

+ (id)aida_analyticsFinishEventForAIDAServiceType:()AppleIDAuthentication accountManager:authenticationResults:success:error:
{
  v12 = (void *)MEMORY[0x1E4F46FC8];
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  v16 = [v12 finishEventNameForService:a3];
  v17 = objc_msgSend(a1, "aida_analyticsEventWithEventName:accountManager:authenticationResults:", v16, v15, v14);

  objc_msgSend(v17, "aida_updateEventWithSuccess:error:", a6, v13);
  return v17;
}

+ (id)aida_analyticsDurationEventForAIDAServiceType:()AppleIDAuthentication accountManager:authenticationResults:
{
  v8 = (void *)MEMORY[0x1E4F46FC8];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 eventNameForService:a3];
  v12 = objc_msgSend(a1, "aida_analyticsEventWithEventName:accountManager:authenticationResults:", v11, v10, v9);

  return v12;
}

+ (id)aida_analyticsEventWithEventName:()AppleIDAuthentication accountManager:authenticationResults:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_msgSend(a1, "aida_analyticsEventWithEventName:", a3);
  objc_msgSend(v10, "aida_updateTelemetryIdsWithAuthenticationResults:accountManager:", v8, v9);

  return v10;
}

+ (id)aida_analyticsEventWithEventName:()AppleIDAuthentication
{
  v3 = (objc_class *)MEMORY[0x1E4F46FC8];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithEventName:v4 eventCategory:0x1F388F400 initData:0];

  return v5;
}

- (void)aida_updateEventWithSuccess:()AppleIDAuthentication error:
{
  [a1 populateUnderlyingErrorsStartingWithRootError:a4];
  id v6 = [NSNumber numberWithBool:a3];
  [a1 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F47028]];
}

- (void)aida_updateTelemetryIdsWithAuthenticationResults:()AppleIDAuthentication accountManager:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F46FC8] accountForAuthenticationResults:v6 accountManager:v7];
  if (v8)
  {
    id v9 = [v7 telemetryDeviceSessionIDForAccount:v8];
    [a1 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F47020]];

    id v10 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F4EE00]];
    [a1 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F47038]];
  }
  else
  {
    v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAFAnalyticsEvent(AppleIDAuthentication) aida_updateTelemetryIdsWithAuthenticationResults:accountManager:](v11);
    }
  }
}

+ (id)accountForAuthenticationResults:()AppleIDAuthentication accountManager:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4ED98]];
  id v14 = 0;
  id v8 = [v6 authKitAccountWithAltDSID:v7 error:&v14];
  id v9 = v14;
  if (v9)
  {
    id v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[AAFAnalyticsEvent(AppleIDAuthentication) accountForAuthenticationResults:accountManager:]((uint64_t)v9, v10);
    }
  }
  if (v8)
  {
    id v11 = v8;
  }
  else
  {
    v12 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F4EDA8]];
    id v11 = [v6 authKitAccountWithDSID:v12];
  }
  return v11;
}

+ (__CFString)startEventNameForService:()AppleIDAuthentication
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.AppleID.Service.Cloud"])
  {
    id v4 = kAIDASignInStartTelemetryEventNameiCloud;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.Store"])
  {
    id v4 = kAIDASignInStartTelemetryEventNameStore;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.Messages"])
  {
    id v4 = kAIDASignInStartTelemetryEventNameMessages;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.FaceTime"])
  {
    id v4 = kAIDASignInStartTelemetryEventNameFaceTime;
  }
  else
  {
    int v5 = [v3 isEqualToString:@"com.apple.AppleID.Service.GameCenter"];
    id v4 = kAIDASignInStartTelemetryEventNameUnknown;
    if (v5) {
      id v4 = kAIDASignInStartTelemetryEventNameGameCenter;
    }
  }
  id v6 = *v4;

  return v6;
}

+ (__CFString)eventNameForService:()AppleIDAuthentication
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.AppleID.Service.Cloud"])
  {
    id v4 = kAIDASignInTelemetryEventNameiCloud;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.Store"])
  {
    id v4 = kAIDASignInTelemetryEventNameStore;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.Messages"])
  {
    id v4 = kAIDASignInTelemetryEventNameMessages;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.FaceTime"])
  {
    id v4 = kAIDASignInTelemetryEventNameFaceTime;
  }
  else
  {
    int v5 = [v3 isEqualToString:@"com.apple.AppleID.Service.GameCenter"];
    id v4 = kAIDASignInTelemetryEventNameUnknown;
    if (v5) {
      id v4 = kAIDASignInTelemetryEventNameGameCenter;
    }
  }
  id v6 = *v4;

  return v6;
}

+ (__CFString)finishEventNameForService:()AppleIDAuthentication
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.AppleID.Service.Cloud"])
  {
    id v4 = kAIDASignInFinishTelemetryEventNameiCloud;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.Store"])
  {
    id v4 = kAIDASignInFinishTelemetryEventNameStore;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.Messages"])
  {
    id v4 = kAIDASignInFinishTelemetryEventNameMessages;
  }
  else if ([v3 isEqualToString:@"com.apple.AppleID.Service.FaceTime"])
  {
    id v4 = kAIDASignInFinishTelemetryEventNameFaceTime;
  }
  else
  {
    int v5 = [v3 isEqualToString:@"com.apple.AppleID.Service.GameCenter"];
    id v4 = &kAIDASignInFinishTelemetryEventNameUnknown;
    if (v5) {
      id v4 = kAIDASignInFinishTelemetryEventNameGameCenter;
    }
  }
  id v6 = *v4;

  return v6;
}

- (void)aida_updateTelemetryIdsWithAuthenticationResults:()AppleIDAuthentication accountManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD36A000, log, OS_LOG_TYPE_ERROR, "Error getting account from auth results during sign-in for telemetry, not updating analytics event with nil account", v1, 2u);
}

+ (void)accountForAuthenticationResults:()AppleIDAuthentication accountManager:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD36A000, a2, OS_LOG_TYPE_ERROR, "Error fetching IdMS account:%@", (uint8_t *)&v2, 0xCu);
}

@end