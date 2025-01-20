@interface FMFMapCache
- (BOOL)fileProtectionDeactivated;
- (BOOL)pendingMapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 andHeight:(double)a7;
- (BOOL)pendingMapImageForRequest:(id)a3;
- (FMFMapCache)init;
- (NSDate)lastPruneDate;
- (NSMutableDictionary)cacheMetaData;
- (NSMutableDictionary)gridImageMetaData;
- (NSMutableDictionary)mapImageMetaData;
- (NSMutableDictionary)noLocationImageMetaData;
- (NSMutableDictionary)pendingMapImageMetaData;
- (NSString)cachePath;
- (NSString)imageCachePath;
- (OS_dispatch_queue)cacheMetaQueue;
- (OS_dispatch_queue)gridImageQueue;
- (OS_dispatch_queue)mapImageQueue;
- (OS_dispatch_queue)noLocationImageQueue;
- (OS_dispatch_queue)pendingImageQueue;
- (double)cacheExpiryInSeconds;
- (double)mapLocationDistanceThreshold;
- (double)pruneIntervalInSeconds;
- (id)cachedGridImageForWidth:(double)a3 andHeight:(double)a4;
- (id)cachedMapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 andHeight:(double)a7;
- (id)cachedMapImageForRequest:(id)a3;
- (id)cachedNoLocationImageForWidth:(double)a3 andHeight:(double)a4;
- (id)gridKeyForWidth:(double)a3 andHeight:(double)a4;
- (id)noLocationKeyForWidth:(double)a3 andHeight:(double)a4;
- (void)cacheGridImage:(id)a3 forWidth:(double)a4 andHeight:(double)a5;
- (void)cacheMapImage:(id)a3 forLocation:(id)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 andHeight:(double)a8;
- (void)cacheMapImage:(id)a3 forRequest:(id)a4;
- (void)cacheNoLocationImage:(id)a3 forWidth:(double)a4 andHeight:(double)a5;
- (void)flushCache;
- (void)pruneCacheIfNeeded;
- (void)readMetaData;
- (void)saveMetaData;
- (void)setCacheMetaData:(id)a3;
- (void)setCacheMetaQueue:(id)a3;
- (void)setCachePath:(id)a3;
- (void)setFileProtectionDeactivated:(BOOL)a3;
- (void)setGridImageMetaData:(id)a3;
- (void)setGridImageQueue:(id)a3;
- (void)setImageCachePath:(id)a3;
- (void)setLastPruneDate:(id)a3;
- (void)setMapImageMetaData:(id)a3;
- (void)setMapImageQueue:(id)a3;
- (void)setMapLocationDistanceThreshold:(double)a3;
- (void)setNoLocationImageMetaData:(id)a3;
- (void)setNoLocationImageQueue:(id)a3;
- (void)setPendingImageQueue:(id)a3;
- (void)setPendingMapImageMetaData:(id)a3;
@end

@implementation FMFMapCache

- (FMFMapCache)init
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)FMFMapCache;
  v2 = [(FMFMapCache *)&v28 init];
  if (v2)
  {
    double v3 = (double)[MEMORY[0x263F3BA10] integerForKey:@"lastPruneTimestamp" inDomain:@"com.apple.findmy"];
    -[FMFMapCache setFileProtectionDeactivated:](v2, "setFileProtectionDeactivated:", [MEMORY[0x263F3BA10] BOOLForKey:@"fileProtectionDisabled" inDomain:@"com.apple.findmy"]);
    v4 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v3];
    [(FMFMapCache *)v2 setLastPruneDate:v4];

    v5 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v6 = [(FMFMapCache *)v2 fileProtectionDeactivated];
      v7 = [(FMFMapCache *)v2 lastPruneDate];
      *(_DWORD *)buf = 67109378;
      BOOL v30 = v6;
      __int16 v31 = 2112;
      v32 = v7;
      _os_log_impl(&dword_20AD87000, v5, OS_LOG_TYPE_DEFAULT, "FMFMapCache: File protection deactivated? %i last prune date? %@", buf, 0x12u);
    }
    [(FMFMapCache *)v2 setMapLocationDistanceThreshold:50.0];
    v8 = objc_opt_new();
    [(FMFMapCache *)v2 setCacheMetaData:v8];

    v9 = objc_opt_new();
    [(FMFMapCache *)v2 setGridImageMetaData:v9];

    v10 = objc_opt_new();
    [(FMFMapCache *)v2 setNoLocationImageMetaData:v10];

    v11 = objc_opt_new();
    [(FMFMapCache *)v2 setMapImageMetaData:v11];

    v12 = objc_opt_new();
    [(FMFMapCache *)v2 setPendingMapImageMetaData:v12];

    v13 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
    v14 = [v13 firstObject];
    v15 = [v14 stringByAppendingPathComponent:@"com.apple.icloud.FMF.FMFMapXPCService"];

    v16 = [v15 stringByAppendingPathComponent:@"FMFMapCacheMeta.data"];
    [(FMFMapCache *)v2 setCachePath:v16];

    [(FMFMapCache *)v2 setImageCachePath:v15];
    v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.icloud.FMF.CacheMetaIO", v17);
    [(FMFMapCache *)v2 setCacheMetaQueue:v18];

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.icloud.FMF.GridImageIO", v17);
    [(FMFMapCache *)v2 setGridImageQueue:v19];

    dispatch_queue_t v20 = dispatch_queue_create("com.apple.icloud.FMF.NoLocationImageIO", v17);
    [(FMFMapCache *)v2 setNoLocationImageQueue:v20];

    dispatch_queue_t v21 = dispatch_queue_create("com.apple.icloud.FMF.MapImageIO", v17);
    [(FMFMapCache *)v2 setMapImageQueue:v21];

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.icloud.FMF.PendingImageQueue", v17);
    [(FMFMapCache *)v2 setPendingImageQueue:v22];

    v23 = [MEMORY[0x263F08850] defaultManager];
    char v24 = [v23 fileExistsAtPath:v15];

    if ((v24 & 1) == 0)
    {
      v25 = LogCategory_FMFMapXPC();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AD87000, v25, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Creating cache folder", buf, 2u);
      }

      v26 = [MEMORY[0x263F08850] defaultManager];
      [v26 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:0 error:0];
    }
    [(FMFMapCache *)v2 readMetaData];
  }
  return v2;
}

- (id)cachedGridImageForWidth:(double)a3 andHeight:(double)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = [(FMFMapCache *)self gridKeyForWidth:a3 andHeight:a4];
  BOOL v6 = [(FMFMapCache *)self gridImageMetaData];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    v8 = (void *)MEMORY[0x263EFF8F8];
    v9 = [v7 path];
    v10 = [v8 dataWithContentsOfFile:v9];

    v11 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cachedGridImageForWidth data retreived: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cacheGridImage:(id)a3 forWidth:(double)a4 andHeight:(double)a5
{
  id v8 = a3;
  v9 = self;
  v10 = [(FMFMapCache *)v9 gridImageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke;
  block[3] = &unk_263FE7590;
  double v17 = a4;
  double v18 = a5;
  v14 = v9;
  id v15 = v8;
  v16 = v9;
  id v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);
}

void __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  double v3 = [v2 gridKeyForWidth:*(double *)(a1 + 56) andHeight:*(double *)(a1 + 64)];
  uint64_t v4 = [v3 stringByAppendingPathExtension:@"png"];
  v5 = (void *)v4;
  BOOL v6 = &stru_26BEE3E40;
  if (v4) {
    BOOL v6 = (__CFString *)v4;
  }
  v7 = v6;

  id v8 = [v2 imageCachePath];
  v9 = [v8 stringByAppendingPathComponent:v7];

  v10 = [NSDictionary dictionaryWithObject:*MEMORY[0x263F08098] forKey:*MEMORY[0x263F080A8]];
  char v11 = [*(id *)(a1 + 40) writeToFile:v9 atomically:1];
  v12 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v19 = v9;
    _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cacheGridImage %@", buf, 0xCu);
  }

  if (v11)
  {
    if (([*(id *)(a1 + 48) fileProtectionDeactivated] & 1) != 0
      || ([MEMORY[0x263F08850] defaultManager],
          int v13 = objc_claimAutoreleasedReturnValue(),
          id v17 = 0,
          [v13 setAttributes:v10 ofItemAtPath:v9 error:&v17],
          v14 = (FMFMapCacheImage *)v17,
          v13,
          !v14))
    {
      v14 = [[FMFMapCacheImage alloc] initWithPath:v9];
      v16 = [v2 gridImageMetaData];
      [v16 setObject:v14 forKey:v3];

      [v2 saveMetaData];
    }
    else
    {
      id v15 = LogCategory_FMFMapXPC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1();
      }
    }
  }
  else
  {
    LogCategory_FMFMapXPC();
    v14 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v19 = v9;
      _os_log_impl(&dword_20AD87000, &v14->super, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write grid image to disk %@", buf, 0xCu);
    }
  }
}

- (id)cachedNoLocationImageForWidth:(double)a3 andHeight:(double)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = [(FMFMapCache *)self noLocationKeyForWidth:a3 andHeight:a4];
  BOOL v6 = [(FMFMapCache *)self noLocationImageMetaData];
  v7 = [v6 objectForKey:v5];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263EFF8F8];
    v9 = [v7 path];
    v10 = [v8 dataWithContentsOfFile:v9];

    char v11 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "FMFMapCache: noLocationImageForWidth data retreived: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)cacheNoLocationImage:(id)a3 forWidth:(double)a4 andHeight:(double)a5
{
  id v8 = a3;
  v9 = self;
  v10 = [(FMFMapCache *)v9 noLocationImageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__FMFMapCache_cacheNoLocationImage_forWidth_andHeight___block_invoke;
  block[3] = &unk_263FE7590;
  double v17 = a4;
  double v18 = a5;
  v14 = v9;
  id v15 = v8;
  v16 = v9;
  id v11 = v8;
  v12 = v9;
  dispatch_async(v10, block);
}

void __55__FMFMapCache_cacheNoLocationImage_forWidth_andHeight___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  double v3 = [v2 noLocationKeyForWidth:*(double *)(a1 + 56) andHeight:*(double *)(a1 + 64)];
  uint64_t v4 = [v3 stringByAppendingPathExtension:@"png"];
  v5 = (void *)v4;
  BOOL v6 = &stru_26BEE3E40;
  if (v4) {
    BOOL v6 = (__CFString *)v4;
  }
  v7 = v6;

  id v8 = [v2 imageCachePath];
  v9 = [v8 stringByAppendingPathComponent:v7];

  v10 = [NSDictionary dictionaryWithObject:*MEMORY[0x263F08098] forKey:*MEMORY[0x263F080A8]];
  char v11 = [*(id *)(a1 + 40) writeToFile:v9 atomically:1];
  v12 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v19 = v9;
    _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cacheNoLocationImage %@", buf, 0xCu);
  }

  if (v11)
  {
    if (([*(id *)(a1 + 48) fileProtectionDeactivated] & 1) != 0
      || ([MEMORY[0x263F08850] defaultManager],
          int v13 = objc_claimAutoreleasedReturnValue(),
          id v17 = 0,
          [v13 setAttributes:v10 ofItemAtPath:v9 error:&v17],
          v14 = (FMFMapCacheImage *)v17,
          v13,
          !v14))
    {
      v14 = [[FMFMapCacheImage alloc] initWithPath:v9];
      v16 = [v2 noLocationImageMetaData];
      [v16 setObject:v14 forKey:v3];

      [v2 saveMetaData];
    }
    else
    {
      id v15 = LogCategory_FMFMapXPC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1();
      }
    }
  }
  else
  {
    LogCategory_FMFMapXPC();
    v14 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      dispatch_queue_t v19 = v9;
      _os_log_impl(&dword_20AD87000, &v14->super, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write grid image to disk %@", buf, 0xCu);
    }
  }
}

- (id)cachedMapImageForRequest:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(FMFMapCache *)self mapImageMetaData];
  BOOL v6 = [v4 key];

  v7 = [v5 objectForKey:v6];

  if (v7)
  {
    id v8 = (void *)MEMORY[0x263EFF8F8];
    v9 = [v7 path];
    v10 = [v8 dataWithContentsOfFile:v9];

    char v11 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_20AD87000, v11, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cachedMapImageForRequest data retreived: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)cachedMapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 andHeight:(double)a7
{
  id v12 = a3;
  int v13 = [[FMFMapImageRequest alloc] initWithLocation:v12 altitude:1 pitch:a4 width:a5 height:a6 andCachingEnabled:a7];

  v14 = [(FMFMapCache *)self cachedMapImageForRequest:v13];

  return v14;
}

- (void)cacheMapImage:(id)a3 forRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = [(FMFMapCache *)self mapImageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FMFMapCache_cacheMapImage_forRequest___block_invoke;
  block[3] = &unk_263FE75E0;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v13 = v6;
  v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __40__FMFMapCache_cacheMapImage_forRequest___block_invoke(id *a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  double v3 = [a1[4] key];
  uint64_t v4 = [v3 stringByAppendingPathExtension:@"png"];
  v5 = (void *)v4;
  id v6 = &stru_26BEE3E40;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  id v7 = v6;

  id v8 = [WeakRetained imageCachePath];
  id v9 = [v8 stringByAppendingPathComponent:v7];

  id v10 = [NSDictionary dictionaryWithObject:*MEMORY[0x263F08098] forKey:*MEMORY[0x263F080A8]];
  char v11 = [a1[5] writeToFile:v9 atomically:1];
  id v12 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cacheMapImage %@", buf, 0xCu);
  }

  if ((v11 & 1) == 0)
  {
    LogCategory_FMFMapXPC();
    id v15 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v25 = v9;
      __int16 v26 = 2112;
      uint64_t v27 = 0;
      _os_log_impl(&dword_20AD87000, &v15->super, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write map image to disk %@ %@", buf, 0x16u);
    }
    goto LABEL_13;
  }
  if (([a1[6] fileProtectionDeactivated] & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        id v13 = objc_claimAutoreleasedReturnValue(),
        id v23 = 0,
        [v13 setAttributes:v10 ofItemAtPath:v9 error:&v23],
        id v14 = v23,
        v13,
        !v14))
  {
    id v15 = [[FMFMapCacheImage alloc] initWithPath:v9];
    v16 = [WeakRetained mapImageMetaData];
    [v16 setObject:v15 forKey:v3];

    [WeakRetained saveMetaData];
LABEL_13:
    id v14 = 0;
    goto LABEL_14;
  }
  LogCategory_FMFMapXPC();
  id v15 = (FMFMapCacheImage *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_ERROR)) {
    __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1();
  }
LABEL_14:

  id v17 = [WeakRetained pendingImageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__FMFMapCache_cacheMapImage_forRequest___block_invoke_59;
  block[3] = &unk_263FE75B8;
  id v21 = WeakRetained;
  id v22 = v3;
  id v18 = v3;
  id v19 = WeakRetained;
  dispatch_sync(v17, block);
}

void __40__FMFMapCache_cacheMapImage_forRequest___block_invoke_59(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingMapImageMetaData];
  double v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) pendingMapImageMetaData];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (void)cacheMapImage:(id)a3 forLocation:(id)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 andHeight:(double)a8
{
  id v14 = a4;
  id v15 = a3;
  v16 = [[FMFMapImageRequest alloc] initWithLocation:v14 altitude:1 pitch:a5 width:a6 height:a7 andCachingEnabled:a8];

  [(FMFMapCache *)self cacheMapImage:v15 forRequest:v16];
}

- (BOOL)pendingMapImageForRequest:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  v5 = [(FMFMapCache *)self pendingImageQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__FMFMapCache_pendingMapImageForRequest___block_invoke;
  v8[3] = &unk_263FE7608;
  objc_copyWeak(&v11, &location);
  id v9 = v4;
  id v10 = &v12;
  id v6 = v4;
  dispatch_sync(v5, v8);

  LOBYTE(v5) = *((unsigned char *)v13 + 24);
  objc_destroyWeak(&v11);
  _Block_object_dispose(&v12, 8);
  objc_destroyWeak(&location);
  return (char)v5;
}

void __41__FMFMapCache_pendingMapImageForRequest___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [*(id *)(a1 + 32) key];
  uint64_t v3 = [v2 stringByAppendingPathExtension:@"png"];
  id v4 = (void *)v3;
  v5 = &stru_26BEE3E40;
  if (v3) {
    v5 = (__CFString *)v3;
  }
  id v6 = v5;

  id v7 = [WeakRetained imageCachePath];
  id v8 = [v7 stringByAppendingPathComponent:v6];

  id v9 = [WeakRetained pendingMapImageMetaData];
  id v10 = [v9 objectForKeyedSubscript:v2];

  if (!v10)
  {
    id v11 = [WeakRetained pendingMapImageMetaData];
    [v11 setObject:v8 forKey:v2];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)pendingMapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 andHeight:(double)a7
{
  id v12 = a3;
  id v13 = [[FMFMapImageRequest alloc] initWithLocation:v12 altitude:1 pitch:a4 width:a5 height:a6 andCachingEnabled:a7];

  LOBYTE(self) = [(FMFMapCache *)self pendingMapImageForRequest:v13];
  return (char)self;
}

- (void)readMetaData
{
  id v2 = self;
  uint64_t v3 = [(FMFMapCache *)v2 cacheMetaQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__FMFMapCache_readMetaData__block_invoke;
  v5[3] = &unk_263FE75B8;
  id v6 = v2;
  id v7 = v2;
  id v4 = v2;
  dispatch_sync(v3, v5);
}

void __27__FMFMapCache_readMetaData__block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  id v7 = (void *)MEMORY[0x263F08928];
  id v8 = (void *)MEMORY[0x263EFF8F8];
  id v9 = [v2 cachePath];
  id v10 = [v8 dataWithContentsOfFile:v9];
  id v27 = 0;
  id v11 = [v7 unarchivedObjectOfClasses:v6 fromData:v10 error:&v27];
  id v12 = v27;

  if (v12)
  {
    id v13 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      __27__FMFMapCache_readMetaData__block_invoke_cold_2((uint64_t)v12, v13);
    }
  }
  uint64_t v14 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    __27__FMFMapCache_readMetaData__block_invoke_cold_1((uint64_t)v11, v14);
  }

  char v15 = [v11 allKeys];
  if ([v15 count] == 4)
  {
    v16 = [v11 objectForKeyedSubscript:@"version"];
    int v17 = [v16 isEqualToString:@"2"];

    if (v17)
    {
      [v2 setCacheMetaData:v11];
      id v18 = [v11 objectForKeyedSubscript:@"gridImage"];
      [v2 setGridImageMetaData:v18];

      id v19 = [v11 objectForKeyedSubscript:@"noLocationImage"];
      [v2 setNoLocationImageMetaData:v19];

      uint64_t v20 = [v11 objectForKeyedSubscript:@"mapImage"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v21 = [v11 objectForKeyedSubscript:@"mapImage"];
        [v2 setMapImageMetaData:v21];
      }
      id v22 = LogCategory_FMFMapXPC();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = [v2 mapImageMetaData];
        char v24 = [v23 allValues];
        uint64_t v25 = [v24 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v29 = v25;
        _os_log_impl(&dword_20AD87000, v22, OS_LOG_TYPE_DEFAULT, "FMFMapCache: found entries in cache %ld", buf, 0xCu);
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  __int16 v26 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v26, OS_LOG_TYPE_DEFAULT, "FMFMapCache: flushing cache because of version mismatch", buf, 2u);
  }

  [*(id *)(a1 + 40) flushCache];
LABEL_18:
  [*(id *)(a1 + 40) pruneCacheIfNeeded];
}

- (void)saveMetaData
{
  id v2 = self;
  uint64_t v3 = [(FMFMapCache *)v2 cacheMetaQueue];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __27__FMFMapCache_saveMetaData__block_invoke;
  v5[3] = &unk_263FE75B8;
  id v6 = v2;
  id v7 = v2;
  uint64_t v4 = v2;
  dispatch_sync(v3, v5);
}

void __27__FMFMapCache_saveMetaData__block_invoke(uint64_t a1)
{
  *(void *)&v26[5] = *MEMORY[0x263EF8340];
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = objc_opt_new();
  [v3 setObject:@"2" forKey:@"version"];
  uint64_t v4 = [v2 gridImageMetaData];
  [v3 setObject:v4 forKeyedSubscript:@"gridImage"];

  uint64_t v5 = [v2 noLocationImageMetaData];
  [v3 setObject:v5 forKeyedSubscript:@"noLocationImage"];

  id v6 = [v2 mapImageMetaData];
  [v3 setObject:v6 forKeyedSubscript:@"mapImage"];

  id v24 = 0;
  id v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v24];
  id v8 = v24;
  if (v8)
  {
    id v9 = v8;
    id v10 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __27__FMFMapCache_saveMetaData__block_invoke_cold_2((uint64_t)v9, v10);
    }
    goto LABEL_19;
  }
  id v11 = [v2 cachePath];
  int v12 = [v7 writeToFile:v11 atomically:1];

  id v10 = [NSDictionary dictionaryWithObject:*MEMORY[0x263F08098] forKey:*MEMORY[0x263F080A8]];
  id v13 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v2 mapImageMetaData];
    char v15 = [v14 allValues];
    uint64_t v16 = [v15 count];
    *(_DWORD *)buf = 134217984;
    *(void *)__int16 v26 = v16;
    _os_log_impl(&dword_20AD87000, v13, OS_LOG_TYPE_DEFAULT, "FMFMapCache: save map images %ld", buf, 0xCu);
  }
  if ((v12 & 1) == 0)
  {
    int v17 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v2 cachePath];
      *(_DWORD *)buf = 138412290;
      *(void *)__int16 v26 = v18;
      _os_log_impl(&dword_20AD87000, v17, OS_LOG_TYPE_DEFAULT, "FMFMapCache: Unable to write meta data to disk %@", buf, 0xCu);
    }
    id v9 = 0;
    goto LABEL_15;
  }
  if (([*(id *)(a1 + 40) fileProtectionDeactivated] & 1) == 0)
  {
    id v19 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v20 = [v2 cachePath];
    id v23 = 0;
    [v19 setAttributes:v10 ofItemAtPath:v20 error:&v23];
    id v9 = v23;

    if (!v9) {
      goto LABEL_16;
    }
    int v17 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __27__FMFMapCache_saveMetaData__block_invoke_cold_1((uint64_t)v9, v2, v17);
    }
LABEL_15:

    goto LABEL_16;
  }
  id v9 = 0;
LABEL_16:
  id v21 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = [*(id *)(a1 + 40) fileProtectionDeactivated];
    *(_DWORD *)buf = 67109376;
    v26[0] = v12;
    LOWORD(v26[1]) = 1024;
    *(_DWORD *)((char *)&v26[1] + 2) = v22;
    _os_log_impl(&dword_20AD87000, v21, OS_LOG_TYPE_DEFAULT, "FMFMapCache: FMFMapCache: Save meta data? %d %i", buf, 0xEu);
  }

LABEL_19:
}

- (void)flushCache
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v4 = [(FMFMapCache *)self imageCachePath];
  uint64_t v5 = [v3 enumeratorAtPath:v4];

  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      id v8 = LogCategory_FMFMapXPC();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20AD87000, v8, OS_LOG_TYPE_DEFAULT, "FMFMapCache: clearing file", buf, 2u);
      }

      id v9 = [(FMFMapCache *)self imageCachePath];
      id v10 = [v9 stringByAppendingPathComponent:v7];

      id v16 = 0;
      char v11 = [v3 removeItemAtPath:v10 error:&v16];
      id v12 = v16;
      id v13 = v12;
      if ((v11 & 1) == 0 && v12)
      {
        uint64_t v14 = LogCategory_FMFMapXPC();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v10;
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          _os_log_error_impl(&dword_20AD87000, v14, OS_LOG_TYPE_ERROR, "FMFMapCache: error deleting file: %@ error: %@", buf, 0x16u);
        }
      }
      uint64_t v15 = [v5 nextObject];

      id v7 = (void *)v15;
    }
    while (v15);
  }
}

- (void)pruneCacheIfNeeded
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  uint64_t v3 = LogCategory_FMFMapXPC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20AD87000, v3, OS_LOG_TYPE_DEFAULT, "FMFMapCache: pruneCacheIfNeeded", buf, 2u);
  }

  uint64_t v4 = [MEMORY[0x263EFF910] date];
  [v4 timeIntervalSince1970];
  double v6 = v5;
  id v7 = [(FMFMapCache *)self lastPruneDate];
  [v7 timeIntervalSince1970];
  double v9 = v6 - v8;
  [(FMFMapCache *)self pruneIntervalInSeconds];
  double v11 = v10;

  if (v9 > v11)
  {
    v38 = v4;
    id v12 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20AD87000, v12, OS_LOG_TYPE_DEFAULT, "FMFMapCache: prunning cache....", buf, 2u);
    }

    v40 = [MEMORY[0x263F08850] defaultManager];
    id v13 = [(FMFMapCache *)self mapImageMetaData];
    v39 = (void *)[v13 mutableCopy];

    uint64_t v14 = [MEMORY[0x263EFF910] date];
    [v14 timeIntervalSince1970];
    double v16 = v15;

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    int v17 = [(FMFMapCache *)self mapImageMetaData];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v43;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v43 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v42 + 1) + 8 * v21);
          id v23 = [(FMFMapCache *)self mapImageMetaData];
          id v24 = [v23 objectForKeyedSubscript:v22];

          uint64_t v25 = [v24 timestamp];
          [v25 timeIntervalSince1970];
          double v27 = v16 - v26;
          [(FMFMapCache *)self cacheExpiryInSeconds];
          double v29 = v28;

          if (v27 > v29)
          {
            uint64_t v30 = LogCategory_FMFMapXPC();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v47 = v24;
              _os_log_impl(&dword_20AD87000, v30, OS_LOG_TYPE_DEFAULT, "FMFMapCache: removing file: %@", buf, 0xCu);
            }

            __int16 v31 = [v24 path];
            id v41 = 0;
            char v32 = [v40 removeItemAtPath:v31 error:&v41];
            id v33 = v41;

            if ((v32 & 1) == 0 && v33)
            {
              v34 = LogCategory_FMFMapXPC();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              {
                v35 = [v24 path];
                *(_DWORD *)buf = 138412546;
                v47 = v35;
                __int16 v48 = 2112;
                id v49 = v33;
                _os_log_error_impl(&dword_20AD87000, v34, OS_LOG_TYPE_ERROR, "FMFMapCache: error pruning file: %@ error: %@", buf, 0x16u);
              }
            }
            [v39 setObject:0 forKeyedSubscript:v22];
          }
          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v19);
    }

    uint64_t v4 = v38;
    [(FMFMapCache *)self setLastPruneDate:v38];
    [(FMFMapCache *)self setMapImageMetaData:v39];
    v36 = (void *)MEMORY[0x263F3BA10];
    [v38 timeIntervalSince1970];
    [v36 setInteger:(uint64_t)v37 forKey:@"lastPruneTimestamp" inDomain:@"com.apple.findmy"];
  }
}

- (id)gridKeyForWidth:(double)a3 andHeight:(double)a4
{
  double v5 = [NSNumber numberWithDouble:a3];
  double v6 = [v5 stringValue];
  id v7 = [@"gridImage" stringByAppendingString:v6];
  double v8 = [NSNumber numberWithDouble:a4];
  double v9 = [v8 stringValue];
  double v10 = [v7 stringByAppendingString:v9];

  return v10;
}

- (id)noLocationKeyForWidth:(double)a3 andHeight:(double)a4
{
  double v5 = [NSNumber numberWithDouble:a3];
  double v6 = [v5 stringValue];
  id v7 = [@"noLocationImage" stringByAppendingString:v6];
  double v8 = [NSNumber numberWithDouble:a4];
  double v9 = [v8 stringValue];
  double v10 = [v7 stringByAppendingString:v9];

  return v10;
}

- (double)cacheExpiryInSeconds
{
  if (cacheExpiryInSeconds_onceToken != -1) {
    dispatch_once(&cacheExpiryInSeconds_onceToken, &__block_literal_global_4);
  }
  return *(double *)&cacheExpiryInSeconds_cacheExpiryInSeconds;
}

void __35__FMFMapCache_cacheExpiryInSeconds__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F3BA10] integerForKey:@"cacheExpiryInSecondsOverride" inDomain:@"com.apple.findmy"];
  if (v0 >= 1)
  {
    double v1 = (double)v0;
    *(double *)&cacheExpiryInSeconds_cacheExpiryInSeconds = (double)v0;
    id v2 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      double v4 = v1;
      _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "FMFMapCache: cache expiry overriden to %f", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (double)pruneIntervalInSeconds
{
  if (pruneIntervalInSeconds_onceToken != -1) {
    dispatch_once(&pruneIntervalInSeconds_onceToken, &__block_literal_global_66);
  }
  return *(double *)&pruneIntervalInSeconds_pruneIntervalInSeconds;
}

void __37__FMFMapCache_pruneIntervalInSeconds__block_invoke()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F3BA10] integerForKey:@"pruneIntervalInSecondsOverride" inDomain:@"com.apple.findmy"];
  if (v0 >= 1)
  {
    double v1 = (double)v0;
    *(double *)&pruneIntervalInSeconds_pruneIntervalInSeconds = (double)v0;
    id v2 = LogCategory_FMFMapXPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 134217984;
      double v4 = v1;
      _os_log_impl(&dword_20AD87000, v2, OS_LOG_TYPE_DEFAULT, "FMFMapCache: prune interval overriden to %f", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (NSMutableDictionary)cacheMetaData
{
  return self->_cacheMetaData;
}

- (void)setCacheMetaData:(id)a3
{
}

- (NSMutableDictionary)gridImageMetaData
{
  return self->_gridImageMetaData;
}

- (void)setGridImageMetaData:(id)a3
{
}

- (NSMutableDictionary)noLocationImageMetaData
{
  return self->_noLocationImageMetaData;
}

- (void)setNoLocationImageMetaData:(id)a3
{
}

- (NSMutableDictionary)mapImageMetaData
{
  return self->_mapImageMetaData;
}

- (void)setMapImageMetaData:(id)a3
{
}

- (NSMutableDictionary)pendingMapImageMetaData
{
  return self->_pendingMapImageMetaData;
}

- (void)setPendingMapImageMetaData:(id)a3
{
}

- (NSString)cachePath
{
  return self->_cachePath;
}

- (void)setCachePath:(id)a3
{
}

- (NSString)imageCachePath
{
  return self->_imageCachePath;
}

- (void)setImageCachePath:(id)a3
{
}

- (NSDate)lastPruneDate
{
  return self->_lastPruneDate;
}

- (void)setLastPruneDate:(id)a3
{
}

- (OS_dispatch_queue)cacheMetaQueue
{
  return self->_cacheMetaQueue;
}

- (void)setCacheMetaQueue:(id)a3
{
}

- (OS_dispatch_queue)gridImageQueue
{
  return self->_gridImageQueue;
}

- (void)setGridImageQueue:(id)a3
{
}

- (OS_dispatch_queue)noLocationImageQueue
{
  return self->_noLocationImageQueue;
}

- (void)setNoLocationImageQueue:(id)a3
{
}

- (OS_dispatch_queue)mapImageQueue
{
  return self->_mapImageQueue;
}

- (void)setMapImageQueue:(id)a3
{
}

- (OS_dispatch_queue)pendingImageQueue
{
  return self->_pendingImageQueue;
}

- (void)setPendingImageQueue:(id)a3
{
}

- (double)mapLocationDistanceThreshold
{
  return self->_mapLocationDistanceThreshold;
}

- (void)setMapLocationDistanceThreshold:(double)a3
{
  self->_mapLocationDistanceThreshold = a3;
}

- (BOOL)fileProtectionDeactivated
{
  return self->_fileProtectionDeactivated;
}

- (void)setFileProtectionDeactivated:(BOOL)a3
{
  self->_fileProtectionDeactivated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingImageQueue, 0);
  objc_storeStrong((id *)&self->_mapImageQueue, 0);
  objc_storeStrong((id *)&self->_noLocationImageQueue, 0);
  objc_storeStrong((id *)&self->_gridImageQueue, 0);
  objc_storeStrong((id *)&self->_cacheMetaQueue, 0);
  objc_storeStrong((id *)&self->_lastPruneDate, 0);
  objc_storeStrong((id *)&self->_imageCachePath, 0);
  objc_storeStrong((id *)&self->_cachePath, 0);
  objc_storeStrong((id *)&self->_pendingMapImageMetaData, 0);
  objc_storeStrong((id *)&self->_mapImageMetaData, 0);
  objc_storeStrong((id *)&self->_noLocationImageMetaData, 0);
  objc_storeStrong((id *)&self->_gridImageMetaData, 0);

  objc_storeStrong((id *)&self->_cacheMetaData, 0);
}

void __49__FMFMapCache_cacheGridImage_forWidth_andHeight___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_0(&dword_20AD87000, v0, v1, "FMFMapCache: Error setting file protection %@ %@");
}

void __27__FMFMapCache_readMetaData__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20AD87000, a2, OS_LOG_TYPE_DEBUG, "FMFMapCache: meta data content %@", (uint8_t *)&v2, 0xCu);
}

void __27__FMFMapCache_readMetaData__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD87000, a2, OS_LOG_TYPE_ERROR, "Error unarchiving map cache: %@", (uint8_t *)&v2, 0xCu);
}

void __27__FMFMapCache_saveMetaData__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a2 cachePath];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_error_impl(&dword_20AD87000, a3, OS_LOG_TYPE_ERROR, "FMFMapCache: Error setting file protection %@ %@", (uint8_t *)&v6, 0x16u);
}

void __27__FMFMapCache_saveMetaData__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD87000, a2, OS_LOG_TYPE_ERROR, "FMFMapCache: saveMetaData error: %@", (uint8_t *)&v2, 0xCu);
}

@end