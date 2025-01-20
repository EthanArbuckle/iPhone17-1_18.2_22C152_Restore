@interface GEOPDSSearchFilter
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDSSearchFilter)init;
- (GEOPDSSearchFilter)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)addressResultSubTypeFilter;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)implictQueryCategoryFilter;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)mergeFrom:(uint64_t)a1;
- (uint64_t)searchIntentFilter;
- (unint64_t)hash;
- (void)_readAddressResultSubTypeFilter;
- (void)_readImplictQueryCategoryFilter;
- (void)_readResultTypeFilters;
- (void)addResultTypeFilter:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)setAddressResultSubTypeFilter:(uint64_t)a1;
- (void)setBrandFilter:(uint64_t)a1;
- (void)setCategoryFilter:(uint64_t)a1;
- (void)setImplictQueryCategoryFilter:(uint64_t)a1;
- (void)setPoiIconCategoryFilter:(uint64_t)a1;
- (void)setVenueFilter:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDSSearchFilter

- (GEOPDSSearchFilter)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDSSearchFilter;
  v2 = [(GEOPDSSearchFilter *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSSearchFilter)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDSSearchFilter;
  v3 = [(GEOPDSSearchFilter *)&v7 initWithData:a3];
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSSearchFilter;
  [(GEOPDSSearchFilter *)&v3 dealloc];
}

- (void)setVenueFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x200u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setCategoryFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x40u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setBrandFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x20u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (uint64_t)searchIntentFilter
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 116);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    if (v2) {
      return *(unsigned int *)(v1 + 108);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)setPoiIconCategoryFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x100u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 80), a2);
  }
}

- (void)_readImplictQueryCategoryFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readImplictQueryCategoryFilter_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)implictQueryCategoryFilter
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDSSearchFilter _readImplictQueryCategoryFilter]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setImplictQueryCategoryFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x80u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

- (void)_readResultTypeFilters
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResultTypeFilters_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (void)addResultTypeFilter:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSSearchFilter _readResultTypeFilters](a1);
    PBRepeatedInt32Add();
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 116) |= 0x400u;
  }
}

- (void)_readAddressResultSubTypeFilter
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAddressResultSubTypeFilter_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)addressResultSubTypeFilter
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOPDSSearchFilter _readAddressResultSubTypeFilter]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setAddressResultSubTypeFilter:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 116) |= 0x10u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSSearchFilter;
  id v4 = [(GEOPDSSearchFilter *)&v8 description];
  v5 = [(GEOPDSSearchFilter *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSSearchFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDSSearchFilter readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVenueFilter_tags_0);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v7 = *(id *)(a1 + 88);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"venueFilter";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"venue_filter";
      }
      [v4 setObject:v9 forKey:v10];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCategoryFilter_tags);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v13 = *(id *)(a1 + 64);
    v14 = v13;
    if (v13)
    {
      if (a2)
      {
        v15 = [v13 jsonRepresentation];
        v16 = @"categoryFilter";
      }
      else
      {
        v15 = [v13 dictionaryRepresentation];
        v16 = @"category_filter";
      }
      [v4 setObject:v15 forKey:v16];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBrandFilter_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v19 = *(id *)(a1 + 56);
    v20 = v19;
    if (v19)
    {
      if (a2)
      {
        v21 = [v19 jsonRepresentation];
        v22 = @"brandFilter";
      }
      else
      {
        v21 = [v19 dictionaryRepresentation];
        v22 = @"brand_filter";
      }
      [v4 setObject:v21 forKey:v22];
    }
    if (*(_WORD *)(a1 + 116))
    {
      uint64_t v23 = *(int *)(a1 + 108);
      if (v23 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 108));
        v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = off_1E53DDA90[v23];
      }
      if (a2) {
        v25 = @"searchIntentFilter";
      }
      else {
        v25 = @"search_intent_filter";
      }
      [v4 setObject:v24 forKey:v25];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v26 = *(void **)(a1 + 8);
      if (v26)
      {
        id v27 = v26;
        objc_sync_enter(v27);
        GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiIconCategoryFilter_tags_0);
        objc_sync_exit(v27);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    id v28 = *(id *)(a1 + 80);
    v29 = v28;
    if (v28)
    {
      if (a2)
      {
        v30 = [v28 jsonRepresentation];
        v31 = @"poiIconCategoryFilter";
      }
      else
      {
        v30 = [v28 dictionaryRepresentation];
        v31 = @"poi_icon_category_filter";
      }
      [v4 setObject:v30 forKey:v31];
    }
    v32 = -[GEOPDSSearchFilter implictQueryCategoryFilter]((id *)a1);
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"implictQueryCategoryFilter";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"implict_query_category_filter";
      }
      [v4 setObject:v34 forKey:v35];
    }
    if ((*(_WORD *)(a1 + 116) & 2) != 0)
    {
      v36 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 112)];
      if (a2) {
        v37 = @"isStrictMapRegion";
      }
      else {
        v37 = @"is_strict_map_region";
      }
      [v4 setObject:v36 forKey:v37];
    }
    if (*(void *)(a1 + 32))
    {
      v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
      v39 = (void *)(a1 + 24);
      if (*(void *)(a1 + 32))
      {
        unint64_t v40 = 0;
        do
        {
          uint64_t v41 = *(int *)(*v39 + 4 * v40);
          if (v41 >= 4)
          {
            objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v41);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = off_1E53DDA30[v41];
          }
          [v38 addObject:v42];

          ++v40;
          v39 = (void *)(a1 + 24);
        }
        while (v40 < *(void *)(a1 + 32));
      }
      if (a2) {
        v43 = @"resultTypeFilter";
      }
      else {
        v43 = @"result_type_filter";
      }
      [v4 setObject:v38 forKey:v43];
    }
    v44 = -[GEOPDSSearchFilter addressResultSubTypeFilter]((id *)a1);
    v45 = v44;
    if (v44)
    {
      if (a2)
      {
        v46 = [v44 jsonRepresentation];
        v47 = @"addressResultSubTypeFilter";
      }
      else
      {
        v46 = [v44 dictionaryRepresentation];
        v47 = @"address_result_sub_type_filter";
      }
      [v4 setObject:v46 forKey:v47];
    }
    v48 = *(void **)(a1 + 16);
    if (v48)
    {
      v49 = [v48 dictionaryRepresentation];
      v50 = v49;
      if (a2)
      {
        v51 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __48__GEOPDSSearchFilter__dictionaryRepresentation___block_invoke;
        v55[3] = &unk_1E53D8860;
        id v52 = v51;
        id v56 = v52;
        [v50 enumerateKeysAndObjectsUsingBlock:v55];
        id v53 = v52;

        v50 = v53;
      }
      [v4 setObject:v50 forKey:@"Unknown Fields"];
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
  return -[GEOPDSSearchFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_570;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_571;
      }
      GEOPDSSearchFilterReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDSSearchFilterCallReadAllRecursiveWithoutSynchronized((void *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __48__GEOPDSSearchFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1)
  {
    uint64_t v6 = 0;
    goto LABEL_209;
  }
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"venueFilter";
    }
    else {
      id v7 = @"venue_filter";
    }
    objc_super v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_31:

      if (a3) {
        v20 = @"categoryFilter";
      }
      else {
        v20 = @"category_filter";
      }
      v21 = [v5 objectForKeyedSubscript:v20];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [GEOPDSCategoryFilter alloc];
        if (v22)
        {
          uint64_t v23 = v22;
          id v24 = v21;
          v25 = [(GEOPDSCategoryFilter *)v23 init];
          if (v25)
          {
            if (a3) {
              v26 = @"categoryMetadata";
            }
            else {
              v26 = @"category_metadata";
            }
            id v27 = [v24 objectForKeyedSubscript:v26];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v27 options:0];
              -[GEOPDSCategoryFilter setCategoryMetadata:]((uint64_t)v25, v28);
            }
          }
        }
        else
        {
          v25 = 0;
        }
        -[GEOPDSSearchFilter setCategoryFilter:](v6, v25);
      }
      if (a3) {
        v29 = @"brandFilter";
      }
      else {
        v29 = @"brand_filter";
      }
      v30 = [v5 objectForKeyedSubscript:v29];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v31 = [GEOPDSBrandFilter alloc];
        if (v31)
        {
          v32 = v31;
          id v33 = v30;
          uint64_t v34 = [(GEOPDSBrandFilter *)v32 init];
          if (v34)
          {
            if (a3) {
              v35 = @"brandMuid";
            }
            else {
              v35 = @"brand_muid";
            }
            v36 = [v33 objectForKeyedSubscript:v35];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v37 = [v36 unsignedLongLongValue];
              *(unsigned char *)(v34 + 24) |= 1u;
              *(void *)(v34 + 16) = v37;
            }
          }
        }
        else
        {
          uint64_t v34 = 0;
        }
        -[GEOPDSSearchFilter setBrandFilter:](v6, (void *)v34);
      }
      if (a3) {
        v38 = @"searchIntentFilter";
      }
      else {
        v38 = @"search_intent_filter";
      }
      v39 = [v5 objectForKeyedSubscript:v38];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v40 = v39;
        if ([v40 isEqualToString:@"SEARCH_INTENT_TYPE_UNKNOWN"])
        {
          int v41 = 0;
        }
        else if ([v40 isEqualToString:@"SEARCH_INTENT_TYPE_POI_ONLY"])
        {
          int v41 = 1;
        }
        else if ([v40 isEqualToString:@"SEARCH_INTENT_TYPE_GEO_CODING_ONLY"])
        {
          int v41 = 2;
        }
        else if ([v40 isEqualToString:@"SEARCH_INTENT_TYPE_ANY"])
        {
          int v41 = 3;
        }
        else
        {
          int v41 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_76;
        }
        int v41 = [v39 intValue];
      }
      *(_WORD *)(v6 + 116) |= 0x400u;
      *(_WORD *)(v6 + 116) |= 1u;
      *(_DWORD *)(v6 + 108) = v41;
LABEL_76:

      if (a3) {
        v42 = @"poiIconCategoryFilter";
      }
      else {
        v42 = @"poi_icon_category_filter";
      }
      v43 = [v5 objectForKeyedSubscript:v42];
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
        -[GEOPDSSearchFilter setPoiIconCategoryFilter:](v6, v45);
      }
      if (a3) {
        v46 = @"implictQueryCategoryFilter";
      }
      else {
        v46 = @"implict_query_category_filter";
      }
      v47 = [v5 objectForKeyedSubscript:v46];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_174;
      }
      v48 = [GEOPDSImplicitQueryCategoryFilter alloc];
      if (!v48)
      {
        uint64_t v51 = 0;
        goto LABEL_173;
      }
      v49 = v48;
      id v50 = v47;
      uint64_t v51 = [(GEOPDSImplicitQueryCategoryFilter *)v49 init];
      if (!v51)
      {
LABEL_172:

LABEL_173:
        -[GEOPDSSearchFilter setImplictQueryCategoryFilter:](v6, (void *)v51);

LABEL_174:
        if (a3) {
          v98 = @"isStrictMapRegion";
        }
        else {
          v98 = @"is_strict_map_region";
        }
        v99 = [v5 objectForKeyedSubscript:v98];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v100 = [v99 BOOLValue];
          *(_WORD *)(v6 + 116) |= 0x400u;
          *(_WORD *)(v6 + 116) |= 2u;
          *(unsigned char *)(v6 + 112) = v100;
        }

        if (a3) {
          v101 = @"resultTypeFilter";
        }
        else {
          v101 = @"result_type_filter";
        }
        v102 = [v5 objectForKeyedSubscript:v101];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v119 = a3;
          v115 = v102;
          id v118 = v5;
          long long v122 = 0u;
          long long v123 = 0u;
          long long v120 = 0u;
          long long v121 = 0u;
          id v103 = v102;
          uint64_t v104 = [v103 countByEnumeratingWithState:&v120 objects:v124 count:16];
          if (!v104) {
            goto LABEL_200;
          }
          uint64_t v105 = v104;
          uint64_t v106 = *(void *)v121;
          while (1)
          {
            for (uint64_t i = 0; i != v105; ++i)
            {
              if (*(void *)v121 != v106) {
                objc_enumerationMutation(v103);
              }
              v108 = *(void **)(*((void *)&v120 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v109 = v108;
                if (([v109 isEqualToString:@"SEARCH_RESULT_TYPE_FILTER_UNKNOWN"] & 1) == 0
                  && ([v109 isEqualToString:@"SEARCH_RESULT_TYPE_FILTER_POI"] & 1) == 0
                  && ([v109 isEqualToString:@"SEARCH_RESULT_TYPE_FILTER_PHYSICAL_FEATURE"] & 1) == 0)
                {
                  [v109 isEqualToString:@"SEARCH_RESULT_TYPE_FILTER_ADDRESS"];
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
                [v108 intValue];
              }
              -[GEOPDSSearchFilter addResultTypeFilter:](v6);
            }
            uint64_t v105 = [v103 countByEnumeratingWithState:&v120 objects:v124 count:16];
            if (!v105)
            {
LABEL_200:

              v102 = v115;
              id v5 = v118;
              a3 = v119;
              break;
            }
          }
        }

        if (a3) {
          v110 = @"addressResultSubTypeFilter";
        }
        else {
          v110 = @"address_result_sub_type_filter";
        }
        v111 = [v5 objectForKeyedSubscript:v110];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v112 = [GEOPDAddressResultSubTypeFilter alloc];
          if (v112) {
            v113 = (void *)-[GEOPDAddressResultSubTypeFilter _initWithDictionary:isJSON:](v112, v111, a3);
          }
          else {
            v113 = 0;
          }
          -[GEOPDSSearchFilter setAddressResultSubTypeFilter:](v6, v113);
        }
        goto LABEL_209;
      }
      if (a3) {
        id v52 = @"implicitQueryType";
      }
      else {
        id v52 = @"implicit_query_type";
      }
      id v53 = [v50 objectForKeyedSubscript:v52];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v54 = v53;
        if ([v54 isEqualToString:@"IMPLICIT_QUERY_TYPE_UNKNOWN"])
        {
          int v55 = 0;
        }
        else if ([v54 isEqualToString:@"IMPLICIT_QUERY_TYPE_SEARCH_FOR_EVCHARGER"])
        {
          int v55 = 1;
        }
        else if ([v54 isEqualToString:@"IMPLICIT_QUERY_TYPE_SEARCH_AROUND_POI"])
        {
          int v55 = 2;
        }
        else if ([v54 isEqualToString:@"IMPLICIT_QUERY_TYPE_SEARCH_AROUND_HIKING"])
        {
          int v55 = 3;
        }
        else if ([v54 isEqualToString:@"IMPLICIT_QUERY_TYPE_SEARCH_FOR_BEACH_AND_RELATED_CONCEPT"])
        {
          int v55 = 4;
        }
        else
        {
          int v55 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_108:

          if (a3) {
            id v56 = @"implicitQuerySearchForEvcharger";
          }
          else {
            id v56 = @"implicit_query_search_for_evcharger";
          }
          v57 = [v50 objectForKeyedSubscript:v56];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v58 = [GEOPDSImplicitQuerySearchForEVCharger alloc];
            if (v58)
            {
              v59 = v58;
              id v60 = v57;
              uint64_t v61 = [(GEOPDSImplicitQuerySearchForEVCharger *)v59 init];
              if (v61)
              {
                if (a3) {
                  v62 = @"encryptedCurrentEvchargerStopMuid";
                }
                else {
                  v62 = @"encrypted_current_evcharger_stop_muid";
                }
                v63 = [v60 objectForKeyedSubscript:v62];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v64 = [v63 unsignedLongLongValue];
                  *(unsigned char *)(v61 + 24) |= 1u;
                  *(void *)(v61 + 16) = v64;
                }
              }
            }
            else
            {
              uint64_t v61 = 0;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchForEvcharger:](v51, (void *)v61);
          }
          if (a3) {
            v65 = @"implicitQuerySearchAroundPoi";
          }
          else {
            v65 = @"implicit_query_search_around_poi";
          }
          v66 = [v50 objectForKeyedSubscript:v65];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v67 = [GEOPDSImplicitQuerySearchAroundPOI alloc];
            if (v67)
            {
              v68 = v67;
              id v69 = v66;
              uint64_t v70 = [(GEOPDSImplicitQuerySearchAroundPOI *)v68 init];
              if (v70)
              {
                id v116 = v50;
                if (a3) {
                  v71 = @"categoryIdOfPoi";
                }
                else {
                  v71 = @"category_id_of_poi";
                }
                v72 = [v69 objectForKeyedSubscript:v71];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v73 = (void *)[v72 copy];
                  -[GEOPDSImplicitQuerySearchAroundPOI setCategoryIdOfPoi:](v70, v73);
                }
                if (a3) {
                  v74 = @"referenceLocation";
                }
                else {
                  v74 = @"reference_location";
                }
                [v69 objectForKeyedSubscript:v74];
                v76 = int v75 = a3;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v77 = [GEOLatLng alloc];
                  if (v75) {
                    v78 = [(GEOLatLng *)v77 initWithJSON:v76];
                  }
                  else {
                    v78 = [(GEOLatLng *)v77 initWithDictionary:v76];
                  }
                  v79 = v78;
                  -[GEOPDSImplicitQuerySearchAroundPOI setReferenceLocation:](v70, v78);
                }
                if (v75) {
                  v80 = @"encryptedMuidOfPoi";
                }
                else {
                  v80 = @"encrypted_muid_of_poi";
                }
                v81 = [v69 objectForKeyedSubscript:v80];
                objc_opt_class();
                a3 = v75;
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v82 = [v81 unsignedLongLongValue];
                  *(unsigned char *)(v70 + 60) |= 0x10u;
                  *(unsigned char *)(v70 + 60) |= 1u;
                  *(void *)(v70 + 32) = v82;
                }

                id v50 = v116;
              }
            }
            else
            {
              uint64_t v70 = 0;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchAroundPoi:](v51, (void *)v70);
          }
          if (a3) {
            v83 = @"implicitQueryIntroTipForHiking";
          }
          else {
            v83 = @"implicit_query_intro_tip_for_hiking";
          }
          v84 = [v50 objectForKeyedSubscript:v83];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v85 = [GEOPDSImplicitQueryIntroTipForHiking alloc];
            if (v85)
            {
              v86 = v85;
              id v87 = v84;
              uint64_t v88 = [(GEOPDSImplicitQueryIntroTipForHiking *)v86 init];
              if (v88)
              {
                id v117 = v50;
                if (a3) {
                  v89 = @"referenceLocation";
                }
                else {
                  v89 = @"reference_location";
                }
                [v87 objectForKeyedSubscript:v89];
                v91 = int v90 = a3;
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v92 = [GEOLatLng alloc];
                  if (v90) {
                    v93 = [(GEOLatLng *)v92 initWithJSON:v91];
                  }
                  else {
                    v93 = [(GEOLatLng *)v92 initWithDictionary:v91];
                  }
                  v94 = v93;
                  -[GEOPDSImplicitQueryIntroTipForHiking setReferenceLocation:](v88, v93);
                }
                if (v90) {
                  v95 = @"encryptedMuidOfPoi";
                }
                else {
                  v95 = @"encrypted_muid_of_poi";
                }
                v96 = [v87 objectForKeyedSubscript:v95];
                objc_opt_class();
                a3 = v90;
                if (objc_opt_isKindOfClass())
                {
                  uint64_t v97 = [v96 unsignedLongLongValue];
                  *(unsigned char *)(v88 + 32) |= 1u;
                  *(void *)(v88 + 16) = v97;
                }

                id v50 = v117;
              }
            }
            else
            {
              uint64_t v88 = 0;
            }
            -[GEOPDSImplicitQueryCategoryFilter setImplicitQueryIntroTipForHiking:](v51, (void *)v88);
          }
          goto LABEL_172;
        }
        int v55 = [v53 intValue];
      }
      *(unsigned char *)(v51 + 64) |= 0x20u;
      *(unsigned char *)(v51 + 64) |= 1u;
      *(_DWORD *)(v51 + 60) = v55;
      goto LABEL_108;
    }
    v9 = [GEOPDSSearchVenueFilter alloc];
    if (!v9)
    {
      uint64_t v12 = 0;
      goto LABEL_30;
    }
    id v10 = v9;
    id v11 = v8;
    uint64_t v12 = [(GEOPDSSearchVenueFilter *)v10 init];
    if (!v12)
    {
LABEL_29:

LABEL_30:
      -[GEOPDSSearchFilter setVenueFilter:](v6, (void *)v12);

      goto LABEL_31;
    }
    id v13 = [v11 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = [GEOPDVenueIdentifier alloc];
      if (v14) {
        v15 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v14, v13, a3);
      }
      else {
        v15 = 0;
      }
      -[GEOPDSSearchVenueFilter setVenueFilter:](v12, v15);
    }
    if (a3) {
      v16 = @"venueSearchType";
    }
    else {
      v16 = @"venue_search_type";
    }
    v17 = [v11 objectForKeyedSubscript:v16];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v18 = v17;
      if ([v18 isEqualToString:@"SEARCH_TYPE_UNKNOWN"])
      {
        int v19 = 0;
      }
      else if ([v18 isEqualToString:@"SEARCH_TYPE_INSIDE"])
      {
        int v19 = 1;
      }
      else if ([v18 isEqualToString:@"SEARCH_TYPE_BUILDING_ONLY"])
      {
        int v19 = 2;
      }
      else
      {
        int v19 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      int v19 = [v17 intValue];
    }
    *(unsigned char *)(v12 + 28) |= 1u;
    *(_DWORD *)(v12 + 24) = v19;
    goto LABEL_28;
  }
LABEL_209:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSSearchFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOPDSSearchFilterIsDirty((uint64_t)self))
  {
    id v7 = self->_reader;
    objc_sync_enter(v7);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v8 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v9 writeData:v8];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSSearchFilter readAll:]((uint64_t)self, 0);
    if (self->_venueFilter) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v9;
    if (self->_categoryFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_brandFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (*(_WORD *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v9;
    }
    if (self->_poiIconCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if (self->_implictQueryCategoryFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    if ((*(_WORD *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v9;
    }
    if (self->_resultTypeFilters.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        id v5 = v9;
        ++v6;
      }
      while (v6 < self->_resultTypeFilters.count);
    }
    if (self->_addressResultSubTypeFilter)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v9;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDSSearchFilter _readImplictQueryCategoryFilter](result);
    uint64_t v4 = *(void *)(v3 + 72);
    return -[GEOPDSImplicitQueryCategoryFilter hasGreenTeaWithValue:](v4, a2);
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
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDSSearchFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSSearchFilter readAll:]((uint64_t)self, 0);
  id v9 = [(GEOPDSSearchVenueFilter *)self->_venueFilter copyWithZone:a3];
  id v10 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v9;

  id v11 = [(GEOPDSCategoryFilter *)self->_categoryFilter copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v11;

  id v13 = [(GEOPDSBrandFilter *)self->_brandFilter copyWithZone:a3];
  v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 108) = self->_searchIntentFilter;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  id v15 = [(GEOPDPoiIconCategoryFilter *)self->_poiIconCategoryFilter copyWithZone:a3];
  v16 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v15;

  id v17 = [(GEOPDSImplicitQueryCategoryFilter *)self->_implictQueryCategoryFilter copyWithZone:a3];
  id v18 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v17;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 112) = self->_isStrictMapRegion;
    *(_WORD *)(v5 + 116) |= 2u;
  }
  PBRepeatedInt32Copy();
  id v19 = [(GEOPDAddressResultSubTypeFilter *)self->_addressResultSubTypeFilter copyWithZone:a3];
  v20 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v19;

  v21 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v21;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  -[GEOPDSSearchFilter readAll:]((uint64_t)self, 1);
  -[GEOPDSSearchFilter readAll:]((uint64_t)v4, 1);
  venueFilter = self->_venueFilter;
  if ((unint64_t)venueFilter | *((void *)v4 + 11))
  {
    if (!-[GEOPDSSearchVenueFilter isEqual:](venueFilter, "isEqual:")) {
      goto LABEL_28;
    }
  }
  categoryFilter = self->_categoryFilter;
  if ((unint64_t)categoryFilter | *((void *)v4 + 8))
  {
    if (!-[GEOPDSCategoryFilter isEqual:](categoryFilter, "isEqual:")) {
      goto LABEL_28;
    }
  }
  brandFilter = self->_brandFilter;
  if ((unint64_t)brandFilter | *((void *)v4 + 7))
  {
    if (!-[GEOPDSBrandFilter isEqual:](brandFilter, "isEqual:")) {
      goto LABEL_28;
    }
  }
  __int16 v8 = *((_WORD *)v4 + 58);
  if (*(_WORD *)&self->_flags)
  {
    if ((v8 & 1) == 0 || self->_searchIntentFilter != *((_DWORD *)v4 + 27)) {
      goto LABEL_28;
    }
  }
  else if (v8)
  {
    goto LABEL_28;
  }
  poiIconCategoryFilter = self->_poiIconCategoryFilter;
  if ((unint64_t)poiIconCategoryFilter | *((void *)v4 + 10)
    && !-[GEOPDPoiIconCategoryFilter isEqual:](poiIconCategoryFilter, "isEqual:"))
  {
    goto LABEL_28;
  }
  implictQueryCategoryFilter = self->_implictQueryCategoryFilter;
  if ((unint64_t)implictQueryCategoryFilter | *((void *)v4 + 9))
  {
    if (!-[GEOPDSImplicitQueryCategoryFilter isEqual:](implictQueryCategoryFilter, "isEqual:")) {
      goto LABEL_28;
    }
  }
  __int16 v11 = *((_WORD *)v4 + 58);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v11 & 2) != 0)
    {
      if (self->_isStrictMapRegion)
      {
        if (!*((unsigned char *)v4 + 112)) {
          goto LABEL_28;
        }
        goto LABEL_25;
      }
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_25;
      }
    }
LABEL_28:
    char v13 = 0;
    goto LABEL_29;
  }
  if ((v11 & 2) != 0) {
    goto LABEL_28;
  }
LABEL_25:
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_28;
  }
  addressResultSubTypeFilter = self->_addressResultSubTypeFilter;
  if ((unint64_t)addressResultSubTypeFilter | *((void *)v4 + 6)) {
    char v13 = -[GEOPDAddressResultSubTypeFilter isEqual:](addressResultSubTypeFilter, "isEqual:");
  }
  else {
    char v13 = 1;
  }
LABEL_29:

  return v13;
}

- (unint64_t)hash
{
  -[GEOPDSSearchFilter readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOPDSSearchVenueFilter *)self->_venueFilter hash];
  unint64_t v4 = [(GEOPDSCategoryFilter *)self->_categoryFilter hash];
  unint64_t v5 = [(GEOPDSBrandFilter *)self->_brandFilter hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_searchIntentFilter;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOPDPoiIconCategoryFilter *)self->_poiIconCategoryFilter hash];
  unint64_t v8 = [(GEOPDSImplicitQueryCategoryFilter *)self->_implictQueryCategoryFilter hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_isStrictMapRegion;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  uint64_t v11 = PBRepeatedInt32Hash();
  return v10 ^ v11 ^ [(GEOPDAddressResultSubTypeFilter *)self->_addressResultSubTypeFilter hash];
}

- (uint64_t)mergeFrom:(uint64_t)a1
{
  unint64_t v3 = a2;
  if (!a1) {
    goto LABEL_91;
  }
  v46 = v3;
  -[GEOPDSSearchFilter readAll:]((uint64_t)v3, 0);
  uint64_t v4 = (uint64_t)v46;
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v6 = (void *)v46[11];
  if (v5)
  {
    if (!v6) {
      goto LABEL_15;
    }
    unint64_t v7 = v6;
    uint64_t v8 = *(void *)(v5 + 16);
    uint64_t v9 = (void *)v7[2];
    if (v8)
    {
      if (v9) {
        -[GEOPDVenueIdentifier mergeFrom:](v8, v9);
      }
    }
    else if (v9)
    {
      -[GEOPDSSearchVenueFilter setVenueFilter:](v5, v9);
    }
    if (*((unsigned char *)v7 + 28))
    {
      *(_DWORD *)(v5 + 24) = *((_DWORD *)v7 + 6);
      *(unsigned char *)(v5 + 28) |= 1u;
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_15;
    }
    -[GEOPDSSearchFilter setVenueFilter:](a1, v6);
  }
  uint64_t v4 = (uint64_t)v46;
LABEL_15:
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t v11 = *(void **)(v4 + 64);
  if (!v10)
  {
    if (!v11) {
      goto LABEL_22;
    }
    -[GEOPDSSearchFilter setCategoryFilter:](a1, v11);
    goto LABEL_21;
  }
  if (v11)
  {
    uint64_t v12 = (void *)v11[2];
    if (v12)
    {
      -[GEOPDSCategoryFilter setCategoryMetadata:](v10, v12);
LABEL_21:
      uint64_t v4 = (uint64_t)v46;
    }
  }
LABEL_22:
  uint64_t v13 = *(void *)(a1 + 56);
  v14 = *(void **)(v4 + 56);
  if (v13)
  {
    if (!v14) {
      goto LABEL_30;
    }
    id v15 = v14;
    if (v15[3])
    {
      *(void *)(v13 + 16) = v15[2];
      *(unsigned char *)(v13 + 24) |= 1u;
    }
  }
  else
  {
    if (!v14) {
      goto LABEL_30;
    }
    -[GEOPDSSearchFilter setBrandFilter:](a1, v14);
  }
  uint64_t v4 = (uint64_t)v46;
LABEL_30:
  if (*(_WORD *)(v4 + 116))
  {
    *(_DWORD *)(a1 + 108) = *(_DWORD *)(v4 + 108);
    *(_WORD *)(a1 + 116) |= 1u;
  }
  uint64_t v16 = *(void *)(a1 + 80);
  id v17 = *(void **)(v4 + 80);
  if (v16)
  {
    if (!v17) {
      goto LABEL_38;
    }
    -[GEOPDPoiIconCategoryFilter mergeFrom:](v16, v17);
  }
  else
  {
    if (!v17) {
      goto LABEL_38;
    }
    -[GEOPDSSearchFilter setPoiIconCategoryFilter:](a1, v17);
  }
  uint64_t v4 = (uint64_t)v46;
LABEL_38:
  uint64_t v18 = *(void *)(a1 + 72);
  id v19 = *(void **)(v4 + 72);
  if (v18)
  {
    if (v19)
    {
      v20 = v19;
      -[GEOPDSImplicitQueryCategoryFilter readAll:]((uint64_t)v20, 0);
      if (v20[16])
      {
        *(_DWORD *)(v18 + 60) = v20[15];
        *(unsigned char *)(v18 + 64) |= 1u;
      }
      uint64_t v21 = *(void *)(v18 + 40);
      v22 = (void *)*((void *)v20 + 5);
      if (v21)
      {
        if (v22)
        {
          uint64_t v23 = v22;
          if (v23[3])
          {
            *(void *)(v21 + 16) = v23[2];
            *(unsigned char *)(v21 + 24) |= 1u;
          }
        }
      }
      else if (v22)
      {
        -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchForEvcharger:](v18, v22);
      }
      uint64_t v24 = *(void *)(v18 + 32);
      v25 = (void *)*((void *)v20 + 4);
      if (v24)
      {
        if (v25)
        {
          id v26 = v25;
          -[GEOPDSImplicitQuerySearchAroundPOI readAll:]((uint64_t)v26, 0);
          id v27 = (void *)*((void *)v26 + 3);
          if (v27) {
            -[GEOPDSImplicitQuerySearchAroundPOI setCategoryIdOfPoi:](v24, v27);
          }
          id v28 = *(void **)(v24 + 40);
          uint64_t v29 = *((void *)v26 + 5);
          if (v28)
          {
            if (v29) {
              objc_msgSend(v28, "mergeFrom:");
            }
          }
          else if (v29)
          {
            -[GEOPDSImplicitQuerySearchAroundPOI setReferenceLocation:](v24, *((void **)v26 + 5));
          }
          if (*((unsigned char *)v26 + 60))
          {
            *(void *)(v24 + 32) = *((void *)v26 + 4);
            *(unsigned char *)(v24 + 60) |= 1u;
          }
        }
      }
      else if (v25)
      {
        -[GEOPDSImplicitQueryCategoryFilter setImplicitQuerySearchAroundPoi:](v18, v25);
      }
      uint64_t v30 = *(void *)(v18 + 24);
      v31 = (void *)*((void *)v20 + 3);
      if (v30)
      {
        if (v31)
        {
          id v32 = v31;
          id v33 = *(void **)(v30 + 24);
          uint64_t v34 = *((void *)v32 + 3);
          if (v33)
          {
            if (v34) {
              objc_msgSend(v33, "mergeFrom:");
            }
          }
          else if (v34)
          {
            -[GEOPDSImplicitQueryIntroTipForHiking setReferenceLocation:](v30, *((void **)v32 + 3));
          }
          if (*((unsigned char *)v32 + 32))
          {
            *(void *)(v30 + 16) = *((void *)v32 + 2);
            *(unsigned char *)(v30 + 32) |= 1u;
          }
        }
      }
      else if (v31)
      {
        -[GEOPDSImplicitQueryCategoryFilter setImplicitQueryIntroTipForHiking:](v18, v31);
      }

      goto LABEL_78;
    }
  }
  else if (v19)
  {
    -[GEOPDSSearchFilter setImplictQueryCategoryFilter:](a1, v19);
LABEL_78:
    uint64_t v4 = (uint64_t)v46;
  }
  if ((*(_WORD *)(v4 + 116) & 2) != 0)
  {
    *(unsigned char *)(a1 + 112) = *(unsigned char *)(v4 + 112);
    *(_WORD *)(a1 + 116) |= 2u;
  }
  -[GEOPDSSearchFilter _readResultTypeFilters](v4);
  uint64_t v35 = (uint64_t)v46;
  uint64_t v36 = v46[4];
  if (v36)
  {
    unint64_t v37 = 0;
    uint64_t v38 = *MEMORY[0x1E4F1C4A8];
    do
    {
      -[GEOPDSSearchFilter _readResultTypeFilters](v35);
      unint64_t v39 = v46[4];
      if (v39 <= v37)
      {
        id v40 = (void *)MEMORY[0x1E4F1CA00];
        int v41 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", v37, v39);
        v42 = [v40 exceptionWithName:v38 reason:v41 userInfo:0];
        [v42 raise];
      }
      -[GEOPDSSearchFilter addResultTypeFilter:](a1);
      ++v37;
      uint64_t v35 = (uint64_t)v46;
    }
    while (v36 != v37);
  }
  uint64_t v43 = *(void *)(a1 + 48);
  v44 = *(void **)(v35 + 48);
  if (v43)
  {
    if (v44) {
      -[GEOPDAddressResultSubTypeFilter mergeFrom:](v43, v44);
    }
  }
  else if (v44)
  {
    -[GEOPDSSearchFilter setAddressResultSubTypeFilter:](a1, v44);
  }
LABEL_91:

  return MEMORY[0x1F4181820]();
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 4u;
    *(_WORD *)(a1 + 116) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    uint64_t v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSSearchFilter readAll:](a1, 0);
      -[GEOPDSSearchVenueFilter clearUnknownFields:](*(void *)(a1 + 88), 1);
      uint64_t v5 = *(void *)(a1 + 64);
      if (v5)
      {
        uint64_t v6 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;
      }
      uint64_t v7 = *(void *)(a1 + 56);
      if (v7)
      {
        uint64_t v8 = *(void **)(v7 + 8);
        *(void *)(v7 + 8) = 0;
      }
      -[GEOPDPoiIconCategoryFilter clearUnknownFields:](*(void *)(a1 + 80), 1);
      -[GEOPDSImplicitQueryCategoryFilter clearUnknownFields:](*(void *)(a1 + 72), 1);
      uint64_t v9 = *(void *)(a1 + 48);
      -[GEOPDAddressResultSubTypeFilter clearUnknownFields:](v9, 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_venueFilter, 0);
  objc_storeStrong((id *)&self->_poiIconCategoryFilter, 0);
  objc_storeStrong((id *)&self->_implictQueryCategoryFilter, 0);
  objc_storeStrong((id *)&self->_categoryFilter, 0);
  objc_storeStrong((id *)&self->_brandFilter, 0);
  objc_storeStrong((id *)&self->_addressResultSubTypeFilter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end