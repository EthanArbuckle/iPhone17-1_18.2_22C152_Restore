@interface GEODisplayHeaderSubstitute
- (GEODisplayHeaderSubstitute)initWithPDDisplayHeaderSubstitute:(id)a3;
- (GEOPDDisplayHeaderSubstitute)displayHeaderSubstitute;
- (GEORelatedSearchSuggestion)relatedSearchSuggestion;
- (NSString)interpretedQuery;
- (int)substituteType;
- (void)setDisplayHeaderSubstitute:(id)a3;
- (void)setRelatedSearchSuggestion:(id)a3;
@end

@implementation GEODisplayHeaderSubstitute

- (GEODisplayHeaderSubstitute)initWithPDDisplayHeaderSubstitute:(id)a3
{
  v5 = (id *)a3;
  v13.receiver = self;
  v13.super_class = (Class)GEODisplayHeaderSubstitute;
  v6 = [(GEODisplayHeaderSubstitute *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_displayHeaderSubstitute, a3);
    v8 = -[GEOPDDisplayHeaderSubstitute relatedSearchSuggestion](v5);
    if (v8)
    {
      v9 = [[GEORelatedSearchSuggestion alloc] initWithPDRelatedSearchSuggestion:v8];
      relatedSearchSuggestion = v7->_relatedSearchSuggestion;
      v7->_relatedSearchSuggestion = v9;
    }
    v11 = v7;
  }
  return v7;
}

- (int)substituteType
{
  v2 = [(GEODisplayHeaderSubstitute *)self displayHeaderSubstitute];
  int v3 = -[GEOPDDisplayHeaderSubstitute substituteType]((uint64_t)v2);

  if (v3 == 2) {
    return 2;
  }
  else {
    return v3 == 1;
  }
}

- (NSString)interpretedQuery
{
  v2 = [(GEODisplayHeaderSubstitute *)self displayHeaderSubstitute];
  int v3 = -[GEOPDDisplayHeaderSubstitute interpretedQuery](v2);

  return (NSString *)v3;
}

- (GEOPDDisplayHeaderSubstitute)displayHeaderSubstitute
{
  return self->_displayHeaderSubstitute;
}

- (void)setDisplayHeaderSubstitute:(id)a3
{
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
  objc_storeStrong((id *)&self->_relatedSearchSuggestion, 0);

  objc_storeStrong((id *)&self->_displayHeaderSubstitute, 0);
}

@end