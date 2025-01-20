@interface ISInvalidateCacheEntriesForBundleIdentifier
@end

@implementation ISInvalidateCacheEntriesForBundleIdentifier

void ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _ISDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_1(uint64_t a1, int a2, void *a3)
{
  id v4 = a3;
  v5 = _ISDefaultLog();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AE771000, v6, OS_LOG_TYPE_INFO, "Cache clear started.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_cold_1((uint64_t)v4, v6);
  }
}

void ___ISInvalidateCacheEntriesForBundleIdentifier_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AE771000, a2, OS_LOG_TYPE_ERROR, "Error clearing icon cache: %@", (uint8_t *)&v2, 0xCu);
}

@end