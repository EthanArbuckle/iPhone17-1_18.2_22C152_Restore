@interface MagnifierAssetsManager
+ (MagnifierAssetsManager)sharedInstance;
- (BOOL)assetDownloadFailed;
- (MagnifierAssetsManager)init;
- (MagnifierAssetsManagerDelegate)delegate;
- (NSDictionary)doorAttributesAssetProperties;
- (NSDictionary)signDetectorAssetProperties;
- (NSURL)doorAttributesBaseURL;
- (NSURL)signDetectorBaseURL;
- (double)totalDownloadedWithName:(id)a3;
- (id)_modelURLForType:(unint64_t)a3 baseURL:(id)a4;
- (id)assetPropertiesForModelType:(unint64_t)a3;
- (id)baseURLForType:(unint64_t)a3;
- (id)downloadAssetsWithName:(id)a3;
- (id)modelURLForType:(unint64_t)a3 timeout:(double)a4;
- (int64_t)totalSizeExpectedWithName:(id)a3;
- (int64_t)totalSizeOccupiedWithName:(id)a3;
- (void)_performWithLock:(id)a3;
- (void)_updateAsset:(id)a3;
- (void)_updateDownloadedValuesForAsset:(id)a3;
- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8;
- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7;
- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6;
- (void)downloadImageCaptionAssets;
- (void)manageImageCaptionModelAssets:(id)a3;
- (void)refreshAssets;
- (void)setDelegate:(id)a3;
- (void)setDoorAttributesAssetProperties:(id)a3;
- (void)setDoorAttributesBaseURL:(id)a3;
- (void)setSignDetectorAssetProperties:(id)a3;
- (void)setSignDetectorBaseURL:(id)a3;
@end

@implementation MagnifierAssetsManager

+ (MagnifierAssetsManager)sharedInstance
{
  if (sharedInstance_onceToken[0] != -1) {
    dispatch_once(sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance__Shared;
  return (MagnifierAssetsManager *)v2;
}

void __40__MagnifierAssetsManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MagnifierAssetsManager);
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;
}

- (MagnifierAssetsManager)init
{
  v24.receiver = self;
  v24.super_class = (Class)MagnifierAssetsManager;
  v2 = [(MagnifierAssetsManager *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F21180] policy];
    assetPolicy = v2->_assetPolicy;
    v2->_assetPolicy = (AXMagnifierAssetPolicy *)v3;

    uint64_t v5 = [MEMORY[0x263F21140] assetControllerWithPolicy:v2->_assetPolicy qosClass:25];
    assetController = v2->_assetController;
    v2->_assetController = (AXAssetController *)v5;

    [(AXAssetController *)v2->_assetController setUserInitiated:1];
    [(AXAssetController *)v2->_assetController addObserver:v2];
    v7 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cachedAssets = v2->_cachedAssets;
    v2->_cachedAssets = v7;

    v9 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    cachedDownloadableAssets = v2->_cachedDownloadableAssets;
    v2->_cachedDownloadableAssets = v9;

    v11 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    assetsNeedingDownload = v2->_assetsNeedingDownload;
    v2->_assetsNeedingDownload = v11;

    v13 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    expectedDownloadSizes = v2->_expectedDownloadSizes;
    v2->_expectedDownloadSizes = v13;

    v15 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    totalInstalledSizes = v2->_totalInstalledSizes;
    v2->_totalInstalledSizes = v15;

    v17 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetDownloadPercent = v2->_assetDownloadPercent;
    v2->_assetDownloadPercent = v17;

    v19 = (void *)MEMORY[0x263F21140];
    v20 = [MEMORY[0x263F21178] policy];
    uint64_t v21 = [v19 assetControllerWithPolicy:v20 qosClass:25];
    imageCaptionAssetController = v2->_imageCaptionAssetController;
    v2->_imageCaptionAssetController = (AXAssetController *)v21;

    [(AXAssetController *)v2->_imageCaptionAssetController setUserInitiated:1];
    [(AXAssetController *)v2->_imageCaptionAssetController addObserver:v2];
  }
  return v2;
}

- (id)baseURLForType:(unint64_t)a3
{
  if (!a3)
  {
    uint64_t v5 = 104;
LABEL_5:
    v6 = objc_msgSend(*(id *)((char *)&self->super.isa + v5), "copy", v3);
    return v6;
  }
  if (a3 == 1)
  {
    uint64_t v5 = 120;
    goto LABEL_5;
  }
  v6 = 0;
  return v6;
}

- (id)modelURLForType:(unint64_t)a3 timeout:(double)a4
{
  v6 = [(MagnifierAssetsManager *)self baseURLForType:a4];
  if (v6)
  {
    self->_assetDownloadFailed = 0;
    v7 = [(MagnifierAssetsManager *)self _modelURLForType:a3 baseURL:v6];
  }
  else
  {
    v7 = 0;
    self->_assetDownloadFailed = 1;
  }

  return v7;
}

- (id)downloadAssetsWithName:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(AXMagnifierAssetPolicy *)self->_assetPolicy assetsToDownloadFromRefreshedAssets:self->_cachedDownloadableAssets];
  assetsNeedingDownload = self->_assetsNeedingDownload;
  self->_assetsNeedingDownload = v5;

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v25 = v4;
  if ([(NSArray *)self->_assetsNeedingDownload count])
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = self->_assetsNeedingDownload;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(obj);
          }
          v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v12 = [v11 properties];
          v13 = [v12 objectForKeyedSubscript:@"AssetName"];
          int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            assetDownloadPercent = self->_assetDownloadPercent;
            v16 = [NSNumber numberWithDouble:0.0];
            v17 = [v11 properties];
            v18 = [v17 objectForKeyedSubscript:@"AssetName"];
            [(NSDictionary *)assetDownloadPercent setValue:v16 forKey:v18];

            assetController = self->_assetController;
            v33 = v11;
            v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];
            v28[0] = MEMORY[0x263EF8330];
            v28[1] = 3221225472;
            v28[2] = __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke;
            v28[3] = &unk_264C60418;
            v28[4] = self;
            [(AXAssetController *)assetController downloadAssets:v20 successStartBlock:v28];

            uint64_t v21 = [v7 arrayByAddingObject:v11];

            id v7 = (id)v21;
            id v4 = v25;
          }
        }
        uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v9);
    }
  }
  else
  {
    v22 = self->_assetDownloadPercent;
    v23 = [NSNumber numberWithDouble:100.0];
    [(NSDictionary *)v22 setValue:v23 forKey:v25];

    id v4 = v25;
  }

  return v7;
}

void __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke(uint64_t a1)
{
  v2 = AXLogAssetLoader();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke_cold_1(a1, v2);
  }
}

- (void)assetController:(id)a3 didFinishRefreshingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v109 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = AXLogAssetLoader();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v104 = self;
    __int16 v105 = 2112;
    id v106 = v11;
    __int16 v107 = 2112;
    id v108 = v12;
    _os_log_impl(&dword_235640000, v13, OS_LOG_TYPE_INFO, "[%@]: didFinishRefreshingAssets: (%@). error: %@", buf, 0x20u);
  }

  if (v7)
  {
    if ([v11 count]
      && ([v11 objectAtIndexedSubscript:0],
          int v14 = objc_claimAutoreleasedReturnValue(),
          [v14 assetType],
          v15 = objc_claimAutoreleasedReturnValue(),
          int v16 = [v15 isEqualToString:@"com.apple.MobileAsset.ImageCaptionModel"],
          v15,
          v14,
          v16))
    {
      [(MagnifierAssetsManager *)self manageImageCaptionModelAssets:v11];
    }
    else
    {
      id v66 = v12;
      id v68 = v10;
      id v74 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      id v67 = v11;
      id v18 = v11;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v94 objects:v102 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v95;
        uint64_t v69 = *(void *)v95;
        id v70 = v18;
        do
        {
          uint64_t v22 = 0;
          obuint64_t j = (id)v20;
          do
          {
            uint64_t v23 = v21;
            if (*(void *)v95 != v21) {
              objc_enumerationMutation(v18);
            }
            id v24 = v18;
            uint64_t v75 = v22;
            id v25 = *(void **)(*((void *)&v94 + 1) + 8 * v22);
            v26 = AXLogAssetLoader();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v104 = self;
              __int16 v105 = 2112;
              id v106 = v24;
              _os_log_impl(&dword_235640000, v26, OS_LOG_TYPE_INFO, "[%@]: Refreshed Assets:\n%@", buf, 0x16u);
            }

            expectedDownloadSizes = self->_expectedDownloadSizes;
            v28 = [v25 downloadSize];
            [v25 properties];
            long long v29 = v77 = v25;
            long long v30 = [v29 objectForKeyedSubscript:@"AssetName"];
            [(NSDictionary *)expectedDownloadSizes setValue:v28 forKey:v30];

            long long v31 = v25;
            long long v32 = [(NSArray *)self->_cachedDownloadableAssets arrayByAddingObject:v25];
            cachedDownloadableAssets = self->_cachedDownloadableAssets;
            self->_cachedDownloadableAssets = v32;

            if ([v25 isInstalled])
            {
              [(MagnifierAssetsManager *)self _updateDownloadedValuesForAsset:v25];
              id v34 = v74;
              id v74 = [v74 arrayByAddingObject:v25];
              id v18 = v24;
              uint64_t v21 = v23;
            }
            else
            {
              uint64_t v35 = [v25 properties];
              v36 = [v35 objectForKeyedSubscript:@"AssetName"];
              v37 = [(MagnifierAssetsManager *)self downloadAssetsWithName:v36];

              long long v92 = 0u;
              long long v93 = 0u;
              long long v90 = 0u;
              long long v91 = 0u;
              id v34 = v37;
              uint64_t v38 = [v34 countByEnumeratingWithState:&v90 objects:v101 count:16];
              if (v38)
              {
                uint64_t v39 = v38;
                uint64_t v40 = *(void *)v91;
                do
                {
                  for (uint64_t i = 0; i != v39; ++i)
                  {
                    if (*(void *)v91 != v40) {
                      objc_enumerationMutation(v34);
                    }
                    v42 = *(void **)(*((void *)&v90 + 1) + 8 * i);
                    v89[0] = MEMORY[0x263EF8330];
                    v89[1] = 3221225472;
                    v89[2] = __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke;
                    v89[3] = &unk_264C60440;
                    v89[4] = self;
                    v89[5] = v42;
                    [(MagnifierAssetsManager *)self _performWithLock:v89];
                    totalInstalledSizes = self->_totalInstalledSizes;
                    v44 = [v42 downloadSize];
                    v45 = [v42 properties];
                    v46 = [v45 objectForKeyedSubscript:@"AssetName"];
                    [(NSDictionary *)totalInstalledSizes setValue:v44 forKey:v46];
                  }
                  uint64_t v39 = [v34 countByEnumeratingWithState:&v90 objects:v101 count:16];
                }
                while (v39);
              }

              uint64_t v21 = v69;
              id v18 = v70;
              uint64_t v20 = (uint64_t)obj;
              long long v31 = v77;
            }

            v47 = [MEMORY[0x263F21148] store];
            [v47 recordLastAssetAccess:v31];

            v88[0] = MEMORY[0x263EF8330];
            v88[1] = 3221225472;
            v88[2] = __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2;
            v88[3] = &unk_264C60440;
            v88[4] = self;
            v88[5] = v31;
            [(MagnifierAssetsManager *)self _performWithLock:v88];
            uint64_t v22 = v75 + 1;
          }
          while (v75 + 1 != v20);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v94 objects:v102 count:16];
        }
        while (v20);
      }

      v48 = v74;
      if ([v74 count])
      {
        [(AXMagnifierAssetPolicy *)self->_assetPolicy assetsToPurgeFromInstalledAssets:v18];
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        long long v87 = 0u;
        id obja = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v76 = [obja countByEnumeratingWithState:&v84 objects:v100 count:16];
        if (v76)
        {
          uint64_t v73 = *(void *)v85;
          do
          {
            uint64_t v49 = 0;
            do
            {
              if (*(void *)v85 != v73) {
                objc_enumerationMutation(obja);
              }
              uint64_t v78 = v49;
              v50 = *(void **)(*((void *)&v84 + 1) + 8 * v49);
              assetController = self->_assetController;
              v99 = v50;
              v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v99 count:1];
              [(AXAssetController *)assetController purgeAssets:v52 completion:0];

              v53 = [v50 properties];
              v54 = [v53 objectForKeyedSubscript:@"AssetName"];
              v55 = [(MagnifierAssetsManager *)self downloadAssetsWithName:v54];

              long long v82 = 0u;
              long long v83 = 0u;
              long long v80 = 0u;
              long long v81 = 0u;
              id v56 = v55;
              uint64_t v57 = [v56 countByEnumeratingWithState:&v80 objects:v98 count:16];
              if (v57)
              {
                uint64_t v58 = v57;
                uint64_t v59 = *(void *)v81;
                do
                {
                  for (uint64_t j = 0; j != v58; ++j)
                  {
                    if (*(void *)v81 != v59) {
                      objc_enumerationMutation(v56);
                    }
                    v61 = *(void **)(*((void *)&v80 + 1) + 8 * j);
                    v79[0] = MEMORY[0x263EF8330];
                    v79[1] = 3221225472;
                    v79[2] = __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_3;
                    v79[3] = &unk_264C60440;
                    v79[4] = self;
                    v79[5] = v61;
                    [(MagnifierAssetsManager *)self _performWithLock:v79];
                    v62 = self->_totalInstalledSizes;
                    v63 = [v61 downloadSize];
                    v64 = [v61 properties];
                    v65 = [v64 objectForKeyedSubscript:@"AssetName"];
                    [(NSDictionary *)v62 setValue:v63 forKey:v65];
                  }
                  uint64_t v58 = [v56 countByEnumeratingWithState:&v80 objects:v98 count:16];
                }
                while (v58);
              }

              uint64_t v49 = v78 + 1;
            }
            while (v78 + 1 != v76);
            uint64_t v76 = [obja countByEnumeratingWithState:&v84 objects:v100 count:16];
          }
          while (v76);
        }

        v48 = v74;
      }
      self->_assetDownloadFailed = 0;

      id v11 = v67;
      id v10 = v68;
      id v12 = v66;
    }
  }
  else
  {
    self->_assetDownloadFailed = 1;
    v17 = AXLogAssetLoader();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MagnifierAssetsManager assetController:didFinishRefreshingAssets:wasSuccessful:error:]();
    }
  }
}

uint64_t __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAsset:*(void *)(a1 + 40)];
}

uint64_t __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAsset:*(void *)(a1 + 40)];
}

uint64_t __88__MagnifierAssetsManager_assetController_didFinishRefreshingAssets_wasSuccessful_error___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAsset:*(void *)(a1 + 40)];
}

- (void)assetController:(id)a3 didFinishDownloadingAsset:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6 hasRemainingDownloads:(BOOL)a7
{
  BOOL v8 = a5;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  if (v8)
  {
    id v12 = AXLogAssetLoader();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412546;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl(&dword_235640000, v12, OS_LOG_TYPE_INFO, "[%@]:  Downloaded Asset:\n%@", (uint8_t *)&v18, 0x16u);
    }

    v13 = [v10 assetType];
    char v14 = [v13 isEqualToString:@"com.apple.MobileAsset.ImageCaptionModel"];

    if ((v14 & 1) == 0)
    {
      [(MagnifierAssetsManager *)self _updateAsset:v10];
      v15 = [(NSArray *)self->_cachedAssets arrayByAddingObject:v10];
      cachedAssets = self->_cachedAssets;
      self->_cachedAssets = v15;

      [(MagnifierAssetsManager *)self _updateDownloadedValuesForAsset:v10];
      self->_assetDownloadFailed = 0;
    }
  }
  else
  {
    self->_assetDownloadFailed = 1;
    v17 = AXLogAssetLoader();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MagnifierAssetsManager assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:]();
    }
  }
}

- (void)assetController:(id)a3 asset:(id)a4 downloadProgressTotalWritten:(int64_t)a5 totalExpected:(int64_t)a6 isStalled:(BOOL)a7 expectedTimeRemaining:(double)a8
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = AXLogAssetLoader();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v19 = 138413058;
    __int16 v20 = self;
    __int16 v21 = 2112;
    id v22 = v11;
    __int16 v23 = 2048;
    int64_t v24 = a5;
    __int16 v25 = 2048;
    int64_t v26 = a6;
    _os_log_impl(&dword_235640000, v12, OS_LOG_TYPE_INFO, "[%@]: Downloading Asset:\n%@ %lld written, %lld expected.", (uint8_t *)&v19, 0x2Au);
  }

  v13 = [v11 assetType];
  char v14 = [v13 isEqualToString:@"com.apple.MobileAsset.ImageCaptionModel"];

  if ((v14 & 1) == 0)
  {
    assetDownloadPercent = self->_assetDownloadPercent;
    int v16 = [NSNumber numberWithDouble:(double)a5 / (double)a6];
    v17 = [v11 properties];
    int v18 = [v17 objectForKeyedSubscript:@"AssetName"];
    [(NSDictionary *)assetDownloadPercent setValue:v16 forKey:v18];
  }
}

- (void)assetController:(id)a3 didFinishPurgingAssets:(id)a4 wasSuccessful:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a6;
  id v11 = AXLogAssetLoader();
  id v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MagnifierAssetsManager assetController:didFinishPurgingAssets:wasSuccessful:error:]();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412802;
    char v14 = self;
    __int16 v15 = 2048;
    uint64_t v16 = [v9 count];
    __int16 v17 = 1024;
    BOOL v18 = v7;
    _os_log_debug_impl(&dword_235640000, v12, OS_LOG_TYPE_DEBUG, "[%@]: %lu number of assets purged. Success status: %d", (uint8_t *)&v13, 0x1Cu);
  }
}

- (id)_modelURLForType:(unint64_t)a3 baseURL:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (!a3)
  {
    BOOL v7 = @"DoorAttributesClassifier.mlmodel";
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    BOOL v7 = @"SignDetector.mlmodel";
LABEL_5:
    BOOL v8 = [v5 URLByAppendingPathComponent:v7];
    goto LABEL_7;
  }
  BOOL v8 = 0;
LABEL_7:

  return v8;
}

- (id)assetPropertiesForModelType:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = [(MagnifierAssetsManager *)self signDetectorAssetProperties];
  }
  else
  {
    if (a3) {
      [NSDictionary dictionary];
    }
    else {
    uint64_t v3 = [(MagnifierAssetsManager *)self doorAttributesAssetProperties];
    }
  }
  return v3;
}

- (void)_updateAsset:(id)a3
{
  id v13 = a3;
  id v4 = [v13 properties];
  id v5 = [v4 objectForKeyedSubscript:@"AssetName"];

  if ([v5 isEqualToString:@"DoorAttributesClassifier"])
  {
    v6 = [v13 localURL];
    BOOL v7 = (void *)[v6 copy];
    [(MagnifierAssetsManager *)self setDoorAttributesBaseURL:v7];

    BOOL v8 = [v13 properties];
    id v9 = (void *)[v8 copy];
    [(MagnifierAssetsManager *)self setDoorAttributesAssetProperties:v9];
  }
  else
  {
    if (![v5 isEqualToString:@"SignDetector"]) {
      goto LABEL_6;
    }
    id v10 = [v13 localURL];
    id v11 = (void *)[v10 copy];
    [(MagnifierAssetsManager *)self setSignDetectorBaseURL:v11];

    BOOL v8 = [v13 properties];
    id v9 = (void *)[v8 copy];
    [(MagnifierAssetsManager *)self setSignDetectorAssetProperties:v9];
  }

LABEL_6:
  id v12 = [(MagnifierAssetsManager *)self delegate];
  [v12 updateAssetURLs];
}

- (void)_performWithLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (void)refreshAssets
{
}

- (int64_t)totalSizeOccupiedWithName:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_totalInstalledSizes objectForKeyedSubscript:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (int64_t)totalSizeExpectedWithName:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_expectedDownloadSizes objectForKeyedSubscript:a3];
  int64_t v4 = [v3 longLongValue];

  return v4;
}

- (double)totalDownloadedWithName:(id)a3
{
  uint64_t v3 = [(NSDictionary *)self->_assetDownloadPercent objectForKeyedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)_updateDownloadedValuesForAsset:(id)a3
{
  totalInstalledSizes = self->_totalInstalledSizes;
  id v5 = a3;
  v6 = [v5 downloadSize];
  BOOL v7 = [v5 properties];
  BOOL v8 = [v7 objectForKeyedSubscript:@"AssetName"];
  [(NSDictionary *)totalInstalledSizes setValue:v6 forKey:v8];

  assetDownloadPercent = self->_assetDownloadPercent;
  id v12 = [NSNumber numberWithDouble:100.0];
  id v10 = [v5 properties];

  id v11 = [v10 objectForKeyedSubscript:@"AssetName"];
  [(NSDictionary *)assetDownloadPercent setValue:v12 forKey:v11];
}

- (BOOL)assetDownloadFailed
{
  return self->_assetDownloadFailed;
}

- (void)downloadImageCaptionAssets
{
}

void __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    double v4 = AXLogAssetLoader();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke_cold_1(v3, v4);
    }
  }
}

- (void)manageImageCaptionModelAssets:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x237DE9730]();
  v6 = [MEMORY[0x263EF9490] currentLanguageCode];
  BOOL v7 = [v6 componentsSeparatedByString:@"-"];
  if ([v7 count])
  {
    BOOL v8 = [v7 objectAtIndex:0];
    id v9 = [MEMORY[0x263F21138] newsestCompatibleImageCaptionModelAssetFromAssets:v4 withStage:@"Stable" language:v8 isInstalled:1 isDownloadable:0];
    if (v9
      || ([MEMORY[0x263F21138] newsestCompatibleImageCaptionModelAssetFromAssets:v4 withStage:@"Stable" language:v8 isInstalled:0 isDownloadable:1], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      imageCaptionAssetController = self->_imageCaptionAssetController;
      v12[0] = v9;
      id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      [(AXAssetController *)imageCaptionAssetController downloadAssets:v11 successStartBlock:&__block_literal_global_306];
    }
  }
}

void __56__MagnifierAssetsManager_manageImageCaptionModelAssets___block_invoke()
{
  v0 = AXLogAssetLoader();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __56__MagnifierAssetsManager_manageImageCaptionModelAssets___block_invoke_cold_1(v0);
  }
}

- (MagnifierAssetsManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MagnifierAssetsManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)doorAttributesBaseURL
{
  return self->_doorAttributesBaseURL;
}

- (void)setDoorAttributesBaseURL:(id)a3
{
}

- (NSDictionary)doorAttributesAssetProperties
{
  return self->_doorAttributesAssetProperties;
}

- (void)setDoorAttributesAssetProperties:(id)a3
{
}

- (NSURL)signDetectorBaseURL
{
  return self->_signDetectorBaseURL;
}

- (void)setSignDetectorBaseURL:(id)a3
{
}

- (NSDictionary)signDetectorAssetProperties
{
  return self->_signDetectorAssetProperties;
}

- (void)setSignDetectorAssetProperties:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signDetectorAssetProperties, 0);
  objc_storeStrong((id *)&self->_signDetectorBaseURL, 0);
  objc_storeStrong((id *)&self->_doorAttributesAssetProperties, 0);
  objc_storeStrong((id *)&self->_doorAttributesBaseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_imageCaptionAssetController, 0);
  objc_storeStrong((id *)&self->_assetDownloadPercent, 0);
  objc_storeStrong((id *)&self->_totalInstalledSizes, 0);
  objc_storeStrong((id *)&self->_expectedDownloadSizes, 0);
  objc_storeStrong((id *)&self->_assetsNeedingDownload, 0);
  objc_storeStrong((id *)&self->_cachedDownloadableAssets, 0);
  objc_storeStrong((id *)&self->_cachedAssets, 0);
  objc_storeStrong((id *)&self->_assetPolicy, 0);
  objc_storeStrong((id *)&self->_assetController, 0);
}

void __49__MagnifierAssetsManager_downloadAssetsWithName___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
  int v6 = 134218242;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl(&dword_235640000, a2, OS_LOG_TYPE_DEBUG, "Successfully started downloading %lu assets:\n%@ ", (uint8_t *)&v6, 0x16u);
}

- (void)assetController:didFinishRefreshingAssets:wasSuccessful:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_235640000, v0, v1, "[%@]:  Error refresing assets:\n%@");
}

- (void)assetController:didFinishDownloadingAsset:wasSuccessful:error:hasRemainingDownloads:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_235640000, v0, v1, "[%@]: Download failed:\n%@");
}

- (void)assetController:didFinishPurgingAssets:wasSuccessful:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_235640000, v0, v1, "[%@]: Error purging assets: %@");
}

void __52__MagnifierAssetsManager_downloadImageCaptionAssets__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_235640000, a2, OS_LOG_TYPE_ERROR, "Could not refresh image caption assets from Magnifier: %@", (uint8_t *)&v4, 0xCu);
}

void __56__MagnifierAssetsManager_manageImageCaptionModelAssets___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_235640000, log, OS_LOG_TYPE_DEBUG, "Successfully started downloading assets", v1, 2u);
}

@end