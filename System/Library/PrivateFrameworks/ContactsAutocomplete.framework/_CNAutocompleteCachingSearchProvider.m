@interface _CNAutocompleteCachingSearchProvider
- (_CNAutocompleteCachingSearchProvider)initWithSearchProvider:(id)a3;
- (id)calendarServerSearch;
- (id)directoryServerSearch;
- (id)localExtensionSearches;
- (id)localSearch;
- (id)predictionSearch;
- (id)recentsSearch;
- (id)stewieSearch;
- (id)suggestionsSearch;
@end

@implementation _CNAutocompleteCachingSearchProvider

- (_CNAutocompleteCachingSearchProvider)initWithSearchProvider:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)_CNAutocompleteCachingSearchProvider;
  v5 = [(_CNAutocompleteCachingSearchProvider *)&v55 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F5A408];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke;
    v53[3] = &unk_1E63DE1E0;
    id v7 = v4;
    id v54 = v7;
    uint64_t v8 = [v6 lazyFutureWithBlock:v53];
    localSearchFuture = v5->_localSearchFuture;
    v5->_localSearchFuture = (CNFuture *)v8;

    v10 = (void *)MEMORY[0x1E4F5A408];
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_2;
    v51[3] = &unk_1E63DE1E0;
    id v11 = v7;
    id v52 = v11;
    uint64_t v12 = [v10 lazyFutureWithBlock:v51];
    recentsSearchFuture = v5->_recentsSearchFuture;
    v5->_recentsSearchFuture = (CNFuture *)v12;

    v14 = (void *)MEMORY[0x1E4F5A408];
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_3;
    v49[3] = &unk_1E63DE1E0;
    id v15 = v11;
    id v50 = v15;
    uint64_t v16 = [v14 lazyFutureWithBlock:v49];
    stewieSearchFuture = v5->_stewieSearchFuture;
    v5->_stewieSearchFuture = (CNFuture *)v16;

    v18 = (void *)MEMORY[0x1E4F5A408];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_4;
    v47[3] = &unk_1E63DE1E0;
    id v19 = v15;
    id v48 = v19;
    uint64_t v20 = [v18 lazyFutureWithBlock:v47];
    suggestionsSearchFuture = v5->_suggestionsSearchFuture;
    v5->_suggestionsSearchFuture = (CNFuture *)v20;

    v22 = (void *)MEMORY[0x1E4F5A408];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_5;
    v45[3] = &unk_1E63DE1E0;
    id v23 = v19;
    id v46 = v23;
    uint64_t v24 = [v22 lazyFutureWithBlock:v45];
    predictionSearchFuture = v5->_predictionSearchFuture;
    v5->_predictionSearchFuture = (CNFuture *)v24;

    v26 = (void *)MEMORY[0x1E4F5A408];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_6;
    v43[3] = &unk_1E63DE208;
    id v27 = v23;
    id v44 = v27;
    uint64_t v28 = [v26 lazyFutureWithBlock:v43];
    localExtensionSearchesFuture = v5->_localExtensionSearchesFuture;
    v5->_localExtensionSearchesFuture = (CNFuture *)v28;

    v30 = (void *)MEMORY[0x1E4F5A408];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_7;
    v41[3] = &unk_1E63DE1E0;
    id v31 = v27;
    id v42 = v31;
    uint64_t v32 = [v30 lazyFutureWithBlock:v41];
    directoryServerSearchFuture = v5->_directoryServerSearchFuture;
    v5->_directoryServerSearchFuture = (CNFuture *)v32;

    v34 = (void *)MEMORY[0x1E4F5A408];
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __63___CNAutocompleteCachingSearchProvider_initWithSearchProvider___block_invoke_8;
    v39[3] = &unk_1E63DE1E0;
    id v40 = v31;
    uint64_t v35 = [v34 lazyFutureWithBlock:v39];
    calendarServerSearchFuture = v5->_calendarServerSearchFuture;
    v5->_calendarServerSearchFuture = (CNFuture *)v35;

    v37 = v5;
  }

  return v5;
}

- (id)localSearch
{
  return (id)[(CNFuture *)self->_localSearchFuture result:0];
}

- (id)recentsSearch
{
  return (id)[(CNFuture *)self->_recentsSearchFuture result:0];
}

- (id)stewieSearch
{
  return (id)[(CNFuture *)self->_stewieSearchFuture result:0];
}

- (id)suggestionsSearch
{
  return (id)[(CNFuture *)self->_suggestionsSearchFuture result:0];
}

- (id)predictionSearch
{
  return (id)[(CNFuture *)self->_predictionSearchFuture result:0];
}

- (id)localExtensionSearches
{
  return (id)[(CNFuture *)self->_localExtensionSearchesFuture result:0];
}

- (id)directoryServerSearch
{
  return (id)[(CNFuture *)self->_directoryServerSearchFuture result:0];
}

- (id)calendarServerSearch
{
  return (id)[(CNFuture *)self->_calendarServerSearchFuture result:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarServerSearchFuture, 0);
  objc_storeStrong((id *)&self->_directoryServerSearchFuture, 0);
  objc_storeStrong((id *)&self->_localExtensionSearchesFuture, 0);
  objc_storeStrong((id *)&self->_predictionSearchFuture, 0);
  objc_storeStrong((id *)&self->_suggestionsSearchFuture, 0);
  objc_storeStrong((id *)&self->_stewieSearchFuture, 0);
  objc_storeStrong((id *)&self->_recentsSearchFuture, 0);
  objc_storeStrong((id *)&self->_localSearchFuture, 0);
}

@end