@interface ACHAwardPluginSystem
- (ACHAwardPluginSystem)init;
- (Class)_loadPrincipalClassConformingToProtocols:(id)a3 fromBundleAtPath:(id)a4;
- (id)_createPluginsFromClasses:(id)a3;
- (id)_loadPrincipalClassesConformingToProtocols:(id)a3 fromBundlesInDirectoryAtPath:(id)a4 error:(id *)a5;
- (id)_pluginClasses;
- (id)_pluginDirectoryPath;
- (id)_principalClassProtocols;
- (id)createProgressProviders;
- (id)createTemplateAssetSources;
- (void)_loadPlugins;
- (void)_pluginClasses;
@end

@implementation ACHAwardPluginSystem

- (ACHAwardPluginSystem)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACHAwardPluginSystem;
  v2 = [(ACHAwardPluginSystem *)&v6 init];
  v3 = v2;
  if (v2)
  {
    progressProviders = v2->_progressProviders;
    v2->_progressProviders = (NSArray *)MEMORY[0x263EFFA68];

    [(ACHAwardPluginSystem *)v3 _loadPlugins];
  }
  return v3;
}

- (id)_pluginDirectoryPath
{
  v2 = (void *)GSSystemRootDirectory();
  return (id)[v2 stringByAppendingPathComponent:@"/System/Library/Fitness/Plugins"];
}

- (id)_principalClassProtocols
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = &unk_26D133CC8;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)_pluginClasses
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(ACHAwardPluginSystem *)self _pluginDirectoryPath];
  v5 = [(ACHAwardPluginSystem *)self _principalClassProtocols];
  id v10 = 0;
  objc_super v6 = [(ACHAwardPluginSystem *)self _loadPrincipalClassesConformingToProtocols:v5 fromBundlesInDirectoryAtPath:v4 error:&v10];
  id v7 = v10;

  if (v6)
  {
    [v3 addObjectsFromArray:v6];
  }
  else if ((objc_msgSend(v7, "hk_isCocoaNoSuchFileError") & 1) == 0)
  {
    v8 = ACHLogDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ACHAwardPluginSystem _pluginClasses]();
    }
  }
  return v3;
}

- (id)_loadPrincipalClassesConformingToProtocols:(id)a3 fromBundlesInDirectoryAtPath:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v27 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F08850]);
  v9 = v7;
  id v10 = [v8 contentsOfDirectoryAtPath:v7 error:a5];
  if (v10)
  {
    id v24 = v8;
    id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = v10;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v17 = (void *)MEMORY[0x223C50570]();
          v18 = [v16 pathExtension];
          int v19 = [v18 isEqualToString:@"bundle"];

          if (v19)
          {
            v20 = [v9 stringByAppendingPathComponent:v16];
            v21 = [(ACHAwardPluginSystem *)self _loadPrincipalClassConformingToProtocols:v27 fromBundleAtPath:v20];
            if (v21) {
              [v25 addObject:v21];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    id v10 = v23;
    id v8 = v24;
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (Class)_loadPrincipalClassConformingToProtocols:(id)a3 fromBundleAtPath:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:v6];
  id v8 = v7;
  if (v7)
  {
    id v28 = 0;
    char v9 = [v7 loadAndReturnError:&v28];
    id v10 = v28;
    if (v9)
    {
      id v11 = (void *)[v8 principalClass];
      if (!v11)
      {
        uint64_t v12 = ACHLogDefault();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:]((uint64_t)v6, v12);
        }
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v13 = v5;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v35 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v25;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v25 != v16) {
              objc_enumerationMutation(v13);
            }
            if (objc_msgSend(v11, "conformsToProtocol:", *(void *)(*((void *)&v24 + 1) + 8 * i), (void)v24))
            {
              v20 = ACHLogDefault();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
                -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:]((uint64_t)v6, v20);
              }

              id v19 = v11;
              goto LABEL_26;
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v35 count:16];
          if (v15) {
            continue;
          }
          break;
        }
      }

      v18 = ACHLogDefault();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        if (v11)
        {
          NSStringFromClass((Class)v11);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = @"<>";
        }
        v23 = -[NSObject hk_map:](v13, "hk_map:", &__block_literal_global_11, (void)v24);
        *(_DWORD *)buf = 138543874;
        id v30 = v6;
        __int16 v31 = 2114;
        v32 = v22;
        __int16 v33 = 2114;
        v34 = v23;
        _os_log_error_impl(&dword_21F5DA000, v18, OS_LOG_TYPE_ERROR, "Error: failed to load bundle \"%{public}@\": principal class %{public}@ doesn't conform to any of: %{public}@", buf, 0x20u);
        if (v11) {
      }
        }
      id v19 = 0;
      uint64_t v13 = v18;
    }
    else
    {
      uint64_t v13 = ACHLogDefault();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:].cold.4();
      }
      id v19 = 0;
    }
LABEL_26:
  }
  else
  {
    id v10 = ACHLogDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ACHAwardPluginSystem _loadPrincipalClassConformingToProtocols:fromBundleAtPath:]((uint64_t)v6, v10);
    }
    id v19 = 0;
  }

  return (Class)v19;
}

NSString *__82__ACHAwardPluginSystem__loadPrincipalClassConformingToProtocols_fromBundleAtPath___block_invoke(int a1, Protocol *proto)
{
  return NSStringFromProtocol(proto);
}

- (id)_createPluginsFromClasses:(id)a3
{
  id v4 = &unk_26D133CC8;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ACHAwardPluginSystem__createPluginsFromClasses___block_invoke;
  v8[3] = &unk_264516E40;
  id v9 = v4;
  id v10 = sel_shouldLoadPlugin;
  id v5 = v4;
  id v6 = objc_msgSend(a3, "hk_map:", v8);

  return v6;
}

id __50__ACHAwardPluginSystem__createPluginsFromClasses___block_invoke(uint64_t a1, objc_class *a2)
{
  if ([(objc_class *)a2 conformsToProtocol:*(void *)(a1 + 32)]
    && ((objc_opt_respondsToSelector() & 1) == 0 || [(objc_class *)a2 shouldLoadPlugin]))
  {
    id v3 = objc_alloc_init(a2);
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

- (void)_loadPlugins
{
  id v5 = [(ACHAwardPluginSystem *)self _pluginClasses];
  id v3 = [(ACHAwardPluginSystem *)self _createPluginsFromClasses:v5];
  plugins = self->_plugins;
  self->_plugins = v3;
}

- (id)createTemplateAssetSources
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = self->_plugins;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "templateAssetSource", (void)v13);
        if (v10)
        {
          id v11 = [v9 pluginIdentifier];
          [v3 setObject:v10 forKeyedSubscript:v11];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)createProgressProviders
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_plugins;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          id v10 = objc_msgSend(v9, "progressProvider", (void)v15);
          if (v10)
          {
            id v11 = [v9 pluginIdentifier];
            [v3 setObject:v10 forKeyedSubscript:v11];

            uint64_t v12 = [(NSArray *)self->_progressProviders arrayByAddingObject:v10];
            progressProviders = self->_progressProviders;
            self->_progressProviders = v12;
          }
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressProviders, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
}

- (void)_pluginClasses
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Failed to load plugins at \"%{public}@\": %{public}@");
}

- (void)_loadPrincipalClassConformingToProtocols:(uint64_t)a1 fromBundleAtPath:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error: failed to instantiate bundle \"%{public}@\"", (uint8_t *)&v2, 0xCu);
}

- (void)_loadPrincipalClassConformingToProtocols:(uint64_t)a1 fromBundleAtPath:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_DEBUG, "Loaded bundle \"%{public}@\"", (uint8_t *)&v2, 0xCu);
}

- (void)_loadPrincipalClassConformingToProtocols:(uint64_t)a1 fromBundleAtPath:(NSObject *)a2 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21F5DA000, a2, OS_LOG_TYPE_ERROR, "Error: failed to get principal class from bundle \"%{public}@\"", (uint8_t *)&v2, 0xCu);
}

- (void)_loadPrincipalClassConformingToProtocols:fromBundleAtPath:.cold.4()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v0, v1, "Error: failed to load bundle \"%{public}@\": %{public}@");
}

@end