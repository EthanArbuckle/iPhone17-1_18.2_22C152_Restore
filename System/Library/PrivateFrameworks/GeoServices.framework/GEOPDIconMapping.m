@interface GEOPDIconMapping
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDIconMapping)init;
- (GEOPDIconMapping)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsCartoZoom:(uint64_t)a1;
- (void)_addNoFlagsCartoZoomIndoor:(uint64_t)a1;
- (void)addCartoZoom:(uint64_t)a1;
- (void)addCartoZoomIndoor:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDIconMapping

- (GEOPDIconMapping)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDIconMapping;
  v2 = [(GEOPDIconMapping *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDIconMapping)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDIconMapping;
  v3 = [(GEOPDIconMapping *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addCartoZoom:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCartoZooms_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEOPDIconMapping _addNoFlagsCartoZoom:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x400u;
  }
}

- (void)_addNoFlagsCartoZoom:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addCartoZoomIndoor:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        id v5 = v4;
        objc_sync_enter(v5);
        GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCartoZoomIndoors_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEOPDIconMapping _addNoFlagsCartoZoomIndoor:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x400u;
  }
}

- (void)_addNoFlagsCartoZoomIndoor:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDIconMapping;
  v4 = [(GEOPDIconMapping *)&v8 description];
  id v5 = [(GEOPDIconMapping *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDIconMapping _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDIconMapping readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
    {
      id v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode_tags);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v7 = *(id *)(a1 + 48);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"countryCode";
      }
      else {
        objc_super v8 = @"country_code";
      }
      [v4 setObject:v7 forKey:v8];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
    {
      v9 = *(void **)(a1 + 8);
      if (v9)
      {
        id v10 = v9;
        objc_sync_enter(v10);
        GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCountryCode3A_tags);
        objc_sync_exit(v10);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v11 = *(id *)(a1 + 40);
    if (v11)
    {
      if (a2) {
        v12 = @"countryCode3A";
      }
      else {
        v12 = @"country_code_3a";
      }
      [v4 setObject:v11 forKey:v12];
    }

    v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
    if (a2) {
      v14 = @"poiType";
    }
    else {
      v14 = @"poi_type";
    }
    [v4 setObject:v13 forKey:v14];

    if ((*(_WORD *)(a1 + 96) & 4) != 0)
    {
      v15 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 93)];
      if (a2) {
        v16 = @"isIconSuppressed";
      }
      else {
        v16 = @"is_icon_suppressed";
      }
      [v4 setObject:v15 forKey:v16];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
    {
      v17 = *(void **)(a1 + 8);
      if (v17)
      {
        id v18 = v17;
        objc_sync_enter(v18);
        GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readState_tags);
        objc_sync_exit(v18);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v19 = *(id *)(a1 + 56);
    if (v19) {
      [v4 setObject:v19 forKey:@"state"];
    }

    if (*(_WORD *)(a1 + 96))
    {
      unsigned int v20 = *(_DWORD *)(a1 + 84) + 9;
      if (v20 < 0xD && ((0x1FC1u >> v20) & 1) != 0)
      {
        v21 = off_1E53DCB40[v20];
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 84));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (a2) {
        v22 = @"cartoSignificance";
      }
      else {
        v22 = @"carto_significance";
      }
      [v4 setObject:v21 forKey:v22];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = [v24 countByEnumeratingWithState:&v60 objects:v65 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v61;
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v61 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
            if (a2) {
              [v28 jsonRepresentation];
            }
            else {
            v29 = [v28 dictionaryRepresentation];
            }
            [v23 addObject:v29];
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v60 objects:v65 count:16];
        }
        while (v25);
      }

      if (a2) {
        v30 = @"cartoZoom";
      }
      else {
        v30 = @"carto_zoom";
      }
      [v4 setObject:v23 forKey:v30];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v32 = *(id *)(a1 + 24);
      uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v64 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v33; ++j)
          {
            if (*(void *)v57 != v34) {
              objc_enumerationMutation(v32);
            }
            v36 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            if (a2) {
              [v36 jsonRepresentation];
            }
            else {
            v37 = [v36 dictionaryRepresentation];
            }
            [v31 addObject:v37];
          }
          uint64_t v33 = [v32 countByEnumeratingWithState:&v56 objects:v64 count:16];
        }
        while (v33);
      }

      if (a2) {
        v38 = @"cartoZoomIndoor";
      }
      else {
        v38 = @"carto_zoom_indoor";
      }
      [v4 setObject:v31 forKey:v38];
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v39 = *(void **)(a1 + 8);
      if (v39)
      {
        id v40 = v39;
        objc_sync_enter(v40);
        GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readVectorPoiDisplayDv_tags);
        objc_sync_exit(v40);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v41 = *(id *)(a1 + 64);
    v42 = v41;
    if (v41)
    {
      if (a2)
      {
        v43 = [v41 jsonRepresentation];
        v44 = @"vectorPoiDisplayDv";
      }
      else
      {
        v43 = [v41 dictionaryRepresentation];
        v44 = @"vector_poi_display_dv";
      }
      [v4 setObject:v43 forKey:v44];
    }
    if ((*(_WORD *)(a1 + 96) & 2) != 0)
    {
      v45 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 92)];
      if (a2) {
        v46 = @"aoiZoom";
      }
      else {
        v46 = @"aoi_zoom";
      }
      [v4 setObject:v45 forKey:v46];
    }
    v47 = *(void **)(a1 + 16);
    if (v47)
    {
      v48 = [v47 dictionaryRepresentation];
      v49 = v48;
      if (a2)
      {
        v50 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v48, "count"));
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __46__GEOPDIconMapping__dictionaryRepresentation___block_invoke;
        v54[3] = &unk_1E53D8860;
        id v51 = v50;
        id v55 = v51;
        [v49 enumerateKeysAndObjectsUsingBlock:v54];
        id v52 = v51;
      }
      else
      {
        id v52 = v48;
      }
      [v4 setObject:v52 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDIconMapping _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_3362;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_3363;
      }
      GEOPDIconMappingReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDIconMappingCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __46__GEOPDIconMapping__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_181;
  }
  if (a3) {
    id v7 = @"countryCode";
  }
  else {
    id v7 = @"country_code";
  }
  objc_super v8 = [v5 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (void *)[v8 copy];
    id v10 = v9;
    *(_WORD *)(v6 + 96) |= 0x80u;
    *(_WORD *)(v6 + 96) |= 0x400u;
    objc_storeStrong((id *)(v6 + 48), v9);
  }
  if (a3) {
    id v11 = @"countryCode3A";
  }
  else {
    id v11 = @"country_code_3a";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v13 = (void *)[v12 copy];
    id v14 = v13;
    *(_WORD *)(v6 + 96) |= 0x40u;
    *(_WORD *)(v6 + 96) |= 0x400u;
    objc_storeStrong((id *)(v6 + 40), v13);
  }
  if (a3) {
    v15 = @"poiType";
  }
  else {
    v15 = @"poi_type";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = [v16 unsignedIntValue];
    *(_WORD *)(v6 + 96) |= 0x400u;
    *(_DWORD *)(v6 + 88) = v17;
  }

  if (a3) {
    id v18 = @"isIconSuppressed";
  }
  else {
    id v18 = @"is_icon_suppressed";
  }
  id v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v20 = [v19 BOOLValue];
    *(_WORD *)(v6 + 96) |= 0x400u;
    *(_WORD *)(v6 + 96) |= 4u;
    *(unsigned char *)(v6 + 93) = v20;
  }

  v21 = [v5 objectForKeyedSubscript:@"state"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v22 = (void *)[v21 copy];
    id v23 = v22;
    *(_WORD *)(v6 + 96) |= 0x100u;
    *(_WORD *)(v6 + 96) |= 0x400u;
    objc_storeStrong((id *)(v6 + 56), v22);
  }
  if (a3) {
    id v24 = @"cartoSignificance";
  }
  else {
    id v24 = @"carto_significance";
  }
  uint64_t v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = v25;
    if ([v26 isEqualToString:@"SIGNIFICANCE_DEFAULT"])
    {
      int v27 = -9;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_EXTRA_EXTRA_LOW"])
    {
      int v27 = -3;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_EXTRA_LOW"])
    {
      int v27 = -2;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_LOW"])
    {
      int v27 = -1;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_MEDIUM"])
    {
      int v27 = 0;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_HIGH"])
    {
      int v27 = 1;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_EXTRA_HIGH"])
    {
      int v27 = 2;
    }
    else if ([v26 isEqualToString:@"SIGNIFICANCE_EXTRA_EXTRA_HIGH"])
    {
      int v27 = 3;
    }
    else
    {
      int v27 = -9;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_49;
    }
    int v27 = [v25 intValue];
  }
  *(_WORD *)(v6 + 96) |= 0x400u;
  *(_WORD *)(v6 + 96) |= 1u;
  *(_DWORD *)(v6 + 84) = v27;
LABEL_49:

  if (a3) {
    v28 = @"cartoZoom";
  }
  else {
    v28 = @"carto_zoom";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v30 = v29;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v112 objects:v117 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v113;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v113 != v33) {
            objc_enumerationMutation(v30);
          }
          v35 = *(void **)(*((void *)&v112 + 1) + 8 * v34);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v36 = [GEOPDCartoIconZoom alloc];
            if (v36) {
              v37 = (void *)-[GEOPDCartoIconZoom _initWithDictionary:isJSON:](v36, v35, a3);
            }
            else {
              v37 = 0;
            }
            -[GEOPDIconMapping addCartoZoom:](v6, v37);
          }
          ++v34;
        }
        while (v32 != v34);
        uint64_t v38 = [v30 countByEnumeratingWithState:&v112 objects:v117 count:16];
        uint64_t v32 = v38;
      }
      while (v38);
    }
  }
  if (a3) {
    v39 = @"cartoZoomIndoor";
  }
  else {
    v39 = @"carto_zoom_indoor";
  }
  id v40 = [v5 objectForKeyedSubscript:v39];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v41 = v40;
    uint64_t v42 = [v41 countByEnumeratingWithState:&v108 objects:v116 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v109;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v109 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v108 + 1) + 8 * v45);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v47 = [GEOPDCartoIconZoom alloc];
            if (v47) {
              v48 = (void *)-[GEOPDCartoIconZoom _initWithDictionary:isJSON:](v47, v46, a3);
            }
            else {
              v48 = 0;
            }
            -[GEOPDIconMapping addCartoZoomIndoor:](v6, v48);
          }
          ++v45;
        }
        while (v43 != v45);
        uint64_t v49 = [v41 countByEnumeratingWithState:&v108 objects:v116 count:16];
        uint64_t v43 = v49;
      }
      while (v49);
    }
  }
  if (a3) {
    v50 = @"vectorPoiDisplayDv";
  }
  else {
    v50 = @"vector_poi_display_dv";
  }
  id v51 = [v5 objectForKeyedSubscript:v50];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_175;
  }
  id v52 = [GEOPDVectorPoiDisplayDV alloc];
  if (v52)
  {
    id v53 = v51;
    id v52 = [(GEOPDVectorPoiDisplayDV *)v52 init];
    if (!v52)
    {
LABEL_173:

      goto LABEL_174;
    }
    if (a3) {
      v54 = @"poiClass";
    }
    else {
      v54 = @"poi_class";
    }
    id v55 = [v53 objectForKeyedSubscript:v54];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v56 = [v55 unsignedIntValue];
      *(_WORD *)&v52->_flags |= 0x400u;
      *(_WORD *)&v52->_flags |= 2u;
      v52->_poiClass = v56;
    }

    if (a3) {
      long long v57 = @"classZoom";
    }
    else {
      long long v57 = @"class_zoom";
    }
    long long v58 = [v53 objectForKeyedSubscript:v57];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v59 = [GEOPDZoomInfo alloc];
      if (v59) {
        long long v60 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v59, v58, a3);
      }
      else {
        long long v60 = 0;
      }
      id v61 = v60;
      *(_WORD *)&v52->_flags |= 0x80u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_classZoom, v60);
    }
    if (a3) {
      long long v62 = @"containmentClass";
    }
    else {
      long long v62 = @"containment_class";
    }
    long long v63 = [v53 objectForKeyedSubscript:v62];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v64 = [v63 unsignedIntValue];
      *(_WORD *)&v52->_flags |= 0x400u;
      *(_WORD *)&v52->_flags |= 1u;
      v52->_containmentClass = v64;
    }

    if (a3) {
      v65 = @"containmentZoom";
    }
    else {
      v65 = @"containment_zoom";
    }
    uint64_t v66 = [v53 objectForKeyedSubscript:v65];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v67 = [GEOPDZoomInfo alloc];
      if (v67) {
        v68 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v67, v66, a3);
      }
      else {
        v68 = 0;
      }
      id v69 = v68;
      *(_WORD *)&v52->_flags |= 0x100u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_containmentZoom, v68);
    }
    if (a3) {
      v70 = @"customLandmark";
    }
    else {
      v70 = @"custom_landmark";
    }
    v71 = [v53 objectForKeyedSubscript:v70];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v72 = [GEOPDCustomLandmark alloc];
      if (v72)
      {
        id v73 = v71;
        v72 = [(GEOPDCustomLandmark *)v72 init];
        if (v72)
        {
          v105 = v51;
          if (a3) {
            v74 = @"landmarkId";
          }
          else {
            v74 = @"landmark_id";
          }
          v107 = v73;
          v75 = [v73 objectForKeyedSubscript:v74];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v76 = [v75 unsignedIntValue];
            *(unsigned char *)&v72->_flags |= 1u;
            v72->_landmarkId = v76;
          }

          id v73 = v107;
          uint64_t v77 = [v107 objectForKeyedSubscript:@"position"];
          objc_opt_class();
          v106 = (void *)v77;
          id v51 = v105;
          if (objc_opt_isKindOfClass())
          {
            v78 = [GEOPDGeographicCoordinate alloc];
            if (a3) {
              v79 = [(GEOPDGeographicCoordinate *)v78 initWithJSON:v106];
            }
            else {
              v79 = [(GEOPDGeographicCoordinate *)v78 initWithDictionary:v106];
            }
            v80 = v79;
            v104 = v79;
            objc_storeStrong((id *)&v72->_position, v80);

            id v73 = v107;
          }
        }
      }
      v81 = v72;
      *(_WORD *)&v52->_flags |= 0x200u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_customLandmark, v72);
    }
    if (a3) {
      v82 = @"classZoomDriving";
    }
    else {
      v82 = @"class_zoom_driving";
    }
    v83 = [v53 objectForKeyedSubscript:v82];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v84 = [GEOPDZoomInfo alloc];
      if (v84) {
        v85 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v84, v83, a3);
      }
      else {
        v85 = 0;
      }
      id v86 = v85;
      *(_WORD *)&v52->_flags |= 0x20u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_classZoomDriving, v85);
    }
    if (a3) {
      v87 = @"classZoomNavigation";
    }
    else {
      v87 = @"class_zoom_navigation";
    }
    v88 = [v53 objectForKeyedSubscript:v87];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v89 = [GEOPDZoomInfo alloc];
      if (v89) {
        v90 = (void *)-[GEOPDZoomInfo _initWithDictionary:isJSON:](v89, v88, a3);
      }
      else {
        v90 = 0;
      }
      id v91 = v90;
      *(_WORD *)&v52->_flags |= 0x40u;
      *(_WORD *)&v52->_flags |= 0x400u;
      objc_storeStrong((id *)&v52->_classZoomNavigation, v90);
    }
    if (a3) {
      v92 = @"treeDisplayType";
    }
    else {
      v92 = @"tree_display_type";
    }
    v93 = [v53 objectForKeyedSubscript:v92];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v94 = v93;
      if ([v94 isEqualToString:@"TREE_DISPLAY_TYPE_DEFAULT"])
      {
        int v95 = 0;
      }
      else if ([v94 isEqualToString:@"TREE_DISPLAY_TYPE_NONE"])
      {
        int v95 = 1;
      }
      else if ([v94 isEqualToString:@"TREE_DISPLAY_TYPE_ALL"])
      {
        int v95 = 2;
      }
      else if ([v94 isEqualToString:@"TREE_DISPLAY_TYPE_DENSE"])
      {
        int v95 = 3;
      }
      else if ([v94 isEqualToString:@"TREE_DISPLAY_TYPE_SPARSE"])
      {
        int v95 = 4;
      }
      else
      {
        int v95 = 0;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_167:

        if (a3) {
          v96 = @"inMiniPoiMarket";
        }
        else {
          v96 = @"in_mini_poi_market";
        }
        v97 = [v53 objectForKeyedSubscript:v96];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v98 = [v97 BOOLValue];
          *(_WORD *)&v52->_flags |= 0x400u;
          *(_WORD *)&v52->_flags |= 8u;
          v52->_inMiniPoiMarket = v98;
        }

        goto LABEL_173;
      }
      int v95 = [v93 intValue];
    }
    *(_WORD *)&v52->_flags |= 0x400u;
    *(_WORD *)&v52->_flags |= 4u;
    v52->_treeDisplayType = v95;
    goto LABEL_167;
  }
LABEL_174:
  v99 = v52;
  *(_WORD *)(v6 + 96) |= 0x200u;
  *(_WORD *)(v6 + 96) |= 0x400u;
  objc_storeStrong((id *)(v6 + 64), v52);

LABEL_175:
  if (a3) {
    v100 = @"aoiZoom";
  }
  else {
    v100 = @"aoi_zoom";
  }
  v101 = [v5 objectForKeyedSubscript:v100];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v102 = [v101 BOOLValue];
    *(_WORD *)(v6 + 96) |= 0x400u;
    *(_WORD *)(v6 + 96) |= 2u;
    *(unsigned char *)(v6 + 92) = v102;
  }

LABEL_181:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDIconMappingReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDIconMappingIsDirty((uint64_t)self) & 1) == 0)
  {
    id v14 = self->_reader;
    objc_sync_enter(v14);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v15 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v15];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDIconMapping readAll:]((uint64_t)self, 0);
    if (self->_countryCode) {
      PBDataWriterWriteStringField();
    }
    if (self->_countryCode3A) {
      PBDataWriterWriteStringField();
    }
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 4) != 0) {
      PBDataWriterWriteBOOLField();
    }
    if (self->_state) {
      PBDataWriterWriteStringField();
    }
    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v6 = self->_cartoZooms;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_cartoZoomIndoors;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    if (self->_vectorPoiDisplayDv) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDIconMappingReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDIconMapping readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_countryCode copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSString *)self->_countryCode3A copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  *(_DWORD *)(v5 + 88) = self->_poiType;
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    *(unsigned char *)(v5 + 93) = self->_isIconSuppressed;
    *(_WORD *)(v5 + 96) |= 4u;
  }
  uint64_t v13 = [(NSString *)self->_state copyWithZone:a3];
  id v14 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v13;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 84) = self->_cartoSignificance;
    *(_WORD *)(v5 + 96) |= 1u;
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v15 = self->_cartoZooms;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v33 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDIconMapping addCartoZoom:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v16);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v20 = self->_cartoZoomIndoors;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * j), "copyWithZone:", a3, (void)v29);
        -[GEOPDIconMapping addCartoZoomIndoor:](v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v21);
  }

  id v25 = [(GEOPDVectorPoiDisplayDV *)self->_vectorPoiDisplayDv copyWithZone:a3];
  uint64_t v26 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v25;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 92) = self->_aoiZoom;
    *(_WORD *)(v5 + 96) |= 2u;
  }
  int v27 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v27;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  -[GEOPDIconMapping readAll:]((uint64_t)self, 1);
  -[GEOPDIconMapping readAll:]((uint64_t)v4, 1);
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](countryCode, "isEqual:")) {
      goto LABEL_31;
    }
  }
  countryCode3A = self->_countryCode3A;
  if ((unint64_t)countryCode3A | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](countryCode3A, "isEqual:")) {
      goto LABEL_31;
    }
  }
  if (self->_poiType != *((_DWORD *)v4 + 22)) {
    goto LABEL_31;
  }
  __int16 flags = (__int16)self->_flags;
  __int16 v8 = *((_WORD *)v4 + 48);
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0) {
      goto LABEL_31;
    }
    if (self->_isIconSuppressed)
    {
      if (!*((unsigned char *)v4 + 93)) {
        goto LABEL_31;
      }
    }
    else if (*((unsigned char *)v4 + 93))
    {
      goto LABEL_31;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_31;
  }
  state = self->_state;
  if ((unint64_t)state | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](state, "isEqual:")) {
      goto LABEL_31;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v8 = *((_WORD *)v4 + 48);
  }
  if (flags)
  {
    if ((v8 & 1) == 0 || self->_cartoSignificance != *((_DWORD *)v4 + 21)) {
      goto LABEL_31;
    }
  }
  else if (v8)
  {
    goto LABEL_31;
  }
  cartoZooms = self->_cartoZooms;
  if ((unint64_t)cartoZooms | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](cartoZooms, "isEqual:"))
  {
    goto LABEL_31;
  }
  cartoZoomIndoors = self->_cartoZoomIndoors;
  if ((unint64_t)cartoZoomIndoors | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](cartoZoomIndoors, "isEqual:")) {
      goto LABEL_31;
    }
  }
  vectorPoiDisplayDv = self->_vectorPoiDisplayDv;
  if ((unint64_t)vectorPoiDisplayDv | *((void *)v4 + 8))
  {
    if (!-[GEOPDVectorPoiDisplayDV isEqual:](vectorPoiDisplayDv, "isEqual:")) {
      goto LABEL_31;
    }
  }
  __int16 v13 = *((_WORD *)v4 + 48);
  BOOL v14 = (v13 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v13 & 2) != 0)
    {
      if (self->_aoiZoom)
      {
        if (!*((unsigned char *)v4 + 92)) {
          goto LABEL_31;
        }
      }
      else if (*((unsigned char *)v4 + 92))
      {
        goto LABEL_31;
      }
      BOOL v14 = 1;
      goto LABEL_32;
    }
LABEL_31:
    BOOL v14 = 0;
  }
LABEL_32:

  return v14;
}

- (unint64_t)hash
{
  -[GEOPDIconMapping readAll:]((uint64_t)self, 1);
  NSUInteger v13 = [(NSString *)self->_countryCode hash];
  NSUInteger v3 = [(NSString *)self->_countryCode3A hash];
  if ((*(_WORD *)&self->_flags & 4) != 0) {
    uint64_t v4 = 2654435761 * self->_isIconSuppressed;
  }
  else {
    uint64_t v4 = 0;
  }
  unsigned int poiType = self->_poiType;
  NSUInteger v6 = [(NSString *)self->_state hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_cartoSignificance;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [(NSMutableArray *)self->_cartoZooms hash];
  uint64_t v9 = [(NSMutableArray *)self->_cartoZoomIndoors hash];
  unint64_t v10 = [(GEOPDVectorPoiDisplayDV *)self->_vectorPoiDisplayDv hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_aoiZoom;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v6 ^ (2654435761 * poiType) ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 8u;
    *(_WORD *)(a1 + 96) |= 0x400u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOPDIconMapping readAll:](a1, 0);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v34;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v33 + 1) + 8 * v7);
          if (v8)
          {
            uint64_t v9 = *(void **)(v8 + 8);
            *(void *)(v8 + 8) = 0;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v5);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v10 = *(id *)(a1 + 24);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v29 + 1) + 8 * v14);
          if (v15)
          {
            uint64_t v16 = *(void **)(v15 + 8);
            *(void *)(v15 + 8) = 0;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v12);
    }

    uint64_t v17 = *(void *)(a1 + 64);
    if (v17)
    {
      os_unfair_lock_lock_with_options();
      *(_WORD *)(v17 + 92) |= 0x10u;
      *(_WORD *)(v17 + 92) |= 0x400u;
      os_unfair_lock_unlock((os_unfair_lock_t)(v17 + 72));
      long long v18 = *(void **)(v17 + 16);
      *(void *)(v17 + 16) = 0;

      -[GEOPDVectorPoiDisplayDV readAll:](v17, 0);
      uint64_t v19 = *(void *)(v17 + 40);
      if (v19)
      {
        long long v20 = *(void **)(v19 + 8);
        *(void *)(v19 + 8) = 0;
      }
      uint64_t v21 = *(void *)(v17 + 48);
      if (v21)
      {
        uint64_t v22 = *(void **)(v21 + 8);
        *(void *)(v21 + 8) = 0;
      }
      uint64_t v23 = *(void *)(v17 + 56);
      if (v23)
      {
        id v24 = *(void **)(v23 + 8);
        *(void *)(v23 + 8) = 0;
      }
      uint64_t v25 = *(void *)(v17 + 24);
      if (v25)
      {
        uint64_t v26 = *(void **)(v25 + 8);
        *(void *)(v25 + 8) = 0;
      }
      uint64_t v27 = *(void *)(v17 + 32);
      if (v27)
      {
        v28 = *(void **)(v27 + 8);
        *(void *)(v27 + 8) = 0;
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vectorPoiDisplayDv, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryCode3A, 0);
  objc_storeStrong((id *)&self->_cartoZooms, 0);
  objc_storeStrong((id *)&self->_cartoZoomIndoors, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end