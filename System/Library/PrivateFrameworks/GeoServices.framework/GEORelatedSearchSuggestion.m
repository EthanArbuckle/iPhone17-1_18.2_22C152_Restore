@interface GEORelatedSearchSuggestion
- (GEOPDRelatedSearchSuggestion)relatedSearchSuggestion;
- (GEORelatedSearchSuggestion)initWithPDRelatedSearchSuggestion:(id)a3;
- (NSString)displayString;
- (NSString)searchBarDisplayToken;
- (id)_suggestionEntryMetadata;
- (void)setRelatedSearchSuggestion:(id)a3;
@end

@implementation GEORelatedSearchSuggestion

- (GEORelatedSearchSuggestion)initWithPDRelatedSearchSuggestion:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORelatedSearchSuggestion;
  v6 = [(GEORelatedSearchSuggestion *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_relatedSearchSuggestion, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)displayString
{
  v2 = [(GEORelatedSearchSuggestion *)self relatedSearchSuggestion];
  v3 = -[GEOPDRelatedSearchSuggestion displayString](v2);

  return (NSString *)v3;
}

- (NSString)searchBarDisplayToken
{
  v2 = [(GEORelatedSearchSuggestion *)self relatedSearchSuggestion];
  v3 = -[GEOPDRelatedSearchSuggestion searchBarDisplayToken](v2);

  return (NSString *)v3;
}

- (id)_suggestionEntryMetadata
{
  v2 = [(GEORelatedSearchSuggestion *)self relatedSearchSuggestion];
  v3 = -[GEOPDRelatedSearchSuggestion suggestionEntryMetadata](v2);

  return v3;
}

- (GEOPDRelatedSearchSuggestion)relatedSearchSuggestion
{
  return self->_relatedSearchSuggestion;
}

- (void)setRelatedSearchSuggestion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end