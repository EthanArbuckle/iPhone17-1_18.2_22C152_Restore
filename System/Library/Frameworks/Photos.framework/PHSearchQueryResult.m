@interface PHSearchQueryResult
- (BOOL)isUnsafeQuery;
- (NSArray)rankedAssetSearchResults;
- (NSArray)rankedCollectionSearchResults;
- (NSArray)searchResults;
- (NSArray)searchSuggestions;
- (NSArray)unfilteredAssetSearchResults;
- (NSAttributedString)annotatedQueryString;
- (NSAttributedString)queryStringReceivedFromSpotlight;
- (PHSearchQuery)searchQuery;
- (PHSearchQueryMatchDetails)queryMatchDetails;
- (PHSearchQueryResult)initWithSearchQuery:(id)a3;
- (PHSearchQueryResult)initWithSearchQuery:(id)a3 searchResults:(id)a4 unfilteredAssetSearchResults:(id)a5 rankedAssetSearchResults:(id)a6 rankedCollectionSearchResults:(id)a7 searchSuggestions:(id)a8 queryMatchDetails:(id)a9 annotatedQueryString:(id)a10 queryStringReceivedFromSpotlight:(id)a11 isUnsafeQuery:(BOOL)a12;
- (id)description;
- (id)jsonDictionary;
- (id)redactedDescription;
@end

@implementation PHSearchQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unfilteredAssetSearchResults, 0);
  objc_storeStrong((id *)&self->_queryStringReceivedFromSpotlight, 0);
  objc_storeStrong((id *)&self->_annotatedQueryString, 0);
  objc_storeStrong((id *)&self->_queryMatchDetails, 0);
  objc_storeStrong((id *)&self->_searchSuggestions, 0);
  objc_storeStrong((id *)&self->_rankedCollectionSearchResults, 0);
  objc_storeStrong((id *)&self->_rankedAssetSearchResults, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);

  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (NSArray)unfilteredAssetSearchResults
{
  return self->_unfilteredAssetSearchResults;
}

- (NSAttributedString)queryStringReceivedFromSpotlight
{
  return self->_queryStringReceivedFromSpotlight;
}

- (BOOL)isUnsafeQuery
{
  return self->_isUnsafeQuery;
}

- (NSAttributedString)annotatedQueryString
{
  return self->_annotatedQueryString;
}

- (PHSearchQueryMatchDetails)queryMatchDetails
{
  return self->_queryMatchDetails;
}

- (NSArray)searchSuggestions
{
  return self->_searchSuggestions;
}

- (NSArray)rankedCollectionSearchResults
{
  return self->_rankedCollectionSearchResults;
}

- (NSArray)rankedAssetSearchResults
{
  return self->_rankedAssetSearchResults;
}

- (NSArray)searchResults
{
  return self->_searchResults;
}

- (PHSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (id)jsonDictionary
{
  v52[10] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHSearchQueryResult *)self rankedAssetSearchResults];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke;
  v49[3] = &unk_1E5843618;
  id v5 = v3;
  id v50 = v5;
  [v4 enumerateObjectsUsingBlock:v49];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v7 = [(PHSearchQueryResult *)self rankedCollectionSearchResults];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_2;
  v47[3] = &unk_1E5843618;
  id v8 = v6;
  id v48 = v8;
  [v7 enumerateObjectsUsingBlock:v47];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10 = [(PHSearchQueryResult *)self searchResults];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_3;
  v45[3] = &unk_1E5843618;
  id v11 = v9;
  id v46 = v11;
  [v10 enumerateObjectsUsingBlock:v45];

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13 = [(PHSearchQueryResult *)self unfilteredAssetSearchResults];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_4;
  v43[3] = &unk_1E5843618;
  id v14 = v12;
  id v44 = v14;
  [v13 enumerateObjectsUsingBlock:v43];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v16 = [(PHSearchQueryResult *)self searchSuggestions];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __37__PHSearchQueryResult_jsonDictionary__block_invoke_5;
  v41[3] = &unk_1E58455A8;
  id v17 = v15;
  id v42 = v17;
  [v16 enumerateObjectsUsingBlock:v41];

  id v32 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v51[0] = @"searchQuery";
  v35 = [(PHSearchQueryResult *)self searchQuery];
  v34 = [v35 jsonDictionary];
  v52[0] = v34;
  v52[1] = v11;
  v37 = v14;
  v38 = v11;
  v51[1] = @"searchResults";
  v51[2] = @"unfilteredResults";
  v52[2] = v14;
  v52[3] = v5;
  v39 = v8;
  v40 = v5;
  v51[3] = @"topAssets";
  v51[4] = @"topCollections";
  v52[4] = v8;
  v52[5] = v17;
  v36 = v17;
  v51[5] = @"searchSuggestions";
  v51[6] = @"queryMatchDetails";
  v33 = [(PHSearchQueryResult *)self queryMatchDetails];
  uint64_t v18 = [v33 jsonDictionary];
  v19 = (void *)v18;
  if (!v18)
  {
    uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v18;
  v52[6] = v18;
  v51[7] = @"isUnsafeQuery";
  v20 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchQueryResult isUnsafeQuery](self, "isUnsafeQuery"));
  v52[7] = v20;
  v51[8] = @"annotatedQueryString";
  v21 = [(PHSearchQueryResult *)self annotatedQueryString];
  v22 = [v21 description];
  v23 = v22;
  if (!v22)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v52[8] = v23;
  v51[9] = @"queryStringReceivedFromSpotlight";
  v24 = [(PHSearchQueryResult *)self queryStringReceivedFromSpotlight];
  v25 = [v24 description];
  v26 = v25;
  if (!v25)
  {
    v26 = [MEMORY[0x1E4F1CA98] null];
  }
  v52[9] = v26;
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:10];
  v28 = (void *)[v32 initWithDictionary:v27];

  if (!v25) {
  if (!v22)
  }

  if (!v19) {
  v29 = (void *)[v28 copy];
  }

  return v29;
}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 jsonDictionary];
  [v2 addObject:v3];
}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 jsonDictionary];
  [v2 addObject:v3];
}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 jsonDictionary];
  [v2 addObject:v3];
}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 jsonDictionary];
  [v2 addObject:v3];
}

void __37__PHSearchQueryResult_jsonDictionary__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 jsonDictionary];
  [v2 addObject:v3];
}

- (id)redactedDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"Query: %d, ", -[PHSearchQuery queryIdentifier](self->_searchQuery, "queryIdentifier")];
  if ([(PHSearchQuery *)self->_searchQuery batchIdentifier]) {
    [v3 appendFormat:@"Batch: %d, ", -[PHSearchQuery batchIdentifier](self->_searchQuery, "batchIdentifier")];
  }
  [v3 appendFormat:@"%tu results, ", -[NSArray count](self->_searchResults, "count")];
  [v3 appendFormat:@"%tu unfiltered results, ", -[NSArray count](self->_unfilteredAssetSearchResults, "count")];
  [v3 appendFormat:@"%tu top assets, ", -[NSArray count](self->_rankedAssetSearchResults, "count")];
  [v3 appendFormat:@"%tu top collections, ", -[NSArray count](self->_rankedCollectionSearchResults, "count")];
  objc_msgSend(v3, "appendFormat:", @"%tu suggestions", -[NSArray count](self->_searchSuggestions, "count"));
  v4 = (void *)[v3 copy];

  return v4;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"Query: %d, ", -[PHSearchQuery queryIdentifier](self->_searchQuery, "queryIdentifier")];
  if ([(PHSearchQuery *)self->_searchQuery batchIdentifier]) {
    [v3 appendFormat:@"Batch: %d, ", -[PHSearchQuery batchIdentifier](self->_searchQuery, "batchIdentifier")];
  }
  [v3 appendFormat:@"%tu results, ", -[NSArray count](self->_searchResults, "count")];
  [v3 appendFormat:@"%tu unfiltered results, ", -[NSArray count](self->_unfilteredAssetSearchResults, "count")];
  [v3 appendFormat:@"%tu top assets, ", -[NSArray count](self->_rankedAssetSearchResults, "count")];
  [v3 appendFormat:@"%tu top collections, ", -[NSArray count](self->_rankedCollectionSearchResults, "count")];
  [v3 appendFormat:@"%tu suggestions, ", -[NSArray count](self->_searchSuggestions, "count")];
  [v3 appendFormat:@"match details: %@, ", self->_queryMatchDetails];
  if (self->_isUnsafeQuery) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [v3 appendFormat:@"isUnsafe: %@, ", v4];
  [v3 appendFormat:@"Spotlight annotated query: %@", self->_queryStringReceivedFromSpotlight];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (PHSearchQueryResult)initWithSearchQuery:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"PHSearchQueryResult.m", 44, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];
  }
  id v6 = [v5 searchText];
  LOBYTE(v10) = 1;
  v7 = [(PHSearchQueryResult *)self initWithSearchQuery:v5 searchResults:MEMORY[0x1E4F1CBF0] unfilteredAssetSearchResults:MEMORY[0x1E4F1CBF0] rankedAssetSearchResults:MEMORY[0x1E4F1CBF0] rankedCollectionSearchResults:MEMORY[0x1E4F1CBF0] searchSuggestions:MEMORY[0x1E4F1CBF0] queryMatchDetails:0 annotatedQueryString:v6 queryStringReceivedFromSpotlight:0 isUnsafeQuery:v10];

  return v7;
}

- (PHSearchQueryResult)initWithSearchQuery:(id)a3 searchResults:(id)a4 unfilteredAssetSearchResults:(id)a5 rankedAssetSearchResults:(id)a6 rankedCollectionSearchResults:(id)a7 searchSuggestions:(id)a8 queryMatchDetails:(id)a9 annotatedQueryString:(id)a10 queryStringReceivedFromSpotlight:(id)a11 isUnsafeQuery:(BOOL)a12
{
  id v18 = a3;
  id v30 = a4;
  id v19 = a4;
  id v31 = a5;
  id v37 = a5;
  id v32 = a6;
  id v36 = a6;
  id v33 = a7;
  id v35 = a7;
  id v34 = a8;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (!v18)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PHSearchQueryResult.m", 23, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];
  }
  v38.receiver = self;
  v38.super_class = (Class)PHSearchQueryResult;
  v24 = [(PHSearchQueryResult *)&v38 init];
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_searchQuery, a3);
    objc_storeStrong((id *)&v25->_searchResults, v30);
    objc_storeStrong((id *)&v25->_unfilteredAssetSearchResults, v31);
    objc_storeStrong((id *)&v25->_rankedAssetSearchResults, v32);
    objc_storeStrong((id *)&v25->_rankedCollectionSearchResults, v33);
    objc_storeStrong((id *)&v25->_searchSuggestions, v34);
    objc_storeStrong((id *)&v25->_queryMatchDetails, a9);
    objc_storeStrong((id *)&v25->_annotatedQueryString, a10);
    objc_storeStrong((id *)&v25->_queryStringReceivedFromSpotlight, a11);
    v25->_isUnsafeQuery = a12;
  }

  return v25;
}

@end