@interface CacheDeleteRegisterLegacyCallbacks
@end

@implementation CacheDeleteRegisterLegacyCallbacks

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (*(uint64_t (**)(void))(v2 + 16))();
  }
  else
  {
    v4 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_1A63D1000, v4, OS_LOG_TYPE_ERROR, "%@ has a PURGEABLE property, but the callback is NULL", buf, 0xCu);
    }

    uint64_t v3 = 0;
  }
  v5 = getRootVolume();
  v6 = objc_msgSend(NSNumber, "numberWithLongLong:", v3, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v5);
  v11[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:2];

  return v7;
}

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke_292(uint64_t a1, int a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v5 longLongValue];
    if (v6 == -1)
    {
      uint64_t v7 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A63D1000, v7, OS_LOG_TYPE_ERROR, "Boot volume not included in info dict, returning nil", buf, 2u);
      }
      uint64_t v8 = 0;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v9 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v22 = 420;
      *(_WORD *)&v22[4] = 2112;
      *(void *)&v22[6] = v5;
      _os_log_error_impl(&dword_1A63D1000, v9, OS_LOG_TYPE_ERROR, "%d num is not a number: %@", buf, 0x12u);
    }

    uint64_t v6 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = CDGetLogHandle((uint64_t)"client");
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)v22 = v13;
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = v6;
      __int16 v23 = 1024;
      int v24 = a2;
      _os_log_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_DEFAULT, "calling %@'s purge with %lld at urgency %d", buf, 0x1Cu);
    }

    uint64_t v14 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    v12 = CDGetLogHandle((uint64_t)"client");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)v22 = v15;
      *(_WORD *)&v22[8] = 2048;
      *(void *)&v22[10] = v14;
      _os_log_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_DEFAULT, "%@ returned: %lld", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      *(void *)v22 = v18;
      _os_log_error_impl(&dword_1A63D1000, v12, OS_LOG_TYPE_ERROR, "%@ has a PURGE property, but the callback is NULL", buf, 0xCu);
    }
    uint64_t v14 = 0;
  }

  uint64_t v7 = getRootVolume();
  v16 = objc_msgSend(NSNumber, "numberWithLongLong:", v14, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v7);
  v20[1] = v16;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:2];

LABEL_18:
  return v8;
}

uint64_t ___CacheDeleteRegisterLegacyCallbacks_block_invoke_293(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v5 = [a3 objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v6 = [v5 longLongValue];
  if (v6 == -1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v8, v7, a2);
    }
    else
    {
      v11 = CDGetLogHandle((uint64_t)"client");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v19 = v15;
        _os_log_error_impl(&dword_1A63D1000, v11, OS_LOG_TYPE_ERROR, "%@ has periodic property in CacheDelete.plist, but a NULL callback", buf, 0xCu);
      }

      uint64_t v9 = 0;
    }
    v12 = getRootVolume();
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithLongLong:", v9, @"CACHE_DELETE_VOLUME", @"CACHE_DELETE_AMOUNT", v12);
    v17[1] = v13;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:2];
  }
  return v10;
}

@end