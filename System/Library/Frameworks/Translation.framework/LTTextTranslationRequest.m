@interface LTTextTranslationRequest
@end

@implementation LTTextTranslationRequest

void __54___LTTextTranslationRequest__paragraphRequestForText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a2;
  v8 = objc_msgSend(NSString, "stringWithFormat:", @"%zd", *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  v9 = [*(id *)(a1 + 32) string];
  v10 = objc_msgSend(v9, "substringWithRange:", a3, a4);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v11 = [*(id *)(a1 + 40) ignoringAttributes];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    LOBYTE(v15) = 1;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v17 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];

        uint64_t v15 = (v17 == 0) & v15;
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v13);
  }
  else
  {
    uint64_t v15 = 1;
  }

  v18 = [[_LTTranslationRange alloc] initWithIdentifier:v8 text:v10 shouldTranslate:v15];
  [*(id *)(a1 + 48) addObject:v18];
  v19 = *(void **)(a1 + 40);
  v20 = [*(id *)(a1 + 56) uniqueID];
  [v19 _saveAttributes:v7 forRequestUniqueID:v20 alignmentIdentifier:v8];

  ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
}

void __63___LTTextTranslationRequest__startTranslationWithService_done___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = _LTOSLogTranslationEngine();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_24639B000, v8, OS_LOG_TYPE_INFO, "Received paragraph translation result", v9, 2u);
    }
    [WeakRetained _handleParagraphResponse:v5 error:v6];
  }
}

id __59___LTTextTranslationRequest__constructFinalParagraphResult__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 objectForKeyedSubscript:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addAlignmentAttributesToResult:v5 requestIdentifier:v4];

  return v5;
}

@end