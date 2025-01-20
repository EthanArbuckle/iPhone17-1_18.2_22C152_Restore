@interface BMStream
@end

@implementation BMStream

void __42__BMStream_ATXExtras__atx_dateOfLastEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __42__BMStream_ATXExtras__atx_dateOfLastEvent__block_invoke_cold_1(a1, v3, v5);
    }
  }
}

uint64_t __42__BMStream_ATXExtras__atx_dateOfLastEvent__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 timestamp];
  double v7 = v6;

  uint64_t v8 = [v5 initWithTimeIntervalSinceReferenceDate:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  return 0;
}

void __42__BMStream_ATXExtras__atx_dateOfLastEvent__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) identifier];
  double v6 = [a2 error];
  int v7 = 138543618;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  v10 = v6;
  _os_log_error_impl(&dword_1D0F2B000, a3, OS_LOG_TYPE_ERROR, "Could not retrieve the last modified date of the %{public}@ stream: %@", (uint8_t *)&v7, 0x16u);
}

@end