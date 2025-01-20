@interface HKLoggingActionCompletion
@end

@implementation HKLoggingActionCompletion

void ___HKLoggingActionCompletion_block_invoke(void *a1, int a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  v6 = a1[4];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = a1[5];
      uint64_t v8 = a1[7];
      int v9 = 138543618;
      uint64_t v10 = v7;
      __int16 v11 = 2082;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19C023000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s: Succeeded", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    ___HKLoggingActionCompletion_block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[6] + 16))();
}

void ___HKLoggingActionCompletion_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_14();
  OUTLINED_FUNCTION_1_1(&dword_19C023000, v0, v1, "%{public}@: %{public}s: Failed: %{public}@");
}

@end