@interface LTTextSession
@end

@implementation LTTextSession

uint64_t __38___LTTextSession_synchronizationQueue__block_invoke()
{
  synchronizationQueue_synchronizationQueue = (uint64_t)dispatch_queue_create("com.apple.translation.TextSession", 0);

  return MEMORY[0x270F9A758]();
}

void __52___LTTextSession_translateString_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void __24___LTTextSession_cancel__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!*((unsigned char *)WeakRetained + 32)) {
      [WeakRetained _invocationCancelledSELFLogging];
    }
    v3 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4[0] = 0;
      _os_log_impl(&dword_24639B000, v3, OS_LOG_TYPE_INFO, "Attempting to cancel pending work from session", (uint8_t *)v4, 2u);
    }
    *((unsigned char *)v2 + 32) = 1;
    [v2[2] cancelPendingWork];
    [v2[5] removeAllObjects];
  }
}

void __34___LTTextSession__prepareRequest___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _invocationStartedSELFLogging:*(void *)(a1 + 32)];
    id v5 = (void *)v4[5];
    id v6 = [*(id *)(a1 + 32) logIdentifier];
    [v5 addObject:v6];

    if (*((unsigned char *)v4 + 32))
    {
      v7 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __34___LTTextSession__prepareRequest___block_invoke_cold_1(v7);
      }
      v8 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:22 userInfo:0];
      [*(id *)(a1 + 32) didReceiveError:v8 forInput:0];
      v9 = (void *)v4[5];
      v10 = [*(id *)(a1 + 32) logIdentifier];
      [v9 removeObject:v10];
    }
    else
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __34___LTTextSession__prepareRequest___block_invoke_11;
      v13[3] = &unk_2651DC318;
      objc_copyWeak(&v17, v2);
      id v14 = *(id *)(a1 + 40);
      id v11 = *(id *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 48);
      id v15 = v11;
      uint64_t v16 = v12;
      [v4 _supportedLocalePairsWithCompletionHandler:v13];

      objc_destroyWeak(&v17);
    }
  }
}

void __34___LTTextSession__prepareRequest___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    id v5 = [*(id *)(a1 + 40) batch];
    char v6 = objc_msgSend(v5, "lt_hasObjectPassingTest:", &__block_literal_global_14);

    if (v6 & 1) != 0 || ([*(id *)(a1 + 40) isForDownloadRequest])
    {
      v7 = [[_LTPreflightConfiguration alloc] initWithSession:*(void *)(a1 + 48) request:*(void *)(a1 + 40) supportedLocalePairs:v3];
      v8 = [*(id *)(a1 + 40) logIdentifier];
      [(_LTPreflightConfiguration *)v7 setSelfLoggingID:v8];

      v9 = [WeakRetained preflightChecker];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __34___LTTextSession__prepareRequest___block_invoke_16;
      v13[3] = &unk_2651DC2F0;
      id v14 = *(id *)(a1 + 32);
      objc_copyWeak(&v16, (id *)(a1 + 56));
      id v15 = *(id *)(a1 + 40);
      [v9 preflightConfiguration:v7 completion:v13];

      objc_destroyWeak(&v16);
      v10 = v14;
    }
    else
    {
      id v11 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __34___LTTextSession__prepareRequest___block_invoke_11_cold_1(v11);
      }
      v7 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:3 userInfo:0];
      [*(id *)(a1 + 40) didReceiveError:v7 forInput:0];
      uint64_t v12 = (void *)WeakRetained[5];
      v10 = [*(id *)(a1 + 40) logIdentifier];
      [v12 removeObject:v10];
    }
  }
}

BOOL __34___LTTextSession__prepareRequest___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 sourceText];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

void __34___LTTextSession__prepareRequest___block_invoke_16(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34___LTTextSession__prepareRequest___block_invoke_2_17;
  v10[3] = &unk_2651DC2C8;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v11 = v6;
  id v12 = *(id *)(a1 + 40);
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);

  objc_destroyWeak(&v14);
}

void __34___LTTextSession__prepareRequest___block_invoke_2_17(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = _LTOSLogTextAPI();
    id v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __34___LTTextSession__prepareRequest___block_invoke_2_17_cold_2(a1 + 32, v5, v6, v7, v8, v9, v10, v11);
      }
      [*(id *)(a1 + 40) didReceiveError:*(void *)(a1 + 32) forInput:0];
      id v12 = (void *)WeakRetained[5];
      id v13 = [*(id *)(a1 + 40) logIdentifier];
      [v12 removeObject:v13];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __34___LTTextSession__prepareRequest___block_invoke_2_17_cold_1(a1, v5);
      }
      id v14 = [*(id *)(a1 + 48) resolvedSourceLocale];
      [*(id *)(a1 + 40) setResolvedSourceLocale:v14];

      id v15 = [*(id *)(a1 + 48) resolvedTargetLocale];
      [*(id *)(a1 + 40) setResolvedTargetLocale:v15];

      [WeakRetained _beginBatchRequest:*(void *)(a1 + 40)];
    }
  }
}

void __37___LTTextSession__beginBatchRequest___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (v8)
    {
      uint64_t v10 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __37___LTTextSession__beginBatchRequest___block_invoke_cold_1((uint64_t)v8, a3, v10);
      }
      [*(id *)(a1 + 40) didReceiveError:v8 forInput:0];
      uint64_t v11 = (void *)WeakRetained[5];
      id v12 = [*(id *)(a1 + 40) logIdentifier];
      [v11 removeObject:v12];
    }
    else
    {
      id v12 = [v7 targetText];
      id v13 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = v13;
        int v17 = 134218240;
        uint64_t v18 = a3;
        __int16 v19 = 2048;
        uint64_t v20 = [v12 length];
        _os_log_impl(&dword_24639B000, v14, OS_LOG_TYPE_INFO, "Received result for item at index %zu; targetText length: %zu",
          (uint8_t *)&v17,
          0x16u);
      }
      id v15 = [*(id *)(a1 + 40) batch];
      id v16 = [v15 objectAtIndexedSubscript:a3];

      [*(id *)(a1 + 40) didTranslateInput:v16 withResult:v7];
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __37___LTTextSession__beginBatchRequest___block_invoke_21(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      int v7 = 134217984;
      uint64_t v8 = v4;
      _os_log_impl(&dword_24639B000, v3, OS_LOG_TYPE_INFO, "Finished translating all %zu inputs", (uint8_t *)&v7, 0xCu);
    }
    [*(id *)(a1 + 32) didComplete];
    id v5 = (void *)WeakRetained[5];
    uint64_t v6 = [*(id *)(a1 + 32) logIdentifier];
    [v5 removeObject:v6];
  }
}

void __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    int v7 = [v5 sourceText];
    int v8 = objc_msgSend(v7, "lt_isWhiteSpaceOnlyString");

    if (v8)
    {
      uint64_t v9 = [_LTTextResult alloc];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [v5 sourceText];
      id v12 = [v5 sourceText];
      id v13 = [v5 clientIdentifier];
      id v14 = [(_LTTextResult *)v9 initWithLocalePair:v10 sourceText:v11 targetText:v12 clientIdentifier:v13];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v15 = [MEMORY[0x263F08C38] UUID];
      id v16 = [_LTMultiParagraphTranslationRequest alloc];
      int v17 = [v5 sourceText];
      uint64_t v18 = *(void *)(a1 + 32);
      uint64_t v23 = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      v25 = __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke_2;
      v26 = &unk_2651DC368;
      objc_copyWeak(v31, (id *)(a1 + 56));
      id v27 = *(id *)(a1 + 32);
      id v28 = v5;
      id v30 = *(id *)(a1 + 48);
      v31[1] = a3;
      id v19 = v15;
      id v29 = v19;
      uint64_t v20 = [(_LTMultiParagraphTranslationRequest *)v16 initWithText:v17 localePair:v18 completionHandler:&v23];

      uint64_t v21 = *(void **)(a1 + 40);
      v22 = [(_LTMultiParagraphTranslationRequest *)v20 paragraphRequests];
      [v21 addObjectsFromArray:v22];

      [WeakRetained[6] setObject:v20 forKeyedSubscript:v19];
      objc_destroyWeak(v31);
    }
  }
}

void __61___LTTextSession_translateRequest_forSession_perItemHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v14)
    {
      int v7 = [v14 translatedText];
      int v8 = [v7 string];

      uint64_t v9 = [_LTTextResult alloc];
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = [*(id *)(a1 + 40) sourceText];
      id v12 = [*(id *)(a1 + 40) clientIdentifier];
      id v13 = [(_LTTextResult *)v9 initWithLocalePair:v10 sourceText:v11 targetText:v8 clientIdentifier:v12];
    }
    else
    {
      id v13 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [WeakRetained _didFinishMultiParagraphRequestWithUUID:*(void *)(a1 + 48)];
  }
}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v3 = _LTOSLogTextAPI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_24639B000, v3, OS_LOG_TYPE_INFO, "Preflight checker got to step that needs user intervention, asking delegate to respond", v4, 2u);
    }
    [WeakRetained _callDelegateOrGiveError:*(void *)(a1 + 32) forConfiguration:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  }
}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_29(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
    if (a2)
    {
      id v5 = _LTOSLogTextAPI();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_24639B000, v5, OS_LOG_TYPE_INFO, "All assets are already installed, proceeding with translation", buf, 2u);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v6 = [MEMORY[0x263F087E8] errorWithDomain:@"TranslationErrorDomain" code:20 userInfo:0];
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_30;
      v8[3] = &unk_2651DC3B8;
      uint64_t v7 = *(void *)(a1 + 40);
      id v9 = *(id *)(a1 + 48);
      [WeakRetained _callDelegateOrGiveError:v6 forConfiguration:v7 completion:v8];
    }
  }
}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = _LTOSLogTextAPI();
  int v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_30_cold_1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_DEFAULT, "Finished waiting on download sheet, continuing with translation", v15, 2u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke(id *a1)
{
  v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = (void *)*((void *)WeakRetained + 3);
    id v6 = [a1[4] resolvedSourceLocale];
    uint64_t v7 = [a1[4] resolvedTargetLocale];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_2;
    v8[3] = &unk_2651DC430;
    id v9 = a1[5];
    objc_copyWeak(&v12, v2);
    id v10 = a1[4];
    id v11 = a1[6];
    [v5 statusFromLanguage:v6 toLanguage:v7 completion:v8];

    objc_destroyWeak(&v12);
  }
}

void __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_3;
  v5[3] = &unk_2651DC408;
  objc_copyWeak(v8, (id *)(a1 + 56));
  v8[1] = a2;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(v4, v5);

  objc_destroyWeak(v8);
}

void __66___LTTextSession__checkDownloadStatusForConfiguration_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(void *)(a1 + 56) == 1) {
      [*(id *)(a1 + 32) isForDownloadApprovalOnly];
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

void __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_2651DC458;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __61___LTTextSession__supportedLocalePairsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __51___LTTextSession__translateRequest_perItemHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51___LTTextSession__translateRequest_perItemHandler___block_invoke_2;
  v12[3] = &unk_2651DC4A8;
  id v9 = *(NSObject **)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = a3;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(v9, v12);
}

uint64_t __51___LTTextSession__translateRequest_perItemHandler___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[7], a1[5]);
}

void __58___LTTextSession__didFinishMultiParagraphRequestWithUUID___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[6] setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void __34___LTTextSession__prepareRequest___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Refusing new translation request because text session has already been cancelled", v1, 2u);
}

void __34___LTTextSession__prepareRequest___block_invoke_11_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Unable to translate since there's no content to translate", v1, 2u);
}

void __34___LTTextSession__prepareRequest___block_invoke_2_17_cold_1(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(a1 + 48);
  uint64_t v4 = a2;
  id v5 = [v3 resolvedSourceLocale];
  id v6 = [v5 _ltLocaleIdentifier];
  id v7 = [*(id *)(a1 + 48) resolvedTargetLocale];
  id v8 = [v7 _ltLocaleIdentifier];
  int v9 = 138543618;
  id v10 = v6;
  __int16 v11 = 2114;
  id v12 = v8;
  _os_log_debug_impl(&dword_24639B000, v4, OS_LOG_TYPE_DEBUG, "Resolved preflight information, using source locale %{public}@, target locale %{public}@", (uint8_t *)&v9, 0x16u);
}

void __34___LTTextSession__prepareRequest___block_invoke_2_17_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __37___LTTextSession__beginBatchRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Failed to translate input %zu; returning error: %@",
    (uint8_t *)&v3,
    0x16u);
}

void __88___LTTextSession_preflightChecker_continueCheckingFromStep_forConfiguration_completion___block_invoke_30_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end