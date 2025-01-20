@interface PHSearchSuggestionOptions
- (BOOL)limitSuggestionsToExactTextMatches;
- (BOOL)wantsUnscopedSuggestions;
- (NSIndexSet)suggestionCategories;
- (OS_dispatch_queue)suggestionsHandlerQueue;
- (PHSearchSuggestionOptions)init;
- (id)_suggestionCategoriesTypeDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)jsonDictionary;
- (unint64_t)suggestionLimit;
- (unint64_t)suggestionResultTypes;
- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3;
- (void)setSuggestionCategories:(id)a3;
- (void)setSuggestionLimit:(unint64_t)a3;
- (void)setSuggestionResultTypes:(unint64_t)a3;
- (void)setSuggestionsHandlerQueue:(id)a3;
- (void)setWantsUnscopedSuggestions:(BOOL)a3;
@end

@implementation PHSearchSuggestionOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionsHandlerQueue, 0);

  objc_storeStrong((id *)&self->_suggestionCategories, 0);
}

- (void)setWantsUnscopedSuggestions:(BOOL)a3
{
  self->_wantsUnscopedSuggestions = a3;
}

- (BOOL)wantsUnscopedSuggestions
{
  return self->_wantsUnscopedSuggestions;
}

- (void)setLimitSuggestionsToExactTextMatches:(BOOL)a3
{
  self->_limitSuggestionsToExactTextMatches = a3;
}

- (BOOL)limitSuggestionsToExactTextMatches
{
  return self->_limitSuggestionsToExactTextMatches;
}

- (void)setSuggestionsHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)suggestionsHandlerQueue
{
  return self->_suggestionsHandlerQueue;
}

- (void)setSuggestionCategories:(id)a3
{
}

- (NSIndexSet)suggestionCategories
{
  return self->_suggestionCategories;
}

- (void)setSuggestionLimit:(unint64_t)a3
{
  self->_suggestionLimit = a3;
}

- (unint64_t)suggestionLimit
{
  return self->_suggestionLimit;
}

- (void)setSuggestionResultTypes:(unint64_t)a3
{
  self->_suggestionResultTypes = a3;
}

- (unint64_t)suggestionResultTypes
{
  return self->_suggestionResultTypes;
}

- (id)_suggestionCategoriesTypeDescription
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = [(PHSearchSuggestionOptions *)self suggestionCategories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PHSearchSuggestionOptions__suggestionCategoriesTypeDescription__block_invoke;
  v8[3] = &unk_1E5847D40;
  id v9 = v3;
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:v8];

  v6 = (void *)[v5 copy];

  return v6;
}

void __65__PHSearchSuggestionOptions__suggestionCategoriesTypeDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 0x29) {
    id v3 = @"PHSearchSuggestionCategoriesTypeUndefined";
  }
  else {
    id v3 = off_1E5844490[a2 - 1];
  }
  v4 = v3;
  [*(id *)(a1 + 32) addObject:v4];
}

- (id)jsonDictionary
{
  v14[5] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v13[0] = @"suggestionLimit";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PHSearchSuggestionOptions suggestionLimit](self, "suggestionLimit"));
  v14[0] = v4;
  v13[1] = @"searchQueryResultTypes";
  id v5 = PHSearchQueryResultTypesDescription([(PHSearchSuggestionOptions *)self suggestionResultTypes]);
  v14[1] = v5;
  v13[2] = @"suggestionCategories";
  v6 = [(PHSearchSuggestionOptions *)self _suggestionCategoriesTypeDescription];
  v14[2] = v6;
  v13[3] = @"limitToExactMatches";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchSuggestionOptions limitSuggestionsToExactTextMatches](self, "limitSuggestionsToExactTextMatches"));
  v14[3] = v7;
  v13[4] = @"wantsUnscopedSuggestions";
  v8 = objc_msgSend(NSNumber, "numberWithBool:", -[PHSearchSuggestionOptions wantsUnscopedSuggestions](self, "wantsUnscopedSuggestions"));
  v14[4] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  v10 = (void *)[v3 initWithDictionary:v9];

  v11 = (void *)[v10 copy];

  return v11;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@"SuggestionLimit: %tu, ", self->_suggestionLimit];
  v4 = [(PHSearchSuggestionOptions *)self _suggestionCategoriesTypeDescription];
  [v3 appendFormat:@"SuggestionCategories: %@, ", v4];

  id v5 = PHSearchQueryResultTypesDescription([(PHSearchSuggestionOptions *)self suggestionResultTypes]);
  [v3 appendFormat:@"ResultTypes: %@, ", v5];

  if (self->_limitSuggestionsToExactTextMatches) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  [v3 appendFormat:@"LimitToExactMatches: %@, ", v6];
  if (self->_wantsUnscopedSuggestions) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  [v3 appendFormat:@"WantsUnscopedSuggestions: %@", v7];
  v8 = (void *)[v3 copy];

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(PHSearchSuggestionOptions);
  [(PHSearchSuggestionOptions *)v4 setSuggestionResultTypes:self->_suggestionResultTypes];
  [(PHSearchSuggestionOptions *)v4 setSuggestionsHandlerQueue:self->_suggestionsHandlerQueue];
  [(PHSearchSuggestionOptions *)v4 setSuggestionLimit:self->_suggestionLimit];
  [(PHSearchSuggestionOptions *)v4 setSuggestionCategories:self->_suggestionCategories];
  [(PHSearchSuggestionOptions *)v4 setLimitSuggestionsToExactTextMatches:self->_limitSuggestionsToExactTextMatches];
  [(PHSearchSuggestionOptions *)v4 setWantsUnscopedSuggestions:self->_wantsUnscopedSuggestions];
  return v4;
}

- (PHSearchSuggestionOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHSearchSuggestionOptions;
  result = [(PHSearchSuggestionOptions *)&v3 init];
  if (result) {
    result->_suggestionResultTypes = 1;
  }
  return result;
}

@end