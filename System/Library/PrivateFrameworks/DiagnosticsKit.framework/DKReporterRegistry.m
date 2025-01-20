@interface DKReporterRegistry
- (Class)extensionClass;
- (Class)responseObjectClass;
- (DKReporterRegistry)init;
- (NSMutableDictionary)componentDedup;
- (NSMutableDictionary)generatorLookup;
- (NSSet)components;
- (NSSet)generators;
- (id)generatorForComponentIdentity:(id)a3;
- (void)addExtensionAdapter:(id)a3;
- (void)enumerateExtensionAdaptersWithBlock:(id)a3;
- (void)setComponentDedup:(id)a3;
- (void)setGeneratorLookup:(id)a3;
@end

@implementation DKReporterRegistry

- (DKReporterRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)DKReporterRegistry;
  v2 = [(DKReporterRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    generatorLookup = v2->_generatorLookup;
    v2->_generatorLookup = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    componentDedup = v2->_componentDedup;
    v2->_componentDedup = (NSMutableDictionary *)v5;
  }
  return v2;
}

- (id)generatorForComponentIdentity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DKReporterRegistry *)self generatorLookup];
  v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (NSSet)components
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(DKReporterRegistry *)self componentDedup];
  id v4 = [v3 allValues];
  uint64_t v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (NSSet)generators
{
  v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = [(DKReporterRegistry *)self generatorLookup];
  id v4 = [v3 allValues];
  uint64_t v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (void)addExtensionAdapter:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v18 = [v4 extensionAttributes];
  uint64_t v5 = self;
  objc_sync_enter(v5);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v6 = [v18 manifest];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = [(DKReporterRegistry *)v5 componentDedup];
        v12 = [v11 objectForKeyedSubscript:v10];

        if (v12)
        {
          if ([v10 isNewerThan:v12])
          {
            v13 = [(DKReporterRegistry *)v5 componentDedup];
            [v13 removeObjectForKey:v12];

            v14 = [(DKReporterRegistry *)v5 generatorLookup];
            [v14 removeObjectForKey:v12];
          }
          else
          {
            v14 = DiagnosticsKitLogHandleForCategory(1);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v24 = v12;
              __int16 v25 = 2112;
              id v26 = v10;
              __int16 v27 = 2112;
              id v28 = v4;
              _os_log_impl(&dword_23D039000, v14, OS_LOG_TYPE_DEFAULT, "Replacing component [%@] with newer [%@] from [%@]", buf, 0x20u);
            }
          }
        }
        v15 = [(DKReporterRegistry *)v5 componentDedup];
        [v15 setObject:v10 forKeyedSubscript:v10];

        v16 = [(DKReporterRegistry *)v5 generatorLookup];
        [v16 setObject:v4 forKeyedSubscript:v10];

        v17 = DiagnosticsKitLogHandleForCategory(1);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v10;
          __int16 v25 = 2112;
          id v26 = v4;
          _os_log_impl(&dword_23D039000, v17, OS_LOG_TYPE_DEFAULT, "Registered component [%@] from [%@]", buf, 0x16u);
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)enumerateExtensionAdaptersWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(DKReporterRegistry *)self generators];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (Class)extensionClass
{
  return (Class)objc_opt_class();
}

- (Class)responseObjectClass
{
  return (Class)objc_opt_class();
}

- (NSMutableDictionary)generatorLookup
{
  return self->_generatorLookup;
}

- (void)setGeneratorLookup:(id)a3
{
}

- (NSMutableDictionary)componentDedup
{
  return self->_componentDedup;
}

- (void)setComponentDedup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentDedup, 0);
  objc_storeStrong((id *)&self->_generatorLookup, 0);
}

@end