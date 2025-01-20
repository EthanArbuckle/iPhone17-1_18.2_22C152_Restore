@interface NSFileManager
@end

@implementation NSFileManager

void __71__NSFileManager_FPAdditions__fp_trashItemAtURL_resultingItemURL_error___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = v6 == 0;
  uint64_t v7 = *(void *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __69__NSFileManager_FPAdditions__fp_putBackURLForTrashedItemAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = fp_current_or_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

void __59__NSFileManager_FPAdditions__fp_setPutBackInfoOnItemAtURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  BOOL v7 = a2 != 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished setting put back URL for item %@ success: %{BOOL}d", (uint8_t *)&v4, 0x12u);
}

@end