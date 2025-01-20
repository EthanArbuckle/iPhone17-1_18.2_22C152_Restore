@interface CDMSELFLoggingPolicy
+ (BOOL)isDiagnosticsSubmissionAllowed;
+ (BOOL)isSELFLoggingAllowed:(int)a3;
+ (int)getSELFCDMLoggingPolicyType:(id)a3;
@end

@implementation CDMSELFLoggingPolicy

+ (BOOL)isSELFLoggingAllowed:(int)a3
{
  if (a3 == 2) {
    return +[CDMSELFLoggingPolicy isDiagnosticsSubmissionAllowed];
  }
  else {
    return a3 == 1;
  }
}

+ (BOOL)isDiagnosticsSubmissionAllowed
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53878]] == 1;

  return v3;
}

+ (int)getSELFCDMLoggingPolicyType:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3)
  {
    v4 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315138;
      v10 = "+[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:]";
      _os_log_impl(&dword_2263A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Calling bundle id is nil, setting logging policy to NO_LOGGING", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_13;
  }
  if (getSELFCDMLoggingPolicyType__onceToken[0] != -1) {
    dispatch_once(getSELFCDMLoggingPolicyType__onceToken, &__block_literal_global_10668);
  }
  v4 = [(id)getSELFCDMLoggingPolicyType__bundleIdStringToCDMPolicyTypeDict objectForKey:v3];
  v5 = CDMOSLoggerForCategory(0);
  v6 = v5;
  if (!v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      v10 = "+[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:]";
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_2263A0000, v6, OS_LOG_TYPE_INFO, "%s [WARN]: Unknown calling bundle id, setting logging policy to NO_LOGGING: %@", (uint8_t *)&v9, 0x16u);
    }

    v4 = 0;
LABEL_13:
    int v7 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315650;
    v10 = "+[CDMSELFLoggingPolicy getSELFCDMLoggingPolicyType:]";
    __int16 v11 = 2112;
    id v12 = v3;
    __int16 v13 = 2112;
    v14 = v4;
    _os_log_debug_impl(&dword_2263A0000, v6, OS_LOG_TYPE_DEBUG, "%s Calling bundle id - %@, Logging Policy - %@", (uint8_t *)&v9, 0x20u);
  }

  int v7 = [v4 intValue];
LABEL_14:

  return v7;
}

void __52__CDMSELFLoggingPolicy_getSELFCDMLoggingPolicyType___block_invoke()
{
  v20[17] = *MEMORY[0x263EF8340];
  v19[0] = @"com.apple.assistant.assistantd";
  v18 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v20[0] = v18;
  v19[1] = @"com.apple.searchd";
  v17 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[1] = v17;
  v19[2] = @"com.apple.spotlight";
  v16 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[2] = v16;
  v19[3] = @"com.apple.Spotlight";
  uint64_t v15 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[3] = v15;
  v19[4] = @"com.apple.assistant.cdmtool";
  v14 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v20[4] = v14;
  v19[5] = @"com.apple.AssistantServices";
  __int16 v13 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v20[5] = v13;
  v19[6] = @"com.apple.siri.nlteam.SiriSSUCLINLU";
  id v12 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v20[6] = v12;
  v19[7] = @"com.apple.assistantd";
  v0 = (void *)[objc_alloc(NSNumber) initWithInt:1];
  v20[7] = v0;
  v19[8] = @"com.apple.mobileslideshow";
  v1 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[8] = v1;
  v19[9] = @"com.apple.Photos";
  v2 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[9] = v2;
  v19[10] = @"com.apple.mobilemail";
  id v3 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[10] = v3;
  v19[11] = @"com.apple.mail";
  v4 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[11] = v4;
  v19[12] = @"com.apple.mobilenotes";
  v5 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[12] = v5;
  v19[13] = @"com.apple.Notes";
  v6 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[13] = v6;
  v19[14] = @"com.apple.StickerKit.StickerPickerService";
  int v7 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[14] = v7;
  v19[15] = @"com.apple.GenerativePlaygroundApp";
  v8 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[15] = v8;
  v19[16] = @"com.apple.omniSearch.SearchToolExtension";
  int v9 = (void *)[objc_alloc(NSNumber) initWithInt:2];
  v20[16] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:17];
  __int16 v11 = (void *)getSELFCDMLoggingPolicyType__bundleIdStringToCDMPolicyTypeDict;
  getSELFCDMLoggingPolicyType__bundleIdStringToCDMPolicyTypeDict = v10;
}

@end