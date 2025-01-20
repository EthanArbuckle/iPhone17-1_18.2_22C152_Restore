@interface HKPPTPluginManager
+ (id)sharedPluginManager;
- (Class)classForTestType:(id)a3;
- (HKPPTPluginManager)init;
- (id)builtinTests;
- (void)_loadPPTBundles;
- (void)registerDriverClass:(Class)a3;
@end

@implementation HKPPTPluginManager

+ (id)sharedPluginManager
{
  if (sharedPluginManager_onceToken != -1) {
    dispatch_once(&sharedPluginManager_onceToken, &__block_literal_global_105);
  }
  v2 = (void *)sharedPluginManager_sharedManager;

  return v2;
}

uint64_t __41__HKPPTPluginManager_sharedPluginManager__block_invoke()
{
  v0 = objc_alloc_init(HKPPTPluginManager);
  uint64_t v1 = sharedPluginManager_sharedManager;
  sharedPluginManager_sharedManager = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (HKPPTPluginManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)HKPPTPluginManager;
  v2 = [(HKPPTPluginManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    testClasses = v2->_testClasses;
    v2->_testClasses = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    builtinTests = v2->_builtinTests;
    v2->_builtinTests = v5;

    [(HKPPTPluginManager *)v2 _loadPPTBundles];
  }
  return v2;
}

- (id)builtinTests
{
  v2 = (void *)[(NSMutableDictionary *)self->_builtinTests copy];

  return v2;
}

- (Class)classForTestType:(id)a3
{
  return (Class)[(NSMutableDictionary *)self->_testClasses objectForKeyedSubscript:a3];
}

- (void)registerDriverClass:(Class)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(a3);
  v5 = v4;
  if (v4)
  {
    v6 = [v4 supportedTestType];
    if (v6)
    {
      uint64_t v7 = [(NSMutableDictionary *)self->_testClasses objectForKeyedSubscript:v6];
      _HKInitializeLogging();
      objc_super v8 = HKLogTesting();
      v9 = v8;
      if (v7)
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v10 = [(NSMutableDictionary *)self->_testClasses objectForKeyedSubscript:v6];
          *(_DWORD *)buf = 138543874;
          Class v30 = a3;
          __int16 v31 = 2114;
          v32 = v6;
          __int16 v33 = 2114;
          uint64_t v34 = v10;
          _os_log_error_impl(&dword_19C023000, v9, OS_LOG_TYPE_ERROR, "Loaded PPT driver %{public}@ supports %{public}@, but we already have a driver (%{public}@) supporting that type.", buf, 0x20u);
        }
      }
      else
      {
        BOOL v11 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

        if (v11)
        {
          v12 = HKLogTesting();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            Class v30 = a3;
            __int16 v31 = 2114;
            v32 = v6;
            _os_log_impl(&dword_19C023000, v12, OS_LOG_TYPE_INFO, "Loaded PPT driver %{public}@ for %{public}@", buf, 0x16u);
          }
        }
        [(NSMutableDictionary *)self->_testClasses setObject:a3 forKeyedSubscript:v6];
        v9 = [v5 builtinTestDefinitions];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v13 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          v15 = v6;
          v22 = v5;
          uint64_t v16 = *(void *)v25;
          uint64_t v17 = MEMORY[0x1E4F1CC38];
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v9);
              }
              uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              v20 = -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v19, v22);
              v21 = (void *)[v20 mutableCopy];

              [v21 setObject:v19 forKeyedSubscript:@"testName"];
              [v21 setObject:v15 forKeyedSubscript:@"testType"];
              [v21 setObject:v17 forKeyedSubscript:@"enabled"];
              [(NSMutableDictionary *)self->_builtinTests setObject:v21 forKeyedSubscript:v19];
            }
            uint64_t v14 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v14);
          v5 = v22;
          v6 = v15;
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v9 = HKLogTesting();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[HKPPTPluginManager registerDriverClass:]((uint64_t)a3, v9);
      }
    }
  }
}

- (void)_loadPPTBundles
{
  v51[2] = *MEMORY[0x1E4F143B8];
  v51[0] = @"/AppleInternal/Library/Health/Plugins";
  v51[1] = @"/AppleInternal/Library/Health/Plugins/PPTPlugins";
  unint64_t v3 = 0x1E4F1C000uLL;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v29 = [v4 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v29)
  {
    uint64_t v5 = *(void *)v44;
    unint64_t v6 = 0x1E4F1C000uLL;
    uint64_t v7 = &off_1E58BA000;
    objc_super v8 = &selRef_criteria;
    __int16 v31 = v4;
    uint64_t v28 = *(void *)v44;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v5) {
          objc_enumerationMutation(v4);
        }
        uint64_t v30 = v9;
        uint64_t v10 = *(void **)(v6 + 2832);
        BOOL v11 = [(id)GSSystemRootDirectory() stringByAppendingPathComponent:*(void *)(*((void *)&v43 + 1) + 8 * v9)];
        uint64_t v12 = [v10 fileURLWithPath:v11];

        uint64_t v13 = v7[444];
        v49 = v8[443];
        uint64_t v14 = [*(id *)(v3 + 2424) arrayWithObjects:&v49 count:1];
        id v42 = 0;
        __int16 v33 = (void *)v12;
        v15 = [v13 loadPrincipalClassesConformingToProtocols:v14 fromBundlesInDirectoryAtURL:v12 skipLoadedBundles:0 error:&v42];
        id v32 = v42;

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v39;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = objc_alloc_init(*(Class *)(*((void *)&v38 + 1) + 8 * i));
              if (!v21)
              {

                id v4 = v31;
                goto LABEL_25;
              }
              v22 = v21;
              long long v36 = 0u;
              long long v37 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              v23 = [v21 PPTDriverClasses];
              uint64_t v24 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
              if (v24)
              {
                uint64_t v25 = v24;
                uint64_t v26 = *(void *)v35;
                do
                {
                  for (uint64_t j = 0; j != v25; ++j)
                  {
                    if (*(void *)v35 != v26) {
                      objc_enumerationMutation(v23);
                    }
                    -[HKPPTPluginManager registerDriverClass:](self, "registerDriverClass:", *(void *)(*((void *)&v34 + 1) + 8 * j), v28);
                  }
                  uint64_t v25 = [v23 countByEnumeratingWithState:&v34 objects:v47 count:16];
                }
                while (v25);
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v48 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v30 + 1;
        id v4 = v31;
        unint64_t v3 = 0x1E4F1C000;
        uint64_t v5 = v28;
        unint64_t v6 = 0x1E4F1C000;
        uint64_t v7 = &off_1E58BA000;
        objc_super v8 = &selRef_criteria;
      }
      while (v30 + 1 != v29);
      uint64_t v29 = [v31 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v29);
  }
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builtinTests, 0);

  objc_storeStrong((id *)&self->_testClasses, 0);
}

- (void)registerDriverClass:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Loaded PPT driver %{public}@ did not return a supportedTestType.", (uint8_t *)&v2, 0xCu);
}

@end