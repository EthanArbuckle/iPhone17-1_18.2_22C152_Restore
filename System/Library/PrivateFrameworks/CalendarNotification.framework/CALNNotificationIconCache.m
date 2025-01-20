@interface CALNNotificationIconCache
+ (id)_iconCacheDirectory;
+ (id)_pathForCachedIconWithIdentifier:(id)a3;
- (BOOL)_addIconWithIdentifier:(id)a3 toCacheAtPath:(id)a4;
- (BOOL)_createCacheDirectoryIfNeeded;
- (BOOL)addIconsWithIdentifiers:(id)a3 error:(id *)a4;
- (BOOL)forceRemoveAllCachedIconsWithError:(id *)a3;
- (BOOL)removeIconWithIdentifier:(id)a3 error:(id *)a4;
- (CALNNotificationIconCache)initWithIconProvider:(id)a3;
- (CalIconProvider)iconProvider;
- (OS_dispatch_queue)queue;
- (id)cachedIconPathForIconIdentifier:(id)a3;
- (id)iconIdentifierForCachedIconPath:(id)a3;
- (void)_createCacheDirectoryIfNeeded;
@end

@implementation CALNNotificationIconCache

- (CALNNotificationIconCache)initWithIconProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CALNNotificationIconCache;
  v6 = [(CALNNotificationIconCache *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_iconProvider, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("CALNNotificationIconCacheQueue", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;
  }
  return v7;
}

- (id)cachedIconPathForIconIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _pathForCachedIconWithIdentifier:v4];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v6 = [(CALNNotificationIconCache *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__CALNNotificationIconCache_cachedIconPathForIconIdentifier___block_invoke;
  v11[3] = &unk_2645C1030;
  v15 = &v16;
  id v7 = v5;
  id v12 = v7;
  v13 = self;
  id v8 = v4;
  id v14 = v8;
  dispatch_sync(v6, v11);

  if (*((unsigned char *)v17 + 24)) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __61__CALNNotificationIconCache_cachedIconPathForIconIdentifier___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v2 fileExistsAtPath:*(void *)(a1 + 32)];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) _addIconWithIdentifier:*(void *)(a1 + 48) toCacheAtPath:*(void *)(a1 + 32)];
  }
}

- (id)iconIdentifierForCachedIconPath:(id)a3
{
  id v3 = a3;
  id v4 = [v3 stringByDeletingLastPathComponent];
  id v5 = [(id)objc_opt_class() _iconCacheDirectory];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = [v3 lastPathComponent];
    id v8 = v7;
    if (v7)
    {
      id v9 = [v7 pathExtension];
      if ([v9 isEqualToString:@"png"])
      {
        v10 = [v8 stringByDeletingPathExtension];
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)addIconsWithIdentifiers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = __Block_byref_object_copy__2;
  v20 = __Block_byref_object_dispose__2;
  id v21 = 0;
  id v7 = [(CALNNotificationIconCache *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __59__CALNNotificationIconCache_addIconsWithIdentifiers_error___block_invoke;
  v11[3] = &unk_2645C1058;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  id v14 = &v22;
  v15 = &v16;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v17[5];
  }
  char v9 = *((unsigned char *)v23 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v9;
}

void __59__CALNNotificationIconCache_addIconsWithIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v24;
    uint64_t v21 = *MEMORY[0x263F07F70];
    uint64_t v20 = *MEMORY[0x263F08320];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v24 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v23 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x223C88D10]();
        id v8 = [(id)objc_opt_class() _pathForCachedIconWithIdentifier:v6];
        char v9 = [MEMORY[0x263F08850] defaultManager];
        char v10 = [v9 fileExistsAtPath:v8];

        if ((v10 & 1) == 0)
        {
          char v11 = [*(id *)(a1 + 40) _addIconWithIdentifier:v6 toCacheAtPath:v8];
          uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
          char v13 = *(unsigned char *)(v12 + 24) ? v11 : 0;
          *(unsigned char *)(v12 + 24) = v13;
          if ((v11 & 1) == 0)
          {
            id v14 = +[CALNLogSubsystem defaultCategory];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v30 = v6;
              _os_log_error_impl(&dword_2216BB000, v14, OS_LOG_TYPE_ERROR, "Failed to add icon to cache. IconIdentifier: %{public}@", buf, 0xCu);
            }

            v15 = (void *)MEMORY[0x263F087E8];
            uint64_t v27 = v20;
            v28 = @"Failed to add icon to cache.";
            uint64_t v16 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
            uint64_t v17 = [v15 errorWithDomain:v21 code:512 userInfo:v16];
            uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
            char v19 = *(void **)(v18 + 40);
            *(void *)(v18 + 40) = v17;
          }
        }

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v3);
  }
}

- (BOOL)forceRemoveAllCachedIconsWithError:(id *)a3
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 1;
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__2;
  char v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  uint64_t v5 = [(CALNNotificationIconCache *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__CALNNotificationIconCache_forceRemoveAllCachedIconsWithError___block_invoke;
  block[3] = &unk_2645C1080;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = (id) v10[5];
  }
  char v6 = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __64__CALNNotificationIconCache_forceRemoveAllCachedIconsWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [(id)objc_opt_class() _iconCacheDirectory];
  int v4 = [v2 fileExistsAtPath:v3];

  if (v4)
  {
    uint64_t v5 = [(id)objc_opt_class() _iconCacheDirectory];
    char v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    char v8 = [v6 removeItemAtPath:v5 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
  }
}

- (BOOL)removeIconWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  char v18 = __Block_byref_object_copy__2;
  char v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  uint64_t v7 = [(CALNNotificationIconCache *)self queue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke;
  v11[3] = &unk_2645C1058;
  void v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  char v13 = &v21;
  id v14 = &v15;
  dispatch_sync(v7, v11);

  if (a4) {
    *a4 = (id) v16[5];
  }
  char v9 = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke(void *a1)
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 5;
  uint64_t v3 = [(id)objc_opt_class() _pathForCachedIconWithIdentifier:a1[5]];
  int v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (!v5)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    id v12 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_2((uint64_t)(a1 + 5), v12, v13, v14, v15, v16, v17, v18);
    }

    char v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F07F70];
    uint64_t v25 = *MEMORY[0x263F08320];
    v26[0] = @"Icon does not exist and cannot be removed.";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    uint64_t v21 = [v19 errorWithDomain:v20 code:512 userInfo:v11];
    uint64_t v22 = *(void *)(a1[7] + 8);
    uint64_t v23 = *(void **)(v22 + 40);
    *(void *)(v22 + 40) = v21;

    goto LABEL_8;
  }
  id v6 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v8 = a1[7];
  uint64_t v7 = (uint64_t)(a1 + 7);
  uint64_t v9 = *(void *)(v8 + 8);
  id obj = *(id *)(v9 + 40);
  char v10 = [v6 removeItemAtPath:v3 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(v7 - 8) + 8) + 24) = v10;

  if (!*(unsigned char *)(*(void *)(*(void *)(v7 - 8) + 8) + 24))
  {
    uint64_t v11 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_1(v2, v7, v11);
    }
LABEL_8:
  }
}

- (BOOL)_addIconWithIdentifier:(id)a3 toCacheAtPath:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CALNNotificationIconCache *)self queue];
  dispatch_assert_queue_V2(v8);

  uint64_t v9 = [(CALNNotificationIconCache *)self iconProvider];
  char v10 = [v9 pngDataForIconWithIdentifier:v6];

  if (v10)
  {
    if (![(CALNNotificationIconCache *)self _createCacheDirectoryIfNeeded])
    {
      char v11 = 0;
      goto LABEL_12;
    }
    id v21 = 0;
    char v11 = [v10 writeToFile:v7 options:0x10000000 error:&v21];
    id v12 = v21;
    if ((v11 & 1) == 0)
    {
      uint64_t v13 = +[CALNLogSubsystem defaultCategory];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v23 = v6;
        __int16 v24 = 2114;
        id v25 = v7;
        __int16 v26 = 2114;
        uint64_t v27 = v12;
        _os_log_error_impl(&dword_2216BB000, v13, OS_LOG_TYPE_ERROR, "Failed to save icon with identifier %{public}@ to path %{public}@. error = %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    id v12 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CALNNotificationIconCache _addIconWithIdentifier:toCacheAtPath:]((uint64_t)v6, v12, v14, v15, v16, v17, v18, v19);
    }
    char v11 = 0;
  }

LABEL_12:
  return v11;
}

- (BOOL)_createCacheDirectoryIfNeeded
{
  uint64_t v2 = [(CALNNotificationIconCache *)self queue];
  dispatch_assert_queue_V2(v2);

  uint64_t v3 = [MEMORY[0x263F08850] defaultManager];
  int v4 = [(id)objc_opt_class() _iconCacheDirectory];
  id v15 = 0;
  char v5 = [v3 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v6 = v15;

  if ((v5 & 1) == 0)
  {
    id v7 = +[CALNLogSubsystem defaultCategory];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CALNNotificationIconCache *)(uint64_t)v6 _createCacheDirectoryIfNeeded];
    }
  }
  return v5;
}

+ (id)_pathForCachedIconWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [a1 _iconCacheDirectory];
  id v6 = [v4 stringByAppendingPathExtension:@"png"];

  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

+ (id)_iconCacheDirectory
{
  uint64_t v2 = CALNDefaultCalendarDirectory();
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"NotificationIconCache"];

  return v3;
}

- (CalIconProvider)iconProvider
{
  return self->_iconProvider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_iconProvider, 0);
}

void __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_2216BB000, log, OS_LOG_TYPE_ERROR, "Failed to remove icon file. Icon Identifier: %{public}@ . Error %{public}@", (uint8_t *)&v5, 0x16u);
}

void __60__CALNNotificationIconCache_removeIconWithIdentifier_error___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_addIconWithIdentifier:(uint64_t)a3 toCacheAtPath:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_createCacheDirectoryIfNeeded
{
}

@end