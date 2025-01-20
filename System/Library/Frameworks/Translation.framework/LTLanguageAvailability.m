@interface LTLanguageAvailability
@end

@implementation LTLanguageAvailability

void __31___LTLanguageAvailability_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __31___LTLanguageAvailability_init__block_invoke_cold_1(v5, v3);
    }
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__0;
    v17 = __Block_byref_object_dispose__0;
    id v18 = 0;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v9 = __31___LTLanguageAvailability_init__block_invoke_2;
    v10 = &unk_2651DBA98;
    v12 = &v13;
    v11 = WeakRetained;
    v6 = v8;
    os_unfair_lock_lock(WeakRetained + 2);
    v9((uint64_t)v6);

    os_unfair_lock_unlock(WeakRetained + 2);
    uint64_t v7 = v14[5];
    if (v7) {
      (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);
    }

    _Block_object_dispose(&v13, 8);
  }
}

void __31___LTLanguageAvailability_init__block_invoke_2(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

void __60___LTLanguageAvailability_supportedLanguagesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = [WeakRetained _uniqueLocalesFromSupportedPairs:v7];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

void __68___LTLanguageAvailability_statusFromLanguage_toLanguage_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_24639B000, v5, OS_LOG_TYPE_INFO, "Got an error when checking status so returning unsupported: %@", (uint8_t *)&v7, 0xCu);
    }
    v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      v14[0] = *(void *)(a1 + 32);
      uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    }
    else
    {
      uint64_t v5 = (void *)MEMORY[0x263EFFA68];
    }
    v6 = [[_LTPreflightConfiguration alloc] initWithSourceStrings:v5 supportedLocalePairs:v3];
    [(_LTPreflightConfiguration *)v6 setRequestedSourceLocale:*(void *)(a1 + 40)];
    [(_LTPreflightConfiguration *)v6 setRequestedTargetLocale:*(void *)(a1 + 48)];
    int v7 = (void *)WeakRetained[6];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    void v8[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2;
    v8[3] = &unk_2651DBBB0;
    objc_copyWeak(&v13, (id *)(a1 + 64));
    id v12 = *(id *)(a1 + 56);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = v3;
    [v7 preflightConfiguration:v6 completion:v8];

    objc_destroyWeak(&v13);
  }
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:11 userInfo:0];
      id v9 = [v6 domain];
      id v10 = [v8 domain];
      if ([v9 isEqualToString:v10])
      {
        uint64_t v11 = [v6 code];
        uint64_t v12 = [v8 code];

        if (v11 == v12)
        {
          id v13 = _LTOSLogTextAPI();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_24639B000, v13, OS_LOG_TYPE_INFO, "Preflight checks determined the language pairing isn't supported; returning unsupported rather than an error",
              buf,
              2u);
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
          goto LABEL_35;
        }
      }
      else
      {
      }
      v24 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_2((uint64_t)v6, v24);
      }
      goto LABEL_22;
    }
    if ([v5 nextStep] != 1)
    {
      id v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:21 userInfo:0];
      v25 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_1((uint64_t)v8, v25);
      }
LABEL_22:
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_35:

      goto LABEL_36;
    }
    id v8 = [v5 resolvedSourceLocale];
    v14 = [v5 resolvedTargetLocale];
    uint64_t v15 = _LTOSLogTextAPI();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (!v8 || !v14)
    {
      if (v16)
      {
        v26 = *(void **)(a1 + 32);
        v27 = v15;
        v28 = [v26 _ltLocaleIdentifier];
        v29 = [*(id *)(a1 + 40) _ltLocaleIdentifier];
        *(_DWORD *)buf = 138543618;
        v43 = v28;
        __int16 v44 = 2114;
        v45 = v29;
        _os_log_impl(&dword_24639B000, v27, OS_LOG_TYPE_INFO, "Unable to determine language status since source ('%{public}@') or target ('%{public}@') language isn't supported", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_34;
    }
    if (v16)
    {
      v17 = v15;
      id v18 = [v8 _ltLocaleIdentifier];
      v19 = [v14 _ltLocaleIdentifier];
      *(_DWORD *)buf = 138543618;
      v43 = v18;
      __int16 v44 = 2114;
      v45 = v19;
      _os_log_impl(&dword_24639B000, v17, OS_LOG_TYPE_INFO, "Checking language status for validated locales of source '%{public}@' and target '%{public}@'", buf, 0x16u);
    }
    v20 = *(void **)(a1 + 48);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_8;
    v39[3] = &unk_2651DBB38;
    id v21 = v8;
    id v40 = v21;
    id v22 = v14;
    id v41 = v22;
    if (objc_msgSend(v20, "lt_hasObjectPassingTest:", v39))
    {
      if (![WeakRetained allowOnlineTranslation] || !_LTIsInternalInstall())
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        v34[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_10;
        v34[3] = &unk_2651DBB88;
        objc_copyWeak(&v38, (id *)(a1 + 64));
        id v35 = v21;
        id v36 = v22;
        id v37 = *(id *)(a1 + 56);
        [WeakRetained _installedLocalesWithCompletion:v34];

        objc_destroyWeak(&v38);
        goto LABEL_33;
      }
      v23 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24639B000, v23, OS_LOG_TYPE_INFO, "Not checking installed locales since online translation is allowed, just reporting the pairing is installed", buf, 2u);
      }
    }
    else
    {
      v30 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = v30;
        v32 = [v21 _ltLocaleIdentifier];
        v33 = [v22 _ltLocaleIdentifier];
        *(_DWORD *)buf = 138543618;
        v43 = v32;
        __int16 v44 = 2114;
        v45 = v33;
        _os_log_impl(&dword_24639B000, v31, OS_LOG_TYPE_INFO, "Returning unsupported language pairing since there's no supported pairing from '%{public}@' to '%{public}@'", buf, 0x16u);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_33:

LABEL_34:
    goto LABEL_35;
  }
LABEL_36:
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 sourceLocale];
  if ([v4 _ltEqual:*(void *)(a1 + 32)])
  {
    id v5 = [v3 targetLocale];
    uint64_t v6 = [v5 _ltEqual:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_11;
    v39[3] = &unk_2651DBB60;
    id v40 = *(id *)(a1 + 32);
    int v8 = objc_msgSend(v5, "lt_hasObjectPassingTest:", v39);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_3;
    v37[3] = &unk_2651DBB60;
    id v38 = *(id *)(a1 + 40);
    int v9 = objc_msgSend(v5, "lt_hasObjectPassingTest:", v37);
    int v10 = v9;
    if (v8 && v9)
    {
      uint64_t v11 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = *(void **)(a1 + 32);
        id v13 = v11;
        v14 = [v12 _ltLocaleIdentifier];
        uint64_t v15 = [*(id *)(a1 + 40) _ltLocaleIdentifier];
        *(_DWORD *)buf = 138543618;
        v42 = v14;
        __int16 v43 = 2114;
        __int16 v44 = v15;
        _os_log_impl(&dword_24639B000, v13, OS_LOG_TYPE_INFO, "Both source ('%{public}@') and target ('%{public}@') languages are installed", buf, 0x16u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_13;
      v35[3] = &unk_2651DBB60;
      id v36 = *(id *)(a1 + 32);
      int v16 = objc_msgSend(v6, "lt_hasObjectPassingTest:", v35);
      uint64_t v30 = MEMORY[0x263EF8330];
      uint64_t v31 = 3221225472;
      v32 = __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_14;
      v33 = &unk_2651DBB60;
      id v34 = *(id *)(a1 + 40);
      int v17 = objc_msgSend(v6, "lt_hasObjectPassingTest:", &v30);
      int v18 = v16 | v8;
      v19 = _LTOSLogTextAPI();
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v18 == 1 && v17 | v10)
      {
        if (v20)
        {
          id v21 = *(void **)(a1 + 32);
          id v22 = v19;
          v23 = objc_msgSend(v21, "_ltLocaleIdentifier", v30, v31, v32, v33);
          v24 = [*(id *)(a1 + 40) _ltLocaleIdentifier];
          *(_DWORD *)buf = 138543618;
          v42 = v23;
          __int16 v43 = 2114;
          __int16 v44 = v24;
          _os_log_impl(&dword_24639B000, v22, OS_LOG_TYPE_INFO, "Both source ('%{public}@') and target ('%{public}@') languages are at least downloading, saying this pairing is downloading", buf, 0x16u);
        }
        v25 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      }
      else
      {
        if (v20)
        {
          v26 = *(void **)(a1 + 32);
          v27 = v19;
          v28 = objc_msgSend(v26, "_ltLocaleIdentifier", v30, v31, v32, v33);
          v29 = [*(id *)(a1 + 40) _ltLocaleIdentifier];
          *(_DWORD *)buf = 138543618;
          v42 = v28;
          __int16 v43 = 2114;
          __int16 v44 = v29;
          _os_log_impl(&dword_24639B000, v27, OS_LOG_TYPE_INFO, "Either source ('%{public}@') and/or target ('%{public}@') language isn't installed or downloading, saying this pairing is supported but not installed or downloading", buf, 0x16u);
        }
        v25 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
      }
      v25();
    }
  }
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_11(uint64_t a1, void *a2)
{
  return [a2 _ltEqual:*(void *)(a1 + 32)];
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 _ltEqual:*(void *)(a1 + 32)];
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 _ltEqual:*(void *)(a1 + 32)];
}

uint64_t __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_14(uint64_t a1, void *a2)
{
  return [a2 _ltEqual:*(void *)(a1 + 32)];
}

void __45___LTLanguageAvailability_setLocaleProvider___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

uint64_t __46___LTLanguageAvailability__updateCachedValues__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));

  return MEMORY[0x270F9A758]();
}

void __46___LTLanguageAvailability__updateCachedValues__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    int v8 = __46___LTLanguageAvailability__updateCachedValues__block_invoke_3;
    int v9 = &unk_2651DBC28;
    int v10 = WeakRetained;
    objc_copyWeak(&v12, (id *)(a1 + 40));
    id v11 = v3;
    id v6 = v7;
    os_unfair_lock_lock(v5 + 2);
    v8((uint64_t)v6);

    os_unfair_lock_unlock(v5 + 2);
    [(os_unfair_lock_s *)v5 _didUpdateCachedValues];

    objc_destroyWeak(&v12);
  }
}

void __46___LTLanguageAvailability__updateCachedValues__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained == v3)
  {
    *(void *)(*(void *)(a1 + 32) + 16) = [*(id *)(a1 + 40) copy];
    MEMORY[0x270F9A758]();
  }
}

void __49___LTLanguageAvailability__didUpdateCachedValues__block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  v2 = _Block_copy(*(const void **)(a1[4] + 24));
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = 0;
}

void __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke(uint64_t a1)
{
}

void __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = _Block_copy(*((const void **)WeakRetained + 3));
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_3;
    aBlock[3] = &unk_2651DBCA0;
    objc_copyWeak(&v12, v2);
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v6 = v5;
    int v7 = _Block_copy(aBlock);
    int v8 = (void *)v4[3];
    v4[3] = v7;

    objc_destroyWeak(&v12);
  }
}

void __63___LTLanguageAvailability__supportedLocalePairsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 40) cachedStatus];

  return MEMORY[0x270F9A758]();
}

void __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = _Block_copy(*((const void **)WeakRetained + 4));
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_3;
    aBlock[3] = &unk_2651DBCA0;
    objc_copyWeak(&v12, v2);
    id v10 = v5;
    id v11 = *(id *)(a1 + 32);
    id v6 = v5;
    int v7 = _Block_copy(aBlock);
    int v8 = (void *)v4[4];
    v4[4] = v7;

    objc_destroyWeak(&v12);
  }
}

void __61___LTLanguageAvailability__cachedLocaleStatusWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));

  return MEMORY[0x270F9A758]();
}

void __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v17 = 0;
    int v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    id v12 = __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_3;
    id v13 = &unk_2651DBCF0;
    v14 = WeakRetained;
    uint64_t v15 = &v17;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    int v9 = v11;
    os_unfair_lock_lock(v8 + 2);
    v12((uint64_t)v9);

    os_unfair_lock_unlock(v8 + 2);
    uint64_t v10 = *(void *)(a1 + 32);
    if (*((unsigned char *)v18 + 24)) {
      [(os_unfair_lock_s *)v8 _installedLocalesWithCompletion:v10];
    }
    else {
      (*(void (**)(void, id, id))(v10 + 16))(*(void *)(a1 + 32), v5, v6);
    }
    objc_destroyWeak(&v16);
    _Block_object_dispose(&v17, 8);
  }
}

void __59___LTLanguageAvailability__installedLocalesWithCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 64));
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = WeakRetained != v2;
}

uint64_t __76___LTLanguageAvailability_localeProviderSupportedLocalePairsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67___LTLanguageAvailability_currentlyInstalledLocalesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = [MEMORY[0x263EFF980] array];
    id v6 = [MEMORY[0x263EFF980] array];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v8) {
      goto LABEL_14;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "status", (void)v19);
        if (v13 == 1)
        {
          v14 = [v12 locale];
          uint64_t v15 = v6;
        }
        else
        {
          if (v13 != 2) {
            continue;
          }
          v14 = [v12 locale];
          uint64_t v15 = v5;
        }
        [v15 addObject:v14];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (!v9)
      {
LABEL_14:

        uint64_t v16 = *(void *)(a1 + 32);
        uint64_t v17 = (void *)[v5 copy];
        int v18 = (void *)[v6 copy];
        (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v18);

        break;
      }
    }
  }
}

void __31___LTLanguageAvailability_init__block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 count];
  _os_log_debug_impl(&dword_24639B000, v3, OS_LOG_TYPE_DEBUG, "Got updated list of %zu language statuses", (uint8_t *)&v4, 0xCu);
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24639B000, a2, OS_LOG_TYPE_ERROR, "Unexpected next step after preflight configuration; assuming LID was unclear, but we can't present UI from availabil"
    "ity checking, so returning an error: %@",
    (uint8_t *)&v2,
    0xCu);
}

void __97___LTLanguageAvailability__checkStatusWithSourceLanguage_targetLanguage_sourceSample_completion___block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_24639B000, a2, OS_LOG_TYPE_ERROR, "Encountered an error doing preflight checking for checking language status, returning the error: %@", (uint8_t *)&v2, 0xCu);
}

@end