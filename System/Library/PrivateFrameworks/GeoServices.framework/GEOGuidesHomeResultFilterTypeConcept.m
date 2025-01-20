@interface GEOGuidesHomeResultFilterTypeConcept
- (GEOGuidesHomeResultFilterTypeConcept)initWithGuidesHomeResultFilterTypeConcept:(id)a3;
- (GEOPDGuidesHomeResultFilterTypeConcept)conceptFilter;
- (GEORelatedSearchSuggestion)searchSuggestion;
@end

@implementation GEOGuidesHomeResultFilterTypeConcept

- (GEOGuidesHomeResultFilterTypeConcept)initWithGuidesHomeResultFilterTypeConcept:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOGuidesHomeResultFilterTypeConcept;
  v6 = [(GEOGuidesHomeResultFilterTypeConcept *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_conceptFilter, a3);
  }

  return v7;
}

- (GEORelatedSearchSuggestion)searchSuggestion
{
  v3 = [GEORelatedSearchSuggestion alloc];
  v4 = -[GEOPDGuidesHomeResultFilterTypeConcept relatedSearchSuggestion]((id *)&self->_conceptFilter->super.super.isa);
  id v5 = [(GEORelatedSearchSuggestion *)v3 initWithPDRelatedSearchSuggestion:v4];

  return v5;
}

- (GEOPDGuidesHomeResultFilterTypeConcept)conceptFilter
{
  return self->_conceptFilter;
}

- (void).cxx_destruct
{
}

@end