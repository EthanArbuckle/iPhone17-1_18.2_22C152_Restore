@interface LNStaticDeferredLocalizedString
@end

@implementation LNStaticDeferredLocalizedString

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_cold_1();
  }

  uint64_t v5 = [*(id *)(a1 + 32) localizedStringForLocaleIdentifier:0];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_32_cold_1();
    }

    uint64_t v9 = [*(id *)(a1 + 32) localizedStringForLocaleIdentifier:0];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D0F2B000, v0, OS_LOG_TYPE_ERROR, "%s: unable to establish XPC connection: %@", (uint8_t *)v1, 0x16u);
}

void __78__LNStaticDeferredLocalizedString_HelperService__atx_efficientLocalizedString__block_invoke_32_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1D0F2B000, v0, OS_LOG_TYPE_ERROR, "%s: unable to get a valid localized string: %@", (uint8_t *)v1, 0x16u);
}

@end