@interface INIntentSummaryCache
+ (id)sharedCache;
- (BOOL)getSubtitle:(id *)a3 forIntent:(id)a4 languageCode:(id)a5;
- (BOOL)getTitle:(id *)a3 forIntent:(id)a4 languageCode:(id)a5;
- (INIntentSummaryCache)init;
- (NSMutableDictionary)allBundlesCache;
- (OS_dispatch_queue)resourceAccessQueue;
- (id)bundleCacheForBundleId:(id)a3;
- (id)cachedSummaryForIntent:(id)a3 languageCode:(id)a4 creatingIfNeeded:(BOOL)a5;
- (int)systemLanguageChangeNotificationToken;
- (void)applicationsDidInstall:(id)a3;
- (void)dealloc;
- (void)invalidateCache;
- (void)invalidateCacheForBundleId:(id)a3;
- (void)setBundleCache:(id)a3 forBundleId:(id)a4;
- (void)setSubtitle:(id)a3 forIntent:(id)a4 languageCode:(id)a5;
- (void)setTitle:(id)a3 forIntent:(id)a4 languageCode:(id)a5;
- (void)startAutomaticInvalidation;
- (void)startObservingApplicationWorkspaceChanges;
- (void)startObservingSystemLanguageChanges;
- (void)stopAutomaticInvalidation;
- (void)stopObservingApplicationWorkspaceChanges;
- (void)stopObservingSystemLanguageChanges;
@end

@implementation INIntentSummaryCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allBundlesCache, 0);

  objc_storeStrong((id *)&self->_resourceAccessQueue, 0);
}

- (int)systemLanguageChangeNotificationToken
{
  return self->_systemLanguageChangeNotificationToken;
}

- (NSMutableDictionary)allBundlesCache
{
  return self->_allBundlesCache;
}

- (OS_dispatch_queue)resourceAccessQueue
{
  return self->_resourceAccessQueue;
}

- (void)applicationsDidInstall:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 appState];
        char v11 = [v10 isPlaceholder];

        if ((v11 & 1) == 0)
        {
          v12 = [v9 bundleIdentifier];
          [(INIntentSummaryCache *)self invalidateCacheForBundleId:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)invalidateCacheForBundleId:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(INIntentSummaryCache *)self setBundleCache:0 forBundleId:v4];
  uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = @"bundleId";
  v8[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"com.apple.IntentsCore.summarycache.invalidation" object:self userInfo:v6];
}

- (void)invalidateCache
{
  v3 = [(INIntentSummaryCache *)self resourceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__INIntentSummaryCache_invalidateCache__block_invoke;
  block[3] = &unk_1E55208F8;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"com.apple.IntentsCore.summarycache.invalidation" object:self];
}

uint64_t __39__INIntentSummaryCache_invalidateCache__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (void)stopObservingSystemLanguageChanges
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 removeObserver:self];
}

- (void)startObservingSystemLanguageChanges
{
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__INIntentSummaryCache_startObservingSystemLanguageChanges__block_invoke;
  v6[3] = &unk_1E5519970;
  objc_copyWeak(&v7, &location);
  id v3 = (void *)MEMORY[0x192F984C0](v6);
  uint64_t v4 = MEMORY[0x1E4F14428];
  id v5 = MEMORY[0x1E4F14428];
  notify_register_dispatch("com.apple.language.changed", &self->_systemLanguageChangeNotificationToken, v4, v3);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __59__INIntentSummaryCache_startObservingSystemLanguageChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidateCache];
}

- (void)stopObservingApplicationWorkspaceChanges
{
  if ([(INIntentSummaryCache *)self systemLanguageChangeNotificationToken])
  {
    int v3 = [(INIntentSummaryCache *)self systemLanguageChangeNotificationToken];
    notify_cancel(v3);
  }
}

- (void)startObservingApplicationWorkspaceChanges
{
  id v3 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v3 addObserver:self];
}

- (void)stopAutomaticInvalidation
{
  [(INIntentSummaryCache *)self stopObservingApplicationWorkspaceChanges];

  [(INIntentSummaryCache *)self stopObservingSystemLanguageChanges];
}

- (void)startAutomaticInvalidation
{
  [(INIntentSummaryCache *)self startObservingApplicationWorkspaceChanges];

  [(INIntentSummaryCache *)self startObservingSystemLanguageChanges];
}

- (void)setSubtitle:(id)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  v9 = [(INIntentSummaryCache *)self cachedSummaryForIntent:a4 languageCode:a5 creatingIfNeeded:1];
  v10 = [(INIntentSummaryCache *)self resourceAccessQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__INIntentSummaryCache_setSubtitle_forIntent_languageCode___block_invoke;
  v13[3] = &unk_1E551F790;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

uint64_t __59__INIntentSummaryCache_setSubtitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSubtitle:*(void *)(a1 + 40)];
}

- (void)setTitle:(id)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8 = a3;
  v9 = [(INIntentSummaryCache *)self cachedSummaryForIntent:a4 languageCode:a5 creatingIfNeeded:1];
  v10 = [(INIntentSummaryCache *)self resourceAccessQueue];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__INIntentSummaryCache_setTitle_forIntent_languageCode___block_invoke;
  v13[3] = &unk_1E551F790;
  id v14 = v9;
  id v15 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_sync(v10, v13);
}

uint64_t __56__INIntentSummaryCache_setTitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40)];
}

- (BOOL)getSubtitle:(id *)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(INIntentSummaryCache *)self cachedSummaryForIntent:v8 languageCode:v9 creatingIfNeeded:0];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v11 = [(INIntentSummaryCache *)self resourceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__INIntentSummaryCache_getSubtitle_forIntent_languageCode___block_invoke;
  block[3] = &unk_1E5519A50;
  id v15 = v10;
  long long v16 = &v18;
  v17 = a3;
  id v12 = v10;
  dispatch_sync(v11, block);

  LOBYTE(v10) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v10;
}

uint64_t __59__INIntentSummaryCache_getSubtitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) containedProperties];
  if ((result & 2) != 0)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (v3)
    {
      uint64_t result = [*(id *)(a1 + 32) subtitle];
      **(void **)(a1 + 48) = result;
    }
  }
  return result;
}

- (BOOL)getTitle:(id *)a3 forIntent:(id)a4 languageCode:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(INIntentSummaryCache *)self cachedSummaryForIntent:v8 languageCode:v9 creatingIfNeeded:0];
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  id v11 = [(INIntentSummaryCache *)self resourceAccessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__INIntentSummaryCache_getTitle_forIntent_languageCode___block_invoke;
  block[3] = &unk_1E5519A50;
  id v15 = v10;
  long long v16 = &v18;
  v17 = a3;
  id v12 = v10;
  dispatch_sync(v11, block);

  LOBYTE(v10) = *((unsigned char *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return (char)v10;
}

uint64_t __56__INIntentSummaryCache_getTitle_forIntent_languageCode___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) containedProperties];
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 48);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    if (v3)
    {
      uint64_t result = [*(id *)(a1 + 32) title];
      **(void **)(a1 + 48) = result;
    }
  }
  return result;
}

- (id)cachedSummaryForIntent:(id)a3 languageCode:(id)a4 creatingIfNeeded:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (__CFString *)a4;
  if (![(__CFString *)v9 length])
  {

    id v9 = @"SystemLanguage";
  }
  v10 = [v8 launchId];
  id v20 = 0;
  INExtractAppInfoFromSiriLaunchId(v10, &v20, 0);
  id v11 = v20;

  if ([v11 length])
  {
    id v12 = v9;
    long long v13 = [v8 identifier];
    id v14 = [v13 stringByAppendingString:v12];

    id v15 = [(INIntentSummaryCache *)self bundleCacheForBundleId:v11];
    long long v16 = [v15 objectForKey:v14];
    if (!v16 && v5)
    {
      if (!v15)
      {
        id v15 = objc_opt_new();
        [(INIntentSummaryCache *)self setBundleCache:v15 forBundleId:v11];
      }
      v17 = [INIntentSummary alloc];
      uint64_t v18 = [v8 identifier];
      long long v16 = [(INIntentSummary *)v17 initWithIntentIdentifier:v18 originatingBundleId:v11 languageCode:v12];

      [v15 setObject:v16 forKey:v14];
    }
  }
  else
  {
    long long v16 = 0;
  }

  return v16;
}

- (void)setBundleCache:(id)a3 forBundleId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    id v8 = [(INIntentSummaryCache *)self resourceAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__INIntentSummaryCache_setBundleCache_forBundleId___block_invoke;
    block[3] = &unk_1E551A090;
    void block[4] = self;
    id v10 = v7;
    id v11 = v6;
    dispatch_sync(v8, block);
  }
}

void __51__INIntentSummaryCache_setBundleCache_forBundleId___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) allBundlesCache];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)bundleCacheForBundleId:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__54489;
    id v15 = __Block_byref_object_dispose__54490;
    id v16 = 0;
    BOOL v5 = [(INIntentSummaryCache *)self resourceAccessQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47__INIntentSummaryCache_bundleCacheForBundleId___block_invoke;
    block[3] = &unk_1E551B620;
    id v10 = &v11;
    void block[4] = self;
    id v9 = v4;
    dispatch_sync(v5, block);

    id v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __47__INIntentSummaryCache_bundleCacheForBundleId___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) allBundlesCache];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)dealloc
{
  [(INIntentSummaryCache *)self stopAutomaticInvalidation];
  v3.receiver = self;
  v3.super_class = (Class)INIntentSummaryCache;
  [(INIntentSummaryCache *)&v3 dealloc];
}

- (INIntentSummaryCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)INIntentSummaryCache;
  uint64_t v2 = [(INIntentSummaryCache *)&v10 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.IntentsCore.summarycache", v3);
    resourceAccessQueue = v2->_resourceAccessQueue;
    v2->_resourceAccessQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    allBundlesCache = v2->_allBundlesCache;
    v2->_allBundlesCache = (NSMutableDictionary *)v6;

    [(INIntentSummaryCache *)v2 startAutomaticInvalidation];
    id v8 = v2;
  }
  return v2;
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_54495);
  }
  uint64_t v2 = (void *)sharedCache_cache;

  return v2;
}

uint64_t __35__INIntentSummaryCache_sharedCache__block_invoke()
{
  v0 = objc_alloc_init(INIntentSummaryCache);
  uint64_t v1 = sharedCache_cache;
  sharedCache_cache = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end