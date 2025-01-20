@interface LTPreflightChecker
@end

@implementation LTPreflightChecker

uint64_t __35___LTPreflightChecker__sharedQueue__block_invoke()
{
  _sharedQueue_sharedQueue = (uint64_t)dispatch_queue_create("com.apple.translation.TextSession.PreflightChecker", 0);

  return MEMORY[0x270F9A758]();
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke(id *a1)
{
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v4 = a1[4];
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2;
    v5[3] = &unk_2651DC0A0;
    objc_copyWeak(&v9, v2);
    id v6 = a1[5];
    id v7 = a1[4];
    id v8 = a1[6];
    [WeakRetained _checkTranslationSupportForConfiguration:v4 completion:v5];

    objc_destroyWeak(&v9);
  }
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (a2)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2;
      v12[3] = &unk_2651DC078;
      objc_copyWeak(&v16, v4);
      id v13 = *(id *)(a1 + 32);
      id v14 = *(id *)(a1 + 40);
      id v15 = *(id *)(a1 + 48);
      [WeakRetained _resolveSourceLocaleIfNeeded:v6 completion:v12];

      objc_destroyWeak(&v16);
    }
    else
    {
      id v7 = (void *)MEMORY[0x263F087E8];
      id v8 = [*(id *)(a1 + 40) effectiveSourceLocale];
      id v9 = [*(id *)(a1 + 40) effectiveTargetLocale];
      v10 = objc_msgSend(v7, "lt_unsupportedPairingErrorWithSource:target:", v8, v9);

      v11 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    v5 = *(void **)(a1 + 40);
    if (v3)
    {
      [v5 setResolvedSourceLocale:v3];
      uint64_t v6 = *(void *)(a1 + 40);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3;
      v16[3] = &unk_2651DC078;
      objc_copyWeak(&v20, (id *)(a1 + 56));
      id v17 = *(id *)(a1 + 32);
      id v18 = *(id *)(a1 + 40);
      id v19 = *(id *)(a1 + 48);
      [WeakRetained _resolveTargetLocaleIfNeeded:v6 completion:v16];

      objc_destroyWeak(&v20);
      goto LABEL_14;
    }
    id v7 = [v5 requestedSourceLocale];

    if (v7)
    {
      id v8 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1((void **)(a1 + 40), v8);
      }
      id v9 = (void *)MEMORY[0x263F087E8];
      v10 = [*(id *)(a1 + 40) requestedSourceLocale];
      v11 = objc_msgSend(v9, "lt_unsupportedSourceLanguageError:", v10);
    }
    else
    {
      v11 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:21 userInfo:0];
      v12 = [*(id *)(a1 + 40) sourceStrings];
      uint64_t v13 = [v12 count];

      id v14 = _LTOSLogTextAPI();
      id v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_24639B000, v15, OS_LOG_TYPE_DEFAULT, "Failed to identify source text, asking delegate to resolve it", buf, 2u);
        }
        [WeakRetained _callDelegateOrGiveError:v11 forConfiguration:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
        goto LABEL_13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24639B000, v15, OS_LOG_TYPE_INFO, "Failed to identify source text because there aren't any source strings, returning LID failed error", buf, 2u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_13:
  }
LABEL_14:
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      [*(id *)(a1 + 40) setResolvedTargetLocale:v3];
      uint64_t v5 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4;
      v10[3] = &unk_2651DC050;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      id v11 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 40);
      [WeakRetained _resolveLocalePairingForConfiguration:v5 completion:v10];

      objc_destroyWeak(&v14);
    }
    else
    {
      uint64_t v6 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3_cold_1();
      }
      id v7 = (void *)MEMORY[0x263F087E8];
      id v8 = [*(id *)(a1 + 40) effectiveTargetLocale];
      id v9 = objc_msgSend(v7, "lt_unsupportedTargetLanguageError:", v8);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      uint64_t v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4_cold_1();
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:13 userInfo:0];
      uint64_t v7 = *(void *)(a1 + 40);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5;
      v8[3] = &unk_2651DC028;
      objc_copyWeak(&v12, (id *)(a1 + 56));
      id v9 = *(id *)(a1 + 32);
      id v10 = *(id *)(a1 + 40);
      id v11 = *(id *)(a1 + 48);
      [WeakRetained _callDelegateOrGiveError:v6 forConfiguration:v7 completion:v8];

      objc_destroyWeak(&v12);
    }
  }
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v6)
    {
      int v8 = [*(id *)(a1 + 40) isForDownloadApprovalOnly];
      id v9 = _LTOSLogTextAPI();
      id v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v12 = 138412290;
          id v13 = v6;
          _os_log_impl(&dword_24639B000, v10, OS_LOG_TYPE_INFO, "Download-only request got error, but ignoring it since it's likely the user cancelled: %@", (uint8_t *)&v12, 0xCu);
        }
        id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      }
      else
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5_cold_1();
        }
        id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      }
    }
    else
    {
      id v11 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v11();
  }
}

uint64_t __75___LTPreflightChecker__checkTranslationSupportForConfiguration_completion___block_invoke(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke_2;
    block[3] = &unk_2651DC118;
    id v13 = *(id *)(a1 + 32);
    id v11 = v5;
    id v12 = v6;
    dispatch_async(v9, block);
  }
}

uint64_t __76___LTPreflightChecker__callDelegateOrGiveError_forConfiguration_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke_2;
  v10[3] = &unk_2651DC188;
  id v11 = v5;
  uint64_t v7 = *(NSObject **)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = *(id *)(a1 + 48);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke_2(uint64_t a1)
{
  v21[1] = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32)) {
    goto LABEL_3;
  }
  v2 = (void *)MEMORY[0x263EFF960];
  v21[0] = *(void *)(a1 + 32);
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
  id v4 = [*(id *)(a1 + 40) supportedLocales];
  id v5 = objc_msgSend(v2, "lt_bestMatchForPreferredLocales:fromSupportedLocales:", v3, v4);

  if (!v5)
  {
LABEL_3:
    id v6 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 _ltLocaleIdentifier];
      BOOL v10 = *(void *)(a1 + 48) != 0;
      int v17 = 138543618;
      id v18 = v9;
      __int16 v19 = 1024;
      LODWORD(v20) = v10;
      _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_INFO, "LID resolved source locale of '%{public}@' doesn't match any supportedLocales, considering the source language unsupported, and adding low confidence locales: %{BOOL}i", (uint8_t *)&v17, 0x12u);
    }
    [*(id *)(a1 + 40) setLidUnsupportedLocale:*(void *)(a1 + 32)];
    id v5 = 0;
  }
  id v11 = *(void **)(a1 + 48);
  if (v11)
  {
    id v12 = [v11 _ltCompactMap:&__block_literal_global_19_0];
    id v13 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = *(void **)(a1 + 32);
      id v15 = v13;
      id v16 = [v14 _ltLocaleIdentifier];
      int v17 = 138543618;
      id v18 = v16;
      __int16 v19 = 2114;
      id v20 = v12;
      _os_log_impl(&dword_24639B000, v15, OS_LOG_TYPE_INFO, "LID resolved source locale of '%{public}@', but also had low confidence locales so will need more user intervention: %{public}@", (uint8_t *)&v17, 0x16u);
    }
    [*(id *)(a1 + 40) setLowConfidenceLocales:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __63___LTPreflightChecker__resolveSourceLocaleIfNeeded_completion___block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 _ltLocaleIdentifier];
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke(id *a1)
{
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    id v4 = (void *)[a1[4] copy];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2;
    v6[3] = &unk_2651DC078;
    objc_copyWeak(&v10, v2);
    id v7 = a1[5];
    id v5 = v4;
    id v8 = v5;
    id v9 = a1[6];
    [WeakRetained _resolveTargetLocaleIfNeeded:v5 completion:v6];

    objc_destroyWeak(&v10);
  }
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      [*(id *)(a1 + 40) setResolvedTargetLocale:v3];
      uint64_t v5 = *(void *)(a1 + 40);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_21;
      v10[3] = &unk_2651DC050;
      objc_copyWeak(&v14, (id *)(a1 + 56));
      id v11 = *(id *)(a1 + 32);
      id v13 = *(id *)(a1 + 48);
      id v12 = *(id *)(a1 + 40);
      [WeakRetained _resolveLocalePairingForConfiguration:v5 completion:v10];

      objc_destroyWeak(&v14);
    }
    else
    {
      id v6 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2_cold_1();
      }
      id v7 = (void *)MEMORY[0x263F087E8];
      id v8 = [*(id *)(a1 + 40) effectiveTargetLocale];
      id v9 = objc_msgSend(v7, "lt_unsupportedTargetLanguageError:", v8);

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v3)
    {
      uint64_t v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_21_cold_1();
      }
      id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      id v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    }
    v6();
  }
}

void __70___LTPreflightChecker_resolveSourceLocaleForConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = [v3 dominantLocale];
  if (v10)
  {
    id v4 = [_LTSELFLoggingInvocation alloc];
    uint64_t v5 = [*(id *)(a1 + 32) selfLoggingID];
    id v6 = [(_LTSELFLoggingInvocation *)v4 initWithInvocationId:v5];

    [(_LTSELFLoggingInvocation *)v6 languageIdentificationCompletedWithInputSource:1 topLocale:v10 lowConfidenceLocales:MEMORY[0x263EFFA68]];
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [v3 lowConfidenceLocales];

    (*(void (**)(uint64_t, id, void *))(v7 + 16))(v7, v10, v8);
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v6 = [v3 dominantUnsupportedLocale];
    id v8 = [v3 lowConfidenceLocales];

    (*(void (**)(uint64_t, _LTSELFLoggingInvocation *, void *))(v9 + 16))(v9, v6, v8);
  }
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v0, v1, "Translation isn't supported on the current device and the user was informed, returning error to the client: %@", v2);
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_2_cold_1(void **a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *a1;
  uint64_t v3 = a2;
  id v4 = [v2 requestedSourceLocale];
  uint64_t v5 = [v4 _ltLocaleIdentifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v3, v6, "Failed to validate requested source locale of %{public}@; reporting it's invalid",
    v7);
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_24639B000, v0, v1, "Failed to pick target language, won't proceed with translation", v2, v3, v4, v5, v6);
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_4_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v0, v1, "Resolved source and target languages don't match supported locale pair, can't proceed with translation: %@", v2);
}

void __57___LTPreflightChecker_preflightConfiguration_completion___block_invoke_5_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v0, v1, "Failed to wait for languages to finish downloading: %@", v2);
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_24639B000, v0, v1, "Failed to resolve valid target locale, won't proceed with translation", v2, v3, v4, v5, v6);
}

void __62___LTPreflightChecker_resolveTargetLocaleIfNeeded_completion___block_invoke_21_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v0, v1, "Source and target locale were validated, but there's no matching supported locale pair: %@", v2);
}

@end