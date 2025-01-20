@interface AFPluginManager
+ (id)pluginManagerForPath:(id)a3 domainKeys:(id)a4 factoryInitializationBlock:(id)a5;
- (AFPluginManager)initWithPath:(id)a3 domainKeys:(id)a4 factoryInitializationBlock:(id)a5;
- (id)description;
- (void)_loadBundlesIfNeeded;
- (void)_registerBundle:(id)a3;
- (void)enumerateFactoryInstancesForDomainKey:(id)a3 groupIdentifier:(id)a4 classIdentifier:(id)a5 usingBlock:(id)a6;
- (void)preloadBundles;
@end

@implementation AFPluginManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainKeyDictionary, 0);
  objc_storeStrong(&self->_factoryInitializationBlock, 0);
  objc_storeStrong((id *)&self->_domainKeys, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)AFPluginManager;
  v3 = [(AFPluginManager *)&v6 description];
  v4 = [v3 stringByAppendingFormat:@" Bundle Path: %@, Bundles: %@", self->_path, self->_domainKeys];

  return v4;
}

- (void)_registerBundle:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 principalClass];
    if (v6)
    {
      uint64_t v7 = v6;
      v8 = objc_alloc_init(AFPluginBundle);
      [(AFPluginBundle *)v8 setFactoryClass:v7];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      obj = self->_domainKeys;
      uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v28)
      {
        uint64_t v26 = *(void *)v36;
        v27 = v5;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v36 != v26) {
              objc_enumerationMutation(obj);
            }
            uint64_t v29 = v9;
            uint64_t v10 = *(void *)(*((void *)&v35 + 1) + 8 * v9);
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            v11 = [v5 infoDictionary];
            v12 = [v11 objectForKey:v10];

            id v30 = v12;
            uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v13)
            {
              uint64_t v14 = v13;
              uint64_t v15 = *(void *)v32;
              do
              {
                uint64_t v16 = 0;
                do
                {
                  if (*(void *)v32 != v15) {
                    objc_enumerationMutation(v30);
                  }
                  v17 = [*(id *)(*((void *)&v31 + 1) + 8 * v16) componentsSeparatedByString:@"#"];
                  v18 = [v17 firstObject];
                  if ((unint64_t)[v17 count] >= 2)
                  {
                    uint64_t v19 = [v17 objectAtIndex:1];
                    if (v19)
                    {
                      v20 = (void *)v19;
                      [(AFPluginBundle *)v8 registerClassIdentifier:v19 forDomain:v10 inGroup:v18];
                    }
                  }
                  v21 = [(NSMutableDictionary *)self->_domainKeyDictionary objectForKeyedSubscript:v10];
                  v22 = [v21 objectForKeyedSubscript:v18];

                  if (!v22)
                  {
                    v22 = [MEMORY[0x1E4F1CA48] array];
                    v23 = [(NSMutableDictionary *)self->_domainKeyDictionary objectForKeyedSubscript:v10];
                    [v23 setObject:v22 forKeyedSubscript:v18];
                  }
                  [v22 addObject:v8];

                  ++v16;
                }
                while (v14 != v16);
                uint64_t v14 = [v30 countByEnumeratingWithState:&v31 objects:v39 count:16];
              }
              while (v14);
            }

            uint64_t v9 = v29 + 1;
            v5 = v27;
          }
          while (v29 + 1 != v28);
          uint64_t v28 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v28);
      }
    }
    else
    {
      v24 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "-[AFPluginManager _registerBundle:]";
        __int16 v43 = 2112;
        v44 = v5;
        _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s Siri plugin does not specify an NSPrincipalClass, unable to load: %@", buf, 0x16u);
      }
    }
  }
}

- (void)_loadBundlesIfNeeded
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_hasLoadedBundles)
  {
    self->_hasLoadedBundles = 1;
    v3 = [MEMORY[0x1E4F28CB8] defaultManager];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    path = self->_path;
    id v16 = 0;
    uint64_t v15 = v3;
    v5 = [v3 contentsOfDirectoryAtPath:path error:&v16];
    id v6 = v16;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = [(NSString *)self->_path stringByAppendingPathComponent:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B50]) initWithPath:v11];
          if (v12) {
            BOOL v13 = v6 == 0;
          }
          else {
            BOOL v13 = 0;
          }
          if (v13)
          {
            [(AFPluginManager *)self _registerBundle:v12];
          }
          else
          {
            uint64_t v14 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v22 = "-[AFPluginManager _loadBundlesIfNeeded]";
              __int16 v23 = 2112;
              v24 = v11;
              __int16 v25 = 2112;
              id v26 = v6;
              _os_log_error_impl(&dword_19CF1D000, v14, OS_LOG_TYPE_ERROR, "%s Error loading bundle at path \"%@\":%@", buf, 0x20u);
            }
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
      }
      while (v8);
    }
  }
}

- (void)preloadBundles
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[AFPluginManager preloadBundles]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(AFPluginManager *)self _loadBundlesIfNeeded];
}

- (void)enumerateFactoryInstancesForDomainKey:(id)a3 groupIdentifier:(id)a4 classIdentifier:(id)a5 usingBlock:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = (void (**)(void, void, void))v12;
  if (v10 && v9 && v12)
  {
    [(AFPluginManager *)self _loadBundlesIfNeeded];
    uint64_t v14 = [MEMORY[0x1E4F1CA70] orderedSet];
    uint64_t v15 = [(NSMutableDictionary *)self->_domainKeyDictionary objectForKeyedSubscript:v9];
    id v16 = [v15 objectForKeyedSubscript:v10];

    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v22 supportsClassIdentifier:v11 forDomainKey:v9 groupIdentifier:v10]) {
            [v14 addObject:v22];
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v19);
    }

    [v14 addObjectsFromArray:v17];
    char v42 = 0;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v14;
    uint64_t v23 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v39;
      *(void *)&long long v24 = 136315394;
      long long v35 = v24;
      do
      {
        uint64_t v27 = 0;
        do
        {
          if (*(void *)v39 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v28 = *(void **)(*((void *)&v38 + 1) + 8 * v27);
          uint64_t v29 = objc_msgSend(v28, "factoryInstance", v35);
          if (v29
            || ((*((void (**)(id, uint64_t))self->_factoryInitializationBlock + 2))(self->_factoryInitializationBlock, [v28 factoryClass]), uint64_t v29 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v28, "setFactoryInstance:", v29), v29))
          {
            ((void (**)(void, void *, char *))v13)[2](v13, v29, &v42);
            if (v42)
            {

              goto LABEL_29;
            }
          }
          else
          {
            id v30 = (void *)AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
            {
              long long v31 = v30;
              long long v32 = (void *)[v28 factoryClass];
              *(_DWORD *)buf = v35;
              v48 = "-[AFPluginManager enumerateFactoryInstancesForDomainKey:groupIdentifier:classIdentifier:usingBlock:]";
              __int16 v49 = 2114;
              v50 = v32;
              id v33 = v32;
              _os_log_error_impl(&dword_19CF1D000, v31, OS_LOG_TYPE_ERROR, "%s Unable to create an instance of plugin NSPrincipalClass %{public}@", buf, 0x16u);
            }
            uint64_t v29 = 0;
          }

          ++v27;
        }
        while (v25 != v27);
        uint64_t v34 = [obj countByEnumeratingWithState:&v38 objects:v51 count:16];
        uint64_t v25 = v34;
      }
      while (v34);
    }
LABEL_29:
  }
}

- (AFPluginManager)initWithPath:(id)a3 domainKeys:(id)a4 factoryInitializationBlock:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v33.receiver = self;
  v33.super_class = (Class)AFPluginManager;
  id v11 = [(AFPluginManager *)&v33 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    path = v11->_path;
    v11->_path = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    domainKeys = v11->_domainKeys;
    v11->_domainKeys = (NSArray *)v14;

    id v28 = v8;
    if (v10)
    {
      uint64_t v16 = MEMORY[0x19F3A50D0](v10);
      id factoryInitializationBlock = v11->_factoryInitializationBlock;
      v11->_id factoryInitializationBlock = (id)v16;
    }
    else
    {
      id factoryInitializationBlock = v11->_factoryInitializationBlock;
      v11->_id factoryInitializationBlock = &__block_literal_global_26417;
    }

    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    domainKeyDictionary = v11->_domainKeyDictionary;
    v11->_domainKeyDictionary = (NSMutableDictionary *)v18;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v20 = v11->_domainKeys;
    uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v30;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = *(void *)(*((void *)&v29 + 1) + 8 * v24);
          uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
          [(NSMutableDictionary *)v11->_domainKeyDictionary setObject:v26 forKeyedSubscript:v25];

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v22);
    }

    id v8 = v28;
  }

  return v11;
}

id __70__AFPluginManager_initWithPath_domainKeys_factoryInitializationBlock___block_invoke(uint64_t a1, objc_class *a2)
{
  id v2 = objc_alloc_init(a2);
  return v2;
}

+ (id)pluginManagerForPath:(id)a3 domainKeys:(id)a4 factoryInitializationBlock:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = (void *)[objc_alloc((Class)a1) initWithPath:v10 domainKeys:v9 factoryInitializationBlock:v8];

  return v11;
}

@end