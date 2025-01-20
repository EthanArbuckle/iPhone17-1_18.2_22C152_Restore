@interface NSFileProviderSearchQuery(NSFileProviderSearch_Private)
@end

@implementation NSFileProviderSearchQuery(NSFileProviderSearch_Private)

- (void)initWithCoder:()NSFileProviderSearch_Private .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A33AE000, log, OS_LOG_TYPE_FAULT, "[SIMCRASH] can't create instance from coder, required nonnull properties missing", v1, 2u);
}

- (void)initWithCoder:()NSFileProviderSearch_Private .cold.2(uint64_t *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_1A33AE000, log, OS_LOG_TYPE_ERROR, "[ERROR] can't create instance from coder, required nonnull properties missing (%@, %@)", (uint8_t *)&v5, 0x16u);
}

@end