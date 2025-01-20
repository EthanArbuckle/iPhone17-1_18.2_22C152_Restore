@interface GEOMapItemChildActionSearch
- (GEOMapItemChildActionSearch)initWithChildActionSearch:(id)a3;
- (GEORelatedSearchSuggestion)relatedSearchSuggestion;
- (NSString)displayString;
- (void)setRelatedSearchSuggestion:(id)a3;
@end

@implementation GEOMapItemChildActionSearch

- (GEOMapItemChildActionSearch)initWithChildActionSearch:(id)a3
{
  v4 = (id *)a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapItemChildActionSearch;
  v5 = [(GEOMapItemChildActionSearch *)&v12 init];
  if (v5)
  {
    v6 = -[GEOPDChildActionSearch relatedSearchSuggestion](v4);

    if (v6)
    {
      v7 = [GEORelatedSearchSuggestion alloc];
      v8 = -[GEOPDChildActionSearch relatedSearchSuggestion](v4);
      uint64_t v9 = [(GEORelatedSearchSuggestion *)v7 initWithPDRelatedSearchSuggestion:v8];
      relatedSearchSuggestion = v5->_relatedSearchSuggestion;
      v5->_relatedSearchSuggestion = (GEORelatedSearchSuggestion *)v9;
    }
  }

  return v5;
}

- (NSString)displayString
{
  v2 = [(GEOMapItemChildActionSearch *)self relatedSearchSuggestion];
  v3 = [v2 displayString];

  return (NSString *)v3;
}

- (GEORelatedSearchSuggestion)relatedSearchSuggestion
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