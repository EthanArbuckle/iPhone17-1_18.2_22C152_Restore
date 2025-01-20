@interface DASSubmissionRateLimiter
@end

@implementation DASSubmissionRateLimiter

uint64_t __42___DASSubmissionRateLimiter_sharedLimiter__block_invoke()
{
  sharedLimiter_limitation = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

uint64_t __33___DASSubmissionRateLimiter_init__block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33___DASSubmissionRateLimiter_init__block_invoke_cold_1();
  }

  uint64_t result = notify_get_state([*(id *)(a1 + 32) token], &state64);
  if (!result)
  {
    v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "testing"));
      *(_DWORD *)buf = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1B578B000, v4, OS_LOG_TYPE_DEFAULT, "Limiter override state = %@", buf, 0xCu);
    }
    return [*(id *)(a1 + 32) setTesting:state64 != 0];
  }
  return result;
}

uint64_t __33___DASSubmissionRateLimiter_init__block_invoke_6(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __33___DASSubmissionRateLimiter_init__block_invoke_6_cold_1();
  }

  return [*(id *)(a1 + 32) timerHandler];
}

void __33___DASSubmissionRateLimiter_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B578B000, v0, v1, "Got notification for limiter override", v2, v3, v4, v5, v6);
}

void __33___DASSubmissionRateLimiter_init__block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1B578B000, v0, v1, "Timer fired for submission penalty checks", v2, v3, v4, v5, v6);
}

@end