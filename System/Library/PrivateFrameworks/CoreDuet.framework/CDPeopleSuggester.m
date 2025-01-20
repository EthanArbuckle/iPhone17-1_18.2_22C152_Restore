@interface CDPeopleSuggester
@end

@implementation CDPeopleSuggester

void __38___CDPeopleSuggester_initWithAdvisor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateSettings];
}

void __57___CDPeopleSuggester_suggestPeopleWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v7 = 0;
  v3 = [v2 suggestPeopleWithError:&v7];
  id v4 = v7;
  v5 = +[_CDLogging interactionSignpost];
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_18ECEB000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SuggestPeopleAsync", (const char *)&unk_18EEB7986, v6, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end