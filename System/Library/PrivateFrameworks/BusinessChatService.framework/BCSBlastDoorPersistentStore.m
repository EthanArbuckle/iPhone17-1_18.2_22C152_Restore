@interface BCSBlastDoorPersistentStore
- (NSURL)cacheURL;
- (id)fileURLForImageWithName:(id)a3 error:(id *)a4;
- (id)initWithCacheURL:(id *)a1;
- (id)updateImageWithName:(id)a3 error:(id *)a4;
- (void)deleteExpiredImages;
- (void)deleteImageWithName:(id)a3;
- (void)setCacheURL:(id)a3;
@end

@implementation BCSBlastDoorPersistentStore

- (id)initWithCacheURL:(id *)a1
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a2;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)BCSBlastDoorPersistentStore;
    v5 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      v6 = ABSLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v25 = [a1 cacheURL];
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v25;
        _os_log_debug_impl(&dword_2154F4000, v6, OS_LOG_TYPE_DEBUG, "Creating BlastDoor image cache at: %@", buf, 0xCu);
      }
      v7 = [MEMORY[0x263F08850] defaultManager];
      char v29 = 0;
      v8 = [a1 cacheURL];
      v9 = [v8 path];
      int v10 = [v7 fileExistsAtPath:v9 isDirectory:&v29];

      id v11 = 0;
      if (!v10 || v29) {
        goto LABEL_10;
      }
      v12 = ABSLogCommon();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_2154F4000, v12, OS_LOG_TYPE_ERROR, "Error creating BlastDoor cache store: unexpected state (found file instead of directory)", buf, 2u);
      }

      v13 = [a1 cacheURL];
      id v28 = 0;
      char v14 = [v7 removeItemAtURL:v13 error:&v28];
      id v11 = v28;

      if (v14)
      {
LABEL_10:
        v15 = v11;
        v16 = [MEMORY[0x263F08850] defaultManager];
        v17 = [a1 cacheURL];
        id v27 = v11;
        char v18 = [v16 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v27];
        id v11 = v27;

        if ((v18 & 1) == 0)
        {
          v19 = ABSLogCommon();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v11;
            _os_log_error_impl(&dword_2154F4000, v19, OS_LOG_TYPE_ERROR, "Error creating BlastDoor cache store: %@", buf, 0xCu);
          }
        }
        v20 = [MEMORY[0x263F08850] defaultManager];
        uint64_t v30 = *MEMORY[0x263F080A8];
        *(void *)buf = *MEMORY[0x263F08088];
        v21 = [NSDictionary dictionaryWithObjects:buf forKeys:&v30 count:1];
        v22 = [a1 cacheURL];
        v23 = [v22 path];
        [v20 setAttributes:v21 ofItemAtPath:v23 error:0];
      }
      else
      {
        v20 = ABSLogCommon();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v11;
          _os_log_error_impl(&dword_2154F4000, v20, OS_LOG_TYPE_ERROR, "Error removing unexpected file (instead of directory): %@", buf, 0xCu);
        }
      }
    }
  }

  return a1;
}

- (id)fileURLForImageWithName:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = [(BCSBlastDoorPersistentStore *)self cacheURL];
  v7 = [NSString stringWithFormat:@"%@", v5];

  v8 = [v6 URLByAppendingPathComponent:v7];

  return v8;
}

- (id)updateImageWithName:(id)a3 error:(id *)a4
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = [(BCSBlastDoorPersistentStore *)self fileURLForImageWithName:a3 error:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    char v15 = 0;
    v6 = [v4 path];
    int v7 = [v5 fileExistsAtPath:v6 isDirectory:&v15];

    if (v7) {
      BOOL v8 = v15 == 0;
    }
    else {
      BOOL v8 = 0;
    }
    if (v8)
    {
      int v10 = [MEMORY[0x263F08850] defaultManager];
      v16[0] = *MEMORY[0x263F08048];
      id v11 = [MEMORY[0x263EFF910] now];
      v16[1] = *MEMORY[0x263F080A8];
      v17[0] = v11;
      v17[1] = *MEMORY[0x263F08088];
      v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
      v13 = [v4 path];
      [v10 setAttributes:v12 ofItemAtPath:v13 error:0];

      id v9 = v4;
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)deleteImageWithName:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = ABSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_debug_impl(&dword_2154F4000, v5, OS_LOG_TYPE_DEBUG, "Deleting image named: %@", (uint8_t *)&v8, 0xCu);
  }

  v6 = [(BCSBlastDoorPersistentStore *)self fileURLForImageWithName:v4 error:0];
  if (v6)
  {
    int v7 = [MEMORY[0x263F08850] defaultManager];
    [v7 removeItemAtURL:v6 error:0];
  }
  else
  {
    int v7 = ABSLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_debug_impl(&dword_2154F4000, v7, OS_LOG_TYPE_DEBUG, "Asked to delete image but unable to construct file URL", (uint8_t *)&v8, 2u);
    }
  }
}

- (void)deleteExpiredImages
{
  v30[2] = *MEMORY[0x263EF8340];
  v3 = ABSLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2154F4000, v3, OS_LOG_TYPE_DEBUG, "Deleting expired images", buf, 2u);
  }

  id v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [(BCSBlastDoorPersistentStore *)self cacheURL];
  uint64_t v6 = *MEMORY[0x263EFF5F8];
  v30[0] = *MEMORY[0x263EFF750];
  v30[1] = v6;
  int v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];
  v21 = v4;
  int v8 = [v4 enumeratorAtURL:v5 includingPropertiesForKeys:v7 options:5 errorHandler:0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v24;
    *(void *)&long long v11 = 138412290;
    long long v20 = v11;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v9);
        }
        char v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
        id v22 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v22, v6, 0, v20);
        id v16 = v22;
        if (v16)
        {
          v17 = [MEMORY[0x263EFF910] now];
          char v18 = [v17 dateByAddingTimeInterval:2592000.0];

          if ([v16 compare:v18] == 1)
          {
            v19 = ABSLogCommon();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v20;
              id v28 = v15;
              _os_log_debug_impl(&dword_2154F4000, v19, OS_LOG_TYPE_DEBUG, "Removing expired file: %@", buf, 0xCu);
            }

            [v21 removeItemAtURL:v15 error:0];
          }
        }
        else
        {
          char v18 = ABSLogCommon();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            id v28 = v15;
            _os_log_debug_impl(&dword_2154F4000, v18, OS_LOG_TYPE_DEBUG, "Failed to determine modification date for file: %@", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v12);
  }
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end