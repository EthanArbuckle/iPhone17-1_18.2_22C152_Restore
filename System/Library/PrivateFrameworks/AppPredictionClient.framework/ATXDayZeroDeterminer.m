@interface ATXDayZeroDeterminer
+ (BOOL)doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo:(unint64_t)a3;
+ (BOOL)isDayZeroByFirstAppLaunchDateWithThresholdDateFromDaysAgo:(unint64_t)a3;
@end

@implementation ATXDayZeroDeterminer

+ (BOOL)isDayZeroByFirstAppLaunchDateWithThresholdDateFromDaysAgo:(unint64_t)a3
{
  return [a1 doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo:a3] ^ 1;
}

+ (BOOL)doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__1;
  v23 = __Block_byref_object_dispose__1;
  id v24 = 0;
  v4 = BiomeLibrary();
  v5 = [v4 App];
  v6 = [v5 InFocus];
  v7 = objc_msgSend(v6, "atx_publisherFromStartDate:", 0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__ATXDayZeroDeterminer_doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo___block_invoke_2;
  v18[3] = &unk_1E5D05B38;
  v18[4] = &v19;
  id v8 = (id)[v7 sinkWithCompletion:&__block_literal_global_6 shouldContinue:v18];

  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v10 = [MEMORY[0x1E4F1C9C8] now];
  v11 = [v9 dateByAddingUnit:16 value:-(uint64_t)a3 toDate:v10 options:0];

  v12 = (void *)v20[5];
  if (v12 && [v12 compare:v11] != 1)
  {
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v20[5];
      *(_DWORD *)buf = 136315394;
      v26 = "+[ATXDayZeroDeterminer doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo:]";
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "%s: biome app launch data goes back at least 20 days. Date of first event: %@", buf, 0x16u);
    }
    BOOL v15 = 1;
  }
  else
  {
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = v20[5];
      *(_DWORD *)buf = 136315394;
      v26 = "+[ATXDayZeroDeterminer doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo:]";
      __int16 v27 = 2112;
      uint64_t v28 = v14;
      _os_log_impl(&dword_1A790D000, v13, OS_LOG_TYPE_DEFAULT, "%s: biome app launch data does NOT go back at least 20 days. Date of first event: %@", buf, 0x16u);
    }
    BOOL v15 = 0;
  }

  _Block_object_dispose(&v19, 8);
  return v15;
}

uint64_t __75__ATXDayZeroDeterminer_doesBiomeAppLaunchDataGoBackAtLeastNumberOfDaysAgo___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x1E4F1C9C8];
  [a2 timestamp];
  uint64_t v4 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return 0;
}

@end