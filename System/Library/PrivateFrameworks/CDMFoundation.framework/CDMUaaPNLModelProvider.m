@interface CDMUaaPNLModelProvider
+ (id)createModelConfigurationFromURL:(id)a3 locale:(id)a4 error:(id *)a5;
+ (id)createModelConfigurationsFromURLs:(id)a3 locale:(id)a4 error:(id *)a5;
+ (id)getCoreModelConfigurationForLocale:(id)a3 bundlePath:(id)a4 error:(id *)a5;
+ (id)modelURLsForInstalledApps;
+ (id)retrieveAllAppBundleURLs;
+ (id)retrieveModelURLFromBundleURL:(id)a3;
- (CDMUaaPNLModelProvider)init;
- (id)foregroundBundeIdentifiers;
- (id)getForegroundModelConfigForLocale:(id)a3 error:(id *)a4;
- (id)getModelConfigsForLocale:(id)a3 error:(id *)a4;
- (id)getModelURLForForegroundApp;
- (id)getModelURLs:(id *)a3;
- (id)getModelURLsFromDefaults;
@end

@implementation CDMUaaPNLModelProvider

- (void).cxx_destruct
{
}

- (id)foregroundBundeIdentifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  frontboardConfig = self->_frontboardConfig;
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  v15 = __52__CDMUaaPNLModelProvider_foregroundBundeIdentifiers__block_invoke;
  v16 = &unk_2647A5620;
  id v6 = v3;
  id v17 = v6;
  v7 = v4;
  v18 = v7;
  [(FBSDisplayLayoutMonitorConfiguration *)frontboardConfig setTransitionHandler:&v13];
  v8 = objc_msgSend(MEMORY[0x263F3F728], "monitorWithConfiguration:", self->_frontboardConfig, v13, v14, v15, v16);
  dispatch_time_t v9 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v7, v9))
  {
    v10 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[CDMUaaPNLModelProvider foregroundBundeIdentifiers]";
      _os_log_error_impl(&dword_2263A0000, v10, OS_LOG_TYPE_ERROR, "%s [ERR]: Timeout while fetching foreground app bundle identifiers.", buf, 0xCu);
    }

    [v8 invalidate];
    id v11 = 0;
  }
  else
  {
    [v8 invalidate];
    id v11 = v6;
  }

  return v11;
}

void __52__CDMUaaPNLModelProvider_foregroundBundeIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (a3)
  {
    dispatch_semaphore_t v4 = [a3 elements];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          dispatch_time_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if ([v9 isUIApplicationElement])
          {
            v10 = [v9 bundleIdentifier];
            if (v10) {
              [*(id *)(a1 + 32) addObject:v10];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

- (id)getModelURLsFromDefaults
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v2 = +[CDMUserDefaultsUtils readUaaPNLAppModelPaths];
  v3 = [MEMORY[0x263EFF9C0] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      v10 = v7;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v11 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v9), (void)v14);
        uint64_t v7 = [v11 objectForKey:@"appDataPath"];

        if (v7)
        {
          long long v12 = [NSURL fileURLWithPath:v7];
          [v3 addObject:v12];
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)getModelURLForForegroundApp
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v2 = [(CDMUaaPNLModelProvider *)self foregroundBundeIdentifiers];
  v3 = v2;
  if (v2)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v21 = v3;
      uint64_t v7 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v23;
      while (2)
      {
        uint64_t v10 = 0;
        long long v11 = v7;
        do
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(v4);
          }
          uint64_t v7 = [MEMORY[0x263F01868] applicationProxyForIdentifier:*(void *)(*((void *)&v22 + 1) + 8 * v10)];

          long long v12 = [v7 bundleURL];

          if (!v12)
          {
            uint64_t v8 = 0;
            goto LABEL_19;
          }
          long long v13 = [v12 URLByAppendingPathComponent:@"uaap"];

          uint64_t v8 = [v13 URLByAppendingPathComponent:@"customLu"];

          long long v14 = [MEMORY[0x263F08850] defaultManager];
          long long v15 = [v8 path];
          int v16 = [v14 fileExistsAtPath:v15];

          if (v16)
          {
            long long v17 = CDMOSLoggerForCategory(0);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              v20 = [v7 bundleIdentifier];
              *(_DWORD *)buf = 136315394;
              v27 = "-[CDMUaaPNLModelProvider getModelURLForForegroundApp]";
              __int16 v28 = 2112;
              v29 = v20;
              _os_log_debug_impl(&dword_2263A0000, v17, OS_LOG_TYPE_DEBUG, "%s UaaP detected foreground app with model available: %@", buf, 0x16u);
            }
            v18 = v4;
            goto LABEL_18;
          }
          ++v10;
          long long v11 = v7;
        }
        while (v6 != v10);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v6) {
          continue;
        }
        break;
      }
      long long v17 = v7;
      v18 = v8;
      uint64_t v7 = v4;
      uint64_t v8 = 0;
LABEL_18:

      id v4 = v18;
LABEL_19:
      v3 = v21;

      id v4 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getModelURLs:(id *)a3
{
  v11[1] = *MEMORY[0x263EF8340];
  id v4 = [(CDMUaaPNLModelProvider *)self getModelURLsFromDefaults];
  if ([v4 count])
  {
    uint64_t v5 = v4;
LABEL_5:
    a3 = v5;
    uint64_t v6 = v5;
    goto LABEL_6;
  }
  uint64_t v6 = +[CDMUaaPNLModelProvider modelURLsForInstalledApps];

  if ([v6 count])
  {
    uint64_t v5 = v6;
    goto LABEL_5;
  }
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"No UaaP custom NLU model config found. Did you configure the model path?";
    uint64_t v9 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a3 = [v8 errorWithDomain:@"UaaPNLService" code:1 userInfo:v9];

    a3 = 0;
  }
LABEL_6:

  return a3;
}

- (id)getForegroundModelConfigForLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CDMUaaPNLModelProvider *)self getModelURLForForegroundApp];
  if (v7)
  {
    uint64_t v8 = +[CDMUaaPNLModelProvider createModelConfigurationFromURL:v7 locale:v6 error:a4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)getModelConfigsForLocale:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(CDMUaaPNLModelProvider *)self getModelURLs:a4];
  if ([v7 count])
  {
    uint64_t v8 = +[CDMUaaPNLModelProvider createModelConfigurationsFromURLs:v7 locale:v6 error:a4];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (CDMUaaPNLModelProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDMUaaPNLModelProvider;
  v2 = [(CDMUaaPNLModelProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    frontboardConfig = v2->_frontboardConfig;
    v2->_frontboardConfig = (FBSDisplayLayoutMonitorConfiguration *)v3;
  }
  return v2;
}

+ (id)getCoreModelConfigurationForLocale:(id)a3 bundlePath:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = +[CDMUserDefaultsUtils readUaaPNLCoreModelPath];
  if (!v9
    || ([NSURL fileURLWithPath:v9],
        (uint64_t v10 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    long long v11 = [NSString stringWithFormat:@"%@/%@/", v8, @"model-core"];
    uint64_t v10 = [NSURL fileURLWithPath:v11 isDirectory:1];
    long long v12 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      long long v17 = "+[CDMUaaPNLModelProvider getCoreModelConfigurationForLocale:bundlePath:error:]";
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      _os_log_debug_impl(&dword_2263A0000, v12, OS_LOG_TYPE_DEBUG, "%s UaaP Core model path not defined in user defaults, using default path: %@", buf, 0x16u);
    }
  }
  long long v13 = [v10 URLByAppendingPathComponent:v7 isDirectory:1];
  long long v14 = [MEMORY[0x263F72010] configurationFromDirectoryUrl:v13 error:a5];

  return v14;
}

+ (id)createModelConfigurationsFromURLs:(id)a3 locale:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v22;
    *(void *)&long long v12 = 136315394;
    long long v19 = v12;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v10);
        }
        int v16 = +[CDMUaaPNLModelProvider createModelConfigurationFromURL:locale:error:](CDMUaaPNLModelProvider, "createModelConfigurationFromURL:locale:error:", *(void *)(*((void *)&v21 + 1) + 8 * v15), v8, a5, v19);
        if (v16)
        {
          [v9 addObject:v16];
        }
        else
        {
          long long v17 = CDMOSLoggerForCategory(0);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            uint64_t v20 = [*a5 description];
            *(_DWORD *)buf = v19;
            v26 = "+[CDMUaaPNLModelProvider createModelConfigurationsFromURLs:locale:error:]";
            __int16 v27 = 2112;
            __int16 v28 = v20;
            _os_log_error_impl(&dword_2263A0000, v17, OS_LOG_TYPE_ERROR, "%s [ERR]: Error creating UaaP model configuration %@", buf, 0x16u);
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v13);
  }

  return v9;
}

+ (id)createModelConfigurationFromURL:(id)a3 locale:(id)a4 error:(id *)a5
{
  v11[1] = *MEMORY[0x263EF8340];
  objc_super v6 = [a3 URLByAppendingPathComponent:a4 isDirectory:1];
  if (v6)
  {
    a5 = [MEMORY[0x263F72010] configurationFromDirectoryUrl:v6 error:a5];
  }
  else if (a5)
  {
    id v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v10 = *MEMORY[0x263F08320];
    v11[0] = @"Unable to build fullModelUrl from baseURL and locale";
    id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a5 = [v7 errorWithDomain:@"UaaPNLService" code:1 userInfo:v8];

    a5 = 0;
  }

  return a5;
}

+ (id)retrieveModelURLFromBundleURL:(id)a3
{
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    id v4 = Unique;
    CFURLRef v5 = CFBundleCopyResourceURL(Unique, @"customLu", 0, @"uaap");
    CFRelease(v4);
  }
  else
  {
    CFURLRef v5 = 0;
  }
  return v5;
}

+ (id)retrieveAllAppBundleURLs
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF980] array];
  uint64_t v3 = [MEMORY[0x263F01878] enumeratorWithOptions:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) URL];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

+ (id)modelURLsForInstalledApps
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] setWithCapacity:5];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = +[CDMUaaPNLModelProvider retrieveAllAppBundleURLs];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [a1 retrieveModelURLFromBundleURL:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

@end