@interface NEAppInfoCache
+ (id)sharedAppInfoCache;
- (NEAppInfoCache)init;
- (id)bundleIDWithoutTeamID:(void *)a1;
- (uint64_t)appInfo:(void *)a3 mismatchedWithUUID:(void *)a4 andBundleID:;
- (void)addAppInfoToCache:(void *)a1;
- (void)appInfoForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:;
- (void)performCustomLookupIfNecessaryForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:;
@end

@implementation NEAppInfoCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheQueue, 0);
  objc_storeStrong((id *)&self->_cachedSourceAppInfo, 0);

  objc_destroyWeak((id *)&self->_lookupDelegate);
}

- (NEAppInfoCache)init
{
  v9.receiver = self;
  v9.super_class = (Class)NEAppInfoCache;
  v2 = [(NEAppInfoCache *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedSourceAppInfo = v2->_cachedSourceAppInfo;
    v2->_cachedSourceAppInfo = v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("NEAppInfoCache queue", v5);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)sharedAppInfoCache
{
  self;
  if (sharedAppInfoCache_onceToken != -1) {
    dispatch_once(&sharedAppInfoCache_onceToken, &__block_literal_global);
  }
  v0 = (void *)sharedAppInfoCache_sharedAppInfoCache;

  return v0;
}

uint64_t __36__NEAppInfoCache_sharedAppInfoCache__block_invoke()
{
  sharedAppInfoCache_sharedAppInfoCache = objc_alloc_init(NEAppInfoCache);

  return MEMORY[0x1F41817F8]();
}

- (void)appInfoForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v12 = a5;
  if (a1)
  {
    if (a2 < 0)
    {
      v14 = ne_log_obj();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[NEAppInfoCache appInfoForPid:UUID:bundleID:completionHandler:]";
        __int16 v23 = 1024;
        int v24 = a2;
        _os_log_fault_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_FAULT, "%s got invalid pid: %d", buf, 0x12u);
      }

      v12[2](v12, 0);
    }
    else
    {
      Property = objc_getProperty(a1, v11, 24, 1);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke;
      block[3] = &unk_1E5990ED8;
      int v20 = a2;
      id v16 = v9;
      id v17 = v10;
      v18 = a1;
      v19 = v12;
      dispatch_async(Property, block);
    }
  }
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  v2 = ne_log_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v21 = *(_DWORD *)(a1 + 64);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 67109634;
    int v41 = v21;
    __int16 v42 = 2112;
    uint64_t v43 = v22;
    __int16 v44 = 2112;
    uint64_t v45 = v23;
    _os_log_debug_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_DEBUG, "Fetching appInfo from cache for pid: %d uuid: %@ bundle id: %@", buf, 0x1Cu);
  }

  id v4 = *(id *)(a1 + 32);
  if (v4)
  {
    id Property = *(id *)(a1 + 48);
    if (Property) {
      id Property = objc_getProperty(Property, v3, 16, 1);
    }
    id v6 = Property;
    uint64_t v7 = [v6 objectForKeyedSubscript:v4];
    v8 = (void *)v35[5];
    v35[5] = v7;
  }
  uint64_t v9 = v35[5];
  if (!v9)
  {
    v11 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v12 = *(unsigned int *)(a1 + 64);
    v13 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_2;
    v24[3] = &unk_1E598EED0;
    v27[1] = &v34;
    v24[4] = v10;
    id v25 = v13;
    id v26 = *(id *)(a1 + 40);
    v27[0] = *(id *)(a1 + 56);
    int v28 = *(_DWORD *)(a1 + 64);
    -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v10, v12, v25, v11, v24);
    v14 = &v25;
    v15 = &v26;
    id v16 = (id *)v27;
LABEL_13:

    goto LABEL_14;
  }
  if (!*(void *)(v9 + 40))
  {
    uint64_t v17 = *(unsigned int *)(a1 + 64);
    if ((int)v17 >= 1)
    {
      v19 = *(void **)(a1 + 40);
      uint64_t v18 = *(void *)(a1 + 48);
      int v20 = *(void **)(a1 + 32);
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_52;
      v29[3] = &unk_1E598EED0;
      v32[1] = &v34;
      v29[4] = v18;
      v32[0] = *(id *)(a1 + 56);
      id v30 = *(id *)(a1 + 32);
      id v31 = *(id *)(a1 + 40);
      int v33 = *(_DWORD *)(a1 + 64);
      -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v18, v17, v20, v19, v29);
      v14 = (id *)v32;
      v15 = &v30;
      id v16 = &v31;
      goto LABEL_13;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:

  _Block_object_dispose(&v34, 8);
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_52(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v8 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  if (-[NEAppInfoCache appInfo:mismatchedWithUUID:andBundleID:](*(void *)(a1 + 32), v4, *(void **)(a1 + 40), *(void **)(a1 + 48)))
  {
    -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), v8);
LABEL_4:
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = a1 + 64;
    goto LABEL_6;
  }
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v6 = a1 + 64;
  objc_storeStrong((id *)(*(void *)(v7 + 8) + 40), a2);
  -[NEAppInfoCache addAppInfoToCache:](*(void **)(v6 - 32), *(void **)(*(void *)(*(void *)v6 + 8) + 40));
  uint64_t v5 = *(void *)(v6 - 8);
LABEL_6:
  (*(void (**)(uint64_t, void))(v5 + 16))(v5, *(void *)(*(void *)(*(void *)v6 + 8) + 40));
}

- (void)performCustomLookupIfNecessaryForPid:(void *)a3 UUID:(void *)a4 bundleID:(void *)a5 completionHandler:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)length = 67109634;
        *(_DWORD *)&length[4] = a2;
        *(_WORD *)&length[8] = 2112;
        *(void *)&length[10] = v9;
        __int16 v43 = 2112;
        id v44 = v10;
        _os_log_debug_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEBUG, "Calling delegate lookup handler with pid: %d, uuid: %@, bundleID: %@", length, 0x1Cu);
      }

      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke;
      v40[3] = &unk_1E598EEF8;
      v40[4] = a1;
      id v41 = v11;
      [WeakRetained fetchAppInfoForPID:a2 UUID:v9 bundleID:v10 completionHandler:v40];

LABEL_39:
      goto LABEL_40;
    }
    id v14 = v10;
    v15 = ne_log_obj();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)length = 67109378;
      *(_DWORD *)&length[4] = a2;
      *(_WORD *)&length[8] = 2112;
      *(void *)&length[10] = v14;
      _os_log_debug_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_DEBUG, "Origin lookup for pid %d, bundle id: %@", length, 0x12u);
    }

    id v39 = v14;
    if (v14)
    {
      id v16 = (void *)[v14 length];
      if (v16)
      {
        id v16 = -[NEAppInfoCache bundleIDWithoutTeamID:](v14);
      }
    }
    else
    {
      id v16 = 0;
    }
    id v38 = v16;
    [v38 UTF8String];
    uint64_t v17 = (void *)NEHelperCopyAppInfo();
    uint64_t v18 = v17;
    id v37 = v9;
    if (v17)
    {
      uuid = xpc_dictionary_get_uuid(v17, "app-euuid");
      if (uuid) {
        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uuid];
      }
      else {
        uint64_t v20 = 0;
      }
      string = xpc_dictionary_get_string(v18, "app-identifier");
      if (string) {
        int v21 = (void *)[[NSString alloc] initWithUTF8String:string];
      }
      else {
        int v21 = 0;
      }
      int v24 = xpc_dictionary_get_string(v18, "version-string");
      if (v24) {
        uint64_t v22 = (void *)[[NSString alloc] initWithUTF8String:v24];
      }
      else {
        uint64_t v22 = 0;
      }
      *(void *)length = 0;
      data = xpc_dictionary_get_data(v18, "app-cd-hash", (size_t *)length);
      if (*(void *)length)
      {
        id v26 = data;
        id v27 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        int v28 = (void *)[v27 initWithBytes:v26 length:*(void *)length];
LABEL_26:
        v29 = (void *)v20;
        if (!v20 && !v21 && !v22 && !v28)
        {
          id v30 = 0;
LABEL_36:
          uint64_t v36 = ne_log_large_obj();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)length = 138412290;
            *(void *)&length[4] = v30;
            _os_log_debug_impl(&dword_19DDAF000, v36, OS_LOG_TYPE_DEBUG, "Origin lookup created appInfo:\n%@", length, 0xCu);
          }

          (*((void (**)(id, NEAppInfo *))v11 + 2))(v11, v30);
          id v9 = v37;
          goto LABEL_39;
        }
        id v31 = objc_alloc_init(NEAppInfo);
        id v30 = v31;
        if ((int)a2 < 1)
        {
          if (!v31) {
            goto LABEL_36;
          }
        }
        else
        {
          if (!v31) {
            goto LABEL_36;
          }
          v31->_pid = a2;
        }
        objc_setProperty_nonatomic_copy(v31, v32, v29, 16);
        objc_setProperty_nonatomic_copy(v30, v33, v21, 24);
        objc_setProperty_nonatomic_copy(v30, v34, v22, 32);
        objc_setProperty_nonatomic_copy(v30, v35, v28, 40);
        goto LABEL_36;
      }
    }
    else
    {
      uint64_t v20 = 0;
      int v21 = 0;
      uint64_t v22 = 0;
    }
    int v28 = 0;
    goto LABEL_26;
  }
LABEL_40:
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v5)
  {
    id v11 = ne_log_obj();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = *(_DWORD *)(a1 + 72);
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 67109634;
      int v20 = v13;
      __int16 v21 = 2112;
      uint64_t v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      _os_log_debug_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_DEBUG, "Could not look up appInfo for pid: %d bundle id: %@ uuid: %@", buf, 0x1Cu);
    }

    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_8;
  }
  int v6 = -[NEAppInfoCache appInfo:mismatchedWithUUID:andBundleID:](*(void *)(a1 + 32), v5, *(void **)(a1 + 40), *(void **)(a1 + 48));
  -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40));
  if (!v6)
  {
    uint64_t v12 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_8:
    v12();
    goto LABEL_9;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v9 = *(void **)(a1 + 48);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_3;
  v17[3] = &unk_1E598EEA8;
  v17[4] = v7;
  long long v16 = *(_OWORD *)(a1 + 56);
  id v10 = (id)v16;
  long long v18 = v16;
  -[NEAppInfoCache performCustomLookupIfNecessaryForPid:UUID:bundleID:completionHandler:](v7, 0, v8, v9, v17);

LABEL_9:
}

- (uint64_t)appInfo:(void *)a3 mismatchedWithUUID:(void *)a4 andBundleID:
{
  uint64_t v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    if (v8 && ![v7[2] isEqual:v8]) {
      goto LABEL_7;
    }
    if (!v9) {
      goto LABEL_6;
    }
    id v10 = v7[3];
    id v11 = v9;
    uint64_t v12 = -[NEAppInfoCache bundleIDWithoutTeamID:](v10);
    int v13 = -[NEAppInfoCache bundleIDWithoutTeamID:](v11);
    int v14 = [v12 isEqual:v13];

    if (!v14) {
LABEL_7:
    }
      a1 = 1;
    else {
LABEL_6:
    }
      a1 = 0;
  }

  return a1;
}

- (void)addAppInfoToCache:(void *)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      uint64_t v5 = (void *)v3[2];
      if (v5)
      {
        int v6 = v3;
        id v7 = v5;
        id v10 = objc_msgSend(objc_getProperty(a1, v8, 16, 1), "objectForKeyedSubscript:", v7);
        if (v10)
        {
          id v11 = v6;
          uint64_t v12 = v10;
          int v13 = v12;
          if (!v11[5] && v12[5])
          {
            id v14 = v12[2];
            uint64_t v15 = v14;
            if (v14) {
              BOOL v16 = v4[2] == 0;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16)
            {
              char v17 = objc_msgSend(v14, "isEqual:");

              if (v17) {
                goto LABEL_15;
              }
              goto LABEL_14;
            }
          }
        }
LABEL_14:
        objc_msgSend(objc_getProperty(a1, v9, 16, 1), "setObject:forKeyedSubscript:", v6, v7);
LABEL_15:
      }
    }
    else
    {
      long long v18 = ne_log_obj();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        int v19 = 136315138;
        int v20 = "-[NEAppInfoCache addAppInfoToCache:]";
        _os_log_fault_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_FAULT, "%s called with null appInfo", (uint8_t *)&v19, 0xCu);
      }
    }
  }
}

void __64__NEAppInfoCache_appInfoForPid_UUID_bundleID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4) {
    -[NEAppInfoCache addAppInfoToCache:](*(void **)(a1 + 32), v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)bundleIDWithoutTeamID:(void *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 rangeOfString:@"." options:1];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v5 = [v2 copy];
LABEL_4:
      int v6 = (void *)v5;
      goto LABEL_11;
    }
    if (v4 == 1)
    {
      uint64_t v7 = v3 + 1;
      if (v3 + 1 < (unint64_t)[v2 length])
      {
        uint64_t v5 = [v2 substringFromIndex:v7];
        goto LABEL_4;
      }
    }
    SEL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = (const char *)v2;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "found invalid \".\" in bundle id: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    SEL v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315138;
      id v11 = "-[NEAppInfoCache bundleIDWithoutTeamID:]";
      _os_log_fault_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_FAULT, "%s called with null bundleID", (uint8_t *)&v10, 0xCu);
    }
  }

  int v6 = 0;
LABEL_11:

  return v6;
}

void __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  if (v5) {
    id Property = objc_getProperty(v5, v3, 24, 1);
  }
  else {
    id Property = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke_2;
  v9[3] = &unk_1E59936F8;
  id v7 = *(id *)(a1 + 40);
  id v10 = v4;
  id v11 = v7;
  id v8 = v4;
  dispatch_async(Property, v9);
}

uint64_t __87__NEAppInfoCache_performCustomLookupIfNecessaryForPid_UUID_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end