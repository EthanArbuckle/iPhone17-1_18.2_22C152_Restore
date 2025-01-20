@interface EMSearchableIndexSuggestionsQueryResult
- (EMSearchableIndexSuggestionsQueryResult)initWithSuggestions:(id)a3;
- (NSArray)suggestions;
@end

@implementation EMSearchableIndexSuggestionsQueryResult

- (EMSearchableIndexSuggestionsQueryResult)initWithSuggestions:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EMSearchableIndexSuggestionsQueryResult;
  v5 = [(EMSearchableIndexSuggestionsQueryResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    suggestions = v5->_suggestions;
    v5->_suggestions = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (void).cxx_destruct
{
}

@end