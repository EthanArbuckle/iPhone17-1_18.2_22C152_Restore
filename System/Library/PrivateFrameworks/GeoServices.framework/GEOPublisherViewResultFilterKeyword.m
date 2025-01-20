@interface GEOPublisherViewResultFilterKeyword
- (GEOPDPublisherViewResultFilterKeyword)keywordIdentifier;
- (GEOPublisherViewResultFilterKeyword)initWithFilterKeywordIdentifier:(id)a3;
- (GEORelatedSearchSuggestion)searchSuggestion;
@end

@implementation GEOPublisherViewResultFilterKeyword

- (GEOPublisherViewResultFilterKeyword)initWithFilterKeywordIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOPublisherViewResultFilterKeyword;
  v6 = [(GEOPublisherViewResultFilterKeyword *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_filterKeywordIdentifier, a3);
  }

  return v7;
}

- (GEORelatedSearchSuggestion)searchSuggestion
{
  v3 = [GEORelatedSearchSuggestion alloc];
  v4 = -[GEOPDPublisherViewResultFilterKeyword relatedSearchSuggestion]((id *)&self->_filterKeywordIdentifier->super.super.isa);
  id v5 = [(GEORelatedSearchSuggestion *)v3 initWithPDRelatedSearchSuggestion:v4];

  return v5;
}

- (GEOPDPublisherViewResultFilterKeyword)keywordIdentifier
{
  return self->_filterKeywordIdentifier;
}

- (void).cxx_destruct
{
}

@end