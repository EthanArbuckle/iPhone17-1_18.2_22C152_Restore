@interface GEOMapsSearchHomeSection
- (BOOL)dataModelIsValid:(id)a3;
- (GEOCollectionSuggestionResult)collectionSuggestions;
- (GEOGuideLocationSuggestionResults)guideLocationSuggestsions;
- (GEOMapsSearchHomeSection)initWithMapsSearchHomeSection:(id)a3 mapsResults:(id)a4;
- (GEOPublisherSuggestionResult)publisherSuggestions;
- (NSArray)searchCategories;
- (NSString)name;
- (id)description;
- (unint64_t)sectionType;
@end

@implementation GEOMapsSearchHomeSection

- (GEOMapsSearchHomeSection)initWithMapsSearchHomeSection:(id)a3 mapsResults:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  if ([(GEOMapsSearchHomeSection *)self dataModelIsValid:v6])
  {
    v56.receiver = self;
    v56.super_class = (Class)GEOMapsSearchHomeSection;
    self = [(GEOMapsSearchHomeSection *)&v56 init];
    if (self)
    {
      v8 = -[GEOPDMapsSearchHomeSection name](v6);
      v9 = (NSString *)[v8 copy];
      name = self->_name;
      self->_name = v9;

      switch(-[GEOPDMapsSearchHomeSection sectionType]((uint64_t)v6))
      {
        case 0u:
          self->_sectionType = 0;
          break;
        case 1u:
          self->_sectionType = 1;
          v11 = (void *)MEMORY[0x1E4F1CA48];
          -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult](v6);
          v12 = (id *)objc_claimAutoreleasedReturnValue();
          v13 = -[GEOPDSearchBrowseCategorySuggestionResult categorys](v12);
          objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v13, "count"));
          id v14 = (id)objc_claimAutoreleasedReturnValue();

          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult](v6);
          v15 = (id *)objc_claimAutoreleasedReturnValue();
          v16 = -[GEOPDSearchBrowseCategorySuggestionResult categorys](v15);

          uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v53;
            do
            {
              uint64_t v20 = 0;
              do
              {
                if (*(void *)v53 != v19) {
                  objc_enumerationMutation(v16);
                }
                v21 = [[GEOSearchCategory alloc] initWithBrowseCategory:*(void *)(*((void *)&v52 + 1) + 8 * v20)];
                if (v21) {
                  [v14 addObject:v21];
                }

                ++v20;
              }
              while (v18 != v20);
              uint64_t v18 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
            }
            while (v18);
          }

          if ([v14 count])
          {
            v22 = (NSArray *)[v14 copy];
            p_searchCategories = &self->_searchCategories;
            searchCategories = self->_searchCategories;
            self->_searchCategories = v22;
          }
          else
          {
            p_searchCategories = &self->_searchCategories;
            searchCategories = self->_searchCategories;
            self->_searchCategories = 0;
          }

          v31 = *p_searchCategories;
          goto LABEL_23;
        case 2u:
          self->_sectionType = 2;
          v25 = [MEMORY[0x1E4F1CA48] array];
          v50[0] = MEMORY[0x1E4F143A8];
          v50[1] = 3221225472;
          v50[2] = __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke;
          v50[3] = &unk_1E53D78A8;
          v51 = v25;
          id v14 = v25;
          [v7 enumerateObjectsUsingBlock:v50];
          v26 = [GEOCollectionSuggestionResult alloc];
          v27 = -[GEOPDMapsSearchHomeSection collectionSuggestionResult](v6);
          v28 = (void *)[v14 copy];
          v29 = [(GEOCollectionSuggestionResult *)v26 initWithCollectionSuggestionResult:v27 mapsResults:v28];
          collectionSuggestions = self->_collectionSuggestions;
          self->_collectionSuggestions = v29;

          v31 = self->_collectionSuggestions;
          v32 = v51;
          goto LABEL_18;
        case 3u:
          self->_sectionType = 3;
          v33 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v45 = MEMORY[0x1E4F143A8];
          uint64_t v46 = 3221225472;
          v47 = __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke_2;
          v48 = &unk_1E53D78A8;
          v49 = v33;
          id v14 = v33;
          [v7 enumerateObjectsUsingBlock:&v45];
          v34 = [GEOPublisherSuggestionResult alloc];
          v35 = -[GEOPDMapsSearchHomeSection publisherSuggestionResult](v6);
          v36 = objc_msgSend(v14, "copy", v45, v46, v47, v48);
          v37 = [(GEOPublisherSuggestionResult *)v34 initWithPublisherSuggestionResult:v35 mapsResults:v36];
          publisherSuggestions = self->_publisherSuggestions;
          self->_publisherSuggestions = v37;

          v31 = self->_publisherSuggestions;
          v32 = v49;
LABEL_18:

LABEL_23:
          if (v31) {
            break;
          }
          goto LABEL_20;
        case 5u:
          self->_sectionType = 4;
          v39 = [GEOGuideLocationSuggestionResults alloc];
          v40 = -[GEOPDMapsSearchHomeSection guidesLocationsSuggestionResult](v6);
          v41 = [(GEOGuideLocationSuggestionResults *)v39 initWithGuideLocationSuggestionResult:v40 mapsResults:v7];
          guideLocationSuggestsions = self->_guideLocationSuggestsions;
          self->_guideLocationSuggestsions = v41;

          if (!self->_guideLocationSuggestsions) {
            goto LABEL_20;
          }
          break;
        default:
          break;
      }
    }
    self = self;
    v43 = self;
  }
  else
  {
LABEL_20:
    v43 = 0;
  }

  return v43;
}

void __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] == 2 && objc_msgSend(v3, "hasCollection")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __70__GEOMapsSearchHomeSection_initWithMapsSearchHomeSection_mapsResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] == 3 && objc_msgSend(v3, "hasPublisher")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (BOOL)dataModelIsValid:(id)a3
{
  id v3 = (id *)a3;
  BOOL v4 = 0;
  switch(-[GEOPDMapsSearchHomeSection sectionType]((uint64_t)v3))
  {
    case 1u:
      v5 = -[GEOPDMapsSearchHomeSection searchBrowseCategorySuggestionResult](v3);
      goto LABEL_6;
    case 2u:
      v5 = -[GEOPDMapsSearchHomeSection collectionSuggestionResult](v3);
      goto LABEL_6;
    case 3u:
      v5 = -[GEOPDMapsSearchHomeSection publisherSuggestionResult](v3);
      goto LABEL_6;
    case 5u:
      v5 = -[GEOPDMapsSearchHomeSection guidesLocationsSuggestionResult](v3);
LABEL_6:
      BOOL v4 = v5 != 0;

      break;
    default:
      break;
  }

  return v4;
}

- (id)description
{
  switch([(GEOMapsSearchHomeSection *)self sectionType])
  {
    case 0uLL:
      uint64_t v3 = 0;
      BOOL v4 = @"Unknown";
      break;
    case 1uLL:
      v5 = [(GEOMapsSearchHomeSection *)self searchCategories];
      uint64_t v3 = [v5 count];

      BOOL v4 = @"Browse Categories";
      break;
    case 2uLL:
      v6 = [(GEOMapsSearchHomeSection *)self collectionSuggestions];
      id v7 = [v6 collections];
      uint64_t v3 = [v7 count];

      BOOL v4 = @"Curated Collections";
      break;
    case 3uLL:
      v8 = [(GEOMapsSearchHomeSection *)self publisherSuggestions];
      v9 = [v8 publishers];
      uint64_t v3 = [v9 count];

      BOOL v4 = @"Publishers";
      break;
    case 4uLL:
      v10 = [(GEOMapsSearchHomeSection *)self guideLocationSuggestsions];
      v11 = [v10 guideLocations];
      uint64_t v3 = [v11 count];

      BOOL v4 = @"Guide Location Suggestion";
      break;
    default:
      BOOL v4 = 0;
      uint64_t v3 = 0;
      break;
  }
  v12 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapsSearchHomeSection;
  v13 = [(GEOMapsSearchHomeSection *)&v16 description];
  id v14 = [v12 stringWithFormat:@"%@. %@, %lu objects", v13, v4, v3];

  return v14;
}

- (GEOCollectionSuggestionResult)collectionSuggestions
{
  return self->_collectionSuggestions;
}

- (NSString)name
{
  return self->_name;
}

- (GEOPublisherSuggestionResult)publisherSuggestions
{
  return self->_publisherSuggestions;
}

- (NSArray)searchCategories
{
  return self->_searchCategories;
}

- (GEOGuideLocationSuggestionResults)guideLocationSuggestsions
{
  return self->_guideLocationSuggestsions;
}

- (unint64_t)sectionType
{
  return self->_sectionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guideLocationSuggestsions, 0);
  objc_storeStrong((id *)&self->_searchCategories, 0);
  objc_storeStrong((id *)&self->_publisherSuggestions, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_collectionSuggestions, 0);
}

@end