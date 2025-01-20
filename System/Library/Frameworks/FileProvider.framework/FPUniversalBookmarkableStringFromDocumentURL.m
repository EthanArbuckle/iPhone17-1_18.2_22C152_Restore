@interface FPUniversalBookmarkableStringFromDocumentURL
@end

@implementation FPUniversalBookmarkableStringFromDocumentURL

uint64_t __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(result + 40);
  if (v8)
  {
    id v9 = FPProviderNotFoundErrorForURL(*(void *)(result + 32), a2, a3, a4, a5, a6, a7, a8);
    v10 = *(uint64_t (**)(uint64_t, void, id))(v8 + 16);
    return v10(v8, 0, v9);
  }
  return result;
}

void __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a2;
  unint64_t v6 = a3;
  if (v5 | v6)
  {
    v7 = fp_current_or_default_log();
    uint64_t v8 = v7;
    if (v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
        int v11 = 138412290;
        v12 = v9;
        _os_log_impl(&dword_1A33AE000, v8, OS_LOG_TYPE_INFO, "[INFO] Created a universal bookmark for %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2_cold_1();
    }

    uint64_t v10 = *(void *)(a1 + 48);
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

void __legacy_FPUniversalBookmarkableStringFromDocumentURL_block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_16_0();
  objc_msgSend(*(id *)(v1 + 40), "fp_scopeDescription");
  objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend((id)OUTLINED_FUNCTION_15_1(), "fp_prettyDescription");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_25(&dword_1A33AE000, v3, v4, "[ERROR] Could not create a universal bookmark for %@: %@", v5, v6, v7, v8, v9);
}

@end