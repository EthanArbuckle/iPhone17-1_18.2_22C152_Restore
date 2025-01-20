@interface HLPImageCacheController
+ (id)defaultInMemoryImageCache;
+ (id)sharedInstance;
- (BOOL)isURLValid:(id)a3;
- (id)formattedDataWithData:(id)a3;
- (id)formattedDataWithFileURL:(id)a3;
- (id)getImageForPath:(id)a3;
- (id)imageFromMemoryCacheForPath:(id)a3;
- (id)newDataCache;
- (void)addInMemoryCacheForImage:(id)a3 identifier:(id)a4 cost:(unint64_t)a5;
- (void)addInMemoryCacheForImage:(id)a3 path:(id)a4 cost:(unint64_t)a5;
- (void)commonInit;
- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4;
- (void)removeAllDataCache;
- (void)removeInMemoryCache;
- (void)removeInMemoryCacheForPath:(id)a3;
@end

@implementation HLPImageCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_0 != -1) {
    dispatch_once(&sharedInstance_predicate_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_gHLPImageCacheController;
  return v2;
}

uint64_t __41__HLPImageCacheController_sharedInstance__block_invoke()
{
  sharedInstance_gHLPImageCacheController = [(HLPDataCacheController *)[HLPImageCacheController alloc] initWithIdentifier:@"HLPImageCacheIdentifier" directoryName:@"com.apple.helpkit.Images" maxCacheSize:20971520 URLSessionDataType:4];
  return MEMORY[0x270F9A758]();
}

+ (id)defaultInMemoryImageCache
{
  if (defaultInMemoryImageCache_predicate != -1) {
    dispatch_once(&defaultInMemoryImageCache_predicate, &__block_literal_global_6);
  }
  v2 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;
  return v2;
}

uint64_t __52__HLPImageCacheController_defaultInMemoryImageCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  v1 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;
  defaultInMemoryImageCache_gInMemoryImageCache = (uint64_t)v0;

  v2 = (void *)defaultInMemoryImageCache_gInMemoryImageCache;
  return [v2 setTotalCostLimit:10485760];
}

- (void)commonInit
{
  v4.receiver = self;
  v4.super_class = (Class)HLPImageCacheController;
  [(HLPDataCacheController *)&v4 commonInit];
  LODWORD(v3) = *MEMORY[0x263F085C0];
  [(HLPDataCacheController *)self setDefaultPriority:v3];
}

- (id)newDataCache
{
  v2 = objc_alloc_init(HLPDataCache);
  [(HLPDataCache *)v2 setCacheType:3];
  [(HLPDataCache *)v2 setMaxAge:345600];
  return v2;
}

- (void)removeAllDataCache
{
  v3.receiver = self;
  v3.super_class = (Class)HLPImageCacheController;
  [(HLPDataCacheController *)&v3 removeAllDataCache];
  [(HLPImageCacheController *)self removeInMemoryCache];
}

- (void)removeInMemoryCache
{
  id v2 = +[HLPImageCacheController defaultInMemoryImageCache];
  [v2 removeAllObjects];
}

- (void)addInMemoryCacheForImage:(id)a3 path:(id)a4 cost:(unint64_t)a5
{
  id v8 = a3;
  id v9 = [a4 lastPathComponent];
  [(HLPImageCacheController *)self addInMemoryCacheForImage:v8 identifier:v9 cost:a5];
}

- (void)addInMemoryCacheForImage:(id)a3 identifier:(id)a4 cost:(unint64_t)a5
{
  id v10 = a3;
  id v7 = a4;
  if (v10)
  {
    id v8 = +[HLPImageCacheController defaultInMemoryImageCache];
    id v9 = v8;
    if (a5) {
      [v8 setObject:v10 forKey:v7 cost:a5];
    }
    else {
      [v8 setObject:v10 forKey:v7];
    }
  }
}

- (void)removeInMemoryCacheForPath:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = +[HLPImageCacheController defaultInMemoryImageCache];
    [v4 removeObjectForKey:v3];
  }
}

- (id)imageFromMemoryCacheForPath:(id)a3
{
  id v3 = [a3 lastPathComponent];
  id v4 = +[HLPImageCacheController defaultInMemoryImageCache];
  v5 = [v4 objectForKey:v3];

  return v5;
}

- (id)getImageForPath:(id)a3
{
  id v4 = a3;
  v5 = [(HLPImageCacheController *)self imageFromMemoryCacheForPath:v4];
  if (!v5)
  {
    v6 = [v4 lastPathComponent];
    id v7 = [(HLPDataCacheController *)self dataCacheForIdentifier:v6];
    id v8 = [(HLPDataCacheController *)self cacheFileURLForDataCache:v7];
    id v9 = v8;
    if (v8)
    {
      id v10 = (void *)MEMORY[0x263F1C6B0];
      v11 = [v8 path];
      v5 = [v10 imageWithContentsOfFile:v11];
    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (BOOL)isURLValid:(id)a3
{
  id v4 = [a3 path];
  v5 = [(HLPImageCacheController *)self imageFromMemoryCacheForPath:v4];
  if (v5)
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [MEMORY[0x263F08850] defaultManager];
    char v6 = [v7 fileExistsAtPath:v4];
  }
  return v6;
}

- (void)formattedDataWithFileURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = [v6 path];
  id v9 = [(HLPImageCacheController *)self imageFromMemoryCacheForPath:v8];
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else if (v6 {
         && ([MEMORY[0x263F08850] defaultManager],
  }
             id v10 = objc_claimAutoreleasedReturnValue(),
             [v6 path],
             v11 = objc_claimAutoreleasedReturnValue(),
             int v12 = [v10 fileExistsAtPath:v11],
             v11,
             v10,
             v12))
  {
    v13 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke;
    block[3] = &unk_264579540;
    id v15 = v6;
    v16 = self;
    v17 = v7;
    dispatch_async(v13, block);
  }
  else
  {
    v7[2](v7, 0, 0);
  }
}

void __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x263EFF8F8]);
  id v3 = [a1[4] path];
  id v4 = (void *)[v2 initWithContentsOfFile:v3];

  v5 = [a1[5] formattedDataWithData:v4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2;
  block[3] = &unk_264578C58;
  id v10 = v5;
  id v6 = a1[6];
  id v11 = v4;
  id v12 = v6;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __70__HLPImageCacheController_formattedDataWithFileURL_completionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = a1[6];
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, v2, a1[5]);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void, void))(v3 + 16))(v3, 0, 0);
  }
}

- (id)formattedDataWithFileURL:(id)a3
{
  id v4 = [a3 path];
  v5 = [v4 lastPathComponent];
  id v6 = [(HLPDataCacheController *)self cacheFileURLForIdentifier:v5];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F1C6B0];
    id v8 = [v6 path];
    id v9 = [v7 imageWithContentsOfFile:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)formattedDataWithData:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithData:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

@end