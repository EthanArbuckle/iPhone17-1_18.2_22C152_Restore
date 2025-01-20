@interface MPCRadioArtworkDataSource
+ (id)sharedRadioArtworkDataSource;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (MPCRadioArtworkDataSource)init;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)requestForCatalog:(id)a3 size:(CGSize)a4;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (void)_cacheArtworkRepresentation:(id)a3 forKey:(id)a4;
- (void)_clearCache;
- (void)_handleDidEnterBackgroundNotification:(id)a3;
- (void)_handleWillEnterForegroundNotification:(id)a3;
- (void)_setCacheSize:(unint64_t)a3 preserveExisting:(BOOL)a4;
- (void)dealloc;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
@end

@implementation MPCRadioArtworkDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedArtworkRepresentationsAccessQueue, 0);

  objc_storeStrong((id *)&self->_cachedArtworkRepresentations, 0);
}

- (void)_setCacheSize:(unint64_t)a3 preserveExisting:(BOOL)a4
{
  if (self->_cacheSize != a3)
  {
    self->_cacheSize = a3;
    cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke;
    block[3] = &unk_2643C20F0;
    BOOL v6 = a4;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(cachedArtworkRepresentationsAccessQueue, block);
  }
}

void __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = *(void **)(*(void *)(a1 + 32) + 160);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 48) && *(void *)(a1 + 40))
    {
      [v2 allKeys];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        id v6 = 0;
        uint64_t v7 = *(void *)v16;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v16 != v7) {
              objc_enumerationMutation(v3);
            }
            uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            v10 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:v9];
            if (v10)
            {
              if (!v6) {
                id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
              }
              [v6 setObject:v10 forKey:v9];
              if ((unint64_t)[v6 count] >= *(void *)(a1 + 40))
              {

                goto LABEL_19;
              }
            }
          }
          uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v6 = 0;
      }
LABEL_19:
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v11 = [objc_alloc(MEMORY[0x263F54EF0]) initWithMaximumCapacity:*(void *)(*(void *)(a1 + 32) + 152)];
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 160);
    *(void *)(v12 + 160) = v11;

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke_2;
    v14[3] = &unk_2643C20C8;
    v14[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v14];
  }
}

uint64_t __60__MPCRadioArtworkDataSource__setCacheSize_preserveExisting___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) setObject:a3 forKey:a2];
}

- (void)_clearCache
{
  cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__MPCRadioArtworkDataSource__clearCache__block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_sync(cachedArtworkRepresentationsAccessQueue, block);
}

uint64_t __40__MPCRadioArtworkDataSource__clearCache__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) removeAllObjects];
}

- (void)_cacheArtworkRepresentation:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__MPCRadioArtworkDataSource__cacheArtworkRepresentation_forKey___block_invoke;
  block[3] = &unk_2643C6660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(cachedArtworkRepresentationsAccessQueue, block);
}

uint64_t __64__MPCRadioArtworkDataSource__cacheArtworkRepresentation_forKey___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 160);
  if (!v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F54EF0]) initWithMaximumCapacity:*(void *)(a1[4] + 152)];
    uint64_t v4 = a1[4];
    uint64_t v5 = *(void **)(v4 + 160);
    *(void *)(v4 + 160) = v3;

    v2 = *(void **)(a1[4] + 160);
  }
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];

  return [v2 setObject:v6 forKey:v7];
}

- (void)_handleWillEnterForegroundNotification:(id)a3
{
  if (self->_resumeToForegroundCacheSize >= 1) {
    -[MPCRadioArtworkDataSource _setCacheSize:preserveExisting:](self, "_setCacheSize:preserveExisting:");
  }
}

- (void)_handleDidEnterBackgroundNotification:(id)a3
{
  uint64_t v4 = MPUIApplication();
  char v5 = [v4 isSuspendedUnderLock];

  if ((v5 & 1) == 0)
  {
    self->_resumeToForegroundCacheSize = self->_cacheSize;
    unint64_t backgroundCacheSize = self->_backgroundCacheSize;
    [(MPCRadioArtworkDataSource *)self _setCacheSize:backgroundCacheSize preserveExisting:1];
  }
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return (id)[a3 token];
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 token];
  [v6 scaledFittingSize];
  id v9 = objc_msgSend(v8, "bestArtworkForPixelSize:");
  [v6 destinationScale];
  double v11 = v10;
  if (v10 < 0.00000011920929)
  {
    id v12 = [MEMORY[0x263F82B60] mainScreen];
    [v12 scale];
    double v11 = v13;
  }
  v14 = [MEMORY[0x263F62B60] sharedCache];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v18[3] = &unk_2643C20A0;
  double v23 = v11;
  id v19 = v9;
  uint64_t v20 = self;
  id v21 = v6;
  id v22 = v7;
  id v15 = v7;
  id v16 = v6;
  id v17 = v9;
  [v14 loadImageForRadioArtwork:v17 withCompletionHandler:v18];
}

void __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  double v10 = v9;
  double v11 = 0;
  id v12 = v9;
  if (v7 && !v9)
  {
    [*(id *)(a1 + 32) pixelSize];
    double v14 = v13;
    double v16 = v15;
    if ([v8 isEqualToString:@"image/jpeg"])
    {
      id v17 = objc_msgSend(objc_alloc(MEMORY[0x263F827E8]), "_initWithData:immediateLoadWithMaxSize:scale:renderingIntent:cache:", v7, 0, 0, v14, v16, *(double *)(a1 + 64));
      if ([v17 CGImage])
      {
        if (v17) {
          goto LABEL_10;
        }
      }
      else
      {
      }
    }
    uint64_t v18 = [MEMORY[0x263F827E8] imageWithData:v7 scale:*(double *)(a1 + 64)];
    if (!v18)
    {
      double v23 = (void *)MEMORY[0x263F087E8];
      v24 = (objc_class *)objc_opt_class();
      id v22 = NSStringFromClass(v24);
      id v12 = [v23 errorWithDomain:v22 code:0 userInfo:0];
      double v11 = 0;
LABEL_13:

      goto LABEL_15;
    }
    id v17 = (id)v18;
LABEL_10:
    id v19 = (void *)MEMORY[0x263F11D40];
    uint64_t v20 = [*(id *)(a1 + 48) visualIdenticalityIdentifier];
    double v11 = objc_msgSend(v19, "representationForVisualIdentity:withSize:image:", v20, v17, v14, v16);

    if (!v11)
    {
      id v12 = 0;
      goto LABEL_15;
    }
    id v21 = *(void **)(a1 + 40);
    id v22 = [*(id *)(a1 + 32) URL];
    [v21 _cacheArtworkRepresentation:v11 forKey:v22];
    id v12 = 0;
    goto LABEL_13;
  }
LABEL_15:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2;
  block[3] = &unk_2643C5620;
  id v25 = *(id *)(a1 + 56);
  id v30 = v12;
  id v31 = v25;
  id v29 = v11;
  id v26 = v12;
  id v27 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __83__MPCRadioArtworkDataSource_loadRepresentationForArtworkCatalog_completionHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)requestForCatalog:(id)a3 size:(CGSize)a4
{
  id v4 = a3;
  char v5 = [v4 token];
  [v4 scaledFittingSize];
  double v7 = v6;
  double v9 = v8;

  double v10 = objc_msgSend(v5, "bestArtworkForPixelSize:", v7, v9);
  double v11 = (void *)MEMORY[0x263F08BD8];
  id v12 = [v10 URL];
  double v13 = [v11 requestWithURL:v12];

  return v13;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  id v4 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__17472;
  v46 = __Block_byref_object_dispose__17473;
  id v47 = 0;
  char v5 = [v4 token];
  [v4 scaledFittingSize];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  double v10 = objc_msgSend(v5, "bestArtworkForPixelSize:");
  double v11 = [v10 URL];
  cachedArtworkRepresentationsAccessQueue = self->_cachedArtworkRepresentationsAccessQueue;
  uint64_t v31 = MEMORY[0x263EF8330];
  uint64_t v32 = 3221225472;
  v33 = __69__MPCRadioArtworkDataSource_existingRepresentationForArtworkCatalog___block_invoke;
  v34 = &unk_2643C2078;
  v39 = &v42;
  v35 = self;
  id v13 = v11;
  id v36 = v13;
  id v14 = v5;
  id v37 = v14;
  id v15 = v10;
  id v38 = v15;
  uint64_t v40 = v7;
  uint64_t v41 = v9;
  dispatch_sync(cachedArtworkRepresentationsAccessQueue, &v31);
  double v16 = (void *)v43[5];
  if (!v16)
  {
    id v17 = objc_msgSend(MEMORY[0x263F62B60], "sharedCache", v31, v32, v33, v34, v35, v36, v37);
    uint64_t v18 = [v17 cachedImageDataForRadioArtwork:v15 MIMEType:0];
    if (v18)
    {
      [v4 destinationScale];
      double v20 = v19;
      if (v19 < 0.00000011920929)
      {
        id v21 = [MEMORY[0x263F82B60] mainScreen];
        [v21 scale];
        double v20 = v22;
      }
      double v23 = [MEMORY[0x263F827E8] imageWithData:v18 scale:v20];
      v24 = (void *)MEMORY[0x263F11D40];
      id v25 = [v4 visualIdenticalityIdentifier];
      [v15 pixelSize];
      uint64_t v26 = objc_msgSend(v24, "representationForVisualIdentity:withSize:image:", v25, v23);
      id v27 = (void *)v43[5];
      v43[5] = v26;

      uint64_t v28 = v43[5];
      if (v28) {
        [(MPCRadioArtworkDataSource *)self _cacheArtworkRepresentation:v28 forKey:v13];
      }
    }
    double v16 = (void *)v43[5];
  }
  id v29 = v16;

  _Block_object_dispose(&v42, 8);

  return v29;
}

void __69__MPCRadioArtworkDataSource_existingRepresentationForArtworkCatalog___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v17 = [*(id *)(a1 + 48) artworks];
    unint64_t v5 = [v17 count];
    uint64_t v6 = [v17 indexOfObject:*(void *)(a1 + 56)];
    unint64_t v7 = v6 + 1;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL && v7 < v5)
    {
      while (1)
      {
        uint64_t v9 = [v17 objectAtIndex:v7];
        [v9 pixelSize];
        if (v11 > *(double *)(a1 + 72) + *(double *)(a1 + 72)) {
          break;
        }
        if (v10 > *(double *)(a1 + 80) + *(double *)(a1 + 80)) {
          break;
        }
        id v12 = [v9 URL];
        uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 160) objectForKey:v12];
        uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
        id v15 = *(void **)(v14 + 40);
        *(void *)(v14 + 40) = v13;

        uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v16) {
          break;
        }

        if (v5 == ++v7) {
          goto LABEL_12;
        }
      }
    }
LABEL_12:
  }
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  id v4 = a3;
  if (a3)
  {
    id v5 = a4;
    id v6 = v4;
    unint64_t v7 = [v5 token];
    [v5 scaledFittingSize];
    double v9 = v8;
    double v11 = v10;

    id v12 = objc_msgSend(v7, "bestArtworkForPixelSize:", v9, v11);
    [v6 representationSize];
    double v14 = v13;
    double v16 = v15;

    [v12 pixelSize];
    LOBYTE(v4) = v16 == v18 && v14 == v17;
  }
  return (char)v4;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  uint64_t v3 = [a3 token];
  id v4 = [v3 artworks];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F83330] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F833B8] object:0];
  [v3 removeObserver:self name:*MEMORY[0x263F83340] object:0];

  v4.receiver = self;
  v4.super_class = (Class)MPCRadioArtworkDataSource;
  [(MPAbstractNetworkArtworkDataSource *)&v4 dealloc];
}

- (MPCRadioArtworkDataSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)MPCRadioArtworkDataSource;
  uint64_t v2 = [(MPAbstractNetworkArtworkDataSource *)&v8 init];
  if (v2)
  {
    uint64_t v3 = dispatch_get_global_queue(2, 0);
    dispatch_queue_t v4 = dispatch_queue_create_with_target_V2("com.apple.MediaPlaybackCore.MPCRadioArtworkDataSouce.cachedArtworkRepresentationsAccessQueue", 0, v3);
    cachedArtworkRepresentationsAccessQueue = v2->_cachedArtworkRepresentationsAccessQueue;
    v2->_cachedArtworkRepresentationsAccessQueue = (OS_dispatch_queue *)v4;

    v2->_unint64_t backgroundCacheSize = 1;
    v2->_cacheSize = 50;
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel__handleDidEnterBackgroundNotification_ name:*MEMORY[0x263F83330] object:0];
    [v6 addObserver:v2 selector:sel__handleDidReceiveMemoryWarningNotification_ name:*MEMORY[0x263F83340] object:0];
    [v6 addObserver:v2 selector:sel__handleWillEnterForegroundNotification_ name:*MEMORY[0x263F833B8] object:0];
  }
  return v2;
}

+ (id)sharedRadioArtworkDataSource
{
  if (sharedRadioArtworkDataSource_sRadioArtworkDataSourceOnceToken != -1) {
    dispatch_once(&sharedRadioArtworkDataSource_sRadioArtworkDataSourceOnceToken, &__block_literal_global_17484);
  }
  uint64_t v2 = (void *)sharedRadioArtworkDataSource_sRadioArtworkDataSource;

  return v2;
}

void __57__MPCRadioArtworkDataSource_sharedRadioArtworkDataSource__block_invoke()
{
  v0 = objc_alloc_init(MPCRadioArtworkDataSource);
  v1 = (void *)sharedRadioArtworkDataSource_sRadioArtworkDataSource;
  sharedRadioArtworkDataSource_sRadioArtworkDataSource = (uint64_t)v0;
}

@end