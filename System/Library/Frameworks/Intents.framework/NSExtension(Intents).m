@interface NSExtension(Intents)
+ (BOOL)appAllowedToTalkToSiri:()Intents;
+ (id)_extensionMatchingDictionaryForIntentClassNames:()Intents extensionPointName:launchId:;
+ (uint64_t)_intents_extensionMatchingAttributesForIntents:()Intents;
+ (uint64_t)_intents_findPossibleSiriEnabledAppsWithAnIntentsServiceExtension:()Intents;
+ (uint64_t)_intents_matchExtensionsForIntent:()Intents completion:;
+ (uint64_t)_intents_matchExtensionsForIntent:()Intents requireTrustCheck:completion:;
+ (uint64_t)_intents_matchExtensionsForIntent:()Intents shouldIgnoreLaunchId:completion:;
+ (uint64_t)_intents_matchSiriExtensionsForIntent:()Intents completion:;
+ (uint64_t)_intents_uiExtensionMatchingAttributesForIntents:()Intents;
+ (uint64_t)_matchExtensionsForIntent:()Intents extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:;
+ (void)_findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:()Intents completion:;
+ (void)_intents_findAppsWithAnIntentsServiceExtension:()Intents;
+ (void)_intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:()Intents;
+ (void)_intents_matchSiriUIExtensionsForIntent:()Intents completion:;
+ (void)_intents_matchSiriUISnippetExtensionsWithCompletion:()Intents;
+ (void)_intents_matchUIExtensionsForIntent:()Intents completion:;
+ (void)_matchExtensionsForIntent:()Intents extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaunchId:requireTrustCheck:completion:;
+ (void)_matchExtensionsWithAttributes:()Intents extensionPointName:requireTrustCheck:completion:;
+ (void)_matchSnippetExtensionsWithExtensionPointName:()Intents completion:;
- (BOOL)_intents_extensionSupportsAtLeastOneSiriIntent;
- (id)_intents_intentsRestrictedWhileProtectedDataUnavailable;
@end

@implementation NSExtension(Intents)

+ (uint64_t)_intents_extensionMatchingAttributesForIntents:()Intents
{
  return [a1 _extensionMatchingDictionaryForIntentClassNames:a3 extensionPointName:@"com.apple.intents-service" launchId:0];
}

+ (id)_extensionMatchingDictionaryForIntentClassNames:()Intents extensionPointName:launchId:
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v17[0] = *MEMORY[0x1E4F282B0];
  v17[1] = @"IntentsSupported";
  v18[0] = v8;
  v18[1] = v7;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  v11 = (void *)[v10 mutableCopy];

  if (v9)
  {
    id v16 = 0;
    INExtractAppInfoFromSiriLaunchId(v9, 0, &v16);
    id v12 = v16;
    if (v12)
    {
      v13 = v12;
      [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F914B0]];
    }
  }
  v14 = (void *)[v11 copy];

  return v14;
}

+ (uint64_t)_intents_uiExtensionMatchingAttributesForIntents:()Intents
{
  return [a1 _extensionMatchingDictionaryForIntentClassNames:a3 extensionPointName:@"com.apple.intents-ui-service" launchId:0];
}

- (BOOL)_intents_extensionSupportsAtLeastOneSiriIntent
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v1 = (void *)MEMORY[0x1E4F22458];
  v2 = [a1 _extensionBundle];
  v3 = [v2 bundleIdentifier];
  v4 = [v1 pluginKitProxyForIdentifier:v3];

  if (v4)
  {
    v9[0] = v4;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    v6 = _INSupportedIntentsByExtensions(1, v5, 0);
  }
  else
  {
    v6 = 0;
  }
  BOOL v7 = [v6 count] != 0;

  return v7;
}

- (id)_intents_intentsRestrictedWhileProtectedDataUnavailable
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  v2 = [a1 attributes];
  v3 = [v2 objectForKey:@"IntentsRestrictedWhileProtectedDataUnavailable"];
  v4 = [v1 setWithArray:v3];

  return v4;
}

+ (BOOL)appAllowedToTalkToSiri:()Intents
{
  return +[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:](_INSiriAuthorizationManager, "_siriAuthorizationStatusForAppID:") == 3;
}

+ (void)_findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:()Intents completion:
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (v6)
  {
    uint64_t v13 = *MEMORY[0x1E4F282B0];
    v14[0] = @"com.apple.intents-service";
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v8 = (void *)MEMORY[0x1E4F28C70];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __96__NSExtension_Intents___findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter_completion___block_invoke;
    v9[3] = &unk_1E551DA08;
    uint64_t v11 = a3;
    uint64_t v12 = a1;
    id v10 = v6;
    [v8 extensionsWithMatchingAttributes:v7 completion:v9];
  }
}

+ (void)_intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:()Intents
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__NSExtension_Intents___intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion___block_invoke;
  v6[3] = &unk_1E551D960;
  id v7 = v4;
  id v5 = v4;
  [a1 _findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:1 completion:v6];
}

+ (uint64_t)_intents_findPossibleSiriEnabledAppsWithAnIntentsServiceExtension:()Intents
{
  return [a1 _findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:0 completion:a3];
}

+ (void)_intents_findAppsWithAnIntentsServiceExtension:()Intents
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__NSExtension_Intents___intents_findAppsWithAnIntentsServiceExtension___block_invoke;
  v6[3] = &unk_1E551D960;
  id v7 = v4;
  id v5 = v4;
  [a1 _findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter:10 completion:v6];
}

+ (void)_matchExtensionsWithAttributes:()Intents extensionPointName:requireTrustCheck:completion:
{
  id v9 = a4;
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x1E4F28C70];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __103__NSExtension_Intents___matchExtensionsWithAttributes_extensionPointName_requireTrustCheck_completion___block_invoke;
  v14[3] = &unk_1E551D9D8;
  char v17 = a5;
  id v15 = v9;
  id v16 = v10;
  id v12 = v10;
  id v13 = v9;
  [v11 extensionsWithMatchingAttributes:a3 completion:v14];
}

+ (void)_matchSnippetExtensionsWithExtensionPointName:()Intents completion:
{
  void v14[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (v6)
    {
      uint64_t v8 = *MEMORY[0x1E4F282B0];
      v13[1] = @"IntentsSupported";
      v14[0] = v6;
      id v12 = @"SiriUISnippetExtensionIntent";
      v13[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
      v14[1] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

      [a1 _matchExtensionsWithAttributes:v10 extensionPointName:v6 requireTrustCheck:1 completion:v7];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INExtensionMatchingErrorDomain" code:3004 userInfo:0];
      v7[2](v7, 0, v11);
    }
  }
}

+ (void)_matchExtensionsForIntent:()Intents extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaunchId:requireTrustCheck:completion:
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  if (!v16) {
    goto LABEL_26;
  }
  if (!v14)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 3003;
LABEL_20:
    v25 = [v23 errorWithDomain:@"INExtensionMatchingErrorDomain" code:v24 userInfo:0];
    v16[2](v16, 0, v25);

    goto LABEL_26;
  }
  if (!v15)
  {
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = 3004;
    goto LABEL_20;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = [v14 extensionBundleId];
  if (v18) {
    [v17 addObject:v18];
  }
  v36 = (void *)v18;
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.SiriViewService"];
  if ([v35 BOOLForKey:@"kEnableEnhancedSiriUI"])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v48 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnore"
              "LaunchId:requireTrustCheck:completion:]";
        _os_log_impl(&dword_18CB2F000, v19, OS_LOG_TYPE_INFO, "%s Setting UIExtensionBundleID to MessagesAssistantUIExtension", buf, 0xCu);
      }
      [v14 _setUiExtensionBundleId:@"com.apple.MobileSMS.MessagesAssistantUIExtension"];
    }
  }
  uint64_t v20 = [v14 _uiExtensionBundleId];
  if ([v15 isEqualToString:@"com.apple.intents-ui-service"] && v20) {
    [v17 insertObject:v20 atIndex:0];
  }
  v34 = (void *)v20;
  if ([v17 count])
  {
    v21 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLa"
            "unchId:requireTrustCheck:completion:]";
      __int16 v49 = 2112;
      id v50 = v17;
      _os_log_impl(&dword_18CB2F000, v21, OS_LOG_TYPE_INFO, "%s Considering possible extension bundle id candidates for direct lookup: %@", buf, 0x16u);
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke;
    v42[3] = &unk_1E551D988;
    id v43 = v17;
    v45 = v16;
    id v44 = v14;
    [v43 enumerateObjectsUsingBlock:v42];

    id v22 = v43;
  }
  else
  {
    objc_msgSend(v14, "_intents_launchIdForCurrentPlatform");
    v26 = id v33 = v17;
    id v22 = [v14 _className];
    int v27 = [v26 hasPrefix:@"com.apple.shortcuts"] | a6;
    id v46 = v22;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
    if (v27) {
      v29 = 0;
    }
    else {
      v29 = v26;
    }
    v30 = [a1 _extensionMatchingDictionaryForIntentClassNames:v28 extensionPointName:v15 launchId:v29];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke_43;
    v37[3] = &unk_1E551D9B0;
    char v41 = a5;
    id v38 = v26;
    v40 = a1;
    v39 = v16;
    id v31 = v26;
    id v17 = v33;
    id v32 = v31;
    [a1 _matchExtensionsWithAttributes:v30 extensionPointName:v15 requireTrustCheck:a7 completion:v37];
  }
LABEL_26:
}

+ (uint64_t)_matchExtensionsForIntent:()Intents extensionPointName:shouldCheckForSiriEnabled:requireTrustCheck:completion:
{
  return [a1 _matchExtensionsForIntent:a3 extensionPointName:a4 shouldCheckForSiriEnabled:a5 shouldIgnoreLaunchId:0 requireTrustCheck:a6 completion:a7];
}

+ (void)_intents_matchSiriUISnippetExtensionsWithCompletion:()Intents
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke;
  v6[3] = &unk_1E551D960;
  id v7 = v4;
  id v5 = v4;
  [a1 _matchSnippetExtensionsWithExtensionPointName:@"com.apple.intents-ui-service" completion:v6];
}

+ (void)_intents_matchSiriUIExtensionsForIntent:()Intents completion:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke;
  v8[3] = &unk_1E551D960;
  id v9 = v6;
  id v7 = v6;
  [a1 _matchExtensionsForIntent:a3 extensionPointName:@"com.apple.intents-ui-service" shouldCheckForSiriEnabled:1 requireTrustCheck:1 completion:v8];
}

+ (uint64_t)_intents_matchSiriExtensionsForIntent:()Intents completion:
{
  return [a1 _matchExtensionsForIntent:a3 extensionPointName:@"com.apple.intents-service" shouldCheckForSiriEnabled:1 requireTrustCheck:1 completion:a4];
}

+ (void)_intents_matchUIExtensionsForIntent:()Intents completion:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke;
  v8[3] = &unk_1E551D960;
  id v9 = v6;
  id v7 = v6;
  [a1 _matchExtensionsForIntent:a3 extensionPointName:@"com.apple.intents-ui-service" shouldCheckForSiriEnabled:0 requireTrustCheck:1 completion:v8];
}

+ (uint64_t)_intents_matchExtensionsForIntent:()Intents requireTrustCheck:completion:
{
  return [a1 _matchExtensionsForIntent:a3 extensionPointName:@"com.apple.intents-service" shouldCheckForSiriEnabled:0 requireTrustCheck:a4 completion:a5];
}

+ (uint64_t)_intents_matchExtensionsForIntent:()Intents completion:
{
  return [a1 _matchExtensionsForIntent:a3 extensionPointName:@"com.apple.intents-service" shouldCheckForSiriEnabled:0 requireTrustCheck:1 completion:a4];
}

+ (uint64_t)_intents_matchExtensionsForIntent:()Intents shouldIgnoreLaunchId:completion:
{
  return [a1 _matchExtensionsForIntent:a3 extensionPointName:@"com.apple.intents-service" shouldCheckForSiriEnabled:0 shouldIgnoreLaunchId:a4 requireTrustCheck:1 completion:a5];
}

@end