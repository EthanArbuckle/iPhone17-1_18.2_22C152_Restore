@interface GKImageSource
+ (id)cacheDirectoryForImageID:(id)a3;
+ (id)sharedCache;
+ (id)syncQueue;
+ (void)clearCache;
- (BOOL)shouldRenderDefaultImageWithBrush;
- (BOOL)shouldUseTestImage;
- (GKImageBrush)imageBrush;
- (GKImageSource)initWithName:(id)a3 imageBrush:(id)a4;
- (GKUtilityService)utilityService;
- (NSCache)cache;
- (NSString)name;
- (UIImage)defaultImage;
- (UIImage)renderedDefaultImage;
- (id)cachedImageForIdentifier:(id)a3;
- (id)cachedImageForKey:(id)a3;
- (id)fastCachedImageForIdentifier:(id)a3;
- (id)fastCachedImageForKey:(id)a3;
- (id)fastCachedOrDefaultImageForForKey:(id)a3;
- (id)fastCachedOrDefaultImageForIdentifier:(id)a3;
- (id)keyForImageIdentifier:(id)a3;
- (id)processAndCacheImage:(id)a3 forIdentifier:(id)a4;
- (id)processAndCacheImage:(id)a3 forKey:(id)a4;
- (id)processAndCacheImageDataInContext:(id)a3 withImage:(id)a4 forIdentifier:(id)a5;
- (id)processAndCacheImageDataInContext:(id)a3 withImage:(id)a4 forKey:(id)a5;
- (id)renderedImageWithImage:(id)a3;
- (id)renderedImageWithImage:(id)a3 defaultSize:(CGSize)a4 returnContext:(id *)a5;
- (id)renderedImageWithImage:(id)a3 returnContext:(id *)a4;
- (id)renderedTestImage;
- (id)subsourceWithBrush:(id)a3;
- (unint64_t)cacheCostForImage:(id)a3;
- (void)_storeImage:(id)a3 cacheKey:(id)a4 path:(id)a5 context:(id)a6;
- (void)cacheImageFromContext:(id)a3 forIdentifier:(id)a4;
- (void)clearCachedImageForIdentifier:(id)a3;
- (void)dealloc;
- (void)setCache:(id)a3;
- (void)setDefaultImage:(id)a3;
- (void)setImageBrush:(id)a3;
- (void)setName:(id)a3;
- (void)setRenderedDefaultImage:(id)a3;
- (void)setShouldRenderDefaultImageWithBrush:(BOOL)a3;
- (void)validateFileSystemCache;
@end

@implementation GKImageSource

- (GKUtilityService)utilityService
{
  v2 = [MEMORY[0x263F401B0] daemonProxy];
  v3 = [v2 utilityService];

  return (GKUtilityService *)v3;
}

+ (id)syncQueue
{
  if (syncQueue_onceToken != -1) {
    dispatch_once(&syncQueue_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)syncQueue_syncQueue;
  return v2;
}

uint64_t __26__GKImageSource_syncQueue__block_invoke()
{
  syncQueue_syncQueue = (uint64_t)dispatch_queue_create("com.apple.gamekit.imagesource", 0);
  return MEMORY[0x270F9A758]();
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_142);
  }
  v2 = (void *)sharedCache_sCache;
  return v2;
}

uint64_t __28__GKImageSource_sharedCache__block_invoke()
{
  sharedCache_sCache = [[GKImageCache alloc] initWithName:@"com.apple.GameKit.imagecache" maxCount:50];
  return MEMORY[0x270F9A758]();
}

+ (void)clearCache
{
  id v2 = [(id)objc_opt_class() sharedCache];
  [v2 removeAllObjects];
}

- (GKImageSource)initWithName:(id)a3 imageBrush:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKImageSource;
  v9 = [(GKImageSource *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_imageBrush, a4);
    uint64_t v11 = [(id)objc_opt_class() sharedCache];
    cache = v10->_cache;
    v10->_cache = (NSCache *)v11;
  }
  return v10;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKImageSource;
  [(GKImageSource *)&v4 dealloc];
}

- (id)subsourceWithBrush:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [objc_alloc((Class)objc_opt_class()) initWithName:self->_name imageBrush:v4];

  objc_storeStrong((id *)(v5 + 40), self->_defaultImage);
  objc_storeStrong((id *)(v5 + 16), self->_cache);
  *(unsigned char *)(v5 + 8) = self->_shouldRenderDefaultImageWithBrush;
  return (id)v5;
}

- (id)keyForImageIdentifier:(id)a3
{
  return +[GKImageKey keyForImageIdentifier:a3 withImageSource:self];
}

+ (id)cacheDirectoryForImageID:(id)a3
{
  if (a3)
  {
    id v4 = GKImageCacheRoot();
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)renderedImageWithImage:(id)a3 defaultSize:(CGSize)a4 returnContext:(id *)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  v10 = [(GKImageSource *)self imageBrush];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 scaleForInput:v9];
    double v13 = v12;
    objc_super v14 = (double *)MEMORY[0x263F001A8];
    if (v9)
    {
      [v11 sizeForInput:v9];
      double width = v15;
      double height = v16;
    }
    double v17 = *v14;
    double v18 = v14[1];
    if (!a5 || (v19 = (GKImageContext *)*a5) == 0) {
      v19 = -[GKImageContext initWithSize:scale:options:]([GKImageContext alloc], "initWithSize:scale:options:", 0, width, height, v13);
    }
    objc_msgSend(v11, "drawInRect:withContext:input:", -[GKImageContext CGContext](v19, "CGContext"), v9, v17, v18, width, height);
    id v20 = [(GKImageContext *)v19 image];
    if (a5) {
      *a5 = v19;
    }
  }
  else
  {
    id v20 = v9;
  }

  return v20;
}

- (id)renderedImageWithImage:(id)a3 returnContext:(id *)a4
{
  return -[GKImageSource renderedImageWithImage:defaultSize:returnContext:](self, "renderedImageWithImage:defaultSize:returnContext:", a3, a4, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (id)renderedImageWithImage:(id)a3
{
  return [(GKImageSource *)self renderedImageWithImage:a3 returnContext:0];
}

- (unint64_t)cacheCostForImage:(id)a3
{
  [a3 size];
  return (unint64_t)(v3 * v4);
}

- (UIImage)renderedDefaultImage
{
  if ([(GKImageSource *)self shouldRenderDefaultImageWithBrush]
    && !self->_renderedDefaultImage
    && self->_defaultImage)
  {
    double v3 = -[GKImageSource renderedImageWithImage:](self, "renderedImageWithImage:");
    [(GKImageSource *)self setRenderedDefaultImage:v3];
  }
  renderedDefaultImage = self->_renderedDefaultImage;
  if (!renderedDefaultImage) {
    renderedDefaultImage = self->_defaultImage;
  }
  uint64_t v5 = renderedDefaultImage;
  return v5;
}

- (void)validateFileSystemCache
{
  if (validateFileSystemCache_onceToken != -1) {
    dispatch_once(&validateFileSystemCache_onceToken, &__block_literal_global_152);
  }
}

void __40__GKImageSource_validateFileSystemCache__block_invoke()
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v0 = GKImageCacheRoot();
  v1 = [v0 stringByAppendingPathComponent:@"version.txt"];
  id v2 = (void *)[[NSString alloc] initWithContentsOfFile:v1 encoding:4 error:0];
  double v3 = (NSObject **)MEMORY[0x263F40328];
  double v4 = *MEMORY[0x263F40328];
  if (!*MEMORY[0x263F40328])
  {
    id v5 = (id)GKOSLoggers();
    double v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v0;
    _os_log_impl(&dword_22600C000, v4, OS_LOG_TYPE_INFO, "GKImageCacheRoot is: %@", buf, 0xCu);
  }
  v6 = [MEMORY[0x263F401B8] currentDevice];
  id v7 = [v6 deviceType];
  id v8 = [@"Blacktail6" stringByAppendingFormat:@"-%@", v7];

  id v9 = [MEMORY[0x263F1C5C0] currentDevice];
  v10 = objc_msgSend(v8, "stringByAppendingFormat:", @"-%d", objc_msgSend(v9, "userInterfaceIdiom"));

  if (!v2 || ([v2 isEqualToString:v10] & 1) == 0)
  {
    uint64_t v11 = *v3;
    if (!*v3)
    {
      id v12 = (id)GKOSLoggers();
      uint64_t v11 = *v3;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v2;
      __int16 v29 = 2112;
      v30 = v10;
      __int16 v31 = 2112;
      v32 = v0;
      _os_log_impl(&dword_22600C000, v11, OS_LOG_TYPE_INFO, "Removing old image cache (old version '%@', now '%@'):%@", buf, 0x20u);
    }
    double v13 = [MEMORY[0x263F08850] defaultManager];
    id v26 = 0;
    char v14 = [v13 removeItemAtPath:v0 error:&v26];
    id v15 = v26;
    double v16 = (os_log_t *)MEMORY[0x263F40320];
    if ((v14 & 1) == 0)
    {
      if (!*v3) {
        id v17 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
        __40__GKImageSource_validateFileSystemCache__block_invoke_cold_3();
      }
    }
    id v25 = v15;
    char v18 = [v13 createDirectoryAtPath:v0 withIntermediateDirectories:1 attributes:0 error:&v25];
    id v19 = v25;

    if ((v18 & 1) == 0)
    {
      if (!*v3) {
        id v20 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
        __40__GKImageSource_validateFileSystemCache__block_invoke_cold_2();
      }
    }
    id v24 = v19;
    char v21 = [v10 writeToFile:v1 atomically:1 encoding:4 error:&v24];
    id v22 = v24;

    if (v21)
    {
      _gkMarkFileAsPurgeable();
    }
    else
    {
      if (!*v3) {
        id v23 = (id)GKOSLoggers();
      }
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_ERROR)) {
        __40__GKImageSource_validateFileSystemCache__block_invoke_cold_1();
      }
    }
  }
}

- (id)fastCachedImageForKey:(id)a3
{
  id v4 = a3;
  if ([(GKImageSource *)self shouldUseTestImage])
  {
    id v5 = [(GKImageSource *)self renderedTestImage];
  }
  else
  {
    v6 = [v4 cacheKey];
    id v7 = [(GKImageSource *)self cache];
    id v5 = [v7 objectForKey:v6];
  }
  return v5;
}

- (id)fastCachedImageForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:");
    id v5 = [(GKImageSource *)self fastCachedImageForKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)fastCachedOrDefaultImageForForKey:(id)a3
{
  id v4 = [(GKImageSource *)self fastCachedImageForKey:a3];
  if (!v4)
  {
    id v4 = [(GKImageSource *)self renderedDefaultImage];
  }
  return v4;
}

- (id)fastCachedOrDefaultImageForIdentifier:(id)a3
{
  id v4 = [(GKImageSource *)self fastCachedImageForIdentifier:a3];
  if (!v4)
  {
    id v4 = [(GKImageSource *)self renderedDefaultImage];
  }
  return v4;
}

- (id)cachedImageForKey:(id)a3
{
  id v4 = a3;
  if ([(GKImageSource *)self shouldUseTestImage])
  {
    id v5 = [(GKImageSource *)self renderedTestImage];
  }
  else
  {
    v6 = [v4 cacheKey];
    id v7 = [(GKImageSource *)self cache];
    id v8 = [v7 objectForKey:v6];

    if (v8)
    {
      id v5 = v8;
    }
    else
    {
      [(GKImageSource *)self validateFileSystemCache];
      id v9 = [v4 filePath];
      v10 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v9 isDirectory:0];
      id v5 = +[GKImageContext imageFromRawPixelsAtURL:v10];
      if (v5)
      {
        uint64_t v11 = [(GKImageSource *)self cache];
        [v11 setObject:v5 forKey:v6];

        id v12 = v5;
      }
    }
  }

  return v5;
}

- (id)cachedImageForIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:");
    id v5 = [(GKImageSource *)self cachedImageForKey:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (BOOL)shouldUseTestImage
{
  if (shouldUseTestImage_onceToken != -1) {
    dispatch_once(&shouldUseTestImage_onceToken, &__block_literal_global_165);
  }
  return shouldUseTestImage_sUseTestImage;
}

void __35__GKImageSource_shouldUseTestImage__block_invoke()
{
  id v0 = [MEMORY[0x263F40298] shared];
  shouldUseTestImage_sUseTestImage = [v0 shouldUseTestIcons];
}

- (id)renderedTestImage
{
  double v3 = +[GKUITheme sharedTheme];
  id v4 = [v3 imageNamed:@"GKTestIcon"];

  if (v4) {
    [(GKImageSource *)self renderedImageWithImage:v4];
  }
  else {
  id v5 = [(GKImageSource *)self renderedDefaultImage];
  }

  return v5;
}

- (id)processAndCacheImage:(id)a3 forKey:(id)a4
{
  return [(GKImageSource *)self processAndCacheImageDataInContext:0 withImage:a3 forKey:a4];
}

- (id)processAndCacheImage:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = [(GKImageSource *)self keyForImageIdentifier:a4];
  id v8 = [(GKImageSource *)self processAndCacheImage:v6 forKey:v7];

  return v8;
}

- (void)_storeImage:(id)a3 cacheKey:(id)a4 path:(id)a5 context:(id)a6
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v26 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x263F08850] defaultManager];
  double v13 = [v10 stringByDeletingLastPathComponent];
  id v28 = 0;
  char v14 = [v12 createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v28];
  id v15 = v28;

  double v16 = (void *)MEMORY[0x263F40328];
  id v17 = (os_log_t *)MEMORY[0x263F40320];
  if ((v14 & 1) == 0)
  {
    if (!*MEMORY[0x263F40328]) {
      id v18 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR)) {
      -[GKImageSource _storeImage:cacheKey:path:context:]();
    }
  }
  id v19 = (void *)[objc_alloc(NSURL) initFileURLWithPath:v10 isDirectory:0];
  id v27 = 0;
  char v20 = [v11 writeRawPixelsToURL:v19 error:&v27];
  id v21 = v27;
  if ((v20 & 1) == 0)
  {
    if (!*v16) {
      id v22 = (id)GKOSLoggers();
    }
    id v23 = *v17;
    if (os_log_type_enabled(*v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v21;
      _os_log_error_impl(&dword_22600C000, v23, OS_LOG_TYPE_ERROR, "_storeImage path:%@ context:%@ -- error:%@", buf, 0x20u);
    }
  }
  if (v9)
  {
    id v24 = [(GKImageSource *)self cache];
    [v24 setObject:v9 forKey:v26];
  }
  _gkMarkFileAsPurgeable();
}

- (void)cacheImageFromContext:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v10 = [(GKImageSource *)self keyForImageIdentifier:a4];
  id v7 = [v6 image];
  id v8 = [v10 cacheKey];
  id v9 = [v10 filePath];
  [(GKImageSource *)self _storeImage:v7 cacheKey:v8 path:v9 context:v6];
}

- (id)processAndCacheImageDataInContext:(id)a3 withImage:(id)a4 forKey:(id)a5
{
  id v8 = (GKImageContext *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 cacheKey];
  id v12 = [v10 filePath];
  [(GKImageSource *)self validateFileSystemCache];
  if (v12)
  {
    double v13 = [(GKImageSource *)self imageBrush];

    if (v13)
    {
      [v10 size];
      id v30 = v8;
      -[GKImageSource renderedImageWithImage:defaultSize:returnContext:](self, "renderedImageWithImage:defaultSize:returnContext:", v9, &v30);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = v30;

      if (!v14)
      {
        if (v15)
        {
          uint64_t v16 = [(GKImageContext *)v15 image];
          if (v16)
          {
            id v14 = (id)v16;
          }
          else
          {
            if (!*MEMORY[0x263F40328]) {
              id v29 = (id)GKOSLoggers();
            }
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
              -[GKImageSource processAndCacheImageDataInContext:withImage:forKey:]();
            }
            id v14 = 0;
          }
        }
        else
        {
          id v26 = (NSObject **)MEMORY[0x263F40328];
          id v27 = *MEMORY[0x263F40328];
          if (!*MEMORY[0x263F40328])
          {
            id v28 = (id)GKOSLoggers();
            id v27 = *v26;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            -[GKImageSource processAndCacheImageDataInContext:withImage:forKey:](v27);
          }
          id v14 = v9;
          id v15 = 0;
        }
      }
    }
    else
    {
      id v14 = v9;
      [v10 size];
      if (v17 == 0.0 || (double v19 = v18, v18 == 0.0))
      {
        [v14 size];
        double v20 = v21;
        double v19 = v22;
      }
      else
      {
        double v20 = v17;
      }
      id v23 = [GKImageContext alloc];
      [v14 scale];
      id v15 = -[GKImageContext initWithSize:scale:options:](v23, "initWithSize:scale:options:", 0, v20, v19, v24);

      UIGraphicsPushContext([(GKImageContext *)v15 CGContext]);
      objc_msgSend(v14, "drawInRect:", 0.0, 0.0, v20, v19);
      UIGraphicsPopContext();
    }
    [(GKImageSource *)self _storeImage:v14 cacheKey:v11 path:v12 context:v15];
    id v8 = v15;
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)processAndCacheImageDataInContext:(id)a3 withImage:(id)a4 forIdentifier:(id)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(GKImageSource *)self keyForImageIdentifier:a5];
  id v11 = [(GKImageSource *)self processAndCacheImageDataInContext:v9 withImage:v8 forKey:v10];

  return v11;
}

- (void)clearCachedImageForIdentifier:(id)a3
{
  if (a3)
  {
    -[GKImageSource keyForImageIdentifier:](self, "keyForImageIdentifier:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v6 cacheKey];
    id v5 = [(GKImageSource *)self cache];
    [v5 removeObjectForKey:v4];
  }
}

- (NSCache)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (GKImageBrush)imageBrush
{
  return self->_imageBrush;
}

- (void)setImageBrush:(id)a3
{
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (void)setDefaultImage:(id)a3
{
}

- (void)setRenderedDefaultImage:(id)a3
{
}

- (BOOL)shouldRenderDefaultImageWithBrush
{
  return self->_shouldRenderDefaultImageWithBrush;
}

- (void)setShouldRenderDefaultImageWithBrush:(BOOL)a3
{
  self->_shouldRenderDefaultImageWithBrush = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderedDefaultImage, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
  objc_storeStrong((id *)&self->_imageBrush, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

void __40__GKImageSource_validateFileSystemCache__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "Can't write to image cache root:%@", v2, v3, v4, v5, v6);
}

void __40__GKImageSource_validateFileSystemCache__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "Can't create new image cache root:%@", v2, v3, v4, v5, v6);
}

void __40__GKImageSource_validateFileSystemCache__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "Can't remove old image cache root:%@", v2, v3, v4, v5, v6);
}

- (void)_storeImage:cacheKey:path:context:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_22600C000, v1, OS_LOG_TYPE_ERROR, "_storeImage failed to create directory at path:%@ due to error:%@", v2, 0x16u);
}

- (void)processAndCacheImageDataInContext:(void *)a1 withImage:forKey:.cold.1(void *a1)
{
  id v2 = a1;
  __int16 v3 = [(id)OUTLINED_FUNCTION_5() imageBrush];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22600C000, v4, v5, "processAndCacheImageDataInContext no context passed in rendering image with imageBrush %@", v6, v7, v8, v9, v10);
}

- (void)processAndCacheImageDataInContext:withImage:forKey:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_22600C000, v0, v1, "processAndCacheImageDataInContext error retrieving image from context %@", v2, v3, v4, v5, v6);
}

@end