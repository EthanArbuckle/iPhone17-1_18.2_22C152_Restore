@interface LTTranslationSession
@end

@implementation LTTranslationSession

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) service];

  if (v2)
  {
    v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2;
    v9[3] = &unk_2651DC730;
    uint64_t v5 = *(void *)(a1 + 32);
    id v10 = *(id *)(a1 + 40);
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_4;
    v6[3] = &unk_2651DC780;
    objc_copyWeak(&v8, &location);
    id v7 = *(id *)(a1 + 40);
    +[_LTTranslator _getTextServiceProxyWithDelegate:v5 useDedicatedTextMachPort:v4 errorHandler:v9 block:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _LTOSLogXPC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_cold_1();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setService:v5];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = [v8 service];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_5;
  v10[3] = &unk_2651DC758;
  objc_copyWeak(&v12, (id *)(a1 + 40));
  id v11 = *(id *)(a1 + 32);
  [v9 configInfoForLocale:0 otherLocale:0 completion:v10];

  objc_destroyWeak(&v12);
}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"RateLimitingMaximumPageLoadRequests"];
  uint64_t v5 = [v4 unsignedIntValue];

  id v6 = [v3 objectForKeyedSubscript:@"RateLimitingMaximumDynamicContentRequests"];

  uint64_t v7 = [v6 unsignedIntValue];
  id v8 = [[_LTRateLimiter alloc] initWithMaximumPageLoadRequest:v5 maximumDynamicContentRequests:v7];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setRateLimiter:v8];

  id v10 = objc_loadWeakRetained((id *)(a1 + 40));
  id v11 = [v10 translationQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_3;
  block[3] = &unk_2651DC200;
  id v13 = *(id *)(a1 + 32);
  dispatch_async(v11, block);
}

uint64_t __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_2(a1, v4);
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v5 = (id *)*(id *)(a1 + 32);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = [*(id *)(*((void *)&v55 + 1) + 8 * i) completionHandler];
          ((void (**)(void, void, id))v9)[2](v9, 0, v3);
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v63 count:16];
      }
      while (v6);
    }
  }
  else
  {
    id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v5 = (id *)WeakRetained;
    if (WeakRetained)
    {
      dispatch_assert_queue_V2(WeakRetained[10]);
      id v11 = v5[9];
      if (v11
        && (id v12 = (void **)(a1 + 32),
            (objc_msgSend(v11, "allowedForRequests:", objc_msgSend(*(id *)(a1 + 32), "count")) & 1) == 0))
      {
        v33 = _LTOSLogXPC();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_1(v12, v33);
        }
        v34 = (void *)MEMORY[0x263F087E8];
        v35 = [MEMORY[0x263F086E0] mainBundle];
        v36 = [v35 localizedStringForKey:@"RATE_LIMIT_EXCEEDED_ERROR_DESCRIPTION" value:&stru_26FAADE68 table:0];
        objc_msgSend(v34, "lt_errorWithCode:description:userInfo:", 15, v36, 0);
        id v32 = (id)objc_claimAutoreleasedReturnValue();

        long long v53 = 0u;
        long long v54 = 0u;
        long long v52 = 0u;
        long long v51 = 0u;
        id v26 = *v12;
        uint64_t v37 = [v26 countByEnumeratingWithState:&v51 objects:v62 count:16];
        if (v37)
        {
          uint64_t v38 = *(void *)v52;
          do
          {
            for (uint64_t j = 0; j != v37; ++j)
            {
              if (*(void *)v52 != v38) {
                objc_enumerationMutation(v26);
              }
              v40 = [*(id *)(*((void *)&v51 + 1) + 8 * j) completionHandler];
              ((void (**)(void, void, id))v40)[2](v40, 0, v32);
            }
            uint64_t v37 = [v26 countByEnumeratingWithState:&v51 objects:v62 count:16];
          }
          while (v37);
        }
      }
      else
      {
        from = (id *)(a1 + 40);
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v13 = *(id *)(a1 + 32);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v61 count:16];
        if (v14)
        {
          uint64_t v15 = *(void *)v48;
          do
          {
            for (uint64_t k = 0; k != v14; ++k)
            {
              if (*(void *)v48 != v15) {
                objc_enumerationMutation(v13);
              }
              v17 = *(void **)(*((void *)&v47 + 1) + 8 * k);
              id v18 = v5[1];
              v19 = objc_msgSend(v17, "uniqueID", from);
              [v18 setObject:v17 forKeyedSubscript:v19];
            }
            uint64_t v14 = [v13 countByEnumeratingWithState:&v47 objects:v61 count:16];
          }
          while (v14);
        }

        v20 = [*(id *)(a1 + 32) _ltCompactMap:&__block_literal_global_13];
        v21 = _LTOSLogXPC();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = *(void **)(a1 + 32);
          v23 = v21;
          uint64_t v24 = [v22 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v60 = v24;
          _os_log_impl(&dword_24639B000, v23, OS_LOG_TYPE_INFO, "Session sending %zd requests", buf, 0xCu);
        }
        v25 = objc_msgSend(*(id *)(a1 + 32), "firstObject", from);
        id v26 = [v25 requestContext];

        v27 = [v5[3] UUIDString];
        [v26 setSessionID:v27];

        [v26 setLogIdentifier:v5[6]];
        if (!v5[2])
        {
          [v26 setSourceURL:v5[5]];
          v28 = objc_alloc_init(_LTSafariLatencyLoggingRequest);
          v29 = [v26 localePair];
          [(_LTSafariLatencyLoggingRequest *)v28 setLocalePair:v29];

          id v30 = v5[2];
          v5[2] = v28;
        }
        v31 = [v5 service];
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_19;
        v43[3] = &unk_2651DC818;
        objc_copyWeak(&v46, froma);
        id v32 = v20;
        id v44 = v32;
        id v45 = *(id *)(a1 + 32);
        [v31 translateParagraphs:v32 withContext:v26 completion:v43];

        objc_destroyWeak(&v46);
      }
    }
  }
}

uint64_t __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_16(uint64_t a1, void *a2)
{
  return [a2 translationParagraph];
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_19(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained[10];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2;
    v7[3] = &unk_2651DC7F0;
    id v8 = v3;
    id v9 = a1[4];
    id v10 = a1[5];
    id v11 = v5;
    dispatch_async(v6, v7);
  }
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v2 = (void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = _LTOSLogTranslationEngine();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2_cold_1(a1, v5);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = *(id *)(a1 + 48);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "completionHandler", (void)v18);

          if (v12)
          {
            id v13 = [v11 completionHandler];
            v13[2](v13, 0, *v2);
          }
          uint64_t v14 = *(void **)(*(void *)(a1 + 56) + 8);
          uint64_t v15 = [v11 uniqueID];
          [v14 removeObjectForKey:v15];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }
      while (v8);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v16 = *(void **)(a1 + 40);
    v17 = v5;
    *(_DWORD *)buf = 134217984;
    uint64_t v23 = [v16 count];
    _os_log_impl(&dword_24639B000, v17, OS_LOG_TYPE_INFO, "Finished sending %zu paragraphs", buf, 0xCu);
  }
}

void __42___LTTranslationSession_cancelPendingWork__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v2 = _LTOSLogXPC();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __42___LTTranslationSession_cancelPendingWork__block_invoke_cold_1(v2);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v5 = [WeakRetained sessionID];
      id v6 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 138543362;
        uint64_t v9 = v5;
        _os_log_impl(&dword_24639B000, v6, OS_LOG_TYPE_INFO, "Client requested to cancel pending work for sessionID %{public}@", (uint8_t *)&v8, 0xCu);
      }
      uint64_t v7 = [v4 service];
      [v7 attemptToCancelRequestsWithSessionID:v5];
    }
  }
}

void __41___LTTranslationSession_provideFeedback___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = _LTOSLogXPC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __41___LTTranslationSession_provideFeedback___block_invoke_cold_1();
    }
  }
  else
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      id v6 = _LTOSLogUserFeedback();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_24639B000, v6, OS_LOG_TYPE_DEFAULT, "Session sending feedback", v10, 2u);
      }
      uint64_t v7 = [*(id *)(a1 + 32) localePair];

      if (!v7)
      {
        int v8 = [WeakRetained[2] localePair];
        [*(id *)(a1 + 32) setLocalePair:v8];
      }
      uint64_t v9 = [WeakRetained[3] UUIDString];
      [*(id *)(a1 + 32) setSessionID:v9];

      [WeakRetained[7] log:*(void *)(a1 + 32)];
    }
  }
}

void __51___LTTranslationSession_markFirstParagraphComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[2] markFirstParagraphComplete];
    id WeakRetained = v2;
  }
}

void __41___LTTranslationSession_markProgressDone__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[2] markProgressDone];
    id WeakRetained = v2;
  }
}

void __41___LTTranslationSession_markPageComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[9] markPageLoaded];
    [v2[2] markPageComplete];
    [v2[7] log:v2[2]];
    id WeakRetained = v2;
  }
}

void __59___LTTranslationSession_paragraphTranslation_result_error___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    [WeakRetained[2] markResponse];
    id v3 = [v7[1] objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v4 = v3;
    if (v3)
    {
      uint64_t v5 = [v3 completionHandler];

      if (v5)
      {
        id v6 = [v4 completionHandler];
        v6[2](v6, *(void *)(a1 + 40), *(void *)(a1 + 48));
      }
      [v7[1] removeObjectForKey:*(void *)(a1 + 32)];
    }

    id WeakRetained = v7;
  }
}

void __75___LTTranslationSession__ensureServiceConnection_useDedicatedTextMachPort___block_invoke_2_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v0, v1, "Error ensuring service connection %@", v2);
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_1(void **a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *a1;
  uint64_t v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v3, v4, "Translation rate limit reached, ignoring %zu requests", v5);
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_cold_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v3, v4, "Translation XPC connection failure, ignoring %zu requests", v5);
}

void __60___LTTranslationSession_translate_useDedicatedTextMachPort___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 40);
  uint64_t v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_1();
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  _os_log_error_impl(&dword_24639B000, v3, OS_LOG_TYPE_ERROR, "Error sending %zd paragraphs %{public}@", v5, 0x16u);
}

void __42___LTTranslationSession_cancelPendingWork__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24639B000, log, OS_LOG_TYPE_ERROR, "Failed to make XPC connection, can't cancel pending work", v1, 2u);
}

void __41___LTTranslationSession_provideFeedback___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_0(&dword_24639B000, v0, v1, "Translation XPC connection failure, abort sending session feedback: %@", v2);
}

@end