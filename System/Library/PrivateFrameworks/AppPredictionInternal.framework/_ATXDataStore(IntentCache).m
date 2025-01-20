@interface _ATXDataStore(IntentCache)
@end

@implementation _ATXDataStore(IntentCache)

- (void)writeValidParameterCombinationsWithSchema:()IntentCache cacheKey:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "NSKeyedArchiver failed to archive parameterCombinationsWithSchema", v1, 2u);
}

- (void)validParameterCombinationsWithSchemaForCacheKey:()IntentCache .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "NSKeyedUnarchiver failed to unarchive parameterCombinationsWithSchema %@", (uint8_t *)&v2, 0xCu);
}

@end