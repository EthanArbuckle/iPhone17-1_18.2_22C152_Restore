@interface FMFMapImageCache
+ (id)sharedInstance;
- (NSCache)_cache;
- (id)_imageForMap:(id)a3;
- (id)_keyForHandles:(id)a3;
- (id)_orientationKey;
- (id)cachedMapForHandles:(id)a3;
- (void)cacheMap:(id)a3 forHandles:(id)a4;
- (void)dealloc;
- (void)set_cache:(id)a3;
@end

@implementation FMFMapImageCache

+ (id)sharedInstance
{
  if (sharedInstance_dispatch_predicate != -1) {
    dispatch_once(&sharedInstance_dispatch_predicate, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

void __34__FMFMapImageCache_sharedInstance__block_invoke()
{
  v0 = LogCategory_Daemon();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2188D1000, v0, OS_LOG_TYPE_INFO, "Creating shared instance of FMFMapImageCache", v3, 2u);
  }

  v1 = objc_alloc_init(FMFMapImageCache);
  v2 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v1;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->__cache name:*MEMORY[0x263F1D060] object:0];

  v4.receiver = self;
  v4.super_class = (Class)FMFMapImageCache;
  [(FMFMapImageCache *)&v4 dealloc];
}

- (void)cacheMap:(id)a3 forHandles:(id)a4
{
  id v6 = a3;
  id v9 = [(FMFMapImageCache *)self _keyForHandles:a4];
  v7 = [(FMFMapImageCache *)self _imageForMap:v6];

  if (v7)
  {
    v8 = [(FMFMapImageCache *)self _cache];
    [v8 setObject:v7 forKey:v9];
  }
}

- (id)cachedMapForHandles:(id)a3
{
  objc_super v4 = [(FMFMapImageCache *)self _keyForHandles:a3];
  v5 = [(FMFMapImageCache *)self _cache];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_orientationKey
{
  v2 = [MEMORY[0x263F1C408] sharedApplication];
  if ((unint64_t)([v2 statusBarOrientation] - 3) >= 2) {
    v3 = @"p";
  }
  else {
    v3 = @"l";
  }
  objc_super v4 = v3;

  return v4;
}

- (id)_keyForHandles:(id)a3
{
  v13[1] = *MEMORY[0x263EF8340];
  objc_super v4 = (void *)MEMORY[0x263F08B30];
  id v5 = a3;
  id v6 = [v4 sortDescriptorWithKey:@"identifier" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v13[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  v8 = [v5 sortedArrayUsingDescriptors:v7];

  id v9 = [v8 description];
  v10 = [(FMFMapImageCache *)self _orientationKey];
  v11 = [v9 stringByAppendingString:v10];

  return v11;
}

- (id)_imageForMap:(id)a3
{
  id v3 = a3;
  [v3 bounds];
  v10.width = v4;
  v10.height = v5;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext)
  {
    v7 = [v3 layer];
    [v7 renderInContext:CurrentContext];

    CurrentContext = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return CurrentContext;
}

- (NSCache)_cache
{
  cache = self->__cache;
  if (!cache)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF8E0]);
    [(FMFMapImageCache *)self set_cache:v4];

    [(NSCache *)self->__cache setCountLimit:25];
    CGFloat v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:self->__cache selector:sel_removeAllObjects name:*MEMORY[0x263F1D060] object:0];

    cache = self->__cache;
  }
  return cache;
}

- (void)set_cache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end