@interface AXMSettings
+ (id)settings;
- (BOOL)useANODModelForAXElementVision;
- (BOOL)writeOutInputImages;
- (BOOL)writeOutOCRInputImages;
- (BOOL)writeOutScreenCaptures;
- (id)_init;
- (void)_queue_removeObserver:(id)a3 forSetting:(id)a4;
- (void)addObserver:(id)a3 forSeetting:(id)a4 withBlock:(id)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeObserver:(id)a3 forSetting:(id)a4;
- (void)removeObserverForAllSettings:(id)a3;
- (void)setUseANODModelForAXElementVision:(BOOL)a3;
- (void)setWriteOutInputImages:(BOOL)a3;
- (void)setWriteOutOCRInputImages:(BOOL)a3;
- (void)setWriteOutScreenCaptures:(BOOL)a3;
@end

@implementation AXMSettings

+ (id)settings
{
  if (settings_onceToken != -1) {
    dispatch_once(&settings_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)settings__Settings;

  return v2;
}

void __23__AXMSettings_settings__block_invoke()
{
  id v0 = [[AXMSettings alloc] _init];
  v1 = (void *)settings__Settings;
  settings__Settings = (uint64_t)v0;
}

- (id)_init
{
  v15[4] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)AXMSettings;
  v2 = [(AXMSettings *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("AXMSetting", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
    queue_settingObservers = v2->_queue_settingObservers;
    v2->_queue_settingObservers = (NSMutableDictionary *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
    uint64_t v8 = [v7 initWithSuiteName:AXMBundleID];
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v8;

    v10 = v2->_defaults;
    v14[0] = @"writeOutInputImages";
    v14[1] = @"writeOutOCRInputImages";
    v15[0] = MEMORY[0x1E4F1CC28];
    v15[1] = MEMORY[0x1E4F1CC28];
    v14[2] = @"writeOutScreenCaptures";
    v14[3] = @"useANODModelForAXElementVision";
    v15[2] = MEMORY[0x1E4F1CC28];
    v15[3] = MEMORY[0x1E4F1CC38];
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:4];
    [(NSUserDefaults *)v10 registerDefaults:v11];

    [(NSUserDefaults *)v2->_defaults addObserver:v2 forKeyPath:@"writeOutInputImages" options:1 context:AXMSettingsKVOContext];
    [(NSUserDefaults *)v2->_defaults addObserver:v2 forKeyPath:@"writeOutOCRInputImages" options:1 context:AXMSettingsKVOContext];
    [(NSUserDefaults *)v2->_defaults addObserver:v2 forKeyPath:@"writeOutScreenCaptures" options:1 context:AXMSettingsKVOContext];
    [(NSUserDefaults *)v2->_defaults addObserver:v2 forKeyPath:@"useANODModelForAXElementVision" options:1 context:AXMSettingsKVOContext];
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  if ((void *)AXMSettingsKVOContext == a6)
  {
    v12 = AXMediaLogSettings();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_1B57D5000, v12, OS_LOG_TYPE_INFO, "Did get KVO update for key: '%@'. change: %@", buf, 0x16u);
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AXMSettings_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E6116F08;
    block[4] = self;
    id v16 = v10;
    dispatch_async(queue, block);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)AXMSettings;
    [(AXMSettings *)&v14 observeValueForKeyPath:v10 ofObject:a4 change:v11 context:a6];
  }
}

void __62__AXMSettings_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = MEMORY[0x1BA9A1340](*(void *)(*(void *)(*((void *)&v9 + 1) + 8 * v6) + 16));
        uint64_t v8 = (void *)v7;
        if (v7) {
          (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(void *)(a1 + 32));
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)addObserver:(id)a3 forSeetting:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__AXMSettings_addObserver_forSeetting_withBlock___block_invoke;
  v15[3] = &unk_1E6117348;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_sync(queue, v15);
}

void __49__AXMSettings_addObserver_forSeetting_withBlock___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setObject:forKeyedSubscript:");
  }
  v2 = objc_alloc_init(_AXMSettingObserver);
  objc_storeWeak(&v2->observer, *(id *)(a1 + 48));
  uint64_t v3 = MEMORY[0x1BA9A1340](*(void *)(a1 + 56));
  id callback = v2->callback;
  v2->id callback = (id)v3;

  [v5 addObject:v2];
}

- (void)removeObserver:(id)a3 forSetting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AXMSettings_removeObserver_forSetting___block_invoke;
  block[3] = &unk_1E61179A0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __41__AXMSettings_removeObserver_forSetting___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forSetting:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_removeObserver:(id)a3 forSetting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AXMSettings__queue_removeObserver_forSetting___block_invoke;
  block[3] = &unk_1E61179A0;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, block);
}

void __48__AXMSettings__queue_removeObserver_forSetting___block_invoke(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1[4] + 24) objectForKeyedSubscript:a1[5]];
  if ([v2 count])
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v14 = v2;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * v8);
          id WeakRetained = objc_loadWeakRetained((id *)(v9 + 8));
          if (!WeakRetained
            || (long long v11 = WeakRetained,
                id v12 = objc_loadWeakRetained((id *)(v9 + 8)),
                id v13 = (id)a1[6],
                v12,
                v11,
                v12 == v13))
          {
            [v3 addObject:v9];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }

    [v4 removeObjectsInArray:v3];
    v2 = v14;
  }
}

- (void)removeObserverForAllSettings:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__AXMSettings_removeObserverForAllSettings___block_invoke;
  v7[3] = &unk_1E6116F08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __44__AXMSettings_removeObserverForAllSettings___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "allKeys", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forSetting:", *(void *)(a1 + 40), *(void *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)writeOutInputImages
{
  int v3 = AXMHasInternalSecurityPrivilages();
  if (v3)
  {
    defaults = self->_defaults;
    LOBYTE(v3) = [(NSUserDefaults *)defaults BOOLForKey:@"writeOutInputImages"];
  }
  return v3;
}

- (void)setWriteOutInputImages:(BOOL)a3
{
  BOOL v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
  {
    defaults = self->_defaults;
    [(NSUserDefaults *)defaults setBool:v3 forKey:@"writeOutInputImages"];
  }
}

- (BOOL)writeOutOCRInputImages
{
  int v3 = AXMHasInternalSecurityPrivilages();
  if (v3)
  {
    defaults = self->_defaults;
    LOBYTE(v3) = [(NSUserDefaults *)defaults BOOLForKey:@"writeOutOCRInputImages"];
  }
  return v3;
}

- (void)setWriteOutOCRInputImages:(BOOL)a3
{
  BOOL v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
  {
    defaults = self->_defaults;
    [(NSUserDefaults *)defaults setBool:v3 forKey:@"writeOutOCRInputImages"];
  }
}

- (BOOL)writeOutScreenCaptures
{
  int v3 = AXMHasInternalSecurityPrivilages();
  if (v3)
  {
    defaults = self->_defaults;
    LOBYTE(v3) = [(NSUserDefaults *)defaults BOOLForKey:@"writeOutScreenCaptures"];
  }
  return v3;
}

- (void)setWriteOutScreenCaptures:(BOOL)a3
{
  BOOL v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
  {
    defaults = self->_defaults;
    [(NSUserDefaults *)defaults setBool:v3 forKey:@"writeOutScreenCaptures"];
  }
}

- (BOOL)useANODModelForAXElementVision
{
  if (!AXMHasInternalSecurityPrivilages()) {
    return 1;
  }
  defaults = self->_defaults;

  return [(NSUserDefaults *)defaults BOOLForKey:@"useANODModelForAXElementVision"];
}

- (void)setUseANODModelForAXElementVision:(BOOL)a3
{
  BOOL v3 = a3;
  if (AXMHasInternalSecurityPrivilages())
  {
    defaults = self->_defaults;
    [(NSUserDefaults *)defaults setBool:v3 forKey:@"useANODModelForAXElementVision"];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_settingObservers, 0);
  objc_storeStrong((id *)&self->_defaults, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end