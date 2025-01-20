@interface GEOMapItemEncyclopedicAttribution
- (GEOMapItemEncyclopedicAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5;
@end

@implementation GEOMapItemEncyclopedicAttribution

- (GEOMapItemEncyclopedicAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length]
    && ([v8 source],
        v11 = (id *)objc_claimAutoreleasedReturnValue(),
        BOOL v12 = -[GEOSearchAttributionSource supportsAction:forComponent:](v11, 1, 0),
        v11,
        v12))
  {
    v13 = _actionURLSchemes(v8);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = GEOActionURLViewPlaceURLs(*(void **)(*((void *)&v25 + 1) + 8 * v19), v10);
          if ([v20 count]) {
            [v14 addObjectsFromArray:v20];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v17);
    }

    id v21 = (id)[v14 arrayByAddingObjectsFromArray:v9];
  }
  else
  {
    v14 = v9;
  }
  v24.receiver = self;
  v24.super_class = (Class)GEOMapItemEncyclopedicAttribution;
  v22 = [(GEOMapItemAttribution *)&v24 initWithSearchAttributionInfo:v8 attributionURLs:v14 poiID:v10];

  return v22;
}

@end