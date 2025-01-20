@interface GEOPDSpatialPlaceLookupParameters
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSpatialPlaceLookupParameters)init;
- (GEOPDSpatialPlaceLookupParameters)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_readCategoryFilters;
- (void)_readCenter;
- (void)_readMapRegion;
- (void)addCategoryFilter:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setCenter:(uint64_t)a1;
- (void)setMapRegion:(uint64_t)a1;
- (void)setPoiIconCategoryFilter:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSpatialPlaceLookupParameters

- (GEOPDSpatialPlaceLookupParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  v2 = [(GEOPDSpatialPlaceLookupParameters *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSpatialPlaceLookupParameters)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  v3 = [(GEOPDSpatialPlaceLookupParameters *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  [(GEOPDSpatialPlaceLookupParameters *)&v3 dealloc];
}

- (void)_readCenter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCenter_tags_8667);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)setCenter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 144) |= 0x80u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

- (void)_readCategoryFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryFilters_tags_8668);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)addCategoryFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialPlaceLookupParameters _readCategoryFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 144) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 144) |= 0x400u;
  }
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_8669);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (void)setMapRegion:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 144) |= 0x100u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setPoiIconCategoryFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 144) |= 0x200u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    objc_storeStrong((id *)(a1 + 112), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSpatialPlaceLookupParameters;
  id v4 = [(GEOPDSpatialPlaceLookupParameters *)&v8 description];
  v5 = [(GEOPDSpatialPlaceLookupParameters *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSpatialPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSpatialPlaceLookupParameters readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    -[GEOPDSpatialPlaceLookupParameters _readCenter](a1);
    id v5 = *(id *)(a1 + 96);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"center"];
    }
    __int16 v8 = *(_WORD *)(a1 + 144);
    if ((v8 & 2) != 0)
    {
      v9 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 136)];
      [v4 setObject:v9 forKey:@"radius"];

      __int16 v8 = *(_WORD *)(a1 + 144);
    }
    if (v8)
    {
      v10 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 132)];
      [v4 setObject:v10 forKey:@"count"];
    }
    if (*(void *)(a1 + 32))
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v12 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v13 = 0;
        do
        {
          uint64_t v14 = *(int *)(*v12 + 4 * v13);
          if (v14 >= 0x18)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v14);
            v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v15 = off_1E53E4238[v14];
          }
          [v11 addObject:v15];

          ++v13;
          v12 = (void *)(a1 + 24);
        }
        while (v13 < *(void *)(a1 + 32));
      }
      if (a2) {
        v16 = @"categoryFilter";
      }
      else {
        v16 = @"category_filter";
      }
      [v4 setObject:v11 forKey:v16];
    }
    if (*(void *)(a1 + 80))
    {
      v17 = PBRepeatedUInt32NSArray();
      if (a2) {
        v18 = @"includeIconCategoryFilter";
      }
      else {
        v18 = @"include_icon_category_filter";
      }
      [v4 setObject:v17 forKey:v18];
    }
    if (*(void *)(a1 + 56))
    {
      v19 = PBRepeatedUInt32NSArray();
      if (a2) {
        v20 = @"excludeIconCategoryFilter";
      }
      else {
        v20 = @"exclude_icon_category_filter";
      }
      [v4 setObject:v19 forKey:v20];
    }
    -[GEOPDSpatialPlaceLookupParameters _readMapRegion](a1);
    id v21 = *(id *)(a1 + 104);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"mapRegion";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"map_region";
      }
      [v4 setObject:v23 forKey:v24];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 144) & 0x200) == 0)
    {
      v25 = *(void **)(a1 + 8);
      if (v25)
      {
        id v26 = v25;
        objc_sync_enter(v26);
        GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiIconCategoryFilter_tags_1);
        objc_sync_exit(v26);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v27 = *(id *)(a1 + 112);
    v28 = v27;
    if (v27)
    {
      if (a2)
      {
        v29 = [v27 jsonRepresentation];
        v30 = @"poiIconCategoryFilter";
      }
      else
      {
        v29 = [v27 dictionaryRepresentation];
        v30 = @"poi_icon_category_filter";
      }
      [v4 setObject:v29 forKey:v30];
    }
    if ((*(_WORD *)(a1 + 144) & 4) != 0)
    {
      uint64_t v31 = *(int *)(a1 + 140);
      if (v31 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 140));
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v32 = off_1E53E4220[v31];
      }
      if (a2) {
        v33 = @"spatialPlaceLookupRequestVersion";
      }
      else {
        v33 = @"spatial_place_lookup_request_version";
      }
      [v4 setObject:v32 forKey:v33];
    }
    v34 = *(void **)(a1 + 16);
    if (v34)
    {
      v35 = [v34 dictionaryRepresentation];
      v36 = v35;
      if (a2)
      {
        v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v35, "count"));
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __63__GEOPDSpatialPlaceLookupParameters__dictionaryRepresentation___block_invoke;
        v41[3] = &unk_1E53D8860;
        id v38 = v37;
        id v42 = v38;
        [v36 enumerateKeysAndObjectsUsingBlock:v41];
        id v39 = v38;

        v36 = v39;
      }
      [v4 setObject:v36 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSpatialPlaceLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_8695;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_8696;
      }
      GEOPDSpatialPlaceLookupParametersReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSpatialPlaceLookupParametersCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

void __63__GEOPDSpatialPlaceLookupParameters__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    __int16 v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    __int16 v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  if (!a1)
  {
    uint64_t v4 = 0;
    goto LABEL_119;
  }
  uint64_t v4 = [a1 init];
  if (v4)
  {
    id v5 = [v54 objectForKeyedSubscript:@"center"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v6 = [GEOLatLng alloc];
      if (a3) {
        objc_super v7 = [(GEOLatLng *)v6 initWithJSON:v5];
      }
      else {
        objc_super v7 = [(GEOLatLng *)v6 initWithDictionary:v5];
      }
      __int16 v8 = v7;
      -[GEOPDSpatialPlaceLookupParameters setCenter:](v4, v7);
    }
    v9 = [v54 objectForKeyedSubscript:@"radius"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v10 = [v9 intValue];
      *(_WORD *)(v4 + 144) |= 0x400u;
      *(_WORD *)(v4 + 144) |= 2u;
      *(_DWORD *)(v4 + 136) = v10;
    }

    v11 = [v54 objectForKeyedSubscript:@"count"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v12 = [v11 intValue];
      *(_WORD *)(v4 + 144) |= 0x400u;
      *(_WORD *)(v4 + 144) |= 1u;
      *(_DWORD *)(v4 + 132) = v12;
    }

    if (a3) {
      unint64_t v13 = @"categoryFilter";
    }
    else {
      unint64_t v13 = @"category_filter";
    }
    uint64_t v14 = [v54 objectForKeyedSubscript:v13];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v63 objects:v69 count:16];
      if (!v16) {
        goto LABEL_53;
      }
      uint64_t v17 = *(void *)v64;
      while (1)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v64 != v17) {
            objc_enumerationMutation(v15);
          }
          v19 = *(void **)(*((void *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v20 = v19;
            if (([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_UNKNOWN"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ENTERTAINMENT"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AQUARIUM"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ZOO"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_STADIUM"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SKATE_PARK"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_CULTURE"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_LANDMARK"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MUSEUM"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_RESTAURANT"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_NIGHTLIFE"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PARK"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AIRPORT"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_SHOPPING"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_BEACH"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_MOUNTAIN"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_FITNESS"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_ACTIVITY"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_DIVING"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HIKING"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_PERFORMANCE"] & 1) == 0
              && ([v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_HOSPITAL"] & 1) == 0)
            {
              [v20 isEqualToString:@"SPATIAL_PLACE_LOOKUP_CATEGORY_AMUSEMENTPARK_RIDE"];
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
            [v19 intValue];
          }
          -[GEOPDSpatialPlaceLookupParameters addCategoryFilter:](v4);
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v63 objects:v69 count:16];
        if (!v16)
        {
LABEL_53:

          break;
        }
      }
    }

    if (a3) {
      id v21 = @"includeIconCategoryFilter";
    }
    else {
      id v21 = @"include_icon_category_filter";
    }
    v51 = [v54 objectForKeyedSubscript:v21];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v22 = v51;
      uint64_t v23 = [v22 countByEnumeratingWithState:&v59 objects:v68 count:16];
      if (v23)
      {
        uint64_t v24 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v60 != v24) {
              objc_enumerationMutation(v22);
            }
            id v26 = *(void **)(*((void *)&v59 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v26 unsignedIntValue];
              os_unfair_lock_lock((os_unfair_lock_t)(v4 + 128));
              if ((*(_WORD *)(v4 + 144) & 0x40) == 0)
              {
                id v27 = *(void **)(v4 + 8);
                if (v27)
                {
                  id v28 = v27;
                  objc_sync_enter(v28);
                  GEOPDSpatialPlaceLookupParametersReadSpecified(v4, *(void *)(v4 + 8), (int *)&_readIncludeIconCategoryFilters_tags);
                  objc_sync_exit(v28);
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              PBRepeatedUInt32Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v4 + 144) |= 0x40u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              *(_WORD *)(v4 + 144) |= 0x400u;
            }
          }
          uint64_t v23 = [v22 countByEnumeratingWithState:&v59 objects:v68 count:16];
        }
        while (v23);
      }
    }
    if (a3) {
      v29 = @"excludeIconCategoryFilter";
    }
    else {
      v29 = @"exclude_icon_category_filter";
    }
    v52 = [v54 objectForKeyedSubscript:v29];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v30 = v52;
      uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v67 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v31; ++k)
          {
            if (*(void *)v56 != v32) {
              objc_enumerationMutation(v30);
            }
            v34 = *(void **)(*((void *)&v55 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v34 unsignedIntValue];
              os_unfair_lock_lock((os_unfair_lock_t)(v4 + 128));
              if ((*(_WORD *)(v4 + 144) & 0x20) == 0)
              {
                v35 = *(void **)(v4 + 8);
                if (v35)
                {
                  id v36 = v35;
                  objc_sync_enter(v36);
                  GEOPDSpatialPlaceLookupParametersReadSpecified(v4, *(void *)(v4 + 8), (int *)&_readExcludeIconCategoryFilters_tags);
                  objc_sync_exit(v36);
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              PBRepeatedUInt32Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v4 + 144) |= 0x20u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 128));
              *(_WORD *)(v4 + 144) |= 0x400u;
            }
          }
          uint64_t v31 = [v30 countByEnumeratingWithState:&v55 objects:v67 count:16];
        }
        while (v31);
      }
    }
    if (a3) {
      v37 = @"mapRegion";
    }
    else {
      v37 = @"map_region";
    }
    id v38 = [v54 objectForKeyedSubscript:v37];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v39 = [GEOMapRegion alloc];
      if (a3) {
        v40 = [(GEOMapRegion *)v39 initWithJSON:v38];
      }
      else {
        v40 = [(GEOMapRegion *)v39 initWithDictionary:v38];
      }
      v41 = v40;
      -[GEOPDSpatialPlaceLookupParameters setMapRegion:](v4, v40);
    }
    if (a3) {
      id v42 = @"poiIconCategoryFilter";
    }
    else {
      id v42 = @"poi_icon_category_filter";
    }
    v43 = [v54 objectForKeyedSubscript:v42];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [GEOPDPoiIconCategoryFilter alloc];
      if (v44) {
        v45 = -[GEOPDPoiIconCategoryFilter _initWithDictionary:isJSON:](v44, v43, a3);
      }
      else {
        v45 = 0;
      }
      -[GEOPDSpatialPlaceLookupParameters setPoiIconCategoryFilter:](v4, v45);
    }
    if (a3) {
      v46 = @"spatialPlaceLookupRequestVersion";
    }
    else {
      v46 = @"spatial_place_lookup_request_version";
    }
    v47 = [v54 objectForKeyedSubscript:v46];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v48 = v47;
      if ([v48 isEqualToString:@"SPATIAL_PLACE_LOOKUP_REQUEST_VERSION_UNKNOWN"])
      {
        int v49 = 0;
      }
      else if ([v48 isEqualToString:@"SPATIAL_PLACE_LOOKUP_REQUEST_VERSION_V1"])
      {
        int v49 = 1;
      }
      else if ([v48 isEqualToString:@"SPATIAL_PLACE_LOOKUP_REQUEST_VERSION_V2"])
      {
        int v49 = 2;
      }
      else
      {
        int v49 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_118:

        goto LABEL_119;
      }
      int v49 = [v47 intValue];
    }
    *(_WORD *)(v4 + 144) |= 0x400u;
    *(_WORD *)(v4 + 144) |= 4u;
    *(_DWORD *)(v4 + 140) = v49;
    goto LABEL_118;
  }
LABEL_119:

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSpatialPlaceLookupParametersReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v12 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader
    || (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x5F0) != 0)
    || (*(_WORD *)&self->_flags & 0x200) != 0
    && GEOPDPoiIconCategoryFilterIsDirty((uint64_t)self->_poiIconCategoryFilter))
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 0);
    if (self->_center) {
      PBDataWriterWriteSubmessage();
    }
    __int16 flags = (__int16)self->_flags;
    id v6 = v12;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v12;
      __int16 flags = (__int16)self->_flags;
    }
    if (flags)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v12;
    }
    if (self->_categoryFilters.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v6 = v12;
        ++v7;
      }
      while (v7 < self->_categoryFilters.count);
    }
    if (self->_includeIconCategoryFilters.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v6 = v12;
        ++v8;
      }
      while (v8 < self->_includeIconCategoryFilters.count);
    }
    if (self->_excludeIconCategoryFilters.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        id v6 = v12;
        ++v9;
      }
      while (v9 < self->_excludeIconCategoryFilters.count);
    }
    if (self->_mapRegion)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v12;
    }
    if (self->_poiIconCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      id v6 = v12;
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v6 = v12;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v6];
  }
  else
  {
    int v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v12 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSpatialPlaceLookupParameters _readCenter](result);
    if ([*(id *)(v3 + 96) hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDSpatialPlaceLookupParameters _readMapRegion](v3);
      uint64_t v4 = *(void **)(v3 + 104);
      return [v4 hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSpatialPlaceLookupParametersReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_12;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 0);
  id v9 = [(GEOLatLng *)self->_center copyWithZone:a3];
  int v10 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v9;

  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 136) = self->_radius;
    *(_WORD *)(v5 + 144) |= 2u;
    __int16 flags = (__int16)self->_flags;
  }
  if (flags)
  {
    *(_DWORD *)(v5 + 132) = self->_count;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  id v12 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  unint64_t v13 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v12;

  id v14 = [(GEOPDPoiIconCategoryFilter *)self->_poiIconCategoryFilter copyWithZone:a3];
  id v15 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v14;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_spatialPlaceLookupRequestVersion;
    *(_WORD *)(v5 + 144) |= 4u;
  }
  uint64_t v16 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v16;
LABEL_12:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 1);
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)v4, 1);
  center = self->_center;
  if ((unint64_t)center | *((void *)v4 + 12))
  {
    if (!-[GEOLatLng isEqual:](center, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_radius != *((_DWORD *)v4 + 34)) {
      goto LABEL_25;
    }
  }
  else if ((v7 & 2) != 0)
  {
LABEL_25:
    BOOL v11 = 0;
    goto LABEL_26;
  }
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_count != *((_DWORD *)v4 + 33)) {
      goto LABEL_25;
    }
  }
  else if (v7)
  {
    goto LABEL_25;
  }
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_25;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_25;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    goto LABEL_25;
  }
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((void *)v4 + 13))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:")) {
      goto LABEL_25;
    }
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  if ((unint64_t)poiIconCategoryFilter | *((void *)v4 + 14))
  {
    if (!-[GEOPDPoiIconCategoryFilter isEqual:](poiIconCategoryFilter, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 v10 = *((_WORD *)v4 + 72);
  BOOL v11 = (v10 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_spatialPlaceLookupRequestVersion != *((_DWORD *)v4 + 35)) {
      goto LABEL_25;
    }
    BOOL v11 = 1;
  }
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDSpatialPlaceLookupParameters readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOLatLng *)self->_center hash];
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_radius;
    if (flags) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if (flags)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_count;
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
LABEL_6:
  uint64_t v7 = PBRepeatedInt32Hash();
  uint64_t v8 = PBRepeatedUInt32Hash();
  uint64_t v9 = PBRepeatedUInt32Hash();
  unint64_t v10 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v11 = [(GEOPDPoiIconCategoryFilter *)self->_poiIconCategoryFilter hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_spatialPlaceLookupRequestVersion;
  }
  else {
    uint64_t v12 = 0;
  }
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 144) |= 8u;
    *(_WORD *)(a1 + 144) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSpatialPlaceLookupParameters readAll:](a1, 0);
      [*(id *)(a1 + 96) clearUnknownFields:1];
      [*(id *)(a1 + 104) clearUnknownFields:1];
      uint64_t v5 = *(void *)(a1 + 112);
      -[GEOPDPoiIconCategoryFilter clearUnknownFields:](v5, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_center, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end