@interface GEOAllCollectionsViewResultFilterTypeKeyword
- (GEOAllCollectionsViewResultFilterTypeKeyword)initWithFilterKeywordIdentifier:(id)a3;
- (GEOPDAllCollectionsViewResultFilterTypeKeyword)keywordIdentifier;
- (GEORelatedSearchSuggestion)searchSuggestion;
@end

@implementation GEOAllCollectionsViewResultFilterTypeKeyword

- (GEOAllCollectionsViewResultFilterTypeKeyword)initWithFilterKeywordIdentifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOAllCollectionsViewResultFilterTypeKeyword;
  v6 = [(GEOAllCollectionsViewResultFilterTypeKeyword *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_filterKeywordIdentifier, a3);
  }

  return v7;
}

- (GEORelatedSearchSuggestion)searchSuggestion
{
  v3 = [GEORelatedSearchSuggestion alloc];
  v4 = -[GEOPDAllCollectionsViewResultFilterTypeKeyword relatedSearchSuggestion]((id *)&self->_filterKeywordIdentifier->super.super.isa);
  id v5 = [(GEORelatedSearchSuggestion *)v3 initWithPDRelatedSearchSuggestion:v4];

  return v5;
}

- (GEOPDAllCollectionsViewResultFilterTypeKeyword)keywordIdentifier
{
  return self->_filterKeywordIdentifier;
}

- (void).cxx_destruct
{
}

@end