@interface AXSDDetectorStore
+ (id)sharedInstance;
- (AXSDDetectorStore)init;
- (BOOL)_areKShotDetectorsReady;
- (BOOL)_areStandardDetectorsReady;
- (BOOL)areDetectorsReady;
- (BOOL)hasInProgressDownloads;
- (BOOL)isAssetCatalogInstalled;
- (NSMutableArray)purgedDetectors;
- (NSMutableDictionary)detectors;
- (NSString)description;
- (id)_addDetectorForAXAsset:(id)a3;
- (id)_detectorWithIdentifier:(id)a3;
- (id)_detectorWithName:(id)a3;
- (id)_detectorsNeedingUpgrade;
- (id)allDetectors;
- (id)allDetectorsByIdentifier;
- (id)customDetectors;
- (id)detectorWithAssetID:(id)a3;
- (id)detectorWithIdentifier:(id)a3;
- (id)detectorWithName:(id)a3;
- (id)detectorsByIdentifier;
- (id)enabledDetectors;
- (id)installedDetectors;
- (id)localizedNamesByIdentifier;
- (id)supportedDetectors;
- (id)unInstalledDetectors;
- (int64_t)totalDownloadSize;
- (int64_t)totalUnarchivedFileSize;
- (unint64_t)numberOfObservers;
- (void)_createSDDetectors;
- (void)_downloadAssetsFromDetectors:(id)a3;
- (void)_enumerateObserversWithBlock:(id)a3;
- (void)_notifyObserversAvailableDetectorsDidUpdate:(id)a3;
- (void)_notifyObserversDetectorsAreReady;
- (void)_notifyObserversDetectorsDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 remainingTimeExpected:(double)a5 isStalled:(BOOL)a6;
- (void)_notifyObserversDetectorsDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 remainingTimeExpected:(double)a5 isStalled:(BOOL)a6 error:(id)a7;
- (void)_notifyObserversDetectorsNeedUpdate:(id)a3 toDetectors:(id)a4;
- (void)_notifyObserversDidFinishPurgingDetectors:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5;
- (void)_notifyObserversDidFinishRefreshingDetectors:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5;
- (void)_purgeAssetsFromDetectors:(id)a3;
- (void)_reloadCustomDetectors;
- (void)_removeCustomDetectors;
- (void)addObserver:(id)a3;
- (void)assetManager:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetManager:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetManager:(id)a3 totalSizeExpected:(int64_t)a4 downloadProgressTotalWritten:(int64_t)a5 remainingTimeExpected:(double)a6 isStalled:(BOOL)a7;
- (void)disableDetector:(id)a3;
- (void)disableDetectorWithIdentifier:(id)a3;
- (void)downloadDetectors;
- (void)enableDetector:(id)a3;
- (void)enableDetectorWithIdentifier:(id)a3;
- (void)loadDetectors;
- (void)purgeDetectors;
- (void)removeObserver:(id)a3;
- (void)setDetectors:(id)a3;
- (void)setPurgedDetectors:(id)a3;
- (void)stopDownloadOfDetectors;
@end

@implementation AXSDDetectorStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_SharedSettings;
  return v2;
}

uint64_t __35__AXSDDetectorStore_sharedInstance__block_invoke()
{
  sharedInstance_SharedSettings = objc_alloc_init(AXSDDetectorStore);
  return MEMORY[0x270F9A758]();
}

- (AXSDDetectorStore)init
{
  v16.receiver = self;
  v16.super_class = (Class)AXSDDetectorStore;
  v2 = [(AXSDDetectorStore *)&v16 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08A88] weakObjectsPointerArray];
    observers = v2->_observers;
    v2->_observers = (NSPointerArray *)v3;

    uint64_t v5 = objc_opt_new();
    detectors = v2->_detectors;
    v2->_detectors = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    purgedDetectors = v2->_purgedDetectors;
    v2->_purgedDetectors = (NSMutableArray *)v7;

    uint64_t v9 = +[AXUltronModelAssetManager sharedInstance];
    assetManager = v2->_assetManager;
    v2->_assetManager = (AXUltronModelAssetManager *)v9;

    [(AXUltronModelAssetManager *)v2->_assetManager addObserver:v2];
    objc_initWeak(&location, v2);
    v11 = [MEMORY[0x263F21DA0] sharedInstance];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __25__AXSDDetectorStore_init__block_invoke;
    v13[3] = &unk_2647F47F8;
    objc_copyWeak(&v14, &location);
    [v11 registerUpdateBlock:v13 forRetrieveSelector:sel_kShotDetectors withListener:v2];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __25__AXSDDetectorStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadCustomDetectors];
}

- (int64_t)totalDownloadSize
{
  v2 = +[AXUltronModelAssetManager sharedInstance];
  int64_t v3 = [v2 totalSizeExpected];

  return v3;
}

- (int64_t)totalUnarchivedFileSize
{
  v2 = +[AXUltronModelAssetManager sharedInstance];
  int64_t v3 = [v2 totalSizeOccupied];

  return v3;
}

- (unint64_t)numberOfObservers
{
  [(NSPointerArray *)self->_observers compact];
  observers = self->_observers;
  return [(NSPointerArray *)observers count];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorStore addObserver:]((uint64_t)v4, v5);
  }

  [(NSPointerArray *)self->_observers addPointer:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogUltron();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[AXSDDetectorStore removeObserver:]((uint64_t)v4, v5);
  }

  if ([(NSPointerArray *)self->_observers count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      id v7 = [(NSPointerArray *)self->_observers pointerAtIndex:v6];
      if (v7 == v4) {
        break;
      }

      if (++v6 >= [(NSPointerArray *)self->_observers count]) {
        goto LABEL_9;
      }
    }
    [(NSPointerArray *)self->_observers replacePointerAtIndex:v6 withPointer:0];
  }
LABEL_9:
  [(NSPointerArray *)self->_observers compact];
}

- (BOOL)isAssetCatalogInstalled
{
  v2 = +[AXUltronModelAssetManager sharedInstance];
  char v3 = [v2 isAssetCatalogInstalled];

  return v3;
}

- (BOOL)areDetectorsReady
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXSDDetectorStore *)self _areKShotDetectorsReady];
  if (AXIsSoundDetectionMedinaSupportEnabled())
  {
    id v4 = AXLogUltron();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [NSNumber numberWithBool:v3];
      int v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_226F20000, v4, OS_LOG_TYPE_INFO, "Medina is Enabled. Are KShot Detectors Ready: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    BOOL v6 = [(AXSDDetectorStore *)self _areStandardDetectorsReady];
    id v7 = AXLogUltron();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [NSNumber numberWithBool:v3];
      uint64_t v9 = [NSNumber numberWithBool:v6];
      int v11 = 138412546;
      v12 = v8;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_226F20000, v7, OS_LOG_TYPE_INFO, "Are KShot Detectors Ready: %@. Are Standard Detectors Ready: %@.", (uint8_t *)&v11, 0x16u);
    }
    LOBYTE(v3) = v3 && v6;
  }
  return v3;
}

- (BOOL)_areStandardDetectorsReady
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  BOOL v3 = [MEMORY[0x263F21DA0] sharedInstance];
  id v4 = [v3 supportedSoundDetectionTypes];

  uint64_t v5 = [(AXSDDetectorStore *)self detectorsByIdentifier];
  if ([v4 count]
    && ([v5 allValues],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 count],
        v6,
        v7))
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
LABEL_5:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        __int16 v13 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v17 + 1) + 8 * v12), (void)v17);
        id v14 = v13;
        if (!v13) {
          break;
        }
        int v15 = [v13 isInstalled];

        if (!v15)
        {
          LOBYTE(v14) = 0;
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
          LOBYTE(v14) = 1;
          if (v10) {
            goto LABEL_5;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return (char)v14;
}

- (BOOL)_areKShotDetectorsReady
{
  v18[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F21D00];
  v18[0] = *MEMORY[0x263F21CF8];
  v18[1] = v3;
  v18[2] = *MEMORY[0x263F21CF0];
  [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = -[AXSDDetectorStore detectorWithName:](self, "detectorWithName:", *(void *)(*((void *)&v13 + 1) + 8 * v8), (void)v13);
      uint64_t v10 = v9;
      if (!v9) {
        break;
      }
      int v11 = [v9 isInstalled];

      if (!v11)
      {
        LOBYTE(v10) = 0;
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        LOBYTE(v10) = 1;
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return (char)v10;
}

- (BOOL)hasInProgressDownloads
{
  return [(AXUltronModelAssetManager *)self->_assetManager hasInProgressDownloads];
}

- (void)loadDetectors
{
  if (AXIsSoundDetectionMedinaSupportEnabled()) {
    [(AXSDDetectorStore *)self _createSDDetectors];
  }
  [(AXUltronModelAssetManager *)self->_assetManager refresh];
  [(AXSDDetectorStore *)self _reloadCustomDetectors];
}

- (void)_createSDDetectors
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  AXSDSoundDetectionCategories();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v16)
  {
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(obj);
        }
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v4 = AXSDSoundDetectionTypesForCategory();
        uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v5)
        {
          uint64_t v6 = v5;
          uint64_t v7 = *(void *)v18;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v18 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
              uint64_t v10 = [(AXSDDetectorStore *)self detectors];
              int v11 = [v10 objectForKey:v9];

              if (!v11)
              {
                uint64_t v12 = [[AXSDDetector alloc] initWithIdentifier:v9 andName:v9];
                long long v13 = [(AXSDDetectorStore *)self detectors];
                [v13 setObject:v12 forKey:v9];
              }
              ++v8;
            }
            while (v6 != v8);
            uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v6);
        }

        ++v3;
      }
      while (v3 != v16);
      uint64_t v16 = [obj countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v16);
  }
}

- (void)_removeCustomDetectors
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(AXSDDetectorStore *)self customDetectors];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
        uint64_t v9 = [(AXSDDetectorStore *)self detectors];
        uint64_t v10 = [v8 identifier];
        [v9 removeObjectForKey:v10];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_reloadCustomDetectors
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(AXSDDetectorStore *)self _removeCustomDetectors];
  uint64_t v3 = [MEMORY[0x263F21DA0] sharedInstance];
  uint64_t v4 = [v3 decodedKShotDetectors];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = objc_msgSend(v5, "objectForKey:", v10, (void)v13);
        long long v12 = [(AXSDDetectorStore *)self detectors];
        [v12 setObject:v11 forKey:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (void)downloadDetectors
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(AXSDDetectorStore *)self unInstalledDetectors];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        long long v11 = [v3 objectForKey:v10];

        if (!v11 || [v11 isOlderThanDetector:v9])
        {
          long long v12 = [v9 identifier];
          [v3 setObject:v9 forKey:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
  long long v13 = [v3 allValues];
  [(AXSDDetectorStore *)self _downloadAssetsFromDetectors:v13];
}

- (void)stopDownloadOfDetectors
{
}

- (void)_downloadAssetsFromDetectors:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = +[AXUltronModelAssetManager sharedInstance];
  int v5 = [v4 hasInProgressDownloads];

  if (v5)
  {
    uint64_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = (id)objc_opt_class();
      id v7 = v30;
      uint64_t v8 = "[%@]: not downloading detectors as there are already downloads in progress";
LABEL_24:
      _os_log_impl(&dword_226F20000, v6, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
    }
  }
  else if (v3 && [v3 count])
  {
    uint64_t v6 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v24 = v3;
    id v9 = v3;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          if (([v14 isCustom] & 1) == 0)
          {
            long long v15 = [v14 model];

            if (v15)
            {
              long long v16 = [v14 model];
              [v6 addObject:v16];
            }
            else
            {
              long long v16 = AXLogUltron();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                long long v17 = objc_opt_class();
                id v18 = v17;
                uint64_t v19 = [v14 model];
                *(_DWORD *)buf = 138412546;
                id v30 = v17;
                __int16 v31 = 2112;
                id v32 = v19;
                _os_log_error_impl(&dword_226F20000, v16, OS_LOG_TYPE_ERROR, "[%@]: candidate detector for download has no asset: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v11);
    }

    long long v20 = AXLogUltron();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      long long v21 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v30 = v21;
      __int16 v31 = 2112;
      id v32 = v9;
      id v22 = v21;
      _os_log_impl(&dword_226F20000, v20, OS_LOG_TYPE_INFO, "[%@]: Downloading assets that need upgrading: %@", buf, 0x16u);
    }
    long long v23 = +[AXUltronModelAssetManager sharedInstance];
    [v23 downloadAssets:v6];

    id v3 = v24;
  }
  else
  {
    uint64_t v6 = AXLogUltron();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = (id)objc_opt_class();
      id v7 = v30;
      uint64_t v8 = "[%@]: no detectors to download.";
      goto LABEL_24;
    }
  }
}

- (void)purgeDetectors
{
  id v3 = [(AXSDDetectorStore *)self installedDetectors];
  objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_13);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  [(AXSDDetectorStore *)self _purgeAssetsFromDetectors:v4];
}

BOOL __35__AXSDDetectorStore_purgeDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCustom])
  {
    BOOL v3 = 0;
  }
  else
  {
    id v4 = [v2 model];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (void)_purgeAssetsFromDetectors:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v31;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v31 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * v10++) setIsEnabled:0];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v39 count:16];
      }
      while (v8);
    }

    uint64_t v11 = objc_msgSend(v6, "ax_mappedArrayUsingBlock:", &__block_literal_global_16);
    uint64_t v12 = +[AXUltronModelAssetManager sharedInstance];
    [v12 stopDownloadingAssets];

    long long v13 = AXLogUltron();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v14 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v36 = v14;
      __int16 v37 = 2112;
      id v38 = v6;
      id v15 = v14;
      _os_log_impl(&dword_226F20000, v13, OS_LOG_TYPE_INFO, "[%@]: Purging assets that are no longer needed: %@", buf, 0x16u);
    }
    long long v16 = +[AXUltronModelAssetManager sharedInstance];
    [v16 purgeAssets:v11];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v17 = v11;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v27;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v27 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = *(void **)(*((void *)&v26 + 1) + 8 * v21);
          long long v23 = [(AXSDDetectorStore *)self detectors];
          id v24 = [v22 assetId];
          [v23 removeObjectForKey:v24];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v19);
    }
  }
  else
  {
    long long v17 = AXLogUltron();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = (id)objc_opt_class();
      id v25 = v36;
      _os_log_impl(&dword_226F20000, v17, OS_LOG_TYPE_INFO, "[%@]: no detectors to purge.", buf, 0xCu);
    }
  }
}

id __47__AXSDDetectorStore__purgeAssetsFromDetectors___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCustom])
  {
    BOOL v3 = 0;
  }
  else
  {
    BOOL v3 = [v2 model];
  }

  return v3;
}

- (id)_detectorsNeedingUpgrade
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  BOOL v3 = [(AXSDDetectorStore *)self unInstalledDetectors];
  id v4 = [(AXSDDetectorStore *)self detectorsByIdentifier];
  int v5 = objc_opt_new();
  id v6 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v22;
    *(void *)&long long v9 = 138412546;
    long long v20 = v9;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "identifier", v20);
        id v15 = [v4 objectForKey:v14];

        if (!v15)
        {
          long long v16 = AXLogUltron();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            long long v28 = v13;
            _os_log_impl(&dword_226F20000, v16, OS_LOG_TYPE_INFO, "No installed detector found. %@ needs to be installed.", buf, 0xCu);
          }

          [v6 addObject:v13];
          [v13 setNeedsUpdate:1];
        }
        if ([v15 isOlderThanDetector:v13]
          && [v15 isCompatiable])
        {
          long long v17 = AXLogUltron();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v20;
            long long v28 = v15;
            __int16 v29 = 2112;
            long long v30 = v13;
            _os_log_impl(&dword_226F20000, v17, OS_LOG_TYPE_INFO, "Installed Detector: %@ needs upgrade to: %@", buf, 0x16u);
          }

          [v5 addObject:v15];
          [v6 addObject:v13];
          [v15 setNeedsUpdate:1];
        }
      }
      uint64_t v10 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v10);
  }

  v25[0] = @"old";
  v25[1] = @"new";
  v26[0] = v5;
  v26[1] = v6;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];

  return v18;
}

- (id)detectorWithIdentifier:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v5 = [(AXSDDetectorStore *)self customDetectors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        char v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v16 = v10;
          goto LABEL_15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  if (!AXIsSoundDetectionMedinaSupportEnabled()) {
    goto LABEL_13;
  }
  uint64_t v13 = AXSDSoundDetectionTypeForIdentifier();
  if (v13)
  {
    int v5 = (void *)v13;
    long long v14 = [(AXSDDetectorStore *)self detectors];
    id v15 = [v14 objectForKey:v5];

    if (v15)
    {

LABEL_13:
      id v16 = [(AXSDDetectorStore *)self _detectorWithIdentifier:v4];
      goto LABEL_16;
    }
    [(AXSDDetectorStore *)self _createSDDetectors];
    uint64_t v19 = [(AXSDDetectorStore *)self detectors];
    id v16 = [v19 objectForKey:v5];

LABEL_15:
  }
  else
  {
    uint64_t v18 = AXLogUltron();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[AXSDDetectorStore detectorWithIdentifier:]((uint64_t)v4, v18);
    }

    id v16 = 0;
  }
LABEL_16:

  return v16;
}

- (id)_detectorWithIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [(AXSDDetectorStore *)self installedDetectors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        char v12 = [v11 identifier];
        int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v8);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v14 = v5;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    id v17 = 0;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v14);
        }
        long long v20 = *(void **)(*((void *)&v23 + 1) + 8 * j);
        if (v17)
        {
          if (objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * j), "isEnabled", (void)v23)
            || [v17 isOlderThanDetector:v20])
          {
            id v21 = v20;

            id v17 = v21;
          }
        }
        else
        {
          id v17 = v20;
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v16);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)detectorWithName:(id)a3
{
  id v4 = a3;
  if (AXIsSoundDetectionMedinaSupportEnabled()) {
    [(AXSDDetectorStore *)self _createSDDetectors];
  }
  int v5 = [(AXSDDetectorStore *)self _detectorWithName:v4];

  return v5;
}

- (id)_detectorWithName:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v5 = [(AXSDDetectorStore *)self detectors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * v9);
      uint64_t v11 = [(AXSDDetectorStore *)self detectors];
      char v12 = [v11 objectForKey:v10];

      int v13 = [v12 name];
      char v14 = [v13 isEqualToString:v4];

      if (v14) {
        break;
      }

      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    char v12 = 0;
  }

  return v12;
}

- (id)detectorWithAssetID:(id)a3
{
  id v4 = a3;
  int v5 = [(AXSDDetectorStore *)self detectors];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)allDetectors
{
  id v2 = [(AXSDDetectorStore *)self detectors];
  BOOL v3 = [v2 allValues];

  return v3;
}

- (id)supportedDetectors
{
  id v2 = [(AXSDDetectorStore *)self detectors];
  BOOL v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_23);

  return v4;
}

uint64_t __39__AXSDDetectorStore_supportedDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCustom]) {
    uint64_t v3 = [v2 isModelReady];
  }
  else {
    uint64_t v3 = 1;
  }

  return v3;
}

- (id)installedDetectors
{
  id v2 = [(AXSDDetectorStore *)self detectors];
  uint64_t v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_25);

  return v4;
}

uint64_t __39__AXSDDetectorStore_installedDetectors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled];
}

- (id)unInstalledDetectors
{
  id v2 = [(AXSDDetectorStore *)self detectors];
  uint64_t v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_27);

  return v4;
}

uint64_t __41__AXSDDetectorStore_unInstalledDetectors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isInstalled] ^ 1;
}

- (id)customDetectors
{
  id v2 = [(AXSDDetectorStore *)self detectors];
  uint64_t v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_29);

  return v4;
}

uint64_t __36__AXSDDetectorStore_customDetectors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isCustom];
}

- (id)enabledDetectors
{
  id v2 = [(AXSDDetectorStore *)self detectors];
  uint64_t v3 = [v2 allValues];
  id v4 = objc_msgSend(v3, "ax_filteredArrayUsingBlock:", &__block_literal_global_31);

  return v4;
}

uint64_t __37__AXSDDetectorStore_enabledDetectors__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEnabled];
}

- (id)_addDetectorForAXAsset:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [[AXSDDetector alloc] initWithModel:v4];
  detectors = self->_detectors;
  uint64_t v7 = [v4 assetId];
  [(NSMutableDictionary *)detectors setObject:v5 forKey:v7];

  if ((AXIsSoundDetectionMedinaSupportEnabled() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F21148] store];
    uint64_t v9 = [MEMORY[0x263F21188] ultronAssetType];
    uint64_t v10 = [v8 valueForKey:@"AXUltronAssetsInUse" forAssetType:v9];
    uint64_t v11 = (void *)[v10 mutableCopy];

    if (!v11) {
      uint64_t v11 = objc_opt_new();
    }
    char v12 = [(AXSDDetector *)v5 identifier];
    int v13 = [v11 objectForKey:v12];

    if (v13)
    {
      char v14 = [v4 assetId];
      int v15 = [v13 isEqualToString:v14];

      if (v15)
      {
        long long v16 = AXLogUltron();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          long long v17 = objc_opt_class();
          id v18 = v17;
          long long v19 = [(AXSDDetector *)v5 identifier];
          int v21 = 138412802;
          long long v22 = v17;
          __int16 v23 = 2112;
          long long v24 = v13;
          __int16 v25 = 2112;
          long long v26 = v19;
          _os_log_impl(&dword_226F20000, v16, OS_LOG_TYPE_INFO, "[%@]: found asset id in metadata store: %@. setting detector: %@ to enabled", (uint8_t *)&v21, 0x20u);
        }
        [(AXSDDetector *)v5 setIsEnabled:1];
      }
    }
  }
  return v5;
}

- (id)allDetectorsByIdentifier
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(AXSDDetectorStore *)self detectors];
  int v5 = [v4 allValues];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 identifier];
        char v12 = [v3 objectForKey:v11];
        if (!v12) {
          char v12 = objc_opt_new();
        }
        [v12 addObject:v10];
        [v3 setObject:v12 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)detectorsByIdentifier
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  int v5 = [(AXSDDetectorStore *)self allDetectorsByIdentifier];
  uint64_t v6 = [v5 allKeys];
  uint64_t v7 = (void *)[v4 initWithArray:v6];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        long long v14 = -[AXSDDetectorStore detectorWithIdentifier:](self, "detectorWithIdentifier:", v13, (void)v16);
        if (v14) {
          [v3 setObject:v14 forKey:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  return v3;
}

- (id)localizedNamesByIdentifier
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F21DA0] sharedInstance];
  id v4 = [v3 supportedSoundDetectionTypes];

  int v5 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        char v12 = AXSDSoundDetectionLocalizedTitleForType();
        [v5 setValue:v12 forKey:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [(AXSDDetectorStore *)self customDetectors];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        long long v19 = [v18 identifier];
        long long v20 = [v18 name];
        [v5 setValue:v20 forKey:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v15);
  }

  return v5;
}

- (void)enableDetector:(id)a3
{
  id v4 = a3;
  int v5 = [(AXSDDetectorStore *)self detectors];
  id v6 = [v4 model];
  uint64_t v7 = [v6 assetId];
  uint64_t v8 = [v5 objectForKey:v7];
  [v8 setIsEnabled:1];

  id v9 = [MEMORY[0x263F21DA0] sharedInstance];
  [v9 setDetectorIsEnabled:v4 isEnabled:1];
}

- (void)enableDetectorWithIdentifier:(id)a3
{
  id v4 = [(AXSDDetectorStore *)self detectorWithIdentifier:a3];
  [(AXSDDetectorStore *)self enableDetector:v4];
}

- (void)disableDetector:(id)a3
{
  id v4 = a3;
  int v5 = [(AXSDDetectorStore *)self detectors];
  id v6 = [v4 model];
  uint64_t v7 = [v6 assetId];
  uint64_t v8 = [v5 objectForKey:v7];
  [v8 setIsEnabled:0];

  id v9 = [MEMORY[0x263F21DA0] sharedInstance];
  [v9 setDetectorIsEnabled:v4 isEnabled:0];
}

- (void)disableDetectorWithIdentifier:(id)a3
{
  id v4 = [(AXSDDetectorStore *)self detectorWithIdentifier:a3];
  [(AXSDDetectorStore *)self disableDetector:v4];
}

- (void)_enumerateObserversWithBlock:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  [(NSPointerArray *)self->_observers compact];
  int v5 = [(NSPointerArray *)self->_observers allObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
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
        if (*(void *)(*((void *)&v10 + 1) + 8 * v9)) {
          v4[2](v4);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_notifyObserversAvailableDetectorsDidUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__AXSDDetectorStore__notifyObserversAvailableDetectorsDidUpdate___block_invoke;
  v6[3] = &unk_2647F4860;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AXSDDetectorStore *)self _enumerateObserversWithBlock:v6];
}

void __65__AXSDDetectorStore__notifyObserversAvailableDetectorsDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorStore:*(void *)(a1 + 32) availableDetectorsDidUpdate:*(void *)(a1 + 40)];
  }
}

- (void)_notifyObserversDetectorsNeedUpdate:(id)a3 toDetectors:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__AXSDDetectorStore__notifyObserversDetectorsNeedUpdate_toDetectors___block_invoke;
  v10[3] = &unk_2647F4888;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AXSDDetectorStore *)self _enumerateObserversWithBlock:v10];
}

void __69__AXSDDetectorStore__notifyObserversDetectorsNeedUpdate_toDetectors___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorStore:a1[4] detectorsNeedUpdate:a1[5] toDetectors:a1[6]];
  }
}

- (void)_notifyObserversDidFinishRefreshingDetectors:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__AXSDDetectorStore__notifyObserversDidFinishRefreshingDetectors_wasSuccessful_error___block_invoke;
  v12[3] = &unk_2647F48B0;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AXSDDetectorStore *)self _enumerateObserversWithBlock:v12];
}

void __86__AXSDDetectorStore__notifyObserversDidFinishRefreshingDetectors_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorStore:*(void *)(a1 + 32) didFinishRefreshingDetectors:*(void *)(a1 + 40) wasSuccessful:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  }
}

- (void)_notifyObserversDetectorsAreReady
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __54__AXSDDetectorStore__notifyObserversDetectorsAreReady__block_invoke;
  v2[3] = &unk_2647F48D8;
  v2[4] = self;
  [(AXSDDetectorStore *)self _enumerateObserversWithBlock:v2];
}

void __54__AXSDDetectorStore__notifyObserversDetectorsAreReady__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorsReadyForDetectorStore:*(void *)(a1 + 32)];
  }
}

- (void)_notifyObserversDetectorsDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 remainingTimeExpected:(double)a5 isStalled:(BOOL)a6
{
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __113__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled___block_invoke;
  v6[3] = &unk_2647F4900;
  v6[4] = self;
  void v6[5] = a4;
  v6[6] = a3;
  *(double *)&v6[7] = a5;
  BOOL v7 = a6;
  [(AXSDDetectorStore *)self _enumerateObserversWithBlock:v6];
}

void __113__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorStore:*(void *)(a1 + 32) totalSizeExpected:*(void *)(a1 + 40) downloadProgressTotalWritten:*(void *)(a1 + 48) remainingTimeExpected:*(unsigned __int8 *)(a1 + 64) isStalled:*(double *)(a1 + 56)];
  }
}

- (void)_notifyObserversDetectorsDownloadProgress:(int64_t)a3 totalSizeExpected:(int64_t)a4 remainingTimeExpected:(double)a5 isStalled:(BOOL)a6 error:(id)a7
{
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __119__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled_error___block_invoke;
  v7[3] = &unk_2647F4900;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a3;
  *(double *)&v7[7] = a5;
  BOOL v8 = a6;
  -[AXSDDetectorStore _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v7, a4, a6, a7);
}

void __119__AXSDDetectorStore__notifyObserversDetectorsDownloadProgress_totalSizeExpected_remainingTimeExpected_isStalled_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorStore:*(void *)(a1 + 32) totalSizeExpected:*(void *)(a1 + 40) downloadProgressTotalWritten:*(void *)(a1 + 48) remainingTimeExpected:*(unsigned __int8 *)(a1 + 64) isStalled:*(double *)(a1 + 56)];
  }
}

- (void)_notifyObserversDidFinishPurgingDetectors:(id)a3 wasSuccessful:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __83__AXSDDetectorStore__notifyObserversDidFinishPurgingDetectors_wasSuccessful_error___block_invoke;
  v12[3] = &unk_2647F48B0;
  v12[4] = self;
  id v13 = v8;
  BOOL v15 = a4;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(AXSDDetectorStore *)self _enumerateObserversWithBlock:v12];
}

void __83__AXSDDetectorStore__notifyObserversDidFinishPurgingDetectors_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 detectorStore:*(void *)(a1 + 32) didFinishPurgingDetectors:*(void *)(a1 + 40) wasSuccessful:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
  }
}

- (void)assetManager:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  id v11 = AXLogUltron();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = objc_opt_class();
    id v13 = v12;
    *(_DWORD *)buf = 138413058;
    v46 = v12;
    __int16 v47 = 2048;
    uint64_t v48 = [v9 count];
    __int16 v49 = 1024;
    BOOL v50 = v7;
    __int16 v51 = 2112;
    id v52 = v10;
    _os_log_impl(&dword_226F20000, v11, OS_LOG_TYPE_INFO, "[%@]: assets did finish refreshing. assets: %lu - was successful: %d - error: %@", buf, 0x26u);
  }
  id v14 = objc_alloc(MEMORY[0x263EFF9C0]);
  BOOL v15 = [(NSMutableDictionary *)self->_detectors allKeys];
  uint64_t v16 = (void *)[v14 initWithArray:v15];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v17 = v9;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v41;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = [(AXSDDetectorStore *)self _addDetectorForAXAsset:*(void *)(*((void *)&v40 + 1) + 8 * v21++)];
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v19);
  }

  id v23 = objc_alloc(MEMORY[0x263EFF9C0]);
  long long v24 = [(NSMutableDictionary *)self->_detectors allKeys];
  long long v25 = (void *)[v23 initWithArray:v24];

  long long v26 = [(AXSDDetectorStore *)self detectors];
  long long v27 = [v26 allValues];
  [(AXSDDetectorStore *)self _notifyObserversDidFinishRefreshingDetectors:v27 wasSuccessful:v7 error:v10];

  long long v28 = [MEMORY[0x263F21DA0] sharedInstance];
  LODWORD(v26) = [v28 ultronSupportEnabled];

  if (v26)
  {
    [v25 minusSet:v16];
    if ([v25 count])
    {
      long long v29 = [(AXSDDetectorStore *)self detectors];
      long long v30 = [v29 allValues];
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __80__AXSDDetectorStore_assetManager_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
      v38[3] = &unk_2647F4928;
      id v39 = v25;
      long long v31 = objc_msgSend(v30, "ax_filteredArrayUsingBlock:", v38);

      [(AXSDDetectorStore *)self _notifyObserversAvailableDetectorsDidUpdate:v31];
    }
    uint64_t v32 = [(AXSDDetectorStore *)self _detectorsNeedingUpgrade];
    uint64_t v33 = [v32 objectForKey:@"new"];
    [(AXSDDetectorStore *)self _downloadAssetsFromDetectors:v33];

    uint64_t v34 = [v32 objectForKey:@"old"];
    v35 = [v32 objectForKey:@"new"];
    [(AXSDDetectorStore *)self _notifyObserversDetectorsNeedUpdate:v34 toDetectors:v35];

    id v36 = [(AXSDDetectorStore *)self installedDetectors];
    __int16 v37 = objc_msgSend(v36, "ax_filteredArrayUsingBlock:", &__block_literal_global_53);

    [(AXSDDetectorStore *)self _purgeAssetsFromDetectors:v37];
    if ([(AXSDDetectorStore *)self areDetectorsReady]) {
      [(AXSDDetectorStore *)self _notifyObserversDetectorsAreReady];
    }
  }
}

uint64_t __80__AXSDDetectorStore_assetManager_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 model];
  id v4 = [v3 assetId];
  uint64_t v5 = [v2 containsObject:v4];

  return v5;
}

uint64_t __80__AXSDDetectorStore_assetManager_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isCustom]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [v2 isCompatiable] ^ 1;
  }

  return v3;
}

- (void)assetManager:(id)a3 totalSizeExpected:(int64_t)a4 downloadProgressTotalWritten:(int64_t)a5 remainingTimeExpected:(double)a6 isStalled:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v12 = AXLogUltron();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v14 = 138413058;
    id v15 = (id)objc_opt_class();
    __int16 v16 = 2048;
    int64_t v17 = a5;
    __int16 v18 = 2048;
    int64_t v19 = a4;
    __int16 v20 = 1024;
    BOOL v21 = v7;
    id v13 = v15;
    _os_log_debug_impl(&dword_226F20000, v12, OS_LOG_TYPE_DEBUG, "[%@]: - download progress total written: %lld, totalExpected: %lld, isStalled: %d", (uint8_t *)&v14, 0x26u);
  }
  [(AXSDDetectorStore *)self _notifyObserversDetectorsDownloadProgress:a5 totalSizeExpected:a4 remainingTimeExpected:v7 isStalled:a6];
}

- (void)assetManager:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  id v11 = AXLogUltron();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    BOOL v21 = objc_opt_class();
    uint64_t v22 = NSNumber;
    id v23 = v21;
    long long v24 = [v22 numberWithBool:v7];
    *(_DWORD *)buf = 138413058;
    long long v31 = v21;
    __int16 v32 = 2112;
    id v33 = v9;
    __int16 v34 = 2112;
    v35 = v24;
    __int16 v36 = 2112;
    id v37 = v10;
    _os_log_debug_impl(&dword_226F20000, v11, OS_LOG_TYPE_DEBUG, "[%@]: - did finish purging assets: %@, was successful: %@, error: %@", buf, 0x2Au);
  }
  id v12 = objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v26;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v25 + 1) + 8 * v17);
        int64_t v19 = [AXSDDetector alloc];
        __int16 v20 = -[AXSDDetector initWithModel:](v19, "initWithModel:", v18, (void)v25);
        [v12 addObject:v20];

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
  }

  [(AXSDDetectorStore *)self _notifyObserversDidFinishPurgingDetectors:v12 wasSuccessful:v7 error:v10];
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(AXSDDetectorStore *)self detectors];
  id v6 = [v3 stringWithFormat:@"[%@]: Number of Detectors: %lu", v4, objc_msgSend(v5, "count")];

  return (NSString *)v6;
}

- (NSMutableDictionary)detectors
{
  return self->_detectors;
}

- (void)setDetectors:(id)a3
{
}

- (NSMutableArray)purgedDetectors
{
  return self->_purgedDetectors;
}

- (void)setPurgedDetectors:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgedDetectors, 0);
  objc_storeStrong((id *)&self->_detectors, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)addObserver:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "AXSDDetectorStore add observer: %@", (uint8_t *)&v2, 0xCu);
}

- (void)removeObserver:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_226F20000, a2, OS_LOG_TYPE_DEBUG, "AXSDDetectorStore remove observer: %@", (uint8_t *)&v2, 0xCu);
}

- (void)detectorWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_226F20000, a2, OS_LOG_TYPE_ERROR, "Trying to retrieve a detector with an invalid identifier. Identifier: %@", (uint8_t *)&v2, 0xCu);
}

@end