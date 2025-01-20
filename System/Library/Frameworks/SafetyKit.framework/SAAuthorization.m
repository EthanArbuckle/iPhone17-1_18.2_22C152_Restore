@interface SAAuthorization
+ (BOOL)_synchronizePrefs;
+ (BOOL)auditTokenAuthorizedForAnyEmergency:(id *)a3;
+ (BOOL)auditTokenAuthorizedForCrashDetection:(id *)a3;
+ (BOOL)connectionAuthorizedForAnyEmergency:(id)a3;
+ (BOOL)connectionAuthorizedForCrashDetection:(id)a3;
+ (BOOL)currentConnectionAuthorizedForAnyEmergency;
+ (BOOL)currentConnectionAuthorizedForCrashDetection;
+ (BOOL)isInFlight;
+ (BOOL)setAccess:(BOOL)a3 forBundleId:(id)a4;
+ (BOOL)startAuthorizationForBundleURL:(id)a3 preflightAuthorizationStatus:(int64_t)a4 completionHandler:(id)a5;
+ (id)SASyncedBundleId;
+ (id)approvedAppExcludingBundleId:(id)a3;
+ (id)approvedBundleId;
+ (int64_t)authorizationStatusForCurrentConnection;
+ (int64_t)authorizationStatusWithTCCPreflightResult:(int)a3;
+ (void)_copyPrefsValueForKey:(id)a3;
+ (void)_setPrefsValue:(id)a3 forKey:(id)a4;
+ (void)setThirdPartyBundleId:(id)a3;
+ (void)showAuthorizationPrompt;
@end

@implementation SAAuthorization

+ (BOOL)isInFlight
{
  v2 = +[SAAuthorizationInFlight sharedInstance];
  char v3 = [v2 isInFlight];

  return v3;
}

+ (BOOL)currentConnectionAuthorizedForCrashDetection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  char v3 = v2;
  long long v7 = 0u;
  long long v8 = 0u;
  if (v2) {
    [v2 auditToken];
  }
  v6[0] = v7;
  v6[1] = v8;
  BOOL v4 = +[SAAuthorization auditTokenAuthorizedForCrashDetection:v6];

  return v4;
}

+ (BOOL)connectionAuthorizedForCrashDetection:(id)a3
{
  long long v5 = 0u;
  long long v6 = 0u;
  if (a3) {
    [a3 auditToken];
  }
  v4[0] = v5;
  v4[1] = v6;
  return +[SAAuthorization auditTokenAuthorizedForCrashDetection:v4];
}

+ (BOOL)auditTokenAuthorizedForCrashDetection:(id *)a3
{
  return TCCAccessCheckAuditToken() != 0;
}

+ (BOOL)currentConnectionAuthorizedForAnyEmergency
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  char v3 = v2;
  long long v7 = 0u;
  long long v8 = 0u;
  if (v2) {
    [v2 auditToken];
  }
  v6[0] = v7;
  v6[1] = v8;
  BOOL v4 = +[SAAuthorization auditTokenAuthorizedForCrashDetection:v6];

  return v4;
}

+ (BOOL)connectionAuthorizedForAnyEmergency:(id)a3
{
  long long v5 = 0u;
  long long v6 = 0u;
  if (a3) {
    [a3 auditToken];
  }
  v4[0] = v5;
  v4[1] = v6;
  return +[SAAuthorization auditTokenAuthorizedForAnyEmergency:v4];
}

+ (BOOL)auditTokenAuthorizedForAnyEmergency:(id *)a3
{
  return TCCAccessCheckAuditToken() != 0;
}

+ (int64_t)authorizationStatusWithTCCPreflightResult:(int)a3
{
  if (a3) {
    return a3 == 1;
  }
  else {
    return 2;
  }
}

+ (int64_t)authorizationStatusForCurrentConnection
{
  v2 = [MEMORY[0x263F08D68] currentConnection];
  char v3 = v2;
  if (v2) {
    [v2 auditToken];
  }
  int64_t v4 = +[SAAuthorization authorizationStatusWithTCCPreflightResult:](SAAuthorization, "authorizationStatusWithTCCPreflightResult:", TCCAccessPreflightWithAuditToken(), (unsigned __int128)0, (unsigned __int128)0);

  return v4;
}

+ (BOOL)startAuthorizationForBundleURL:(id)a3 preflightAuthorizationStatus:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = +[SAAuthorizationInFlight sharedInstance];
  char v10 = [v9 isInFlight];
  if ((v10 & 1) == 0)
  {
    [v9 setInFlight:1];
    [v9 setPreflightAuthorizationStatus:a4];
    [v9 setCompletionHandler:v8];
    v11 = [MEMORY[0x263F086E0] bundleWithURL:v7];
    v12 = [v11 bundleIdentifier];
    [v9 setToBundleId:v12];

    v13 = [v9 toBundleId];
    v14 = +[SAAuthorization approvedAppExcludingBundleId:v13];
    [v9 setFromApp:v14];

    v15 = [v9 fromApp];
    v16 = [v15 bundleId];
    [v9 setFromBundleId:v16];

    [(id)objc_opt_class() showAuthorizationPrompt];
  }

  return v10 ^ 1;
}

+ (id)approvedAppExcludingBundleId:(id)a3
{
  id v3 = a3;
  int64_t v4 = +[SABundleManager crashDetectionManager];
  long long v5 = [v4 approvedApps];

  if ([v5 count])
  {
    long long v6 = [v5 firstObject];
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 bundleId];
      if ([v8 isEqualToString:v3])
      {
      }
      else
      {
        v13 = [v7 pairedBundleId];
        char v14 = [v13 isEqualToString:v3];

        if ((v14 & 1) == 0)
        {
          id v15 = v7;
          goto LABEL_11;
        }
      }
    }
    id v15 = 0;
LABEL_11:

    goto LABEL_19;
  }
  v9 = +[SAAuthorization SASyncedBundleId];

  if (!v9)
  {
    id v15 = 0;
    goto LABEL_19;
  }
  id v19 = 0;
  char v10 = +[SAAuthorization SASyncedBundleId];
  v11 = +[SABundleManager remoteApplicationWithBundleId:v10 error:&v19];

  if (!v11) {
    goto LABEL_15;
  }
  v12 = [v11 bundleId];
  if ([v12 isEqualToString:v3])
  {

LABEL_15:
    if (!v19) {
      +[SAAuthorization setThirdPartyBundleId:0];
    }
    id v15 = 0;
    goto LABEL_18;
  }
  v16 = [v11 pairedBundleId];
  char v17 = [v16 isEqualToString:v3];

  if (v17) {
    goto LABEL_15;
  }
  id v15 = v11;
LABEL_18:

LABEL_19:

  return v15;
}

+ (id)approvedBundleId
{
  v2 = [a1 approvedAppExcludingBundleId:0];
  id v3 = [v2 bundleId];

  return v3;
}

+ (void)showAuthorizationPrompt
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_245182000, v0, OS_LOG_TYPE_DEBUG, "%s - Authorization prompt for, authorization: %@", (uint8_t *)v1, 0x16u);
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int64_t v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v5 = [*(id *)(a1 + 32) fromApp];

  id v47 = v3;
  if (v5)
  {
    long long v6 = NSString;
    if (v3)
    {
      id v7 = [v4 localizedStringForKey:@"ALERT_HEADER_LONG_PHONE" value:&stru_26F9E5E48 table:0];
      id v8 = [*(id *)(a1 + 32) getToBundleLocalizedName];
      objc_msgSend(v6, "stringWithFormat:", v7, v8, v3);
    }
    else
    {
      id v7 = [v4 localizedStringForKey:@"ALERT_HEADER_LONG_MISSING_APP_PHONE" value:&stru_26F9E5E48 table:0];
      id v8 = [*(id *)(a1 + 32) getToBundleLocalizedName];
      objc_msgSend(v6, "stringWithFormat:", v7, v8, v44);
    uint64_t v45 = };
    id v22 = v3;

    v13 = [v4 localizedStringForKey:@"ALERT_LONG_PHONE" value:&stru_26F9E5E48 table:0];
    v23 = NSString;
    v24 = [*(id *)(a1 + 32) getToBundleLocalizedName];
    v16 = objc_msgSend(v23, "stringWithFormat:", v13, v24);

    v25 = NSString;
    v26 = [v4 localizedStringForKey:@"DEFAULT_BUTTON_TITLE_LONG" value:&stru_26F9E5E48 table:0];
    v27 = [*(id *)(a1 + 32) getToBundleLocalizedName];
    v20 = objc_msgSend(v25, "stringWithFormat:", v26, v27);

    if (v22)
    {
      v28 = NSString;
      v29 = [v4 localizedStringForKey:@"ALTERNATE_BUTTON_TITLE_LONG" value:&stru_26F9E5E48 table:0];
      v21 = objc_msgSend(v28, "stringWithFormat:", v29, v22);
    }
    else
    {
      v21 = [v4 localizedStringForKey:@"ALTERNATE_BUTTON_TITLE_MISSING_APP_LONG" value:&stru_26F9E5E48 table:0];
    }
    v12 = (void *)v45;
  }
  else
  {
    v9 = NSString;
    char v10 = [v4 localizedStringForKey:@"ALERT_HEADER_SHORT_PHONE" value:&stru_26F9E5E48 table:0];
    v11 = [*(id *)(a1 + 32) getToBundleLocalizedName];
    v12 = objc_msgSend(v9, "stringWithFormat:", v10, v11);

    v13 = [v4 localizedStringForKey:@"ALERT_SHORT_PHONE" value:&stru_26F9E5E48 table:0];
    char v14 = NSString;
    id v15 = [*(id *)(a1 + 32) getToBundleLocalizedName];
    v16 = objc_msgSend(v14, "stringWithFormat:", v13, v15);

    char v17 = NSString;
    v18 = [v4 localizedStringForKey:@"DEFAULT_BUTTON_TITLE_SHORT" value:&stru_26F9E5E48 table:0];
    id v19 = [*(id *)(a1 + 32) getToBundleLocalizedName];
    v20 = objc_msgSend(v17, "stringWithFormat:", v18, v19);

    v21 = [v4 localizedStringForKey:@"ALTERNATE_BUTTON_TITLE_SHORT" value:&stru_26F9E5E48 table:0];
  }

  v30 = objc_opt_new();
  [v30 setObject:v12 forKeyedSubscript:*MEMORY[0x263EFFFC8]];
  [v30 setObject:v16 forKeyedSubscript:*MEMORY[0x263EFFFD8]];
  [v30 setObject:v20 forKeyedSubscript:*MEMORY[0x263F00000]];
  [v30 setObject:v21 forKeyedSubscript:*MEMORY[0x263EFFFE8]];
  v31 = [MEMORY[0x263EFFA40] standardUserDefaults];
  v32 = [v31 valueForKey:@"SAServerMockAuthorizationPromptAnswer"];

  if (v32)
  {
    v33 = sa_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_3();
    }

    char v34 = [v32 BOOLValue] ^ 1;
    v35 = sa_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_2();
    }

    authorizationPromptResponseHandler(0, v34);
    goto LABEL_19;
  }
  SInt32 error = 0;
  v36 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0.0, 0, &error, (CFDictionaryRef)v30);
  if (v36 && !error)
  {
    RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v36, (CFUserNotificationCallBack)authorizationPromptResponseHandler, 0);
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
    CFRelease(RunLoopSource);
LABEL_19:
    v39 = v47;
    goto LABEL_20;
  }
  v46 = v12;
  if (v36) {
    CFRelease(v36);
  }
  v40 = [*(id *)(a1 + 32) completionHandler];
  uint64_t v41 = [*(id *)(a1 + 32) preflightAuthorizationStatus];
  v42 = +[SAError errorWithCode:4];
  ((void (**)(void, uint64_t, void *))v40)[2](v40, v41, v42);

  [*(id *)(a1 + 32) reset];
  v43 = sa_default_log();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
    __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_1(&error, v43);
  }

  v12 = v46;
  v39 = v47;
LABEL_20:
}

+ (BOOL)setAccess:(BOOL)a3 forBundleId:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:v6];

  if (!v7)
  {
    if (v4)
    {
      char v10 = sa_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[SAAuthorization setAccess:forBundleId:]((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    else if (TCCAccessSetForBundleId())
    {
      goto LABEL_10;
    }
LABEL_12:
    BOOL v17 = 0;
    goto LABEL_13;
  }
  if (!TCCAccessSetForBundleId()) {
    goto LABEL_12;
  }
  if (!v4)
  {
LABEL_10:
    id v8 = a1;
    id v9 = 0;
    goto LABEL_11;
  }
  id v8 = a1;
  id v9 = v6;
LABEL_11:
  [v8 setThirdPartyBundleId:v9];
  BOOL v17 = 1;
LABEL_13:

  return v17;
}

+ (id)SASyncedBundleId
{
  [a1 _synchronizePrefs];
  id v3 = (void *)[a1 _copyPrefsValueForKey:@"SAKappaThirdPartyBundleId"];

  return v3;
}

+ (void)setThirdPartyBundleId:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v5 = sa_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_245182000, v5, OS_LOG_TYPE_DEFAULT, "setting third party bundleId: %@", buf, 0xCu);
  }

  id v6 = (void *)[a1 _copyPrefsValueForKey:@"SAKappaThirdPartyBundleId"];
  if (([v6 isEqual:v4] & 1) == 0)
  {
    [a1 _setPrefsValue:v4 forKey:@"SAKappaThirdPartyBundleId"];
    id v7 = dispatch_get_global_queue(2, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SAAuthorization_setThirdPartyBundleId___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v7, block);
  }
}

void __41__SAAuthorization_setThirdPartyBundleId___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _synchronizePrefs];
  id v2 = (id)objc_opt_new();
  v1 = [MEMORY[0x263EFFA08] setWithObject:@"SAKappaThirdPartyBundleId"];
  [v2 synchronizeUserDefaultsDomain:@"com.apple.SafetyKit" keys:v1];
}

+ (void)_copyPrefsValueForKey:(id)a3
{
  return (void *)CFPreferencesCopyValue((CFStringRef)a3, @"com.apple.SafetyKit", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]);
}

+ (void)_setPrefsValue:(id)a3 forKey:(id)a4
{
}

+ (BOOL)_synchronizePrefs
{
  return CFPreferencesSynchronize(@"com.apple.SafetyKit", @"mobile", (CFStringRef)*MEMORY[0x263EFFE68]) != 0;
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_1(int *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = 136315394;
  id v4 = "+[SAAuthorization showAuthorizationPrompt]_block_invoke";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_245182000, a2, OS_LOG_TYPE_ERROR, "%s - CFUserNotificationCreate failed, error: %d", (uint8_t *)&v3, 0x12u);
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_245182000, v1, OS_LOG_TYPE_DEBUG, "%s - Mocking answer to authorization prompt, mockAnswer: %@, responseFlags: %lu", (uint8_t *)v2, 0x20u);
}

void __42__SAAuthorization_showAuthorizationPrompt__block_invoke_cold_3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_245182000, v0, OS_LOG_TYPE_DEBUG, "%s - Would have presented notification, details: %@", (uint8_t *)v1, 0x16u);
}

+ (void)setAccess:(uint64_t)a3 forBundleId:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end