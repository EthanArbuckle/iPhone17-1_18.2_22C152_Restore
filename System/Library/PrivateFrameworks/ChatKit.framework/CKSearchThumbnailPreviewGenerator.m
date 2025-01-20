@interface CKSearchThumbnailPreviewGenerator
+ (id)sharedInstance;
+ (void)__setSingleton__im:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_calculateDurationForVideoResult:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationForVideoResult:(SEL)a3;
- (BOOL)_checkResultForLivePhotoComplement:(id)a3;
- (BOOL)_checkResultForSpatialMedia:(id)a3;
- (BOOL)hasCachedLinkMetadataForQueryResult:(id)a3;
- (BOOL)hasCachedMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4;
- (BOOL)hasCachedPreviewForKey:(id)a3;
- (BOOL)hasCachedPreviewForQueryResult:(id)a3;
- (BOOL)hasCachedWalletItemLinkPropertiesForQueryResult:(id)a3;
- (BOOL)queryResultHasLivePhoto:(id)a3;
- (BOOL)queryResultIsSpatial:(id)a3;
- (BOOL)queryResultIsVideo:(id)a3;
- (CKSearchThumbnailPreviewGenerator)init;
- (NSCache)livePhotoStatusCache;
- (NSCache)lpLinkMetadataCache;
- (NSCache)lpWalletItemPropertiesMetadataCache;
- (NSCache)spatialStatusCache;
- (NSCache)thumbnailCache;
- (NSCache)videoDurationCache;
- (NSMutableDictionary)mapHashesCache;
- (NSMutableSet)keysWithInFlightGeneration;
- (NSMutableSet)keysWithInFlightLPLinkMetadataGeneration;
- (NSMutableSet)keysWithInFlightLPWalletItemPropertiesMetadataGeneration;
- (NSMutableSet)keysWithInFlightLivePhotoStatus;
- (NSMutableSet)keysWithInFlightSpatialStatus;
- (NSMutableSet)keysWithInFlightVideoDurationCalculation;
- (id)_lpPreviewLoadQueue;
- (id)_lpWalletItemLinkPreviewLoadQueue;
- (id)_previewLoadQueue;
- (id)_previewURLForKey:(id)a3;
- (id)cachedLinkMetadataForQueryResult:(id)a3;
- (id)cachedMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4;
- (id)cachedPreviewForKey:(id)a3;
- (id)cachedPreviewForQueryResult:(id)a3;
- (id)cachedPreviewOrNullForKey:(id)a3;
- (id)cachedWalletItemLinkPropertiesForQueryResult:(id)a3;
- (id)mapKeyForQueryResult:(id)a3 traitCollection:(id)a4;
- (id)mapPlaceholderImageForTraitCollection:(id)a3;
- (void)_asyncLoadCachedDiskPreviewForKeyIfAvailable:(id)a3 completion:(id)a4;
- (void)_generateMapThumbnailForKey:(id)a3 attributes:(id)a4 traitCollection:(id)a5 completion:(id)a6;
- (void)_persistPreview:(id)a3 atURL:(id)a4;
- (void)_prewarmLinkMetadata:(id)a3;
- (void)beginFetchingLinkMetadataForQueryResult:(id)a3;
- (void)beginGeneratingWebLinkPresentationPropertiesForQueryResult:(id)a3;
- (void)generateAndCacheIconWithURL:(id)a3 key:(id)a4 completion:(id)a5;
- (void)generateAndCachePassWithURL:(id)a3 forKey:(id)a4 completion:(id)a5;
- (void)generateAndCacheThumbnailWithURL:(id)a3 request:(id)a4 key:(id)a5 completion:(id)a6;
- (void)generateMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4;
- (void)generatePreviewForQueryResult:(id)a3;
- (void)setKeysWithInFlightGeneration:(id)a3;
- (void)setKeysWithInFlightLPLinkMetadataGeneration:(id)a3;
- (void)setKeysWithInFlightLPWalletItemPropertiesMetadataGeneration:(id)a3;
- (void)setKeysWithInFlightLivePhotoStatus:(id)a3;
- (void)setKeysWithInFlightSpatialStatus:(id)a3;
- (void)setKeysWithInFlightVideoDurationCalculation:(id)a3;
- (void)setLivePhotoStatusCache:(id)a3;
- (void)setLpLinkMetadataCache:(id)a3;
- (void)setLpWalletItemPropertiesMetadataCache:(id)a3;
- (void)setMapHashesCache:(id)a3;
- (void)setSpatialStatusCache:(id)a3;
- (void)setThumbnailCache:(id)a3;
- (void)setVideoDurationCache:(id)a3;
@end

@implementation CKSearchThumbnailPreviewGenerator

+ (void)__setSingleton__im:(id)a3
{
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CKSearchThumbnailPreviewGenerator_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_1 != -1) {
    dispatch_once(&sharedInstance_once_1, block);
  }
  v2 = (void *)sCKSearchThumbnailPreviewGenerator_sharedInstance;

  return v2;
}

void __51__CKSearchThumbnailPreviewGenerator_sharedInstance__block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  if (!sCKSearchThumbnailPreviewGenerator_sharedInstance)
  {
    v2 = *(void **)(a1 + 32);
    v3 = objc_msgSend(v2, "_createSingleton__im");
    objc_msgSend(v2, "__setSingleton__im:", v3);
  }
  objc_sync_exit(obj);
}

- (CKSearchThumbnailPreviewGenerator)init
{
  v17.receiver = self;
  v17.super_class = (Class)CKSearchThumbnailPreviewGenerator;
  v2 = [(CKSearchThumbnailPreviewGenerator *)&v17 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setThumbnailCache:v3];

    v4 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setLivePhotoStatusCache:v4];

    v5 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setSpatialStatusCache:v5];

    v6 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setVideoDurationCache:v6];

    v7 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setLpLinkMetadataCache:v7];

    v8 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setMapHashesCache:v8];

    v9 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setLpWalletItemPropertiesMetadataCache:v9];

    v10 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setKeysWithInFlightGeneration:v10];

    v11 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setKeysWithInFlightLivePhotoStatus:v11];

    v12 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setKeysWithInFlightVideoDurationCalculation:v12];

    v13 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setKeysWithInFlightSpatialStatus:v13];

    v14 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setKeysWithInFlightLPLinkMetadataGeneration:v14];

    v15 = objc_opt_new();
    [(CKSearchThumbnailPreviewGenerator *)v2 setKeysWithInFlightLPWalletItemPropertiesMetadataGeneration:v15];
  }
  return v2;
}

- (id)_previewLoadQueue
{
  if (_previewLoadQueue_once != -1) {
    dispatch_once(&_previewLoadQueue_once, &__block_literal_global_144);
  }
  char v2 = arc4random();
  v3 = &_previewLoadQueue_sPreviewLoadQueue1;
  if ((v2 & 1) == 0) {
    v3 = &_previewLoadQueue_sPreviewLoadQueue2;
  }
  id v4 = (id)*v3;

  return v4;
}

void __54__CKSearchThumbnailPreviewGenerator__previewLoadQueue__block_invoke()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.Messages.CKThumbanilPreviewGeneratorLoadQueueOne", v0);
  char v2 = (void *)_previewLoadQueue_sPreviewLoadQueue1;
  _previewLoadQueue_sPreviewLoadQueue1 = (uint64_t)v1;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.Messages.CKThumbanilPreviewGeneratorLoadQueueTwo", v5);
  id v4 = (void *)_previewLoadQueue_sPreviewLoadQueue2;
  _previewLoadQueue_sPreviewLoadQueue2 = (uint64_t)v3;
}

- (id)_lpPreviewLoadQueue
{
  if (_lpPreviewLoadQueue_once != -1) {
    dispatch_once(&_lpPreviewLoadQueue_once, &__block_literal_global_179_0);
  }
  char v2 = (void *)_lpPreviewLoadQueue_sLPPreviewLoadQueue;

  return v2;
}

void __56__CKSearchThumbnailPreviewGenerator__lpPreviewLoadQueue__block_invoke()
{
  char v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Messages.CKThumbanilPreviewGeneratorLPLoadQueue", v2);
  dispatch_queue_t v1 = (void *)_lpPreviewLoadQueue_sLPPreviewLoadQueue;
  _lpPreviewLoadQueue_sLPPreviewLoadQueue = (uint64_t)v0;
}

- (id)_lpWalletItemLinkPreviewLoadQueue
{
  if (_lpWalletItemLinkPreviewLoadQueue_once != -1) {
    dispatch_once(&_lpWalletItemLinkPreviewLoadQueue_once, &__block_literal_global_182_0);
  }
  char v2 = (void *)_lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue;

  return v2;
}

void __70__CKSearchThumbnailPreviewGenerator__lpWalletItemLinkPreviewLoadQueue__block_invoke()
{
  char v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.Messages.CKThumbanilPreviewGeneratorWalleteLoadQueue", v2);
  dispatch_queue_t v1 = (void *)_lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue;
  _lpWalletItemLinkPreviewLoadQueue_sLPPassPreviewLoadQueue = (uint64_t)v0;
}

- (void)generatePreviewForQueryResult:(id)a3
{
  id v4 = a3;
  if (v4
    && ![(CKSearchThumbnailPreviewGenerator *)self hasCachedPreviewForQueryResult:v4])
  {
    v5 = [v4 identifier];
    v6 = [v4 item];
    v7 = [v6 attributeSet];
    v8 = [v7 contentURL];

    if (v5 && v8)
    {
      v9 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightGeneration];
      char v10 = [v9 containsObject:v5];

      if (v10)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightGeneration];
      [v11 addObject:v5];

      v12 = +[CKUIBehavior sharedBehaviors];
      [v12 searchPhotosThumbnailWidth];
      double v14 = v13;

      v15 = [MEMORY[0x1E4F42D90] mainScreen];
      [v15 scale];
      double v17 = v16;

      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F3A6C0]), "initWithFileAtURL:size:scale:representationTypes:", v8, 4, v14, v14, v17);
      [v18 setShouldUseRestrictedExtension:1];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke;
      v19[3] = &unk_1E5628C00;
      v19[4] = self;
      id v20 = v5;
      id v21 = v8;
      id v22 = v4;
      [(CKSearchThumbnailPreviewGenerator *)self generateAndCacheThumbnailWithURL:v21 request:v18 key:v20 completion:v19];
    }
    else
    {
      v18 = IMLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[CKSearchThumbnailPreviewGenerator generatePreviewForQueryResult:]();
      }
    }

    goto LABEL_10;
  }
LABEL_11:
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v7)
  {
    if ((a3 & 1) == 0)
    {
      v9 = [*(id *)(a1 + 32) _previewURLForKey:*(void *)(a1 + 40)];
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          char v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138412290;
            uint64_t v24 = v11;
            _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Generated preview thumbnail OK for URL: %@", buf, 0xCu);
          }
        }
        [*(id *)(a1 + 32) _persistPreview:v7 atURL:v9];
      }
      else
      {
        v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_cold_1();
        }
      }
    }
    double v16 = [*(id *)(a1 + 32) keysWithInFlightGeneration];
    [v16 removeObject:*(void *)(a1 + 40)];

    double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 postNotificationName:@"CKSearchThumbnailDidChange" object:*(void *)(a1 + 56)];
  }
  else
  {
    v12 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    double v14 = *(void **)(a1 + 32);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_189;
    v18[3] = &unk_1E5628BD8;
    v18[4] = v14;
    id v19 = v12;
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 56);
    id v22 = v8;
    [v14 generateAndCacheIconWithURL:v13 key:v19 completion:v18];
  }
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_189(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) keysWithInFlightGeneration];
  [v4 removeObject:*(void *)(a1 + 40)];

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        int v9 = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Generated preview icon OK for URL: %@", (uint8_t *)&v9, 0xCu);
      }
    }
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"CKSearchThumbnailDidChange" object:*(void *)(a1 + 56)];
  }
  else
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_189_cold_2(a1, v8);
    }

    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_189_cold_1();
    }
  }
}

- (id)cachedPreviewForKey:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(CKSearchThumbnailPreviewGenerator *)self cachedPreviewOrNullForKey:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v9 = 138412290;
          id v10 = v4;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Returning nil cached thumbnail. Previous attempt at generating thumbnail failed for key %@", (uint8_t *)&v9, 0xCu);
        }
      }
      id v7 = 0;
    }
    else
    {
      id v7 = v5;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)cachedPreviewOrNullForKey:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [(CKSearchThumbnailPreviewGenerator *)self thumbnailCache];
    uint64_t v6 = [v5 objectForKey:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)hasCachedPreviewForKey:(id)a3
{
  id v3 = [(CKSearchThumbnailPreviewGenerator *)self cachedPreviewOrNullForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)hasCachedPreviewForQueryResult:(id)a3
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = [a3 identifier];
  v5 = [(CKSearchThumbnailPreviewGenerator *)self cachedPreviewOrNullForKey:v4];
  BOOL v6 = v5 != 0;

  return v6;
}

- (id)cachedPreviewForQueryResult:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    id v9 = 0;
    goto LABEL_12;
  }
  BOOL v6 = [v4 identifier];
  id v7 = [(CKSearchThumbnailPreviewGenerator *)self cachedPreviewOrNullForKey:v6];

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v9 = v7;
      goto LABEL_11;
    }
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Returning nil cached thumbnail. Previous attempt at generating thumbnail failed for search result: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  id v9 = 0;
LABEL_11:

LABEL_12:

  return v9;
}

- (BOOL)queryResultHasLivePhoto:(id)a3
{
  id v4 = a3;
  v5 = [v4 identifier];
  if (!v5)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator queryResultHasLivePhoto:]();
    }
    goto LABEL_8;
  }
  BOOL v6 = [(CKSearchThumbnailPreviewGenerator *)self livePhotoStatusCache];
  id v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    id v9 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightLivePhotoStatus];
    char v10 = [v9 containsObject:v5];

    if ((v10 & 1) == 0)
    {
      int v11 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightLivePhotoStatus];
      [v11 addObject:v5];

      v12 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke;
      block[3] = &unk_1E5620AA8;
      block[4] = self;
      id v15 = v4;
      id v16 = v5;
      dispatch_async(v12, block);
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  char v8 = [v7 BOOLValue];
LABEL_9:

  return v8;
}

void __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke(id *a1)
{
  char v2 = [a1[4] _checkResultForLivePhotoComplement:a1[5]];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke_2;
  v3[3] = &unk_1E5627180;
  v3[4] = a1[4];
  id v4 = a1[6];
  char v6 = v2;
  id v5 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __61__CKSearchThumbnailPreviewGenerator_queryResultHasLivePhoto___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) keysWithInFlightLivePhotoStatus];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) livePhotoStatusCache];
  [v3 setObject:v5 forKey:*(void *)(a1 + 40)];

  if ([v5 BOOLValue])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"CKSearchLivePhotoStatusDidChange" object:*(void *)(a1 + 48)];
  }
}

- (BOOL)_checkResultForLivePhotoComplement:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 item];
  id v4 = [v3 attributeSet];
  id v5 = [v4 contentURL];

  if (v5)
  {
    char v6 = [v5 lastPathComponent];
    id v7 = +[CKMediaObjectManager sharedInstance];
    char v8 = (void *)[v7 classForFilename:v6];

    if ([v8 isEqual:objc_opt_class()])
    {
      id v9 = +[CKLivePhotoBundleUtilities calculateLivePhotoVideoPath:v5];
      BOOL v10 = v9 != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    int v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator _checkResultForLivePhotoComplement:]();
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)queryResultIsSpatial:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  if (!v5)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator queryResultIsSpatial:]();
    }
    goto LABEL_8;
  }
  char v6 = [(CKSearchThumbnailPreviewGenerator *)self spatialStatusCache];
  id v7 = [v6 objectForKey:v5];

  if (!v7)
  {
    id v9 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightSpatialStatus];
    char v10 = [v9 containsObject:v5];

    if ((v10 & 1) == 0)
    {
      int v11 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightSpatialStatus];
      [v11 addObject:v5];

      v12 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke;
      block[3] = &unk_1E5620AA8;
      block[4] = self;
      id v15 = v4;
      id v16 = v5;
      dispatch_async(v12, block);
    }
LABEL_8:
    char v8 = 0;
    goto LABEL_9;
  }
  char v8 = [v7 BOOLValue];
LABEL_9:

  return v8;
}

void __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke(id *a1)
{
  char v2 = [a1[4] _checkResultForSpatialMedia:a1[5]];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke_2;
  v3[3] = &unk_1E5627180;
  v3[4] = a1[4];
  id v4 = a1[6];
  char v6 = v2;
  id v5 = a1[5];
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

void __58__CKSearchThumbnailPreviewGenerator_queryResultIsSpatial___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) keysWithInFlightSpatialStatus];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v5 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) spatialStatusCache];
  [v3 setObject:v5 forKey:*(void *)(a1 + 40)];

  if ([v5 BOOLValue])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"CKSearchSpatialStatusDidChange" object:*(void *)(a1 + 48)];
  }
}

- (BOOL)_checkResultForSpatialMedia:(id)a3
{
  if (a3)
  {
    id v3 = [a3 item];
    id v4 = [v3 attributeSet];
    id v5 = [v4 contentURL];

    char v6 = IMPreviewExtension();
    id v7 = IMAttachmentPreviewFileURL();

    char v8 = [v7 URLByDeletingPathExtension];
    id v9 = [v8 URLByAppendingPathExtension:@"plist"];

    char v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v9];
    if (v10)
    {
      int v11 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F6D4E8]];
        char v13 = [v12 BOOLValue];
      }
      else
      {
        char v13 = 0;
      }

      if (!v5)
      {
LABEL_10:
        double v14 = IMLogHandleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[CKSearchThumbnailPreviewGenerator _checkResultForSpatialMedia:]();
        }

        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
      if (!v5) {
        goto LABEL_10;
      }
    }

    return v13;
  }
  return 0;
}

- (BOOL)queryResultIsVideo:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 item];
  id v4 = [v3 attributeSet];
  id v5 = [v4 contentURL];

  if (v5)
  {
    char v6 = [v5 lastPathComponent];
    id v7 = +[CKMediaObjectManager sharedInstance];
    char v8 = (void *)[v7 classForFilename:v6];

    char v9 = [v8 isEqual:objc_opt_class()];
  }
  else
  {
    char v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator queryResultIsVideo:]();
    }

    char v9 = 0;
  }

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationForVideoResult:(SEL)a3
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
  long long v20 = *(_OWORD *)v7;
  int64_t v21 = *(void *)(v7 + 16);
  char v8 = [v6 identifier];
  if (v8)
  {
    char v9 = [(CKSearchThumbnailPreviewGenerator *)self videoDurationCache];
    char v10 = [v9 objectForKey:v8];

    if (v10)
    {
      [v10 duration];
    }
    else
    {
      v12 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightVideoDurationCalculation];
      char v13 = [v12 containsObject:v8];

      if ((v13 & 1) == 0)
      {
        double v14 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightVideoDurationCalculation];
        [v14 addObject:v8];

        id v15 = dispatch_get_global_queue(0, 0);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke;
        block[3] = &unk_1E5620AA8;
        block[4] = self;
        id v18 = v6;
        id v19 = v8;
        dispatch_async(v15, block);
      }
      *(_OWORD *)&retstr->var0 = v20;
      retstr->var3 = v21;
    }
  }
  else
  {
    int v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator durationForVideoResult:]();
    }

    *(_OWORD *)&retstr->var0 = v20;
    retstr->var3 = v21;
  }

  return result;
}

void __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke(uint64_t a1)
{
  long long v8 = 0uLL;
  uint64_t v9 = 0;
  char v2 = *(void **)(a1 + 32);
  if (v2) {
    [v2 _calculateDurationForVideoResult:*(void *)(a1 + 40)];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke_2;
  block[3] = &unk_1E5628C28;
  block[4] = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 48);
  long long v6 = v8;
  uint64_t v7 = v9;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __60__CKSearchThumbnailPreviewGenerator_durationForVideoResult___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) keysWithInFlightVideoDurationCalculation];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = objc_alloc_init(CKSearchVideoDuration);
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  [(CKSearchVideoDuration *)v3 setDuration:&v6];
  id v4 = [*(id *)(a1 + 32) videoDurationCache];
  [v4 setObject:v3 forKey:*(void *)(a1 + 40)];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"CKSearchVideoDurationDidChange" object:*(void *)(a1 + 48)];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_calculateDurationForVideoResult:(SEL)a3
{
  if (!a4)
  {
    result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
    int64_t var3 = result->var3;
    *(_OWORD *)&retstr->var0 = *(_OWORD *)&result->var0;
    retstr->int64_t var3 = var3;
    return result;
  }
  id v5 = [a4 item];
  long long v6 = [v5 attributeSet];
  uint64_t v7 = [v6 contentURL];

  if (!v7)
  {
    id v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator queryResultIsVideo:]();
    }

    uint64_t v16 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
    int64_t v17 = *(void *)(v16 + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v16;
    retstr->int64_t var3 = v17;
    goto LABEL_15;
  }
  long long v8 = [v7 lastPathComponent];
  uint64_t v9 = +[CKMediaObjectManager sharedInstance];
  char v10 = (void *)[v9 classForFilename:v8];

  if (![v10 isEqual:objc_opt_class()]) {
    goto LABEL_13;
  }
  int v11 = CKAVURLAssetForURL(v7);
  if (!v11)
  {
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator _calculateDurationForVideoResult:]();
    }

LABEL_13:
    uint64_t v19 = MEMORY[0x192FBA870]("kCMTimeInvalid", @"CoreMedia");
    int64_t v20 = *(void *)(v19 + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)v19;
    retstr->int64_t var3 = v20;
    goto LABEL_14;
  }
  v12 = v11;
  [v11 duration];

LABEL_14:
LABEL_15:

  return result;
}

- (void)generateAndCacheThumbnailWithURL:(id)a3 request:(id)a4 key:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__41;
  v29[4] = __Block_byref_object_dispose__41;
  id v30 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke;
  v26[3] = &unk_1E5628C50;
  v28 = v29;
  id v15 = v14;
  v27 = v15;
  [(CKSearchThumbnailPreviewGenerator *)self _asyncLoadCachedDiskPreviewForKeyIfAvailable:v12 completion:v26];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_2;
  v20[3] = &unk_1E5628CF0;
  v20[4] = self;
  id v21 = v12;
  id v24 = v13;
  uint64_t v25 = v29;
  id v22 = v10;
  id v23 = v11;
  id v16 = v11;
  id v17 = v10;
  id v18 = v13;
  id v19 = v12;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], v20);

  _Block_object_dispose(v29, 8);
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    char v2 = [*(id *)(a1 + 32) thumbnailCache];
    [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) forKey:*(void *)(a1 + 40)];

    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = [*(id *)(a1 + 48) lastPathComponent];
    long long v6 = IMUTITypeForFilename();
    uint64_t v7 = +[CKMediaObjectManager sharedInstance];
    long long v8 = (void *)[v7 classForUTIType:v6];

    if ([v8 isEqual:objc_opt_class()])
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      id v11 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_3;
      v20[3] = &unk_1E5628C78;
      id v21 = *(id *)(a1 + 64);
      [v11 generateAndCachePassWithURL:v9 forKey:v10 completion:v20];
      id v12 = v21;
    }
    else
    {
      id v13 = [MEMORY[0x1E4F3A6C8] sharedGenerator];
      uint64_t v14 = *(void *)(a1 + 56);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_5;
      v16[3] = &unk_1E5628CC8;
      id v15 = *(void **)(a1 + 40);
      v16[4] = *(void *)(a1 + 32);
      id v17 = v15;
      id v19 = *(id *)(a1 + 64);
      id v18 = *(id *)(a1 + 48);
      [v13 generateBestRepresentationForRequest:v14 completionHandler:v16];

      id v12 = v17;
    }
  }
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_4;
  v6[3] = &unk_1E5623828;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 32), 0, 0);
  }
  return result;
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6;
  v11[3] = &unk_1E5628CA0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v8;
  id v17 = *(id *)(a1 + 56);
  id v15 = v5;
  id v16 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    char v2 = [*(id *)(a1 + 40) thumbnailCache];
    id v3 = [MEMORY[0x1E4F1CA98] null];
    [v2 setObject:v3 forKey:*(void *)(a1 + 48)];

    uint64_t v4 = *(void *)(a1 + 72);
    if (v4)
    {
      id v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    id v6 = [*(id *)(a1 + 56) UIImage];
    if (v6)
    {
      uint64_t v7 = [*(id *)(a1 + 40) thumbnailCache];
      [v7 setObject:v6 forKey:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6_cold_1();
      }

      uint64_t v7 = [*(id *)(a1 + 40) thumbnailCache];
      id v9 = [MEMORY[0x1E4F1CA98] null];
      [v7 setObject:v9 forKey:*(void *)(a1 + 48)];
    }
    uint64_t v10 = *(void *)(a1 + 72);
    if (v10) {
      (*(void (**)(uint64_t, void *, void, void))(v10 + 16))(v10, v6, 0, *(void *)(a1 + 32));
    }
  }
}

- (void)generateAndCacheIconWithURL:(id)a3 key:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_opt_new();
  id v12 = +[CKUIBehavior sharedBehaviors];
  [v12 searchPhotosThumbnailWidth];
  double v14 = v13;

  id v15 = [MEMORY[0x1E4F42D90] mainScreen];
  [v15 scale];
  double v17 = v16;

  objc_msgSend(v11, "setSize:", v14, v14);
  [v11 setScale:v17];
  [v11 setVariantOptions:1];
  id v18 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithURL:v8];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke;
  v22[3] = &unk_1E5628D18;
  id v23 = v8;
  id v24 = self;
  id v25 = v9;
  id v26 = v10;
  id v19 = v10;
  id v20 = v9;
  id v21 = v8;
  [v18 getImageForImageDescriptor:v11 completion:v22];
}

void __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (!v3)
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_1();
    }
    goto LABEL_7;
  }
  id v5 = (void *)MEMORY[0x1E4F42A80];
  uint64_t v6 = [v3 CGImage];
  [v4 scale];
  uint64_t v7 = objc_msgSend(v5, "imageWithCGImage:scale:orientation:", v6, 0);
  if (!v7)
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_2();
    }
LABEL_7:

    uint64_t v7 = 0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_211;
  v12[3] = &unk_1E5622F40;
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(a1 + 48);
  id v13 = v7;
  uint64_t v14 = v9;
  id v15 = v10;
  id v16 = *(id *)(a1 + 56);
  id v11 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v12);
}

uint64_t __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_211(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) thumbnailCache];
  uint64_t v4 = v3;
  if (v2)
  {
    [v3 setObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v5 forKey:*(void *)(a1 + 48)];
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)generateAndCachePassWithURL:(id)a3 forKey:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = dispatch_get_global_queue(2, 0);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke;
  v15[3] = &unk_1E5622F40;
  id v16 = v8;
  double v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

void __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v24 = 0;
  id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:8 error:&v24];
  id v4 = v24;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v11 = objc_msgSend(objc_alloc((Class)MEMORY[0x192FBA860](@"PKPass", @"PassKit")), "initWithData:error:", v3, 0);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_219;
    v18[3] = &unk_1E5622C20;
    uint64_t v12 = *(void *)(a1 + 40);
    id v13 = *(void **)(a1 + 48);
    id v19 = v11;
    uint64_t v20 = v12;
    id v21 = v13;
    id v22 = *(id *)(a1 + 32);
    id v23 = *(id *)(a1 + 56);
    id v14 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v18);
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 40) thumbnailCache];
    id v8 = [MEMORY[0x1E4F1CA98] null];
    [v7 setObject:v8 forKey:*(void *)(a1 + 48)];

    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 48);
      uint64_t v16 = *(void *)(a1 + 32);
      double v17 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      __int16 v29 = 2112;
      id v30 = v17;
      _os_log_error_impl(&dword_18EF18000, v9, OS_LOG_TYPE_ERROR, "Failed to load pass data with for key: %@, URL: %@, error: %@", buf, 0x20u);
    }
    uint64_t v10 = *(void *)(a1 + 56);
    if (v10) {
      (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
    }
  }
}

void __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_219(uint64_t a1)
{
  uint64_t v2 = +[CKPassKitHelper passViewForPass:*(void *)(a1 + 32) content:4];
  id v3 = [v2 snapshotOfFrontFace];
  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) thumbnailCache];
    [v4 setObject:v3 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_219_cold_1();
    }

    id v4 = [*(id *)(a1 + 40) thumbnailCache];
    BOOL v6 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v6 forKey:*(void *)(a1 + 48)];
  }
  uint64_t v7 = *(void *)(a1 + 64);
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v3);
  }
}

- (void)_asyncLoadCachedDiskPreviewForKeyIfAvailable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKSearchThumbnailPreviewGenerator *)self _previewURLForKey:v6];
  if (v8)
  {
    id v9 = +[CKUIBehavior sharedBehaviors];
    [v9 searchPhotosThumbnailWidth];
    double v11 = v10;

    uint64_t v12 = [MEMORY[0x1E4F42D90] mainScreen];
    [v12 scale];
    double v14 = v13;

    uint64_t v15 = [(CKSearchThumbnailPreviewGenerator *)self _previewLoadQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke;
    v17[3] = &unk_1E5627890;
    id v18 = v8;
    double v21 = v11 * v14;
    id v20 = v7;
    id v19 = v6;
    dispatch_async(v15, v17);
  }
  else
  {
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator _asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:]();
    }

    if (v7) {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

void __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke(void *a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc(MEMORY[0x1E4F1C9B8]);
  uint64_t v3 = a1[4];
  id v23 = 0;
  CFDataRef v4 = (const __CFData *)[v2 initWithContentsOfURL:v3 options:1 error:&v23];
  id v5 = v23;
  id v6 = v5;
  if (v4)
  {
    CGImageSourceRef v7 = CGImageSourceCreateWithData(v4, 0);
    id v8 = (const void *)IMCreateThumbnailWithImageSourceAtIndexForMaxDimension();
    if (v8)
    {
      id v9 = [MEMORY[0x1E4F42A80] imageWithCGImage:v8];
      if (!v7) {
        goto LABEL_5;
      }
    }
    else
    {
      id v9 = 0;
      if (!v7)
      {
LABEL_5:
        if (v8) {
          CFRelease(v8);
        }
        double v10 = IMLogHandleForCategory();
        double v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = a1[4];
            *(_DWORD *)buf = 138412290;
            uint64_t v25 = v12;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Created preview OK for previewURL: %@", buf, 0xCu);
          }

          uint64_t v13 = a1[6];
          if (!v13) {
            goto LABEL_22;
          }
          double v14 = *(void (**)(void))(v13 + 16);
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke_cold_1();
          }

          uint64_t v17 = a1[6];
          if (!v17) {
            goto LABEL_22;
          }
          double v14 = *(void (**)(void))(v17 + 16);
        }
        v14();
LABEL_22:

        goto LABEL_29;
      }
    }
    CFRelease(v7);
    goto LABEL_5;
  }
  uint64_t v15 = [v5 domain];
  if (![v15 isEqualToString:*MEMORY[0x1E4F281F8]])
  {

    goto LABEL_24;
  }
  uint64_t v16 = [v6 code];

  if (v16 != 260)
  {
LABEL_24:
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = a1[4];
      uint64_t v20 = a1[5];
      id v22 = [v6 localizedDescription];
      *(_DWORD *)buf = 138412802;
      uint64_t v25 = v20;
      __int16 v26 = 2112;
      uint64_t v27 = v21;
      __int16 v28 = 2112;
      __int16 v29 = v22;
      _os_log_error_impl(&dword_18EF18000, v18, OS_LOG_TYPE_ERROR, "Failed to load preview from disk for key: %@, url: %@ error: %@", buf, 0x20u);
    }
  }
  uint64_t v19 = a1[6];
  if (v19) {
    (*(void (**)(uint64_t, void))(v19 + 16))(v19, 0);
  }
LABEL_29:
}

- (void)generateMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6
    && ![(CKSearchThumbnailPreviewGenerator *)self hasCachedMapPreviewForQueryResult:v6 traitCollection:v7])
  {
    id v8 = [(CKSearchThumbnailPreviewGenerator *)self mapKeyForQueryResult:v6 traitCollection:v7];
    if (v8)
    {
      id v9 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightGeneration];
      char v10 = [v9 containsObject:v8];

      if ((v10 & 1) == 0)
      {
        double v11 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightGeneration];
        [v11 addObject:v8];

        uint64_t v12 = [v6 item];
        uint64_t v13 = [v12 attributeSet];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke;
        v15[3] = &unk_1E5628D40;
        void v15[4] = self;
        id v16 = v8;
        id v17 = v6;
        [(CKSearchThumbnailPreviewGenerator *)self _generateMapThumbnailForKey:v16 attributes:v13 traitCollection:v7 completion:v15];
      }
    }
    else
    {
      double v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CKSearchThumbnailPreviewGenerator generateMapPreviewForQueryResult:traitCollection:]();
      }
    }
  }
}

void __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [*(id *)(a1 + 32) keysWithInFlightGeneration];
  [v9 removeObject:*(void *)(a1 + 40)];

  if (!v7 || v8)
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke_cold_1();
    }

    uint64_t v12 = [*(id *)(a1 + 32) thumbnailCache];
    double v14 = [MEMORY[0x1E4F1CA98] null];
    [v12 setObject:v14 forKey:*(void *)(a1 + 40)];
  }
  else
  {
    char v10 = [*(id *)(a1 + 32) thumbnailCache];
    [v10 setObject:v7 forKey:*(void *)(a1 + 40)];

    if ((a3 & 1) == 0)
    {
      double v11 = [*(id *)(a1 + 32) _previewURLForKey:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) _persistPreview:v7 atURL:v11];
    }
    uint64_t v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 postNotificationName:@"CKSearchThumbnailDidChange" object:*(void *)(a1 + 48)];
  }
}

- (id)mapKeyForQueryResult:(id)a3 traitCollection:(id)a4
{
  CFDataRef v4 = 0;
  if (a3 && a4)
  {
    id v6 = NSString;
    id v7 = a4;
    id v8 = [a3 identifier];
    uint64_t v9 = [v7 userInterfaceStyle];

    CFDataRef v4 = [v6 stringWithFormat:@"%@-%ld", v8, v9];
  }

  return v4;
}

- (BOOL)hasCachedMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4
{
  CFDataRef v4 = self;
  id v5 = [(CKSearchThumbnailPreviewGenerator *)self mapKeyForQueryResult:a3 traitCollection:a4];
  LOBYTE(v4) = [(CKSearchThumbnailPreviewGenerator *)v4 hasCachedPreviewForKey:v5];

  return (char)v4;
}

- (id)cachedMapPreviewForQueryResult:(id)a3 traitCollection:(id)a4
{
  if (a3)
  {
    id v5 = [(CKSearchThumbnailPreviewGenerator *)self mapKeyForQueryResult:a3 traitCollection:a4];
    id v6 = [(CKSearchThumbnailPreviewGenerator *)self cachedPreviewForKey:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_generateMapThumbnailForKey:(id)a3 attributes:(id)a4 traitCollection:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  double v14 = dispatch_group_create();
  dispatch_group_enter(v14);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy__41;
  v27[4] = __Block_byref_object_dispose__41;
  id v28 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke;
  v24[3] = &unk_1E5628C50;
  __int16 v26 = v27;
  uint64_t v15 = v14;
  uint64_t v25 = v15;
  [(CKSearchThumbnailPreviewGenerator *)self _asyncLoadCachedDiskPreviewForKeyIfAvailable:v10 completion:v24];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2;
  block[3] = &unk_1E5628D90;
  id v22 = v13;
  id v23 = v27;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v16 = v11;
  id v17 = v13;
  id v18 = v10;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v27, 8);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2(uint64_t a1)
{
  v38[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v2 = [*(id *)(a1 + 32) thumbnailCache];
    [v2 setObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) forKey:*(void *)(a1 + 40)];

    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
    return;
  }
  if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DIsValidCoreLocation != -1) {
    dispatch_once(&sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DIsValidCoreLocation, &__block_literal_global_227);
  }
  if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DMakeCoreLocation != -1) {
    dispatch_once(&sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_CLLocationCoordinate2DMakeCoreLocation, &__block_literal_global_233_0);
  }
  id v5 = [*(id *)(a1 + 48) latitude];
  [v5 floatValue];
  float v7 = v6;

  id v8 = [*(id *)(a1 + 48) longitude];
  [v8 floatValue];
  float v10 = v9;

  double v11 = sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DMake(v7, v10);
  double v13 = v12;
  if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DIsValid())
  {
    double v14 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit");
    if (v14)
    {
      id v15 = objc_alloc_init(v14);
      [v15 setMapType:0];
      [v15 _setUseSnapshotService:1];
      id v16 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotFeatureAnnotation", @"MapKit");
      if (v16)
      {
        id v17 = objc_msgSend([v16 alloc], "initWithCoordinate:title:representation:", 0, 2, v11, v13);
        v38[0] = v17;
        id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
        [v15 _setCustomFeatureAnnotations:v18];

        uint64_t v19 = +[CKUIBehavior sharedBehaviors];
        id v20 = +[CKUIBehavior sharedBehaviors];
        [v20 searchPhotosThumbnailWidth];
        objc_msgSend(v19, "mapThumbnailFillSizeForWidth:");
        double v22 = v21;
        double v24 = v23;

        if (sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_MKCoordinateRegionMakeWithDistanceMapKit != -1) {
          dispatch_once(&sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__pred_MKCoordinateRegionMakeWithDistanceMapKit, &__block_literal_global_247_0);
        }
        sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__MKCoordinateRegionMakeWithDistance(v11, v13, 500.0, 500.0);
        if (v26 < -180.0
          || v26 > 180.0
          || v25 < -90.0
          || v25 > 90.0
          || v27 < 0.0
          || v27 > 180.0
          || v28 < 0.0
          || v28 > 360.0)
        {
          v34 = IMLogHandleForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_4();
          }
        }
        else
        {
          objc_msgSend(v15, "setRegion:");
          objc_msgSend(v15, "setSize:", v22, v24);
          __int16 v29 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit");
          if (v29)
          {
            uint64_t v30 = (void *)[[v29 alloc] initWithOptions:v15];
            uint64_t v31 = +[CKPreviewDispatchCache mapThumbnailQueue];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_253;
            v36[3] = &unk_1E5628D68;
            id v37 = *(id *)(a1 + 56);
            [v30 startWithQueue:v31 completionHandler:v36];

LABEL_37:
            return;
          }
          v34 = IMLogHandleForCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_3();
          }
        }
      }
      else
      {
        v34 = IMLogHandleForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_2();
        }
      }

      uint64_t v35 = *(void *)(a1 + 56);
      if (v35) {
        (*(void (**)(uint64_t, void, void, void))(v35 + 16))(v35, 0, 0, 0);
      }
      goto LABEL_37;
    }
    v32 = IMLogHandleForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_1();
    }
  }
  else
  {
    v32 = IMLogHandleForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_5();
    }
  }

  uint64_t v33 = *(void *)(a1 + 56);
  if (v33) {
    (*(void (**)(uint64_t, void, void, void))(v33 + 16))(v33, 0, 0, 0);
  }
}

void *__103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_3()
{
  uint64_t result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DIsValid", @"CoreLocation");
  sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DIsValid = result;
  return result;
}

void *__103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_4()
{
  uint64_t result = (void *)MEMORY[0x192FBA870]("CLLocationCoordinate2DMake", @"CoreLocation");
  sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__CLLocationCoordinate2DMake = result;
  return result;
}

void *__103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_245()
{
  uint64_t result = (void *)MEMORY[0x192FBA870]("MKCoordinateRegionMakeWithDistance", @"MapKit");
  sCKSearchThumbnailPreviewGenerator_sharedInstance_block_invoke__MKCoordinateRegionMakeWithDistance = result;
  return result;
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_253(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_254;
  block[3] = &unk_1E5625E70;
  id v11 = v5;
  id v7 = *(id *)(a1 + 32);
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_254(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) image];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    id v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    id v2 = v4;
  }
}

- (id)mapPlaceholderImageForTraitCollection:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"hash-%ld", objc_msgSend(v4, "userInterfaceStyle"));
  id v6 = [(CKSearchThumbnailPreviewGenerator *)self mapHashesCache];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = [(CKSearchThumbnailPreviewGenerator *)self mapHashesCache];
    id v9 = [v8 objectForKey:v5];
  }
  else
  {
    float v10 = [(CKSearchThumbnailPreviewGenerator *)self _previewURLForKey:v5];
    if (v10
      && (uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v10 options:1 error:0]) != 0
      && (id v12 = (void *)v11,
          [MEMORY[0x1E4F42A80] ckImageWithData:v11],
          id v9 = (id)objc_claimAutoreleasedReturnValue(),
          v12,
          v9))
    {
      id v13 = [(CKSearchThumbnailPreviewGenerator *)self mapHashesCache];
      [v13 setObject:v9 forKey:v5];
    }
    else
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__41;
      v39 = __Block_byref_object_dispose__41;
      id v40 = 0;
      double v14 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotOptions", @"MapKit");
      if (v14)
      {
        id v15 = objc_alloc_init(v14);
        [v15 setMapType:105];
        [v15 setTraitCollection:v4];
        id v16 = +[CKUIBehavior sharedBehaviors];
        id v17 = +[CKUIBehavior sharedBehaviors];
        [v17 searchPhotosThumbnailWidth];
        objc_msgSend(v16, "mapThumbnailFillSizeForWidth:");
        double v19 = v18;
        double v21 = v20;

        -[NSObject setSize:](v15, "setSize:", v19, v21);
        double v22 = (objc_class *)MEMORY[0x192FBA860](@"MKMapSnapshotter", @"MapKit");
        if (v22)
        {
          double v23 = [[v22 alloc] initWithOptions:v15];
          double v24 = dispatch_group_create();
          dispatch_group_enter(v24);
          double v25 = +[CKPreviewDispatchCache mapThumbnailQueue];
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke;
          v32[3] = &unk_1E5620EB0;
          v34 = &v35;
          double v26 = v24;
          uint64_t v33 = v26;
          [v23 startWithQueue:v25 completionHandler:v32];

          dispatch_time_t v27 = dispatch_time(0, 5000000000);
          if (dispatch_group_wait(v26, v27))
          {
            if (IMOSLoggingEnabled())
            {
              CKLogCStringForType(2);
              double v28 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v42 = self;
                _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_INFO, "%@ thumbnail generation timed out.", buf, 0xCu);
              }
            }
            if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
              _CKLogExternal();
            }
          }
          __int16 v29 = (void *)v36[5];
          if (v29)
          {
            uint64_t v30 = [(CKSearchThumbnailPreviewGenerator *)self mapHashesCache];
            [v30 setObject:v36[5] forKey:v5];

            [(CKSearchThumbnailPreviewGenerator *)self _persistPreview:v36[5] atURL:v10];
            __int16 v29 = (void *)v36[5];
          }
          id v9 = v29;
        }
        else
        {
          double v23 = IMLogHandleForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_3();
          }
          id v9 = 0;
        }
      }
      else
      {
        id v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_1();
        }
        id v9 = 0;
      }

      _Block_object_dispose(&v35, 8);
    }
  }

  return v9;
}

void __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke_cold_1();
    }
  }
  uint64_t v8 = [v5 image];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  float v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)_previewURLForKey:(id)a3
{
  return CKSpotlightPreviewCachesFileURL(a3, @"png");
}

- (void)_persistPreview:(id)a3 atURL:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = dispatch_get_global_queue(0, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke;
    v17[3] = &unk_1E5620AF8;
    double v18 = v5;
    id v19 = v7;
    dispatch_async(v8, v17);

    uint64_t v9 = v18;
  }
  else
  {
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator _persistPreview:atURL:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

void __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = UIImagePNGRepresentation(*(UIImage **)(a1 + 32));
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v4 = (id *)(a1 + 40);
    id v12 = 0;
    char v6 = [v2 writeToURL:v5 options:1 error:&v12];
    id v7 = v12;
    if (v7) {
      char v8 = 0;
    }
    else {
      char v8 = v6;
    }
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = *v4;
          *(_DWORD *)buf = 138412290;
          id v14 = v10;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Persisted preview to URL OK: %@", buf, 0xCu);
        }
      }
      uint64_t v11 = [*v4 path];
      [v11 im_markFileAsPurgeable:1];
    }
    else
    {
      uint64_t v11 = IMLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_2((uint64_t)v4, v7, v11);
      }
    }
  }
  else
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_1();
    }
  }
}

- (void)beginFetchingLinkMetadataForQueryResult:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    char v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CKSearchThumbnailPreviewGenerator beginFetchingLinkMetadataForQueryResult:]();
    }
    goto LABEL_13;
  }
  if (![(CKSearchThumbnailPreviewGenerator *)self hasCachedLinkMetadataForQueryResult:v4])
  {
    uint64_t v5 = [v4 item];
    char v6 = [v5 uniqueIdentifier];

    id v7 = [v4 identifier];
    if (v7 && v6)
    {
      char v8 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightLPLinkMetadataGeneration];
      char v9 = [v8 containsObject:v7];

      if ((v9 & 1) == 0)
      {
        id v10 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightLPLinkMetadataGeneration];
        [v10 addObject:v7];

        uint64_t v11 = [MEMORY[0x1E4F6BC30] sharedInstance];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke;
        v13[3] = &unk_1E5628DB8;
        v13[4] = self;
        id v14 = v4;
        uint64_t v15 = v6;
        id v16 = v7;
        [v11 loadMessageItemWithGUID:v15 completionBlock:v13];
      }
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CKSearchThumbnailPreviewGenerator beginFetchingLinkMetadataForQueryResult:]();
      }
    }
LABEL_13:
  }
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] _lpPreviewLoadQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2;
  block[3] = &unk_1E5623170;
  id v9 = a1[5];
  id v10 = v3;
  id v5 = a1[6];
  id v6 = a1[4];
  id v11 = v5;
  id v12 = v6;
  id v13 = a1[7];
  id v7 = v3;
  dispatch_async(v4, block);
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) item];
  id v3 = [v2 attributeSet];
  id v4 = [v3 attributeDictionary];
  id v5 = [v4 objectForKey:@"com_apple_mobilesms_lpPluginPaths"];

  if (*(void *)(a1 + 40))
  {
    id v6 = [MEMORY[0x1E4F6BC18] sharedInstance];
    id v7 = (objc_class *)[v6 dataSourceClassForBundleID:*MEMORY[0x1E4F6CC10]];

    char v8 = (void *)[objc_alloc(MEMORY[0x1E4F6BD80]) initWithMessageItem:*(void *)(a1 + 40)];
    id v9 = v8;
    if (v5) {
      [v8 addAttachmentsFromFilePaths:v5];
    }
    id v10 = (void *)[[v7 alloc] initWithPluginPayload:v9];
    if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      id v11 = [v10 richLinkMetadata];
    }
    else
    {
      id v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_cold_1(v7, a1, v12);
      }

      id v11 = 0;
    }
    [*(id *)(a1 + 56) _prewarmLinkMetadata:v11];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_276;
    block[3] = &unk_1E5621088;
    id v13 = *(void **)(a1 + 64);
    void block[4] = *(void *)(a1 + 56);
    id v20 = v13;
    id v21 = v11;
    id v22 = *(id *)(a1 + 32);
    id v14 = v11;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_277;
    v16[3] = &unk_1E5620AA8;
    uint64_t v15 = *(void **)(a1 + 64);
    v16[4] = *(void *)(a1 + 56);
    id v17 = v15;
    id v18 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], v16);
  }
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_276(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) keysWithInFlightLPLinkMetadataGeneration];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) lpLinkMetadataCache];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    [v3 setObject:v5 forKey:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v6 forKey:*(void *)(a1 + 40)];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CKSearchLPLinkMetadataDidChange" object:*(void *)(a1 + 56)];
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_277(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) keysWithInFlightLPLinkMetadataGeneration];
  [v2 removeObject:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) lpLinkMetadataCache];
  id v4 = [MEMORY[0x1E4F1CA98] null];
  [v3 setObject:v4 forKey:*(void *)(a1 + 40)];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"CKSearchLPLinkMetadataDidChange" object:*(void *)(a1 + 48)];
}

- (BOOL)hasCachedLinkMetadataForQueryResult:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 identifier];
  id v5 = [(CKSearchThumbnailPreviewGenerator *)self lpLinkMetadataCache];
  id v6 = [v5 objectForKey:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)cachedLinkMetadataForQueryResult:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  id v6 = [v4 identifier];
  BOOL v7 = [(CKSearchThumbnailPreviewGenerator *)self lpLinkMetadataCache];
  char v8 = [v7 objectForKey:v6];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = v8;
      goto LABEL_11;
    }
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Returning nil cached link metadata. Previous attempt at generating metadata failed for search result: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  id v10 = 0;
LABEL_11:

LABEL_12:

  return v10;
}

- (void)_prewarmLinkMetadata:(id)a3
{
  id v9 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v3 = +[CKUIBehavior sharedBehaviors];
    int v4 = [v3 isAccessibilityPreferredContentSizeCategory];

    id v5 = +[CKUIBehavior sharedBehaviors];
    [v5 searchLinksThumbnailWidth];
    double v7 = v6;

    double v8 = 0.85;
    if (v4) {
      double v8 = 1.2;
    }
    objc_msgSend(v9, "_decodeAllImagesWithMaximumSize:", v7, v8 * v7);
  }
}

- (void)beginGeneratingWebLinkPresentationPropertiesForQueryResult:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 item];
    double v7 = [v6 attributeSet];
    double v8 = [v7 contentURL];

    id v9 = [v5 identifier];
    if (v9 && v8)
    {
      if (![(CKSearchThumbnailPreviewGenerator *)self hasCachedWalletItemLinkPropertiesForQueryResult:v5])
      {
        id v11 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightLPWalletItemPropertiesMetadataGeneration];
        char v12 = [v11 containsObject:v9];

        if ((v12 & 1) == 0)
        {
          id v13 = [(CKSearchThumbnailPreviewGenerator *)self keysWithInFlightLPWalletItemPropertiesMetadataGeneration];
          [v13 addObject:v9];

          uint64_t v14 = [(CKSearchThumbnailPreviewGenerator *)self _lpWalletItemLinkPreviewLoadQueue];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke;
          v15[3] = &unk_1E5621088;
          id v16 = v8;
          id v17 = self;
          id v18 = v9;
          id v19 = v5;
          dispatch_async(v14, v15);
        }
        goto LABEL_13;
      }
      if (!IMOSLoggingEnabled())
      {
LABEL_13:

        goto LABEL_14;
      }
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Request to generate webLinkPresentation properties but we already have a cached value. Doing nothing.", buf, 2u);
      }
    }
    else
    {
      id v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CKSearchThumbnailPreviewGenerator beginGeneratingWebLinkPresentationPropertiesForQueryResult:]();
      }
    }

    goto LABEL_13;
  }
  double v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[CKSearchThumbnailPreviewGenerator beginFetchingLinkMetadataForQueryResult:]();
  }
LABEL_14:
}

void __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pathExtension];
  int v3 = [v2 isEqualToString:@"order"];

  if (v3)
  {
    id v4 = [[CKOrderMediaObject alloc] _initWithOverrideFileURL:*(void *)(a1 + 32)];
    id v5 = [v4 previewMetadataFilenameExtension];
    double v6 = IMAttachmentPreviewMetadataFileURL();

    double v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    double v8 = [v6 path];
    int v9 = [v7 fileExistsAtPath:v8];

    if (!v9
      || ([v4 previewMetadataWithContentsOfURL:v6 error:0],
          (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v10 = [v4 generatePreviewMetadata];
      [v4 writePreviewMetadata:v10 toURL:v6 error:0];
    }
    [v4 setOverrideMetadataProperties:v10];
    id v11 = +[CKUIBehavior sharedBehaviors];
    [v11 previewMaxWidth];
    char v12 = objc_msgSend(v4, "presentationPropertiesForWidth:orientation:", 0);

    if (v12)
    {
      id v13 = [v12 image];

      if (!v13)
      {
        uint64_t v14 = [MEMORY[0x1E4F42A80] systemImageNamed:@"shippingbox.fill"];
        uint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithPlatformImage:v14];
        [v12 setImage:v15];

        id v16 = objc_alloc_init(MEMORY[0x1E4F30A50]);
        id v17 = [MEMORY[0x1E4F428B8] tertiarySystemGroupedBackgroundColor];
        [v16 setBackgroundColor:v17];

        [v12 setImageProperties:v16];
      }
    }
    id v18 = (id *)v26;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_2;
    v26[3] = &unk_1E5621088;
    void v26[4] = *(void *)(a1 + 40);
    v26[5] = v12;
  }
  else
  {
    id v4 = [[CKPassPreviewMediaObject alloc] _initWithOverrideFileURL:*(void *)(a1 + 32)];
    id v19 = [v4 previewMetadataFilenameExtension];
    double v6 = IMAttachmentPreviewMetadataFileURL();

    id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v21 = [v6 path];
    int v22 = [v20 fileExistsAtPath:v21];

    if (!v22
      || ([v4 previewMetadataWithContentsOfURL:v6 error:0],
          (id v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      id v10 = [v4 generatePreviewMetadata];
      [v4 writePreviewMetadata:v10 toURL:v6 error:0];
    }
    [v4 setOverrideMetadataProperties:v10];
    double v23 = +[CKUIBehavior sharedBehaviors];
    [v23 previewMaxWidth];
    char v12 = objc_msgSend(v4, "presentationPropertiesForWidth:orientation:", 0);

    id v18 = (id *)v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_3;
    v25[3] = &unk_1E5621088;
    v25[4] = *(void *)(a1 + 40);
    v25[5] = v12;
  }
  v18[6] = *(id *)(a1 + 48);
  v18[7] = *(id *)(a1 + 56);
  id v24 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v18);
}

void __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lpWalletItemPropertiesMetadataCache];
  int v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    [v2 setObject:v4 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v5 forKey:*(void *)(a1 + 48)];
  }
  double v6 = [*(id *)(a1 + 32) keysWithInFlightLPWalletItemPropertiesMetadataGeneration];
  [v6 removeObject:*(void *)(a1 + 48)];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CKSearchLPWalletItemMetadataDidChange" object:*(void *)(a1 + 56)];
}

void __96__CKSearchThumbnailPreviewGenerator_beginGeneratingWebLinkPresentationPropertiesForQueryResult___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lpWalletItemPropertiesMetadataCache];
  int v3 = v2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4)
  {
    [v2 setObject:v4 forKey:*(void *)(a1 + 48)];
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
    [v3 setObject:v5 forKey:*(void *)(a1 + 48)];
  }
  double v6 = [*(id *)(a1 + 32) keysWithInFlightLPWalletItemPropertiesMetadataGeneration];
  [v6 removeObject:*(void *)(a1 + 48)];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"CKSearchLPWalletItemMetadataDidChange" object:*(void *)(a1 + 56)];
}

- (BOOL)hasCachedWalletItemLinkPropertiesForQueryResult:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v4 = [a3 identifier];
  id v5 = [(CKSearchThumbnailPreviewGenerator *)self lpWalletItemPropertiesMetadataCache];
  double v6 = [v5 objectForKey:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (id)cachedWalletItemLinkPropertiesForQueryResult:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    id v10 = 0;
    goto LABEL_12;
  }
  double v6 = [v4 identifier];
  BOOL v7 = [(CKSearchThumbnailPreviewGenerator *)self lpWalletItemPropertiesMetadataCache];
  double v8 = [v7 objectForKey:v6];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = v8;
      goto LABEL_11;
    }
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Returning nil web link presentation properties. Previous attempt at generating this failed for search result: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  id v10 = 0;
LABEL_11:

LABEL_12:

  return v10;
}

- (NSCache)thumbnailCache
{
  return self->_thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
}

- (NSCache)livePhotoStatusCache
{
  return self->_livePhotoStatusCache;
}

- (void)setLivePhotoStatusCache:(id)a3
{
}

- (NSCache)spatialStatusCache
{
  return self->_spatialStatusCache;
}

- (void)setSpatialStatusCache:(id)a3
{
}

- (NSCache)videoDurationCache
{
  return self->_videoDurationCache;
}

- (void)setVideoDurationCache:(id)a3
{
}

- (NSCache)lpLinkMetadataCache
{
  return self->_lpLinkMetadataCache;
}

- (void)setLpLinkMetadataCache:(id)a3
{
}

- (NSCache)lpWalletItemPropertiesMetadataCache
{
  return self->_lpWalletItemPropertiesMetadataCache;
}

- (void)setLpWalletItemPropertiesMetadataCache:(id)a3
{
}

- (NSMutableDictionary)mapHashesCache
{
  return self->_mapHashesCache;
}

- (void)setMapHashesCache:(id)a3
{
}

- (NSMutableSet)keysWithInFlightGeneration
{
  return self->_keysWithInFlightGeneration;
}

- (void)setKeysWithInFlightGeneration:(id)a3
{
}

- (NSMutableSet)keysWithInFlightLivePhotoStatus
{
  return self->_keysWithInFlightLivePhotoStatus;
}

- (void)setKeysWithInFlightLivePhotoStatus:(id)a3
{
}

- (NSMutableSet)keysWithInFlightSpatialStatus
{
  return self->_keysWithInFlightSpatialStatus;
}

- (void)setKeysWithInFlightSpatialStatus:(id)a3
{
}

- (NSMutableSet)keysWithInFlightVideoDurationCalculation
{
  return self->_keysWithInFlightVideoDurationCalculation;
}

- (void)setKeysWithInFlightVideoDurationCalculation:(id)a3
{
}

- (NSMutableSet)keysWithInFlightLPLinkMetadataGeneration
{
  return self->_keysWithInFlightLPLinkMetadataGeneration;
}

- (void)setKeysWithInFlightLPLinkMetadataGeneration:(id)a3
{
}

- (NSMutableSet)keysWithInFlightLPWalletItemPropertiesMetadataGeneration
{
  return self->_keysWithInFlightLPWalletItemPropertiesMetadataGeneration;
}

- (void)setKeysWithInFlightLPWalletItemPropertiesMetadataGeneration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysWithInFlightLPWalletItemPropertiesMetadataGeneration, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightLPLinkMetadataGeneration, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightVideoDurationCalculation, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightSpatialStatus, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightLivePhotoStatus, 0);
  objc_storeStrong((id *)&self->_keysWithInFlightGeneration, 0);
  objc_storeStrong((id *)&self->_mapHashesCache, 0);
  objc_storeStrong((id *)&self->_lpWalletItemPropertiesMetadataCache, 0);
  objc_storeStrong((id *)&self->_lpLinkMetadataCache, 0);
  objc_storeStrong((id *)&self->_videoDurationCache, 0);
  objc_storeStrong((id *)&self->_spatialStatusCache, 0);
  objc_storeStrong((id *)&self->_livePhotoStatusCache, 0);

  objc_storeStrong((id *)&self->_thumbnailCache, 0);
}

- (void)generatePreviewForQueryResult:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, (uint64_t)v0, "Cannot generate preview, key %@ url %@", v1);
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, (uint64_t)v0, "Failed to create preview thumbnail URL (preview NOT persisted) for key: %@, URL: %@", v1);
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_189_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to generate icon for attachment for URL: %@", v2, v3, v4, v5, v6);
}

void __67__CKSearchThumbnailPreviewGenerator_generatePreviewForQueryResult___block_invoke_189_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 64) localizedDescription];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8(&dword_18EF18000, a2, v4, "Failed to generate preview for attachment at URL, generating icon. URL: %@, error: %@", v5);
}

- (void)queryResultHasLivePhoto:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot determine live photo status, no identifer on result", v2, v3, v4, v5, v6);
}

- (void)_checkResultForLivePhotoComplement:.cold.1()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Cannot determine live photo status url %@", v2, v3, v4, v5, v6);
}

- (void)queryResultIsSpatial:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot determine spatial status, no identifer on result", v2, v3, v4, v5, v6);
}

- (void)_checkResultForSpatialMedia:.cold.1()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Cannot determine spatial status url %@", v2, v3, v4, v5, v6);
}

- (void)queryResultIsVideo:.cold.1()
{
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Cannot determine video url %@", v2, v3, v4, v5, v6);
}

- (void)durationForVideoResult:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot determine video duration, no identifer on result", v2, v3, v4, v5, v6);
}

- (void)_calculateDurationForVideoResult:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to generate AVURLAsset from %@", v2, v3, v4, v5, v6);
}

void __93__CKSearchThumbnailPreviewGenerator_generateAndCacheThumbnailWithURL_request_key_completion___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to get UIImage from QLThumbnailRepresentation for URL: %@", v2, v3, v4, v5, v6);
}

void __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to get icon image for URL: %@", v2, v3, v4, v5, v6);
}

void __80__CKSearchThumbnailPreviewGenerator_generateAndCacheIconWithURL_key_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to get icon UIImage from SIImage for URL: %@", v2, v3, v4, v5, v6);
}

void __83__CKSearchThumbnailPreviewGenerator_generateAndCachePassWithURL_forKey_completion___block_invoke_219_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, v1, "Failed to passView preview for key: %@, URL: %@", v2);
}

- (void)_asyncLoadCachedDiskPreviewForKeyIfAvailable:completion:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create preview URL for key: %@", v2, v3, v4, v5, v6);
}

void __93__CKSearchThumbnailPreviewGenerator__asyncLoadCachedDiskPreviewForKeyIfAvailable_completion___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, (uint64_t)v0, "Failed to create preview image from image source data for key: %@, url: %@", v1);
}

- (void)generateMapPreviewForQueryResult:traitCollection:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Cannot generate map preview, nil key", v2, v3, v4, v5, v6);
}

void __86__CKSearchThumbnailPreviewGenerator_generateMapPreviewForQueryResult_traitCollection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Got error back in CKSearchThumbnailPreviewGenerator for map snapshot: %@", v2, v3, v4, v5, v6);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = @"MapKit";
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, v1, "Failed weak linking %@ from %@.", (uint8_t *)v2);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = @"MapKit";
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, v1, "Failed weak linking %@ from %@.", (uint8_t *)v2);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_3()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_3_0();
  uint64_t v3 = @"MapKit";
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, v1, "Failed weak linking %@ from %@.", (uint8_t *)v2);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Invalid MKCoordinateRegion, bailing!", v2, v3, v4, v5, v6);
}

void __103__CKSearchThumbnailPreviewGenerator__generateMapThumbnailForKey_attributes_traitCollection_completion___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "%@ has invalid coordinate. Abort preview generation.", v2, v3, v4, v5, v6);
}

void __75__CKSearchThumbnailPreviewGenerator_mapPlaceholderImageForTraitCollection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Got error back in CKLocationMediaObject for map snapshot: %@", v2, v3, v4, v5, v6);
}

- (void)_persistPreview:(uint64_t)a3 atURL:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_0(&dword_18EF18000, v0, v1, "Failed to create data representation for preview at URL: %@. Preview NOT persisted.", v2, v3, v4, v5, v6);
}

void __59__CKSearchThumbnailPreviewGenerator__persistPreview_atURL___block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 localizedDescription];
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_8(&dword_18EF18000, a3, v5, "Failed to persist preview data to disk for URL: %@, with error: %@", v6);
}

- (void)beginFetchingLinkMetadataForQueryResult:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_18EF18000, v0, v1, "Trying to get link meta data with nil result", v2, v3, v4, v5, v6);
}

- (void)beginFetchingLinkMetadataForQueryResult:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, (uint64_t)v0, "Failed load key or guid for link meta data - key: %@, guid: %@", v1);
}

void __77__CKSearchThumbnailPreviewGenerator_beginFetchingLinkMetadataForQueryResult___block_invoke_2_cold_1(Class aClass, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (aClass)
  {
    NSStringFromClass(aClass);
    uint8_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint8_t v6 = @"NULL";
  }
  uint64_t v7 = *(void *)(a2 + 48);
  int v8 = 138412546;
  int v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  OUTLINED_FUNCTION_8(&dword_18EF18000, a3, (uint64_t)a3, "Rich links data source of type %@ did not provide linkMetaData for guid: %@", (uint8_t *)&v8);
  if (aClass) {
}
  }

- (void)beginGeneratingWebLinkPresentationPropertiesForQueryResult:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_18EF18000, v0, (uint64_t)v0, "Failed load key or contentURL for link meta data - key: %@, guid: %@", v1);
}

@end