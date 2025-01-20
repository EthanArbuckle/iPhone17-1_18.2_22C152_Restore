@interface CacheDeleteRegister
@end

@implementation CacheDeleteRegister

void ___CacheDeleteRegister_block_invoke_255(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(id)qword_1EB30C3E0 objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 96) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  v5 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  if (v5)
  {
    if (*(unsigned char *)(a1 + 128) || [v5 anonymous])
    {
      v6 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [*(id *)(a1 + 32) UTF8String];
        *(_DWORD *)buf = 136315138;
        *(void *)v39 = v30;
        _os_log_error_impl(&dword_1A63D1000, v6, OS_LOG_TYPE_ERROR, "CacheDeleteRegistration of %s: new registration is or previous registration was anonymous.", buf, 0xCu);
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) suspend];
  }
  else
  {
    uint64_t v7 = +[CacheDeleteServiceListener cacheDeleteServiceListener:*(void *)(a1 + 32) options:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 96) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [(id)qword_1EB30C3E0 setObject:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40))
  {
    if (*(unsigned char *)(a1 + 128))
    {
      uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
      uint64_t v11 = *(void *)(*(void *)(a1 + 104) + 8);
      v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;
    }
    v13 = [MEMORY[0x1E4F1CA48] array];
    v14 = v13;
    if (*(void *)(a1 + 48)) {
      [v13 addObject:@"PURGEABLE_ENTITLEMENT"];
    }
    if (*(void *)(a1 + 56))
    {
      [v14 addObject:@"PURGE_ENTITLEMENT"];
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) addObject:@"PURGE"];
    }
    if (*(void *)(a1 + 64)) {
      [v14 addObject:@"CANCEL_PURGE_ENTITLEMENT"];
    }
    if (*(void *)(a1 + 72))
    {
      [v14 addObject:@"PERIODIC_ENTITLEMENT"];
      [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) addObject:@"PERIODIC"];
    }
    if (*(void *)(a1 + 80))
    {
      [v14 addObject:@"NOTIFICATION_ENTITLEMENT"];
      v15 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        v17 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v39 = 155;
        *(_WORD *)&v39[4] = 2112;
        *(void *)&v39[6] = v16;
        __int16 v40 = 2112;
        v41 = v17;
        _os_log_impl(&dword_1A63D1000, v15, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteRegister notify for %@ with options: %@", buf, 0x1Cu);
      }

      uint64_t v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_PURGE_NOTIFICATION"];
      if (v18)
      {
        v19 = (void *)v18;
        v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_PURGE_NOTIFICATION"];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          v22 = *(void **)(a1 + 40);
          uint64_t v36 = *(void *)(a1 + 32);
          v23 = [v22 objectForKeyedSubscript:@"CACHE_DELETE_PURGE_NOTIFICATION"];
          v37 = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];

          v25 = CDGetLogHandle((uint64_t)"client");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)v39 = 161;
            *(_WORD *)&v39[4] = 2112;
            *(void *)&v39[6] = v26;
            __int16 v40 = 2112;
            v41 = v24;
            _os_log_impl(&dword_1A63D1000, v25, OS_LOG_TYPE_DEFAULT, "%d _CacheDeleteRegister calling deleted for %@ with: %@", buf, 0x1Cu);
          }

          uint64_t v31 = MEMORY[0x1E4F143A8];
          uint64_t v32 = 3221225472;
          v33 = ___CacheDeleteRegister_block_invoke_278;
          v34 = &unk_1E5C51390;
          id v35 = v24;
          id v27 = v24;
          CallCacheD(&v31, &__block_literal_global_280);
        }
      }
    }
    if (*(void *)(a1 + 88))
    {
      v28 = [*(id *)(a1 + 120) objectForKeyedSubscript:@"CACHE_DELETE_REQUIRED_ENTITLEMENTS"];
      if (v28) {
        [v14 addObjectsFromArray:v28];
      }

      uint64_t v29 = *(void *)(a1 + 88);
    }
    else
    {
      uint64_t v29 = 0;
    }
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), "setPurgeable:purge:cancel:periodic:notify:callback:entitlements:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), v29, v14, v31, v32, v33, v34);
    [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) resume];
  }
  else
  {
    v14 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A63D1000, v14, OS_LOG_TYPE_ERROR, "unable to create listener", buf, 2u);
    }
  }
}

void ___CacheDeleteRegister_block_invoke_285(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  v4 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v5 = a2;
  v6 = [v4 endpoint];
  uint64_t v7 = *(void *)(*(void *)(a1[6] + 8) + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___CacheDeleteRegister_block_invoke_2_286;
  v8[3] = &unk_1E5C51708;
  v8[4] = a1[7];
  [v5 clientCheckin:v3 endpoint:v6 info:v7 reply:v8];
}

uint64_t ___CacheDeleteRegister_block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.cache_delete_registration_queue", 0);
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = (uint64_t)v0;

  qword_1EB30C3E0 = [MEMORY[0x1E4F1CA60] dictionary];
  return MEMORY[0x1F41817F8]();
}

void ___CacheDeleteRegister_block_invoke_2_286(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_ERROR, "Proxy check-in error: %@, serviceInfo: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t ___CacheDeleteRegister_block_invoke_278(uint64_t a1, void *a2)
{
  return [a2 clientSetState:*(void *)(a1 + 32) key:@"CACHE_DELETE_PURGE_NOTIFICATION"];
}

void ___CacheDeleteRegister_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_ERROR, "CallCacheD failed: %@", (uint8_t *)&v4, 0xCu);
  }
}

void ___CacheDeleteRegister_block_invoke_288(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_ERROR, "Failed to register: %@", (uint8_t *)&v4, 0xCu);
  }
}

@end