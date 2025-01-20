@interface EXEnumerator
+ (id)_extensionLiveEnumerator;
+ (id)_extensionPointLiveEnumerator;
+ (id)config;
+ (id)extensionCacheFileURLs;
+ (id)extensionInstallDirectoryURLs;
+ (id)extensionPointCacheFileURLs;
+ (id)extensionPointDefinitionDirectoryURLs;
+ (id)extensionPointDefinitionEnumerator;
+ (id)extensionPointDefinitionEnumeratorWithSDKDictionary:(id)a3;
+ (id)extensionURLEnumerator;
@end

@implementation EXEnumerator

+ (id)config
{
  if (config_onceToken[0] != -1) {
    dispatch_once(config_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)config_config;

  return v2;
}

uint64_t __22__EXEnumerator_config__block_invoke()
{
  config_config = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (id)extensionCacheFileURLs
{
  v2 = objc_opt_new();
  v3 = (void *)MEMORY[0x192FEB110]();
  v4 = [(id)objc_opt_class() config];
  v5 = [v4 xpcExtensionsCache];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8) {
    [v2 addObject:v5];
  }

  v9 = (void *)[v2 copy];

  return v9;
}

+ (id)extensionPointCacheFileURLs
{
  v2 = objc_opt_new();
  v3 = (void *)MEMORY[0x192FEB110]();
  v4 = [(id)objc_opt_class() config];
  v5 = [v4 xpcExtensionPointsCache];

  v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  v7 = [v5 path];
  int v8 = [v6 fileExistsAtPath:v7];

  if (v8) {
    [v2 addObject:v5];
  }

  v9 = (void *)[v2 copy];

  return v9;
}

+ (id)extensionPointDefinitionDirectoryURLs
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = +[_EXDefaults sharedInstance];
  int v5 = [v4 supportExtensionKitConfigPath];

  if (v5)
  {
    v6 = [a1 config];
    v7 = [v6 rootURL];
    int v8 = [v7 URLByAppendingPathComponent:@"System/Library/ExtensionKit" isDirectory:1];
    v9 = [v8 URLByAppendingPathComponent:@"ExtensionPoints" isDirectory:1];
    v22[0] = v9;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
    [v3 addObjectsFromArray:v10];

    v11 = +[_EXDefaults sharedInstance];
    LODWORD(v7) = [v11 allowsAppleInternalComponents];

    if (v7)
    {
      v12 = [a1 config];
      v13 = [v12 rootURL];
      v14 = [v13 URLByAppendingPathComponent:@"AppleInternal/System/Library/ExtensionKit" isDirectory:1];
      v15 = [v14 URLByAppendingPathComponent:@"ExtensionPoints" isDirectory:1];
      [v3 addObject:v15];

      v16 = [a1 config];
      v17 = [v16 rootURL];
      v18 = [v17 URLByAppendingPathComponent:@"AppleInternal/Library/ExtensionKit" isDirectory:1];
      v19 = [v18 URLByAppendingPathComponent:@"ExtensionPoints" isDirectory:1];
      [v3 addObject:v19];
    }
  }
  v20 = (void *)[v3 copy];

  return v20;
}

+ (id)extensionInstallDirectoryURLs
{
  v28[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  v4 = +[_EXDefaults sharedInstance];
  int v5 = [v4 supportExtensionKitConfigPath];

  if (v5)
  {
    v27 = [a1 config];
    v6 = [v27 rootURL];
    v7 = [v6 URLByAppendingPathComponent:@"System/Library/ExtensionKit" isDirectory:1];
    int v8 = [v7 URLByAppendingPathComponent:@"Extensions"];
    v28[0] = v8;
    [a1 config];
    v10 = id v9 = a1;
    v11 = [v10 rootURL];
    v12 = [v11 URLByAppendingPathComponent:@"/System/Cryptexes/OS/System/Library/ExtensionKit" isDirectory:1];
    v13 = [v12 URLByAppendingPathComponent:@"Extensions"];
    v28[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
    [v3 addObjectsFromArray:v14];

    v15 = v9;
    v16 = +[_EXDefaults sharedInstance];
    LODWORD(v9) = [v16 allowsAppleInternalComponents];

    if (v9)
    {
      v17 = [v15 config];
      v18 = [v17 rootURL];
      v19 = [v18 URLByAppendingPathComponent:@"AppleInternal/System/Library/ExtensionKit" isDirectory:1];
      v20 = [v19 URLByAppendingPathComponent:@"Extensions"];
      [v3 addObject:v20];

      v21 = [v15 config];
      v22 = [v21 rootURL];
      v23 = [v22 URLByAppendingPathComponent:@"AppleInternal/Library/ExtensionKit" isDirectory:1];
      v24 = [v23 URLByAppendingPathComponent:@"Extensions"];
      [v3 addObject:v24];
    }
  }
  v25 = (void *)[v3 copy];

  return v25;
}

+ (id)extensionURLEnumerator
{
  v2 = _EXRegistrationLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = _EXRegistrationLog();
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "extensionURLEnumerator", "", buf, 2u);
  }

  v6 = [(id)objc_opt_class() extensionCacheFileURLs];
  if ([v6 count])
  {
    v7 = [(id)objc_opt_class() extensionInstallDirectoryURLs];
    uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

    id v9 = [[EXOSExtensionEnumerator alloc] initWithCacheURLs:v8];
    v6 = (void *)v8;
  }
  else
  {
    v10 = _EXRegistrationLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_191F29000, v10, OS_LOG_TYPE_DEFAULT, "Failed to load or create cache extension/extension point info.", v15, 2u);
    }

    id v9 = [(id)objc_opt_class() _extensionLiveEnumerator];
  }
  v11 = _EXRegistrationLog();
  v12 = v11;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v12, OS_SIGNPOST_INTERVAL_END, v3, "extensionURLEnumerator", "", v14, 2u);
  }

  return v9;
}

+ (id)_extensionLiveEnumerator
{
  v2 = _EXRegistrationLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = _EXRegistrationLog();
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "_extensionLiveEnumerator", "", buf, 2u);
  }

  v6 = [(id)objc_opt_class() config];
  v7 = [v6 rootURL];

  uint64_t v8 = [[EXFrameworkScanner alloc] initWithSourceURL:v7];
  [(EXFrameworkScanner *)v8 start];
  id v9 = [(EXFrameworkScanner *)v8 extensionPaths];
  v10 = +[_EXDefaults sharedInstance];
  int v11 = [v10 appleInternal];

  if (v11)
  {
    v12 = [(EXFrameworkScanner *)v8 appleInternalExtensionPaths];
    uint64_t v13 = [v9 arrayByAddingObjectsFromArray:v12];

    id v9 = (void *)v13;
  }
  v14 = [EXOSExtensionEnumerator alloc];
  v15 = [(id)objc_opt_class() extensionInstallDirectoryURLs];
  v16 = [(EXOSExtensionEnumerator *)v14 initWithCacheURLs:v15 paths:v9];

  v17 = _EXRegistrationLog();
  v18 = v17;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v20 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v18, OS_SIGNPOST_INTERVAL_END, v3, "_extensionLiveEnumerator", "", v20, 2u);
  }

  return v16;
}

+ (id)extensionPointDefinitionEnumerator
{
  v2 = _EXRegistrationLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = _EXRegistrationLog();
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "extensionPointDefinitionEnumerator", "", buf, 2u);
  }

  v6 = [(id)objc_opt_class() extensionPointCacheFileURLs];
  if ([v6 count])
  {
    v7 = [(id)objc_opt_class() extensionPointDefinitionDirectoryURLs];
    uint64_t v8 = [v6 arrayByAddingObjectsFromArray:v7];

    id v9 = [EXExtensionPointEnumerator alloc];
    v10 = [(id)objc_opt_class() config];
    int v11 = [(EXExtensionPointEnumerator *)v9 initWithCacheURLs:v8 config:v10];

    v6 = (void *)v8;
  }
  else
  {
    v12 = _EXRegistrationLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_191F29000, v12, OS_LOG_TYPE_DEFAULT, "Failed to load or create cache extension/extension point info.", v17, 2u);
    }

    int v11 = [(id)objc_opt_class() _extensionPointLiveEnumerator];
  }
  uint64_t v13 = _EXRegistrationLog();
  v14 = v13;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v16 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v14, OS_SIGNPOST_INTERVAL_END, v3, "extensionPointDefinitionEnumerator", "", v16, 2u);
  }

  return v11;
}

+ (id)_extensionPointLiveEnumerator
{
  v2 = _EXRegistrationLog();
  os_signpost_id_t v3 = os_signpost_id_generate(v2);

  v4 = _EXRegistrationLog();
  int v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "_extensionPointLiveEnumerator", "", buf, 2u);
  }

  v6 = [(id)objc_opt_class() config];
  v7 = [v6 rootURL];

  uint64_t v8 = [[EXFrameworkScanner alloc] initWithSourceURL:v7];
  [(EXFrameworkScanner *)v8 start];
  id v9 = [(EXFrameworkScanner *)v8 combinedExtensionSDK];
  v10 = +[_EXDefaults sharedInstance];
  int v11 = [v10 allowsAppleInternalComponents];

  if (v11)
  {
    v12 = [(EXFrameworkScanner *)v8 combinedAppleInternalExtensionSDK];
    uint64_t v13 = objc_msgSend(v9, "_EX_dictionaryBySettingValuesForKeysWithDictionary:", v12);

    id v9 = (void *)v13;
  }
  v14 = [(id)objc_opt_class() extensionPointDefinitionDirectoryURLs];
  v15 = [EXExtensionPointEnumerator alloc];
  v16 = [(id)objc_opt_class() config];
  v17 = [(EXExtensionPointEnumerator *)v15 initWithSDKDictionary:v9 urls:v14 config:v16];

  v18 = _EXRegistrationLog();
  v19 = v18;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v21 = 0;
    _os_signpost_emit_with_name_impl(&dword_191F29000, v19, OS_SIGNPOST_INTERVAL_END, v3, "_extensionPointLiveEnumerator", "", v21, 2u);
  }

  return v17;
}

+ (id)extensionPointDefinitionEnumeratorWithSDKDictionary:(id)a3
{
  id v3 = a3;
  v4 = [EXExtensionPointEnumerator alloc];
  int v5 = [(id)objc_opt_class() config];
  v6 = [(EXExtensionPointEnumerator *)v4 initWithSDKDictionary:v3 config:v5];

  return v6;
}

@end