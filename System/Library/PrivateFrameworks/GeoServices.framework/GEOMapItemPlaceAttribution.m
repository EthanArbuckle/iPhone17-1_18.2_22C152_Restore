@interface GEOMapItemPlaceAttribution
- (GEOMapItemPlaceAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5;
- (NSArray)checkInURLs;
- (NSURL)webURL;
@end

@implementation GEOMapItemPlaceAttribution

- (GEOMapItemPlaceAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
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
  v24.super_class = (Class)GEOMapItemPlaceAttribution;
  v22 = [(GEOMapItemAttribution *)&v24 initWithSearchAttributionInfo:v8 attributionURLs:v14 poiID:v10];

  return v22;
}

- (NSArray)checkInURLs
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->super._poiID length])
  {
    v3 = [(GEOSearchAttributionInfo *)self->super._info source];
    BOOL v4 = -[GEOSearchAttributionSource supportsAction:forComponent:](v3, 4, 0);

    if (v4)
    {
      v5 = _actionURLSchemes(self->super._info);
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v21 != v10) {
              objc_enumerationMutation(v7);
            }
            BOOL v12 = GEOActionURLCheckinURLs(*(void **)(*((void *)&v20 + 1) + 8 * i), self->super._poiID);
            if (objc_msgSend(v12, "count", (void)v20)) {
              [v6 addObjectsFromArray:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v9);
      }

      v13 = [(GEOMapItemAttribution *)self attributionURLs];
      uint64_t v14 = [v13 count];

      if (!v14) {
        goto LABEL_14;
      }
LABEL_13:
      id v15 = [(GEOMapItemAttribution *)self attributionURLs];
      [v6 addObjectsFromArray:v15];

LABEL_14:
      goto LABEL_20;
    }
  }
  yelpID = self->super._yelpID;
  if (yelpID)
  {
    uint64_t v17 = GEOYelpCheckInURLs(yelpID);
    if (v17)
    {
      id v7 = v17;
      v6 = (void *)[v17 mutableCopy];
      uint64_t v18 = [(GEOMapItemAttribution *)self attributionURLs];

      if (!v18) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  v6 = [(GEOMapItemAttribution *)self attributionURLs];
LABEL_20:

  return (NSArray *)v6;
}

- (NSURL)webURL
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = [(GEOMapItemAttribution *)self _yelpHTTPURLForRequirement:1 withUID:0 writeAReview:0];
  BOOL v4 = [v2 URLWithString:v3];

  return (NSURL *)v4;
}

@end