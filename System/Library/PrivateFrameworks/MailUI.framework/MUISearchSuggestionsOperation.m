@interface MUISearchSuggestionsOperation
@end

@implementation MUISearchSuggestionsOperation

void __40___MUISearchSuggestionsOperation_cancel__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v1 = *(void **)(a1 + 32);
  if (v1) {
    v1 = (void *)v1[6];
  }
  v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6), "second", (void)v8);
        [v7 cancel];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 56);
    uint64_t v6 = signpostLog();
    v7 = v6;
    if (v5)
    {
      if (v4 == -1 || !os_signpost_enabled(v6)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      long long v8 = "com.apple.mail.search.suggestion.zkw.suggester";
    }
    else
    {
      if (v4 == -1 || !os_signpost_enabled(v6)) {
        goto LABEL_10;
      }
      *(_WORD *)buf = 0;
      long long v8 = "com.apple.mail.search.suggestion.ayt.suggester";
    }
    _os_signpost_emit_with_name_impl(&dword_1DDCDB000, v7, OS_SIGNPOST_INTERVAL_END, v4, v8, "", buf, 2u);
LABEL_10:
  }
  long long v9 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke_2;
  block[3] = &unk_1E6D135F0;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v12 = *(id *)(a1 + 40);
  id v13 = v3;
  id v10 = v3;
  dispatch_async(v9, block);

  objc_destroyWeak(&v14);
}

void __58___MUISearchSuggestionsOperation__startQueryForSuggester___block_invoke_2(void **a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  -[_MUISearchSuggestionsOperation _suggester:didCompleteWithSuggestions:]((uint64_t)WeakRetained, a1[4], a1[5]);
}

void __58___MUISearchSuggestionsOperation__asyncCompleteSuggester___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[_MUISearchSuggestionsOperation _suggester:didCompleteWithSuggestions:]((uint64_t)WeakRetained, *(void **)(a1 + 32), 0);
}

id __56___MUISearchSuggestionsOperation__runningSuggesterNames__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 first];
  id v3 = [v2 logIdentifier];

  return v3;
}

BOOL __72___MUISearchSuggestionsOperation__suggester_didCompleteWithSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 first];
  BOOL v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

@end