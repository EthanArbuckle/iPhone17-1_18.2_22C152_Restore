@interface ACDPluginLoader
+ (id)_buildPluginCache;
+ (id)_currentSystemVersion;
+ (id)pluginForIdentifier:(id)a3 subpath:(id)a4;
+ (void)_buildPluginCache;
@end

@implementation ACDPluginLoader

+ (id)_currentSystemVersion
{
  CFDictionaryRef v2 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    Value = (void *)CFDictionaryGetValue(v2, (const void *)*MEMORY[0x263EFFAB0]);
    v5 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v3);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_buildPluginCache
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  CFDictionaryRef v3 = objc_opt_new();
  v4 = [a1 pluginBundlesAtSubpath:@"Authentication"];
  v5 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v57 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        v12 = [v11 bundleIdentifier];

        if (v12)
        {
          v13 = [v11 bundleIdentifier];
          [v5 setObject:v11 forKeyedSubscript:v13];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v57 count:16];
    }
    while (v8);
  }

  if (_os_feature_enabled_impl())
  {
    v14 = [v5 objectForKeyedSubscript:@"com.apple.gamecenter.GameCenterAccountAuthenticationPlugin"];

    if (!v14) {
      goto LABEL_19;
    }
    v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[ACDPluginLoader _buildPluginCache]();
    }
    v16 = @"com.apple.AAGKAuthenticationPlugin";
  }
  else
  {
    v15 = _ACDLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[ACDPluginLoader _buildPluginCache]();
    }
    v16 = @"com.apple.gamecenter.GameCenterAccountAuthenticationPlugin";
  }

  [v5 setObject:0 forKeyedSubscript:v16];
LABEL_19:
  v17 = (void *)MEMORY[0x263EFFA08];
  v18 = [v5 allValues];
  v19 = [v17 setWithArray:v18];

  v20 = _ACDLogSystem();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[ACDPluginLoader _buildPluginCache]();
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  obuint64_t j = v19;
  uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v44;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        v22 = *(void **)(*((void *)&v43 + 1) + 8 * v21);
        v23 = [v22 bundlePath];
        v24 = [v23 lastPathComponent];

        v25 = [v22 objectForInfoDictionaryKey:@"ACSupportedAccountTypes"];
        v26 = v25;
        uint64_t v38 = v21;
        if (v25)
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v55 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v40;
            do
            {
              for (uint64_t j = 0; j != v28; ++j)
              {
                if (*(void *)v40 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v39 + 1) + 8 * j);
                v32 = _ACDLogSystem();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v52 = v24;
                  __int16 v53 = 2112;
                  uint64_t v54 = v31;
                  _os_log_debug_impl(&dword_2183AD000, v32, OS_LOG_TYPE_DEBUG, "\"Adding %@ to cache as supporting %@\"", buf, 0x16u);
                }

                [v3 setObject:v24 forKey:v31];
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v55 count:16];
            }
            while (v28);
          }
        }
        else
        {
          v33 = _ACDLogSystem();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v24;
            _os_log_error_impl(&dword_2183AD000, v33, OS_LOG_TYPE_ERROR, "\"Plugin %@ does not have any supported account types in its plist!\"", buf, 0xCu);
          }
        }
        uint64_t v21 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v37);
  }

  return v3;
}

+ (id)pluginForIdentifier:(id)a3 subpath:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [a1 _currentSystemVersion];
  if (v8)
  {
    uint64_t v9 = [NSString stringWithFormat:@"%@PluginCache", v7];
    v10 = (void *)CFPreferencesCopyAppValue(v9, @"com.apple.accountsd");
    CFStringRef v11 = (const __CFString *)CFPreferencesCopyAppValue(@"LastSystemVersion", @"com.apple.accountsd");
    if (v11 && [v10 count] && CFStringCompare(v8, v11, 1uLL) == kCFCompareEqualTo)
    {
      int v14 = 0;
    }
    else
    {
      v12 = _ACDLogSystem();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v33 = v11;
        __int16 v34 = 2112;
        v35 = v8;
        _os_log_impl(&dword_2183AD000, v12, OS_LOG_TYPE_DEFAULT, "\"System build version changed from %@ to %@\"", buf, 0x16u);
      }

      v13 = [a1 _buildPluginCache];

      CFPreferencesSetAppValue(v9, v13, @"com.apple.accountsd");
      CFPreferencesSetAppValue(@"LastSystemVersion", v8, @"com.apple.accountsd");
      int v14 = 1;
      v10 = (void *)v13;
    }
    v15 = [v10 objectForKey:v6];
    if (v15)
    {
      v16 = +[ACPluginLoader pluginWithName:v15 inSubpath:@"Authentication"];
      v17 = _ACDLogSystem();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
      if (v16)
      {
        if (v18) {
          +[ACDPluginLoader pluginForIdentifier:subpath:].cold.4((uint64_t)v15, v17, v19, v20, v21, v22, v23, v24);
        }
        goto LABEL_20;
      }
      if (v18) {
        +[ACDPluginLoader pluginForIdentifier:subpath:]((uint64_t)v15, v17, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      v17 = _ACDLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        +[ACDPluginLoader pluginForIdentifier:subpath:]((uint64_t)v6, v17, v25, v26, v27, v28, v29, v30);
      }
    }
    v16 = 0;
LABEL_20:

    if (v11) {
      CFRelease(v11);
    }
    if (v14) {
      CFPreferencesAppSynchronize(@"com.apple.accountsd");
    }

    goto LABEL_25;
  }
  _ACDLogSystem();
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
    +[ACDPluginLoader pluginForIdentifier:subpath:]();
  }
  v16 = 0;
LABEL_25:

  return v16;
}

+ (void)_buildPluginCache
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1(&dword_2183AD000, v0, v1, "\"Filtering out GameCenterAccountAuthenticationPlugin.\"", v2, v3, v4, v5, v6);
}

+ (void)pluginForIdentifier:subpath:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  _os_log_error_impl(&dword_2183AD000, v0, OS_LOG_TYPE_ERROR, "\"Unable to get current build version!\"", v1, 2u);
}

+ (void)pluginForIdentifier:(uint64_t)a3 subpath:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)pluginForIdentifier:(uint64_t)a3 subpath:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)pluginForIdentifier:(uint64_t)a3 subpath:(uint64_t)a4 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end