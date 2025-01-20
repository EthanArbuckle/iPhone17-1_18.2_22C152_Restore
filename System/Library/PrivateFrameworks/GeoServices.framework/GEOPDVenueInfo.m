@interface GEOPDVenueInfo
+ (id)venueInfoForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDVenueInfo)init;
- (GEOPDVenueInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)filterElements;
- (id)itemList;
- (id)jsonRepresentation;
- (id)locatedInside;
- (id)venueFeatureIds;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)featureType;
- (unint64_t)hash;
- (void)_addNoFlagsFilterElement:(uint64_t)a1;
- (void)_addNoFlagsVenueFeatureId:(uint64_t)a1;
- (void)_readFilterElements;
- (void)_readItemList;
- (void)_readLocatedInside;
- (void)_readVenueFeatureIds;
- (void)addFilterElement:(uint64_t)a1;
- (void)addVenueFeatureId:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setItemList:(uint64_t)a1;
- (void)setLocatedInside:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDVenueInfo

+ (id)venueInfoForPlaceData:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__GEOPDVenueInfo_PlaceDataExtras__venueInfoForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:48 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (GEOPDVenueInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDVenueInfo;
  v2 = [(GEOPDVenueInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDVenueInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDVenueInfo;
  id v3 = [(GEOPDVenueInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVenueFeatureIds
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueFeatureIds_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)venueFeatureIds
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDVenueInfo _readVenueFeatureIds]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addVenueFeatureId:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDVenueInfo _readVenueFeatureIds](a1);
    -[GEOPDVenueInfo _addNoFlagsVenueFeatureId:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsVenueFeatureId:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      id v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)featureType
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 64));
    if (v2) {
      return *(unsigned int *)(v1 + 68);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readItemList
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readItemList_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)itemList
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDVenueInfo _readItemList]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setItemList:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x10u;
  *(unsigned char *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)_readLocatedInside
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocatedInside_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)locatedInside
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDVenueInfo _readLocatedInside]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setLocatedInside:(uint64_t)a1
{
  id v4 = a2;
  *(unsigned char *)(a1 + 76) |= 0x20u;
  *(unsigned char *)(a1 + 76) |= 0x80u;
  objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)_readFilterElements
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDVenueInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFilterElements_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)filterElements
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDVenueInfo _readFilterElements]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addFilterElement:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDVenueInfo _readFilterElements](a1);
    -[GEOPDVenueInfo _addNoFlagsFilterElement:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(unsigned char *)(a1 + 76) |= 0x80u;
  }
}

- (void)_addNoFlagsFilterElement:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDVenueInfo;
  id v4 = [(GEOPDVenueInfo *)&v8 description];
  id v5 = [(GEOPDVenueInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDVenueInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDVenueInfo readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 48) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v6 = *(id *)(a1 + 48);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v49 objects:v54 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v50 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            id v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v49 objects:v54 count:16];
        }
        while (v8);
      }

      if (a2) {
        v13 = @"venueFeatureId";
      }
      else {
        v13 = @"venue_feature_id";
      }
      [v4 setObject:v5 forKey:v13];
    }
    if (*(unsigned char *)(a1 + 76))
    {
      uint64_t v14 = *(int *)(a1 + 68);
      if (v14 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 68));
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = off_1E53DB838[v14];
      }
      if (a2) {
        v16 = @"featureType";
      }
      else {
        v16 = @"feature_type";
      }
      [v4 setObject:v15 forKey:v16];
    }
    v17 = -[GEOPDVenueInfo itemList]((id *)a1);
    v18 = v17;
    if (v17)
    {
      if (a2)
      {
        v19 = [v17 jsonRepresentation];
        v20 = @"itemList";
      }
      else
      {
        v19 = [v17 dictionaryRepresentation];
        v20 = @"item_list";
      }
      [v4 setObject:v19 forKey:v20];
    }
    v21 = -[GEOPDVenueInfo locatedInside]((id *)a1);
    v22 = v21;
    if (v21)
    {
      if (a2)
      {
        v23 = [v21 jsonRepresentation];
        v24 = @"locatedInside";
      }
      else
      {
        v23 = [v21 dictionaryRepresentation];
        v24 = @"located_inside";
      }
      [v4 setObject:v23 forKey:v24];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v26 = *(id *)(a1 + 24);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v46;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v46 != v29) {
              objc_enumerationMutation(v26);
            }
            v31 = *(void **)(*((void *)&v45 + 1) + 8 * j);
            if (a2) {
              [v31 jsonRepresentation];
            }
            else {
            v32 = [v31 dictionaryRepresentation];
            }
            [v25 addObject:v32];
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v28);
      }

      if (a2) {
        v33 = @"filterElement";
      }
      else {
        v33 = @"filter_element";
      }
      [v4 setObject:v25 forKey:v33];
    }
    if ((*(unsigned char *)(a1 + 76) & 2) != 0)
    {
      v34 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 72)];
      if (a2) {
        v35 = @"goInsideLevel";
      }
      else {
        v35 = @"go_inside_level";
      }
      [v4 setObject:v34 forKey:v35];
    }
    v36 = *(void **)(a1 + 16);
    if (v36)
    {
      v37 = [v36 dictionaryRepresentation];
      v38 = v37;
      if (a2)
      {
        v39 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v37, "count"));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __44__GEOPDVenueInfo__dictionaryRepresentation___block_invoke;
        v43[3] = &unk_1E53D8860;
        id v40 = v39;
        id v44 = v40;
        [v38 enumerateKeysAndObjectsUsingBlock:v43];
        id v41 = v40;

        v38 = v41;
      }
      [v4 setObject:v38 forKey:@"Unknown Fields"];
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
  return -[GEOPDVenueInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_307;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_308;
      }
      GEOPDVenueInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDVenueInfoCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __44__GEOPDVenueInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1 || (uint64_t v103 = [a1 init]) == 0)
  {
    uint64_t v103 = 0;
    goto LABEL_148;
  }
  if (a3) {
    id v6 = @"venueFeatureId";
  }
  else {
    id v6 = @"venue_feature_id";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v108 objects:v117 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v109;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v109 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = *(void **)(*((void *)&v108 + 1) + 8 * v12);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v14 = [GEOPDVenueIdentifier alloc];
            if (v14) {
              v15 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
            }
            else {
              v15 = 0;
            }
            -[GEOPDVenueInfo addVenueFeatureId:](v103, v15);
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v16 = [v8 countByEnumeratingWithState:&v108 objects:v117 count:16];
        uint64_t v10 = v16;
      }
      while (v16);
    }
  }
  if (a3) {
    v17 = @"featureType";
  }
  else {
    v17 = @"feature_type";
  }
  v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v19 = v18;
    if ([v19 isEqualToString:@"VENUE_FEATURE_TYPE_UNKNOWN"])
    {
      int v20 = 0;
    }
    else if ([v19 isEqualToString:@"VENUE_FEATURE_TYPE_VENUE"])
    {
      int v20 = 1;
    }
    else if ([v19 isEqualToString:@"VENUE_FEATURE_TYPE_BUILDING"])
    {
      int v20 = 2;
    }
    else if ([v19 isEqualToString:@"VENUE_FEATURE_TYPE_LEVEL"])
    {
      int v20 = 3;
    }
    else if ([v19 isEqualToString:@"VENUE_FEATURE_TYPE_POI"])
    {
      int v20 = 4;
    }
    else
    {
      int v20 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_41;
    }
    int v20 = [v18 intValue];
  }
  *(unsigned char *)(v103 + 76) |= 0x80u;
  *(unsigned char *)(v103 + 76) |= 1u;
  *(_DWORD *)(v103 + 68) = v20;
LABEL_41:

  if (a3) {
    v21 = @"itemList";
  }
  else {
    v21 = @"item_list";
  }
  v22 = [v5 objectForKeyedSubscript:v21];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v23 = [GEOPDVenueItemList alloc];
    if (v23)
    {
      id v24 = v22;
      v23 = [(GEOPDVenueItemList *)v23 init];
      if (v23)
      {
        v25 = [v24 objectForKeyedSubscript:@"title"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v26 = (void *)[v25 copy];
          -[GEOPDVenueItemList setTitle:]((uint64_t)v23, v26);
        }
        uint64_t v27 = [v24 objectForKeyedSubscript:@"item"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          obuint64_t j = v27;
          v101 = v17;
          id v91 = v5;
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          id v28 = v27;
          uint64_t v29 = [v28 countByEnumeratingWithState:&v112 objects:v118 count:16];
          if (v29)
          {
            uint64_t v30 = v29;
            uint64_t v31 = *(void *)v113;
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v113 != v31) {
                  objc_enumerationMutation(v28);
                }
                v33 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v34 = (void *)[v33 copy];
                  -[GEOPDVenueItemList addItem:]((uint64_t)v23, v34);
                }
              }
              uint64_t v30 = [v28 countByEnumeratingWithState:&v112 objects:v118 count:16];
            }
            while (v30);
          }

          id v5 = v91;
          uint64_t v27 = obj;
          v17 = v101;
        }
      }
    }
    -[GEOPDVenueInfo setItemList:](v103, v23);
  }
  if (a3) {
    v35 = @"locatedInside";
  }
  else {
    v35 = @"located_inside";
  }
  v36 = [v5 objectForKeyedSubscript:v35];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_90;
  }
  v37 = [GEOPDLocatedInsideInfo alloc];
  if (v37)
  {
    id v38 = v36;
    v37 = [(GEOPDLocatedInsideInfo *)v37 init];
    if (!v37)
    {
LABEL_88:

      goto LABEL_89;
    }
    v39 = [v38 objectForKeyedSubscript:@"muid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v40 = [v39 unsignedLongLongValue];
      *(unsigned char *)&v37->_flags |= 1u;
      v37->_muid = v40;
    }

    id v41 = [v38 objectForKeyedSubscript:v17];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v42 = v41;
      if ([v42 isEqualToString:@"VENUE_FEATURE_TYPE_UNKNOWN"])
      {
        int v43 = 0;
      }
      else if ([v42 isEqualToString:@"VENUE_FEATURE_TYPE_VENUE"])
      {
        int v43 = 1;
      }
      else if ([v42 isEqualToString:@"VENUE_FEATURE_TYPE_BUILDING"])
      {
        int v43 = 2;
      }
      else if ([v42 isEqualToString:@"VENUE_FEATURE_TYPE_LEVEL"])
      {
        int v43 = 3;
      }
      else if ([v42 isEqualToString:@"VENUE_FEATURE_TYPE_POI"])
      {
        int v43 = 4;
      }
      else
      {
        int v43 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_87:

        goto LABEL_88;
      }
      int v43 = [v41 intValue];
    }
    *(unsigned char *)&v37->_flags |= 2u;
    v37->_featureType = v43;
    goto LABEL_87;
  }
LABEL_89:
  -[GEOPDVenueInfo setLocatedInside:](v103, v37);

LABEL_90:
  if (a3) {
    id v44 = @"filterElement";
  }
  else {
    id v44 = @"filter_element";
  }
  long long v45 = [v5 objectForKeyedSubscript:v44];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v90 = v45;
    id v92 = v5;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id obja = v45;
    uint64_t v46 = [obja countByEnumeratingWithState:&v104 objects:v116 count:16];
    if (v46)
    {
      uint64_t v47 = v46;
      long long v48 = @"filter_id";
      uint64_t v49 = *(void *)v105;
      if (a3) {
        long long v48 = @"filterId";
      }
      v97 = v48;
      long long v50 = @"name_short";
      if (a3) {
        long long v50 = @"nameShort";
      }
      v93 = v50;
      uint64_t v94 = *(void *)v105;
      do
      {
        uint64_t v51 = 0;
        uint64_t v98 = v47;
        do
        {
          if (*(void *)v105 != v49) {
            objc_enumerationMutation(obja);
          }
          long long v52 = *(void **)(*((void *)&v104 + 1) + 8 * v51);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v53 = [GEOPDFilterElementInfo alloc];
            if (v53)
            {
              v54 = v53;
              id v55 = v52;
              uint64_t v56 = [(GEOPDFilterElementInfo *)v54 init];
              if (v56)
              {
                v57 = [v55 objectForKeyedSubscript:v97];
                objc_opt_class();
                id v102 = v55;
                if (objc_opt_isKindOfClass())
                {
                  long long v114 = 0u;
                  long long v115 = 0u;
                  long long v112 = 0u;
                  long long v113 = 0u;
                  v95 = v57;
                  id v58 = v57;
                  uint64_t v59 = [v58 countByEnumeratingWithState:&v112 objects:v118 count:16];
                  if (v59)
                  {
                    uint64_t v60 = v59;
                    uint64_t v61 = *(void *)v113;
                    do
                    {
                      uint64_t v62 = 0;
                      do
                      {
                        if (*(void *)v113 != v61) {
                          objc_enumerationMutation(v58);
                        }
                        v63 = *(void **)(*((void *)&v112 + 1) + 8 * v62);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          v64 = [GEOPDVenueIdentifier alloc];
                          if (v64) {
                            v65 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v64, v63, a3);
                          }
                          else {
                            v65 = 0;
                          }
                          -[GEOPDFilterElementInfo addFilterId:](v56, v65);
                        }
                        ++v62;
                      }
                      while (v60 != v62);
                      uint64_t v66 = [v58 countByEnumeratingWithState:&v112 objects:v118 count:16];
                      uint64_t v60 = v66;
                    }
                    while (v66);
                  }

                  uint64_t v49 = v94;
                  v57 = v95;
                  uint64_t v47 = v98;
                  id v55 = v102;
                }

                v67 = [v55 objectForKeyedSubscript:@"label"];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v68 = [GEOPDVenueLabel alloc];
                  if (v68)
                  {
                    v69 = v68;
                    id v70 = v67;
                    uint64_t v71 = [(GEOPDVenueLabel *)v69 init];
                    if (v71)
                    {
                      v72 = [v70 objectForKeyedSubscript:@"name"];
                      objc_opt_class();
                      id v96 = v70;
                      if (objc_opt_isKindOfClass())
                      {
                        v73 = (void *)[v72 copy];
                        id v74 = v73;
                        *(unsigned char *)(v71 + 60) |= 8u;
                        *(unsigned char *)(v71 + 60) |= 0x10u;
                        v75 = v73;
                        id v70 = v96;
                        objc_storeStrong((id *)(v71 + 40), v75);

                        uint64_t v49 = v94;
                      }

                      v76 = [v70 objectForKeyedSubscript:v93];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v77 = (void *)[v76 copy];
                        id v78 = v77;
                        *(unsigned char *)(v71 + 60) |= 4u;
                        *(unsigned char *)(v71 + 60) |= 0x10u;
                        v79 = v77;
                        id v70 = v96;
                        objc_storeStrong((id *)(v71 + 32), v79);

                        uint64_t v49 = v94;
                      }

                      v80 = [v70 objectForKeyedSubscript:@"detail"];
                      objc_opt_class();
                      if (objc_opt_isKindOfClass())
                      {
                        v81 = (void *)[v80 copy];
                        id v82 = v81;
                        *(unsigned char *)(v71 + 60) |= 2u;
                        *(unsigned char *)(v71 + 60) |= 0x10u;
                        v83 = v81;
                        id v70 = v96;
                        objc_storeStrong((id *)(v71 + 24), v83);

                        uint64_t v49 = v94;
                      }
                    }
                  }
                  else
                  {
                    uint64_t v71 = 0;
                  }
                  id v84 = (id)v71;
                  *(unsigned char *)(v56 + 52) |= 4u;
                  *(unsigned char *)(v56 + 52) |= 8u;
                  objc_storeStrong((id *)(v56 + 32), (id)v71);

                  uint64_t v47 = v98;
                  id v55 = v102;
                }
              }
            }
            else
            {
              uint64_t v56 = 0;
            }
            -[GEOPDVenueInfo addFilterElement:](v103, (void *)v56);
          }
          ++v51;
        }
        while (v51 != v47);
        uint64_t v85 = [obja countByEnumeratingWithState:&v104 objects:v116 count:16];
        uint64_t v47 = v85;
      }
      while (v85);
    }

    long long v45 = v90;
    id v5 = v92;
  }

  if (a3) {
    v86 = @"goInsideLevel";
  }
  else {
    v86 = @"go_inside_level";
  }
  v87 = objc_msgSend(v5, "objectForKeyedSubscript:", v86, v90);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v88 = [v87 intValue];
    *(unsigned char *)(v103 + 76) |= 0x80u;
    *(unsigned char *)(v103 + 76) |= 2u;
    *(_DWORD *)(v103 + 72) = v88;
  }

LABEL_148:
  return v103;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDVenueInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader) {
    goto LABEL_31;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  $828191250CE4E31CB4ADEBFBD46947E8 flags = self->_flags;
  if (*(unsigned int *)&flags > 0x3F) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    itemList = self->_itemList;
    if (itemList)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&itemList->_readerLock);
      int v8 = *(unsigned char *)&itemList->_flags & 0xE;
      os_unfair_lock_unlock(&itemList->_readerLock);
      if (v8) {
        goto LABEL_31;
      }
      *(unsigned char *)&$828191250CE4E31CB4ADEBFBD46947E8 flags = self->_flags;
    }
  }
  if ((*(unsigned char *)&flags & 0x28) == 0)
  {
    if ((*(unsigned char *)&flags & 0x40) != 0)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      obuint64_t j = self->_venueFeatureIds;
      uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v47 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v41;
LABEL_11:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v41 != v10) {
            objc_enumerationMutation(obj);
          }
          if (GEOPDVenueIdentifierIsDirty(*(void *)(*((void *)&v40 + 1) + 8 * v11))) {
            goto LABEL_30;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v40 objects:v47 count:16];
            if (v9) {
              goto LABEL_11;
            }
            break;
          }
        }
      }

      *(unsigned char *)&$828191250CE4E31CB4ADEBFBD46947E8 flags = self->_flags;
    }
    if ((*(unsigned char *)&flags & 8) != 0)
    {
      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      obuint64_t j = self->_filterElements;
      uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v46 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v37;
LABEL_21:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(os_unfair_lock_s **)(*((void *)&v36 + 1) + 8 * v14);
          if (v15)
          {
            os_unfair_lock_lock_with_options();
            char IsDirty = _GEOPDFilterElementInfoIsDirty((uint64_t)v15);
            os_unfair_lock_unlock(v15 + 12);
            if (IsDirty) {
              break;
            }
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [(NSMutableArray *)obj countByEnumeratingWithState:&v36 objects:v46 count:16];
            if (v12) {
              goto LABEL_21;
            }
            goto LABEL_28;
          }
        }
LABEL_30:

        goto LABEL_31;
      }
LABEL_28:
    }
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v18 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v18];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_54;
  }
LABEL_31:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 0);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v19 = self->_venueFeatureIds;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v32 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v32 objects:v45 count:16];
    }
    while (v20);
  }

  if (*(unsigned char *)&self->_flags) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_itemList) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_locatedInside) {
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v23 = self->_filterElements;
  uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v23);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v28 objects:v44 count:16];
    }
    while (v24);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
LABEL_54:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x80000000) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDVenueInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 0);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v9 = self->_venueFeatureIds;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDVenueInfo addVenueFeatureId:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 68) = self->_featureType;
    *(unsigned char *)(v5 + 76) |= 1u;
  }
  id v14 = [(GEOPDVenueItemList *)self->_itemList copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  id v16 = [(GEOPDLocatedInsideInfo *)self->_locatedInside copyWithZone:a3];
  v17 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v16;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = self->_filterElements;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v18);
        }
        v22 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * j), "copyWithZone:", a3, (void)v25);
        -[GEOPDVenueInfo addFilterElement:](v5, v22);
      }
      uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v19);
  }

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_goInsideLevel;
    *(unsigned char *)(v5 + 76) |= 2u;
  }
  v23 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v23;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 1);
  -[GEOPDVenueInfo readAll:]((uint64_t)v4, 1);
  venueFeatureIds = self->_venueFeatureIds;
  if ((unint64_t)venueFeatureIds | *((void *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](venueFeatureIds, "isEqual:")) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 76) & 1) == 0 || self->_featureType != *((_DWORD *)v4 + 17)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 76))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  itemList = self->_itemList;
  if ((unint64_t)itemList | *((void *)v4 + 4) && !-[GEOPDVenueItemList isEqual:](itemList, "isEqual:")) {
    goto LABEL_19;
  }
  locatedInside = self->_locatedInside;
  if ((unint64_t)locatedInside | *((void *)v4 + 5))
  {
    if (!-[GEOPDLocatedInsideInfo isEqual:](locatedInside, "isEqual:")) {
      goto LABEL_19;
    }
  }
  filterElements = self->_filterElements;
  if ((unint64_t)filterElements | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](filterElements, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 76) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 76) & 2) == 0 || self->_goInsideLevel != *((_DWORD *)v4 + 18)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDVenueInfo readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_venueFeatureIds hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_featureType;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOPDVenueItemList *)self->_itemList hash];
  unint64_t v6 = [(GEOPDLocatedInsideInfo *)self->_locatedInside hash];
  uint64_t v7 = [(NSMutableArray *)self->_filterElements hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_goInsideLevel;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 76) |= 4u;
    *(unsigned char *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDVenueInfo readAll:](a1, 0);
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v5 = *(id *)(a1 + 48);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v33 != v8) {
              objc_enumerationMutation(v5);
            }
            -[GEOPDVenueIdentifier clearUnknownFields:](*(void *)(*((void *)&v32 + 1) + 8 * i), 1);
          }
          uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v41 count:16];
        }
        while (v7);
      }

      uint64_t v10 = *(void *)(a1 + 32);
      if (v10)
      {
        os_unfair_lock_lock_with_options();
        *(unsigned char *)(v10 + 52) |= 1u;
        *(unsigned char *)(v10 + 52) |= 8u;
        os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 48));
        uint64_t v11 = *(void **)(v10 + 16);
        *(void *)(v10 + 16) = 0;

        -[GEOPDVenueItemList readAll:](v10, 0);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      if (v12)
      {
        uint64_t v13 = *(void **)(v12 + 8);
        *(void *)(v12 + 8) = 0;
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      obuint64_t j = *(id *)(a1 + 24);
      uint64_t v14 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v29;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void *)(*((void *)&v28 + 1) + 8 * j);
            if (v18)
            {
              os_unfair_lock_lock_with_options();
              *(unsigned char *)(v18 + 52) |= 1u;
              *(unsigned char *)(v18 + 52) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 48));
              uint64_t v19 = *(void **)(v18 + 16);
              *(void *)(v18 + 16) = 0;

              -[GEOPDFilterElementInfo readAll:](v18, 0);
              long long v38 = 0u;
              long long v39 = 0u;
              long long v36 = 0u;
              long long v37 = 0u;
              id v20 = *(id *)(v18 + 24);
              uint64_t v21 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
              if (v21)
              {
                uint64_t v22 = v21;
                uint64_t v23 = *(void *)v37;
                do
                {
                  for (uint64_t k = 0; k != v22; ++k)
                  {
                    if (*(void *)v37 != v23) {
                      objc_enumerationMutation(v20);
                    }
                    -[GEOPDVenueIdentifier clearUnknownFields:](*(void *)(*((void *)&v36 + 1) + 8 * k), 1);
                  }
                  uint64_t v22 = [v20 countByEnumeratingWithState:&v36 objects:v42 count:16];
                }
                while (v22);
              }

              uint64_t v25 = *(void *)(v18 + 32);
              if (v25)
              {
                os_unfair_lock_lock_with_options();
                *(unsigned char *)(v25 + 60) |= 1u;
                *(unsigned char *)(v25 + 60) |= 0x10u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 56));
                long long v26 = *(void **)(v25 + 16);
                *(void *)(v25 + 16) = 0;

                -[GEOPDVenueLabel readAll:](v25, 0);
              }
            }
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
        }
        while (v15);
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueFeatureIds, 0);
  objc_storeStrong((id *)&self->_locatedInside, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_storeStrong((id *)&self->_filterElements, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

void __57__GEOPDVenueInfo_PlaceDataExtras__venueInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue venueInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

@end