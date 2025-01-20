@interface GEOPublisherSuggestionResult
- (GEOPublisherSuggestionResult)initWithPublisherSuggestionResult:(id)a3 mapsResults:(id)a4;
- (NSArray)publishers;
@end

@implementation GEOPublisherSuggestionResult

- (GEOPublisherSuggestionResult)initWithPublisherSuggestionResult:(id)a3 mapsResults:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v6 = (id *)a3;
  id v7 = a4;
  if (v6 && [v6[2] count])
  {
    v8 = (void *)MEMORY[0x1E4F1CAD0];
    v9 = -[GEOPDPublisherSuggestionResult publisherIds](v6);
    v10 = +[GEOMapItemIdentifier mapItemIdentifiersFromMapsIdentifiers:v9];
    v11 = [v8 setWithArray:v10];

    if ([v11 count])
    {
      v48 = self;
      v50 = v6;
      v12 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v7, "count"));
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v49 = v7;
      id v13 = v7;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v57 objects:v63 count:16];
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
            v19 = [v18 publisher];
            v20 = -[GEOPDPublisherResult publisherId](v19);

            if (v20)
            {
              v21 = [GEOMapItemIdentifier alloc];
              v22 = [v18 publisher];
              v23 = -[GEOPDPublisherResult publisherId](v22);
              v24 = [(GEOMapItemIdentifier *)v21 initWithMapsIdentifier:v23];

              if (v24) {
                [v12 addObject:v24];
              }
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v57 objects:v63 count:16];
        }
        while (v15);
      }

      v47 = v11;
      [v12 intersectSet:v11];
      v51 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v50[2], "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v25 = v13;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v53 objects:v62 count:16];
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
            v32 = [v30 publisher];
            v33 = -[GEOPDPublisherResult publisherId](v32);
            v34 = [(GEOMapItemIdentifier *)v31 initWithMapsIdentifier:v33];
            int v35 = [v12 containsObject:v34];

            if (v35)
            {
              v36 = [GEOPublisherResult alloc];
              v37 = [v30 publisher];
              v38 = [(GEOPublisherResult *)v36 initWithPublisherResult:v37];

              if (v38) {
                [v51 addObject:v38];
              }
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v53 objects:v62 count:16];
        }
        while (v27);
      }

      if ([v51 count])
      {
        uint64_t v39 = [v51 count];
        v6 = v50;
        v11 = v47;
        if (v39 != [v50[2] count])
        {
          v40 = GEOGetCuratedCollectionsLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_188D96000, v40, OS_LOG_TYPE_DEBUG, "GEOPublisherSuggestionResult contains an identifier that is not present in the mapsResults array, or mapsResults contains an item that we were not able to create a GEOPublisherResult from.", buf, 2u);
          }
        }
        v52.receiver = v48;
        v52.super_class = (Class)GEOPublisherSuggestionResult;
        v41 = [(GEOPublisherSuggestionResult *)&v52 init];
        if (v41)
        {
          uint64_t v42 = [v51 copy];
          publishers = v41->_publishers;
          v41->_publishers = (NSArray *)v42;
        }
        self = v41;
        v44 = self;
      }
      else
      {
        v45 = GEOGetCuratedCollectionsLog();
        v6 = v50;
        v11 = v47;
        self = v48;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_188D96000, v45, OS_LOG_TYPE_ERROR, "GEOPublisherSuggestionResult GEOPublisherResult array is empty, returning nil", buf, 2u);
        }

        v44 = 0;
      }
      id v7 = v49;
    }
    else
    {
      v12 = GEOGetCuratedCollectionsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "No suggestionResultIdentifiers in the GEOPublisherSuggestionResult, returning nil", buf, 2u);
      }
      v44 = 0;
    }
  }
  else
  {
    v11 = GEOGetCuratedCollectionsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_DEBUG, "GEOPublisherSuggestionResult No publisher Ids in the publisherSuggestionResult, returning nil", buf, 2u);
    }
    v44 = 0;
  }

  return v44;
}

- (NSArray)publishers
{
  return self->_publishers;
}

- (void).cxx_destruct
{
}

@end