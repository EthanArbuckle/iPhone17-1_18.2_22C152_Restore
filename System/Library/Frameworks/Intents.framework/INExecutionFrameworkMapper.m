@interface INExecutionFrameworkMapper
+ (void)initialize;
- (BOOL)_filled;
- (INExecutionFrameworkMapper)init;
- (NSMutableDictionary)_appToExtensionIdentifiers;
- (id)appBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3;
- (id)displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3;
- (id)extensionBundleIdentifiersForSystemAppIdentifier:(id)a3;
- (id)launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3;
- (os_unfair_lock_s)_lock;
- (void)_addExtensionBundleIdentifier:(id)a3 forAppBundleIdentifier:(id)a4;
- (void)dealloc;
- (void)installedApplicationsDidChange:(id)a3;
- (void)loadSystemExtensionInformation;
- (void)reset;
@end

@implementation INExecutionFrameworkMapper

uint64_t __35__INExecutionFrameworkMapper_reset__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _addExtensionBundleIdentifier:a2 forAppBundleIdentifier:a3];
}

uint64_t __35__INExecutionFrameworkMapper_reset__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _addExtensionBundleIdentifier:a2 forAppBundleIdentifier:a3];
}

- (void)_addExtensionBundleIdentifier:(id)a3 forAppBundleIdentifier:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_appToExtensionIdentifiers objectForKeyedSubscript:v6];
  if (!v7)
  {
    v7 = objc_opt_new();
    [(NSMutableDictionary *)self->_appToExtensionIdentifiers setObject:v7 forKeyedSubscript:v6];
  }
  [v7 addObject:v8];
}

- (void).cxx_destruct
{
}

- (INExecutionFrameworkMapper)init
{
  v7.receiver = self;
  v7.super_class = (Class)INExecutionFrameworkMapper;
  v2 = [(INExecutionFrameworkMapper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v4 addObserver:v3 selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationRegistered" object:0];
    [v4 addObserver:v3 selector:sel_installedApplicationsDidChange_ name:@"com.apple.LaunchServices.applicationUnregistered" object:0];
    [(INExecutionFrameworkMapper *)v3 reset];
    v5 = v3;
  }
  return v3;
}

- (void)reset
{
  os_unfair_lock_lock(&self->_lock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35__INExecutionFrameworkMapper_reset__block_invoke;
  v8[3] = &unk_1E55208F8;
  v8[4] = self;
  v3 = (void (**)(void))MEMORY[0x192F984C0](v8);
  v4 = (NSMutableDictionary *)objc_opt_new();
  appToExtensionIdentifiers = self->_appToExtensionIdentifiers;
  self->_appToExtensionIdentifiers = v4;

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__INExecutionFrameworkMapper_reset__block_invoke_2;
  v7[3] = &unk_1E551F608;
  v7[4] = self;
  [&unk_1EDBB00D0 enumerateKeysAndObjectsUsingBlock:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__INExecutionFrameworkMapper_reset__block_invoke_3;
  v6[3] = &unk_1E551F608;
  v6[4] = self;
  [&unk_1EDBB00F8 enumerateKeysAndObjectsUsingBlock:v6];
  self->_filled = 0;
  v3[2](v3);
}

void __35__INExecutionFrameworkMapper_reset__block_invoke(uint64_t a1)
{
}

- (id)launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v3];
  v5 = v4;
  if (v4 && objc_msgSend(v4, "if_isSystem"))
  {
    id v6 = [v5 objectForInfoDictionaryKey:@"INLaunchableApplicationBundleIdentifier" ofClass:objc_opt_class()];
    if (!v6)
    {
      id v6 = [v5 objectForInfoDictionaryKey:@"INLaunchableAApplicationBundleIdentifier" ofClass:objc_opt_class()];
      if (!v6)
      {
        id v6 = [&unk_1EDBB00D0 objectForKey:v3];
        if (!v6)
        {
          id v6 = [v5 containingBundle];

          if (v6)
          {
            objc_super v7 = [v5 containingBundle];
            id v6 = [v7 bundleIdentifier];
          }
        }
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F22458] pluginKitProxyForIdentifier:v3];
    v5 = v4;
    if (v4 && objc_msgSend(v4, "if_isSystem"))
    {
      id v6 = [v5 objectForInfoDictionaryKey:@"INDisplayableApplicationBundleIdentifier" ofClass:objc_opt_class()];
      if (!v6)
      {
        id v6 = [&unk_1EDBB00F8 objectForKey:v3];
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationRegistered" object:0];
  [v3 removeObserver:self name:@"com.apple.LaunchServices.applicationUnregistered" object:0];

  v4.receiver = self;
  v4.super_class = (Class)INExecutionFrameworkMapper;
  [(INExecutionFrameworkMapper *)&v4 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
  {
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_71966);
  }
}

- (os_unfair_lock_s)_lock
{
  return self->_lock;
}

- (BOOL)_filled
{
  return self->_filled;
}

- (NSMutableDictionary)_appToExtensionIdentifiers
{
  return self->_appToExtensionIdentifiers;
}

- (id)appBundleIdentifierForSystemExtensionBundleIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(INExecutionFrameworkMapper *)self launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:v4];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(INExecutionFrameworkMapper *)self displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:v4];
  }
  id v8 = v7;

  return v8;
}

- (id)extensionBundleIdentifiersForSystemAppIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  id v6 = [v5 compatibilityObject];
  id v7 = 0;
  if (objc_msgSend(v6, "if_isSystem"))
  {
    [(INExecutionFrameworkMapper *)self loadSystemExtensionInformation];
    os_unfair_lock_lock(&self->_lock);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__INExecutionFrameworkMapper_extensionBundleIdentifiersForSystemAppIdentifier___block_invoke;
    v14[3] = &unk_1E55208F8;
    v14[4] = self;
    id v8 = (void (**)(void))MEMORY[0x192F984C0](v14);
    v9 = [v5 applicationExtensionRecords];
    v10 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_119738);

    v11 = [(INExecutionFrameworkMapper *)self _appToExtensionIdentifiers];
    v12 = [v11 objectForKey:v4];

    id v7 = [v10 setByAddingObjectsFromSet:v12];

    v8[2](v8);
  }

  return v7;
}

void __79__INExecutionFrameworkMapper_extensionBundleIdentifiersForSystemAppIdentifier___block_invoke(uint64_t a1)
{
}

- (void)loadSystemExtensionInformation
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock(&self->_lock);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __60__INExecutionFrameworkMapper_loadSystemExtensionInformation__block_invoke;
  v22[3] = &unk_1E55208F8;
  id v3 = self;
  v22[4] = self;
  v16 = (void (**)(void))MEMORY[0x192F984C0](v22);
  if (!self->_filled)
  {
    [MEMORY[0x1E4F223A0] enumeratorWithOptions:1];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v19;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v19 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v18 + 1) + 8 * v6);
          id v8 = (void *)MEMORY[0x192F98250]();
          v9 = [v7 bundleIdentifier];
          if (v9)
          {
            v10 = [v7 infoDictionary];
            v11 = [v10 objectForKey:@"INLaunchableApplicationBundleIdentifier" ofClass:objc_opt_class()];

            if (v11) {
              [(INExecutionFrameworkMapper *)v3 _addExtensionBundleIdentifier:v9 forAppBundleIdentifier:v11];
            }
            v12 = objc_msgSend(v7, "infoDictionary", v16);
            v13 = [v12 objectForKey:@"INLaunchableAApplicationBundleIdentifier" ofClass:objc_opt_class()];

            if (v13) {
              [(INExecutionFrameworkMapper *)v3 _addExtensionBundleIdentifier:v9 forAppBundleIdentifier:v13];
            }
            v14 = [v7 infoDictionary];
            v15 = [v14 objectForKey:@"INDisplayableApplicationBundleIdentifier" ofClass:objc_opt_class()];

            if (v15) {
              [(INExecutionFrameworkMapper *)v3 _addExtensionBundleIdentifier:v9 forAppBundleIdentifier:v15];
            }
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v4);
    }

    v3->_filled = 1;
  }
  v16[2]();
}

void __60__INExecutionFrameworkMapper_loadSystemExtensionInformation__block_invoke(uint64_t a1)
{
}

- (void)installedApplicationsDidChange:(id)a3
{
  uint64_t v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKey:@"isPlaceholder"];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v6 = v5;
    }
    else {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  char v8 = [v7 BOOLValue];
  if ((v8 & 1) == 0)
  {
    [(INExecutionFrameworkMapper *)self reset];
  }
}

@end