@interface GEORelatedCollectionSection
- (GEORelatedCollectionSection)initWithRelatedCollectionSection:(id)a3 mapsResults:(id)a4;
- (NSArray)collections;
@end

@implementation GEORelatedCollectionSection

- (GEORelatedCollectionSection)initWithRelatedCollectionSection:(id)a3 mapsResults:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  if (v6 && [v6[2] count])
  {
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = -[GEOPDRelatedCollectionSection collectionIds](v6);
    v10 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v9];
    v11 = [v8 setWithArray:v10];

    if ([v11 count])
    {
      v48 = v11;
      v49 = v6;
      v46 = self;
      v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v47 = v7;
      id v13 = v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v62 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v58 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            v19 = [v18 collection];
            v20 = -[GEOPDCollectionResult collectionId](v19);

            if (v20)
            {
              v21 = [GEOMapItemIdentifier alloc];
              v22 = [v18 collection];
              v23 = -[GEOPDCollectionResult collectionId](v22);
              v24 = [(GEOMapItemIdentifier *)v21 initWithMapsIdentifier:v23];

              if (v24) {
                [v12 addObject:v24];
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v57 objects:v62 count:16];
        }
        while (v15);
      }

      [v12 intersectSet:v11];
      v50 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v49[2], "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v25 = v13;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v61 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v54;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v54 != v28) {
              objc_enumerationMutation(v25);
            }
            v30 = *(void **)(*((void *)&v53 + 1) + 8 * j);
            v31 = [GEOMapItemIdentifier alloc];
            v32 = [v30 collection];
            v33 = -[GEOPDCollectionResult collectionId](v32);
            v34 = [(GEOMapItemIdentifier *)v31 initWithMapsIdentifier:v33];
            int v35 = [v12 containsObject:v34];

            if (v35)
            {
              v36 = [GEOCollectionResult alloc];
              v37 = [v30 collection];
              v38 = [(GEOCollectionResult *)v36 initWithCollectionResult:v37];

              if (v38) {
                [v50 addObject:v38];
              }
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v53 objects:v61 count:16];
        }
        while (v27);
      }

      if ([v50 count])
      {
        uint64_t v39 = [v50 count];
        v6 = v49;
        self = v46;
        if (v39 == [v49[2] count])
        {
          v40 = GEOGetCuratedCollectionsLog();
          id v7 = v47;
          v11 = v48;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_DEBUG, "relatedCollectionSection contains an identifier that is not present in the mapsResults array, or mapsResults contains an item that we were not able to create a GEOCollectionResult from.", buf, 2u);
          }

          v41 = 0;
        }
        else
        {
          v51.receiver = v46;
          v51.super_class = (Class)GEORelatedCollectionSection;
          v42 = [(GEORelatedCollectionSection *)&v51 init];
          id v7 = v47;
          v11 = v48;
          if (v42)
          {
            uint64_t v43 = [v50 copy];
            collections = v42->_collections;
            v42->_collections = (NSArray *)v43;
          }
          self = v42;
          v41 = self;
        }
      }
      else
      {
        v41 = 0;
        v11 = v48;
        v6 = v49;
        self = v46;
        id v7 = v47;
      }
    }
    else
    {
      v41 = 0;
    }
  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (NSArray)collections
{
  return self->_collections;
}

- (void).cxx_destruct
{
}

@end