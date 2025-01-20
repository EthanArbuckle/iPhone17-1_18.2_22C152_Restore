@interface GEOCollectionSuggestionResult
- (GEOCollectionSuggestionResult)initWithCollectionSuggestionResult:(id)a3 mapsResults:(id)a4;
- (GEOExploreGuides)exploreGuides;
- (NSArray)collections;
@end

@implementation GEOCollectionSuggestionResult

- (NSArray)collections
{
  return self->_collections;
}

- (GEOCollectionSuggestionResult)initWithCollectionSuggestionResult:(id)a3 mapsResults:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v7 = (id *)a3;
  id v8 = a4;
  if (v7 && (-[GEOPDCollectionSuggestionResult _readCollectionIds]((uint64_t)v7), [v7[3] count]))
  {
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    v10 = -[GEOPDCollectionSuggestionResult collectionIds](v7);
    v11 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v10];
    v12 = [v9 setWithArray:v11];

    if ([v12 count])
    {
      v52 = v12;
      id v48 = a3;
      v49 = self;
      v13 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v8, "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v50 = v8;
      id v14 = v8;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v61 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            v20 = [v19 collection];
            v21 = -[GEOPDCollectionResult collectionId](v20);

            if (v21)
            {
              v22 = [GEOMapItemIdentifier alloc];
              v23 = [v19 collection];
              v24 = -[GEOPDCollectionResult collectionId](v23);
              v25 = [(GEOMapItemIdentifier *)v22 initWithMapsIdentifier:v24];

              if (v25) {
                [v13 addObject:v25];
              }
            }
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v16);
      }

      [v13 intersectSet:v52];
      v26 = (void *)MEMORY[0x1E4F1CA48];
      -[GEOPDCollectionSuggestionResult _readCollectionIds]((uint64_t)v7);
      uint64_t v51 = (uint64_t)v7;
      v53 = objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v7[3], "count"));
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v27 = v14;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v57 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            v33 = [GEOMapItemIdentifier alloc];
            v34 = [v32 collection];
            v35 = -[GEOPDCollectionResult collectionId](v34);
            v36 = [(GEOMapItemIdentifier *)v33 initWithMapsIdentifier:v35];
            int v37 = [v13 containsObject:v36];

            if (v37)
            {
              v38 = [GEOCollectionResult alloc];
              v39 = [v32 collection];
              v40 = [(GEOCollectionResult *)v38 initWithCollectionResult:v39];

              if (v40) {
                [v53 addObject:v40];
              }
            }
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v29);
      }

      if ([v53 count])
      {
        uint64_t v41 = [v53 count];
        -[GEOPDCollectionSuggestionResult _readCollectionIds](v51);
        id v8 = v50;
        if (v41 != [*(id *)(v51 + 24) count])
        {
          v42 = GEOGetCuratedCollectionsLog();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v42, OS_LOG_TYPE_ERROR, "collectionSuggestionResult contains an identifier that is not present in the mapsResults array, or mapsResults contains an item that we were not able to create a GEOCollectionResult from.", buf, 2u);
          }
        }
        v54.receiver = v49;
        v54.super_class = (Class)GEOCollectionSuggestionResult;
        v43 = [(GEOCollectionSuggestionResult *)&v54 init];
        if (v43)
        {
          uint64_t v44 = [v53 copy];
          collections = v43->_collections;
          v43->_collections = (NSArray *)v44;

          objc_storeStrong((id *)&v43->_collectionSuggestionResult, v48);
        }
        self = v43;
        v46 = self;
        v7 = (id *)v51;
      }
      else
      {
        v46 = 0;
        id v8 = v50;
        v7 = (id *)v51;
        self = v49;
      }

      v12 = v52;
    }
    else
    {
      v46 = 0;
    }
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (GEOExploreGuides)exploreGuides
{
  collectionSuggestionResult = self->_collectionSuggestionResult;
  if (collectionSuggestionResult
    && (-[GEOPDCollectionSuggestionResult _readExploreGuidesMetadata]((uint64_t)self->_collectionSuggestionResult),
        collectionSuggestionResult->_exploreGuidesMetadata))
  {
    v4 = [GEOExploreGuides alloc];
    v5 = -[GEOPDCollectionSuggestionResult exploreGuidesMetadata]((id *)&self->_collectionSuggestionResult->super.super.isa);
    v6 = [(GEOExploreGuides *)v4 initWithExploreGuides:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collections, 0);

  objc_storeStrong((id *)&self->_collectionSuggestionResult, 0);
}

@end