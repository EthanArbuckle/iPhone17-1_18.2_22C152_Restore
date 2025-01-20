@interface GEOMapItemReviewsAttribution
- (GEOMapItemReviewsAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5;
- (GEOMapItemReviewsAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5;
- (NSArray)addReviewURLs;
- (id)urlsForReview:(id)a3;
- (id)urlsForSelectedItemWithItems:(id)a3;
@end

@implementation GEOMapItemReviewsAttribution

- (GEOMapItemReviewsAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    v12 = GEOYelpReviewsURLs(v10);
    if ([v12 count])
    {
      v13 = (void *)[v12 mutableCopy];
      v14 = v13;
      if (v9) {
        [v13 addObjectsFromArray:v9];
      }

      id v9 = v14;
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)GEOMapItemReviewsAttribution;
  v15 = [(GEOMapItemAttribution *)&v17 initWithSearchAttributionInfo:v8 attributionURLs:v9 yelpID:v11];

  return v15;
}

- (GEOMapItemReviewsAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length]
    && ([v8 source],
        v11 = (id *)objc_claimAutoreleasedReturnValue(),
        BOOL v12 = -[GEOSearchAttributionSource supportsAction:forComponent:](v11, 1, 2),
        v11,
        v12))
  {
    v13 = _actionURLSchemes(v8);
    v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = GEOActionURLViewReviewsURLs(*(void **)(*((void *)&v24 + 1) + 8 * v19), v10);
          if ([v20 count]) {
            [v14 addObjectsFromArray:v20];
          }

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v17);
    }

    [v14 addObjectsFromArray:v9];
  }
  else
  {
    v14 = v9;
  }
  v23.receiver = self;
  v23.super_class = (Class)GEOMapItemReviewsAttribution;
  v21 = [(GEOMapItemAttribution *)&v23 initWithSearchAttributionInfo:v8 attributionURLs:v14 poiID:v10];

  return v21;
}

- (NSArray)addReviewURLs
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->super._poiID length])
  {
    v3 = [(GEOSearchAttributionInfo *)self->super._info source];
    BOOL v4 = -[GEOSearchAttributionSource supportsAction:forComponent:](v3, 3, 2);

    if (v4)
    {
      v5 = _actionURLSchemes(self->super._info);
      v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            BOOL v12 = GEOActionURLAddReviewURLs(*(void **)(*((void *)&v22 + 1) + 8 * i), self->super._poiID);
            if (objc_msgSend(v12, "count", (void)v22)) {
              [v6 addObjectsFromArray:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v9);
      }

      v13 = [(GEOMapItemAttribution *)self attributionURLs];
      uint64_t v14 = [v13 count];

      if (v14)
      {
        id v15 = [(GEOMapItemAttribution *)self attributionURLs];
        [v6 addObjectsFromArray:v15];
      }
LABEL_21:

      goto LABEL_23;
    }
  }
  yelpID = self->super._yelpID;
  if (yelpID)
  {
    uint64_t v17 = GEOYelpAddReviewURLs(yelpID);
    if (v17)
    {
      id v7 = v17;
      v6 = (void *)[v17 mutableCopy];
      uint64_t v18 = [(GEOMapItemAttribution *)self _yelpHTTPURLForRequirement:2 withUID:0 writeAReview:1];
      if (v18) {
        [v6 addObject:v18];
      }
      uint64_t v19 = [(GEOMapItemAttribution *)self attributionURLs];

      if (v19)
      {
        v20 = [(GEOMapItemAttribution *)self attributionURLs];
        [v6 addObjectsFromArray:v20];
      }
      goto LABEL_21;
    }
  }
  v6 = 0;
LABEL_23:

  return (NSArray *)v6;
}

- (id)urlsForReview:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BOOL v4 = [a3 _identifier];
  if ([v4 length])
  {
    if ([(NSString *)self->super._poiID length])
    {
      v5 = [(GEOSearchAttributionInfo *)self->super._info source];
      BOOL v6 = -[GEOSearchAttributionSource supportsAction:forComponent:](v5, 1, 2);

      if (v6)
      {
        id v7 = _actionURLSchemes(self->super._info);
        uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v9 = v7;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v25 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = GEOActionURLViewSpecificReviewURLs(*(void **)(*((void *)&v24 + 1) + 8 * i), self->super._poiID, v4);
              if (objc_msgSend(v14, "count", (void)v24)) {
                [v8 addObjectsFromArray:v14];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v11);
        }

        id v15 = [(GEOMapItemAttribution *)self attributionURLs];
        uint64_t v16 = [v15 count];

        if (v16)
        {
          uint64_t v17 = [(GEOMapItemAttribution *)self attributionURLs];
          [v8 addObjectsFromArray:v17];
        }
LABEL_22:

        goto LABEL_24;
      }
    }
    yelpID = self->super._yelpID;
    if (yelpID)
    {
      uint64_t v19 = GEOYelpViewReviewURLs(yelpID, v4);
      if (v19)
      {
        id v9 = v19;
        uint64_t v8 = (void *)[v19 mutableCopy];
        v20 = [(GEOMapItemAttribution *)self _yelpHTTPURLForRequirement:2 withUID:v4 writeAReview:0];
        if (v20) {
          [v8 addObject:v20];
        }
        v21 = [(GEOMapItemAttribution *)self attributionURLs];

        if (v21)
        {
          long long v22 = [(GEOMapItemAttribution *)self attributionURLs];
          [v8 addObjectsFromArray:v22];
        }
        goto LABEL_22;
      }
    }
    uint64_t v8 = [(GEOMapItemAttribution *)self attributionURLs];
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_24:

  return v8;
}

- (id)urlsForSelectedItemWithItems:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (self->super._yelpID)
  {
    BOOL v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v26 + 1) + 8 * i) _reviewsAttribution];
          v13 = (void *)v12;
          if (v12 && *(void *)(v12 + 24)) {
            objc_msgSend(v6, "addObject:");
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v9);
    }

    uint64_t v14 = [NSString stringWithFormat:@"&selected=%@", self->super._yelpID];
    id v15 = [v6 componentsJoinedByString:@","];
    uint64_t v16 = NSString;
    unint64_t v17 = [v6 count];
    uint64_t v18 = @"biz";
    if (v17 > 1) {
      uint64_t v18 = @"bizs";
    }
    uint64_t v19 = [v16 stringWithFormat:@"yelp5.5:///%@/%@?%@&xref=apple", v18, v15, v14];
    v20 = [NSString stringWithFormat:@"yelp5.3:///biz/%@?xref=apple", self->super._yelpID];
    v21 = (void *)MEMORY[0x1E4F1CA48];
    long long v22 = [(GEOMapItemAttribution *)self attributionURLs];
    long long v23 = objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count") + 2);

    [v23 addObject:v19];
    [v23 addObject:v20];
    long long v24 = [(GEOMapItemAttribution *)self attributionURLs];
    [v23 addObjectsFromArray:v24];
  }
  else
  {
    long long v23 = [(GEOMapItemAttribution *)self attributionURLs];
  }

  return v23;
}

@end