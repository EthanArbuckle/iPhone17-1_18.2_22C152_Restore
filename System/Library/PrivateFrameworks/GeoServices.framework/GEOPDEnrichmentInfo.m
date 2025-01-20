@interface GEOPDEnrichmentInfo
+ (GEOPDEnrichmentInfo)enrichmentInfoWithPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDEnrichmentInfo)init;
- (GEOPDEnrichmentInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)poiNames;
- (id)showcaseId;
- (id)showcaseImageUrls;
- (id)showcaseTitles;
- (id)sourceId;
- (id)sourceName;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (unint64_t)hash;
- (void)_addNoFlagsPoiName:(uint64_t)a1;
- (void)_addNoFlagsShowcaseImageUrl:(uint64_t)a1;
- (void)_addNoFlagsShowcaseTitle:(uint64_t)a1;
- (void)_readPoiNames;
- (void)_readShowcaseId;
- (void)_readShowcaseImageUrls;
- (void)_readShowcaseTitles;
- (void)_readSourceId;
- (void)_readSourceName;
- (void)addPoiName:(uint64_t)a1;
- (void)addShowcaseImageUrl:(uint64_t)a1;
- (void)addShowcaseTitle:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDEnrichmentInfo

+ (GEOPDEnrichmentInfo)enrichmentInfoWithPlaceData:(id)a3
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
  v6[2] = __68__GEOPDEnrichmentInfo_PlaceDataExtras__enrichmentInfoWithPlaceData___block_invoke;
  v6[3] = &unk_1E53E1740;
  v6[4] = &v7;
  [v3 enumerateComponentOfType:93 enumerationOptions:1 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (GEOPDEnrichmentInfo *)v4;
}

void __68__GEOPDEnrichmentInfo_PlaceDataExtras__enrichmentInfoWithPlaceData___block_invoke(uint64_t a1, id *a2, unsigned char *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v5 = -[GEOPDComponent values](a2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (v10 && *(void *)(v10 + 184))
        {
          uint64_t v11 = -[GEOPDComponentValue enrichmentInfo]((id *)v10);
          uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
          v13 = *(void **)(v12 + 40);
          *(void *)(v12 + 40) = v11;

          *a3 = 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 1u;
    *(unsigned char *)(a1 + 84) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDEnrichmentInfo readAll:](a1, 0);
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = *(id *)(a1 + 24);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            [*(id *)(*((void *)&v19 + 1) + 8 * v9++) clearUnknownFields:1];
          }
          while (v7 != v9);
          uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v7);
      }

      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          uint64_t v14 = 0;
          do
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v14++), "clearUnknownFields:", 1, (void)v15);
          }
          while (v12 != v14);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        }
        while (v12);
      }
    }
  }
}

- (GEOPDEnrichmentInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDEnrichmentInfo;
  v2 = [(GEOPDEnrichmentInfo *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDEnrichmentInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDEnrichmentInfo;
  id v3 = [(GEOPDEnrichmentInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)_readSourceName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sourceName
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentInfo _readSourceName]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSourceId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceId_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sourceId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentInfo _readSourceId]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readShowcaseId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)showcaseId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentInfo _readShowcaseId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readPoiNames
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPoiNames_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)poiNames
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentInfo _readPoiNames]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addPoiName:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDEnrichmentInfo _readPoiNames](a1);
    -[GEOPDEnrichmentInfo _addNoFlagsPoiName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsPoiName:(uint64_t)a1
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

- (void)_readShowcaseTitles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseTitles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)showcaseTitles
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentInfo _readShowcaseTitles]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addShowcaseTitle:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDEnrichmentInfo _readShowcaseTitles](a1);
    -[GEOPDEnrichmentInfo _addNoFlagsShowcaseTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsShowcaseTitle:(uint64_t)a1
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

- (void)_readShowcaseImageUrls
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readShowcaseImageUrls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)showcaseImageUrls
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDEnrichmentInfo _readShowcaseImageUrls]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addShowcaseImageUrl:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDEnrichmentInfo _readShowcaseImageUrls](a1);
    -[GEOPDEnrichmentInfo _addNoFlagsShowcaseImageUrl:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(unsigned char *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsShowcaseImageUrl:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 40);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = v5;

      id v4 = *(void **)(a1 + 40);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDEnrichmentInfo;
  id v4 = [(GEOPDEnrichmentInfo *)&v8 description];
  id v5 = [(GEOPDEnrichmentInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEnrichmentInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDEnrichmentInfo readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDEnrichmentInfo sourceName]((id *)a1);
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"sourceName";
      }
      else {
        objc_super v6 = @"source_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    id v7 = -[GEOPDEnrichmentInfo sourceId]((id *)a1);
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"sourceId";
      }
      else {
        objc_super v8 = @"source_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    uint64_t v9 = -[GEOPDEnrichmentInfo showcaseId]((id *)a1);
    if (v9)
    {
      if (a2) {
        id v10 = @"showcaseId";
      }
      else {
        id v10 = @"showcase_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    if ([*(id *)(a1 + 24) count])
    {
      uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id v12 = *(id *)(a1 + 24);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v45;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v45 != v15) {
              objc_enumerationMutation(v12);
            }
            long long v17 = *(void **)(*((void *)&v44 + 1) + 8 * i);
            if (a2) {
              [v17 jsonRepresentation];
            }
            else {
            long long v18 = [v17 dictionaryRepresentation];
            }
            [v11 addObject:v18];
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
        }
        while (v14);
      }

      if (a2) {
        long long v19 = @"poiName";
      }
      else {
        long long v19 = @"poi_name";
      }
      [v4 setObject:v11 forKey:v19];
    }
    if ([*(id *)(a1 + 48) count])
    {
      long long v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v21 = *(id *)(a1 + 48);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v41;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v41 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v40 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
        }
        while (v23);
      }

      if (a2) {
        v28 = @"showcaseTitle";
      }
      else {
        v28 = @"showcase_title";
      }
      [v4 setObject:v20 forKey:v28];
    }
    if (*(void *)(a1 + 40))
    {
      v29 = -[GEOPDEnrichmentInfo showcaseImageUrls]((id *)a1);
      if (a2) {
        v30 = @"showcaseImageUrl";
      }
      else {
        v30 = @"showcase_image_url";
      }
      [v4 setObject:v29 forKey:v30];
    }
    v31 = *(void **)(a1 + 16);
    if (v31)
    {
      v32 = [v31 dictionaryRepresentation];
      v33 = v32;
      if (a2)
      {
        v34 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __49__GEOPDEnrichmentInfo__dictionaryRepresentation___block_invoke;
        v38[3] = &unk_1E53D8860;
        id v35 = v34;
        id v39 = v35;
        [v33 enumerateKeysAndObjectsUsingBlock:v38];
        id v36 = v35;

        v33 = v36;
      }
      [v4 setObject:v33 forKey:@"Unknown Fields"];
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
  return -[GEOPDEnrichmentInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_4386;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_4387;
      }
      GEOPDEnrichmentInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDEnrichmentInfoCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEOPDEnrichmentInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
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
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = [(id)a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"sourceName";
      }
      else {
        objc_super v6 = @"source_name";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        id v9 = v8;
        *(unsigned char *)(a1 + 84) |= 0x40u;
        *(unsigned char *)(a1 + 84) |= 0x80u;
        objc_storeStrong((id *)(a1 + 64), v8);
      }
      if (a3) {
        id v10 = @"sourceId";
      }
      else {
        id v10 = @"source_id";
      }
      uint64_t v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = (void *)[v11 copy];
        id v13 = v12;
        *(unsigned char *)(a1 + 84) |= 0x20u;
        *(unsigned char *)(a1 + 84) |= 0x80u;
        objc_storeStrong((id *)(a1 + 56), v12);
      }
      if (a3) {
        uint64_t v14 = @"showcaseId";
      }
      else {
        uint64_t v14 = @"showcase_id";
      }
      uint64_t v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = (void *)[v15 copy];
        id v17 = v16;
        *(unsigned char *)(a1 + 84) |= 4u;
        *(unsigned char *)(a1 + 84) |= 0x80u;
        objc_storeStrong((id *)(a1 + 32), v16);
      }
      if (a3) {
        long long v18 = @"poiName";
      }
      else {
        long long v18 = @"poi_name";
      }
      long long v19 = [v5 objectForKeyedSubscript:v18];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        uint64_t v50 = v19;
        id v20 = v19;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          uint64_t v23 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v22; ++i)
            {
              if (*(void *)v61 != v23) {
                objc_enumerationMutation(v20);
              }
              uint64_t v25 = *(void *)(*((void *)&v60 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v26 = [GEOLocalizedString alloc];
                if (a3) {
                  v27 = [(GEOLocalizedString *)v26 initWithJSON:v25];
                }
                else {
                  v27 = [(GEOLocalizedString *)v26 initWithDictionary:v25];
                }
                v28 = v27;
                -[GEOPDEnrichmentInfo addPoiName:](a1, v27);
              }
            }
            uint64_t v22 = [v20 countByEnumeratingWithState:&v60 objects:v66 count:16];
          }
          while (v22);
        }

        long long v19 = v50;
      }

      if (a3) {
        v29 = @"showcaseTitle";
      }
      else {
        v29 = @"showcase_title";
      }
      v30 = objc_msgSend(v5, "objectForKeyedSubscript:", v29, v50);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v51 = v30;
        id v31 = v30;
        uint64_t v32 = [v31 countByEnumeratingWithState:&v56 objects:v65 count:16];
        if (v32)
        {
          uint64_t v33 = v32;
          uint64_t v34 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v33; ++j)
            {
              if (*(void *)v57 != v34) {
                objc_enumerationMutation(v31);
              }
              uint64_t v36 = *(void *)(*((void *)&v56 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v37 = [GEOLocalizedString alloc];
                if (a3) {
                  v38 = [(GEOLocalizedString *)v37 initWithJSON:v36];
                }
                else {
                  v38 = [(GEOLocalizedString *)v37 initWithDictionary:v36];
                }
                id v39 = v38;
                -[GEOPDEnrichmentInfo addShowcaseTitle:](a1, v38);
              }
            }
            uint64_t v33 = [v31 countByEnumeratingWithState:&v56 objects:v65 count:16];
          }
          while (v33);
        }

        v30 = v51;
      }

      if (a3) {
        long long v40 = @"showcaseImageUrl";
      }
      else {
        long long v40 = @"showcase_image_url";
      }
      long long v41 = objc_msgSend(v5, "objectForKeyedSubscript:", v40, v51);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v42 = v41;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v52 objects:v64 count:16];
        if (v43)
        {
          uint64_t v44 = v43;
          uint64_t v45 = *(void *)v53;
          do
          {
            for (uint64_t k = 0; k != v44; ++k)
            {
              if (*(void *)v53 != v45) {
                objc_enumerationMutation(v42);
              }
              long long v47 = *(void **)(*((void *)&v52 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v48 = (void *)[v47 copy];
                -[GEOPDEnrichmentInfo addShowcaseImageUrl:](a1, v48);
              }
            }
            uint64_t v44 = [v42 countByEnumeratingWithState:&v52 objects:v64 count:16];
          }
          while (v44);
        }
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEnrichmentInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(unsigned char *)&self->_flags <= 1u))
  {
    long long v18 = self->_reader;
    objc_sync_enter(v18);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v19 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v19];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 0);
    if (self->_sourceName) {
      PBDataWriterWriteStringField();
    }
    if (self->_sourceId) {
      PBDataWriterWriteStringField();
    }
    if (self->_showcaseId) {
      PBDataWriterWriteStringField();
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    objc_super v6 = self->_poiNames;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v29;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v7);
    }

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v10 = self->_showcaseTitles;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v25;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
      }
      while (v11);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v14 = self->_showcaseImageUrls;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v21;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v21 != v16) {
            objc_enumerationMutation(v14);
          }
          PBDataWriterWriteStringField();
          ++v17;
        }
        while (v15 != v17);
        uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v15);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
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
      GEOPDEnrichmentInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 0);
  uint64_t v8 = [(NSString *)self->_sourceName copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v8;

  uint64_t v10 = [(NSString *)self->_sourceId copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_showcaseId copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v14 = self->_poiNames;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v39;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * v17) copyWithZone:a3];
        -[GEOPDEnrichmentInfo addPoiName:](v5, v18);

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
    }
    while (v15);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v19 = self->_showcaseTitles;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v35;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v35 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * v22) copyWithZone:a3];
        -[GEOPDEnrichmentInfo addShowcaseTitle:](v5, v23);

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v20);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v24 = self->_showcaseImageUrls;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v31;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v31 != v26) {
          objc_enumerationMutation(v24);
        }
        long long v28 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * v27), "copyWithZone:", a3, (void)v30);
        -[GEOPDEnrichmentInfo addShowcaseImageUrl:](v5, v28);

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v25);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 1),
         -[GEOPDEnrichmentInfo readAll:]((uint64_t)v4, 1),
         sourceName = self->_sourceName,
         !((unint64_t)sourceName | v4[8]))
     || -[NSString isEqual:](sourceName, "isEqual:"))
    && ((sourceId = self->_sourceId, !((unint64_t)sourceId | v4[7]))
     || -[NSString isEqual:](sourceId, "isEqual:"))
    && ((showcaseId = self->_showcaseId, !((unint64_t)showcaseId | v4[4]))
     || -[NSString isEqual:](showcaseId, "isEqual:"))
    && ((poiNames = self->_poiNames, !((unint64_t)poiNames | v4[3]))
     || -[NSMutableArray isEqual:](poiNames, "isEqual:"))
    && ((showcaseTitles = self->_showcaseTitles, !((unint64_t)showcaseTitles | v4[6]))
     || -[NSMutableArray isEqual:](showcaseTitles, "isEqual:")))
  {
    showcaseImageUrls = self->_showcaseImageUrls;
    if ((unint64_t)showcaseImageUrls | v4[5]) {
      char v11 = -[NSMutableArray isEqual:](showcaseImageUrls, "isEqual:");
    }
    else {
      char v11 = 1;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  -[GEOPDEnrichmentInfo readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_sourceName hash];
  NSUInteger v4 = [(NSString *)self->_sourceId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_showcaseId hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_poiNames hash];
  uint64_t v7 = [(NSMutableArray *)self->_showcaseTitles hash];
  return v6 ^ v7 ^ [(NSMutableArray *)self->_showcaseImageUrls hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_showcaseTitles, 0);
  objc_storeStrong((id *)&self->_showcaseImageUrls, 0);
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_poiNames, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end