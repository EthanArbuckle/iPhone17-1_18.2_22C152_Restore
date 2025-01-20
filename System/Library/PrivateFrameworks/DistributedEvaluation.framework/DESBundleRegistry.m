@interface DESBundleRegistry
+ (id)_extensionsWithEndpointName:(id)a3;
+ (id)sharedInstance;
+ (void)initialize;
- (BOOL)containsBundleId:(id)a3;
- (DESBundleRegistry)init;
- (id)_init;
- (id)allBundleIds;
- (id)allFedStatsUnrestrictedBundleIds;
- (id)allNonFedStatsUnrestrictedBundleIds;
- (id)allPossibleUnrestrictedFedStatsIds;
- (id)allUnrestrictedBundleIds;
- (id)allUnrestrictedExtensionIds;
- (int64_t)pluginTypeForBundleId:(id)a3;
@end

@implementation DESBundleRegistry

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    sSharedInstance = [[DESBundleRegistry alloc] _init];
    MEMORY[0x1F41817F8]();
  }
}

+ (id)sharedInstance
{
  return (id)sSharedInstance;
}

- (DESBundleRegistry)init
{
  v3 = (DESBundleRegistry *)(id)sSharedInstance;

  return v3;
}

+ (id)_extensionsWithEndpointName:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F282B0];
  v16[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  id v12 = 0;
  v5 = [MEMORY[0x1E4F28C70] extensionsWithMatchingAttributes:v4 error:&v12];
  id v6 = v12;
  v7 = +[DESLogging coreChannel];
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1BECCB000, v8, OS_LOG_TYPE_INFO, "Found extensions=%@", buf, 0xCu);
    }

    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = [v5 valueForKeyPath:@"@unionOfObjects.identifier"];
    v10 = [v9 setWithArray:v8];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[DESBundleRegistry _extensionsWithEndpointName:v8];
    }
    v10 = 0;
  }

  return v10;
}

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)DESBundleRegistry;
  v2 = [(DESBundleRegistry *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[DESBundleRegistry _extensionsWithEndpointName:@"com.apple.mlruntime.extension-point-low"];
    lowMemoryExtensions = v2->_lowMemoryExtensions;
    v2->_lowMemoryExtensions = (NSSet *)v3;

    uint64_t v5 = +[DESBundleRegistry _extensionsWithEndpointName:@"com.apple.mlruntime.extension-point-high"];
    highMemoryExtensions = v2->_highMemoryExtensions;
    v2->_highMemoryExtensions = (NSSet *)v5;

    uint64_t v7 = +[DESBundleRegistry _extensionsWithEndpointName:@"com.apple.mlruntime.extension-point-restricted"];
    restrictedExtensions = v2->_restrictedExtensions;
    v2->_restrictedExtensions = (NSSet *)v7;
  }
  return v2;
}

- (id)allBundleIds
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(DESBundleRegistry *)self allUnrestrictedBundleIds];
  uint64_t v5 = [v3 arrayWithArray:v4];

  id v6 = [(NSSet *)self->_restrictedExtensions allObjects];
  [v5 addObjectsFromArray:v6];

  return v5;
}

- (id)allUnrestrictedExtensionIds
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(NSSet *)self->_lowMemoryExtensions allObjects];
  uint64_t v5 = [v3 arrayWithArray:v4];

  id v6 = [(NSSet *)self->_highMemoryExtensions allObjects];
  [v5 addObjectsFromArray:v6];

  return v5;
}

- (id)allUnrestrictedBundleIds
{
  uint64_t v3 = objc_opt_new();
  v4 = [(DESBundleRegistry *)self allUnrestrictedExtensionIds];
  [v3 addObjectsFromArray:v4];

  return v3;
}

- (id)allPossibleUnrestrictedFedStatsIds
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.dp.PrivateFederatedLearning.DPMLRuntimePluginNonDnU";
  v4[1] = @"com.apple.dp.PrivateFederatedLearning.DPMLRuntimePlugin";
  v4[2] = @"com.apple.aiml.mlpt.PriML.FedStats.Plugin";
  v4[3] = @"com.apple.aiml.mlpt.PriML.FedStats.PluginNonDnU";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];

  return v2;
}

- (id)allFedStatsUnrestrictedBundleIds
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(DESBundleRegistry *)self allUnrestrictedBundleIds];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = [(DESBundleRegistry *)self allPossibleUnrestrictedFedStatsIds];
  id v6 = [v4 setWithArray:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v6, "containsObject:", v13, (void)v15)) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)allNonFedStatsUnrestrictedBundleIds
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(DESBundleRegistry *)self allUnrestrictedBundleIds];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = [(DESBundleRegistry *)self allPossibleUnrestrictedFedStatsIds];
  id v6 = [v4 setWithArray:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v13, (void)v15) & 1) == 0) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (BOOL)containsBundleId:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSSet *)self->_lowMemoryExtensions containsObject:v4]
    || [(NSSet *)self->_highMemoryExtensions containsObject:v4]
    || [(NSSet *)self->_restrictedExtensions containsObject:v4];

  return v5;
}

- (int64_t)pluginTypeForBundleId:(id)a3
{
  id v4 = a3;
  if ([(NSSet *)self->_lowMemoryExtensions containsObject:v4])
  {
    int64_t v5 = 2;
  }
  else if ([(NSSet *)self->_highMemoryExtensions containsObject:v4])
  {
    int64_t v5 = 3;
  }
  else if ([(NSSet *)self->_restrictedExtensions containsObject:v4])
  {
    int64_t v5 = 4;
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedExtensions, 0);
  objc_storeStrong((id *)&self->_highMemoryExtensions, 0);

  objc_storeStrong((id *)&self->_lowMemoryExtensions, 0);
}

+ (void)_extensionsWithEndpointName:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Fail to discover extensions for endpoint=%@ with error=%@", (uint8_t *)&v3, 0x16u);
}

@end