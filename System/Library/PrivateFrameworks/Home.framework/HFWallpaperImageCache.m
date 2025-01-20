@interface HFWallpaperImageCache
- (BSUIMappedImageCache)imageCache;
- (HFProcessedWallpaperSource)processedWallpaperSource;
- (HFWallpaperImageCache)initWithIdentifier:(id)a3;
- (NSArray)supportedProcessedVariants;
- (id)_cacheKeyForCustomBlurWallpaper:(id)a3 withVariant:(int64_t)a4;
- (id)_cacheKeyForDefaultBlurWallpaper:(id)a3 withVariant:(int64_t)a4 forUserInterfaceStyle:(int64_t)a5;
- (id)_cacheKeyForWallpaper:(id)a3 withVariant:(int64_t)a4;
- (id)_imageForVariant:(int64_t)a3 wallpaper:(id)a4 imageKey:(id)a5 withOriginalImageGenerator:(id)a6;
- (id)imageForVariant:(int64_t)a3 wallpaper:(id)a4 withOriginalImageGenerator:(id)a5;
- (void)_saveVariants:(int64_t)a3 forWallpaper:(id)a4 originalImage:(id)a5 withImageKey:(id)a6;
- (void)pruneUnusedWallpaperVariants:(id)a3;
- (void)saveVariantsForWallpaper:(id)a3 originalImage:(id)a4;
- (void)setImageCache:(id)a3;
- (void)setProcessedWallpaperSource:(id)a3;
@end

@implementation HFWallpaperImageCache

- (HFWallpaperImageCache)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFWallpaperImageCache;
  v5 = [(HFWallpaperImageCache *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F29D40]) initWithUniqueIdentifier:v4];
    imageCache = v5->_imageCache;
    v5->_imageCache = (BSUIMappedImageCache *)v6;
  }
  return v5;
}

- (void)setProcessedWallpaperSource:(id)a3
{
}

- (id)imageForVariant:(int64_t)a3 wallpaper:(id)a4 withOriginalImageGenerator:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ([v8 type] == 4)
  {
    v10 = [(HFWallpaperImageCache *)self _cacheKeyForDefaultBlurWallpaper:v8 withVariant:a3 forUserInterfaceStyle:1];
    v11 = [(HFWallpaperImageCache *)self _cacheKeyForDefaultBlurWallpaper:v8 withVariant:a3 forUserInterfaceStyle:2];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke;
    v23[3] = &unk_26409A240;
    id v12 = v9;
    id v24 = v12;
    v13 = [(HFWallpaperImageCache *)self _imageForVariant:a3 wallpaper:v8 imageKey:v10 withOriginalImageGenerator:v23];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke_2;
    v21 = &unk_26409A240;
    id v22 = v12;
    v14 = [(HFWallpaperImageCache *)self _imageForVariant:a3 wallpaper:v8 imageKey:v11 withOriginalImageGenerator:&v18];
    v15 = objc_msgSend(v13, "imageAsset", v18, v19, v20, v21);
    v16 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    [v15 registerImage:v14 withTraitCollection:v16];
  }
  else
  {
    if ([v8 type] == 6) {
      [(HFWallpaperImageCache *)self _cacheKeyForCustomBlurWallpaper:v8 withVariant:a3];
    }
    else {
    v10 = [(HFWallpaperImageCache *)self _cacheKeyForWallpaper:v8 withVariant:a3];
    }
    v13 = [(HFWallpaperImageCache *)self _imageForVariant:a3 wallpaper:v8 imageKey:v10 withOriginalImageGenerator:v9];
  }

  return v13;
}

- (id)_imageForVariant:(int64_t)a3 wallpaper:(id)a4 imageKey:(id)a5 withOriginalImageGenerator:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  v13 = [(HFWallpaperImageCache *)self processedWallpaperSource];

  if (!v13) {
    NSLog(&cfstr_MustRegisterPr.isa);
  }
  v14 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = NSStringFromHFWallpaperVariant(a3);
    *(_DWORD *)buf = 138412546;
    v27 = v15;
    __int16 v28 = 2112;
    id v29 = v10;
    _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "Retrieving cached \"%@\" image from wallpaper %@", buf, 0x16u);
  }
  v16 = [(HFWallpaperImageCache *)self imageCache];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __88__HFWallpaperImageCache__imageForVariant_wallpaper_imageKey_withOriginalImageGenerator___block_invoke;
  v21[3] = &unk_26409A268;
  id v22 = v10;
  v23 = self;
  id v24 = v11;
  int64_t v25 = a3;
  id v17 = v11;
  id v18 = v10;
  uint64_t v19 = [v16 imageForKey:v12 generatingIfNecessaryWithBlock:v21];

  return v19;
}

- (BSUIMappedImageCache)imageCache
{
  return self->_imageCache;
}

- (id)_cacheKeyForWallpaper:(id)a3 withVariant:(int64_t)a4
{
  v5 = NSString;
  uint64_t v6 = [a3 sliceIdentifierForVariant:a4];
  v7 = [(HFWallpaperImageCache *)self processedWallpaperSource];
  id v8 = [v5 stringWithFormat:@"%@_v%ld", v6, objc_msgSend(v7, "processVersionNumber")];

  return v8;
}

- (HFProcessedWallpaperSource)processedWallpaperSource
{
  return (HFProcessedWallpaperSource *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)supportedProcessedVariants
{
  v2 = [(HFWallpaperImageCache *)self processedWallpaperSource];
  v3 = [v2 supportedVariants];
  id v4 = v3;
  if (!v3) {
    v3 = (void *)MEMORY[0x263EFFA68];
  }
  v5 = v3;

  return v5;
}

id __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = [v1 imageAsset];
  v3 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  id v4 = [v2 imageWithTraitCollection:v3];

  return v4;
}

id __78__HFWallpaperImageCache_imageForVariant_wallpaper_withOriginalImageGenerator___block_invoke_2(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = [v1 imageAsset];
  v3 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  id v4 = [v2 imageWithTraitCollection:v3];

  return v4;
}

id __88__HFWallpaperImageCache__imageForVariant_wallpaper_imageKey_withOriginalImageGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  *a2 = 4 * ([*(id *)(a1 + 32) type] != 2);
  v3 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = NSStringFromHFWallpaperVariant(*(void *)(a1 + 56));
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "Recreating evicted \"%@\" slice from wallpaper %@", buf, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 56);
  if ((unint64_t)(v6 - 2) < 3)
  {
    v7 = [*(id *)(a1 + 40) imageForVariant:1 wallpaper:*(void *)(a1 + 32) withOriginalImageGenerator:*(void *)(a1 + 48)];
    id v8 = [*(id *)(a1 + 40) processedWallpaperSource];
    id v9 = [v8 processedImageForVariant:*(void *)(a1 + 56) wallpaper:*(void *)(a1 + 32) image:v7];

LABEL_7:
    goto LABEL_8;
  }
  if (v6 == 1)
  {
    v7 = [*(id *)(a1 + 40) processedWallpaperSource];
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v12 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v9 = [v7 processedImageForVariant:v11 wallpaper:v10 image:v12];

    goto LABEL_7;
  }
  NSLog(&cfstr_UnexpectedWall.isa, *(void *)(a1 + 56));
  id v9 = 0;
LABEL_8:
  return v9;
}

- (void)saveVariantsForWallpaper:(id)a3 originalImage:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v33 = a4;
  v7 = [(HFWallpaperImageCache *)self processedWallpaperSource];

  if (!v7) {
    NSLog(&cfstr_MustRegisterPr.isa);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v8 = [(HFWallpaperImageCache *)self processedWallpaperSource];
  id v9 = [v8 supportedVariants];

  id obj = v9;
  uint64_t v34 = [v9 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v34)
  {
    uint64_t v10 = *(void *)v36;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = [*(id *)(*((void *)&v35 + 1) + 8 * v11) unsignedIntegerValue];
        if ([v6 type] == 4)
        {
          uint64_t v31 = [(HFWallpaperImageCache *)self _cacheKeyForDefaultBlurWallpaper:v6 withVariant:v12 forUserInterfaceStyle:1];
          uint64_t v32 = [(HFWallpaperImageCache *)self _cacheKeyForDefaultBlurWallpaper:v6 withVariant:v12 forUserInterfaceStyle:2];
          [v33 imageAsset];
          id v13 = v6;
          v14 = self;
          __int16 v16 = v15 = v10;
          uint64_t v17 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
          uint64_t v18 = [v16 imageWithTraitCollection:v17];

          uint64_t v19 = [v33 imageAsset];
          v20 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
          v21 = [v19 imageWithTraitCollection:v20];

          uint64_t v10 = v15;
          self = v14;
          id v6 = v13;
          id v22 = (void *)v31;

          [(HFWallpaperImageCache *)self _saveVariants:v12 forWallpaper:v6 originalImage:v18 withImageKey:v31];
          v23 = (HFWallpaper *)v32;
          [(HFWallpaperImageCache *)self _saveVariants:v12 forWallpaper:v6 originalImage:v21 withImageKey:v32];

LABEL_12:
          goto LABEL_14;
        }
        if ([v6 type] == 6)
        {
          id v24 = [(HFWallpaperImageCache *)self processedWallpaperSource];
          id v22 = [v24 generateFilteredImageForWallpaper:v6 image:v33];

          int64_t v25 = [(HFWallpaperImageCache *)self _cacheKeyForCustomBlurWallpaper:v6 withVariant:v12];
          [(HFWallpaperImageCache *)self _saveVariants:v12 forWallpaper:v6 originalImage:v22 withImageKey:v25];

          v26 = [HFWallpaper alloc];
          v27 = [v6 assetIdentifier];
          __int16 v28 = [v6 cropInfo];
          v23 = [(HFWallpaper *)v26 initWithType:1 assetIdentifier:v27 cropInfo:v28];

          id v29 = [(HFWallpaperImageCache *)self _cacheKeyForWallpaper:v23 withVariant:v12];
          [(HFWallpaperImageCache *)self _saveVariants:v12 forWallpaper:v23 originalImage:v33 withImageKey:v29];

          goto LABEL_12;
        }
        id v22 = [(HFWallpaperImageCache *)self _cacheKeyForWallpaper:v6 withVariant:v12];
        [(HFWallpaperImageCache *)self _saveVariants:v12 forWallpaper:v6 originalImage:v33 withImageKey:v22];
LABEL_14:

        ++v11;
      }
      while (v34 != v11);
      uint64_t v34 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v34);
  }
}

- (void)_saveVariants:(int64_t)a3 forWallpaper:(id)a4 originalImage:(id)a5 withImageKey:(id)a6
{
  id v10 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __79__HFWallpaperImageCache__saveVariants_forWallpaper_originalImage_withImageKey___block_invoke;
  v13[3] = &unk_26409A290;
  id v14 = v10;
  id v11 = v10;
  id v12 = [(HFWallpaperImageCache *)self _imageForVariant:a3 wallpaper:a4 imageKey:a6 withOriginalImageGenerator:v13];
}

id __79__HFWallpaperImageCache__saveVariants_forWallpaper_originalImage_withImageKey___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)pruneUnusedWallpaperVariants:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HFWallpaperImageCache *)self imageCache];
  id v6 = [v5 allKeys];

  v7 = [MEMORY[0x263EFF9C0] set];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke;
  v13[3] = &unk_264096AC8;
  void v13[4] = self;
  id v8 = v7;
  id v14 = v8;
  objc_msgSend(v4, "na_each:", v13);

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_3;
  v10[3] = &unk_264099920;
  id v11 = v8;
  id v12 = self;
  id v9 = v8;
  objc_msgSend(v6, "na_each:", v10);
}

void __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) processedWallpaperSource];
  uint64_t v5 = [v4 supportedVariants];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_2;
  v9[3] = &unk_26409A2B8;
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v7;
  id v8 = v3;
  objc_msgSend(v5, "na_each:", v9);
}

void __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_2(id *a1, void *a2)
{
  id v10 = a2;
  if ([a1[4] type] == 4)
  {
    id v3 = objc_msgSend(a1[5], "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", a1[4], objc_msgSend(v10, "unsignedIntegerValue"), 1);
    uint64_t v4 = objc_msgSend(a1[5], "_cacheKeyForDefaultBlurWallpaper:withVariant:forUserInterfaceStyle:", a1[4], objc_msgSend(v10, "unsignedIntegerValue"), 2);
LABEL_5:
    id v9 = (void *)v4;
    objc_msgSend(a1[6], "na_safeAddObject:", v3);
    objc_msgSend(a1[6], "na_safeAddObject:", v9);

    goto LABEL_7;
  }
  uint64_t v5 = [a1[4] type];
  id v7 = a1[4];
  id v6 = a1[5];
  uint64_t v8 = [v10 unsignedIntegerValue];
  if (v5 == 6)
  {
    id v3 = [v6 _cacheKeyForCustomBlurWallpaper:v7 withVariant:v8];
    uint64_t v4 = objc_msgSend(a1[5], "_cacheKeyForWallpaper:withVariant:", a1[4], objc_msgSend(v10, "unsignedIntegerValue"));
    goto LABEL_5;
  }
  id v3 = [v6 _cacheKeyForWallpaper:v7 withVariant:v8];
  objc_msgSend(a1[6], "na_safeAddObject:", v3);
LABEL_7:
}

void __54__HFWallpaperImageCache_pruneUnusedWallpaperVariants___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (([*(id *)(a1 + 32) containsObject:v3] & 1) == 0)
  {
    uint64_t v4 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "Removed unused image variant at key %@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [*(id *)(a1 + 40) imageCache];
    [v5 removeImageForKey:v3];
  }
}

- (id)_cacheKeyForDefaultBlurWallpaper:(id)a3 withVariant:(int64_t)a4 forUserInterfaceStyle:(int64_t)a5
{
  int v6 = [(HFWallpaperImageCache *)self _cacheKeyForWallpaper:a3 withVariant:a4];
  id v7 = v6;
  if (a5 == 1) {
    uint64_t v8 = @"_light";
  }
  else {
    uint64_t v8 = @"_dark";
  }
  id v9 = [v6 stringByAppendingString:v8];

  return v9;
}

- (id)_cacheKeyForCustomBlurWallpaper:(id)a3 withVariant:(int64_t)a4
{
  uint64_t v4 = [(HFWallpaperImageCache *)self _cacheKeyForWallpaper:a3 withVariant:a4];
  uint64_t v5 = [v4 stringByAppendingString:@"_blur"];

  return v5;
}

- (void)setImageCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_processedWallpaperSource, 0);
}

@end