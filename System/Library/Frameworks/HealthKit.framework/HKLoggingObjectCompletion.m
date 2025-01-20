@interface HKLoggingObjectCompletion
@end

@implementation HKLoggingObjectCompletion

void ___HKLoggingObjectCompletion_block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  _HKInitializeLogging();
  v7 = a1[4];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[7];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2082;
      uint64_t v13 = v9;
      _os_log_impl(&dword_19C023000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}s: Succeeded", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    ___HKLoggingActionCompletion_block_invoke_cold_1();
  }
  (*(void (**)(void))(a1[6] + 16))();
}

@end