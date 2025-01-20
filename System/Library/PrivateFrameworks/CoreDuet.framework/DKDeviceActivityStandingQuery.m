@interface DKDeviceActivityStandingQuery
@end

@implementation DKDeviceActivityStandingQuery

void __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = +[_CDLogging knowledgeChannel];
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke_cold_1(a1, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke_cold_2(a1, (uint64_t)v5, v7);
  }
}

void __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_DEBUG, "Succesfully updated histogram for dayOfWeek %@", (uint8_t *)&v3, 0xCu);
}

void __67___DKDeviceActivityStandingQuery_executeWithStorage_referenceDate___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_18ECEB000, log, OS_LOG_TYPE_ERROR, "Failed to update histogram for dayOfWeek %@, with error %@", (uint8_t *)&v4, 0x16u);
}

@end