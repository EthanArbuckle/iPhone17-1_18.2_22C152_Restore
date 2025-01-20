@interface GEOPDTransitInfoSnippet
+ (id)transitInfoSnippetForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitInfoSnippet)init;
- (GEOPDTransitInfoSnippet)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)artworks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)labels;
- (id)searchDisplayName;
- (id)stopLocationForTrip;
- (id)styleAttributesForTrip;
- (id)systemNames;
- (id)timezone;
- (id)transitName;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)clearUnknownFields:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsArtwork:(uint64_t)a1;
- (void)_addNoFlagsLabel:(uint64_t)a1;
- (void)_addNoFlagsSystemName:(uint64_t)a1;
- (void)_readArtworks;
- (void)_readLabels;
- (void)_readSearchDisplayName;
- (void)_readStopLocationForTrip;
- (void)_readStyleAttributesForTrip;
- (void)_readSystemNames;
- (void)_readTimezone;
- (void)_readTransitName;
- (void)addArtwork:(uint64_t)a1;
- (void)addLabel:(uint64_t)a1;
- (void)addSystemName:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitInfoSnippet

+ (id)transitInfoSnippetForPlaceData:(id)a3
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
  v6[2] = __75__GEOPDTransitInfoSnippet_PlaceDataExtras__transitInfoSnippetForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:27 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __75__GEOPDTransitInfoSnippet_PlaceDataExtras__transitInfoSnippetForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitInfoSnippet](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)clearUnknownFields:(uint64_t)result
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    *(_WORD *)(v1 + 112) |= 4u;
    *(_WORD *)(v1 + 112) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 104));
    v2 = *(void **)(v1 + 16);
    *(void *)(v1 + 16) = 0;

    -[GEOPDTransitInfoSnippet readAll:](v1, 0);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v3 = *(id *)(v1 + 24);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v20;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v20 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v5);
    }

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = *(id *)(v1 + 32);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "clearUnknownFields:", 1, (void)v15);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v10);
    }

    uint64_t v13 = *(void *)(v1 + 72);
    if (v13)
    {
      v14 = *(void **)(v13 + 8);
      *(void *)(v13 + 8) = 0;
    }
    objc_msgSend(*(id *)(v1 + 48), "clearUnknownFields:", 1, (void)v15);
    return [*(id *)(v1 + 56) clearUnknownFields:1];
  }
  return result;
}

- (GEOPDTransitInfoSnippet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitInfoSnippet;
  v2 = [(GEOPDTransitInfoSnippet *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v4 = v2;
  }

  return v3;
}

- (GEOPDTransitInfoSnippet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitInfoSnippet;
  id v3 = [(GEOPDTransitInfoSnippet *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readSystemNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSystemNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)systemNames
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readSystemNames]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSystemName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfoSnippet _readSystemNames](a1);
    -[GEOPDTransitInfoSnippet _addNoFlagsSystemName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 112) |= 0x800u;
  }
}

- (void)_addNoFlagsSystemName:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      uint64_t v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readArtworks
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readArtworks_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)artworks
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readArtworks]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addArtwork:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfoSnippet _readArtworks](a1);
    -[GEOPDTransitInfoSnippet _addNoFlagsArtwork:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 112) |= 0x800u;
  }
}

- (void)_addNoFlagsArtwork:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      uint64_t v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readSearchDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchDisplayName_tags_9309);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)searchDisplayName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readSearchDisplayName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabels_tags_9310);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)labels
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readLabels]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLabel:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfoSnippet _readLabels](a1);
    -[GEOPDTransitInfoSnippet _addNoFlagsLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 112) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    *(_WORD *)(a1 + 112) |= 0x800u;
  }
}

- (void)_addNoFlagsLabel:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      uint64_t v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readTimezone
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTimezone_tags_9311);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)timezone
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readTimezone]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTransitName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)transitName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readTransitName]((uint64_t)a1);
    a1 = (id *)v2[11];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readStopLocationForTrip
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopLocationForTrip_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)stopLocationForTrip
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readStopLocationForTrip]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readStyleAttributesForTrip
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStyleAttributesForTrip_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (id)styleAttributesForTrip
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfoSnippet _readStyleAttributesForTrip]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitInfoSnippet;
  uint64_t v4 = [(GEOPDTransitInfoSnippet *)&v8 description];
  id v5 = [(GEOPDTransitInfoSnippet *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitInfoSnippet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTransitInfoSnippet readAll:](a1, 1);
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 64))
    {
      id v5 = -[GEOPDTransitInfoSnippet systemNames]((id *)a1);
      if (a2) {
        objc_super v6 = @"systemName";
      }
      else {
        objc_super v6 = @"system_name";
      }
      [v4 setObject:v5 forKey:v6];
    }
    if ([*(id *)(a1 + 24) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id v8 = *(id *)(a1 + 24);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v55 objects:v60 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v56;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v56 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = [v13 dictionaryRepresentation];
            }
            [v7 addObject:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v55 objects:v60 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"artwork"];
    }
    long long v15 = -[GEOPDTransitInfoSnippet searchDisplayName]((id *)a1);
    if (v15)
    {
      if (a2) {
        long long v16 = @"searchDisplayName";
      }
      else {
        long long v16 = @"search_display_name";
      }
      [v4 setObject:v15 forKey:v16];
    }

    if ([*(id *)(a1 + 32) count])
    {
      long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v18 = *(id *)(a1 + 32);
      uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v59 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v52;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v52 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = *(void **)(*((void *)&v51 + 1) + 8 * j);
            if (a2) {
              [v23 jsonRepresentation];
            }
            else {
            v24 = [v23 dictionaryRepresentation];
            }
            [v17 addObject:v24];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v59 count:16];
        }
        while (v20);
      }

      [v4 setObject:v17 forKey:@"label"];
    }
    if (*(_WORD *)(a1 + 112))
    {
      uint64_t v25 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 80)];
      if (a2) {
        v26 = @"transitId";
      }
      else {
        v26 = @"transit_id";
      }
      [v4 setObject:v25 forKey:v26];
    }
    v27 = -[GEOPDTransitInfoSnippet timezone]((id *)a1);
    v28 = v27;
    if (v27)
    {
      if (a2) {
        [v27 jsonRepresentation];
      }
      else {
      v29 = [v27 dictionaryRepresentation];
      }
      [v4 setObject:v29 forKey:@"timezone"];
    }
    v30 = -[GEOPDTransitInfoSnippet transitName]((id *)a1);
    if (v30)
    {
      if (a2) {
        v31 = @"transitName";
      }
      else {
        v31 = @"transit_name";
      }
      [v4 setObject:v30 forKey:v31];
    }

    v32 = -[GEOPDTransitInfoSnippet stopLocationForTrip]((id *)a1);
    v33 = v32;
    if (v32)
    {
      if (a2)
      {
        v34 = [v32 jsonRepresentation];
        v35 = @"stopLocationForTrip";
      }
      else
      {
        v34 = [v32 dictionaryRepresentation];
        v35 = @"stop_location_for_trip";
      }
      [v4 setObject:v34 forKey:v35];
    }
    v36 = -[GEOPDTransitInfoSnippet styleAttributesForTrip]((id *)a1);
    v37 = v36;
    if (v36)
    {
      if (a2)
      {
        v38 = [v36 jsonRepresentation];
        v39 = @"styleAttributesForTrip";
      }
      else
      {
        v38 = [v36 dictionaryRepresentation];
        v39 = @"style_attributes_for_trip";
      }
      [v4 setObject:v38 forKey:v39];
    }
    if ((*(_WORD *)(a1 + 112) & 2) != 0)
    {
      v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 108)];
      if (a2) {
        v41 = @"isHidden";
      }
      else {
        v41 = @"is_hidden";
      }
      [v4 setObject:v40 forKey:v41];
    }
    v42 = *(void **)(a1 + 16);
    if (v42)
    {
      v43 = [v42 dictionaryRepresentation];
      v44 = v43;
      if (a2)
      {
        v45 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __53__GEOPDTransitInfoSnippet__dictionaryRepresentation___block_invoke;
        v49[3] = &unk_1E53D8860;
        id v46 = v45;
        id v50 = v46;
        [v44 enumerateKeysAndObjectsUsingBlock:v49];
        id v47 = v46;

        v44 = v47;
      }
      [v4 setObject:v44 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitInfoSnippet _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    uint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9342;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9343;
      }
      GEOPDTransitInfoSnippetReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTransitInfoSnippetCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

void __53__GEOPDTransitInfoSnippet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    id v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (v6)
  {
    if (a3) {
      id v7 = @"systemName";
    }
    else {
      id v7 = @"system_name";
    }
    id v8 = [v5 objectForKeyedSubscript:v7];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v78 objects:v84 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v79;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v79 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              long long v15 = (void *)[v14 copy];
              -[GEOPDTransitInfoSnippet addSystemName:](v6, v15);
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v78 objects:v84 count:16];
        }
        while (v11);
      }
    }
    long long v16 = [v5 objectForKeyedSubscript:@"artwork"];
    objc_opt_class();
    id v69 = v5;
    if (objc_opt_isKindOfClass())
    {
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      v67 = v16;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v74 objects:v83 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v75;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v75 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v74 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [GEOPBTransitArtwork alloc];
              if (a3) {
                v24 = [(GEOPBTransitArtwork *)v23 initWithJSON:v22];
              }
              else {
                v24 = [(GEOPBTransitArtwork *)v23 initWithDictionary:v22];
              }
              uint64_t v25 = v24;
              -[GEOPDTransitInfoSnippet addArtwork:](v6, v24);
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v74 objects:v83 count:16];
        }
        while (v19);
      }

      id v5 = v69;
    }

    if (a3) {
      v26 = @"searchDisplayName";
    }
    else {
      v26 = @"search_display_name";
    }
    v27 = objc_msgSend(v5, "objectForKeyedSubscript:", v26, v67);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[v27 copy];
      id v29 = v28;
      *(_WORD *)(v6 + 112) |= 0x20u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 40), v28);
    }
    v30 = [v5 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      v68 = v30;
      id v31 = v30;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (v32)
      {
        uint64_t v33 = v32;
        uint64_t v34 = *(void *)v71;
        do
        {
          for (uint64_t k = 0; k != v33; ++k)
          {
            if (*(void *)v71 != v34) {
              objc_enumerationMutation(v31);
            }
            uint64_t v36 = *(void *)(*((void *)&v70 + 1) + 8 * k);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v37 = [GEOPDTransitLabel alloc];
              if (a3) {
                v38 = [(GEOPDTransitLabel *)v37 initWithJSON:v36];
              }
              else {
                v38 = [(GEOPDTransitLabel *)v37 initWithDictionary:v36];
              }
              v39 = v38;
              -[GEOPDTransitInfoSnippet addLabel:](v6, v38);
            }
          }
          uint64_t v33 = [v31 countByEnumeratingWithState:&v70 objects:v82 count:16];
        }
        while (v33);
      }

      v30 = v68;
      id v5 = v69;
    }

    if (a3) {
      v40 = @"transitId";
    }
    else {
      v40 = @"transit_id";
    }
    v41 = objc_msgSend(v5, "objectForKeyedSubscript:", v40, v68);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v42 = [v41 unsignedLongLongValue];
      *(_WORD *)(v6 + 112) |= 0x800u;
      *(_WORD *)(v6 + 112) |= 1u;
      *(void *)(v6 + 80) = v42;
    }

    v43 = [v5 objectForKeyedSubscript:@"timezone"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v44 = [GEOTimezone alloc];
      if (v44) {
        v45 = -[GEOTimezone _initWithDictionary:isJSON:](v44, v43);
      }
      else {
        v45 = 0;
      }
      id v46 = v45;
      *(_WORD *)(v6 + 112) |= 0x200u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 72), v45);
    }
    if (a3) {
      id v47 = @"transitName";
    }
    else {
      id v47 = @"transit_name";
    }
    v48 = [v5 objectForKeyedSubscript:v47];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49 = (void *)[v48 copy];
      id v50 = v49;
      *(_WORD *)(v6 + 112) |= 0x400u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 88), v49);
    }
    if (a3) {
      long long v51 = @"stopLocationForTrip";
    }
    else {
      long long v51 = @"stop_location_for_trip";
    }
    long long v52 = [v5 objectForKeyedSubscript:v51];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v53 = [GEOLatLng alloc];
      if (a3) {
        long long v54 = [(GEOLatLng *)v53 initWithJSON:v52];
      }
      else {
        long long v54 = [(GEOLatLng *)v53 initWithDictionary:v52];
      }
      long long v55 = v54;
      long long v56 = v54;
      *(_WORD *)(v6 + 112) |= 0x40u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 48), v55);
    }
    if (a3) {
      long long v57 = @"styleAttributesForTrip";
    }
    else {
      long long v57 = @"style_attributes_for_trip";
    }
    long long v58 = [v5 objectForKeyedSubscript:v57];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v59 = [GEOStyleAttributes alloc];
      if (a3) {
        v60 = [(GEOStyleAttributes *)v59 initWithJSON:v58];
      }
      else {
        v60 = [(GEOStyleAttributes *)v59 initWithDictionary:v58];
      }
      uint64_t v61 = v60;
      v62 = v60;
      *(_WORD *)(v6 + 112) |= 0x80u;
      *(_WORD *)(v6 + 112) |= 0x800u;
      objc_storeStrong((id *)(v6 + 56), v61);
    }
    if (a3) {
      v63 = @"isHidden";
    }
    else {
      v63 = @"is_hidden";
    }
    v64 = [v5 objectForKeyedSubscript:v63];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v65 = [v64 BOOLValue];
      *(_WORD *)(v6 + 112) |= 0x800u;
      *(_WORD *)(v6 + 112) |= 2u;
      *(unsigned char *)(v6 + 108) = v65;
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitInfoSnippetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader
    && (os_unfair_lock_assert_owner(&self->_readerLock), __int16 flags = (__int16)self->_flags, (flags & 0xFF8) == 0))
  {
    if ((flags & 0x10) != 0)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v19 = self->_labels;
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v38;
        while (2)
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v38 != v21) {
              objc_enumerationMutation(v19);
            }
            if (GEOPDTransitLabelIsDirty(*(os_unfair_lock_s **)(*((void *)&v37 + 1) + 8 * i)))
            {

              goto LABEL_3;
            }
          }
          uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v44 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
    }
    v23 = self->_reader;
    objc_sync_enter(v23);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v24 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v24];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v23);
  }
  else
  {
LABEL_3:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 0);
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = self->_systemNames;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v8; ++j)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v33 objects:v43 count:16];
      }
      while (v8);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = self->_artworks;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t k = 0; k != v12; ++k)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v29 objects:v42 count:16];
      }
      while (v12);
    }

    if (self->_searchDisplayName) {
      PBDataWriterWriteStringField();
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v15 = self->_labels;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v26;
      do
      {
        for (uint64_t m = 0; m != v16; ++m)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v25 objects:v41 count:16];
      }
      while (v16);
    }

    if (*(_WORD *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_timezone) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_transitName) {
      PBDataWriterWriteStringField();
    }
    if (self->_stopLocationForTrip) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_styleAttributesForTrip) {
      PBDataWriterWriteSubmessage();
    }
    if ((*(_WORD *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v25);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTransitInfoSnippetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 0);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v9 = self->_systemNames;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v44 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDTransitInfoSnippet addSystemName:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v10);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v14 = self->_artworks;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v14);
        }
        uint64_t v18 = (void *)[*(id *)(*((void *)&v40 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDTransitInfoSnippet addArtwork:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v40 objects:v49 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(NSString *)self->_searchDisplayName copyWithZone:a3];
  uint64_t v20 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v19;

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v21 = self->_labels;
  uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v36 objects:v48 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v21);
        }
        long long v25 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * k), "copyWithZone:", a3, (void)v36);
        -[GEOPDTransitInfoSnippet addLabel:](v5, v25);
      }
      uint64_t v22 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v36 objects:v48 count:16];
    }
    while (v22);
  }

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 80) = self->_transitId;
    *(_WORD *)(v5 + 112) |= 1u;
  }
  id v26 = -[GEOTimezone copyWithZone:](self->_timezone, "copyWithZone:", a3, (void)v36);
  long long v27 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v26;

  uint64_t v28 = [(NSString *)self->_transitName copyWithZone:a3];
  long long v29 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v28;

  id v30 = [(GEOLatLng *)self->_stopLocationForTrip copyWithZone:a3];
  long long v31 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v30;

  id v32 = [(GEOStyleAttributes *)self->_styleAttributesForTrip copyWithZone:a3];
  long long v33 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v32;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 108) = self->_isHidden;
    *(_WORD *)(v5 + 112) |= 2u;
  }
  long long v34 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v34;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 1);
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)v4, 1);
  systemNames = self->_systemNames;
  if ((unint64_t)systemNames | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](systemNames, "isEqual:")) {
      goto LABEL_25;
    }
  }
  artworks = self->_artworks;
  if ((unint64_t)artworks | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](artworks, "isEqual:")) {
      goto LABEL_25;
    }
  }
  searchDisplayName = self->_searchDisplayName;
  if ((unint64_t)searchDisplayName | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](searchDisplayName, "isEqual:")) {
      goto LABEL_25;
    }
  }
  labels = self->_labels;
  if ((unint64_t)labels | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 v9 = *((_WORD *)v4 + 56);
  if (*(_WORD *)&self->_flags)
  {
    if ((v9 & 1) == 0 || self->_transitId != *((void *)v4 + 10)) {
      goto LABEL_25;
    }
  }
  else if (v9)
  {
    goto LABEL_25;
  }
  timezone = self->_timezone;
  if ((unint64_t)timezone | *((void *)v4 + 9) && !-[GEOTimezone isEqual:](timezone, "isEqual:")) {
    goto LABEL_25;
  }
  transitName = self->_transitName;
  if ((unint64_t)transitName | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](transitName, "isEqual:")) {
      goto LABEL_25;
    }
  }
  stopLocationForTrip = self->_stopLocationForTrip;
  if ((unint64_t)stopLocationForTrip | *((void *)v4 + 6))
  {
    if (!-[GEOLatLng isEqual:](stopLocationForTrip, "isEqual:")) {
      goto LABEL_25;
    }
  }
  styleAttributesForTrip = self->_styleAttributesForTrip;
  if ((unint64_t)styleAttributesForTrip | *((void *)v4 + 7))
  {
    if (!-[GEOStyleAttributes isEqual:](styleAttributesForTrip, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 v14 = *((_WORD *)v4 + 56);
  BOOL v15 = (v14 & 2) == 0;
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v14 & 2) == 0)
    {
LABEL_25:
      BOOL v15 = 0;
      goto LABEL_26;
    }
    if (self->_isHidden)
    {
      if (!*((unsigned char *)v4 + 108)) {
        goto LABEL_25;
      }
    }
    else if (*((unsigned char *)v4 + 108))
    {
      goto LABEL_25;
    }
    BOOL v15 = 1;
  }
LABEL_26:

  return v15;
}

- (unint64_t)hash
{
  -[GEOPDTransitInfoSnippet readAll:]((uint64_t)self, 1);
  uint64_t v13 = [(NSMutableArray *)self->_systemNames hash];
  uint64_t v3 = [(NSMutableArray *)self->_artworks hash];
  NSUInteger v4 = [(NSString *)self->_searchDisplayName hash];
  uint64_t v5 = [(NSMutableArray *)self->_labels hash];
  if (*(_WORD *)&self->_flags) {
    unint64_t v6 = 2654435761u * self->_transitId;
  }
  else {
    unint64_t v6 = 0;
  }
  unint64_t v7 = [(GEOTimezone *)self->_timezone hash];
  NSUInteger v8 = [(NSString *)self->_transitName hash];
  unint64_t v9 = [(GEOLatLng *)self->_stopLocationForTrip hash];
  unint64_t v10 = [(GEOStyleAttributes *)self->_styleAttributesForTrip hash];
  if ((*(_WORD *)&self->_flags & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_isHidden;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitName, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_systemNames, 0);
  objc_storeStrong((id *)&self->_styleAttributesForTrip, 0);
  objc_storeStrong((id *)&self->_stopLocationForTrip, 0);
  objc_storeStrong((id *)&self->_searchDisplayName, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_artworks, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end