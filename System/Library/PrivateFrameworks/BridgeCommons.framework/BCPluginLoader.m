@interface BCPluginLoader
+ (id)_validatedBundleAtURL:(id)a3;
+ (id)loadPluginBundlesAtURL:(id)a3;
@end

@implementation BCPluginLoader

+ (id)_validatedBundleAtURL:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 lastPathComponent];
  int v5 = [v4 hasSuffix:@"bundle"];

  if (!v5)
  {
    v17 = 0;
    goto LABEL_25;
  }
  v6 = pbb_discover_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = v3;
    _os_log_impl(&dword_22CE99000, v6, OS_LOG_TYPE_DEFAULT, "Checking plugin at %{public}@", buf, 0xCu);
  }

  id v26 = 0;
  uint64_t v7 = *MEMORY[0x263EFF6A8];
  id v25 = 0;
  char v8 = [v3 getResourceValue:&v26 forKey:v7 error:&v25];
  id v9 = v26;
  id v10 = v25;
  if ((v8 & 1) == 0)
  {
    v16 = pbb_discover_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = v3;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_22CE99000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't get value for the directory at %{public}@: %@", buf, 0x16u);
    }
    v17 = 0;
    goto LABEL_24;
  }
  if ([v9 BOOLValue]) {
    goto LABEL_9;
  }
  id v24 = 0;
  uint64_t v11 = *MEMORY[0x263EFF700];
  id v23 = 0;
  char v12 = [v3 getResourceValue:&v24 forKey:v11 error:&v23];
  id v13 = v24;

  id v14 = v23;
  if (v12)
  {
    if ([v13 BOOLValue])
    {
      id v9 = v13;
      id v10 = v14;
LABEL_9:
      v15 = [MEMORY[0x263F086E0] bundleWithURL:v3];
      v16 = v15;
      if (v15)
      {
        v16 = v15;
        v17 = v16;
      }
      else
      {
        v21 = pbb_discover_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v28 = v3;
          _os_log_impl(&dword_22CE99000, v21, OS_LOG_TYPE_DEFAULT, "Couldn't create plugin at %{public}@", buf, 0xCu);
        }

        v17 = 0;
      }
      goto LABEL_24;
    }
    v16 = pbb_discover_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v28 = v3;
      v18 = "Skipping file at %{public}@ because it isn't a directory";
      v19 = v16;
      uint32_t v20 = 12;
      goto LABEL_22;
    }
  }
  else
  {
    v16 = pbb_discover_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v28 = v3;
      __int16 v29 = 2112;
      id v30 = v14;
      v18 = "Couldn't get value for the directory at %{public}@: %@";
      v19 = v16;
      uint32_t v20 = 22;
LABEL_22:
      _os_log_impl(&dword_22CE99000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  v17 = 0;
  id v10 = v14;
  id v9 = v13;
LABEL_24:

LABEL_25:
  return v17;
}

+ (id)loadPluginBundlesAtURL:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  if (v4)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF6A8], *MEMORY[0x263EFF700], 0);
    char v8 = [v6 enumeratorAtURL:v4 includingPropertiesForKeys:v7 options:1 errorHandler:&__block_literal_global];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = [a1 _validatedBundleAtURL:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v14) {
            [v5 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v11);
    }
  }
  v15 = (void *)[v5 copy];

  return v15;
}

uint64_t __41__BCPluginLoader_loadPluginBundlesAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = pbb_discover_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __41__BCPluginLoader_loadPluginBundlesAtURL___block_invoke_cold_1((uint64_t)v4, (uint64_t)v5, v6);
  }

  return 1;
}

void __41__BCPluginLoader_loadPluginBundlesAtURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_22CE99000, log, OS_LOG_TYPE_ERROR, "Error while scanning for plugins at %{public}@: %@", (uint8_t *)&v3, 0x16u);
}

@end