@interface NSExtension
@end

@implementation NSExtension

void __96__NSExtension_Intents___findAppsWithAnyIntentsExtensionCheckingSiriEnabledUseFilter_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v20 = a3;
  if (v4)
  {
    uint64_t v5 = [v4 count];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v5];
    v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  }
  else
  {
    v6 = 0;
    v21 = 0;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v13 = [v12 _plugIn];
        v14 = [v13 containingUrl];

        if (v14 && ([v6 containsObject:v14] & 1) == 0)
        {
          v15 = [MEMORY[0x1E4F223B8] applicationProxyForBundleURL:v14];
          if (v15)
          {
            [v6 addObject:v14];
            v16 = [v15 bundleIdentifier];
            uint64_t v17 = *(void *)(a1 + 40);
            if (v17 > 1)
            {
              if (v17 != 2)
              {
                if (v17 != 10) {
                  goto LABEL_27;
                }
                goto LABEL_26;
              }
              if (objc_msgSend(v12, "_intents_extensionSupportsAtLeastOneSiriIntent"))
              {
                v18 = [v15 entitlementValueForKey:@"com.apple.developer.siri" ofClass:objc_opt_class()];
                char v19 = [v18 BOOLValue];

                if (v19) {
                  goto LABEL_26;
                }
              }
            }
            else
            {
              if (v17)
              {
                if (v17 != 1 || (objc_msgSend(v12, "_intents_extensionSupportsAtLeastOneSiriIntent") & 1) == 0) {
                  goto LABEL_27;
                }
LABEL_26:
                [v21 addObject:v15];
                goto LABEL_27;
              }
              if (objc_msgSend(v12, "_intents_extensionSupportsAtLeastOneSiriIntent")
                && (([*(id *)(a1 + 48) appAllowedToTalkToSiri:v16] & 1) != 0
                 || !+[_INSiriAuthorizationManager _siriAuthorizationStatusForAppID:v16]))
              {
                goto LABEL_26;
              }
            }
LABEL_27:
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__NSExtension_Intents___intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v22 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA80]);
  long long v23 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  long long v24 = objc_msgSend(v5, "initWithArray:", v6, a1);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (!v8) {
    goto LABEL_15;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v26;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v26 != v10) {
        objc_enumerationMutation(v7);
      }
      v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
      v13 = [v12 supportedIntents];
      if ([v13 count])
      {
        v14 = [v12 entitlements];
        v15 = [v14 objectForKey:@"com.apple.developer.siri" ofClass:objc_opt_class()];
        int v16 = [v15 BOOLValue];

        if (!v16) {
          continue;
        }
        v13 = [v12 compatibilityObject];
        [v24 addObject:v13];
      }
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  }
  while (v9);
LABEL_15:

  uint64_t v17 = *(void *)(v21 + 32);
  v18 = [v24 allObjects];
  if ([v24 count]) {
    id v19 = 0;
  }
  else {
    id v19 = v22;
  }
  (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v19);
}

void __71__NSExtension_Intents___intents_findAppsWithAnIntentsServiceExtension___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = objc_alloc(MEMORY[0x1E4F1CA80]);
  if (v4) {
    id v7 = v4;
  }
  else {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v8 = (void *)[v6 initWithArray:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v9 = [MEMORY[0x1E4F223C8] enumeratorWithOptions:0];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        v15 = [v14 supportedIntents];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          uint64_t v17 = [v14 compatibilityObject];
          [v8 addObject:v17];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = [v8 allObjects];
  if ([v8 count]) {
    id v20 = 0;
  }
  else {
    id v20 = v5;
  }
  (*(void (**)(uint64_t, void *, id))(v18 + 16))(v18, v19, v20);
}

void __103__NSExtension_Intents___matchExtensionsWithAttributes_extensionPointName_requireTrustCheck_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (!v6 && v7 && *(unsigned char *)(a1 + 48))
  {
    uint64_t v8 = +[INAppTrust extensionsTrustedForLaunch:v5];

    id v5 = (id)v8;
  }
  uint64_t v9 = [v5 count];
  if (!v6 && !v9)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v14[0] = @"ExtensionPointName";
    v14[1] = v12;
    v15[0] = v11;
    v15[1] = @"Unable to find an extension to run this intent. Is your intent listed in IntentsSupported in the extension Info.plist?";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    id v6 = [v10 errorWithDomain:@"INExtensionMatchingErrorDomain" code:3001 userInfo:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = [*(id *)(a1 + 32) count];
  uint64_t v9 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLaun"
          "chId:requireTrustCheck:completion:]_block_invoke";
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_18CB2F000, v9, OS_LOG_TYPE_INFO, "%s Attempting to retrieve specified extension with identifier: %@", buf, 0x16u);
  }
  uint64_t v10 = a3 + 1;
  uint64_t v26 = *MEMORY[0x1E4F28290];
  id v27 = v7;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
  id v24 = 0;
  uint64_t v12 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v11 error:&v24];
  id v13 = v24;
  v14 = [v12 firstObject];

  if (v13)
  {
    v15 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v29 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLa"
            "unchId:requireTrustCheck:completion:]_block_invoke";
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_error_impl(&dword_18CB2F000, v15, OS_LOG_TYPE_ERROR, "%s Could not retrieve specified extension: %@", buf, 0x16u);
    }
  }
  else
  {
    if (v14)
    {
      uint64_t v18 = *(void *)(a1 + 48);
      long long v25 = v14;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
      (*(void (**)(uint64_t, void *, void))(v18 + 16))(v18, v19, 0);

      *a4 = 1;
      goto LABEL_10;
    }
    id v20 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = *(void **)(a1 + 40);
      long long v22 = v20;
      long long v23 = [v21 extensionBundleId];
      *(_DWORD *)buf = 136315394;
      v29 = "+[NSExtension(Intents) _matchExtensionsForIntent:extensionPointName:shouldCheckForSiriEnabled:shouldIgnoreLa"
            "unchId:requireTrustCheck:completion:]_block_invoke";
      __int16 v30 = 2112;
      id v31 = v23;
      _os_log_error_impl(&dword_18CB2F000, v22, OS_LOG_TYPE_ERROR, "%s extensionWithIdentifier returned nil for identifier: %@", buf, 0x16u);
    }
  }
  if (v10 == v8)
  {
    uint64_t v16 = *(void *)(a1 + 48);
    uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INExtensionMatchingErrorDomain" code:3001 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
  }
LABEL_10:
}

void __145__NSExtension_Intents___matchExtensionsForIntent_extensionPointName_shouldCheckForSiriEnabled_shouldIgnoreLaunchId_requireTrustCheck_completion___block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 count] && *(unsigned char *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    id v7 = *(void **)(a1 + 32);
    id v11 = 0;
    INExtractAppInfoFromSiriLaunchId(v7, &v11, 0);
    id v8 = v11;
    if (([*(id *)(a1 + 48) appAllowedToTalkToSiri:v8] & 1) == 0)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"INExtensionMatchingErrorDomain" code:3005 userInfo:0];
      (*(void (**)(uint64_t, void, void *))(v9 + 16))(v9, 0, v10);

      goto LABEL_7;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
}

void __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E551DEF0;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __76__NSExtension_Intents___intents_matchSiriUISnippetExtensionsWithCompletion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke_2;
  block[3] = &unk_1E551DEF0;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __75__NSExtension_Intents___intents_matchSiriUIExtensionsForIntent_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

void __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke_2;
  block[3] = &unk_1E551DEF0;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v11 = v5;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __71__NSExtension_Intents___intents_matchUIExtensionsForIntent_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[6];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

@end