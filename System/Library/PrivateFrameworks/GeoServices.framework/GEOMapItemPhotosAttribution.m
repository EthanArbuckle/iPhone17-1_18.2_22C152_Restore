@interface GEOMapItemPhotosAttribution
- (BOOL)canAddPhotosLocally;
- (BOOL)canShowPhotosLocally;
- (BOOL)requiresAttributionInPhotoViewerHeader;
- (BOOL)shouldSuppressPhotoAttribution;
- (BOOL)supportsReportingIssue;
- (GEOMapItemPhotosAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5;
- (GEOMapItemPhotosAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5;
- (NSArray)addPhotoURLs;
- (id)urlsForPhotoWithIdentifier:(id)a3;
@end

@implementation GEOMapItemPhotosAttribution

- (GEOMapItemPhotosAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 poiID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v10 length]
    && ([v8 source],
        v11 = (id *)objc_claimAutoreleasedReturnValue(),
        BOOL v12 = -[GEOSearchAttributionSource supportsAction:forComponent:](v11, 1, 1),
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
          v20 = GEOActionURLViewPhotosURLs(*(void **)(*((void *)&v24 + 1) + 8 * v19), v10);
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
  v23.super_class = (Class)GEOMapItemPhotosAttribution;
  v21 = [(GEOMapItemAttribution *)&v23 initWithSearchAttributionInfo:v8 attributionURLs:v14 poiID:v10];

  return v21;
}

- (GEOMapItemPhotosAttribution)initWithSearchAttributionInfo:(id)a3 attributionURLs:(id)a4 yelpID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    BOOL v12 = GEOYelpPhotosURLs(v10);
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
  v17.super_class = (Class)GEOMapItemPhotosAttribution;
  id v15 = [(GEOMapItemAttribution *)&v17 initWithSearchAttributionInfo:v8 attributionURLs:v9 yelpID:v11];

  return v15;
}

- (NSArray)addPhotoURLs
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->super._poiID length])
  {
    v3 = [(GEOSearchAttributionInfo *)self->super._info source];
    BOOL v4 = -[GEOSearchAttributionSource supportsAction:forComponent:](v3, 3, 1);

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
            BOOL v12 = GEOActionURLAddPhotoURLs(*(void **)(*((void *)&v20 + 1) + 8 * i), self->super._poiID);
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
    objc_super v17 = GEOYelpAddPhotoURLs(yelpID);
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
  v6 = 0;
LABEL_20:

  return (NSArray *)v6;
}

- (id)urlsForPhotoWithIdentifier:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSString *)self->super._poiID length])
  {
    v5 = [(GEOSearchAttributionInfo *)self->super._info source];
    BOOL v6 = -[GEOSearchAttributionSource supportsAction:forComponent:](v5, 1, 1);

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
            uint64_t v14 = GEOActionURLViewSpecificPhotoURLs(*(void **)(*((void *)&v24 + 1) + 8 * i), self->super._poiID, v4);
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
        objc_super v17 = [(GEOMapItemAttribution *)self attributionURLs];
        [v8 addObjectsFromArray:v17];
      }
LABEL_21:

      goto LABEL_23;
    }
  }
  yelpID = self->super._yelpID;
  if (yelpID)
  {
    uint64_t v19 = GEOYelpViewPhotoURLs(yelpID, v4);
    if (v19)
    {
      id v9 = v19;
      uint64_t v8 = (void *)[v19 mutableCopy];
      long long v20 = [(GEOMapItemAttribution *)self _yelpHTTPURLForRequirement:3 withUID:v4 writeAReview:0];
      if (v20) {
        [v8 addObject:v20];
      }
      long long v21 = [(GEOMapItemAttribution *)self attributionURLs];

      if (v21)
      {
        long long v22 = [(GEOMapItemAttribution *)self attributionURLs];
        [v8 addObjectsFromArray:v22];
      }
      goto LABEL_21;
    }
  }
  uint64_t v8 = [(GEOMapItemAttribution *)self attributionURLs];
LABEL_23:

  return v8;
}

- (BOOL)canAddPhotosLocally
{
  v2 = [(GEOSearchAttributionInfo *)self->super._info source];
  BOOL v3 = -[GEOSearchAttributionSource canLocallyHandleAction:forComponent:](v2, 3);

  return v3;
}

- (BOOL)canShowPhotosLocally
{
  v2 = [(GEOSearchAttributionInfo *)self->super._info source];
  BOOL v3 = -[GEOSearchAttributionSource canLocallyHandleAction:forComponent:](v2, 1);

  return v3;
}

- (BOOL)shouldSuppressPhotoAttribution
{
  v2 = [(GEOSearchAttributionInfo *)self->super._info source];
  if (v2)
  {
    unint64_t v3 = 0;
    do
    {
      -[GEOSearchAttributionSource _readSuppressAttributionLogos]((uint64_t)v2);
      unint64_t v4 = v2[7];
      BOOL v5 = v3 < v4;
      if (v3 >= v4) {
        break;
      }
      int v6 = -[GEOSearchAttributionSource suppressAttributionLogosAtIndex:]((uint64_t)v2, v3++);
    }
    while (v6 != 1);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)supportsReportingIssue
{
  unint64_t v3 = _getValue(GeoServicesConfig_VendorsThatSupportReportingPhotos, (uint64_t)off_1E9114B08, 1, 0, 0, 0);
  unint64_t v4 = [(GEOMapItemAttribution *)self providerID];
  char v5 = [v3 containsObject:v4];

  return v5;
}

- (BOOL)requiresAttributionInPhotoViewerHeader
{
  v2 = [(GEOSearchAttributionInfo *)self->super._info source];
  if (v2) {
    BOOL v3 = v2[138] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

@end