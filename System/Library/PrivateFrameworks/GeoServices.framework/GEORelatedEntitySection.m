@interface GEORelatedEntitySection
- (GEORelatedCollectionSection)relatedCollectionSection;
- (GEORelatedEntitySection)init;
- (GEORelatedEntitySection)initWithRelatedEntitySection:(id)a3 mapsResults:(id)a4;
- (NSArray)relatedPlaceCollections;
- (NSString)name;
- (id)placeCollectionsWithCollectionSection:(id)a3;
- (int64_t)sectionType;
- (unsigned)index;
@end

@implementation GEORelatedEntitySection

- (GEORelatedEntitySection)init
{
  result = (GEORelatedEntitySection *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEORelatedEntitySection)initWithRelatedEntitySection:(id)a3 mapsResults:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GEORelatedEntitySection;
  v8 = [(GEORelatedEntitySection *)&v25 init];
  if (!v8) {
    goto LABEL_10;
  }
  int v9 = -[GEOPDRelatedEntitySection sectionType]((uint64_t)v6);
  if (v9)
  {
    if (v9 != 1) {
      goto LABEL_7;
    }
    uint64_t v10 = 1;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v8->_sectionType = v10;
LABEL_7:
  uint64_t v11 = -[GEOPDRelatedEntitySection name]((id *)v6);
  name = v8->_name;
  v8->_name = (NSString *)v11;

  if (v6)
  {
    v8->_index = *((_DWORD *)v6 + 13);
    -[GEOPDRelatedEntitySection _readRelatedCollectionSection]((uint64_t)v6);
    if (*((void *)v6 + 4))
    {
      v13 = [MEMORY[0x1E4F1CA48] array];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __68__GEORelatedEntitySection_initWithRelatedEntitySection_mapsResults___block_invoke;
      v23[3] = &unk_1E53D78A8;
      id v24 = v13;
      id v14 = v13;
      [v7 enumerateObjectsUsingBlock:v23];
      v15 = [GEORelatedCollectionSection alloc];
      v16 = -[GEOPDRelatedEntitySection relatedCollectionSection]((id *)v6);
      v17 = (void *)[v14 copy];
      uint64_t v18 = [(GEORelatedCollectionSection *)v15 initWithRelatedCollectionSection:v16 mapsResults:v17];
      relatedCollectionSection = v8->_relatedCollectionSection;
      v8->_relatedCollectionSection = (GEORelatedCollectionSection *)v18;

      uint64_t v20 = [(GEORelatedEntitySection *)v8 placeCollectionsWithCollectionSection:v8->_relatedCollectionSection];
      relatedPlaceCollections = v8->_relatedPlaceCollections;
      v8->_relatedPlaceCollections = (NSArray *)v20;
    }
  }
  else
  {
    v8->_index = 0;
  }
LABEL_10:

  return v8;
}

void __68__GEORelatedEntitySection_initWithRelatedEntitySection_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] == 2 && objc_msgSend(v3, "hasCollection")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)placeCollectionsWithCollectionSection:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)MEMORY[0x1E4F1CA48];
  v5 = [v3 collections];
  id v6 = objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = objc_msgSend(v3, "collections", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) collection];
        if (v12) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  v13 = (void *)[v6 copy];

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (unsigned)index
{
  return self->_index;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (GEORelatedCollectionSection)relatedCollectionSection
{
  return self->_relatedCollectionSection;
}

- (NSArray)relatedPlaceCollections
{
  return self->_relatedPlaceCollections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedPlaceCollections, 0);
  objc_storeStrong((id *)&self->_relatedCollectionSection, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end