@interface CNAPeopleSuggesterFacade
@end

@implementation CNAPeopleSuggesterFacade

void __76___CNAPeopleSuggesterFacade_autocompleteSearchResultsWithPredictionContext___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 32) autocompleteSearchResultsWithPredictionContext:*(void *)(a1 + 40)];
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    +[CNAutocompletePeopleSuggesterFeedback didReceiveSuggestions:v5];
  }
  else
  {
    v6 = [*(id *)(a1 + 40) searchPrefix];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      v8 = CNALoggingContextTriage();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        uint64_t v16 = 0;
        _os_log_impl(&dword_1BEF57000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Framework version mismatch, no results expected until rdar://78585557", (uint8_t *)&v15, 0xCu);
      }

      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v11 = [*(id *)(a1 + 32) rankedZKWSuggestionsFromContext:*(void *)(a1 + 40)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      v14 = CNALoggingContextTriage();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138543362;
        uint64_t v16 = 0;
        _os_log_impl(&dword_1BEF57000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Predictions: Framework version mismatch, regressing behavior until rdar://78585557", (uint8_t *)&v15, 0xCu);
      }
    }
  }
}

@end