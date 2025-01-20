@interface AVTResourceLocator
+ (__CFString)generatedPlistFolderName;
+ (id)_resourcePathInDirectoryURL:(id)a3 subDirectory:(id)a4 name:(id)a5 ofType:(id)a6 isDirectory:(BOOL)a7;
+ (id)sharedResourceLocator;
- (id)_init;
- (id)rootCacheURL;
- (id)subdivDataCacheURL;
- (id)urlForFrameworkResourceAtPath:(uint64_t)a3 isDirectory:;
- (id)urlForMemojiAssetAtPath:(uint64_t)a3 isDirectory:;
- (id)urlForMemojiResourceAtPath:(uint64_t)a3 isDirectory:;
- (id)urlForStickerResourceAtPath:(uint64_t)a3 isDirectory:;
- (void)_init;
- (void)deleteLegacyCache;
- (void)deleteObsoleteVersionsInCache:(id)a3 currentVersion:(unint64_t)a4;
- (void)imageWithPath:(uint64_t)a1;
- (void)initCaches;
- (void)pathForAnimojiResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:;
- (void)pathForAnimojiResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:;
- (void)pathForEnvironmentResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:;
- (void)pathForEnvironmentResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:;
- (void)pathForMemojiResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:;
- (void)pathForMemojiResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:;
- (void)pathForPoseResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:;
- (void)pathForPoseResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:;
- (void)pathForStickerResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:;
- (void)pathForStickerResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:;
@end

@implementation AVTResourceLocator

- (id)_init
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  v56.receiver = self;
  v56.super_class = (Class)AVTResourceLocator;
  v2 = [(AVTResourceLocator *)&v56 init];
  if (!v2) {
    return v2;
  }
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  imageCache = v2->_imageCache;
  v2->_imageCache = (NSMutableDictionary *)v3;

  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 resourceURL];
  p_resourcesURL = (void **)&v2->_resourcesURL;
  resourcesURL = v2->_resourcesURL;
  v2->_resourcesURL = (NSURL *)v6;

  v9 = v2->_resourcesURL;
  if (!v9)
  {
    v10 = avt_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      [(AVTResourceLocator *)v10 _init];
    }

    v9 = *p_resourcesURL;
  }
  v18 = [v9 path];
  char v19 = [v18 containsString:@"AvatarKit.framework"];

  if (v19)
  {
LABEL_13:
    v30 = v2->_resourcesURL;
    uint64_t v31 = [(NSURL *)v30 URLByAppendingPathComponent:@"environment" isDirectory:1];
    environmentResourcesURL = v2->_environmentResourcesURL;
    v2->_environmentResourcesURL = (NSURL *)v31;

    uint64_t v33 = [(NSURL *)v30 URLByAppendingPathComponent:@"animoji" isDirectory:1];
    animojiResourcesURL = v2->_animojiResourcesURL;
    v2->_animojiResourcesURL = (NSURL *)v33;

    uint64_t v35 = [(NSURL *)v30 URLByAppendingPathComponent:@"memoji" isDirectory:1];
    memojiResourcesURL = v2->_memojiResourcesURL;
    v2->_memojiResourcesURL = (NSURL *)v35;

    uint64_t v37 = [(NSURL *)v30 URLByAppendingPathComponent:@"stickers" isDirectory:1];
    stickerResourcesURL = v2->_stickerResourcesURL;
    v2->_stickerResourcesURL = (NSURL *)v37;

    uint64_t v39 = [(NSURL *)v30 URLByAppendingPathComponent:@"poses" isDirectory:1];
    poseResourcesURL = v2->_poseResourcesURL;
    v2->_poseResourcesURL = (NSURL *)v39;

    uint64_t v41 = [(NSURL *)v2->_memojiResourcesURL URLByAppendingPathComponent:@"assets" isDirectory:1];
    memojiAssetsURL = v2->_memojiAssetsURL;
    v2->_memojiAssetsURL = (NSURL *)v41;

    if (!v2->_memojiAssetsURL)
    {
      v43 = avt_default_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        [(AVTResourceLocator *)v43 _init];
      }
    }
    [(AVTResourceLocator *)v2 initCaches];

    return v2;
  }
  v20 = avt_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[AVTResourceLocator _init]();
  }

  if (!AVTLogAllowsInternalCrash())
  {
    uint64_t v21 = [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/AvatarKit.framework" isDirectory:1];
    v22 = *p_resourcesURL;
    *p_resourcesURL = (void *)v21;

    v23 = avt_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      [(AVTResourceLocator *)(uint64_t)&v2->_resourcesURL _init];
    }

    goto LABEL_13;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
  v52 = v2->_resourcesURL;
  uint64_t v53 = objc_opt_class();
  v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v55 = [v54 bundlePath];
  int v57 = 138412802;
  v58 = v52;
  __int16 v59 = 2112;
  uint64_t v60 = v53;
  __int16 v61 = 2112;
  v62 = v55;
  _os_log_send_and_compose_impl();

  id result = (id)_os_crash_msg();
  __break(1u);
  return result;
}

+ (id)sharedResourceLocator
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__AVTResourceLocator_sharedResourceLocator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (sharedResourceLocator_once != -1) {
    dispatch_once(&sharedResourceLocator_once, block);
  }
  v1 = (void *)sharedResourceLocator_sSharedResourceLocator;
  return v1;
}

uint64_t __43__AVTResourceLocator_sharedResourceLocator__block_invoke(uint64_t a1)
{
  sharedResourceLocator_sSharedResourceLocator = [objc_alloc(*(Class *)(a1 + 32)) _init];
  return MEMORY[0x270F9A758]();
}

+ (id)_resourcePathInDirectoryURL:(id)a3 subDirectory:(id)a4 name:(id)a5 ofType:(id)a6 isDirectory:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = v11;
  uint64_t v16 = v15;
  uint64_t v17 = v15;
  if (v12)
  {
    uint64_t v17 = [v15 URLByAppendingPathComponent:v12 isDirectory:1];
  }
  if (v13)
  {
    uint64_t v18 = [v17 URLByAppendingPathComponent:v13 isDirectory:v7];

    uint64_t v17 = (void *)v18;
  }
  if (v14)
  {
    uint64_t v19 = [v17 URLByAppendingPathExtension:v14];

    uint64_t v17 = (void *)v19;
  }
  v20 = [v17 path];

  return v20;
}

- (id)urlForFrameworkResourceAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    a1 = [a1[2] URLByAppendingPathComponent:a2 isDirectory:a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)pathForEnvironmentResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[3] subDirectory:0 name:a2 ofType:a3 isDirectory:a4];
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)pathForEnvironmentResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[3] subDirectory:a4 name:a2 ofType:a3 isDirectory:a5];
    uint64_t v5 = vars8;
  }
  return a1;
}

- (void)pathForAnimojiResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[4] subDirectory:0 name:a2 ofType:a3 isDirectory:a4];
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)pathForAnimojiResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[4] subDirectory:a4 name:a2 ofType:a3 isDirectory:a5];
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)urlForMemojiAssetAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    a1 = [a1[8] URLByAppendingPathComponent:a2 isDirectory:a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (id)urlForMemojiResourceAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    a1 = [a1[5] URLByAppendingPathComponent:a2 isDirectory:a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)pathForMemojiResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[5] subDirectory:0 name:a2 ofType:a3 isDirectory:a4];
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)pathForMemojiResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[5] subDirectory:a4 name:a2 ofType:a3 isDirectory:a5];
    uint64_t v5 = vars8;
  }
  return a1;
}

- (id)urlForStickerResourceAtPath:(uint64_t)a3 isDirectory:
{
  if (a1)
  {
    a1 = [a1[6] URLByAppendingPathComponent:a2 isDirectory:a3];
    uint64_t v3 = vars8;
  }
  return a1;
}

- (void)pathForStickerResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[6] subDirectory:0 name:a2 ofType:a3 isDirectory:a4];
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)pathForStickerResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[6] subDirectory:a4 name:a2 ofType:a3 isDirectory:a5];
    uint64_t v5 = vars8;
  }
  return a1;
}

- (void)pathForPoseResource:(uint64_t)a3 ofType:(uint64_t)a4 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[7] subDirectory:0 name:a2 ofType:a3 isDirectory:a4];
    uint64_t v4 = vars8;
  }
  return a1;
}

- (void)pathForPoseResource:(uint64_t)a3 ofType:(uint64_t)a4 inDirectory:(uint64_t)a5 isDirectory:
{
  if (a1)
  {
    a1 = +[AVTResourceLocator _resourcePathInDirectoryURL:a1[7] subDirectory:a4 name:a2 ofType:a3 isDirectory:a5];
    uint64_t v5 = vars8;
  }
  return a1;
}

+ (__CFString)generatedPlistFolderName
{
  return @"generated plists";
}

- (void)imageWithPath:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    ImageAtIndex = [*(id *)(a1 + 8) objectForKeyedSubscript:v3];

    if (!ImageAtIndex)
    {
      uint64_t v5 = +[AVTResourceLocator sharedResourceLocator]();
      uint64_t v6 = [v3 lastPathComponent];
      BOOL v7 = -[AVTResourceLocator pathForMemojiResource:ofType:isDirectory:](v5, (uint64_t)v6, 0, 0);

      if (v7
        && ([NSURL fileURLWithPath:v7 isDirectory:0],
            CFURLRef v8 = (const __CFURL *)objc_claimAutoreleasedReturnValue(),
            v9 = CGImageSourceCreateWithURL(v8, 0),
            v8,
            v9))
      {
        ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, 0);
        [*(id *)(a1 + 8) setObject:ImageAtIndex forKeyedSubscript:v3];
        if (ImageAtIndex) {
          CGImageRelease((CGImageRef)ImageAtIndex);
        }
        CFRelease(v9);
      }
      else
      {
        ImageAtIndex = 0;
      }
    }
  }
  else
  {
    ImageAtIndex = 0;
  }

  return ImageAtIndex;
}

- (void)initCaches
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20B819000, log, OS_LOG_TYPE_ERROR, "Error: [Cache] Shared cache is not writable, please check the app's entitlements", v1, 2u);
}

uint64_t __32__AVTResourceLocator_initCaches__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) deleteLegacyCache];
  [*(id *)(a1 + 32) deleteObsoleteVersionsInCache:*(void *)(a1 + 40) currentVersion:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  return [v2 deleteObsoleteVersionsInCache:v3 currentVersion:v4];
}

- (id)rootCacheURL
{
  if (a1)
  {
    a1 = (id *)a1[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)subdivDataCacheURL
{
  if (a1)
  {
    a1 = (id *)a1[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)deleteObsoleteVersionsInCache:(id)a3 currentVersion:(unint64_t)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v33 = v4;
  uint64_t v6 = [v5 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:0];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v36 = *(void *)v44;
    uint64_t v9 = *MEMORY[0x263EFF688];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v44 != v36) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v43 + 1) + 8 * v10);
        id v12 = [v11 lastPathComponent];
        if (![v12 hasPrefix:@"AvatarKit-"])
        {
          id v15 = avt_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v48 = v12;
            _os_log_error_impl(&dword_20B819000, v15, OS_LOG_TYPE_ERROR, "Error: [Cache] Unknown cache folder \"%@\"", buf, 0xCu);
          }

LABEL_12:
          uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
          uint64_t v52 = v9;
          uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v52 count:1];
          uint64_t v18 = [v16 enumeratorAtURL:v11 includingPropertiesForKeys:v17 options:0 errorHandler:0];

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v19 = v18;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v39 objects:v51 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = 0;
            uint64_t v23 = *(void *)v40;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v40 != v23) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v25 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                id v38 = 0;
                [v25 getResourceValue:&v38 forKey:v9 error:0];
                v22 += [v38 unsignedLongLongValue];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v39 objects:v51 count:16];
            }
            while (v21);
          }
          else
          {
            uint64_t v22 = 0;
          }

          uint64_t v26 = [MEMORY[0x263F08850] defaultManager];
          id v37 = 0;
          int v27 = [v26 removeItemAtURL:v11 error:&v37];
          id v28 = v37;

          if (v27)
          {
            uint64_t v29 = [MEMORY[0x263F086F0] stringFromByteCount:v22 countStyle:0];
            v30 = avt_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v31 = [v11 path];
              *(_DWORD *)buf = 138412546;
              uint64_t v48 = v29;
              __int16 v49 = 2112;
              uint64_t v50 = v31;
              _os_log_impl(&dword_20B819000, v30, OS_LOG_TYPE_DEFAULT, "[Cache] Reclaimed %@ from obsolete cache: %@", buf, 0x16u);
              goto LABEL_24;
            }
            goto LABEL_25;
          }
          uint64_t v29 = avt_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = [v11 path];
            uint64_t v31 = [v28 description];
            *(_DWORD *)buf = 138412546;
            uint64_t v48 = v30;
            __int16 v49 = 2112;
            uint64_t v50 = v31;
            _os_log_error_impl(&dword_20B819000, v29, OS_LOG_TYPE_ERROR, "Error: [Cache] Failed to delete %@ with error %@", buf, 0x16u);
LABEL_24:

LABEL_25:
          }

          goto LABEL_28;
        }
        id v13 = [v12 substringFromIndex:10];
        unint64_t v14 = AVTAvatarKitSnapshotVersionNumberFromString(v13);

        if (v14 < a4) {
          goto LABEL_12;
        }
LABEL_28:

        ++v10;
      }
      while (v10 != v8);
      uint64_t v32 = [obj countByEnumeratingWithState:&v43 objects:v53 count:16];
      uint64_t v8 = v32;
    }
    while (v32);
  }
}

- (void)deleteLegacyCache
{
  uint64_t v3 = [a1 path];
  uint64_t v9 = [a2 description];
  OUTLINED_FUNCTION_1_2();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x16u);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subdivDataCacheURL, 0);
  objc_storeStrong((id *)&self->_rootCacheURL, 0);
  objc_storeStrong((id *)&self->_memojiAssetsURL, 0);
  objc_storeStrong((id *)&self->_poseResourcesURL, 0);
  objc_storeStrong((id *)&self->_stickerResourcesURL, 0);
  objc_storeStrong((id *)&self->_memojiResourcesURL, 0);
  objc_storeStrong((id *)&self->_animojiResourcesURL, 0);
  objc_storeStrong((id *)&self->_environmentResourcesURL, 0);
  objc_storeStrong((id *)&self->_resourcesURL, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

- (void)_init
{
}

@end