@interface HKPluginLoader
+ (Class)loadPrincipalClassConformingToProtocols:(id)a3 fromBundleAtURL:(id)a4 skipIfLoaded:(BOOL)a5;
+ (id)loadPrincipalClassesConformingToProtocols:(id)a3 fromBundlesInDirectoryAtURL:(id)a4 skipLoadedBundles:(BOOL)a5 error:(id *)a6;
@end

@implementation HKPluginLoader

+ (id)loadPrincipalClassesConformingToProtocols:(id)a3 fromBundlesInDirectoryAtURL:(id)a4 skipLoadedBundles:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v10 = a4;
  id v11 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v12 = [v11 contentsOfDirectoryAtURL:v10 includingPropertiesForKeys:MEMORY[0x1E4F1CBF0] options:0 error:a6];
  if (v12)
  {
    id v24 = v11;
    id v25 = v10;
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = v12;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v19 = [v18 pathExtension];
          int v20 = [v19 isEqualToString:@"bundle"];

          if (v20)
          {
            uint64_t v21 = [a1 loadPrincipalClassConformingToProtocols:v27 fromBundleAtURL:v18 skipIfLoaded:v7];
            if (v21) {
              [v26 addObject:v21];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    id v11 = v24;
    id v10 = v25;
    v12 = v23;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

+ (Class)loadPrincipalClassConformingToProtocols:(id)a3 fromBundleAtURL:(id)a4 skipIfLoaded:(BOOL)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithURL:v8];
  id v10 = v9;
  if (!v9)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:]();
    }
    goto LABEL_20;
  }
  if ([v9 isLoaded] && a5)
  {
LABEL_20:
    id v20 = 0;
    goto LABEL_28;
  }
  id v29 = 0;
  char v11 = [v10 loadAndReturnError:&v29];
  id v12 = v29;
  if (v11)
  {
    id v13 = (void *)[v10 principalClass];
    if (!v13)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
        +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:]();
      }
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v36 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          if (objc_msgSend(v13, "conformsToProtocol:", *(void *)(*((void *)&v25 + 1) + 8 * i), (void)v25))
          {
            _HKInitializeLogging();
            if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_DEBUG)) {
              +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:]();
            }
            id v20 = v13;

            goto LABEL_27;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v36 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    _HKInitializeLogging();
    v19 = (id)HKLogDefault;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      if (v13)
      {
        NSStringFromClass((Class)v13);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = @"<>";
      }
      v23 = objc_msgSend(v14, "hk_map:", &__block_literal_global_2, (void)v25);
      id v24 = [v23 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138543874;
      id v31 = v8;
      __int16 v32 = 2114;
      uint64_t v33 = v22;
      __int16 v34 = 2114;
      v35 = v24;
      _os_log_error_impl(&dword_19C023000, v19, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": principal class %{public}@ doesn't conform to any of: %{public}@", buf, 0x20u);

      if (v13) {
    }
      }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogDefault, OS_LOG_TYPE_ERROR)) {
      +[HKPluginLoader loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:].cold.4();
    }
  }
  id v20 = 0;
LABEL_27:

LABEL_28:

  return (Class)v20;
}

NSString *__87__HKPluginLoader_loadPrincipalClassConformingToProtocols_fromBundleAtURL_skipIfLoaded___block_invoke(int a1, Protocol *proto)
{
  return NSStringFromProtocol(proto);
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_19C023000, v0, OS_LOG_TYPE_ERROR, "Error: failed to instantiate bundle \"%{public}@\"", v1, 0xCu);
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19C023000, v0, OS_LOG_TYPE_DEBUG, "Loaded bundle \"%{public}@\"", v1, 0xCu);
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_19C023000, v0, OS_LOG_TYPE_ERROR, "Error: failed to get principal class from bundle \"%{public}@\"", v1, 0xCu);
}

+ (void)loadPrincipalClassConformingToProtocols:fromBundleAtURL:skipIfLoaded:.cold.4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_19C023000, v1, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": %{public}@", v2, 0x16u);
}

@end