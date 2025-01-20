@interface PHSearchQuery
+ (id)_spotlightQueryContextWithSearchOptions:(id)a3;
+ (unint64_t)_searchResultTypesFromSearchQueryResultTypes:(unint64_t)a3;
+ (void)performSearch:(id)a3 queryQueue:(id)a4 resultsHandler:(id)a5;
+ (void)performSuggestionsSearch:(id)a3 queryQueue:(id)a4 suggestionsHandler:(id)a5;
+ (void)suggestionsForSearchQuery:(id)a3 searchQueryResult:(id)a4 rangeOfSuggestionText:(_NSRange)a5 queryQueue:(id)a6 suggestionsHandler:(id)a7;
- (BOOL)isCancelled;
- (BOOL)isEqual:(id)a3;
- (CSUserQuery)spotlightQuery;
- (CSUserQueryContext)spotlightQueryContext;
- (NSAttributedString)queryStringSentToSpotlight;
- (NSAttributedString)searchText;
- (NSDate)endDate;
- (NSDate)startDate;
- (PHPhotoLibrary)photoLibrary;
- (PHSearchQuery)initWithSearchText:(id)a3 searchOptions:(id)a4 photoLibrary:(id)a5 queryIdentifier:(int)a6 batchIdentifier:(int)a7;
- (PHSearchQuery)initWithText:(id)a3 suggestionOptions:(id)a4 photoLibrary:(id)a5 queryIdentifier:(int)a6;
- (PHSearchQueryOptions)searchOptions;
- (PHSearchSuggestionOptions)suggestionOptions;
- (PSISuggestionQuery)photosRetrievalSuggestionsQuery;
- (PSISuggestionQuery)photosSuggestionsQuery;
- (id)_executePhotosEntityStoreSearchWithAssetUUIDs:(id)a3 collectionUUIDs:(id)a4 rangeOfSuggestionText:(_NSRange)a5;
- (id)description;
- (id)jsonDictionary;
- (int)batchIdentifier;
- (int)queryIdentifier;
- (int)suggestionQueryIdentifier;
- (unint64_t)type;
- (void)_executeSpotlightSearchWithResultsHandler:(id)a3;
- (void)cancel;
- (void)setEndDate:(id)a3;
- (void)setIsCancelled:(BOOL)a3;
- (void)setStartDate:(id)a3;
@end

@implementation PHSearchQuery

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStringSentToSpotlight, 0);
  objc_storeStrong((id *)&self->_photosSuggestionsQuery, 0);
  objc_storeStrong((id *)&self->_photosRetrievalSuggestionsQuery, 0);
  objc_storeStrong((id *)&self->_spotlightQueryContext, 0);
  objc_storeStrong((id *)&self->_spotlightQuery, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_suggestionOptions, 0);
  objc_storeStrong((id *)&self->_searchOptions, 0);

  objc_storeStrong((id *)&self->_searchText, 0);
}

- (NSAttributedString)queryStringSentToSpotlight
{
  return self->_queryStringSentToSpotlight;
}

- (PSISuggestionQuery)photosSuggestionsQuery
{
  return self->_photosSuggestionsQuery;
}

- (PSISuggestionQuery)photosRetrievalSuggestionsQuery
{
  return self->_photosRetrievalSuggestionsQuery;
}

- (CSUserQueryContext)spotlightQueryContext
{
  return self->_spotlightQueryContext;
}

- (CSUserQuery)spotlightQuery
{
  return self->_spotlightQuery;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setEndDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (int)suggestionQueryIdentifier
{
  return self->_suggestionQueryIdentifier;
}

- (PHSearchSuggestionOptions)suggestionOptions
{
  return self->_suggestionOptions;
}

- (int)batchIdentifier
{
  return self->_batchIdentifier;
}

- (int)queryIdentifier
{
  return self->_queryIdentifier;
}

- (PHSearchQueryOptions)searchOptions
{
  return self->_searchOptions;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSAttributedString)searchText
{
  return self->_searchText;
}

- (id)jsonDictionary
{
  v28[9] = *MEMORY[0x1E4F143B8];
  id v22 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v27[0] = @"type";
  unint64_t v3 = [(PHSearchQuery *)self type];
  v4 = @"Suggestion";
  if (!v3) {
    v4 = @"Retrieval";
  }
  v28[0] = v4;
  v27[1] = @"searchOptions";
  if ([(PHSearchQuery *)self type]) {
    [(PHSearchQuery *)self suggestionOptions];
  }
  else {
  v26 = [(PHSearchQuery *)self searchOptions];
  }
  v25 = [v26 jsonDictionary];
  v28[1] = v25;
  v27[2] = @"searchText";
  v24 = [(PHSearchQuery *)self searchText];
  v23 = [v24 description];
  v28[2] = v23;
  v27[3] = @"queryIdentifier";
  unint64_t v5 = [(PHSearchQuery *)self type];
  v6 = NSNumber;
  if (v5) {
    uint64_t v7 = [(PHSearchQuery *)self suggestionQueryIdentifier];
  }
  else {
    uint64_t v7 = [(PHSearchQuery *)self queryIdentifier];
  }
  v21 = [v6 numberWithInt:v7];
  v28[3] = v21;
  v27[4] = @"batchIdentifier";
  v20 = objc_msgSend(NSNumber, "numberWithInt:", -[PHSearchQuery batchIdentifier](self, "batchIdentifier"));
  v28[4] = v20;
  v27[5] = @"isCancelled";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQuery isCancelled](self, "isCancelled"));
  v28[5] = v8;
  v27[6] = @"isFeaturedContentAllowed";
  v9 = [NSNumber numberWithBool:PLIsFeaturedContentAllowed()];
  v28[6] = v9;
  v27[7] = @"queryStringSentToSpotlight";
  v10 = [(PHSearchQuery *)self queryStringSentToSpotlight];
  v11 = [v10 description];
  v12 = v11;
  if (!v11)
  {
    v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[7] = v12;
  v27[8] = @"spotlightFetchAttributes";
  v13 = [(PHSearchQuery *)self spotlightQueryContext];
  v14 = [v13 fetchAttributes];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v28[8] = v15;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:9];
  v17 = (void *)[v22 initWithDictionary:v16];

  if (!v14) {
  if (!v11)
  }

  v18 = (void *)[v17 copy];

  return v18;
}

- (id)description
{
  if ([(PHSearchQuery *)self type])
  {
    if ([(PHSearchQuery *)self type] == 1)
    {
      unint64_t v3 = NSString;
      uint64_t v4 = [(PHSearchQuery *)self suggestionQueryIdentifier];
      BOOL v5 = [(PHSearchQuery *)self isCancelled];
      v6 = @"NO";
      if (v5) {
        v6 = @"YES";
      }
      uint64_t v7 = v6;
      v8 = [(PHSearchQuery *)self searchText];
      v9 = [(PHSearchQuery *)self suggestionOptions];
      v10 = [v3 stringWithFormat:@"Type: Suggestion Query, QueryId: %d, isCancelled: %@, SearchText: '%@', SuggestionOptions: %@", v4, v7, v8, v9];
    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)PHSearchQuery;
      v10 = [(PHSearchQuery *)&v21 description];
    }
  }
  else
  {
    v11 = NSString;
    uint64_t v12 = [(PHSearchQuery *)self queryIdentifier];
    uint64_t v13 = [(PHSearchQuery *)self batchIdentifier];
    if ([(PHSearchQuery *)self isCancelled]) {
      v14 = @"YES";
    }
    else {
      v14 = @"NO";
    }
    v15 = v14;
    v16 = [(PHSearchQuery *)self searchText];
    if (PLIsFeaturedContentAllowed()) {
      v17 = @"YES";
    }
    else {
      v17 = @"NO";
    }
    v18 = v17;
    v19 = [(PHSearchQuery *)self searchOptions];
    v10 = [v11 stringWithFormat:@"Type: Retrieval Query, QueryId: %d, BatchId: %d, isCancelled: %@, SearchText: '%@', FeaturedContentAllowed: %@, SearchOptions: %@", v12, v13, v15, v16, v18, v19];
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (PHSearchQuery *)a3;
  if (self == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      unint64_t v6 = [(PHSearchQuery *)self type];
      if (v6 == [(PHSearchQuery *)v5 type])
      {
        if (![(PHSearchQuery *)self type])
        {
          int v7 = [(PHSearchQuery *)self queryIdentifier];
          int v8 = [(PHSearchQuery *)v5 queryIdentifier];
          goto LABEL_11;
        }
        if ([(PHSearchQuery *)self type] == 1)
        {
          int v7 = [(PHSearchQuery *)self suggestionQueryIdentifier];
          int v8 = [(PHSearchQuery *)v5 suggestionQueryIdentifier];
LABEL_11:
          BOOL v9 = v7 == v8;
          goto LABEL_12;
        }
      }
      BOOL v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
    BOOL v9 = 0;
  }
LABEL_13:

  return v9;
}

- (BOOL)isCancelled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL isCancelled = v2->_isCancelled;
  objc_sync_exit(v2);

  return isCancelled;
}

- (void)setIsCancelled:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL isCancelled = a3;
  objc_sync_exit(obj);
}

- (id)_executePhotosEntityStoreSearchWithAssetUUIDs:(id)a3 collectionUUIDs:(id)a4 rangeOfSuggestionText:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v30 = a4;
  PLPhotosSearchGetLog();
  BOOL v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  v11 = v9;
  uint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLSearchBackendQuerySuggestions", (const char *)&unk_19B30018E, buf, 2u);
  }

  uint64_t v13 = [(PHSearchQuery *)self photosRetrievalSuggestionsQuery];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [(PHSearchQuery *)self photosSuggestionsQuery];
  }
  v16 = v15;

  v17 = [v16 performQueryWithSearchResultAssetUUIDs:v29 collectionUUIDs:v30];
  id v31 = 0;
  +[PHSearchProcessor searchSuggestionsFromPLSearchSuggestions:suggestions:queryId:batchId:rangeOfSuggestionText:](PHSearchProcessor, "searchSuggestionsFromPLSearchSuggestions:suggestions:queryId:batchId:rangeOfSuggestionText:", v17, &v31, [(PHSearchQuery *)self queryIdentifier], [(PHSearchQuery *)self batchIdentifier], location, length);
  id v18 = v31;
  uint64_t v19 = [(PHSearchQuery *)self queryIdentifier];
  uint64_t v20 = [(PHSearchQuery *)self batchIdentifier];
  objc_super v21 = v12;
  id v22 = v21;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    uint64_t v23 = [v29 count];
    uint64_t v24 = [v30 count];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)v33 = v19;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v20;
    *(_WORD *)v34 = 2048;
    *(void *)&v34[2] = v23;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v22, OS_SIGNPOST_INTERVAL_END, v10, "PLSearchBackendQuerySuggestions", "Query: %d, Batch: %d, Input Assets: %tu, Input Collections: %tu", buf, 0x22u);
  }

  v25 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    if (v20) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v20, v19);
    }
    else {
    v26 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v19);
    }
    uint64_t v27 = [v17 count];
    *(_DWORD *)buf = 138543618;
    *(void *)v33 = v26;
    *(_WORD *)&v33[8] = 2050;
    *(void *)v34 = v27;
    _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ Suggestion generation completed with %{public}tu suggestions.", buf, 0x16u);
  }

  return v18;
}

- (void)_executeSpotlightSearchWithResultsHandler:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  PLPhotosSearchGetLog();
  uint64_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  unint64_t v6 = v4;
  int v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLSearchBackendQuerySpotlightQuery", (const char *)&unk_19B30018E, buf, 2u);
  }

  uint64_t v8 = [(PHSearchQuery *)self batchIdentifier];
  uint64_t v9 = [(PHSearchQuery *)self queryIdentifier];
  os_signpost_id_t v10 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v8, v9);
    }
    else {
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v9);
    }
    uint64_t v12 = [(PHSearchQuery *)self spotlightQuery];
    uint64_t v13 = [(PHSearchQuery *)self queryStringSentToSpotlight];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v63 = v13;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Start Spotlight query: %@, queryString: \"%@\".", buf, 0x20u);
  }
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v63 = __Block_byref_object_copy__31194;
  v64 = __Block_byref_object_dispose__31195;
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3032000000;
  v59[3] = __Block_byref_object_copy__31194;
  v59[4] = __Block_byref_object_dispose__31195;
  id v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__31194;
  v57[4] = __Block_byref_object_dispose__31195;
  id v58 = 0;
  v55[0] = 0;
  v55[1] = v55;
  v55[2] = 0x2020000000;
  char v56 = 1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  int v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  int v52 = 0;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke;
  v50[3] = &unk_1E5846790;
  v50[4] = buf;
  v14 = [(PHSearchQuery *)self spotlightQuery];
  [v14 setFoundItemsHandler:v50];

  id v15 = objc_opt_new();
  v16 = objc_opt_new();
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_2;
  v47[3] = &unk_1E58467B8;
  id v17 = v15;
  id v48 = v17;
  id v18 = v16;
  id v49 = v18;
  uint64_t v19 = [(PHSearchQuery *)self spotlightQuery];
  [v19 setPhotosComputedAttributesHandler:v47];

  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_113;
  v43[3] = &unk_1E58467E0;
  v43[4] = v59;
  objc_copyWeak(&v44, &location);
  v43[5] = v57;
  v43[6] = v53;
  v43[7] = v51;
  v43[8] = v55;
  int v45 = v8;
  int v46 = v9;
  uint64_t v20 = [(PHSearchQuery *)self spotlightQuery];
  [v20 setAttributedQueryHandler:v43];

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3254779904;
  v28[2] = __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_115;
  v28[3] = &unk_1EEAC0EE0;
  objc_super v21 = v7;
  v39 = v21;
  os_signpost_id_t v40 = v5;
  int v41 = v9;
  int v42 = v8;
  v32 = buf;
  v33 = v57;
  objc_copyWeak(&v38, &location);
  v34 = v59;
  __int16 v35 = v53;
  uint64_t v36 = v51;
  id v22 = v17;
  id v29 = v22;
  id v23 = v18;
  id v30 = v23;
  id v24 = v27;
  id v31 = v24;
  uint64_t v37 = v55;
  v25 = [(PHSearchQuery *)self spotlightQuery];
  [v25 setCompletionHandler:v28];

  v26 = [(PHSearchQuery *)self spotlightQuery];
  [v26 start];

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v44);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v55, 8);
  _Block_object_dispose(v57, 8);

  _Block_object_dispose(v59, 8);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

uint64_t __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:a2];
}

void __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([(id)*MEMORY[0x1E4F23310] isEqualToString:v5])
  {
    int v7 = *(void **)(a1 + 32);
LABEL_5:
    [v7 addObjectsFromArray:v6];
    goto LABEL_9;
  }
  if ([(id)*MEMORY[0x1E4F229D0] isEqualToString:v5])
  {
    int v7 = *(void **)(a1 + 40);
    goto LABEL_5;
  }
  uint64_t v8 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "Unexpected attribute found in photosComputedAttributesHandler. Attribute: %@, values: %@", (uint8_t *)&v9, 0x16u);
  }

LABEL_9:
}

void __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_113(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v6 = [WeakRetained searchOptions];
  int v7 = [v6 enableQueryUnderstanding];
  if (v7)
  {
    v2 = [v4 query];
    uint64_t v8 = (void *)[v2 copy];
  }
  else
  {
    uint64_t v8 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
  if (v7)
  {
  }
  uint64_t v9 = [v4 queryEmbedding];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  [v4 highPrecisionDistanceThresh];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v12;
  [v4 veryHighPrecisionDistanceThresh];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v13;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [v4 isUnsafeQuery];
  v14 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 80)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84));
    }
    else {
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 84), v20);
    }
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    id v22 = v15;
    __int16 v23 = 2112;
    uint64_t v24 = v16;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight QU annotated query: \"%@\"", buf, 0x16u);
  }
  id v17 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 80)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 80), *(unsigned int *)(a1 + 84));
    }
    else {
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 84), v20);
    }
    uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    id v22 = v18;
    __int16 v23 = 2112;
    uint64_t v24 = v19;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight Query Embedding: %@", buf, 0x16u);
  }
}

void __59__PHSearchQuery__executeSpotlightSearchWithResultsHandler___block_invoke_115(uint64_t a1, void *a2)
{
  v58[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 112);
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 120);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    int v7 = *(_DWORD *)(a1 + 128);
    int v8 = *(_DWORD *)(a1 + 132);
    uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      uint64_t v10 = @"YES";
    }
    else {
      uint64_t v10 = @"NO";
    }
    __int16 v11 = v10;
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)char v56 = v7;
    *(_WORD *)&v56[4] = 1024;
    *(_DWORD *)&v56[6] = v8;
    *(_WORD *)v57 = 2048;
    *(void *)&v57[2] = v9;
    LOWORD(v58[0]) = 2112;
    *(void *)((char *)v58 + 2) = v11;
    _os_signpost_emit_with_name_impl(&dword_19B043000, v5, OS_SIGNPOST_INTERVAL_END, v6, "PLSearchBackendQuerySpotlightQuery", "Query: %d, Batch: %d, CSSearchableItems: %tu, QueryEmbedding: %@", buf, 0x22u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  int v13 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 132)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 132), *(unsigned int *)(a1 + 128));
    }
    else {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 128), v43);
    }
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    *(_DWORD *)buf = 138543618;
    *(void *)char v56 = v14;
    *(_WORD *)&v56[8] = 2050;
    *(void *)v57 = v15;
    _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight returned %{public}tu items.", buf, 0x16u);
  }
  if ([WeakRetained isCancelled])
  {
    uint64_t v16 = 0;
    id v17 = 0;
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    id v19 = (id)MEMORY[0x1E4F1CBF0];
    id v48 = (id)MEMORY[0x1E4F1CBF0];
    id v49 = (id)MEMORY[0x1E4F1CBF0];
    id v46 = (id)MEMORY[0x1E4F1CBF0];
    id v47 = (id)MEMORY[0x1E4F1CBF0];
    if (!v3) {
      goto LABEL_24;
    }
    goto LABEL_18;
  }
  id v44 = v3;
  uint64_t v20 = [WeakRetained photoLibrary];
  objc_super v21 = [v20 searchIndex];
  id v22 = [v21 unverifiedPsiSearchIndex];

  uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  id v24 = objc_loadWeakRetained((id *)(a1 + 104));
  uint64_t v25 = [v24 photoLibrary];
  id v17 = +[PHSearchQueryAnnotation annotatedQueryStringFromSpotlightAttributedQueryString:v23 forSearchQuery:WeakRetained photosEntityStore:v22 photoLibrary:v25];

  v26 = objc_alloc_init(PHSearchProcessor);
  id v27 = (void *)[*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) copy];
  id v53 = 0;
  id v54 = 0;
  id v51 = 0;
  id v52 = 0;
  long long v50 = 0uLL;
  LODWORD(v28) = *(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
  LODWORD(v29) = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
  [(PHSearchProcessor *)v26 searchResultsFromSpotlightSearchableItems:v27 query:WeakRetained annotatedQueryString:v17 searchResults:&v54 unfilteredAssetSearchResults:&v53 rankedAssetSearchResults:&v52 rankedCollectionSearchResults:v28 assetUUIDsForSuggestions:v29 collectionUUIDsForSuggestions:&v51 highPrecisionEmbeddingDistanceThreshold:(char *)&v50 + 8 veryHighPrecisionEmbeddingDistanceThreshold:&v50];
  id v18 = v54;
  id v19 = v53;
  id v49 = v52;
  id v48 = v51;
  id v47 = *((id *)&v50 + 1);
  id v46 = (id)v50;

  id v30 = [WeakRetained searchOptions];
  int v31 = [v30 enableQueryMatchDetails];

  uint64_t v16 = 0;
  if (v31)
  {
    uint64_t v16 = +[PHSearchProcessor queryMatchDetailsForSearchResults:v18 queryText:v17 queryEmbedding:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) matchedPersonUUIDs:*(void *)(a1 + 32) matchedScenes:*(void *)(a1 + 40) queryId:*(unsigned int *)(a1 + 128)];
  }

  id v3 = v44;
  if (v44)
  {
LABEL_18:
    v32 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      if (*(_DWORD *)(a1 + 132)) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 132), *(unsigned int *)(a1 + 128));
      }
      else {
      v33 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 128), v43);
      }
      *(_DWORD *)buf = 138543618;
      *(void *)char v56 = v33;
      *(_WORD *)&v56[8] = 2114;
      *(void *)v57 = v3;
      _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "%{public}@ Spotlight Query error: %{public}@", buf, 0x16u);
    }
  }
LABEL_24:
  v34 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    int v45 = v17;
    id v35 = v19;
    id v36 = v3;
    if (*(_DWORD *)(a1 + 132)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 132), *(unsigned int *)(a1 + 128));
    }
    else {
    uint64_t v37 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 128), v43);
    }
    id v38 = [WeakRetained spotlightQuery];
    v39 = [v38 queryString];
    *(_DWORD *)buf = 138543618;
    *(void *)char v56 = v37;
    *(_WORD *)&v56[8] = 2112;
    *(void *)v57 = v39;
    _os_log_impl(&dword_19B043000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Spotlight query completed for \"%@\".", buf, 0x16u);

    id v3 = v36;
    id v19 = v35;
    id v17 = v45;
  }

  os_signpost_id_t v40 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 132)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 132), *(unsigned int *)(a1 + 128));
    }
    else {
    int v41 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 128), v43);
    }
    uint64_t v42 = [v18 count];
    *(_DWORD *)buf = 138543874;
    *(void *)char v56 = v41;
    *(_WORD *)&v56[8] = 2050;
    *(void *)v57 = v42;
    *(_WORD *)&v57[8] = 2112;
    v58[0] = v16;
    _os_log_impl(&dword_19B043000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Found %{public}tu search results. Match details: %@", buf, 0x20u);
  }
  (*(void (**)(void, id, id, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v18, v19, v49);
}

- (void)cancel
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(PHSearchQuery *)self setIsCancelled:1];
  if ([(PHSearchQuery *)self type])
  {
    if ([(PHSearchQuery *)self type] != 1) {
      return;
    }
    id v3 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if ([(PHSearchQuery *)self batchIdentifier]) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", -[PHSearchQuery batchIdentifier](self, "batchIdentifier"), -[PHSearchQuery suggestionQueryIdentifier](self, "suggestionQueryIdentifier"));
      }
      else {
      int v8 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", -[PHSearchQuery suggestionQueryIdentifier](self, "suggestionQueryIdentifier"), v10);
      }
      *(_DWORD *)buf = 138543618;
      int v12 = v8;
      __int16 v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ PHSearchQuery cancelled: %@", buf, 0x16u);
    }
    int v7 = [(PHSearchQuery *)self photosSuggestionsQuery];
  }
  else
  {
    id v4 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if ([(PHSearchQuery *)self batchIdentifier]) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", -[PHSearchQuery batchIdentifier](self, "batchIdentifier"), -[PHSearchQuery queryIdentifier](self, "queryIdentifier"));
      }
      else {
      id v5 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", -[PHSearchQuery queryIdentifier](self, "queryIdentifier"), v10);
      }
      *(_DWORD *)buf = 138543618;
      int v12 = v5;
      __int16 v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ PHSearchQuery cancelled: %@", buf, 0x16u);
    }
    os_signpost_id_t v6 = [(PHSearchQuery *)self spotlightQuery];
    [v6 cancel];

    int v7 = [(PHSearchQuery *)self photosRetrievalSuggestionsQuery];
  }
  uint64_t v9 = v7;
  [v7 cancel];
}

- (PHSearchQuery)initWithText:(id)a3 suggestionOptions:(id)a4 photoLibrary:(id)a5 queryIdentifier:(int)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (v11)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    id v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 180, @"Invalid parameter not satisfying: %@", @"text" object file lineNumber description];

    if (v14)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_23:
      uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
      [v37 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 182, @"Invalid parameter not satisfying: %@", @"suggestionOptions" object file lineNumber description];

      if (a6) {
        goto LABEL_5;
      }
      goto LABEL_24;
    }
  }
  id v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 181, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

  if (!v12) {
    goto LABEL_23;
  }
LABEL_4:
  if (a6) {
    goto LABEL_5;
  }
LABEL_24:
  id v38 = [MEMORY[0x1E4F28B00] currentHandler];
  [v38 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 183, @"Invalid parameter not satisfying: %@", @"queryIdentifier != PHInvalidSuggestionsQueryID" object file lineNumber description];

LABEL_5:
  v43.receiver = self;
  v43.super_class = (Class)PHSearchQuery;
  uint64_t v15 = [(PHSearchQuery *)&v43 init];
  if (!v15)
  {
LABEL_19:
    v33 = v15;
    goto LABEL_20;
  }
  uint64_t v16 = [v14 searchIndex];
  id v17 = [v16 unverifiedPsiSearchIndex];

  if (v17)
  {
    uint64_t v18 = [v11 copy];
    searchText = v15->_searchText;
    v15->_searchText = (NSAttributedString *)v18;

    uint64_t v20 = [v12 copy];
    suggestionOptions = v15->_suggestionOptions;
    v15->_suggestionOptions = (PHSearchSuggestionOptions *)v20;

    v15->_suggestionQueryIdentifier = a6;
    objc_storeStrong((id *)&v15->_photoLibrary, a5);
    v15->_type = 1;
    if ([v11 length])
    {
      id v22 = +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:v11];
      uint64_t v40 = +[PHSearchUtility completionSuggestionTextsForQueryString:v22 locationInQueryString:[v22 length]];
      uint64_t v23 = +[PHSearchUtility suggestionComponentsInQueryString:v22];
      id v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F8ACD0]), "initWithSuggestionType:suggestionLimit:", 1, objc_msgSend(v12, "suggestionLimit"));
      objc_msgSend(v24, "setSuggestionResultTypes:", objc_msgSend((id)objc_opt_class(), "_searchResultTypesFromSearchQueryResultTypes:", objc_msgSend(v12, "suggestionResultTypes")));
      objc_msgSend(v24, "setLocationInQueryStringForSuggestionGeneration:", objc_msgSend(v11, "length"));
      uint64_t v25 = [v12 suggestionCategories];
      [v24 setSuggestionCategories:v25];

      objc_msgSend(v24, "set_wantsUnscopedSuggestions:", objc_msgSend(v12, "wantsUnscopedSuggestions"));
      id v26 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      id v27 = [v12 suggestionCategories];
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __77__PHSearchQuery_initWithText_suggestionOptions_photoLibrary_queryIdentifier___block_invoke;
      v41[3] = &unk_1E5847D40;
      id v42 = v26;
      id v28 = v26;
      [v27 enumerateIndexesUsingBlock:v41];

      [v12 setSuggestionCategories:v28];
      double v29 = (void *)v40;
      uint64_t v30 = [objc_alloc(MEMORY[0x1E4F8ACD8]) initWithFormattedSearchText:v22 originalSearchText:v11 completionSuggestionTexts:v40 suggestionOptions:v24 suggestionComponents:v23 photosEntityStore:v17];
      photosSuggestionsQuery = v15->_photosSuggestionsQuery;
      v15->_photosSuggestionsQuery = (PSISuggestionQuery *)v30;
    }
    else
    {
      id v22 = PLSearchBackendQueryGetLog();
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
LABEL_18:

        goto LABEL_19;
      }
      if (v15->_batchIdentifier) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v15->_batchIdentifier, v15->_suggestionQueryIdentifier);
      }
      else {
      double v29 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v15->_suggestionQueryIdentifier, v39);
      }
      *(_DWORD *)buf = 138543362;
      int v45 = v29;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "%{public}@ PHSearchQuery initialized with empty query string for suggestions query.", buf, 0xCu);
    }

    goto LABEL_18;
  }
  v32 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v32, OS_LOG_TYPE_ERROR, "PSIDatabase unavailable, cannot initialize suggestions query", buf, 2u);
  }

  v33 = 0;
LABEL_20:

  return v33;
}

uint64_t __77__PHSearchQuery_initWithText_suggestionOptions_photoLibrary_queryIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) >= 0x29) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = a2;
  }
  return [*(id *)(a1 + 32) addIndex:v2];
}

- (PHSearchQuery)initWithSearchText:(id)a3 searchOptions:(id)a4 photoLibrary:(id)a5 queryIdentifier:(int)a6 batchIdentifier:(int)a7
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v13 = (NSAttributedString *)a3;
  v14 = (NSAttributedString *)a4;
  id v15 = a5;
  uint64_t v16 = v15;
  if (v13)
  {
    if (v15) {
      goto LABEL_3;
    }
LABEL_73:
    v67 = [MEMORY[0x1E4F28B00] currentHandler];
    [v67 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 88, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (a6) {
      goto LABEL_4;
    }
    goto LABEL_74;
  }
  uint64_t v66 = [MEMORY[0x1E4F28B00] currentHandler];
  [v66 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 87, @"Invalid parameter not satisfying: %@", @"searchText" object file lineNumber description];

  if (!v16) {
    goto LABEL_73;
  }
LABEL_3:
  if (a6) {
    goto LABEL_4;
  }
LABEL_74:
  v68 = [MEMORY[0x1E4F28B00] currentHandler];
  [v68 handleFailureInMethod:a2, self, @"PHSearchQuery.m", 89, @"Invalid parameter not satisfying: %@", @"queryIdentifier != PHInvalidSearchQueryID" object file lineNumber description];

LABEL_4:
  v71.receiver = self;
  v71.super_class = (Class)PHSearchQuery;
  id v17 = [(PHSearchQuery *)&v71 init];
  if (!v17) {
    goto LABEL_71;
  }
  uint64_t v18 = [(NSAttributedString *)v13 copy];
  searchText = v17->_searchText;
  v17->_searchText = (NSAttributedString *)v18;

  uint64_t v20 = (void *)[(NSAttributedString *)v14 copy];
  objc_super v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = (PHSearchQueryOptions *)objc_opt_new();
  }
  searchOptions = v17->_searchOptions;
  v17->_searchOptions = v22;

  v17->_queryIdentifier = a6;
  v17->_batchIdentifier = a7;
  objc_storeStrong((id *)&v17->_photoLibrary, a5);
  v17->_type = 0;
  uint64_t v24 = [(id)objc_opt_class() _spotlightQueryContextWithSearchOptions:v14];
  spotlightQueryContext = v17->_spotlightQueryContext;
  v17->_spotlightQueryContext = (CSUserQueryContext *)v24;

  if (![(NSAttributedString *)v13 length])
  {
    id v26 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      if (v17->_batchIdentifier) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
      }
      else {
      id v27 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
      }
      *(_DWORD *)buf = 138543362;
      v73 = v27;
      _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "%{public}@ PHSearchQuery initialized with empty query string for retrieval query.", buf, 0xCu);
    }
  }
  if ([(NSAttributedString *)v14 excludeOCRTextResultMatches]
    && ([(NSAttributedString *)v14 enableQueryMatchDetails] & 1) == 0)
  {
    id v28 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      if (v17->_batchIdentifier) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
      }
      else {
      double v29 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
      }
      *(_DWORD *)buf = 138543362;
      v73 = v29;
      _os_log_impl(&dword_19B043000, v28, OS_LOG_TYPE_ERROR, "%{public}@ excludeOCRTextResultMatches set, but enableQueryMatchDetails is not set. OCR result info will not be available for exclusion.", buf, 0xCu);
    }
  }
  if ([(NSAttributedString *)v14 disableMetadataSearch]
    && [(NSAttributedString *)v14 disableSemanticSearch])
  {
    uint64_t v30 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      if (v17->_batchIdentifier) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
      }
      else {
      int v31 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
      }
      *(_DWORD *)buf = 138543362;
      v73 = v31;
      _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_ERROR, "%{public}@ disableMetadataSearch and disableSemanticSearch options set. Query won't retrieve on anything.", buf, 0xCu);
    }
  }
  v32 = +[PHSearchUtility insertSpacingIfNeededBetweenAnnotationsAndPlainTextInQueryString:v13];
  uint64_t v33 = +[PHSearchQueryAnnotation spotlightAttributedQueryStringFromAnnotatedQueryString:v32];
  queryStringSentToSpotlight = v17->_queryStringSentToSpotlight;
  v17->_queryStringSentToSpotlight = (NSAttributedString *)v33;

  if ([MEMORY[0x1E4F8AC10] spotlightPrivateIndexEnabled])
  {
    id v35 = [v16 pathManager];
    id v36 = [v35 spotlightSearchIndexPath];

    id v37 = objc_alloc(MEMORY[0x1E4F23800]);
    id v38 = [(PHSearchQuery *)v17 queryStringSentToSpotlight];
    uint64_t v39 = [v37 initWithUserAttributedQueryString:v38 userQueryContext:v17->_spotlightQueryContext path:v36];
    spotlightQuery = v17->_spotlightQuery;
    v17->_spotlightQuery = (CSUserQuery *)v39;
  }
  else
  {
    id v41 = objc_alloc(MEMORY[0x1E4F23890]);
    id v36 = [(PHSearchQuery *)v17 queryStringSentToSpotlight];
    uint64_t v42 = [v41 initWithUserAttributedQueryString:v36 userQueryContext:v17->_spotlightQueryContext];
    id v38 = v17->_spotlightQuery;
    v17->_spotlightQuery = (CSUserQuery *)v42;
  }

  if ([(NSAttributedString *)v14 suggestionLimit])
  {
    objc_super v43 = [v16 searchIndex];
    id v44 = [v43 unverifiedPsiSearchIndex];

    if (v44)
    {
      int v45 = [(PHSearchQuery *)v17 searchText];
      unint64_t v46 = +[PHSearchUtility suggestionTypeForQueryString:v45 locationInQueryStringForSuggestionGeneration:[(NSAttributedString *)v14 locationInQueryStringForSuggestionGeneration]];

      if (!v46)
      {
LABEL_54:

        goto LABEL_55;
      }
      uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
      if ([(NSAttributedString *)v14 locationInQueryStringForSuggestionGeneration] != 0x7FFFFFFFFFFFFFFFLL)
      {
        unint64_t v48 = +[PHSearchUtility numberOfInsertedSpacesBetweenAnnotationsAndPlainTextInQueryString:v13 beforeLocation:[(NSAttributedString *)v14 locationInQueryStringForSuggestionGeneration]];
        uint64_t v47 = [(NSAttributedString *)v14 locationInQueryStringForSuggestionGeneration]+ v48;
      }
      uint64_t v49 = [(NSAttributedString *)v14 suggestionLimit];
      long long v50 = [objc_alloc(MEMORY[0x1E4F8ACD0]) initWithSuggestionType:v46 suggestionLimit:v49];
      [v50 setLimitSuggestionsToExactTextMatches:[(NSAttributedString *)v14 limitSuggestionsToExactTextMatches]];
      -[NSObject setSuggestionResultTypes:](v50, "setSuggestionResultTypes:", objc_msgSend((id)objc_opt_class(), "_searchResultTypesFromSearchQueryResultTypes:", -[NSAttributedString searchQueryResultTypes](v14, "searchQueryResultTypes")));
      [v50 setLocationInQueryStringForSuggestionGeneration:v47];
      [v50 setMinNumberOfResultsForNextTokenGeneration:[(NSAttributedString *)v14 minNumberOfResultsForNextTokenGeneration]];
      [v50 setEnableNextTokenSuggestions:[(NSAttributedString *)v14 enableNextTokenSuggestions]];
      v70 = v16;
      if ([v50 searchSuggestionType] == 1)
      {
        id v51 = +[PHSearchUtility completionSuggestionTextsForQueryString:v32 locationInQueryString:v47];
      }
      else
      {
        id v51 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v52 = +[PHSearchUtility suggestionComponentsInQueryString:v32];
      uint64_t v53 = [objc_alloc(MEMORY[0x1E4F8ACD8]) initWithFormattedSearchText:v32 originalSearchText:v13 completionSuggestionTexts:v51 suggestionOptions:v50 suggestionComponents:v52 photosEntityStore:v44];
      photosRetrievalSuggestionsQuery = v17->_photosRetrievalSuggestionsQuery;
      v17->_photosRetrievalSuggestionsQuery = (PSISuggestionQuery *)v53;

      v55 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        if (v17->_batchIdentifier) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
        }
        else {
        char v56 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
        }
        *(_DWORD *)buf = 138544130;
        v73 = v56;
        __int16 v74 = 2112;
        v75 = v32;
        __int16 v76 = 2112;
        v77 = v51;
        __int16 v78 = 2112;
        v79 = v52;
        _os_log_impl(&dword_19B043000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ Initializing PSISuggestionQuery with query string: \"%@\", completion suggestion texts: \"%@\", query suggestion components: \"%@\".", buf, 0x2Au);
      }
      uint64_t v16 = v70;
    }
    else
    {
      long long v50 = PLSearchBackendQueryGetLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        if (v17->_batchIdentifier) {
          objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
        }
        else {
        v57 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
        }
        *(_DWORD *)buf = 138543362;
        v73 = v57;
        _os_log_impl(&dword_19B043000, v50, OS_LOG_TYPE_ERROR, "%{public}@ Unable to access Photos Entity Store (PSI database).", buf, 0xCu);
      }
    }

    goto LABEL_54;
  }
LABEL_55:
  id v58 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    if (v17->_batchIdentifier) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
    }
    else {
    v59 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
    }
    id v60 = v17->_queryStringSentToSpotlight;
    *(_DWORD *)buf = 138543618;
    v73 = v59;
    __int16 v74 = 2112;
    v75 = v60;
    _os_log_impl(&dword_19B043000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ Initializing PHSearchQuery with Spotlight query string: \"%@\".", buf, 0x16u);
  }
  v61 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
  {
    if (v17->_batchIdentifier) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
    }
    else {
    v62 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
    }
    *(_DWORD *)buf = 138543618;
    v73 = v62;
    __int16 v74 = 2114;
    v75 = v14;
    _os_log_impl(&dword_19B043000, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ Initializing PHSearchQuery with Search Options: %{public}@", buf, 0x16u);
  }
  v63 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
  {
    if (v17->_batchIdentifier) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v17->_batchIdentifier, v17->_queryIdentifier);
    }
    else {
    v64 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v17->_queryIdentifier, v69);
    }
    *(_DWORD *)buf = 138543618;
    v73 = v64;
    __int16 v74 = 2112;
    v75 = v13;
    _os_log_impl(&dword_19B043000, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ Initialized PHSearchQuery for searchText: \"%@\"", buf, 0x16u);
  }
LABEL_71:

  return v17;
}

+ (unint64_t)_searchResultTypesFromSearchQueryResultTypes:(unint64_t)a3
{
  unint64_t v3 = 1;
  if ((a3 & 1) == 0) {
    unint64_t v3 = 2;
  }
  if ((~(_BYTE)a3 & 3) != 0) {
    return v3;
  }
  else {
    return v3 | 2;
  }
}

+ (id)_spotlightQueryContextWithSearchOptions:(id)a3
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F23898] userQueryContext];
  id v5 = PLSearchFileProtectionTypes();
  [v4 setProtectionClasses:v5];

  v37[0] = @"com.apple.mobileslideshow";
  os_signpost_id_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  [v4 setBundleIDs:v6];

  [v4 setDisableBlockingOnIndex:1];
  if ([v3 maxSearchResults])
  {
    uint64_t v7 = [v3 maxSearchResults];
  }
  else
  {
    int v8 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "maxSearchResults == 0, forcing maxResultCount = 1000000 due to rdar://123315356", buf, 2u);
    }

    uint64_t v7 = 1000000;
  }
  [v4 setMaxResultCount:v7];
  char v9 = PLSearchSemanticSearchQueriesSupported();
  uint64_t v10 = [v3 disableSemanticSearch];
  uint64_t v11 = v10;
  if ((v9 & 1) == 0)
  {
    if (v10) {
      goto LABEL_12;
    }
    id v12 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEFAULT, "Embedding search not supported. Embedding search will not run.", buf, 2u);
    }

    uint64_t v11 = 1;
  }
  [v4 setDisableSemanticSearch:v11];
LABEL_12:
  objc_msgSend(v4, "setDisableMetadataSearch:", objc_msgSend(v3, "disableMetadataSearch", v11));
  objc_msgSend(v4, "setDisableSafetyCheck:", objc_msgSend(v3, "disableSafetyCheck"));
  [v3 embeddingRelevanceThreshold];
  if (v13 != -1.0)
  {
    v14 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v3 embeddingRelevanceThreshold];
      *(_DWORD *)buf = 134349056;
      uint64_t v36 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[OVERRIDE SET] Set the queryContext.embeddingRelevanceThreshold to %{public}lf", buf, 0xCu);
    }

    [v3 embeddingRelevanceThreshold];
    objc_msgSend(v4, "setEmbeddingRelevanceThreshold:");
  }
  if ([v3 embeddingGenerationTimeout] != -1) {
    objc_msgSend(v4, "setEmbeddingGenerationTimeout:", objc_msgSend(v3, "embeddingGenerationTimeout"));
  }
  objc_msgSend(v4, "setDisableU2:", objc_msgSend(v3, "disableU2"));
  uint64_t v16 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v34 = *MEMORY[0x1E4F23318];
  id v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  uint64_t v18 = [v16 arrayWithArray:v17];

  if ([v3 enableQueryMatchDetails])
  {
    [v4 setComputePhotosDerivedAttributes:1];
    uint64_t v19 = *MEMORY[0x1E4F23790];
    v33[0] = *MEMORY[0x1E4F237A8];
    v33[1] = v19;
    v33[2] = *MEMORY[0x1E4F8B750];
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:3];
    [v18 addObjectsFromArray:v20];

    if (([v3 disableSemanticSearch] & 1) == 0) {
      [v18 addObject:*MEMORY[0x1E4F23760]];
    }
  }
  if ([v3 maxRankedAssetSearchResults] >= 1)
  {
    [v18 addObject:*MEMORY[0x1E4F23798]];
    if (([v3 fastRanking] & 1) == 0)
    {
      [v4 setEnableRankedResults:1];
      objc_msgSend(v4, "setMaxRankedResultCount:", objc_msgSend(v3, "maxRankedAssetSearchResults"));
      [v18 addObject:*MEMORY[0x1E4F237A0]];
    }
  }
  if (([v3 searchQueryResultTypes] & 2) != 0)
  {
    uint64_t v21 = *MEMORY[0x1E4F8B720];
    v32[0] = *MEMORY[0x1E4F8B728];
    v32[1] = v21;
    uint64_t v22 = *MEMORY[0x1E4F8B730];
    v32[2] = *MEMORY[0x1E4F8B738];
    v32[3] = v22;
    uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
    [v18 addObjectsFromArray:v23];

    if (PLIsFeaturedContentAllowed())
    {
      uint64_t v24 = *MEMORY[0x1E4F8B740];
      v31[0] = *MEMORY[0x1E4F8B748];
      v31[1] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
      [v18 addObjectsFromArray:v25];
    }
  }
  id v26 = (void *)[v18 copy];
  [v4 setFetchAttributes:v26];

  id v27 = [NSString stringWithFormat:@"FieldMatch(_kMDItemDomainIdentifier, %@)", *MEMORY[0x1E4F8B758]];
  uint64_t v30 = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  [v4 setFilterQueries:v28];

  return v4;
}

+ (void)performSuggestionsSearch:(id)a3 queryQueue:(id)a4 suggestionsHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  uint64_t v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_14:
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 389, @"Invalid parameter not satisfying: %@", @"queryQueue" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_15;
  }
  id v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 388, @"Invalid parameter not satisfying: %@", @"suggestionsQuery" object file lineNumber description];

  if (!v10) {
    goto LABEL_14;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_15:
  uint64_t v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 390, @"Invalid parameter not satisfying: %@", @"suggestionsHandler" object file lineNumber description];

LABEL_4:
  id v12 = [v9 photosSuggestionsQuery];
  if (v12)
  {
    if (![v9 isCancelled])
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __72__PHSearchQuery_performSuggestionsSearch_queryQueue_suggestionsHandler___block_invoke;
      block[3] = &unk_1E58487E0;
      id v21 = v12;
      id v22 = v9;
      id v23 = v11;
      dispatch_async(v10, block);

      goto LABEL_12;
    }
    double v13 = [[PHSearchSuggestionQueryResult alloc] initWithSearchQuery:v9];
    (*((void (**)(id, PHSearchSuggestionQueryResult *, uint64_t, void))v11 + 2))(v11, v13, 2, 0);
  }
  else
  {
    v14 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(v9, "suggestionQueryIdentifier"));
      uint64_t v16 = [v9 searchText];
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "%{public}@ PHSearchQuery suggestions query unexpectedly nil for query: %@, suggestions will not be generated", buf, 0x16u);
    }
    double v13 = [[PHSearchSuggestionQueryResult alloc] initWithSearchQuery:v9];
    (*((void (**)(id, PHSearchSuggestionQueryResult *, uint64_t, void))v11 + 2))(v11, v13, 3, 0);
  }

LABEL_12:
}

void __72__PHSearchQuery_performSuggestionsSearch_queryQueue_suggestionsHandler___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) performQueryWithSearchResultAssetUUIDs:MEMORY[0x1E4F1CBF0] collectionUUIDs:MEMORY[0x1E4F1CBF0]];
  id v10 = 0;
  +[PHSearchProcessor searchSuggestionsFromPLSearchSuggestions:suggestions:queryId:batchId:rangeOfSuggestionText:](PHSearchProcessor, "searchSuggestionsFromPLSearchSuggestions:suggestions:queryId:batchId:rangeOfSuggestionText:", v2, &v10, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
  id v3 = v10;
  id v4 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", objc_msgSend(*(id *)(a1 + 40), "suggestionQueryIdentifier"));
    os_signpost_id_t v6 = [*(id *)(a1 + 40) searchText];
    uint64_t v7 = [*(id *)(a1 + 40) suggestionOptions];
    uint64_t v8 = [v3 count];
    *(_DWORD *)buf = 138544130;
    id v12 = v5;
    __int16 v13 = 2112;
    v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    uint64_t v18 = v8;
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Completed suggestion generation for search text: %@, with options: %@ and found %tu suggestions", buf, 0x2Au);
  }
  id v9 = [[PHSearchSuggestionQueryResult alloc] initWithSearchQuery:*(void *)(a1 + 40) searchSuggestions:v3];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (void)suggestionsForSearchQuery:(id)a3 searchQueryResult:(id)a4 rangeOfSuggestionText:(_NSRange)a5 queryQueue:(id)a6 suggestionsHandler:(id)a7
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = a6;
  id v17 = a7;
  if (v14)
  {
    if (v16) {
      goto LABEL_3;
    }
  }
  else
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 347, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];

    if (v16)
    {
LABEL_3:
      if (v15) {
        goto LABEL_4;
      }
LABEL_8:
      id v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 349, @"Invalid parameter not satisfying: %@", @"searchQueryResult" object file lineNumber description];

      if (v17) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 350, @"Invalid parameter not satisfying: %@", @"suggestionsHandler" object file lineNumber description];

      goto LABEL_5;
    }
  }
  id v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 348, @"Invalid parameter not satisfying: %@", @"queryQueue" object file lineNumber description];

  if (!v15) {
    goto LABEL_8;
  }
LABEL_4:
  if (!v17) {
    goto LABEL_9;
  }
LABEL_5:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke;
  block[3] = &unk_1E5846768;
  id v26 = v15;
  id v27 = v14;
  NSUInteger v29 = location;
  NSUInteger v30 = length;
  id v28 = v17;
  id v18 = v17;
  id v19 = v14;
  id v20 = v15;
  dispatch_async(v16, block);
}

void __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = [*(id *)(a1 + 32) searchResults];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke_2;
  id v28 = &unk_1E5846740;
  id v5 = v2;
  id v29 = v5;
  id v6 = v3;
  id v30 = v6;
  [v4 enumerateObjectsUsingBlock:&v25];

  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = (void *)[v5 copy];
  id v9 = (void *)[v6 copy];
  id v10 = objc_msgSend(v7, "_executePhotosEntityStoreSearchWithAssetUUIDs:collectionUUIDs:rangeOfSuggestionText:", v8, v9, *(void *)(a1 + 56), *(void *)(a1 + 64));

  int v11 = [*(id *)(a1 + 40) isCancelled];
  id v12 = [PHSearchSuggestionQueryResult alloc];
  if (v11) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v11) {
    id v14 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else {
    id v14 = v10;
  }
  id v15 = [(PHSearchSuggestionQueryResult *)v12 initWithSearchQuery:*(void *)(a1 + 40) searchSuggestions:v14];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v16 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [*(id *)(a1 + 40) batchIdentifier];
    id v18 = NSString;
    id v19 = *(void **)(a1 + 40);
    if (v17)
    {
      uint64_t v20 = [v19 batchIdentifier];
      uint64_t v24 = [*(id *)(a1 + 40) queryIdentifier];
      objc_msgSend(v18, "stringWithFormat:", @"[Batch: %d | Query: %d]", v20, v24, v25, v26, v27, v28, v29);
    }
    else
    {
      uint64_t v22 = [v19 queryIdentifier];
      objc_msgSend(v18, "stringWithFormat:", @"[Query: %d]", v22, v23, v25, v26, v27, v28, v29);
    id v21 = };
    *(_DWORD *)buf = 138543874;
    v32 = v21;
    __int16 v33 = 2050;
    uint64_t v34 = v13;
    __int16 v35 = 2112;
    uint64_t v36 = v10;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Suggestions for search query completed. Status: %{public}tu, Suggestions: %@", buf, 0x20u);
  }
}

void __113__PHSearchQuery_suggestionsForSearchQuery_searchQueryResult_rangeOfSuggestionText_queryQueue_suggestionsHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 type];
  if ((unint64_t)(v3 - 2) >= 3)
  {
    if (v3 != 1) {
      goto LABEL_6;
    }
    id v4 = *(void **)(a1 + 32);
  }
  else
  {
    id v4 = *(void **)(a1 + 40);
  }
  id v5 = [v6 uuid];
  [v4 addObject:v5];

LABEL_6:
}

+ (void)performSearch:(id)a3 queryQueue:(id)a4 resultsHandler:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_26:
    int v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 241, @"Invalid parameter not satisfying: %@", @"queryQueue" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_27;
  }
  id v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 240, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];

  if (!v10) {
    goto LABEL_26;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_27:
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2, a1, @"PHSearchQuery.m", 242, @"Invalid parameter not satisfying: %@", @"resultsHandler" object file lineNumber description];

LABEL_4:
  uint64_t v12 = [v9 batchIdentifier];
  uint64_t v13 = [v9 queryIdentifier];
  id v14 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v12, v13);
    }
    else {
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v13, v33);
    }
    *(_DWORD *)buf = 138543618;
    id v41 = v15;
    __int16 v42 = 2112;
    id v43 = v9;
    _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Perform Search: %@", buf, 0x16u);
  }
  uint64_t v16 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v12, v13);
    }
    else {
    int v17 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v13, v33);
    }
    id v18 = [v9 searchOptions];
    *(_DWORD *)buf = 138543618;
    id v41 = v17;
    __int16 v42 = 2114;
    id v43 = v18;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Search Options: %{public}@", buf, 0x16u);
  }
  id v19 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v12, v13);
    }
    else {
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v13, v33);
    }
    id v21 = [v9 queryStringSentToSpotlight];
    *(_DWORD *)buf = 138543618;
    id v41 = v20;
    __int16 v42 = 2112;
    id v43 = v21;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ Query string sent to Spotlight: %@", buf, 0x16u);
  }
  uint64_t v22 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    if (v12) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", v12, v13);
    }
    else {
    uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", v13, v33);
    }
    uint64_t v24 = [v9 searchText];
    uint64_t v25 = [v24 string];
    *(_DWORD *)buf = 138543618;
    id v41 = v23;
    __int16 v42 = 2112;
    id v43 = v25;
    _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ Plain text query string: %@", buf, 0x16u);
  }
  uint64_t v26 = [MEMORY[0x1E4F1C9C8] now];
  [v9 setStartDate:v26];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke;
  block[3] = &unk_1E5848A60;
  id v36 = v10;
  id v37 = v11;
  id v35 = v9;
  int v38 = v12;
  int v39 = v13;
  id v27 = v10;
  id v28 = v11;
  id v29 = v9;
  dispatch_async(v27, block);
}

void __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isCancelled])
  {
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    [*(id *)(a1 + 32) setEndDate:v2];

    uint64_t v3 = *(void *)(a1 + 48);
    id v15 = [[PHSearchQueryResult alloc] initWithSearchQuery:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  else
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F8AC58]) initWithQueue:*(void *)(a1 + 40) name:@"PHSearchQuery performSearch"];
    *(void *)v61 = 0xE00000001;
    int v62 = 1;
    pid_t v63 = getpid();
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    size_t v28 = 648;
    LODWORD(v31) = 0;
    sysctl(v61, 4u, &v29, &v28, 0, 0);
    if ((v31 & 0x800) != 0)
    {
      double v7 = 1000000000.0;
    }
    else
    {
      id v5 = [*(id *)(a1 + 32) searchOptions];
      [v5 spotlightQueryTimeout];
      double v7 = v6;
    }
    uint64_t v8 = NSString;
    if (*(_DWORD *)(a1 + 56)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    }
    else {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 60));
    }
    id v10 = [v8 stringWithFormat:@"Spotlight query: %@", v9];
    id v11 = [v4 enterWithTimeout:v10 name:v7];

    *(void *)&long long v29 = 0;
    *((void *)&v29 + 1) = &v29;
    *(void *)&long long v30 = 0x3032000000;
    *((void *)&v30 + 1) = __Block_byref_object_copy__31194;
    *(void *)&long long v31 = __Block_byref_object_dispose__31195;
    *((void *)&v31 + 1) = 0;
    uint64_t v12 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_87;
    v21[3] = &unk_1E5846718;
    uint64_t v26 = &v29;
    id v13 = v11;
    id v22 = v13;
    id v23 = *(id *)(a1 + 32);
    id v24 = *(id *)(a1 + 40);
    uint64_t v27 = *(void *)(a1 + 56);
    id v25 = *(id *)(a1 + 48);
    [v12 _executeSpotlightSearchWithResultsHandler:v21];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_91;
    v16[3] = &unk_1E5848A60;
    id v14 = v13;
    id v17 = v14;
    id v18 = *(id *)(a1 + 32);
    uint64_t v20 = *(void *)(a1 + 56);
    id v19 = *(id *)(a1 + 48);
    [v4 notify:v16];

    _Block_object_dispose(&v29, 8);
  }
}

void __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_87(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, char a11, void *a12)
{
  id v45 = a2;
  id v44 = a3;
  id v43 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a10;
  id v25 = a12;
  uint64_t v26 = (void *)MEMORY[0x1E4F8B9B8];
  if (v25)
  {
    uint64_t v27 = [MEMORY[0x1E4F8B9B8] failureWithError:v25];
    uint64_t v28 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v27;
  }
  else
  {
    long long v30 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v31 = [v26 successWithResult:v30];

    uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v29 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = v31;
  }

  [*(id *)(a1 + 32) leaveWithResult:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  if (([*(id *)(a1 + 32) didTimeout] & 1) == 0)
  {
    long long v42 = v22;
    long long v33 = v21;
    long long v34 = v20;
    int v35 = [*(id *)(a1 + 40) isCancelled];
    char v36 = 0;
    uint64_t v37 = 3;
    if (!v25) {
      uint64_t v37 = 1;
    }
    if (v35) {
      uint64_t v37 = 2;
    }
    uint64_t v41 = v37;
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__31194;
    v64[4] = __Block_byref_object_dispose__31195;
    id v65 = 0;
    if (!v25 && (v35 & 1) == 0)
    {
      long long v38 = [*(id *)(a1 + 40) photosRetrievalSuggestionsQuery];
      if (v38 && [v45 count]) {
        char v36 = [*(id *)(a1 + 40) isCancelled] ^ 1;
      }
      else {
        char v36 = 0;
      }
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_2;
    block[3] = &unk_1E58466F0;
    char v62 = v36;
    long long v39 = *(NSObject **)(a1 + 48);
    id v47 = *(id *)(a1 + 40);
    id v20 = v34;
    id v48 = v34;
    id v21 = v33;
    id v49 = v33;
    long long v59 = v64;
    id v50 = v45;
    id v51 = v44;
    id v52 = v43;
    id v53 = v19;
    id v22 = v42;
    id v54 = v42;
    id v55 = v23;
    id v40 = v24;
    char v63 = a11;
    uint64_t v61 = *(void *)(a1 + 72);
    id v56 = v40;
    uint64_t v60 = v41;
    id v57 = v25;
    id v58 = *(id *)(a1 + 56);
    dispatch_async(v39, block);

    _Block_object_dispose(v64, 8);
  }
}

void __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_91(uint64_t a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) didTimeout])
  {
    [*(id *)(a1 + 40) cancel];
    id v2 = [*(id *)(a1 + 40) searchOptions];
    [v2 spotlightQueryTimeout];
    uint64_t v4 = v3;

    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28228];
    double v6 = NSString;
    if (*(_DWORD *)(a1 + 56)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
    }
    else {
    double v7 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 60), v14);
    }
    uint64_t v8 = [v6 stringWithFormat:@"Spotlight query: %@, timed out in %0.4fs", v7, v4];
    v27[0] = v8;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    id v10 = [v5 errorWithDomain:@"PHPhotosErrorDomain" code:6100 userInfo:v9];

    id v11 = [[PHSearchQueryResult alloc] initWithSearchQuery:*(void *)(a1 + 40)];
    uint64_t v12 = PLSearchBackendQueryGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      if (*(_DWORD *)(a1 + 56)) {
        objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));
      }
      else {
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 60), v15);
      }
      *(_DWORD *)buf = 138544386;
      id v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v4;
      __int16 v20 = 2048;
      uint64_t v21 = 3;
      __int16 v22 = 2112;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "%{public}@ Query timed out in %0.4fs, with status: %tu, error: %@, result: %@", buf, 0x34u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __57__PHSearchQuery_performSearch_queryQueue_resultsHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 152);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = objc_msgSend(v3, "_executePhotosEntityStoreSearchWithAssetUUIDs:collectionUUIDs:rangeOfSuggestionText:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0x7FFFFFFFFFFFFFFFLL, 0);
    char v5 = [*(id *)(a1 + 32) isCancelled];
    double v6 = [PHSearchQueryResult alloc];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v5)
    {
      uint64_t v8 = [(PHSearchQueryResult *)v6 initWithSearchQuery:v7];
    }
    else
    {
      LOBYTE(v28) = *(unsigned char *)(a1 + 153);
      uint64_t v8 = [(PHSearchQueryResult *)v6 initWithSearchQuery:v7 searchResults:*(void *)(a1 + 56) unfilteredAssetSearchResults:*(void *)(a1 + 64) rankedAssetSearchResults:*(void *)(a1 + 72) rankedCollectionSearchResults:*(void *)(a1 + 80) searchSuggestions:v4 queryMatchDetails:*(void *)(a1 + 88) annotatedQueryString:*(void *)(a1 + 96) queryStringReceivedFromSpotlight:*(void *)(a1 + 104) isUnsafeQuery:v28];
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 128) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v8;
  }
  else
  {
    char v9 = [v3 isCancelled];
    id v10 = [PHSearchQueryResult alloc];
    uint64_t v11 = *(void *)(a1 + 32);
    if (v9)
    {
      uint64_t v12 = [(PHSearchQueryResult *)v10 initWithSearchQuery:v11];
    }
    else
    {
      LOBYTE(v28) = *(unsigned char *)(a1 + 153);
      uint64_t v12 = [(PHSearchQueryResult *)v10 initWithSearchQuery:v11 searchResults:*(void *)(a1 + 56) unfilteredAssetSearchResults:*(void *)(a1 + 64) rankedAssetSearchResults:*(void *)(a1 + 72) rankedCollectionSearchResults:*(void *)(a1 + 80) searchSuggestions:MEMORY[0x1E4F1CBF0] queryMatchDetails:*(void *)(a1 + 88) annotatedQueryString:*(void *)(a1 + 96) queryStringReceivedFromSpotlight:*(void *)(a1 + 104) isUnsafeQuery:v28];
    }
    uint64_t v15 = *(void *)(*(void *)(a1 + 128) + 8);
    uint64_t v4 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v12;
  }

  uint64_t v16 = [MEMORY[0x1E4F1C9C8] now];
  [*(id *)(a1 + 32) setEndDate:v16];

  id v17 = [*(id *)(a1 + 32) endDate];
  __int16 v18 = [*(id *)(a1 + 32) startDate];
  [v17 timeIntervalSinceDate:v18];
  uint64_t v20 = v19;

  uint64_t v21 = PLSearchBackendQueryGetLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_DWORD *)(a1 + 144)) {
      objc_msgSend(NSString, "stringWithFormat:", @"[Batch: %d | Query: %d]", *(unsigned int *)(a1 + 144), *(unsigned int *)(a1 + 148));
    }
    else {
    __int16 v22 = objc_msgSend(NSString, "stringWithFormat:", @"[Query: %d]", *(unsigned int *)(a1 + 148), v27);
    }
    uint64_t v23 = *(void *)(a1 + 112);
    uint64_t v24 = *(void *)(a1 + 136);
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
    *(_DWORD *)buf = 138544386;
    long long v30 = v22;
    __int16 v31 = 2050;
    uint64_t v32 = v20;
    __int16 v33 = 2050;
    uint64_t v34 = v24;
    __int16 v35 = 2112;
    uint64_t v36 = v23;
    __int16 v37 = 2112;
    uint64_t v38 = v25;
    _os_log_impl(&dword_19B043000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Query completed in %{public}0.4fs, with status: %{public}tu, error: %@, result: %@", buf, 0x34u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 120) + 16))();
}

@end