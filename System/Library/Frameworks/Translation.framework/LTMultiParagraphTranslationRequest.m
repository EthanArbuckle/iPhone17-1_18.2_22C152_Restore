@interface LTMultiParagraphTranslationRequest
@end

@implementation LTMultiParagraphTranslationRequest

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = [(_LTTranslationRequest *)[_LTCombinedRouteParagraphTranslationRequest alloc] initWithLocalePair:WeakRetained[1]];
    v8 = [v5 string];
    [(_LTParagraphTranslationRequest *)v7 setText:v8];

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_2;
    v9[3] = &unk_2651DBF28;
    objc_copyWeak(v11, (id *)(a1 + 48));
    id v10 = *(id *)(a1 + 32);
    v11[1] = a3;
    [(_LTParagraphTranslationRequest *)v7 setCompletionHandler:v9];
    [*(id *)(a1 + 40) addObject:v7];

    objc_destroyWeak(v11);
  }
}

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[5];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_3;
    block[3] = &unk_2651DBF00;
    id v13 = v6;
    v14 = v8;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 48);
    id v15 = v10;
    uint64_t v17 = v11;
    id v16 = v5;
    dispatch_async(v9, block);
  }
}

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_3(uint64_t a1)
{
  if (!*(void *)(a1 + 32))
  {
    id v5 = *(void **)(*(void *)(a1 + 40) + 24);
    uint64_t v6 = *(void *)(a1 + 56);
    v7 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
    [v5 setObject:v6 forKeyedSubscript:v7];

    goto LABEL_5;
  }
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    uint64_t v3 = *(void *)(a1 + 40);
    v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;

    [*(id *)(a1 + 40) _cleanUp];
LABEL_5:
    v8 = *(NSObject **)(a1 + 48);
    dispatch_group_leave(v8);
    return;
  }
  v9 = _LTOSLogTextAPI();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_24639B000, v9, OS_LOG_TYPE_INFO, "Completion was already nil-ed out since we've already called it, early returning", v10, 2u);
  }
}

void __65___LTMultiParagraphTranslationRequest__generateParagraphRequests__block_invoke_9(uint64_t a1)
{
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v11 = WeakRetained;
    dispatch_assert_queue_V2(WeakRetained[5]);
    uint64_t v2 = (void (**)(void *, _LTCombinedTranslationResult *, void))_Block_copy(v11[4]);
    if (v2)
    {
      uint64_t v3 = [v11[2] count];
      v4 = [MEMORY[0x263EFF980] array];
      if (v3)
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          dispatch_queue_t v6 = v11[3];
          v7 = [NSNumber numberWithUnsignedInteger:i];
          v8 = [v6 objectForKeyedSubscript:v7];

          if (v8) {
            [v4 addObject:v8];
          }
        }
      }
      v9 = [[_LTCombinedTranslationResult alloc] initWithParagraphResults:v4 localePair:v11[1]];
      v2[2](v2, v9, 0);
      dispatch_queue_t v10 = v11[4];
      v11[4] = 0;

      [(dispatch_queue_t *)v11 _cleanUp];
    }

    WeakRetained = v11;
  }
}

@end