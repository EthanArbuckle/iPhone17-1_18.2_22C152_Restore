@interface HFWallpaperManager
+ (id)sharedInstance;
- (BOOL)wallpaperSourceRegistered;
- (HFNamedWallpaperSource)namedWallpaperSource;
- (HFReaderWriterCache)wallpapersCache;
- (HFWallpaperFileManager)fileManager;
- (HFWallpaperImageCache)imageCache;
- (HFWallpaperLegacyFileManager)legacyFileManager;
- (HFWallpaperManager)init;
- (NSUserDefaults)userDefaults;
- (id)_cachedWallpaperForKey:(id)a3;
- (id)_originalImageForWallpaper:(id)a3 forProcessingGenerator:(BOOL)a4;
- (id)_originalImageFromNamedWallpaperSourceForWallpaper:(id)a3;
- (id)_wallpaperForHomeKitObject:(id)a3 createIfNeeded:(BOOL)a4;
- (id)allNamedWallpaperThumbnailsForWallpaperCollectionType:(int64_t)a3;
- (id)allNamedWallpapersForWallpaperCollectionType:(int64_t)a3;
- (id)defaultUserSelectableWallpaperForHomeKitObject:(id)a3;
- (id)defaultUserSelectableWallpaperForWallpaperCollectionType:(int64_t)a3;
- (id)generateProcessedImageFromWallpaper:(id)a3 originalImage:(id)a4;
- (id)processOriginalBlurredImageFromWallpaper:(id)a3 originalImage:(id)a4;
- (id)processOriginalImageFromWallpaper:(id)a3 originalImage:(id)a4;
- (id)wallpaperForHomeKitObject:(id)a3;
- (id)wallpaperImageForWallpaper:(id)a3 variant:(int64_t)a4;
- (id)wallpaperObjectForWallpaper:(id)a3 currentUserInterfaceStyle:(int64_t)a4;
- (void)_dispatchWallpaperChangedforHomeKitObject:(id)a3;
- (void)_logUserMetricsAfterSettingWallpaper;
- (void)_migrateIfNeeded;
- (void)_migrateToSunriseWallpaperIfNeeded;
- (void)_migrateWallpaperDict:(id)a3 forHomeKitIdentifier:(id)a4;
- (void)_preloadWallpaperForHomeKitObject:(id)a3;
- (void)_pruneUnusedWallpapers;
- (void)_pruneUnusedWallpapersWithExistingHomeKitIdentifiers:(id)a3;
- (void)_setImageCacheForWallpaper:(id)a3 image:(id)a4 forHomeKitIdentifier:(id)a5;
- (void)_setWallpaper:(id)a3 forHomeKitIdentifier:(id)a4;
- (void)_setWallpaper:(id)a3 image:(id)a4 forHomeKitIdentifier:(id)a5;
- (void)_setWallpaper:(id)a3 image:(id)a4 forHomeKitObject:(id)a5;
- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3;
- (void)preheatCache;
- (void)registerWallpaperSource:(id)a3 processedSource:(id)a4;
- (void)setFileManager:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setLegacyFileManager:(id)a3;
- (void)setNamedWallpaperSource:(id)a3;
- (void)setUserDefaults:(id)a3;
- (void)setWallpapersCache:(id)a3;
@end

@implementation HFWallpaperManager

- (void)preheatCache
{
  v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v3 home];

  v4 = v5;
  if (v5)
  {
    [(HFWallpaperManager *)self _preloadWallpaperForHomeKitObject:v5];
    v4 = v5;
  }
}

- (void)homeManagerDidFinishInitialDatabaseLoad:(id)a3
{
  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  id v5 = [v4 home];

  if (v5)
  {
    [(HFWallpaperManager *)self _migrateToSunriseWallpaperIfNeeded];
    [(HFWallpaperManager *)self _preloadWallpaperForHomeKitObject:v5];
  }
}

void __38__HFWallpaperManager__migrateIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) userDefaults];
  uint64_t v3 = [v2 integerForKey:@"Version"];

  v4 = HFLogForCategory(0x48uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 2)
  {
    if (v5)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = 2;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Wallpaper cache up-to-date (v%ld)", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Migrating wallpaper cache...", buf, 2u);
    }

    v6 = [*(id *)(a1 + 32) legacyFileManager];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__HFWallpaperManager__migrateIfNeeded__block_invoke_33;
    v8[3] = &unk_26409B378;
    v8[4] = *(void *)(a1 + 32);
    [v6 migrateCache:v8];

    v7 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Wallpaper cache migration complete", buf, 2u);
    }

    v4 = [*(id *)(a1 + 32) userDefaults];
    [v4 setInteger:2 forKey:@"Version"];
  }
}

void __64__HFWallpaperManager__wallpaperForHomeKitObject_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    goto LABEL_16;
  }
  v7 = [*(id *)(a1 + 40) userDefaults];
  v8 = [*(id *)(a1 + 32) uniqueIdentifier];
  v9 = [v8 UUIDString];
  uint64_t v10 = [v7 dictionaryForKey:v9];

  if (v10)
  {
    uint64_t v11 = [[HFWallpaper alloc] initWithDictionary:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_10;
    }
    v14 = [*(id *)(a1 + 40) fileManager];
    char v15 = [v14 originalImageExistsForWallpaper:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

    if (v15) {
      goto LABEL_14;
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
    {
      v16 = HFLogForCategory(0x48uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        int v46 = 138412290;
        v47 = v17;
        _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Unable to locate original image for wallpaper %@", (uint8_t *)&v46, 0xCu);
      }
    }
    else
    {
LABEL_10:
      v16 = HFLogForCategory(0x48uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v44 = [*(id *)(a1 + 32) uniqueIdentifier];
        v45 = [v44 UUIDString];
        int v46 = 138412546;
        v47 = v45;
        __int16 v48 = 2112;
        v49 = v10;
        _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "Failed to create wallpaper for HomeKit identifier %@ from dict %@", (uint8_t *)&v46, 0x16u);
      }
    }

    v23 = [*(id *)(a1 + 40) userDefaults];
    v24 = [*(id *)(a1 + 32) uniqueIdentifier];
    v25 = [v24 UUIDString];
    [v23 removeObjectForKey:v25];

    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    v18 = *(NSObject **)(v26 + 40);
    *(void *)(v26 + 40) = 0;
  }
  else
  {
    v18 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = [*(id *)(a1 + 32) uniqueIdentifier];
      v20 = [v19 UUIDString];
      v21 = [*(id *)(a1 + 40) userDefaults];
      v22 = [v21 dictionaryRepresentation];
      int v46 = 138412546;
      v47 = v20;
      __int16 v48 = 2112;
      v49 = v22;
      _os_log_error_impl(&dword_20B986000, v18, OS_LOG_TYPE_ERROR, "No content in user default for HomeKit identifier %@. \nCurrent Content of user default %@", (uint8_t *)&v46, 0x16u);
    }
  }

LABEL_14:
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) && *(unsigned char *)(a1 + 56))
  {
    objc_opt_class();
    uint64_t v29 = [*(id *)(a1 + 40) defaultWallpaperForCollectionType:(objc_opt_isKindOfClass() & 1) == 0];
    uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
    v31 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v29;

    v32 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v34 = *(void **)(a1 + 32);
      int v46 = 138412546;
      v47 = v33;
      __int16 v48 = 2112;
      v49 = v34;
      _os_log_impl(&dword_20B986000, v32, OS_LOG_TYPE_DEFAULT, "Using default wallpaper \"%@\" for HomeKit object %@", (uint8_t *)&v46, 0x16u);
    }

    v35 = [*(id *)(a1 + 40) userDefaults];
    v36 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) dictionaryRepresentation];
    v37 = [*(id *)(a1 + 32) uniqueIdentifier];
    v38 = [v37 UUIDString];
    [v35 setObject:v36 forKey:v38];

    if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) type] != 1
      && [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) type] != 6)
    {
      v39 = [*(id *)(a1 + 40) namedWallpaperSource];
      v40 = [v39 imageForWallpaper:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

      v41 = *(void **)(a1 + 40);
      uint64_t v42 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      v43 = [*(id *)(a1 + 32) uniqueIdentifier];
      [v41 _setImageCacheForWallpaper:v42 image:v40 forHomeKitIdentifier:v43];
    }
    [*(id *)(a1 + 40) _dispatchWallpaperChangedforHomeKitObject:*(void *)(a1 + 32)];
    if (!+[HFUtilities isAMac]) {
      [*(id *)(a1 + 40) _pruneUnusedWallpapers];
    }
  }
  uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v28 = [*(id *)(a1 + 32) uniqueIdentifier];
  objc_msgSend(v3, "na_safeSetObject:forKey:", v27, v28);

LABEL_16:
}

- (void)_migrateToSunriseWallpaperIfNeeded
{
  id v11 = [(HFWallpaperManager *)self userDefaults];
  if ([v11 BOOLForKey:@"hasUpdatedToSunrise"])
  {
  }
  else
  {
    id v3 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v4 = [v3 homeManager];
    uint64_t v5 = [v4 homes];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      v7 = +[HFHomeKitDispatcher sharedDispatcher];
      v8 = [v7 homeManager];
      v9 = [v8 homes];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke;
      v12[3] = &unk_26409B3C8;
      v12[4] = self;
      objc_msgSend(v9, "na_each:", v12);

      uint64_t v10 = [(HFWallpaperManager *)self userDefaults];
      [v10 setBool:1 forKey:@"hasUpdatedToSunrise"];
    }
  }
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HFWallpaperFileManager)fileManager
{
  return self->_fileManager;
}

void __36__HFWallpaperManager_sharedInstance__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (+[HFExecutionEnvironment isHomeApp])
  {
    _MergedGlobals_317 = objc_alloc_init(HFWallpaperManager);
    MEMORY[0x270F9A758]();
  }
  else
  {
    v0 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      v2 = +[HFExecutionEnvironment sharedInstance];
      *(_DWORD *)buf = 134217984;
      uint64_t v4 = [v2 hostProcess];
      _os_log_error_impl(&dword_20B986000, v0, OS_LOG_TYPE_ERROR, "HFWallpaperManager shouldn't ever be created or used outside of Home App currentProcess:%ld", buf, 0xCu);
    }
    v1 = +[HFExecutionEnvironment sharedInstance];
    NSLog(&cfstr_Hfwallpaperman.isa, [v1 hostProcess]);
  }
}

- (HFWallpaperManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)HFWallpaperManager;
  v2 = [(HFWallpaperManager *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.Home.wallpaper"];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    uint64_t v5 = objc_alloc_init(HFReaderWriterCache);
    wallpapersCache = v2->_wallpapersCache;
    v2->_wallpapersCache = v5;

    v7 = [HFWallpaperImageCache alloc];
    uint64_t v8 = [(HFWallpaperImageCache *)v7 initWithIdentifier:HFWallpaperImageCacheIdentifier];
    imageCache = v2->_imageCache;
    v2->_imageCache = (HFWallpaperImageCache *)v8;

    uint64_t v10 = objc_alloc_init(HFWallpaperFileManager);
    fileManager = v2->_fileManager;
    v2->_fileManager = v10;

    uint64_t v12 = objc_alloc_init(HFWallpaperLegacyFileManager);
    legacyFileManager = v2->_legacyFileManager;
    v2->_legacyFileManager = v12;

    v14 = v2;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __HFWallpaperManagerRegisterWithDispatcher_block_invoke;
    block[3] = &unk_26408DDE0;
    v18 = v14;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  return v2;
}

- (id)wallpaperImageForWallpaper:(id)a3 variant:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = [(HFWallpaperManager *)self imageCache];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __57__HFWallpaperManager_wallpaperImageForWallpaper_variant___block_invoke;
    v10[3] = &unk_26409B350;
    v10[4] = self;
    id v11 = v6;
    uint64_t v8 = [v7 imageForVariant:a4 wallpaper:v11 withOriginalImageGenerator:v10];
  }
  else
  {
    uint64_t v8 = [(HFWallpaperManager *)self _originalImageForWallpaper:v6 forProcessingGenerator:0];
  }

  return v8;
}

- (void)registerWallpaperSource:(id)a3 processedSource:(id)a4
{
  id v6 = a4;
  [(HFWallpaperManager *)self setNamedWallpaperSource:a3];
  v7 = [(HFWallpaperManager *)self imageCache];
  [v7 setProcessedWallpaperSource:v6];

  self->_wallpaperSourceRegistered = a3 != 0;
  [(HFWallpaperManager *)self _migrateIfNeeded];
  [(HFWallpaperManager *)self _migrateToSunriseWallpaperIfNeeded];
}

- (HFWallpaperImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setNamedWallpaperSource:(id)a3
{
}

- (id)wallpaperObjectForWallpaper:(id)a3 currentUserInterfaceStyle:(int64_t)a4
{
  return [(HFWallpaperManager *)self wallpaperImageForWallpaper:a3 variant:1];
}

+ (id)sharedInstance
{
  if (qword_26AB2FD90 != -1) {
    dispatch_once(&qword_26AB2FD90, &__block_literal_global_216);
  }
  v2 = (void *)_MergedGlobals_317;
  return v2;
}

uint64_t __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke(id *a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v2 = a1[4];
  uint64_t v3 = [a1[5] uniqueIdentifier];
  uint64_t v4 = [v2 _cachedWallpaperForKey:v3];

  if (v4)
  {
    uint64_t v5 = (id *)v11;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_2;
    v11[3] = &unk_26408D450;
    v11[4] = a1[6];
    id v6 = v4;
    v11[5] = v6;
  }
  else
  {
    v7 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = a1[5];
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_20B986000, v7, OS_LOG_TYPE_DEFAULT, "Loading wallpaper for HomeKit object %@", buf, 0xCu);
    }

    v9 = [a1[4] _wallpaperForHomeKitObject:a1[5] createIfNeeded:1];
    if (!v9) {
      NSLog(&cfstr_FailedToLoadWa.isa, a1[5]);
    }
    uint64_t v5 = (id *)v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_27;
    v10[3] = &unk_26408D450;
    v10[4] = a1[6];
    id v6 = v9;
    void v10[5] = v6;
  }
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

- (id)_cachedWallpaperForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFWallpaperManager *)self wallpapersCache];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

id __56__HFWallpaperManager__preloadWallpaperForHomeKitObject___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) uniqueIdentifier];
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Preloading wallpaper slices for key: %@", (uint8_t *)&v5, 0xCu);
  }
  return (id)[*(id *)(a1 + 40) wallpaperForHomeKitObject:*(void *)(a1 + 32)];
}

- (id)_wallpaperForHomeKitObject:(id)a3 createIfNeeded:(BOOL)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  uint64_t v7 = [(HFWallpaperManager *)self wallpapersCache];
  id v8 = [v6 uniqueIdentifier];
  id v23 = [v7 tryObjectForKey:v8];

  v9 = (void *)v19[5];
  if (!v9)
  {
    uint64_t v10 = [(HFWallpaperManager *)self wallpapersCache];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__HFWallpaperManager__wallpaperForHomeKitObject_createIfNeeded___block_invoke;
    v13[3] = &unk_26409B440;
    objc_super v16 = &v18;
    id v14 = v6;
    char v15 = self;
    BOOL v17 = a4;
    [v10 performBlockWithWriteLock:v13];

    v9 = (void *)v19[5];
  }
  id v11 = v9;
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (id)wallpaperForHomeKitObject:(id)a3
{
  id v4 = a3;
  int v5 = [(HFWallpaperManager *)self wallpapersCache];
  id v6 = [v4 uniqueIdentifier];
  uint64_t v7 = [v5 tryObjectForKey:v6];

  if (v7)
  {
    id v8 = [MEMORY[0x263F58190] futureWithResult:v7];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F58190]);
    uint64_t v10 = (void *)MEMORY[0x263F086D0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke;
    v16[3] = &unk_26408D388;
    v16[4] = self;
    id v17 = v4;
    id v11 = v9;
    id v18 = v11;
    uint64_t v12 = [v10 blockOperationWithBlock:v16];
    [v12 setQueuePriority:4];
    [v12 setQualityOfService:33];
    id v13 = [MEMORY[0x263F42628] defaultScheduler];
    id v14 = (id)[v13 performOperation:v12];

    id v8 = v11;
  }

  return v8;
}

- (HFReaderWriterCache)wallpapersCache
{
  return self->_wallpapersCache;
}

- (void)_migrateIfNeeded
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__HFWallpaperManager__migrateIfNeeded__block_invoke;
  v5[3] = &unk_26408DDE0;
  v5[4] = self;
  id v2 = [MEMORY[0x263F086D0] blockOperationWithBlock:v5];
  [v2 setQueuePriority:4];
  [v2 setQualityOfService:17];
  uint64_t v3 = [MEMORY[0x263F42628] defaultScheduler];
  id v4 = (id)[v3 performOperation:v2];
}

- (void)_preloadWallpaperForHomeKitObject:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263F086D0];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __56__HFWallpaperManager__preloadWallpaperForHomeKitObject___block_invoke;
  id v13 = &unk_26408D450;
  id v14 = v4;
  char v15 = self;
  id v6 = v4;
  uint64_t v7 = [v5 blockOperationWithBlock:&v10];
  objc_msgSend(v7, "setQueuePriority:", -4, v10, v11, v12, v13);
  [v7 setQualityOfService:33];
  id v8 = [MEMORY[0x263F42628] defaultScheduler];
  id v9 = (id)[v8 performOperation:v7];
}

- (id)defaultUserSelectableWallpaperForHomeKitObject:(id)a3
{
  id v4 = a3;
  int v5 = [(HFWallpaperManager *)self _wallpaperForHomeKitObject:v4 createIfNeeded:0];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    objc_opt_class();
    [(HFWallpaperManager *)self defaultUserSelectableWallpaperForWallpaperCollectionType:(objc_opt_isKindOfClass() & 1) == 0];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v8 = v7;

  return v8;
}

- (id)defaultUserSelectableWallpaperForWallpaperCollectionType:(int64_t)a3
{
  id v4 = [(HFWallpaperManager *)self namedWallpaperSource];
  int v5 = [v4 defaultWallpaperForCollection:a3];

  return v5;
}

uint64_t __48__HFWallpaperManager_wallpaperForHomeKitObject___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

uint64_t __57__HFWallpaperManager_wallpaperImageForWallpaper_variant___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _originalImageForWallpaper:*(void *)(a1 + 40) forProcessingGenerator:1];
}

- (id)generateProcessedImageFromWallpaper:(id)a3 originalImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 type];
  if (v7 && v8 == 6)
  {
    id v9 = [(HFWallpaperManager *)self imageCache];
    uint64_t v10 = [v9 processedWallpaperSource];
    uint64_t v11 = [v10 generateFilteredImageForWallpaper:v6 image:v7];

    id v7 = (id)v11;
  }
  uint64_t v12 = [(HFWallpaperManager *)self imageCache];
  id v13 = [v12 processedWallpaperSource];
  id v14 = [v13 processedImageForVariant:1 wallpaper:v6 image:v7];

  return v14;
}

- (id)processOriginalImageFromWallpaper:(id)a3 originalImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 type];
  if (v7 && v8 == 1)
  {
    id v9 = [(HFWallpaperManager *)self imageCache];
    uint64_t v10 = [v9 processedWallpaperSource];
    id v11 = [v10 generateFilteredImageForWallpaper:v6 image:v7];
  }
  else
  {
    id v11 = v7;
  }

  return v11;
}

- (id)processOriginalBlurredImageFromWallpaper:(id)a3 originalImage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 type];
  id v9 = 0;
  if (v7 && v8 == 6)
  {
    uint64_t v10 = [(HFWallpaperManager *)self imageCache];
    id v11 = [v10 processedWallpaperSource];
    id v9 = [v11 generateFilteredImageForWallpaper:v6 image:v7];
  }
  return v9;
}

- (id)allNamedWallpapersForWallpaperCollectionType:(int64_t)a3
{
  int v5 = [(HFWallpaperManager *)self namedWallpaperSource];

  if (!v5) {
    NSLog(&cfstr_MustRegisterNa.isa);
  }
  id v6 = [(HFWallpaperManager *)self namedWallpaperSource];
  id v7 = [v6 allWallpapersForCollection:a3];

  return v7;
}

- (id)allNamedWallpaperThumbnailsForWallpaperCollectionType:(int64_t)a3
{
  int v5 = [(HFWallpaperManager *)self namedWallpaperSource];

  if (!v5) {
    NSLog(&cfstr_MustRegisterNa.isa);
  }
  id v6 = [(HFWallpaperManager *)self namedWallpaperSource];
  id v7 = [v6 allWallpaperThumbnailsForCollection:a3];

  return v7;
}

uint64_t __38__HFWallpaperManager__migrateIfNeeded__block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _setWallpaper:a3 image:a4 forHomeKitIdentifier:a2];
}

void __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 uniqueIdentifier];
  int v5 = [v4 UUIDString];

  id v6 = [*(id *)(a1 + 32) userDefaults];
  id v7 = [v6 dictionaryForKey:v5];

  [*(id *)(a1 + 32) _migrateWallpaperDict:v7 forHomeKitIdentifier:v5];
  uint64_t v8 = objc_msgSend(v3, "hf_allRooms");

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke_2;
  v9[3] = &unk_26409B3A0;
  v9[4] = *(void *)(a1 + 32);
  objc_msgSend(v8, "na_each:", v9);
}

void __56__HFWallpaperManager__migrateToSunriseWallpaperIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 uniqueIdentifier];
  id v6 = [v3 UUIDString];

  id v4 = [*(id *)(a1 + 32) userDefaults];
  int v5 = [v4 dictionaryForKey:v6];

  [*(id *)(a1 + 32) _migrateWallpaperDict:v5 forHomeKitIdentifier:v6];
}

- (void)_migrateWallpaperDict:(id)a3 forHomeKitIdentifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = [[HFWallpaper alloc] initWithDictionary:v7];

    if (![(HFWallpaper *)v8 isCustomType])
    {
      id v9 = HFLogForCategory(0x48uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412546;
        uint64_t v12 = v8;
        __int16 v13 = 2112;
        id v14 = v6;
        _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Remove old default wallpaper: %@ for homeKitIdentifier: %@", (uint8_t *)&v11, 0x16u);
      }

      uint64_t v10 = [(HFWallpaperManager *)self userDefaults];
      [v10 removeObjectForKey:v6];
    }
  }
}

- (void)_setWallpaper:(id)a3 image:(id)a4 forHomeKitObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = (void *)MEMORY[0x263F086D0];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __59__HFWallpaperManager__setWallpaper_image_forHomeKitObject___block_invoke;
  v21 = &unk_26408D478;
  v22 = self;
  id v23 = v8;
  id v24 = v9;
  id v25 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = [v11 blockOperationWithBlock:&v18];
  objc_msgSend(v15, "setQueuePriority:", 4, v18, v19, v20, v21, v22);
  [v15 setQualityOfService:17];
  objc_super v16 = [MEMORY[0x263F42628] defaultScheduler];
  id v17 = (id)[v16 performOperation:v15];
}

uint64_t __59__HFWallpaperManager__setWallpaper_image_forHomeKitObject___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  int v5 = [*(id *)(a1 + 56) uniqueIdentifier];
  [v2 _setWallpaper:v3 image:v4 forHomeKitIdentifier:v5];

  [*(id *)(a1 + 32) _dispatchWallpaperChangedforHomeKitObject:*(void *)(a1 + 56)];
  uint64_t result = +[HFUtilities isAMac];
  if ((result & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    return [v7 _pruneUnusedWallpapers];
  }
  return result;
}

- (void)_setWallpaper:(id)a3 image:(id)a4 forHomeKitIdentifier:(id)a5
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  [(HFWallpaperManager *)self _setWallpaper:v10 forHomeKitIdentifier:v9];
  if (v8) {
    [(HFWallpaperManager *)self _setImageCacheForWallpaper:v10 image:v8 forHomeKitIdentifier:v9];
  }
}

- (void)_setWallpaper:(id)a3 forHomeKitIdentifier:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "Setting wallpaper %@ for HomeKit object %@", (uint8_t *)&v13, 0x16u);
  }

  id v9 = [(HFWallpaperManager *)self wallpapersCache];
  [v9 setObject:v6 forKey:v7];

  id v10 = [(HFWallpaperManager *)self userDefaults];
  int v11 = [v6 dictionaryRepresentation];
  id v12 = [v7 UUIDString];
  [v10 setObject:v11 forKey:v12];

  [(HFWallpaperManager *)self _logUserMetricsAfterSettingWallpaper];
}

- (void)_setImageCacheForWallpaper:(id)a3 image:(id)a4 forHomeKitIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(HFWallpaperManager *)self imageCache];
  [v9 saveVariantsForWallpaper:v7 originalImage:v8];

  id v10 = (void *)MEMORY[0x263F086D0];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __76__HFWallpaperManager__setImageCacheForWallpaper_image_forHomeKitIdentifier___block_invoke;
  v16[3] = &unk_26408D388;
  v16[4] = self;
  id v17 = v8;
  id v18 = v7;
  id v11 = v7;
  id v12 = v8;
  int v13 = [v10 blockOperationWithBlock:v16];
  [v13 setQueuePriority:0];
  [v13 setQualityOfService:17];
  id v14 = [MEMORY[0x263F42628] defaultScheduler];
  id v15 = (id)[v14 performOperation:v13];
}

void __76__HFWallpaperManager__setImageCacheForWallpaper_image_forHomeKitIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fileManager];
  [v2 saveOriginalImage:*(void *)(a1 + 40) forWallpaper:*(void *)(a1 + 48)];
}

- (void)_logUserMetricsAfterSettingWallpaper
{
  v17[2] = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  id v2 = [(HFWallpaperManager *)self userDefaults];
  uint64_t v3 = [v2 persistentDomainForName:@"com.apple.Home.wallpaper"];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__HFWallpaperManager__logUserMetricsAfterSettingWallpaper__block_invoke;
  v7[3] = &unk_26409B3F0;
  v7[4] = &v12;
  v7[5] = &v8;
  [v3 enumerateKeysAndObjectsUsingBlock:v7];

  v16[0] = @"NamedWallpaperCount";
  uint64_t v4 = [NSNumber numberWithInteger:v13[3]];
  v16[1] = @"CustomWallpaperCount";
  v17[0] = v4;
  int v5 = [NSNumber numberWithInteger:v9[3]];
  v17[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  +[HFAnalytics sendEvent:32 withData:v6];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

void __58__HFWallpaperManager__logUserMetricsAfterSettingWallpaper__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  objc_opt_class();
  id v10 = v4;
  if (objc_opt_isKindOfClass()) {
    int v5 = v10;
  }
  else {
    int v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id v7 = [[HFWallpaper alloc] initWithDictionary:v6];
    unint64_t v8 = [(HFWallpaper *)v7 type];
    if (v8 <= 6)
    {
      if (((1 << v8) & 0x3D) != 0) {
        uint64_t v9 = *(void *)(a1 + 32);
      }
      else {
        uint64_t v9 = *(void *)(a1 + 40);
      }
      ++*(void *)(*(void *)(v9 + 8) + 24);
    }
  }
}

- (void)_dispatchWallpaperChangedforHomeKitObject:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke;
  block[3] = &unk_26408DDE0;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 32);
    id v3 = +[HFHomeKitDispatcher sharedDispatcher];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_2;
    v13[3] = &unk_26408CDA0;
    id v4 = &v14;
    id v14 = v2;
    id v5 = v2;
    id v6 = v13;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    id v7 = *(id *)(a1 + 32);
    id v3 = +[HFHomeKitDispatcher sharedDispatcher];
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    id v10 = __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_3;
    uint64_t v11 = &unk_26408CDA0;
    id v4 = &v12;
    id v12 = v7;
    id v5 = v7;
    id v6 = &v8;
  }
  objc_msgSend(v3, "dispatchHomeObserverMessage:sender:", v6, 0, v8, v9, v10, v11);
}

void __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 homeDidUpdateWallpaper:*(void *)(a1 + 32)];
  }
}

void __64__HFWallpaperManager__dispatchWallpaperChangedforHomeKitObject___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 32) home];
    [v4 home:v3 didUpdateWallpaperForRoom:*(void *)(a1 + 32)];
  }
}

- (void)_pruneUnusedWallpapers
{
  id v3 = +[HFHomeKitDispatcher sharedDispatcher];
  id v4 = [v3 allHomesFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke;
  v6[3] = &unk_264093558;
  v6[4] = self;
  id v5 = (id)[v4 addSuccessBlock:v6];
}

void __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = a2;
  id v5 = [v3 set];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_2;
  v14[3] = &unk_26409B3C8;
  id v6 = v5;
  id v15 = v6;
  objc_msgSend(v4, "na_each:", v14);

  id v7 = (void *)MEMORY[0x263F086D0];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_4;
  v12[3] = &unk_26408D450;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 blockOperationWithBlock:v12];
  [v9 setQueuePriority:-8];
  [v9 setQualityOfService:9];
  id v10 = [MEMORY[0x263F42628] defaultScheduler];
  id v11 = (id)[v10 performOperation:v9];
}

void __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 uniqueIdentifier];
  id v6 = [v5 UUIDString];
  id v7 = (void *)[v6 copy];
  [v3 addObject:v7];

  id v8 = objc_msgSend(v4, "hf_allRooms");

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_3;
  v9[3] = &unk_26409B3A0;
  id v10 = *(id *)(a1 + 32);
  objc_msgSend(v8, "na_each:", v9);
}

void __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v5 = [a2 uniqueIdentifier];
  id v3 = [v5 UUIDString];
  id v4 = (void *)[v3 copy];
  [v2 addObject:v4];
}

uint64_t __44__HFWallpaperManager__pruneUnusedWallpapers__block_invoke_4(uint64_t a1)
{
  id v2 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_20B986000, v2, OS_LOG_TYPE_DEFAULT, "Pruning unused wallpapers...", v4, 2u);
  }

  return [*(id *)(a1 + 32) _pruneUnusedWallpapersWithExistingHomeKitIdentifiers:*(void *)(a1 + 40)];
}

- (void)_pruneUnusedWallpapersWithExistingHomeKitIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  id v6 = [(HFWallpaperManager *)self userDefaults];
  id v7 = [v6 persistentDomainForName:@"com.apple.Home.wallpaper"];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke;
  v12[3] = &unk_26409B418;
  id v13 = v4;
  id v14 = v5;
  id v15 = self;
  id v8 = v5;
  id v9 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v12];

  id v10 = [(HFWallpaperManager *)self fileManager];
  [v10 pruneUnusedOriginalWallpaperImages:v8];

  id v11 = [(HFWallpaperManager *)self imageCache];
  [v11 pruneUnusedWallpaperVariants:v8];
}

void __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
  if (v7)
  {
    if ([a1[4] containsObject:v5])
    {
      objc_opt_class();
      id v8 = v6;
      if (objc_opt_isKindOfClass()) {
        id v9 = v8;
      }
      else {
        id v9 = 0;
      }
      id v10 = v9;

      if (v10)
      {
        id v11 = [[HFWallpaper alloc] initWithDictionary:v10];
        objc_msgSend(a1[5], "na_safeAddObject:", v11);
      }
    }
    else
    {
      id v12 = [a1[6] wallpapersCache];
      id v13 = [v12 objectForKey:v7];

      if (v13)
      {
        id v14 = [a1[6] wallpapersCache];
        v17[0] = MEMORY[0x263EF8330];
        v17[1] = 3221225472;
        v17[2] = __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke_2;
        void v17[3] = &unk_264096B80;
        id v18 = v7;
        id v15 = v5;
        id v16 = a1[6];
        id v19 = v15;
        id v20 = v16;
        [v14 performBlockWithWriteLock:v17];
      }
    }
  }
}

void __75__HFWallpaperManager__pruneUnusedWallpapersWithExistingHomeKitIdentifiers___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v5 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Pruning wallpaper data for unknown HomeKit identifier %@", (uint8_t *)&v8, 0xCu);
  }

  id v7 = [*(id *)(a1 + 48) userDefaults];
  [v7 removeObjectForKey:*(void *)(a1 + 40)];

  if (v4) {
    [v3 removeObjectForKey:*(void *)(a1 + 32)];
  }
}

- (id)_originalImageForWallpaper:(id)a3 forProcessingGenerator:(BOOL)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4 && [v6 type] == 6)
  {
    int v8 = [HFWallpaper alloc];
    uint64_t v9 = [v7 assetIdentifier];
    uint64_t v10 = [v7 cropInfo];
    uint64_t v11 = [(HFWallpaper *)v8 initWithType:1 assetIdentifier:v9 cropInfo:v10];

    id v7 = (void *)v11;
  }
  id v12 = [(HFWallpaperManager *)self fileManager];
  int v13 = [v12 originalImageExistsForWallpaper:v7];

  if (v13)
  {
    id v14 = [(HFWallpaperManager *)self fileManager];
    id v15 = [v14 originalImageForWallpaper:v7];

    if (v15) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (![v7 type]
    || [v7 type] == 2
    || [v7 type] == 3
    || [v7 type] == 4
    || [v7 type] == 5)
  {
LABEL_12:
    id v15 = [(HFWallpaperManager *)self _originalImageFromNamedWallpaperSourceForWallpaper:v7];
    goto LABEL_13;
  }
  NSLog(&cfstr_UnableToLoadOr_0.isa, v7);
  id v15 = 0;
LABEL_13:

  return v15;
}

- (id)_originalImageFromNamedWallpaperSourceForWallpaper:(id)a3
{
  id v4 = a3;
  id v5 = [(HFWallpaperManager *)self namedWallpaperSource];
  id v6 = [v5 imageForWallpaper:v4];

  id v7 = [v4 assetIdentifier];
  char v8 = [v7 containsString:@"_Thumbnail"];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = (void *)MEMORY[0x263F086D0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__HFWallpaperManager__originalImageFromNamedWallpaperSourceForWallpaper___block_invoke;
    v14[3] = &unk_26408D388;
    void v14[4] = self;
    id v15 = v6;
    id v16 = v4;
    uint64_t v10 = [v9 blockOperationWithBlock:v14];
    [v10 setQueuePriority:4];
    [v10 setQualityOfService:17];
    uint64_t v11 = [MEMORY[0x263F42628] defaultScheduler];
    id v12 = (id)[v11 performOperation:v10];
  }
  return v6;
}

void __73__HFWallpaperManager__originalImageFromNamedWallpaperSourceForWallpaper___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fileManager];
  [v2 saveOriginalImage:*(void *)(a1 + 40) forWallpaper:*(void *)(a1 + 48)];
}

- (BOOL)wallpaperSourceRegistered
{
  return self->_wallpaperSourceRegistered;
}

- (void)setWallpapersCache:(id)a3
{
}

- (void)setUserDefaults:(id)a3
{
}

- (HFNamedWallpaperSource)namedWallpaperSource
{
  return self->_namedWallpaperSource;
}

- (void)setImageCache:(id)a3
{
}

- (HFWallpaperLegacyFileManager)legacyFileManager
{
  return self->_legacyFileManager;
}

- (void)setLegacyFileManager:(id)a3
{
}

- (void)setFileManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_legacyFileManager, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_namedWallpaperSource, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_wallpapersCache, 0);
}

@end