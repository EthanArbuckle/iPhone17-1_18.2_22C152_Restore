@interface ATXAppDailyDoseCurrentStore
@end

@implementation ATXAppDailyDoseCurrentStore

void *__44___ATXAppDailyDoseCurrentStore_isExpiredAt___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  result = (void *)v2[5];
  if ((result || ([v2 _readCacheAndExpiration], (result = *(void **)(a1[4] + 40)) != 0))
    && (result = (void *)[result compare:a1[5]], result == (void *)1))
  {
    result = (void *)[*(id *)(a1[4] + 40) timeIntervalSinceDate:a1[5]];
    BOOL v5 = v4 > 86400.0;
  }
  else
  {
    BOOL v5 = 1;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v5;
  return result;
}

uint64_t __56___ATXAppDailyDoseCurrentStore_resetWithDurationMap_on___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 48);
  v3 = [MEMORY[0x1E4F1CAF0] systemTimeZone];
  uint64_t v4 = +[ATXTimeUtil nextStartOfDayAfter:v2 timeZone:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(void **)(a1 + 32);
  return [v7 _overwrite];
}

void __47___ATXAppDailyDoseCurrentStore_currentDoseFor___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) _getCacheFromFile];
  uint64_t v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 doubleValue];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _getCacheFromFile];
  uint64_t v3 = NSNumber;
  id v4 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v4 doubleValue];
  v6 = [v3 numberWithDouble:v5 + *(double *)(a1 + 56)];
  [v2 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke_2;
  v9[3] = &unk_1E68AB870;
  v9[4] = v7;
  id v10 = *(id *)(a1 + 48);
  dispatch_async(v8, v9);
}

id __51___ATXAppDailyDoseCurrentStore_increaseDoseFor_by___block_invoke_2(uint64_t a1)
{
  return self;
}

@end