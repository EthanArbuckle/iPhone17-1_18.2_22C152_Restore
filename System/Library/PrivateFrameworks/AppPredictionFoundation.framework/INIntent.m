@interface INIntent
@end

@implementation INIntent

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_cold_1();
  }

  uint64_t v5 = [*(id *)(a1 + 32) _titleWithLocalizer:0 fromBundleURL:0];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1F2716100;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v7);
}

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_8_cold_1();
    }

    uint64_t v9 = [*(id *)(a1 + 32) _titleWithLocalizer:0 fromBundleURL:0];
    v10 = (void *)v9;
    if (v9) {
      v11 = (__CFString *)v9;
    }
    else {
      v11 = &stru_1F2716100;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_cold_1();
  }

  uint64_t v5 = [*(id *)(a1 + 32) _title];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_10_cold_1();
    }

    uint64_t v9 = [*(id *)(a1 + 32) _title];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_cold_1();
  }

  uint64_t v5 = [*(id *)(a1 + 32) _subtitle];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_11_cold_1();
    }

    uint64_t v9 = [*(id *)(a1 + 32) _subtitle];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __43__INIntent_HelperService__atx_indexingHash__block_invoke_cold_1();
  }

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _indexingHash];
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __43__INIntent_HelperService__atx_indexingHash__block_invoke_12_cold_1();
    }

    a2 = [*(id *)(a1 + 32) _indexingHash];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_cold_1();
  }

  id v5 = [*(id *)(a1 + 32) _codableDescription];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 isEligibleForWidgets];
}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_14(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_14_cold_1();
    }

    id v7 = [*(id *)(a1 + 32) _codableDescription];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v7 isEligibleForWidgets];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_cold_1();
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _supportsBackgroundExecution];
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_16(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_16_cold_1();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _supportsBackgroundExecution];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_cold_1();
  }

  uint64_t v5 = INIntentCreate();
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_17(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_17_cold_1();
    }

    uint64_t v9 = INIntentCreate();
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = __atxlog_handle_intents_helper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_cold_1();
  }
}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = __atxlog_handle_intents_helper();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_19_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_titleWithoutLocalizing unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __53__INIntent_HelperService__atx_titleWithoutLocalizing__block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_titleWithoutLocalizing unable to get a valid unlocalized title: %@", v2, v3, v4, v5, v6);
}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_titleWithEfficientLocalization unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __61__INIntent_HelperService__atx_titleWithEfficientLocalization__block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_titleWithEfficientLocalization unable to get a valid title: %@", v2, v3, v4, v5, v6);
}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_subtitleWithEfficientLocalization unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __64__INIntent_HelperService__atx_subtitleWithEfficientLocalization__block_invoke_11_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_subtitleWithEfficientLocalization error encountered while requesting subtitle: %@", v2, v3, v4, v5, v6);
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_indexingHash unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __43__INIntent_HelperService__atx_indexingHash__block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_indexingHash error encountered while requesting indexing hash: %@", v2, v3, v4, v5, v6);
}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_isEligibleForWidgets unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __51__INIntent_HelperService__atx_isEligibleForWidgets__block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_isEligibleForWidgets error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_supportsBackgroundExecution unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __58__INIntent_HelperService__atx_supportsBackgroundExecution__block_invoke_16_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "atx_supportsBackgroundExecution error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "createdIntentWithIntentType unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __69__INIntent_HelperService__atx_createIntentWithIntentType_intentData___block_invoke_17_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "createdIntentWithIntentType error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "createEventIntentWithCurrentDate unable to establish XPC connection: %@", v2, v3, v4, v5, v6);
}

void __70__INIntent_HelperService__atx_createEventIntentWithStartDate_endDate___block_invoke_19_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_1D0F2B000, v0, v1, "createEventIntentWithCurrentDate error encountered while requesting intent: %@", v2, v3, v4, v5, v6);
}

@end