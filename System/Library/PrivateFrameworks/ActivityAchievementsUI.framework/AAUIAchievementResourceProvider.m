@interface AAUIAchievementResourceProvider
- (AAUIAchievementResourceProvider)init;
- (BOOL)_queue_decompressZipFileAtPath:(id)a3 toDirectory:(id)a4;
- (CGPoint)glyphPositionOffsetScaleForAchievement:(id)a3;
- (double)glyphTextureScaleForAchievement:(id)a3;
- (id)_assetBundleForAchievement:(id)a3;
- (id)_badgeModelFilenames:(id)a3;
- (id)_cachedModelsPath;
- (id)_compressedBadgeModelPathsForAchievement:(id)a3;
- (id)_modelDirectoryForCompressedModelPaths:(id)a3 andAchievement:(id)a4;
- (id)_modelFilePathsForCompressedModelPaths:(id)a3 andAchievement:(id)a4;
- (id)backSideIconImageForAchievement:(id)a3;
- (id)badgeConfigurationForAchievement:(id)a3;
- (id)badgeModelPathsForAchievement:(id)a3;
- (id)enamelColorForAchievement:(id)a3;
- (id)glyphTexturePathForAchievement:(id)a3;
- (id)metalColorForAchievement:(id)a3;
- (id)stickerURLsForAchievement:(id)a3;
- (id)stickersBundlePathForAchievement:(id)a3;
- (id)texturePathsForAchievement:(id)a3;
@end

@implementation AAUIAchievementResourceProvider

- (id)badgeConfigurationForAchievement:(id)a3
{
  v36[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v35 = [(AAUIAchievementResourceProvider *)self badgeModelPathsForAchievement:v4];
  v5 = [(AAUIAchievementResourceProvider *)self texturePathsForAchievement:v4];
  v6 = [(AAUIAchievementResourceProvider *)self glyphTexturePathForAchievement:v4];
  v7 = [(AAUIAchievementResourceProvider *)self metalColorForAchievement:v4];
  v8 = [(AAUIAchievementResourceProvider *)self enamelColorForAchievement:v4];
  [(AAUIAchievementResourceProvider *)self glyphTextureScaleForAchievement:v4];
  double v10 = v9;
  [(AAUIAchievementResourceProvider *)self glyphPositionOffsetScaleForAchievement:v4];
  double v12 = v11;
  double v14 = v13;
  if ([v4 badgeUsesTriColorEnamel])
  {
    [v4 enamelTriColor1];
    v18 = [MEMORY[0x263F825C8] colorWithRed:v15 green:v16 blue:v17 alpha:1.0];
    v36[0] = v18;
    [v4 enamelTriColor2];
    v22 = [MEMORY[0x263F825C8] colorWithRed:v19 green:v20 blue:v21 alpha:1.0];
    v36[1] = v22;
    [v4 enamelTriColor3];
    v26 = [MEMORY[0x263F825C8] colorWithRed:v23 green:v24 blue:v25 alpha:1.0];
    v36[2] = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:3];
  }
  else
  {
    v27 = 0;
  }
  v28 = [AAUIBadgeModelConfiguration alloc];
  v29 = [v4 badgeShapeName];
  uint64_t v30 = [v4 badgeUsesFullColorEnamel];
  char v31 = [v4 unearnedUsesTwoToneEnamel];
  BYTE1(v34) = [v4 faceHasMetalInlay];
  LOBYTE(v34) = v31;
  v32 = [(AAUIBadgeModelConfiguration *)v28 initWithModelPaths:v35 texturePaths:v5 shapeName:v29 metalColor:v7 useFullColorEnamel:v30 modelEnamelColor:v8 unearnedUsesTwoToneEnamel:v10 faceHasMetalInlay:v12 enamelTricolors:v14 glyphTexturePath:v34 glyphTextureScale:v27 glyphPositionOffset:v6];

  return v32;
}

- (id)texturePathsForAchievement:(id)a3
{
  v38[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 textureFilenames];
  v6 = (void *)v5;
  v7 = &unk_26DD6F550;
  if (v5) {
    v7 = (void *)v5;
  }
  id v8 = v7;

  v38[0] = @"png";
  v38[1] = @"png.pvrtc";
  double v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:2];
  v22 = v4;
  double v10 = [(AAUIAchievementResourceProvider *)self _assetBundleForAchievement:v4];
  id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * v15);
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __62__AAUIAchievementResourceProvider_texturePathsForAchievement___block_invoke;
        v26[3] = &unk_264860C08;
        id v27 = v10;
        uint64_t v28 = v16;
        float v17 = objc_msgSend(v9, "hk_map:", v26);
        v18 = objc_msgSend(v17, "hk_firstObjectPassingTest:", &__block_literal_global_0);

        if (v18)
        {
          [v11 addObject:v18];
        }
        else
        {
          float v19 = ACHLogAssets();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            float v24 = [v22 template];
            float v23 = [v24 uniqueName];
            *(_DWORD *)buf = 138412546;
            uint64_t v34 = v23;
            __int16 v35 = 2112;
            uint64_t v36 = v16;
            _os_log_error_impl(&dword_229290000, v19, OS_LOG_TYPE_ERROR, "Error loading badge texture for achievement %@ with asset name %@", buf, 0x16u);
          }
        }

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v13);
  }

  float v20 = (void *)[v11 copy];
  return v20;
}

- (id)metalColorForAchievement:(id)a3
{
  [a3 badgeMetalColor];
  v3 = (void *)MEMORY[0x263F825C8];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  return (id)[v3 colorWithRed:v5 green:v7 blue:v9 alpha:1.0];
}

- (double)glyphTextureScaleForAchievement:(id)a3
{
  [a3 glyphTextureScale];
  return result;
}

- (id)glyphTexturePathForAchievement:(id)a3
{
  v16[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  double v5 = [v4 glyphTextureFilename];
  if (v5)
  {
    v16[0] = @"png";
    v16[1] = @"png.pvrtc";
    float v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
    double v7 = [(AAUIAchievementResourceProvider *)self _assetBundleForAchievement:v4];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __66__AAUIAchievementResourceProvider_glyphTexturePathForAchievement___block_invoke;
    v13[3] = &unk_264860C08;
    id v14 = v7;
    id v15 = v5;
    id v8 = v7;
    double v9 = objc_msgSend(v6, "hk_map:", v13);
    double v10 = objc_msgSend(v9, "hk_firstObjectPassingTest:", &__block_literal_global_298);

    if (!v10)
    {
      id v11 = ACHLogAssets();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[AAUIAchievementResourceProvider glyphTexturePathForAchievement:](v4, v11);
      }
    }
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (CGPoint)glyphPositionOffsetScaleForAchievement:(id)a3
{
  id v3 = a3;
  [v3 glyphPositionOffsetX];
  double v5 = v4;
  [v3 glyphPositionOffsetY];
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)enamelColorForAchievement:(id)a3
{
  [a3 badgeEnamelColor];
  id v3 = (void *)MEMORY[0x263F825C8];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  return (id)[v3 colorWithRed:v5 green:v7 blue:v9 alpha:1.0];
}

- (id)badgeModelPathsForAchievement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  double v5 = [(AAUIAchievementResourceProvider *)self _compressedBadgeModelPathsForAchievement:v4];
  float v6 = [(AAUIAchievementResourceProvider *)self _modelFilePathsForCompressedModelPaths:v5 andAchievement:v4];
  uint64_t v7 = [v6 count];
  if (v7 == [v5 count])
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __65__AAUIAchievementResourceProvider_badgeModelPathsForAchievement___block_invoke;
    v13[3] = &unk_264860BE0;
    double v9 = v6;
    id v14 = v9;
    id v15 = v5;
    uint64_t v16 = self;
    id v17 = v4;
    dispatch_sync(queue, v13);
    double v10 = v9;

    id v11 = v14;
  }
  else
  {
    id v11 = ACHLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[AAUIAchievementResourceProvider badgeModelPathsForAchievement:](v4, v11);
    }
    double v10 = MEMORY[0x263EFFA68];
  }

  return v10;
}

- (id)_modelFilePathsForCompressedModelPaths:(id)a3 andAchievement:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  float v8 = [(AAUIAchievementResourceProvider *)self _badgeModelFilenames:v7];
  double v9 = [(AAUIAchievementResourceProvider *)self _modelDirectoryForCompressedModelPaths:v6 andAchievement:v7];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = objc_msgSend(v9, "stringByAppendingPathComponent:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);
        [v10 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v17 = (void *)[v10 copy];
  return v17;
}

- (id)_modelDirectoryForCompressedModelPaths:(id)a3 andAchievement:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  float v8 = [(AAUIAchievementResourceProvider *)self _cachedModelsPath];
  double v9 = [v7 sortedArrayUsingSelector:sel_compare_];

  id v10 = [v9 componentsJoinedByString:&stru_26DD6AF88];

  id v11 = NSString;
  int v12 = [v10 hash];
  if (v12 >= 0) {
    uint64_t v13 = v12;
  }
  else {
    uint64_t v13 = -v12;
  }
  uint64_t v14 = objc_msgSend(v11, "stringWithFormat:", @"%d", v13);
  id v15 = NSString;
  uint64_t v16 = [v6 template];
  id v17 = [v16 uniqueName];
  uint64_t v18 = [v6 badgeModelVersion];

  long long v19 = [v15 stringWithFormat:@"%@_%@_v%ld", v17, v14, v18];

  long long v20 = [v8 stringByAppendingPathComponent:v19];

  return v20;
}

- (id)_compressedBadgeModelPathsForAchievement:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 badgeModelFilenames];
  id v6 = (void *)v5;
  id v7 = &unk_26DD6F598;
  if (v5) {
    id v7 = (void *)v5;
  }
  id v8 = v7;

  float v23 = v4;
  double v9 = [(AAUIAchievementResourceProvider *)self _assetBundleForAchievement:v4];
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v27;
    *(void *)&long long v13 = 138412546;
    long long v22 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend(v9, "pathForResource:ofType:", v17, @"bdg.zip", v22);
        if (v18)
        {
          [v10 addObject:v18];
        }
        else
        {
          long long v19 = ACHLogAssets();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            float v25 = [v23 template];
            uint64_t v24 = [v25 uniqueName];
            *(_DWORD *)buf = v22;
            long long v31 = v24;
            __int16 v32 = 2112;
            uint64_t v33 = v17;
            _os_log_error_impl(&dword_229290000, v19, OS_LOG_TYPE_ERROR, "Could not determined compressedBadgeModelPath for achievement: %@, assetName = %@", buf, 0x16u);
          }
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v14);
  }

  long long v20 = (void *)[v10 copy];
  return v20;
}

- (id)_assetBundleForAchievement:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 resourceBundleURL];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F086E0];
    id v6 = [v3 resourceBundleURL];
    id v7 = [v5 bundleWithURL:v6];
  }
  else
  {
    id v8 = ACHLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_229290000, v8, OS_LOG_TYPE_DEFAULT, "resourceBundleURL is nil for achievement: %@", (uint8_t *)&v10, 0xCu);
    }

    id v7 = 0;
  }

  return v7;
}

- (id)_cachedModelsPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v3 = [v2 firstObject];
  id v4 = [v3 stringByAppendingPathComponent:@"AchievementBadgeModels"];

  return v4;
}

- (id)_badgeModelFilenames:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a3 badgeModelFilenames];
  id v4 = (void *)v3;
  uint64_t v5 = &unk_26DD6F580;
  if (v3) {
    uint64_t v5 = (void *)v3;
  }
  id v6 = v5;

  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = [NSString stringWithFormat:@"%@.bdg", *(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = (void *)[v7 copy];
  return v14;
}

uint64_t __62__AAUIAchievementResourceProvider_texturePathsForAchievement___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) pathForResource:*(void *)(a1 + 40) ofType:a2];
}

- (AAUIAchievementResourceProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)AAUIAchievementResourceProvider;
  v2 = [(AAUIAchievementResourceProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

uint64_t __62__AAUIAchievementResourceProvider_texturePathsForAchievement___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F08850];
  id v3 = a2;
  id v4 = [v2 defaultManager];
  uint64_t v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

void __65__AAUIAchievementResourceProvider_badgeModelPathsForAchievement___block_invoke(id *a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a1[4];
  uint64_t v2 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v2)
  {
    uint64_t v4 = v2;
    int v5 = 0;
    uint64_t v6 = *(void *)v22;
    *(void *)&long long v3 = 138412546;
    long long v18 = v3;
    do
    {
      uint64_t v7 = 0;
      uint64_t v8 = v5;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        uint64_t v10 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v18);
        char v11 = [v10 fileExistsAtPath:v9];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = [a1[5] objectAtIndexedSubscript:v8 + v7];
          long long v13 = [v9 stringByDeletingLastPathComponent];
          if (!objc_msgSend(a1[6], "_queue_decompressZipFileAtPath:toDirectory:", v12, v13)
            || ([MEMORY[0x263F08850] defaultManager],
                uint64_t v14 = objc_claimAutoreleasedReturnValue(),
                char v15 = [v14 fileExistsAtPath:v9],
                v14,
                (v15 & 1) == 0))
          {
            long long v16 = ACHLogAssets();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              long long v19 = [a1[7] template];
              long long v17 = [v19 uniqueName];
              *(_DWORD *)buf = v18;
              long long v26 = v17;
              __int16 v27 = 2112;
              long long v28 = v12;
              _os_log_error_impl(&dword_229290000, v16, OS_LOG_TYPE_ERROR, "Error decompressing model for achievement %@ at path %@", buf, 0x16u);
            }
          }
        }
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v29 count:16];
      int v5 = v8 + v7;
    }
    while (v4);
  }
}

uint64_t __66__AAUIAchievementResourceProvider_glyphTexturePathForAchievement___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) pathForResource:*(void *)(a1 + 40) ofType:a2];
}

uint64_t __66__AAUIAchievementResourceProvider_glyphTexturePathForAchievement___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F08850];
  id v3 = a2;
  uint64_t v4 = [v2 defaultManager];
  uint64_t v5 = [v4 fileExistsAtPath:v3];

  return v5;
}

- (id)stickersBundlePathForAchievement:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 stickerBundleURL];

  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263F086E0];
    uint64_t v6 = [v3 stickerBundleURL];
    uint64_t v7 = [v5 bundleWithURL:v6];

    uint64_t v4 = [v7 resourcePath];
  }
  return v4;
}

- (id)stickerURLsForAchievement:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFFA08] set];
  uint64_t v5 = [v3 stickerBundleURL];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F086E0];
    uint64_t v7 = [v3 stickerBundleURL];
    uint64_t v8 = [v6 bundleWithURL:v7];

    if (v8)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v9 = [&unk_26DD6F568 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          long long v13 = v4;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(&unk_26DD6F568);
            }
            uint64_t v14 = [v8 URLsForResourcesWithExtension:*(void *)(*((void *)&v17 + 1) + 8 * v12) subdirectory:0];
            uint64_t v4 = [v13 setByAddingObjectsFromArray:v14];

            ++v12;
            long long v13 = v4;
          }
          while (v10 != v12);
          uint64_t v10 = [&unk_26DD6F568 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }
    }
    id v15 = v4;
  }
  else
  {
    id v15 = v4;
  }

  return v15;
}

- (id)backSideIconImageForAchievement:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__0;
  long long v23 = __Block_byref_object_dispose__0;
  id v24 = 0;
  uint64_t v5 = [(AAUIAchievementResourceProvider *)self _assetBundleForAchievement:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 pathForResource:@"Icon" ofType:@"png"];
    if (v7)
    {
      dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
      queue = self->_queue;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __67__AAUIAchievementResourceProvider_backSideIconImageForAchievement___block_invoke;
      void v16[3] = &unk_264860C50;
      id v17 = v7;
      long long v18 = &v19;
      dispatch_sync(queue, v16);
    }
  }
  uint64_t v9 = (void *)v20[5];
  if (!v9)
  {
    uint64_t v10 = (void *)MEMORY[0x263F827E8];
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v12 = [v10 imageNamed:@"badge_back_apple_logo" inBundle:v11 compatibleWithTraitCollection:0];
    long long v13 = (void *)v20[5];
    v20[5] = v12;

    uint64_t v9 = (void *)v20[5];
  }
  id v14 = v9;

  _Block_object_dispose(&v19, 8);
  return v14;
}

void __67__AAUIAchievementResourceProvider_backSideIconImageForAchievement___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  int v3 = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (v3)
  {
    uint64_t v5 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:*(void *)(a1 + 32)];
    if ([v5 length])
    {
      id v4 = [MEMORY[0x263F827E8] imageWithData:v5];
      if (v4) {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
      }
    }
    MEMORY[0x270F9A790]();
  }
}

- (BOOL)_queue_decompressZipFileAtPath:(id)a3 toDirectory:(id)a4
{
  void v16[3] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  int v9 = [v8 fileExistsAtPath:v6];

  if (v9)
  {
    [v6 fileSystemRepresentation];
    [v7 fileSystemRepresentation];
    uint64_t v10 = *MEMORY[0x263EFFB40];
    v15[0] = @"extractPKZip";
    v15[1] = @"sequesterResources";
    v16[0] = v10;
    v16[1] = v10;
    v15[2] = @"copyResources";
    v16[2] = v10;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
    BOMCopierNew();
    int v12 = BOMCopierCopyWithOptions();
    BOMCopierFree();
    BOOL v13 = v12 == 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
}

- (void)badgeModelPathsForAchievement:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = [a1 template];
  id v4 = [v3 uniqueName];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_229290000, a2, OS_LOG_TYPE_ERROR, "Error decompressing model for achievement %@: compressed/decompressed model files mismatch", (uint8_t *)&v5, 0xCu);
}

- (void)glyphTexturePathForAchievement:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v3 = [a1 template];
  id v4 = [v3 uniqueName];
  int v5 = 138412546;
  id v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  _os_log_error_impl(&dword_229290000, a2, OS_LOG_TYPE_ERROR, "Error loading badge texture for achievement %@ at path %@", (uint8_t *)&v5, 0x16u);
}

@end