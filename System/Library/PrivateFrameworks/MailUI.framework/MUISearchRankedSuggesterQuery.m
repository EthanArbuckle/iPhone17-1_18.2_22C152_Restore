@interface MUISearchRankedSuggesterQuery
- (id)_createTopHitsQuery;
- (uint64_t)initWithPhraseManager:(void *)a3 handler:(void *)a4 suggester:;
- (void)cancel;
@end

@implementation MUISearchRankedSuggesterQuery

- (uint64_t)initWithPhraseManager:(void *)a3 handler:(void *)a4 suggester:
{
  id v8 = a2;
  id v9 = a3;
  v10 = a4;
  if (a1)
  {
    v18.receiver = (id)a1;
    v18.super_class = (Class)MUISearchRankedSuggesterQuery;
    v11 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = (uint64_t)v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      uint64_t v12 = [v9 copy];
      v13 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v12;

      if (v10) {
        v14 = (void *)v10[1];
      }
      else {
        v14 = 0;
      }
      objc_storeStrong((id *)(a1 + 24), v14);
      uint64_t v15 = -[MUISearchRankedSuggesterQuery _createTopHitsQuery](a1);
      v16 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v15;
    }
  }

  return a1;
}

- (id)_createTopHitsQuery
{
  if (a1)
  {
    int v2 = [*(id *)(a1 + 8) phraseKind];
    uint64_t v3 = 10;
    if (v2 == 1) {
      uint64_t v3 = 4;
    }
    uint64_t v26 = v3;
    id v4 = *(id *)(a1 + 8);
    v5 = [v4 phrase];
    v6 = [*(id *)(a1 + 8) inputLanguages];
    v7 = objc_msgSend(v5, "ef_stringByRemovingQuotesForLanguages:", v6);

    id v23 = objc_alloc(MEMORY[0x1E4F60478]);
    id v27 = *(id *)(a1 + 8);
    uint64_t v8 = [v27 spotlightQueryStrings];
    id v9 = *(void **)(a1 + 24);
    id v24 = *(id *)(a1 + 8);
    id v22 = v9;
    v25 = [v24 inputLanguages];
    v10 = [v25 firstObject];
    id v11 = *(id *)(a1 + 8);
    uint64_t v12 = [v11 updatedSuggestion];
    uint64_t v13 = *MEMORY[0x1E4F600B0];
    id v14 = *(id *)(a1 + 8);
    uint64_t v15 = [v14 customFlags];
    id v16 = *(id *)(a1 + 8);
    uint64_t v21 = v13;
    v17 = (void *)v8;
    objc_super v18 = objc_msgSend(v23, "initWithSearchString:filterQueries:bundleID:keyboardLanguage:updatedSuggestion:generateSuggestions:logDescription:resultLimit:suggestionLimit:customFlags:feedbackQueryID:", v7, v8, v22, v10, v12, 1, @"Ranked Suggestions", v21, v26, v15, objc_msgSend(v16, "feedbackQueryID"));

    v19 = [v18 topHitsQuerySuggestionResult];
    location[0] = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(location, (id)a1);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke;
    v30[3] = &unk_1E6D13370;
    objc_copyWeak(&v31, location);
    [v19 addSuccessBlock:v30];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_86;
    v28[3] = &unk_1E6D13398;
    objc_copyWeak(&v29, location);
    [v19 addFailureBlock:v28];
    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  else
  {
    objc_super v18 = 0;
  }
  return v18;
}

void __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = [v3 suggestions];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_2;
    v9[3] = &unk_1E6D13348;
    v9[4] = WeakRetained;
    v6 = objc_msgSend(v5, "ef_compactMap:", v9);

    v7 = +[MUISearchRankedSuggester log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = objc_msgSend(v6, "ef_mapSelector:", sel_ef_publicDescription);
      *(_DWORD *)buf = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1DDCDB000, v7, OS_LOG_TYPE_DEFAULT, "Generated suggestions %@", buf, 0xCu);
    }
    (*(void (**)(void))(WeakRetained[2] + 16))();
  }
}

id __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    BOOL v5 = [*(id *)(v4 + 8) phraseKind] == 1;
  }
  else {
    BOOL v5 = 0;
  }
  v6 = +[MUISearchAtomSuggestion suggestionFromSpotlightSuggestion:v3 shouldShowAvaters:v5];

  return v6;
}

void __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_86(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[MUISearchRankedSuggester log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_86_cold_1(v3, v4);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    (*(void (**)(void))(WeakRetained[2] + 16))();
  }
}

- (void)cancel
{
  if (self) {
    self = (MUISearchRankedSuggesterQuery *)self->_topHitsQuery;
  }
  [(MUISearchRankedSuggesterQuery *)self cancel];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topHitsQuery, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_phraseManager, 0);
}

void __52__MUISearchRankedSuggesterQuery__createTopHitsQuery__block_invoke_86_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = objc_msgSend(a1, "ef_publicDescription");
  int v4 = 138412290;
  BOOL v5 = v3;
  _os_log_error_impl(&dword_1DDCDB000, a2, OS_LOG_TYPE_ERROR, "Failed to generate suggestions %@", (uint8_t *)&v4, 0xCu);
}

@end