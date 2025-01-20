@interface FPDocumentURLFromUniversalBookmarkableString
@end

@implementation FPDocumentURLFromUniversalBookmarkableString

uint64_t __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    v7 = fp_current_or_default_log();
    v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = objc_msgSend((id)v5, "fp_shortDescription");
        int v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] Resolved universal bookmark to URL %@", (uint8_t *)&v11, 0xCu);
      }
      MEMORY[0x1A6247CF0](v5, @"FPFileIsBookmarkURLProperty", *MEMORY[0x1E4F1CFD0]);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2_cold_1((void *)v6);
      }
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, unint64_t, unint64_t))(v10 + 16))(v10, v5, v6);
    }
    [*(id *)(a1 + 32) finish];
  }
  else
  {
    [*(id *)(a1 + 32) callNextOverrides];
  }
}

void __legacy_FPDocumentURLFromUniversalBookmarkableString_block_invoke_2_cold_1(void *a1)
{
  v1 = objc_msgSend(a1, "fp_prettyDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_22(&dword_1A33AE000, v2, v3, "[ERROR] Could not resolve universal bookmark. Error: %@", v4, v5, v6, v7, v8);
}

@end