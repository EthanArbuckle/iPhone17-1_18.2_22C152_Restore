@interface PHSearchSuggestionQueryResult
- (NSArray)searchSuggestions;
- (PHSearchQuery)searchQuery;
- (PHSearchSuggestionQueryResult)initWithSearchQuery:(id)a3;
- (PHSearchSuggestionQueryResult)initWithSearchQuery:(id)a3 searchSuggestions:(id)a4;
- (id)description;
- (id)jsonDictionary;
@end

@implementation PHSearchSuggestionQueryResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSuggestions, 0);

  objc_storeStrong((id *)&self->_searchQuery, 0);
}

- (NSArray)searchSuggestions
{
  return self->_searchSuggestions;
}

- (PHSearchQuery)searchQuery
{
  return self->_searchQuery;
}

- (id)jsonDictionary
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHSearchSuggestionQueryResult *)self searchSuggestions];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __47__PHSearchSuggestionQueryResult_jsonDictionary__block_invoke;
  v16 = &unk_1E58455A8;
  id v17 = v3;
  id v5 = v3;
  [v4 enumerateObjectsUsingBlock:&v13];

  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v18[0] = @"searchQuery";
  v7 = [(PHSearchSuggestionQueryResult *)self searchQuery];
  v8 = [v7 jsonDictionary];
  v18[1] = @"searchSuggestions";
  v19[0] = v8;
  v19[1] = v5;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  v10 = (void *)[v6 initWithDictionary:v9];

  v11 = (void *)[v10 copy];

  return v11;
}

void __47__PHSearchSuggestionQueryResult_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 jsonDictionary];
  [v2 addObject:v3];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"Suggestion Query: %d, ", -[PHSearchQuery suggestionQueryIdentifier](self->_searchQuery, "suggestionQueryIdentifier")];
  [v3 appendFormat:@"%tu suggestions, ", -[NSArray count](self->_searchSuggestions, "count")];
  v4 = (void *)[v3 copy];

  return v4;
}

- (PHSearchSuggestionQueryResult)initWithSearchQuery:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"PHSearchSuggestionQueryResult.m", 30, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];
  }
  id v6 = [(PHSearchSuggestionQueryResult *)self initWithSearchQuery:v5 searchSuggestions:0];

  return v6;
}

- (PHSearchSuggestionQueryResult)initWithSearchQuery:(id)a3 searchSuggestions:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PHSearchSuggestionQueryResult.m", 17, @"Invalid parameter not satisfying: %@", @"searchQuery" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PHSearchSuggestionQueryResult;
  v10 = [(PHSearchSuggestionQueryResult *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_searchQuery, a3);
    objc_storeStrong((id *)&v11->_searchSuggestions, a4);
  }

  return v11;
}

@end