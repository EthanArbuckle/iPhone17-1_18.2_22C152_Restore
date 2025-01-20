@interface MKIconDiskCache
@end

@implementation MKIconDiskCache

void __114___MKIconDiskCache_imageForStyleAttributes_size_scale_isCarplay_isTransit_isTransparent_isNightMode_drawingBlock___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  int v2 = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  if (v2)
  {
    v3 = UIImagePNGRepresentation(*(UIImage **)(a1 + 48));
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [*(id *)(*(void *)(a1 + 32) + 8) path];
    char v6 = [v4 fileExistsAtPath:v5];

    if ((v6 & 1) == 0)
    {
      v7 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
      id v19 = 0;
      char v9 = [v7 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v19];
      id v10 = v19;

      if ((v9 & 1) == 0)
      {
        v11 = GEOGetMKIconManagerLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v21 = v10;
          _os_log_impl(&dword_18BAEC000, v11, OS_LOG_TYPE_ERROR, "Failed to create image cache directory: %@", buf, 0xCu);
        }
      }
    }
    uint64_t v12 = *(void *)(a1 + 56);
    id v18 = 0;
    char v13 = [v3 writeToFile:v12 options:1 error:&v18];
    id v14 = v18;
    if ((v13 & 1) == 0)
    {
      v15 = GEOGetMKIconManagerLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v14;
        _os_log_impl(&dword_18BAEC000, v15, OS_LOG_TYPE_ERROR, "Error writing image %@", buf, 0xCu);
      }
    }
    v16 = GEOGetMKIconManagerLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      id v21 = v17;
      _os_log_impl(&dword_18BAEC000, v16, OS_LOG_TYPE_DEBUG, "Set image at %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) lock];
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 24) unlock];
  }
}

@end