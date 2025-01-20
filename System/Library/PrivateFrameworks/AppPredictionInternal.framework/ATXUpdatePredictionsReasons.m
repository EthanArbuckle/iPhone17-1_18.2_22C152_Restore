@interface ATXUpdatePredictionsReasons
+ (id)stringForUpdatePredictionsReason:(unint64_t)a3;
@end

@implementation ATXUpdatePredictionsReasons

+ (id)stringForUpdatePredictionsReason:(unint64_t)a3
{
  if (a3 < 0x18) {
    return off_1E68AF078[a3];
  }
  v5 = __atxlog_handle_default();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    +[ATXUpdatePredictionsReasons stringForUpdatePredictionsReason:](a3, v5);
  }

  objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"stringForUpdatePredictionsReason called with invalid ATXUpdatePredictionsReason value of %lu", a3);
  return @"Error";
}

+ (void)stringForUpdatePredictionsReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "stringForUpdatePredictionsReason called with invalid ATXUpdatePredictionsReason value of %lu", (uint8_t *)&v2, 0xCu);
}

@end