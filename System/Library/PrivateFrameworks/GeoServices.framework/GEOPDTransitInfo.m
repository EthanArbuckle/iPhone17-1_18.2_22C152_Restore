@interface GEOPDTransitInfo
+ (id)transitInfoForPlaceData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDTransitInfo)init;
- (GEOPDTransitInfo)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)labels;
- (id)lineAtIndex:(id *)a1;
- (id)lines;
- (id)searchDisplayName;
- (id)stopInfos;
- (id)subTitle;
- (id)systems;
- (id)title;
- (id)transitConnections;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsLabel:(uint64_t)a1;
- (void)_addNoFlagsLine:(uint64_t)a1;
- (void)_addNoFlagsStopInfo:(uint64_t)a1;
- (void)_addNoFlagsSystem:(uint64_t)a1;
- (void)_addNoFlagsTransitConnection:(uint64_t)a1;
- (void)_readLabels;
- (void)_readLines;
- (void)_readSearchDisplayName;
- (void)_readStopInfos;
- (void)_readSubTitle;
- (void)_readSystems;
- (void)_readTitle;
- (void)_readTransitConnections;
- (void)_readTransitMarketId;
- (void)addLabel:(uint64_t)a1;
- (void)addLine:(uint64_t)a1;
- (void)addStopInfo:(uint64_t)a1;
- (void)addSystem:(uint64_t)a1;
- (void)addTransitConnection:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDTransitInfo

+ (id)transitInfoForPlaceData:(id)a3
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
  v6[2] = __61__GEOPDTransitInfo_PlaceDataExtras__transitInfoForPlaceData___block_invoke;
  v6[3] = &unk_1E53E16F0;
  v6[4] = &v7;
  [v3 enumerateValidComponentValuesOfType:10 usingBlock:v6];
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __61__GEOPDTransitInfo_PlaceDataExtras__transitInfoForPlaceData___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5 = -[GEOPDComponentValue transitInfo](a2);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  *a3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) != 0;
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOPDTransitInfo _readTransitConnections](result);
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = *(id *)(v3 + 80);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * v8);
          if (v9)
          {
            -[GEOPDTransitConnection _readMapsId](*(void *)(*((void *)&v10 + 1) + 8 * v8));
            if (objc_msgSend(*(id *)(v9 + 32), "hasGreenTeaWithValue:", a2, (void)v10))
            {

              return 1;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOPDTransitInfo _readTransitMarketId](v3);
    return [*(id *)(v3 + 96) hasGreenTeaWithValue:a2];
  }
  return result;
}

- (GEOPDTransitInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitInfo;
  v2 = [(GEOPDTransitInfo *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDTransitInfo)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitInfo;
  uint64_t v3 = [(GEOPDTransitInfo *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readLines
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLines_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)lines
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDTransitInfo _readLines]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLine:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfo _readLines](a1);
    -[GEOPDTransitInfo _addNoFlagsLine:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsLine:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      id v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (id)lineAtIndex:(id *)a1
{
  if (a1)
  {
    id v4 = a1;
    -[GEOPDTransitInfo _readLines]((uint64_t)a1);
    a1 = [v4[4] objectAtIndex:a2];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (void)_readSystems
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSystems_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)systems
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readSystems]((uint64_t)a1);
    a1 = (id *)v2[8];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSystem:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfo _readSystems](a1);
    -[GEOPDTransitInfo _addNoFlagsSystem:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsSystem:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      id v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readLabels
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 4) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLabels_tags_9249);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)labels
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readLabels]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addLabel:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfo _readLabels](a1);
    -[GEOPDTransitInfo _addNoFlagsLabel:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsLabel:(uint64_t)a1
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

- (void)_readTransitConnections
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitConnections_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)transitConnections
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readTransitConnections]((uint64_t)a1);
    a1 = (id *)v2[10];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addTransitConnection:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfo _readTransitConnections](a1);
    -[GEOPDTransitInfo _addNoFlagsTransitConnection:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsTransitConnection:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 80);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v5;

      id v4 = *(void **)(a1 + 80);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readSearchDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSearchDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)searchDisplayName
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readSearchDisplayName]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readTransitMarketId
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
  if ((*(_WORD *)(a1 + 116) & 0x400) == 0)
  {
    uint64_t v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTransitMarketId_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_9251);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)title
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readTitle]((uint64_t)a1);
    a1 = (id *)v2[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSubTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSubTitle_tags_9252);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)subTitle
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readSubTitle]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readStopInfos
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      uint64_t v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readStopInfos_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (id)stopInfos
{
  if (a1)
  {
    uint64_t v2 = a1;
    -[GEOPDTransitInfo _readStopInfos]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addStopInfo:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDTransitInfo _readStopInfos](a1);
    -[GEOPDTransitInfo _addNoFlagsStopInfo:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 116) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
    *(_WORD *)(a1 + 116) |= 0x800u;
  }
}

- (void)_addNoFlagsStopInfo:(uint64_t)a1
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDTransitInfo;
  id v4 = [(GEOPDTransitInfo *)&v8 description];
  id v5 = [(GEOPDTransitInfo *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDTransitInfo readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v83 objects:v91 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v84 != v9) {
              objc_enumerationMutation(v6);
            }
            long long v11 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            long long v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v83 objects:v91 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"line"];
    }
    if ([*(id *)(a1 + 64) count])
    {
      long long v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      long long v79 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      id v14 = *(id *)(a1 + 64);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v79 objects:v90 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v80;
        do
        {
          for (uint64_t j = 0; j != v16; ++j)
          {
            if (*(void *)v80 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v79 + 1) + 8 * j);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v79 objects:v90 count:16];
        }
        while (v16);
      }

      [v4 setObject:v13 forKey:@"system"];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id v22 = *(id *)(a1 + 24);
      uint64_t v23 = [v22 countByEnumeratingWithState:&v75 objects:v89 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v76;
        do
        {
          for (uint64_t k = 0; k != v24; ++k)
          {
            if (*(void *)v76 != v25) {
              objc_enumerationMutation(v22);
            }
            v27 = *(void **)(*((void *)&v75 + 1) + 8 * k);
            if (a2) {
              [v27 jsonRepresentation];
            }
            else {
            v28 = [v27 dictionaryRepresentation];
            }
            [v21 addObject:v28];
          }
          uint64_t v24 = [v22 countByEnumeratingWithState:&v75 objects:v89 count:16];
        }
        while (v24);
      }

      [v4 setObject:v21 forKey:@"label"];
    }
    if ([*(id *)(a1 + 80) count])
    {
      v29 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
      long long v71 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v30 = *(id *)(a1 + 80);
      uint64_t v31 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v72;
        do
        {
          for (uint64_t m = 0; m != v32; ++m)
          {
            if (*(void *)v72 != v33) {
              objc_enumerationMutation(v30);
            }
            v35 = *(void **)(*((void *)&v71 + 1) + 8 * m);
            if (a2) {
              [v35 jsonRepresentation];
            }
            else {
            v36 = [v35 dictionaryRepresentation];
            }
            [v29 addObject:v36];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v71 objects:v88 count:16];
        }
        while (v32);
      }

      if (a2) {
        v37 = @"transitConnection";
      }
      else {
        v37 = @"transit_connection";
      }
      [v4 setObject:v29 forKey:v37];
    }
    v38 = -[GEOPDTransitInfo searchDisplayName]((id *)a1);
    if (v38)
    {
      if (a2) {
        v39 = @"searchDisplayName";
      }
      else {
        v39 = @"search_display_name";
      }
      [v4 setObject:v38 forKey:v39];
    }

    -[GEOPDTransitInfo _readTransitMarketId](a1);
    id v40 = *(id *)(a1 + 96);
    v41 = v40;
    if (v40)
    {
      if (a2)
      {
        v42 = [v40 jsonRepresentation];
        v43 = @"transitMarketId";
      }
      else
      {
        v42 = [v40 dictionaryRepresentation];
        v43 = @"transit_market_id";
      }
      [v4 setObject:v42 forKey:v43];
    }
    v44 = -[GEOPDTransitInfo title]((id *)a1);
    if (v44) {
      [v4 setObject:v44 forKey:@"title"];
    }

    v45 = -[GEOPDTransitInfo subTitle]((id *)a1);
    if (v45)
    {
      if (a2) {
        v46 = @"subTitle";
      }
      else {
        v46 = @"sub_title";
      }
      [v4 setObject:v45 forKey:v46];
    }

    if (*(_WORD *)(a1 + 116))
    {
      v47 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 88)];
      if (a2) {
        v48 = @"transitId";
      }
      else {
        v48 = @"transit_id";
      }
      [v4 setObject:v47 forKey:v48];
    }
    if ([*(id *)(a1 + 48) count])
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id v50 = *(id *)(a1 + 48);
      uint64_t v51 = [v50 countByEnumeratingWithState:&v67 objects:v87 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = *(void *)v68;
        do
        {
          for (uint64_t n = 0; n != v52; ++n)
          {
            if (*(void *)v68 != v53) {
              objc_enumerationMutation(v50);
            }
            v55 = *(void **)(*((void *)&v67 + 1) + 8 * n);
            if (a2) {
              [v55 jsonRepresentation];
            }
            else {
            v56 = [v55 dictionaryRepresentation];
            }
            [v49 addObject:v56];
          }
          uint64_t v52 = [v50 countByEnumeratingWithState:&v67 objects:v87 count:16];
        }
        while (v52);
      }

      if (a2) {
        v57 = @"stopInfo";
      }
      else {
        v57 = @"stop_info";
      }
      [v4 setObject:v49 forKey:v57];
    }
    v58 = *(void **)(a1 + 16);
    if (v58)
    {
      v59 = [v58 dictionaryRepresentation];
      v60 = v59;
      if (a2)
      {
        v61 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v59, "count"));
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __46__GEOPDTransitInfo__dictionaryRepresentation___block_invoke;
        v65[3] = &unk_1E53D8860;
        id v62 = v61;
        id v66 = v62;
        [v60 enumerateKeysAndObjectsUsingBlock:v65];
        id v63 = v62;

        v60 = v63;
      }
      [v4 setObject:v60 forKey:@"Unknown Fields"];
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
  return -[GEOPDTransitInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_9284;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_9285;
      }
      GEOPDTransitInfoReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDTransitInfoCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

void __46__GEOPDTransitInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  uint64_t v6 = 8;
  if (!self->_reader) {
    goto LABEL_37;
  }
  os_unfair_lock_assert_owner(&self->_readerLock);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 0xFFC) != 0) {
    goto LABEL_37;
  }
  if ((flags & 0x80) != 0)
  {
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    uint64_t v8 = self->_systems;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v75 objects:v86 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v76;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v76 != v10) {
          objc_enumerationMutation(v8);
        }
        if (GEOPBTransitSystemIsDirty(*(os_unfair_lock_s **)(*((void *)&v75 + 1) + 8 * v11))) {
          goto LABEL_36;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v75 objects:v86 count:16];
          if (v9) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 4) != 0)
  {
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    uint64_t v8 = self->_labels;
    uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v71 objects:v85 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v72;
LABEL_16:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v72 != v13) {
          objc_enumerationMutation(v8);
        }
        if (GEOPDTransitLabelIsDirty(*(os_unfair_lock_s **)(*((void *)&v71 + 1) + 8 * v14))) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v71 objects:v85 count:16];
          if (v12) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }
LABEL_36:

LABEL_37:
      os_unfair_lock_unlock(p_readerLock);
      -[GEOPDTransitInfo readAll:]((uint64_t)self, 0);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      v26 = self->_lines;
      uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v63 objects:v83 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v64;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v64 != v28) {
              objc_enumerationMutation(v26);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v63 objects:v83 count:16];
        }
        while (v27);
      }

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v30 = self->_systems;
      uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v59 objects:v82 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v60;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v60 != v32) {
              objc_enumerationMutation(v30);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v59 objects:v82 count:16];
        }
        while (v31);
      }

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      v34 = self->_labels;
      uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v55 objects:v81 count:16];
      if (v35)
      {
        uint64_t v36 = *(void *)v56;
        do
        {
          for (uint64_t k = 0; k != v35; ++k)
          {
            if (*(void *)v56 != v36) {
              objc_enumerationMutation(v34);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v55 objects:v81 count:16];
        }
        while (v35);
      }

      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      v38 = self->_transitConnections;
      uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v51 objects:v80 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v52;
        do
        {
          for (uint64_t m = 0; m != v39; ++m)
          {
            if (*(void *)v52 != v40) {
              objc_enumerationMutation(v38);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v39 = [(NSMutableArray *)v38 countByEnumeratingWithState:&v51 objects:v80 count:16];
        }
        while (v39);
      }

      if (self->_searchDisplayName) {
        PBDataWriterWriteStringField();
      }
      if (self->_transitMarketId) {
        PBDataWriterWriteSubmessage();
      }
      if (self->_title) {
        PBDataWriterWriteStringField();
      }
      if (self->_subTitle) {
        PBDataWriterWriteStringField();
      }
      if (*(_WORD *)&self->_flags) {
        PBDataWriterWriteUint64Field();
      }
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      v42 = self->_stopInfos;
      uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v47 objects:v79 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v48;
        do
        {
          for (uint64_t n = 0; n != v43; ++n)
          {
            if (*(void *)v48 != v44) {
              objc_enumerationMutation(v42);
            }
            PBDataWriterWriteSubmessage();
          }
          uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v47 objects:v79 count:16];
        }
        while (v43);
      }

      [(PBUnknownFields *)self->_unknownFields writeTo:v4];
      goto LABEL_83;
    }
LABEL_22:

    __int16 flags = (__int16)self->_flags;
  }
  if ((flags & 0x200) != 0)
  {
    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    uint64_t v15 = self->_transitConnections;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v67 objects:v84 count:16];
    if (v16)
    {
      uint64_t v46 = *(void *)v68;
      while (2)
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v68 != v46) {
            objc_enumerationMutation(v15);
          }
          v18 = self;
          v19 = v15;
          v20 = p_readerLock;
          uint64_t v21 = v6;
          uint64_t v22 = *(void *)(*((void *)&v67 + 1) + 8 * v17);
          if (v22)
          {
            os_unfair_lock_lock_with_options();
            os_unfair_lock_assert_owner((const os_unfair_lock *)(v22 + 64));
            int v23 = *(unsigned char *)(v22 + 68) & 0x3C;
            os_unfair_lock_unlock((os_unfair_lock_t)(v22 + 64));
            if (v23)
            {
              p_readerLocuint64_t k = v20;
              uint64_t v8 = v19;
              self = v18;
              goto LABEL_36;
            }
          }
          ++v17;
          uint64_t v6 = v21;
          p_readerLocuint64_t k = v20;
          uint64_t v15 = v19;
          self = v18;
        }
        while (v16 != v17);
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v67 objects:v84 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  id v24 = *(id *)((char *)&self->super.super.isa + v6);
  objc_sync_enter(v24);
  *(void *)(*(char **)((char *)&self->super.super.isa + v6) + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [*(id *)((char *)&self->super.super.isa + v6) seekToOffset:self->_readerMarkPos];
  uint64_t v25 = [*(id *)((char *)&self->super.super.isa + v6) readBytes:self->_readerMarkLength - self->_readerMarkPos];
  [v4 writeData:v25];
  os_unfair_lock_unlock(p_readerLock);

  objc_sync_exit(v24);
LABEL_83:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDTransitInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_43;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitInfo readAll:]((uint64_t)self, 0);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  uint64_t v9 = self->_lines;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v60 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDTransitInfo addLine:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v60 objects:v68 count:16];
    }
    while (v10);
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v14 = self->_systems;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v56 objects:v67 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v57 != v16) {
          objc_enumerationMutation(v14);
        }
        v18 = (void *)[*(id *)(*((void *)&v56 + 1) + 8 * j) copyWithZone:a3];
        -[GEOPDTransitInfo addSystem:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v56 objects:v67 count:16];
    }
    while (v15);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  v19 = self->_labels;
  uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v52 objects:v66 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v53;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v53 != v21) {
          objc_enumerationMutation(v19);
        }
        int v23 = (void *)[*(id *)(*((void *)&v52 + 1) + 8 * k) copyWithZone:a3];
        -[GEOPDTransitInfo addLabel:](v5, v23);
      }
      uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v52 objects:v66 count:16];
    }
    while (v20);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v24 = self->_transitConnections;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v48 objects:v65 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v49;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v49 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = (void *)[*(id *)(*((void *)&v48 + 1) + 8 * m) copyWithZone:a3];
        -[GEOPDTransitInfo addTransitConnection:](v5, v28);
      }
      uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v48 objects:v65 count:16];
    }
    while (v25);
  }

  uint64_t v29 = [(NSString *)self->_searchDisplayName copyWithZone:a3];
  id v30 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v29;

  id v31 = [(GEOPDMapsIdentifier *)self->_transitMarketId copyWithZone:a3];
  uint64_t v32 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v31;

  uint64_t v33 = [(NSString *)self->_title copyWithZone:a3];
  v34 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v33;

  uint64_t v35 = [(NSString *)self->_subTitle copyWithZone:a3];
  uint64_t v36 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v35;

  if (*(_WORD *)&self->_flags)
  {
    *(void *)(v5 + 88) = self->_transitId;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v37 = self->_stopInfos;
  uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v44 objects:v64 count:16];
  if (v38)
  {
    uint64_t v39 = *(void *)v45;
    do
    {
      for (uint64_t n = 0; n != v38; ++n)
      {
        if (*(void *)v45 != v39) {
          objc_enumerationMutation(v37);
        }
        v41 = objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * n), "copyWithZone:", a3, (void)v44);
        -[GEOPDTransitInfo addStopInfo:](v5, v41);
      }
      uint64_t v38 = [(NSMutableArray *)v37 countByEnumeratingWithState:&v44 objects:v64 count:16];
    }
    while (v38);
  }

  v42 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v42;
LABEL_43:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  -[GEOPDTransitInfo readAll:]((uint64_t)self, 1);
  -[GEOPDTransitInfo readAll:]((uint64_t)v4, 1);
  lines = self->_lines;
  if ((unint64_t)lines | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](lines, "isEqual:")) {
      goto LABEL_25;
    }
  }
  systems = self->_systems;
  if ((unint64_t)systems | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](systems, "isEqual:")) {
      goto LABEL_25;
    }
  }
  labels = self->_labels;
  if ((unint64_t)labels | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](labels, "isEqual:")) {
      goto LABEL_25;
    }
  }
  transitConnections = self->_transitConnections;
  if ((unint64_t)transitConnections | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](transitConnections, "isEqual:")) {
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
  transitMarketId = self->_transitMarketId;
  if ((unint64_t)transitMarketId | *((void *)v4 + 12))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](transitMarketId, "isEqual:")) {
      goto LABEL_25;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_25;
    }
  }
  subTitle = self->_subTitle;
  if ((unint64_t)subTitle | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](subTitle, "isEqual:")) {
      goto LABEL_25;
    }
  }
  __int16 v13 = *((_WORD *)v4 + 58);
  if (*(_WORD *)&self->_flags)
  {
    if ((v13 & 1) == 0 || self->_transitId != *((void *)v4 + 11)) {
      goto LABEL_25;
    }
  }
  else if (v13)
  {
LABEL_25:
    char v15 = 0;
    goto LABEL_26;
  }
  stopInfos = self->_stopInfos;
  if ((unint64_t)stopInfos | *((void *)v4 + 6)) {
    char v15 = -[NSMutableArray isEqual:](stopInfos, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_26:

  return v15;
}

- (unint64_t)hash
{
  -[GEOPDTransitInfo readAll:]((uint64_t)self, 1);
  uint64_t v3 = [(NSMutableArray *)self->_lines hash];
  uint64_t v4 = [(NSMutableArray *)self->_systems hash];
  uint64_t v5 = [(NSMutableArray *)self->_labels hash];
  uint64_t v6 = [(NSMutableArray *)self->_transitConnections hash];
  NSUInteger v7 = [(NSString *)self->_searchDisplayName hash];
  unint64_t v8 = [(GEOPDMapsIdentifier *)self->_transitMarketId hash];
  NSUInteger v9 = [(NSString *)self->_title hash];
  NSUInteger v10 = [(NSString *)self->_subTitle hash];
  if (*(_WORD *)&self->_flags) {
    unint64_t v11 = 2654435761u * self->_transitId;
  }
  else {
    unint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSMutableArray *)self->_stopInfos hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitMarketId, 0);
  objc_storeStrong((id *)&self->_transitConnections, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_systems, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_stopInfos, 0);
  objc_storeStrong((id *)&self->_searchDisplayName, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end