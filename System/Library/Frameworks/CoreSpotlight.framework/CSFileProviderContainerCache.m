@interface CSFileProviderContainerCache
+ (id)sharedInstance;
- (BOOL)isFPBundleID:(id)a3;
- (BOOL)isFPBundleIDLocked:(id)a3;
- (CSFileProviderContainerCache)init;
- (id)appContainerOIDsForDisabledBundles:(id)a3;
- (id)dumpAppContainerCache;
- (id)filterForDisabledBundles:(id)a3;
- (void)addAppContainerOID:(id)a3 forBundle:(id)a4 fpBundle:(id)a5;
- (void)dealloc;
- (void)refreshCache;
- (void)refreshCacheWithCompletionHandler:(id)a3;
@end

@implementation CSFileProviderContainerCache

- (BOOL)isFPBundleID:(id)a3
{
  v3 = self;
  p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_appContainerOIDsByBundleIdLock);
  LOBYTE(v3) = [(CSFileProviderContainerCache *)v3 isFPBundleIDLocked:v5];

  pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
  return (char)v3;
}

- (BOOL)isFPBundleIDLocked:(id)a3
{
  appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)appContainerOIDsByBundleId allKeys];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (id)filterForDisabledBundles:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    [v5 removeObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    [v5 removeObject:@"com.apple.FileProvider.LocalStorage"];
    [v5 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProvider"];
    [v5 removeObject:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
    char v6 = [v4 containsObject:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    id v22 = [MEMORY[0x1E4F1CA48] array];
    v7 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CSFileProviderContainerCache filterForDisabledBundles:](v6, v7);
    }

    p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
    pthread_rwlock_rdlock(&self->_appContainerOIDsByBundleIdLock);
    appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke;
    v13[3] = &unk_1E5548438;
    char v16 = v6;
    id v14 = v4;
    v15 = &v17;
    [(NSMutableDictionary *)appContainerOIDsByBundleId enumerateKeysAndObjectsUsingBlock:v13];
    pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
    if ([(id)v18[5] count])
    {
      v10 = [(id)v18[5] componentsJoinedByString:@" || "];
    }
    else
    {
      v10 = 0;
    }
    v11 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[CSFileProviderContainerCache filterForDisabledBundles:]((uint64_t)v10, v11);
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v15 = 0;
    char v16 = &v15;
    uint64_t v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    uint64_t v19 = __Block_byref_object_dispose_;
    id v20 = 0;
    id v20 = [MEMORY[0x1E4F1CA48] array];
    if (*(unsigned char *)(a1 + 48))
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_2;
      v13[3] = &unk_1E5548410;
      v14[0] = *(id *)(a1 + 32);
      v14[1] = &v15;
      [v6 enumerateKeysAndObjectsUsingBlock:v13];
      if ([(id)v16[5] count])
      {
        v7 = [(id)v16[5] componentsJoinedByString:@" && "];
        v8 = [NSString stringWithFormat:@"((%@ = %@) && (%@))", @"_kMDItemBundleID", v5, v7];
      }
      else
      {
        v8 = [NSString stringWithFormat:@"(%@ = %@)", @"_kMDItemBundleID", v5];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
      v9 = (id *)v14;
    }
    else
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_3;
      v11[3] = &unk_1E5548410;
      v12[0] = *(id *)(a1 + 32);
      v12[1] = &v15;
      [v6 enumerateKeysAndObjectsUsingBlock:v11];
      v9 = (id *)v12;
      if ([(id)v16[5] count])
      {
        v10 = [(id)v16[5] componentsJoinedByString:@" || "];
        v8 = [NSString stringWithFormat:@"((%@ = %@) && (%@))", @"_kMDItemBundleID", v5, v10];
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
      }
      else
      {
        v8 = 0;
      }
    }

    _Block_object_dispose(&v15, 8);
  }
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CSFileProviderContainerCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, block);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

- (void)addAppContainerOID:(id)a3 forBundle:(id)a4 fpBundle:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  pthread_rwlock_wrlock(&self->_appContainerOIDsByBundleIdLock);
  v11 = logForCSLogCategoryDefault();
  v12 = v11;
  if (v8 && v9 && v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 138412802;
      id v16 = v10;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2048;
      uint64_t v20 = [v8 unsignedLongLongValue];
      _os_log_debug_impl(&dword_18D0E3000, v12, OS_LOG_TYPE_DEBUG, "[ProtectedApps] (%@) %@ -> 0x%016llx", (uint8_t *)&v15, 0x20u);
    }

    v13 = [(NSMutableDictionary *)self->_appContainerOIDsByBundleId objectForKeyedSubscript:v10];

    if (!v13)
    {
      id v14 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_appContainerOIDsByBundleId setObject:v14 forKeyedSubscript:v10];
    }
    v12 = [(NSMutableDictionary *)self->_appContainerOIDsByBundleId objectForKeyedSubscript:v10];
    [v12 setObject:v8 forKeyedSubscript:v9];
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v15 = 138412802;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2048;
    uint64_t v20 = [v8 unsignedLongLongValue];
    _os_log_error_impl(&dword_18D0E3000, v12, OS_LOG_TYPE_ERROR, "[ProtectedApps] Invalid: (%@) %@ -> 0x%016llx", (uint8_t *)&v15, 0x20u);
  }

  pthread_rwlock_unlock(&self->_appContainerOIDsByBundleIdLock);
}

- (void)refreshCacheWithCompletionHandler:(id)a3
{
  v15[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(CSSearchQueryContext);
  v15[0] = @"kMDItemDisplayName";
  v15[1] = @"_kMDItemOID";
  v15[2] = @"FPAppContainerBundleID";
  v15[3] = @"_kMDItemBundleID";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
  [(CSSearchQueryContext *)v5 setFetchAttributes:v6];

  v7 = [[CSSearchQuery alloc] initWithQueryString:@"(FPAppContainerBundleID = *)" queryContext:v5];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  void v13[4] = __Block_byref_object_dispose_;
  id v14 = 0;
  id v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [(CSSearchQuery *)v7 setProtectionClasses:&unk_1EDBD5A88];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  void v12[2] = __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E55483C0;
  v12[4] = v13;
  [(CSSearchQuery *)v7 setFoundItemsHandler:v12];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke_29;
  v9[3] = &unk_1E55483E8;
  v9[4] = self;
  v11 = v13;
  id v8 = v4;
  id v10 = v8;
  [(CSSearchQuery *)v7 setCompletionHandler:v9];
  [(CSSearchQuery *)v7 start];

  _Block_object_dispose(v13, 8);
}

void __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v23 = *(void *)v25;
    *(void *)&long long v4 = 138412802;
    long long v21 = v4;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v25 != v23) {
          objc_enumerationMutation(obj);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v6), "attributeSet", v21);
        id v8 = [v7 attributeDictionary];

        id v9 = [v8 objectForKeyedSubscript:@"_kMDItemOID"];
        id v10 = [v8 objectForKeyedSubscript:@"FPAppContainerBundleID"];
        v11 = [v8 objectForKeyedSubscript:@"_kMDItemBundleID"];
        v12 = logForCSLogCategoryDefault();
        v13 = v12;
        if (v9) {
          BOOL v14 = v10 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14 || v11 == 0)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = [v9 unsignedLongLongValue];
            *(_DWORD *)buf = v21;
            v29 = v11;
            __int16 v30 = 2112;
            v31 = v10;
            __int16 v32 = 2048;
            uint64_t v33 = v16;
            _os_log_error_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_ERROR, "[ProtectedApps] Invalid: (%@) %@ -> 0x%016llx", buf, 0x20u);
          }
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [v9 unsignedLongLongValue];
            *(_DWORD *)buf = v21;
            v29 = v11;
            __int16 v30 = 2112;
            v31 = v10;
            __int16 v32 = 2048;
            uint64_t v33 = v20;
            _os_log_debug_impl(&dword_18D0E3000, v13, OS_LOG_TYPE_DEBUG, "[ProtectedApps] (%@) %@ -> 0x%016llx", buf, 0x20u);
          }

          id v18 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v11];

          if (!v18)
          {
            __int16 v19 = [MEMORY[0x1E4F1CA60] dictionary];
            [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v19 forKeyedSubscript:v11];
          }
          v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v11];
          [v13 setObject:v9 forKeyedSubscript:v10];
        }

        ++v6;
      }
      while (v5 != v6);
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v5);
  }
}

void __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke_29(void *a1, void *a2)
{
  id v3 = a2;
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1[4] + 16));
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(*(void *)(a1[6] + 8) + 40)];
  uint64_t v5 = a1[4];
  uint64_t v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  pthread_rwlock_unlock((pthread_rwlock_t *)(a1[4] + 16));
  v7 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEFAULT, "[ProtectedApps] Done refreshing FP app container oid cache", v9, 2u);
  }

  uint64_t v8 = a1[5];
  if (v8) {
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
  }
}

- (void)refreshCache
{
}

void __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v10] & 1) == 0)
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = NSString;
    uint64_t v8 = [v5 stringValue];
    id v9 = [v7 stringWithFormat:@"(_kMDItemQueryPathOID != %@) || (FPAppContainerBundleID != %@)", v8, v10];
    [v6 addObject:v9];
  }
}

void __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:v10])
  {
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v7 = NSString;
    uint64_t v8 = [v5 stringValue];
    id v9 = [v7 stringWithFormat:@"(_kMDItemQueryPathOID = %@) || (FPAppContainerBundleID = %@)", v8, v10];
    [v6 addObject:v9];
  }
}

- (id)appContainerOIDsForDisabledBundles:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
  pthread_rwlock_rdlock(&self->_appContainerOIDsByBundleIdLock);
  appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke;
  uint64_t v16 = &unk_1E5548488;
  id v17 = v4;
  id v18 = v5;
  id v8 = v5;
  id v9 = v4;
  [(NSMutableDictionary *)appContainerOIDsByBundleId enumerateKeysAndObjectsUsingBlock:&v13];
  pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
  if (objc_msgSend(v8, "count", v13, v14, v15, v16)) {
    id v10 = v8;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke_2;
  v5[3] = &unk_1E5548460;
  id v6 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [a3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 32) containsObject:a2]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

uint64_t __46__CSFileProviderContainerCache_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x1F41817F8]();
}

- (CSFileProviderContainerCache)init
{
  v11.receiver = self;
  v11.super_class = (Class)CSFileProviderContainerCache;
  v2 = [(CSFileProviderContainerCache *)&v11 init];
  id v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_appContainerOIDsByBundleIdLock, 0);
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    appContainerOIDsByBundleId = v3->_appContainerOIDsByBundleId;
    v3->_appContainerOIDsByBundleId = (NSMutableDictionary *)v4;

    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v3->_appContainerOIDsByBundleId setObject:v6 forKeyedSubscript:@"com.apple.CloudDocs.MobileDocumentsFileProvider"];

    id v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v3->_appContainerOIDsByBundleId setObject:v7 forKeyedSubscript:@"com.apple.FileProvider.LocalStorage"];

    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v3->_appContainerOIDsByBundleId setObject:v8 forKeyedSubscript:@"com.apple.CloudDocs.iCloudDriveFileProvider"];

    id v9 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)v3->_appContainerOIDsByBundleId setObject:v9 forKeyedSubscript:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];
  }
  return v3;
}

- (void)dealloc
{
  appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
  self->_appContainerOIDsByBundleId = 0;

  pthread_rwlock_destroy(&self->_appContainerOIDsByBundleIdLock);
  v4.receiver = self;
  v4.super_class = (Class)CSFileProviderContainerCache;
  [(CSFileProviderContainerCache *)&v4 dealloc];
}

- (id)dumpAppContainerCache
{
  p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
  pthread_rwlock_rdlock(&self->_appContainerOIDsByBundleIdLock);
  objc_super v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:self->_appContainerOIDsByBundleId];
  pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);

  return v4;
}

- (void).cxx_destruct
{
}

- (void)filterForDisabledBundles:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "[ProtectedApps] adding filter %@", (uint8_t *)&v2, 0xCu);
}

- (void)filterForDisabledBundles:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = @"enabled";
  if (a1) {
    int v2 = @"disabled";
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18D0E3000, a2, OS_LOG_TYPE_DEBUG, "[ProtectedApps] Files app is %@", (uint8_t *)&v3, 0xCu);
}

@end