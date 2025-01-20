@interface ATXGlobalAppScoresUtil
+ (id)getContextKeyForTimeOfDayIndex:(int)a3 dayOfWeekIndex:(int)a4 locationIndex:(int)a5 bundleIdIndex:(int)a6;
+ (id)initializeTrieAtPath:(id)a3;
+ (id)loadCoreMLModelWithName:(id)a3;
+ (id)normalizeValues:(id)a3;
+ (int)dayOfWeekIndexFromDate:(id)a3;
+ (int)locationTypeIndexFromRTLocationOfInterestType:(int64_t)a3;
+ (int)timeOfDayIndexFromDate:(id)a3;
@end

@implementation ATXGlobalAppScoresUtil

+ (int)locationTypeIndexFromRTLocationOfInterestType:(int64_t)a3
{
  if (a3 == 1) {
    int v3 = 3;
  }
  else {
    int v3 = 1;
  }
  if (a3) {
    return v3;
  }
  else {
    return 2;
  }
}

+ (int)dayOfWeekIndexFromDate:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [v5 components:544 fromDate:v4];

  LODWORD(v4) = [v6 weekday];
  return (int)v4;
}

+ (int)timeOfDayIndexFromDate:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  v5 = [v3 currentCalendar];
  v6 = [v5 components:544 fromDate:v4];

  LODWORD(v4) = (int)[v6 hour] / 4 + 1;
  return (int)v4;
}

+ (id)initializeTrieAtPath:(id)a3
{
  int v3 = [MEMORY[0x1E4F4AF08] pathForResource:a3 ofType:@"trie" isDirectory:0];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F93AC8]) initWithPath:v3];
  }
  else
  {
    v5 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[ATXGlobalAppScoresUtil initializeTrieAtPath:](v5);
    }

    id v4 = 0;
  }

  return v4;
}

+ (id)loadCoreMLModelWithName:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v4 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[ATXGlobalAppScoresUtil loadCoreMLModelWithName:](v4);
    }
    goto LABEL_10;
  }
  id v4 = [MEMORY[0x1E4F4AF08] pathForResource:v3 ofType:@"mlmodelc" isDirectory:1];
  if (!v4)
  {
LABEL_10:
    v8 = 0;
    id v9 = 0;
    goto LABEL_11;
  }
  v5 = objc_opt_new();
  [v5 setComputeUnits:0];
  v6 = (void *)MEMORY[0x1E4F1E968];
  v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v12 = 0;
  v8 = [v6 modelWithContentsOfURL:v7 configuration:v5 error:&v12];
  id v9 = v12;

  if (v9)
  {
    v10 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[ATXGlobalAppScoresUtil loadCoreMLModelWithName:v10];
    }
  }
LABEL_11:

  return v8;
}

+ (id)normalizeValues:(id)a3
{
  id v3 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke;
  v10[3] = &unk_1E68B2260;
  v10[4] = v11;
  [v3 enumerateKeysAndObjectsUsingBlock:v10];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2;
  v7[3] = &unk_1E68B2288;
  id v4 = v3;
  id v8 = v4;
  id v9 = v11;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];
  v5 = (void *)[v4 copy];

  _Block_object_dispose(v11, 8);
  return v5;
}

double __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  double v5 = NSNumber;
  id v6 = a2;
  [a3 doubleValue];
  double v8 = v7 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  double v9 = fabs(v8);
  if (v9 >= INFINITY && v9 <= INFINITY)
  {
    v10 = __atxlog_handle_app_prediction();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2_cold_1(v10);
    }

    double v8 = 0.0;
  }
  v11 = [v5 numberWithDouble:v8];
  [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v6];
}

+ (id)getContextKeyForTimeOfDayIndex:(int)a3 dayOfWeekIndex:(int)a4 locationIndex:(int)a5 bundleIdIndex:(int)a6
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%01d%01d%01d%04d", (a5 - 1), (a3 - 1), (a4 - 1), *(void *)&a6);
}

+ (void)initializeTrieAtPath:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXGlobalAppSignalsUtil: Could not locate the trie located at %@", (uint8_t *)&v1, 0xCu);
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXGlobalAppSignalsUtil: Missing model name", v1, 2u);
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXGlobalAppSignalsUtil: Error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

void __42__ATXGlobalAppScoresUtil_normalizeValues___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ATXGlobalAppScoresUtil: invalid normalized score", v1, 2u);
}

@end