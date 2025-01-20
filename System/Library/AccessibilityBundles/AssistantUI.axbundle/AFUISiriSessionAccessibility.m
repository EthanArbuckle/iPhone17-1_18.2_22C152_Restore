@interface AFUISiriSessionAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axIsAddViewsCommandAllowed:(id)a3;
- (BOOL)_axIsAppInClarity:(id)a3;
- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5;
- (void)cancelSpeechRequest;
@end

@implementation AFUISiriSessionAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AFUISiriSession";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriSession", @"cancelSpeechRequest", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriSession", @"_connection", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriSession", @"_stateHandler", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriSession", @"assistantConnection:receivedCommand:completion:", "v", "@", "@", "@?", 0);
}

- (void)cancelSpeechRequest
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AFUISiriSessionAccessibility *)self _accessibilityBoolValueForKey:@"VoiceOverCancelRequestInProgress"];
  v4 = [(AFUISiriSessionAccessibility *)self safeValueForKey:@"_connection"];
  if (AXIsInternalInstall())
  {
    v5 = AXLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [NSNumber numberWithBool:v3];
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      __int16 v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_241F36000, v5, OS_LOG_TYPE_DEFAULT, "Transferring voice cancel request in progress %@ to connection %@", buf, 0x16u);
    }
  }
  [v4 _accessibilitySetBoolValue:v3 forKey:@"VoiceOverCancelRequestInProgress"];
  v7.receiver = self;
  v7.super_class = (Class)AFUISiriSessionAccessibility;
  [(AFUISiriSessionAccessibility *)&v7 cancelSpeechRequest];
  [v4 _accessibilitySetBoolValue:0 forKey:@"VoiceOverCancelRequestInProgress"];
}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  int v12 = [v11 isClarityBoardEnabled];

  if (v12
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ![(AFUISiriSessionAccessibility *)self _axIsAddViewsCommandAllowed:v9])
  {
    v13 = AXLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v9;
      _os_log_impl(&dword_241F36000, v13, OS_LOG_TYPE_DEFAULT, "Command %@ is unallowed in custom accessibility mode", buf, 0xCu);
    }

    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __79__AFUISiriSessionAccessibility_assistantConnection_receivedCommand_completion___block_invoke;
    v18 = &unk_2651091D8;
    v19 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AFUISiriSessionAccessibility;
    [(AFUISiriSessionAccessibility *)&v14 assistantConnection:v8 receivedCommand:v9 completion:v10];
  }
}

void __79__AFUISiriSessionAccessibility_assistantConnection_receivedCommand_completion___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) safeValueForKey:@"_stateHandler"];
  uint64_t v3 = __UIAccessibilityCastAsClass();

  [v3 performTransitionForEvent:7];
}

- (BOOL)_axIsAddViewsCommandAllowed:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = NSDictionary;
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v7 = [v6 pathForResource:@"UnallowedSiriCommands" ofType:@"plist"];
  id v8 = [v5 dictionaryWithContentsOfFile:v7];

  id v9 = [v8 objectForKey:@"SAUIAddViewsUnallowedSiriCommands"];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = [v4 views];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    v29 = self;
    id v30 = v4;
    unint64_t v13 = 0x263F64000uLL;
    objc_super v14 = @"StartCall";
    uint64_t v33 = *(void *)v35;
    v31 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(v10);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          uint64_t v16 = __UIAccessibilityCastAsClass();
          v17 = [v16 dialogIdentifier];
        }
        else
        {
          v17 = 0;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v32 = i;
          uint64_t v18 = v12;
          v19 = v10;
          v20 = v14;
          id v21 = v9;
          unint64_t v22 = v13;
          objc_opt_class();
          v23 = __UIAccessibilityCastAsClass();
          v24 = [v23 sash];
          v25 = [v24 applicationBundleIdentifier];

          unint64_t v13 = v22;
          id v9 = v21;
          objc_super v14 = v20;
          id v10 = v19;
          uint64_t v12 = v18;
          uint64_t i = v32;
        }
        else
        {
          v25 = 0;
        }
        if (objc_msgSend(v17, "containsString:", v14, v29))
        {
          v27 = @"com.apple.mobilephone";
          goto LABEL_33;
        }
        if (([v17 containsString:@"ReadMail"] & 1) != 0
          || ([v17 containsString:@"SendMail"] & 1) != 0)
        {
          v27 = @"com.apple.mobilemail";
          goto LABEL_33;
        }
        if (([v17 containsString:@"FindEvents"] & 1) != 0
          || ([v17 containsString:@"CreateEvent"] & 1) != 0)
        {
          v27 = @"com.apple.mobilecal";
          goto LABEL_33;
        }
        if ([v17 containsString:@"WEBINDEX"])
        {
          v27 = @"com.apple.mobilesafari";
          goto LABEL_33;
        }
        if ([v17 containsString:@"STOCKS"])
        {
          v27 = @"com.apple.stocks";
          goto LABEL_33;
        }
        if ([v9 containsObject:v17])
        {
          char v26 = 0;
          goto LABEL_34;
        }
        if (v25 && ([(__CFString *)v25 isEqualToString:@"com.apple.weather"] & 1) == 0)
        {
          v27 = v25;
LABEL_33:
          char v26 = [(AFUISiriSessionAccessibility *)v29 _axIsAppInClarity:v27];
LABEL_34:
          id v4 = v30;

          id v8 = v31;
          goto LABEL_35;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v38 count:16];
      char v26 = 1;
      id v4 = v30;
      id v8 = v31;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v26 = 1;
  }
LABEL_35:

  return v26;
}

- (BOOL)_axIsAppInClarity:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F32040] sharedInstance];
  v5 = [v4 applicationBundleIdentifiers];
  if ([v5 containsObject:v3]) {
    char v6 = 1;
  }
  else {
    char v6 = [v3 isEqualToString:@"com.apple.siri"];
  }

  return v6;
}

@end