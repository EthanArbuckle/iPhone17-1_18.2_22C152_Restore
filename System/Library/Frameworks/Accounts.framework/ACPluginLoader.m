@interface ACPluginLoader
+ (id)_accountsPluginDirectoryURLs:(id)a3 inAppleInternal:(BOOL)a4;
+ (id)_pluginWithName:(id)a3 inSubpath:(id)a4 inAppleInternal:(BOOL)a5;
+ (id)_validatedBundleAtURL:(id)a3;
+ (id)pluginBundlesAtSubpath:(id)a3;
+ (id)pluginWithName:(id)a3 inSubpath:(id)a4;
+ (void)_populatePluginBundles:(id)a3 atSubpath:(id)a4 inAppleInternal:(BOOL)a5;
@end

@implementation ACPluginLoader

+ (id)pluginBundlesAtSubpath:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [a1 _populatePluginBundles:v5 atSubpath:v4 inAppleInternal:0];
  if (ACIsInternal())
  {
    v6 = _ACLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[ACPluginLoader pluginBundlesAtSubpath:](v6);
    }

    [a1 _populatePluginBundles:v5 atSubpath:v4 inAppleInternal:1];
  }
  v7 = (void *)[v5 copy];

  return v7;
}

+ (void)_populatePluginBundles:(id)a3 atSubpath:(id)a4 inAppleInternal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v28 = [MEMORY[0x1E4F28CB8] defaultManager];
  v23 = v9;
  BOOL v27 = v5;
  [a1 _accountsPluginDirectoryURLs:v9 inAppleInternal:v5];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v32;
    uint64_t v26 = *MEMORY[0x1E4F1C628];
    uint64_t v25 = *MEMORY[0x1E4F1C680];
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        if (v14)
        {
          v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v26, v25, 0);
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = __67__ACPluginLoader__populatePluginBundles_atSubpath_inAppleInternal___block_invoke;
          v29[3] = &__block_descriptor_33_e27_B24__0__NSURL_8__NSError_16l;
          BOOL v30 = v27;
          v16 = [v28 enumeratorAtURL:v14 includingPropertiesForKeys:v15 options:1 errorHandler:v29];

          uint64_t v17 = [v16 nextObject];
          if (v17)
          {
            v18 = (void *)v17;
            do
            {
              v19 = _ACLogSystem();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v18;
                _os_log_debug_impl(&dword_1A57C5000, v19, OS_LOG_TYPE_DEBUG, "\"Validating bundle at %@...\"", buf, 0xCu);
              }

              v20 = [a1 _validatedBundleAtURL:v18];
              if (v20) {
                [v8 addObject:v20];
              }
              v21 = _ACLogSystem();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v18;
                _os_log_debug_impl(&dword_1A57C5000, v21, OS_LOG_TYPE_DEBUG, "\"Validated bundle at %@\"", buf, 0xCu);
              }

              uint64_t v22 = [v16 nextObject];

              v18 = (void *)v22;
            }
            while (v22);
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v11);
  }
}

+ (id)_validatedBundleAtURL:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 lastPathComponent];
  int v5 = [v4 hasSuffix:@"bundle"];

  if (!v5)
  {
    v16 = 0;
    goto LABEL_22;
  }
  id v22 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C628];
  id v21 = 0;
  char v7 = [v3 getResourceValue:&v22 forKey:v6 error:&v21];
  id v8 = v22;
  id v9 = v21;
  if ((v7 & 1) == 0)
  {
    v15 = _ACLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ACPluginLoader _validatedBundleAtURL:]();
    }
    v16 = 0;
    goto LABEL_21;
  }
  if ([v8 BOOLValue]) {
    goto LABEL_7;
  }
  id v20 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1C680];
  id v19 = 0;
  char v11 = [v3 getResourceValue:&v20 forKey:v10 error:&v19];
  id v12 = v20;

  id v13 = v19;
  if (v11)
  {
    if ([v12 BOOLValue])
    {
      id v8 = v12;
      id v9 = v13;
LABEL_7:
      uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithURL:v3];
      v15 = v14;
      if (v14)
      {
        v15 = v14;
        v16 = v15;
      }
      else
      {
        uint64_t v17 = _ACLogSystem();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v3;
          _os_log_impl(&dword_1A57C5000, v17, OS_LOG_TYPE_DEFAULT, "\"Couldn't create plugin at %@\"", buf, 0xCu);
        }

        v16 = 0;
      }
      goto LABEL_21;
    }
    v15 = _ACLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[ACPluginLoader _validatedBundleAtURL:]((uint64_t)v3, v15);
    }
  }
  else
  {
    v15 = _ACLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      +[ACPluginLoader _validatedBundleAtURL:]();
    }
  }
  v16 = 0;
  id v9 = v13;
  id v8 = v12;
LABEL_21:

LABEL_22:

  return v16;
}

+ (id)_accountsPluginDirectoryURLs:(id)a3 inAppleInternal:(BOOL)a4
{
  BOOL v4 = a4;
  v23[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  if (v4)
  {
    char v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/AppleInternal/Library" isDirectory:1];
    v23[0] = v7;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  else
  {
    char v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [v7 URLsForDirectory:5 inDomains:8];
  }
  id v9 = (void *)v8;

  if (v9 && [v9 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "URLByAppendingPathComponent:isDirectory:", @"Accounts", 1, (void)v18);
          v16 = [v15 URLByAppendingPathComponent:v5 isDirectory:1];
          [v6 addObject:v16];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    uint64_t v10 = _ACLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ACPluginLoader _accountsPluginDirectoryURLs:inAppleInternal:](v10);
    }
  }

  return v6;
}

uint64_t __67__ACPluginLoader__populatePluginBundles_atSubpath_inAppleInternal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!*(unsigned char *)(a1 + 32))
  {
    char v7 = _ACLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = v5;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A57C5000, v7, OS_LOG_TYPE_DEFAULT, "\"Encountered an error while scanning for plugins at %@: %@\"", (uint8_t *)&v9, 0x16u);
    }
  }
  return 1;
}

+ (id)_pluginWithName:(id)a3 inSubpath:(id)a4 inAppleInternal:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [a1 _accountsPluginDirectoryURLs:a4 inAppleInternal:v5];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v19 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
      if (v14)
      {
        v15 = objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v8, 1, (void)v18);
        v16 = [a1 _validatedBundleAtURL:v15];

        if (v16) {
          break;
        }
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v16 = 0;
  }

  return v16;
}

+ (id)pluginWithName:(id)a3 inSubpath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _pluginWithName:v6 inSubpath:v7 inAppleInternal:0];
  if (!v8)
  {
    if (ACIsInternal())
    {
      id v9 = _ACLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        +[ACPluginLoader pluginWithName:inSubpath:]();
      }

      id v8 = [a1 _pluginWithName:v6 inSubpath:v7 inAppleInternal:1];
    }
    else
    {
      id v8 = 0;
    }
  }

  return v8;
}

+ (void)_accountsPluginDirectoryURLs:(os_log_t)log inAppleInternal:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A57C5000, log, OS_LOG_TYPE_ERROR, "\"Couldn't find the system library directory to search for plugins.\"", v1, 2u);
}

+ (void)_validatedBundleAtURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A57C5000, a2, OS_LOG_TYPE_DEBUG, "\"Skipping file at %@ because it isn't a directory\"", (uint8_t *)&v2, 0xCu);
}

+ (void)_validatedBundleAtURL:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1A57C5000, v0, v1, "\"Couldn't get value for the directory at %@: %@\"");
}

+ (void)pluginBundlesAtSubpath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_1A57C5000, log, OS_LOG_TYPE_DEBUG, "\"Loading AppleInternal plugins\"", v1, 2u);
}

+ (void)pluginWithName:inSubpath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1A57C5000, v0, OS_LOG_TYPE_DEBUG, "\"Looking for AppleInternal plugin '%@' at '%@'\"", v1, 0x16u);
}

@end