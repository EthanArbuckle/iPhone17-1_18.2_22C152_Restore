@interface GEOSearchSectionGuide
- (GEOSearchSectionGuide)init;
- (GEOSearchSectionGuide)initWithPlaceCollections:(id)a3;
- (GEOSearchSectionGuide)initWithSearchSectionGuide:(id)a3 mapsResults:(id)a4;
- (NSArray)placeCollections;
@end

@implementation GEOSearchSectionGuide

- (GEOSearchSectionGuide)init
{
  result = (GEOSearchSectionGuide *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOSearchSectionGuide)initWithPlaceCollections:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v10.receiver = self;
    v10.super_class = (Class)GEOSearchSectionGuide;
    v5 = [(GEOSearchSectionGuide *)&v10 init];
    if (v5)
    {
      uint64_t v6 = [v4 copy];
      placeCollections = v5->_placeCollections;
      v5->_placeCollections = (NSArray *)v6;
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (GEOSearchSectionGuide)initWithSearchSectionGuide:(id)a3 mapsResults:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (id *)a3;
  id v7 = a4;
  if (v6 && [v6[2] count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __64__GEOSearchSectionGuide_initWithSearchSectionGuide_mapsResults___block_invoke;
    v68[3] = &unk_1E53D78A8;
    id v9 = v8;
    id v69 = v9;
    [v7 enumerateObjectsUsingBlock:v68];
    objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
    v11 = -[GEOPDSearchSectionGuide guideIds](v6);
    v12 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v11];
    v13 = [v10 setWithArray:v12];

    if ([v13 count])
    {
      v53 = v13;
      v54 = v6;
      id v51 = v7;
      v52 = self;
      v14 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v50 = v9;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v64 objects:v72 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v65 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            objc_msgSend(v20, "collection", v50);
            v21 = (id *)objc_claimAutoreleasedReturnValue();
            v22 = -[GEOPDCollectionResult collectionId](v21);

            if (v22)
            {
              v23 = [GEOMapItemIdentifier alloc];
              v24 = [v20 collection];
              v25 = -[GEOPDCollectionResult collectionId](v24);
              v26 = [(GEOMapItemIdentifier *)v23 initWithMapsIdentifier:v25];

              if (v26) {
                [v14 addObject:v26];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v64 objects:v72 count:16];
        }
        while (v17);
      }

      [v14 intersectSet:v53];
      v55 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v54[2], "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v27 = v15;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v60 objects:v71 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v61;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v61 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v60 + 1) + 8 * j);
            v33 = [GEOMapItemIdentifier alloc];
            v34 = [v32 collection];
            v35 = -[GEOPDCollectionResult collectionId](v34);
            v36 = [(GEOMapItemIdentifier *)v33 initWithMapsIdentifier:v35];
            int v37 = [v14 containsObject:v36];

            if (v37)
            {
              v38 = [GEOCollectionResult alloc];
              v39 = [v32 collection];
              v40 = [(GEOCollectionResult *)v38 initWithCollectionResult:v39];

              if (v40) {
                [v55 addObject:v40];
              }
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v60 objects:v71 count:16];
        }
        while (v29);
      }

      v41 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v55, "count"));
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v42 = v55;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v56 objects:v70 count:16];
      uint64_t v6 = v54;
      if (v43)
      {
        uint64_t v44 = v43;
        uint64_t v45 = *(void *)v57;
        do
        {
          for (uint64_t k = 0; k != v44; ++k)
          {
            if (*(void *)v57 != v45) {
              objc_enumerationMutation(v42);
            }
            v47 = objc_msgSend(*(id *)(*((void *)&v56 + 1) + 8 * k), "collection", v50);
            if (v47) {
              [v41 addObject:v47];
            }
          }
          uint64_t v44 = [v42 countByEnumeratingWithState:&v56 objects:v70 count:16];
        }
        while (v44);
      }

      self = [(GEOSearchSectionGuide *)v52 initWithPlaceCollections:v41];
      v48 = self;
      id v9 = v50;
      id v7 = v51;
      v13 = v53;
    }
    else
    {
      v48 = 0;
    }
  }
  else
  {
    v48 = 0;
  }

  return v48;
}

void __64__GEOSearchSectionGuide_initWithSearchSectionGuide_mapsResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 resultType] == 2 && objc_msgSend(v3, "hasCollection")) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (NSArray)placeCollections
{
  return self->_placeCollections;
}

- (void).cxx_destruct
{
}

@end