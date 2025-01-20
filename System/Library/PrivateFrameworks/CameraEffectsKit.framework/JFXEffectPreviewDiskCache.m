@interface JFXEffectPreviewDiskCache
+ (id)cachedPathForEffect:(id)a3 version:(id)a4 directoryPath:(id)a5;
+ (id)createCacheAtDirectory:(id)a3;
- (JFXEffectPreviewDiskCache)initWithDirectory:(id)a3;
- (NSOperationQueue)diskAccessQueue;
- (NSString)cacheDirectoryPath;
- (NSString)directoryName;
- (id)cachedURLForEffect:(id)a3 version:(id)a4;
- (void)dealloc;
- (void)previewForEffectID:(id)a3 version:(id)a4 completion:(id)a5;
- (void)removePreviewForEffectID:(id)a3 excludingVersion:(id)a4 completion:(id)a5;
- (void)savePreviewForEffectID:(id)a3 image:(id)a4 version:(id)a5 completion:(id)a6;
@end

@implementation JFXEffectPreviewDiskCache

- (JFXEffectPreviewDiskCache)initWithDirectory:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)JFXEffectPreviewDiskCache;
  v6 = [(JFXEffectPreviewDiskCache *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_directoryName, a3);
    uint64_t v8 = objc_opt_new();
    diskAccessQueue = v7->_diskAccessQueue;
    v7->_diskAccessQueue = (NSOperationQueue *)v8;

    v10 = [NSString stringWithFormat:@"JFXEffectPreviewDiskCache.%@.diskAccessQ", v5];
    [(NSOperationQueue *)v7->_diskAccessQueue setName:v10];

    [(NSOperationQueue *)v7->_diskAccessQueue setMaxConcurrentOperationCount:3];
  }

  return v7;
}

- (void)dealloc
{
  v3 = [(JFXEffectPreviewDiskCache *)self diskAccessQueue];
  [v3 cancelAllOperations];

  v4.receiver = self;
  v4.super_class = (Class)JFXEffectPreviewDiskCache;
  [(JFXEffectPreviewDiskCache *)&v4 dealloc];
}

- (NSString)cacheDirectoryPath
{
  cacheDirectoryPath = self->_cacheDirectoryPath;
  if (!cacheDirectoryPath)
  {
    objc_super v4 = objc_opt_class();
    id v5 = [(JFXEffectPreviewDiskCache *)self directoryName];
    v6 = [v4 createCacheAtDirectory:v5];
    v7 = self->_cacheDirectoryPath;
    self->_cacheDirectoryPath = v6;

    cacheDirectoryPath = self->_cacheDirectoryPath;
  }
  return cacheDirectoryPath;
}

- (void)previewForEffectID:(id)a3 version:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = objc_opt_new();
  objc_initWeak(&location, v11);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  v18 = __67__JFXEffectPreviewDiskCache_previewForEffectID_version_completion___block_invoke;
  v19 = &unk_264C0D4F0;
  id v12 = v8;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  v22 = self;
  id v14 = v10;
  id v23 = v14;
  objc_copyWeak(&v24, &location);
  [v11 addExecutionBlock:&v16];
  objc_msgSend(v11, "setQualityOfService:", 25, v16, v17, v18, v19);
  v15 = [(JFXEffectPreviewDiskCache *)self diskAccessQueue];
  [v15 addOperation:v11];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __67__JFXEffectPreviewDiskCache_previewForEffectID_version_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  objc_super v4 = [*(id *)(a1 + 48) cacheDirectoryPath];
  id v14 = +[JFXEffectPreviewDiskCache cachedPathForEffect:v2 version:v3 directoryPath:v4];

  if (v14
    && ([MEMORY[0x263F08850] defaultManager],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 fileExistsAtPath:v14],
        v5,
        (v6 & 1) != 0)
    && (v7 = objc_loadWeakRetained((id *)(a1 + 64)), int v8 = [v7 isCancelled], v7, !v8))
  {
    id v9 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithContentsOfFile:v14];
    if (v9
      && (id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64)),
          int v11 = [WeakRetained isCancelled],
          WeakRetained,
          !v11))
    {
      uint64_t v12 = *(void *)(a1 + 56);
      id v13 = +[JTImage jtImageWithUIImage:v9];
      (*(void (**)(uint64_t, void *, void))(v12 + 16))(v12, v13, 0);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)savePreviewForEffectID:(id)a3 image:(id)a4 version:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_opt_new();
  objc_initWeak(&location, v14);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __77__JFXEffectPreviewDiskCache_savePreviewForEffectID_image_version_completion___block_invoke;
  v20[3] = &unk_264C0D518;
  v20[4] = self;
  id v15 = v13;
  id v24 = v15;
  id v16 = v10;
  id v21 = v16;
  id v17 = v12;
  id v22 = v17;
  id v18 = v11;
  id v23 = v18;
  objc_copyWeak(&v25, &location);
  [v14 addExecutionBlock:v20];
  [v14 setQualityOfService:17];
  v19 = [(JFXEffectPreviewDiskCache *)self diskAccessQueue];
  [v19 addOperation:v14];

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

void __77__JFXEffectPreviewDiskCache_savePreviewForEffectID_image_version_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) cacheDirectoryPath];
  char v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v7 = [*(id *)(a1 + 32) cacheDirectoryPath];
    id v18 = +[JFXEffectPreviewDiskCache cachedPathForEffect:v6 version:v5 directoryPath:v7];

    if (v18)
    {
      int v8 = [*(id *)(a1 + 56) image];
      id v9 = UIImagePNGRepresentation(v8);

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
      int v11 = [WeakRetained isCancelled];

      if (v11)
      {
        uint64_t v12 = *(void *)(a1 + 64);
        if (v12) {
          (*(void (**)(uint64_t, void))(v12 + 16))(v12, 0);
        }
      }
      else
      {
        uint64_t v16 = [v9 writeToFile:v18 atomically:1];
        uint64_t v17 = *(void *)(a1 + 64);
        if (v17) {
          (*(void (**)(uint64_t, uint64_t))(v17 + 16))(v17, v16);
        }
        if (v16) {
          [*(id *)(a1 + 32) removePreviewForEffectID:*(void *)(a1 + 40) excludingVersion:*(void *)(a1 + 48) completion:0];
        }
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 64);
      if (v15) {
        (*(void (**)(uint64_t, void))(v15 + 16))(v15, 0);
      }
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 64);
    if (v13)
    {
      id v14 = *(void (**)(void))(v13 + 16);
      v14();
    }
  }
}

- (void)removePreviewForEffectID:(id)a3 excludingVersion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = objc_opt_new();
  objc_initWeak(&location, v11);
  uint64_t v16 = MEMORY[0x263EF8330];
  uint64_t v17 = 3221225472;
  id v18 = __82__JFXEffectPreviewDiskCache_removePreviewForEffectID_excludingVersion_completion___block_invoke;
  v19 = &unk_264C0D540;
  id v20 = self;
  id v12 = v10;
  id v23 = v12;
  id v13 = v8;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  objc_copyWeak(&v24, &location);
  [v11 addExecutionBlock:&v16];
  objc_msgSend(v11, "setQualityOfService:", 17, v16, v17, v18, v19, v20);
  uint64_t v15 = [(JFXEffectPreviewDiskCache *)self diskAccessQueue];
  [v15 addOperation:v11];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __82__JFXEffectPreviewDiskCache_removePreviewForEffectID_excludingVersion_completion___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [*(id *)(a1 + 32) cacheDirectoryPath];
  char v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    v27 = [MEMORY[0x263EFF960] preferredLanguages];
    uint64_t v5 = [v27 objectAtIndex:0];
    uint64_t v6 = [MEMORY[0x263F08850] defaultManager];
    id v7 = [*(id *)(a1 + 32) cacheDirectoryPath];
    id v8 = [v6 contentsOfDirectoryAtPath:v7 error:0];

    id v25 = [MEMORY[0x263F08A98] predicateWithFormat:@"(SELF beginswith %@) AND (SELF contains %@)", *(void *)(a1 + 40), v5];
    v26 = v8;
    id v9 = objc_msgSend(v8, "filteredArrayUsingPredicate:");
    id v10 = [NSString stringWithFormat:@"%@-%@-%@.png", *(void *)(a1 + 40), *(void *)(a1 + 48), v5];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (([v16 isEqualToString:v10] & 1) == 0)
          {
            uint64_t v17 = [*(id *)(a1 + 32) cacheDirectoryPath];
            id v18 = [v17 stringByAppendingPathComponent:v16];

            v19 = [MEMORY[0x263F08850] defaultManager];
            [v19 removeItemAtPath:v18 error:0];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v13);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    int v21 = [WeakRetained isCancelled];

    uint64_t v22 = *(void *)(a1 + 56);
    if (v22) {
      (*(void (**)(uint64_t, void))(v22 + 16))(v22, v21 ^ 1u);
    }
  }
  else
  {
    uint64_t v23 = *(void *)(a1 + 56);
    if (v23)
    {
      id v24 = *(void (**)(void))(v23 + 16);
      v24();
    }
  }
}

- (id)cachedURLForEffect:(id)a3 version:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__27;
  v27 = __Block_byref_object_dispose__27;
  id v28 = 0;
  id v8 = (void *)MEMORY[0x263F086D0];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __56__JFXEffectPreviewDiskCache_cachedURLForEffect_version___block_invoke;
  id v18 = &unk_264C0D568;
  v19 = self;
  id v9 = v6;
  id v20 = v9;
  id v10 = v7;
  id v21 = v10;
  uint64_t v22 = &v23;
  id v11 = [v8 blockOperationWithBlock:&v15];
  objc_msgSend(v11, "setQualityOfService:", 25, v15, v16, v17, v18, v19);
  [v11 setQueuePriority:8];
  uint64_t v12 = [(JFXEffectPreviewDiskCache *)self diskAccessQueue];
  [v12 addOperation:v11];

  [v11 waitUntilFinished];
  id v13 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v13;
}

void __56__JFXEffectPreviewDiskCache_cachedURLForEffect_version___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_class();
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = [*(id *)(a1 + 32) cacheDirectoryPath];
  id v10 = [v2 cachedPathForEffect:v4 version:v3 directoryPath:v5];

  id v6 = v10;
  if (v10)
  {
    uint64_t v7 = [NSURL URLWithString:v10];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    id v6 = v10;
  }
}

+ (id)cachedPathForEffect:(id)a3 version:(id)a4 directoryPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF960] preferredLanguages];
  id v11 = [v10 objectAtIndex:0];
  if (v8)
  {
    uint64_t v12 = [NSString stringWithFormat:@"%@-%@-%@.png", v7, v8, v11];
    id v13 = [v9 stringByAppendingPathComponent:v12];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v12 = [v14 contentsOfDirectoryAtPath:v9 error:0];

    uint64_t v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"(SELF beginswith %@) AND (SELF contains %@)", v7, v11];
    uint64_t v16 = [v12 filteredArrayUsingPredicate:v15];
    uint64_t v17 = [v16 firstObject];

    if (v17)
    {
      id v13 = [v9 stringByAppendingPathComponent:v17];
    }
    else
    {
      id v13 = 0;
    }
  }
  return v13;
}

+ (id)createCacheAtDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v4 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  uint64_t v5 = [v4 lastObject];

  id v6 = [v5 stringByAppendingPathComponent:v3];
  id v7 = [MEMORY[0x263F08850] defaultManager];
  int v8 = [v7 fileExistsAtPath:v6];

  if (!v8)
  {
LABEL_6:
    uint64_t v16 = [MEMORY[0x263F086E0] jfxBundle];
    uint64_t v17 = [v16 objectForInfoDictionaryKey:@"CFBundleVersion"];
    uint64_t v18 = [v17 integerValue];

    v19 = [v3 stringByAppendingString:@"buildNumberKey"];
    id v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
    [v20 setInteger:v18 forKey:v19];

    id v21 = [MEMORY[0x263F08850] defaultManager];
    LODWORD(v18) = [v21 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];

    id v22 = 0;
    if (!v18) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
  int v10 = [v9 BOOLForKey:@"purgePickerCacheOnLoad"];
  id v11 = [MEMORY[0x263F086E0] jfxBundle];
  uint64_t v12 = [v11 objectForInfoDictionaryKey:@"CFBundleVersion"];
  unint64_t v13 = [v12 integerValue];

  uint64_t v14 = [v3 stringByAppendingString:@"buildNumberKey"];
  if (v13 > [v9 integerForKey:v14] || v10)
  {
    [v9 setInteger:v13 forKey:v14];
    uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
    [v15 removeItemAtPath:v6 error:0];

    goto LABEL_6;
  }

LABEL_7:
  id v22 = v6;
LABEL_8:

  return v22;
}

- (NSString)directoryName
{
  return self->_directoryName;
}

- (NSOperationQueue)diskAccessQueue
{
  return self->_diskAccessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diskAccessQueue, 0);
  objc_storeStrong((id *)&self->_directoryName, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
}

@end