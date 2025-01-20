@interface HFWallpaperFileManager
- (BOOL)originalImageExistsForWallpaper:(id)a3;
- (HFWallpaperFileManager)init;
- (NSURL)wallpaperFolderURL;
- (id)_originalImageForWallpaper:(id)a3 withFileName:(id)a4;
- (id)fileNameForCustomBlurWallpaper:(id)a3;
- (id)fileNameForDefaultBlurWallpaper:(id)a3 userInterfaceStyle:(int64_t)a4;
- (id)filenameForWallpaper:(id)a3;
- (id)originalImageForWallpaper:(id)a3;
- (void)_saveOriginalImage:(id)a3 forWallpaper:(id)a4 withFileName:(id)a5;
- (void)pruneUnusedOriginalWallpaperImages:(id)a3;
- (void)saveOriginalImage:(id)a3 forWallpaper:(id)a4;
- (void)setWallpaperFolderURL:(id)a3;
@end

@implementation HFWallpaperFileManager

- (HFWallpaperFileManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)HFWallpaperFileManager;
  v2 = [(HFWallpaperFileManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[HFUtilities wallpaperURL];
    wallpaperFolderURL = v2->_wallpaperFolderURL;
    v2->_wallpaperFolderURL = (NSURL *)v3;
  }
  return v2;
}

- (BOOL)originalImageExistsForWallpaper:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 4)
  {
    v5 = [(HFWallpaperFileManager *)self fileNameForDefaultBlurWallpaper:v4 userInterfaceStyle:1];
    uint64_t v6 = [(HFWallpaperFileManager *)self fileNameForDefaultBlurWallpaper:v4 userInterfaceStyle:2];
    v7 = (void *)v6;
    char v8 = 0;
    if (v5 && v6)
    {
      v9 = [MEMORY[0x263F08850] defaultManager];
      v10 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
      v11 = [v10 URLByAppendingPathComponent:v5];
      uint64_t v12 = [v11 path];
      char v13 = [v9 fileExistsAtPath:v12];

      v14 = [MEMORY[0x263F08850] defaultManager];
      v15 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
      v16 = [v15 URLByAppendingPathComponent:v7];
      v17 = [v16 path];
      LOBYTE(v12) = [v14 fileExistsAtPath:v17];

      char v8 = v13 & v12;
    }
  }
  else
  {
    if ([v4 type] == 6)
    {
      v5 = [(HFWallpaperFileManager *)self fileNameForCustomBlurWallpaper:v4];
      if (!v5)
      {
        char v8 = 0;
        goto LABEL_12;
      }
      v7 = [MEMORY[0x263F08850] defaultManager];
      v18 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
      v19 = [v18 URLByAppendingPathComponent:v5];
      v20 = [v19 path];
      v21 = v7;
    }
    else
    {
      v22 = [(HFWallpaperFileManager *)self filenameForWallpaper:v4];

      if (!v22)
      {
        char v8 = 0;
        goto LABEL_13;
      }
      v5 = [MEMORY[0x263F08850] defaultManager];
      v7 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
      v18 = [(HFWallpaperFileManager *)self filenameForWallpaper:v4];
      v19 = [v7 URLByAppendingPathComponent:v18];
      v20 = [v19 path];
      v21 = v5;
    }
    char v8 = [v21 fileExistsAtPath:v20];
  }
LABEL_12:

LABEL_13:
  return v8;
}

- (id)filenameForWallpaper:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 type];
  if (v4 > 6) {
    v5 = 0;
  }
  else {
    v5 = off_264096AE8[v4];
  }
  uint64_t v6 = [v3 assetIdentifier];

  v7 = [v6 stringByAppendingPathExtension:v5];

  return v7;
}

- (NSURL)wallpaperFolderURL
{
  return self->_wallpaperFolderURL;
}

- (id)originalImageForWallpaper:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 4)
  {
    v5 = [(HFWallpaperFileManager *)self fileNameForDefaultBlurWallpaper:v4 userInterfaceStyle:1];
    uint64_t v6 = [(HFWallpaperFileManager *)self fileNameForDefaultBlurWallpaper:v4 userInterfaceStyle:2];
    v7 = [(HFWallpaperFileManager *)self _originalImageForWallpaper:v4 withFileName:v5];
    char v8 = [(HFWallpaperFileManager *)self _originalImageForWallpaper:v4 withFileName:v6];
    v9 = [v7 imageAsset];
    v10 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    [v9 registerImage:v8 withTraitCollection:v10];
  }
  else
  {
    if ([v4 type] == 6) {
      [(HFWallpaperFileManager *)self fileNameForCustomBlurWallpaper:v4];
    }
    else {
    v5 = [(HFWallpaperFileManager *)self filenameForWallpaper:v4];
    }
    v7 = [(HFWallpaperFileManager *)self _originalImageForWallpaper:v4 withFileName:v5];
  }

  return v7;
}

- (id)_originalImageForWallpaper:(id)a3 withFileName:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
  v9 = [v8 URLByAppendingPathComponent:v7];

  v10 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_20B986000, v10, OS_LOG_TYPE_DEFAULT, "Retrieving original image for wallpaper %@", buf, 0xCu);
  }

  id v18 = 0;
  v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9 options:1 error:&v18];
  id v12 = v18;
  char v13 = (void *)MEMORY[0x263F1C6B0];
  v14 = [MEMORY[0x263F1C920] mainScreen];
  [v14 scale];
  v15 = objc_msgSend(v13, "imageWithData:scale:", v11);

  if (!v15)
  {
    NSLog(&cfstr_UnableToLoadOr.isa, v6, v12);
    id v19 = v6;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
    [(HFWallpaperFileManager *)self pruneUnusedOriginalWallpaperImages:v16];
  }
  return v15;
}

- (void)saveOriginalImage:(id)a3 forWallpaper:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  if ([v6 type] == 4)
  {
    id v7 = [(HFWallpaperFileManager *)self fileNameForDefaultBlurWallpaper:v6 userInterfaceStyle:1];
    char v8 = [(HFWallpaperFileManager *)self fileNameForDefaultBlurWallpaper:v6 userInterfaceStyle:2];
    v9 = [v18 imageAsset];
    v10 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    v11 = [v9 imageWithTraitCollection:v10];

    id v12 = [v18 imageAsset];
    char v13 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v14 = [v12 imageWithTraitCollection:v13];

    [(HFWallpaperFileManager *)self _saveOriginalImage:v11 forWallpaper:v6 withFileName:v7];
    [(HFWallpaperFileManager *)self _saveOriginalImage:v14 forWallpaper:v6 withFileName:v8];
  }
  else if ([v6 type] == 6)
  {
    id v7 = [(HFWallpaperFileManager *)self fileNameForCustomBlurWallpaper:v6];
    v15 = +[HFWallpaperManager sharedInstance];
    v16 = [v15 processOriginalBlurredImageFromWallpaper:v6 originalImage:v18];

    [(HFWallpaperFileManager *)self _saveOriginalImage:v16 forWallpaper:v6 withFileName:v7];
    v17 = [(HFWallpaperFileManager *)self filenameForWallpaper:v6];
    [(HFWallpaperFileManager *)self _saveOriginalImage:v18 forWallpaper:v6 withFileName:v17];
  }
  else
  {
    id v7 = [(HFWallpaperFileManager *)self filenameForWallpaper:v6];
    [(HFWallpaperFileManager *)self _saveOriginalImage:v18 forWallpaper:v6 withFileName:v7];
  }
}

- (void)_saveOriginalImage:(id)a3 forWallpaper:(id)a4 withFileName:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = HFLogForCategory(0x48uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412546;
    id v30 = v10;
    __int16 v31 = 2112;
    id v32 = v9;
    _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "Writing out original image at wallpaper path: %@ for wallpaper %@", (uint8_t *)&v29, 0x16u);
  }

  id v12 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
  char v13 = [v12 URLByAppendingPathComponent:v10];
  v14 = [v13 path];

  v15 = [MEMORY[0x263F08850] defaultManager];
  v16 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
  v17 = [v16 URLByAppendingPathComponent:v10];
  id v18 = [v17 path];
  int v19 = [v15 fileExistsAtPath:v18];

  if (v19)
  {
    v20 = HFLogForCategory(0x48uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412546;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "Skipping write for wallpaper %@ as fileName \"%@\" already exists", (uint8_t *)&v29, 0x16u);
    }
  }
  else
  {
    uint64_t v21 = [v9 type];
    uint64_t v22 = [v8 imageWithNormalizedOrientation];
    v23 = v22;
    if (v21) {
      UIImageJPEGRepresentation(v22, 1.0);
    }
    else {
    v20 = UIImagePNGRepresentation(v22);
    }

    if (!v20)
    {
      v24 = HFLogForCategory(0x48uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v29 = 138412290;
        id v30 = v9;
        _os_log_error_impl(&dword_20B986000, v24, OS_LOG_TYPE_ERROR, "Failed to generate image data for wallpaper %@", (uint8_t *)&v29, 0xCu);
      }
    }
    v25 = [MEMORY[0x263F08850] defaultManager];
    char v26 = [v25 createFileAtPath:v14 contents:v20 attributes:0];

    v27 = HFLogForCategory(0x48uLL);
    v28 = v27;
    if (v26)
    {
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 138412546;
        id v30 = v9;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_impl(&dword_20B986000, v28, OS_LOG_TYPE_DEFAULT, "Wrote original wallpaper image %@ to path \"%@\"", (uint8_t *)&v29, 0x16u);
      }
    }
    else if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v29 = 138412290;
      id v30 = v14;
      _os_log_error_impl(&dword_20B986000, v28, OS_LOG_TYPE_ERROR, "Failed to write original wallpaper image at path \"%@\"", (uint8_t *)&v29, 0xCu);
    }
  }
}

- (void)pruneUnusedOriginalWallpaperImages:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF9C0] set];
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __61__HFWallpaperFileManager_pruneUnusedOriginalWallpaperImages___block_invoke;
  v34[3] = &unk_264096AC8;
  v34[4] = self;
  id v6 = v5;
  id v35 = v6;
  v27 = v4;
  objc_msgSend(v4, "na_each:", v34);
  id v7 = [MEMORY[0x263F08850] defaultManager];
  v28 = self;
  id v8 = [(HFWallpaperFileManager *)self wallpaperFolderURL];
  id v9 = [v8 path];
  id v10 = [v7 contentsOfDirectoryAtPath:v9 error:0];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * v15);
        if (([v6 containsObject:v16] & 1) == 0)
        {
          v17 = [(HFWallpaperFileManager *)v28 wallpaperFolderURL];
          id v18 = [v17 URLByAppendingPathComponent:v16];

          int v19 = [MEMORY[0x263F08850] defaultManager];
          v20 = [v18 path];
          id v29 = 0;
          int v21 = [v19 removeItemAtPath:v20 error:&v29];
          id v22 = v29;

          v23 = HFLogForCategory(0x48uLL);
          v24 = v23;
          if (v21)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              v25 = [v18 path];
              *(_DWORD *)buf = 138412290;
              v37 = v25;
              _os_log_impl(&dword_20B986000, v24, OS_LOG_TYPE_DEFAULT, "Removed unused wallpaper at path \"%@\"", buf, 0xCu);
              goto LABEL_10;
            }
          }
          else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v25 = [v18 path];
            *(_DWORD *)buf = 138412546;
            v37 = v25;
            __int16 v38 = 2112;
            id v39 = v22;
            _os_log_error_impl(&dword_20B986000, v24, OS_LOG_TYPE_ERROR, "Failed to remove wallpaper at path \"%@\" with error %@", buf, 0x16u);
LABEL_10:
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v26 = [v11 countByEnumeratingWithState:&v30 objects:v40 count:16];
      uint64_t v13 = v26;
    }
    while (v26);
  }
}

void __61__HFWallpaperFileManager_pruneUnusedOriginalWallpaperImages___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 type] == 4)
  {
    id v3 = [*(id *)(a1 + 32) fileNameForDefaultBlurWallpaper:v7 userInterfaceStyle:1];
    id v4 = [*(id *)(a1 + 32) fileNameForDefaultBlurWallpaper:v7 userInterfaceStyle:2];
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
LABEL_5:
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v4);

    goto LABEL_7;
  }
  uint64_t v5 = [v7 type];
  id v6 = *(void **)(a1 + 32);
  if (v5 == 6)
  {
    id v3 = [v6 fileNameForCustomBlurWallpaper:v7];
    objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
    id v4 = [*(id *)(a1 + 32) filenameForWallpaper:v7];
    goto LABEL_5;
  }
  id v3 = [v6 filenameForWallpaper:v7];
  objc_msgSend(*(id *)(a1 + 40), "na_safeAddObject:", v3);
LABEL_7:
}

- (id)fileNameForDefaultBlurWallpaper:(id)a3 userInterfaceStyle:(int64_t)a4
{
  uint64_t v5 = [a3 assetIdentifier];
  id v6 = v5;
  if (a4 == 2) {
    id v7 = @"_dark";
  }
  else {
    id v7 = @"_light";
  }
  id v8 = [v5 stringByAppendingString:v7];

  id v9 = [v8 stringByAppendingPathExtension:@"jpg"];

  return v9;
}

- (id)fileNameForCustomBlurWallpaper:(id)a3
{
  id v3 = [a3 assetIdentifier];
  id v4 = [v3 stringByAppendingString:@"_blur"];

  uint64_t v5 = [v4 stringByAppendingPathExtension:@"jpg"];

  return v5;
}

- (void)setWallpaperFolderURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end