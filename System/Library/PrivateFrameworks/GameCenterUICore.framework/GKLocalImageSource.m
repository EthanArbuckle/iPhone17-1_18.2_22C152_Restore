@interface GKLocalImageSource
- (NSMapTable)keysForSizes;
- (id)imageForImageSize:(CGSize)a3;
- (id)keyForImageSize:(CGSize)a3;
- (void)cacheImageUsingGamed:(id)a3 cacheSubdirectory:(id)a4 withHandler:(id)a5;
- (void)cachedImageFromGamedWithSubdirectory:(id)a3 handler:(id)a4;
- (void)deleteImageUsingGamedWithSubdirectory:(id)a3 withHandler:(id)a4;
- (void)setKeysForSizes:(id)a3;
@end

@implementation GKLocalImageSource

- (id)keyForImageSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (!self->_keysForSizes)
  {
    v6 = (NSMapTable *)[objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:256 valueOptions:0 capacity:4];
    keysForSizes = self->_keysForSizes;
    self->_keysForSizes = v6;
  }
  id v8 = (id)((unint64_t)width | ((unint64_t)height << 32));
  v9 = [(NSMapTable *)self->_keysForSizes objectForKey:v8];
  if (!v9)
  {
    v13.double width = width;
    v13.double height = height;
    v10 = NSStringFromCGSize(v13);
    v9 = +[GKImageKey keyForImageIdentifier:v10 withImageSource:self];
    objc_msgSend(v9, "setSize:", width, height);
    [(NSMapTable *)self->_keysForSizes setObject:v9 forKey:v8];
  }
  return v9;
}

- (id)imageForImageSize:(CGSize)a3
{
  v4 = -[GKLocalImageSource keyForImageSize:](self, "keyForImageSize:", a3.width, a3.height);
  v5 = [(GKImageSource *)self cachedImageForKey:v4];
  if (!v5)
  {
    v5 = [(GKImageSource *)self processAndCacheImage:0 forKey:v4];
  }

  return v5;
}

- (void)cachedImageFromGamedWithSubdirectory:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F401C0];
  v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKImageSource.m", 921, "-[GKLocalImageSource cachedImageFromGamedWithSubdirectory:handler:]");
  v10 = [v8 dispatchGroupWithName:v9];

  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke;
  v16[3] = &unk_264789EA8;
  v16[4] = self;
  id v11 = v6;
  id v17 = v11;
  id v12 = v10;
  id v18 = v12;
  [v12 perform:v16];
  if (v7)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_281;
    v13[3] = &unk_26478A338;
    id v15 = v7;
    id v14 = v12;
    [v14 notifyOnMainQueueWithBlock:v13];
  }
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v4 = [*(id *)(a1 + 32) keyForImageIdentifier:*(void *)(a1 + 40)];
  v5 = [v4 cacheKey];
  id v6 = [*(id *)(a1 + 32) cache];
  id v7 = [v6 objectForKey:v5];

  if (v7)
  {
    [*(id *)(a1 + 48) setResult:v7];
    v3[2](v3);
    id v8 = (NSObject **)MEMORY[0x263F40328];
    v9 = *MEMORY[0x263F40328];
    if (!*MEMORY[0x263F40328])
    {
      id v10 = (id)GKOSLoggers();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_cold_1(v9);
    }
  }
  else
  {
    id v11 = [*(id *)(a1 + 32) utilityService];
    uint64_t v12 = *(void *)(a1 + 40);
    CGSize v13 = [v4 basename];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280;
    v16[3] = &unk_26478A830;
    id v14 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 32);
    id v17 = v14;
    uint64_t v18 = v15;
    id v19 = v5;
    id v20 = v4;
    v21 = v3;
    [v11 loadCachedImageDataFromSubdirectory:v12 withFileName:v13 handler:v16];
  }
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 length])
  {
    v4 = [MEMORY[0x263F1C6B0] _gkImageWithCheckedData:v3];
    if (v4)
    {
      [*(id *)(a1 + 32) setResult:v4];
      v5 = [*(id *)(a1 + 40) cache];
      [v5 setObject:v4 forKey:*(void *)(a1 + 48)];

      id v6 = (NSObject **)MEMORY[0x263F40328];
      id v7 = *MEMORY[0x263F40328];
      if (!*MEMORY[0x263F40328])
      {
        id v8 = (id)GKOSLoggers();
        id v7 = *v6;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280_cold_3(a1, v7);
      }
    }
    else
    {
      if (!*MEMORY[0x263F40328]) {
        id v11 = (id)GKOSLoggers();
      }
      uint64_t v12 = (void *)*MEMORY[0x263F40320];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
        __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280_cold_2(a1, v12);
      }
    }
  }
  else
  {
    if (!*MEMORY[0x263F40328]) {
      id v9 = (id)GKOSLoggers();
    }
    id v10 = (void *)*MEMORY[0x263F40320];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40320], OS_LOG_TYPE_ERROR)) {
      __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280_cold_1(a1, v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_281(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) result];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)cacheImageUsingGamed:(id)a3 cacheSubdirectory:(id)a4 withHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F401C0];
  uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKImageSource.m", 966, "-[GKLocalImageSource cacheImageUsingGamed:cacheSubdirectory:withHandler:]");
  CGSize v13 = [v11 dispatchGroupWithName:v12];

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke;
  v18[3] = &unk_264789EA8;
  v18[4] = self;
  id v14 = v9;
  id v19 = v14;
  id v15 = v8;
  id v20 = v15;
  [v13 perform:v18];
  if (v10)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_3;
    v16[3] = &unk_26478A020;
    id v17 = v10;
    [v13 notifyOnMainQueueWithBlock:v16];
  }
}

void __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) keyForImageIdentifier:*(void *)(a1 + 40)];
  v5 = [*(id *)(a1 + 32) cache];
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [v4 cacheKey];
  [v5 setObject:v6 forKey:v7];

  id v8 = UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
  id v9 = [*(id *)(a1 + 32) utilityService];
  uint64_t v10 = *(void *)(a1 + 40);
  id v11 = [v4 basename];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_2;
  v13[3] = &unk_26478A020;
  id v14 = v3;
  id v12 = v3;
  [v9 cacheImageData:v8 inSubdirectory:v10 withFileName:v11 handler:v13];
}

uint64_t __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __73__GKLocalImageSource_cacheImageUsingGamed_cacheSubdirectory_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deleteImageUsingGamedWithSubdirectory:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263F401C0];
  id v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d %s", "GKImageSource.m", 987, "-[GKLocalImageSource deleteImageUsingGamedWithSubdirectory:withHandler:]");
  uint64_t v10 = [v8 dispatchGroupWithName:v9];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke;
  v14[3] = &unk_26478A110;
  v14[4] = self;
  id v11 = v6;
  id v15 = v11;
  [v10 perform:v14];
  if (v7)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_3;
    v12[3] = &unk_26478A020;
    id v13 = v7;
    [v10 notifyOnMainQueueWithBlock:v12];
  }
}

void __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) keyForImageIdentifier:*(void *)(a1 + 40)];
  v5 = [*(id *)(a1 + 32) cache];
  id v6 = [v4 cacheKey];
  [v5 removeObjectForKey:v6];

  id v7 = [*(id *)(a1 + 32) utilityService];
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = [v4 basename];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_2;
  v11[3] = &unk_26478A020;
  id v12 = v3;
  id v10 = v3;
  [v7 deleteCachedImageDataFromSubdirectory:v8 withFileName:v9 handler:v11];
}

uint64_t __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __72__GKLocalImageSource_deleteImageUsingGamedWithSubdirectory_withHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSMapTable)keysForSizes
{
  return self->_keysForSizes;
}

- (void)setKeysForSizes:(id)a3
{
}

- (void).cxx_destruct
{
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_5() basename];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22600C000, v4, v5, "Image found in in-memory cache: %@", v6, v7, v8, v9, v10);
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280_cold_1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 56);
  id v3 = a2;
  uint64_t v4 = [v2 basename];
  OUTLINED_FUNCTION_2();
  __int16 v7 = 2112;
  uint64_t v8 = v5;
  _os_log_error_impl(&dword_22600C000, v3, OS_LOG_TYPE_ERROR, "Failed to load cached image from gamed: %@\ncache key: %@", v6, 0x16u);
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() basename];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22600C000, v2, OS_LOG_TYPE_ERROR, "Failed to create cached image from gamed %@", v5, 0xCu);
}

void __67__GKLocalImageSource_cachedImageFromGamedWithSubdirectory_handler___block_invoke_280_cold_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() basename];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_1(&dword_22600C000, v5, v6, "Loaded cached image from gamed %@", v7, v8, v9, v10, v11);
}

@end