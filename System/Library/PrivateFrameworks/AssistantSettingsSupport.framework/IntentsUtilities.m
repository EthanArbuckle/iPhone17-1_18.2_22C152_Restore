@interface IntentsUtilities
+ (BOOL)isIntentsEnabledForAppId:(id)a3;
+ (id)_displayNameForApp:(id)a3;
+ (id)fetchEnabledAppIds;
+ (void)intentsAppsWithCompletion:(id)a3;
+ (void)setAccess:(BOOL)a3 appID:(id)a4;
@end

@implementation IntentsUtilities

+ (void)intentsAppsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = (void *)MEMORY[0x263F08800];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__IntentsUtilities_intentsAppsWithCompletion___block_invoke;
  v9[3] = &unk_26457D8F8;
  id v10 = v5;
  id v11 = v4;
  id v12 = a1;
  id v7 = v5;
  id v8 = v4;
  objc_msgSend(v6, "_intents_findSiriEntitledAppsContainingAnIntentsExtensionWithCompletion:", v9);
}

void __46__IntentsUtilities_intentsAppsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (a3)
  {
    v6 = [a3 localizedDescription];
    NSLog(&cfstr_ErrorLoadingIn.isa, v6);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v7 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_7];
    id v8 = [v5 filteredArrayUsingPredicate:v7];

    if ([v8 count])
    {
      id v22 = v5;
      v9 = [*(id *)(a1 + 48) fetchEnabledAppIds];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v24 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            v16 = [v15 applicationIdentifier];
            v17 = [IntentsApp alloc];
            v18 = [*(id *)(a1 + 48) _displayNameForApp:v15];
            v19 = -[IntentsApp initWithAppId:displayName:accessGranted:](v17, "initWithAppId:displayName:accessGranted:", v16, v18, [v9 containsObject:v16]);

            [*(id *)(a1 + 32) addObject:v19];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v12);
      }

      uint64_t v20 = *(void *)(a1 + 40);
      if (v20)
      {
        v21 = [*(id *)(a1 + 32) sortedArrayUsingSelector:sel_compareWithIntentsApp_];
        (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
      }
      id v5 = v22;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

uint64_t __46__IntentsUtilities_intentsAppsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 applicationType];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F01838]] ^ 1;

  return v3;
}

+ (id)fetchEnabledAppIds
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "+[IntentsUtilities fetchEnabledAppIds]";
    _os_log_impl(&dword_220C23000, v2, OS_LOG_TYPE_DEFAULT, "%s Fetching enabled app TCC ids", buf, 0xCu);
  }
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (id)TCCAccessCopyInformation();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    id v8 = (void *)MEMORY[0x263F7C4C8];
    v9 = (void *)MEMORY[0x263F7C4D8];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v12 = (__CFBundle *)objc_msgSend(v11, "objectForKey:", *v8, (void)v16);
        uint64_t v13 = [v11 objectForKey:*v9];
        if ([v13 BOOLValue])
        {
          v14 = CFBundleGetIdentifier(v12);
          [v3 addObject:v14];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v3;
}

+ (BOOL)isIntentsEnabledForAppId:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"com.apple.Home", @"com.apple.MobileSMS", 0);
  uint64_t v5 = +[IntentsUtilities fetchEnabledAppIds];
  uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    int v9 = [v6 containsObject:v3];
    id v10 = @"disabled";
    v14 = "+[IntentsUtilities isIntentsEnabledForAppId:]";
    *(_DWORD *)buf = 136315650;
    __int16 v15 = 2112;
    if (v9) {
      id v10 = @"enabled";
    }
    long long v16 = v10;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_impl(&dword_220C23000, v8, OS_LOG_TYPE_DEFAULT, "%s Intent is %@ for app id: %@", buf, 0x20u);
  }
  char v11 = [v6 containsObject:v3];

  return v11;
}

+ (void)setAccess:(BOOL)a3 appID:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a4;
  uint64_t v5 = [MEMORY[0x263F01888] bundleProxyForIdentifier:v4];
  CFBundleRef v6 = CFBundleCreate(0, (CFURLRef)[v5 bundleURL]);
  if (v6)
  {
    CFBundleRef v7 = v6;
    if (TCCAccessSetForBundle())
    {
      notify_post("com.apple.assistant.siri_settings_did_change");
      id v8 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v10 = "+[IntentsUtilities setAccess:appID:]";
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_220C23000, v8, OS_LOG_TYPE_DEFAULT, "%s Successfully set TCC access for app %@", buf, 0x16u);
      }
    }
    else
    {
      NSLog(&cfstr_FailedToSetTcc.isa, v4);
    }
    CFRelease(v7);
  }
}

+ (id)_displayNameForApp:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localizedNameForContext:0];
  CFStringRef v5 = (const __CFString *)[v3 bundleIdentifier];

  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(v5);
  if (![v4 length])
  {
    CFBundleRef v7 = CFBundleGetInfoDictionary(BundleWithIdentifier);
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFFA90]];

    if (![v8 length])
    {
      int v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263EFFB68]];

      if ([v9 length])
      {
        id v8 = v9;
      }
      else
      {
        CFURLRef v10 = CFBundleCopyBundleURL(BundleWithIdentifier);
        __int16 v11 = [(__CFURL *)v10 lastPathComponent];
        id v8 = [v11 stringByDeletingPathExtension];
      }
    }

    id v4 = v8;
  }

  return v4;
}

@end