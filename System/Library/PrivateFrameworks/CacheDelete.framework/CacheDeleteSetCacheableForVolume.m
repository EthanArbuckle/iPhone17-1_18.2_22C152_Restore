@interface CacheDeleteSetCacheableForVolume
@end

@implementation CacheDeleteSetCacheableForVolume

void ___CacheDeleteSetCacheableForVolume_block_invoke(uint64_t a1, void *a2)
{
  v27[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v3 = MEMORY[0x1E4F1CC38];
  }
  v26[0] = @"CACHE_DELETE_CACHE_ENABLED";
  v26[1] = @"CACHE_DELETE_CACHEABLE_DURATION";
  uint64_t v4 = *(void *)(a1 + 32);
  v27[0] = v3;
  v27[1] = v4;
  v26[2] = @"CACHE_DELETE_TIMESTAMP";
  v5 = NSNumber;
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a2;
  [v6 timeIntervalSinceReferenceDate];
  v8 = objc_msgSend(v5, "numberWithDouble:");
  v27[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:3];

  [v7 clientSetState:v9 key:*(void *)(a1 + 40)];
  v10 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 48)) {
      v11 = "TRUE";
    }
    else {
      v11 = "FALSE";
    }
    [*(id *)(a1 + 32) doubleValue];
    uint64_t v13 = v12;
    [*(id *)(a1 + 32) doubleValue];
    v15 = days_hours_mins(v14);
    v16 = (void *)MEMORY[0x1E4F1C9C8];
    [*(id *)(a1 + 32) doubleValue];
    v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceNow:");
    int v18 = 136315906;
    v19 = v11;
    __int16 v20 = 2048;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    v23 = v15;
    __int16 v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_1A63D1000, v10, OS_LOG_TYPE_DEFAULT, "_CacheDeleteSetCacheableForVolume setting cacheable to %s, with a duration of: %f (%@), expiring on: %@", (uint8_t *)&v18, 0x2Au);
  }
}

void ___CacheDeleteSetCacheableForVolume_block_invoke_328(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = CDGetLogHandle((uint64_t)"client");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_error_impl(&dword_1A63D1000, v3, OS_LOG_TYPE_ERROR, "_CacheDeleteSetCacheableForVolume CallCacheD error: %@", (uint8_t *)&v4, 0xCu);
  }
}

@end