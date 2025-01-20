@interface GEOETAResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOETAResult)init;
- (GEOETAResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)placeSearchResponse;
- (id)sortedETAs;
- (uint64_t)_initWithDictionary:(int)a3 isJSON:;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (uint64_t)status;
- (unint64_t)hash;
- (void)_addNoFlagsEtaRouteIncident:(uint64_t)a1;
- (void)_addNoFlagsSortedETA:(uint64_t)a1;
- (void)_readEtaRouteIncidents;
- (void)_readPlaceSearchResponse;
- (void)_readSortedETAs;
- (void)addEtaRouteIncident:(uint64_t)a1;
- (void)addSortedETA:(uint64_t)a1;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setPlaceSearchResponse:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOETAResult

- (id)sortedETAs
{
  if (a1)
  {
    v2 = a1;
    -[GEOETAResult _readSortedETAs]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readSortedETAs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSortedETAs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedETAs, 0);
  objc_storeStrong((id *)&self->_placeSearchResponse, 0);
  objc_storeStrong((id *)&self->_etaRouteIncidents, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
    goto LABEL_30;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResult readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_5;
    }
LABEL_27:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  PBDataWriterWriteInt32Field();
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_27;
  }
LABEL_5:
  if ((flags & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_placeSearchResponse) {
    PBDataWriterWriteSubmessage();
  }
  if (*(_WORD *)&self->_flags) {
    PBDataWriterWriteUint32Field();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v7 = self->_sortedETAs;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v11 = self->_etaRouteIncidents;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
LABEL_30:
}

- (GEOETAResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOETAResult;
  v2 = [(GEOETAResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsSortedETA:(uint64_t)a1
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

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    -[GEOETAResult _readEtaRouteIncidents](result);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = *(id *)(v3 + 24);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "hasGreenTeaWithValue:", a2, (void)v9))
          {

            return 1;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    -[GEOETAResult _readPlaceSearchResponse](v3);
    return [*(id *)(v3 + 32) hasGreenTeaWithValue:a2];
  }
  return result;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x10u;
    *(_WORD *)(a1 + 76) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    -[GEOETAResult readAll:](a1, 0);
    [*(id *)(a1 + 32) clearUnknownFields:1];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v3 = *(id *)(a1 + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * v7++) clearUnknownFields:1];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v5);
    }

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = *(id *)(a1 + 24);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v14 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "clearUnknownFields:", 1, (void)v13);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v10);
    }
  }
}

- (GEOETAResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOETAResult;
  id v3 = [(GEOETAResult *)&v7 initWithData:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (uint64_t)status
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    __int16 v2 = *(_WORD *)(v1 + 76);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 56));
    if ((v2 & 8) != 0) {
      return *(unsigned int *)(v1 + 72);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readPlaceSearchResponse
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 76) & 0x40) == 0)
    {
      __int16 v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPlaceSearchResponse_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)placeSearchResponse
{
  if (a1)
  {
    __int16 v2 = a1;
    -[GEOETAResult _readPlaceSearchResponse]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setPlaceSearchResponse:(uint64_t)a1
{
  id v4 = a2;
  *(_WORD *)(a1 + 76) |= 0x40u;
  *(_WORD *)(a1 + 76) |= 0x100u;
  objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)addSortedETA:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOETAResult _readSortedETAs](a1);
    -[GEOETAResult _addNoFlagsSortedETA:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_WORD *)(a1 + 76) |= 0x100u;
  }
}

- (void)_readEtaRouteIncidents
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_WORD *)(a1 + 76) & 0x20) == 0)
  {
    __int16 v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOETAResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtaRouteIncidents_tags_0);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addEtaRouteIncident:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOETAResult _readEtaRouteIncidents](a1);
    -[GEOETAResult _addNoFlagsEtaRouteIncident:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 76) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(_WORD *)(a1 + 76) |= 0x100u;
  }
}

- (void)_addNoFlagsEtaRouteIncident:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v6 = *(void **)(a1 + 24);
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
  v8.super_class = (Class)GEOETAResult;
  id v4 = [(GEOETAResult *)&v8 description];
  id v5 = [(GEOETAResult *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_63;
  }
  -[GEOETAResult readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 76);
  if ((v5 & 8) != 0)
  {
    int v6 = *(_DWORD *)(a1 + 72);
    if (v6 <= 29)
    {
      id v7 = @"STATUS_SUCCESS";
      switch(v6)
      {
        case 0:
          goto LABEL_20;
        case 1:
          id v7 = @"STATUS_FAILED";
          break;
        case 2:
          id v7 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          id v7 = @"INVALID_REQUEST";
          break;
        default:
          if (v6 != 20) {
            goto LABEL_15;
          }
          id v7 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v6 > 49)
    {
      if (v6 == 50)
      {
        id v7 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v6 == 60)
      {
        id v7 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v6 == 30)
      {
        id v7 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v6 == 40)
      {
        id v7 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        [v4 setObject:v7 forKey:@"status"];

        __int16 v5 = *(_WORD *)(a1 + 76);
        goto LABEL_21;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 72));
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_21:
  if ((v5 & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 68)];
    [v4 setObject:v8 forKey:@"liveTravelTime"];

    __int16 v5 = *(_WORD *)(a1 + 76);
  }
  if ((v5 & 2) != 0)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
    [v4 setObject:v9 forKey:@"historicTravelTime"];
  }
  uint64_t v10 = -[GEOETAResult placeSearchResponse]((id *)a1);
  uint64_t v11 = v10;
  if (v10)
  {
    if (a2) {
      [v10 jsonRepresentation];
    }
    else {
    uint64_t v12 = [v10 dictionaryRepresentation];
    }
    [v4 setObject:v12 forKey:@"placeSearchResponse"];
  }
  if (*(_WORD *)(a1 + 76))
  {
    long long v13 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 60)];
    [v4 setObject:v13 forKey:@"distance"];
  }
  if ([*(id *)(a1 + 40) count])
  {
    long long v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v15 = *(id *)(a1 + 40);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (a2) {
            [v20 jsonRepresentation];
          }
          else {
          long long v21 = [v20 dictionaryRepresentation];
          }
          [v14 addObject:v21];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"sortedETA"];
  }
  if ([*(id *)(a1 + 24) count])
  {
    long long v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v23 = *(id *)(a1 + 24);
    uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = *(void **)(*((void *)&v40 + 1) + 8 * j);
          if (a2) {
            [v28 jsonRepresentation];
          }
          else {
          v29 = [v28 dictionaryRepresentation];
          }
          [v22 addObject:v29];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v25);
    }

    if (a2) {
      v30 = @"etaRouteIncident";
    }
    else {
      v30 = @"eta_route_incident";
    }
    [v4 setObject:v22 forKey:v30];
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
      v38[2] = __42__GEOETAResult__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E53D8860;
      id v35 = v34;
      id v39 = v35;
      [v33 enumerateKeysAndObjectsUsingBlock:v38];
      id v36 = v35;

      v33 = v36;
    }
    [v4 setObject:v33 forKey:@"Unknown Fields"];
  }
LABEL_63:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        int v6 = (int *)&readAll__recursiveTag_765;
      }
      else {
        int v6 = (int *)&readAll__nonRecursiveTag_766;
      }
      GEOETAResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOETAResultCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __42__GEOETAResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1 init];
  if (!v6) {
    goto LABEL_69;
  }
  id v7 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"STATUS_SUCCESS"])
    {
      int v9 = 0;
    }
    else if ([v8 isEqualToString:@"STATUS_FAILED"])
    {
      int v9 = 1;
    }
    else if ([v8 isEqualToString:@"STATUS_INCOMPLETE"])
    {
      int v9 = 2;
    }
    else if ([v8 isEqualToString:@"INVALID_REQUEST"])
    {
      int v9 = 5;
    }
    else if ([v8 isEqualToString:@"FAILED_NO_RESULT"])
    {
      int v9 = 20;
    }
    else if ([v8 isEqualToString:@"NEEDS_REFINEMENT"])
    {
      int v9 = 30;
    }
    else if ([v8 isEqualToString:@"FAILED_NOT_AUTHORIZED"])
    {
      int v9 = 40;
    }
    else if ([v8 isEqualToString:@"STATUS_DEDUPED"])
    {
      int v9 = 50;
    }
    else if ([v8 isEqualToString:@"VERSION_MISMATCH"])
    {
      int v9 = 60;
    }
    else
    {
      int v9 = 0;
    }

    goto LABEL_25;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v9 = [v7 intValue];
LABEL_25:
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 8u;
    *(_DWORD *)(v6 + 72) = v9;
  }

  id v10 = [v5 objectForKeyedSubscript:@"liveTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v11 = [v10 unsignedIntValue];
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 4u;
    *(_DWORD *)(v6 + 68) = v11;
  }

  uint64_t v12 = [v5 objectForKeyedSubscript:@"historicTravelTime"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v13 = [v12 unsignedIntValue];
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 2u;
    *(_DWORD *)(v6 + 64) = v13;
  }

  long long v14 = [v5 objectForKeyedSubscript:@"placeSearchResponse"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = [GEOPlaceSearchResponse alloc];
    if (a3) {
      uint64_t v16 = [(GEOPlaceSearchResponse *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOPlaceSearchResponse *)v15 initWithDictionary:v14];
    }
    uint64_t v17 = v16;
    -[GEOETAResult setPlaceSearchResponse:](v6, v16);
  }
  uint64_t v18 = [v5 objectForKeyedSubscript:@"distance"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v19 = [v18 unsignedIntValue];
    *(_WORD *)(v6 + 76) |= 0x100u;
    *(_WORD *)(v6 + 76) |= 1u;
    *(_DWORD *)(v6 + 60) = v19;
  }

  long long v20 = [v5 objectForKeyedSubscript:@"sortedETA"];
  objc_opt_class();
  id v42 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v48 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v27 = [GEOETAResultByType alloc];
            if (a3) {
              v28 = [(GEOETAResultByType *)v27 initWithJSON:v26];
            }
            else {
              v28 = [(GEOETAResultByType *)v27 initWithDictionary:v26];
            }
            v29 = v28;
            -[GEOETAResult addSortedETA:](v6, v28);
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v23);
    }

    id v5 = v42;
  }

  if (a3) {
    v30 = @"etaRouteIncident";
  }
  else {
    v30 = @"eta_route_incident";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v34; ++j)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          uint64_t v37 = *(void *)(*((void *)&v43 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v38 = [GEOETARouteIncident alloc];
            if (a3) {
              id v39 = [(GEOETARouteIncident *)v38 initWithJSON:v37];
            }
            else {
              id v39 = [(GEOETARouteIncident *)v38 initWithDictionary:v37];
            }
            long long v40 = v39;
            -[GEOETAResult addEtaRouteIncident:](v6, v39);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v34);
    }

    id v5 = v42;
  }

LABEL_69:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAResultReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOETAResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_26;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResult readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
    if ((flags & 4) == 0) {
      goto LABEL_7;
    }
LABEL_28:
    *(_DWORD *)(v5 + 68) = self->_liveTravelTime;
    *(_WORD *)(v5 + 76) |= 4u;
    if ((*(_WORD *)&self->_flags & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 72) = self->_status;
  *(_WORD *)(v5 + 76) |= 8u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 4) != 0) {
    goto LABEL_28;
  }
LABEL_7:
  if ((flags & 2) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 64) = self->_historicTravelTime;
    *(_WORD *)(v5 + 76) |= 2u;
  }
LABEL_9:
  id v10 = [(GEOPlaceSearchResponse *)self->_placeSearchResponse copyWithZone:a3];
  int v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if (*(_WORD *)&self->_flags)
  {
    *(_DWORD *)(v5 + 60) = self->_distance;
    *(_WORD *)(v5 + 76) |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = self->_sortedETAs;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = (void *)[*(id *)(*((void *)&v28 + 1) + 8 * i) copyWithZone:a3];
        -[GEOETAResult addSortedETA:](v5, v16);
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v13);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v17 = self->_etaRouteIncidents;
  uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * j), "copyWithZone:", a3, (void)v24);
        -[GEOETAResult addEtaRouteIncident:](v5, v21);
      }
      uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }

  uint64_t v22 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v22;
LABEL_26:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  -[GEOETAResult readAll:]((uint64_t)self, 1);
  -[GEOETAResult readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 38);
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_status != *((_DWORD *)v4 + 18)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_liveTravelTime != *((_DWORD *)v4 + 17)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 16)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_29;
  }
  placeSearchResponse = self->_placeSearchResponse;
  if ((unint64_t)placeSearchResponse | *((void *)v4 + 4))
  {
    if (!-[GEOPlaceSearchResponse isEqual:](placeSearchResponse, "isEqual:"))
    {
LABEL_29:
      char v10 = 0;
      goto LABEL_30;
    }
    __int16 flags = (__int16)self->_flags;
    __int16 v6 = *((_WORD *)v4 + 38);
  }
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_distance != *((_DWORD *)v4 + 15)) {
      goto LABEL_29;
    }
  }
  else if (v6)
  {
    goto LABEL_29;
  }
  sortedETAs = self->_sortedETAs;
  if ((unint64_t)sortedETAs | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](sortedETAs, "isEqual:"))
  {
    goto LABEL_29;
  }
  etaRouteIncidents = self->_etaRouteIncidents;
  if ((unint64_t)etaRouteIncidents | *((void *)v4 + 3)) {
    char v10 = -[NSMutableArray isEqual:](etaRouteIncidents, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_30:

  return v10;
}

- (unint64_t)hash
{
  -[GEOETAResult readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
    uint64_t v4 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v4 = 2654435761 * self->_status;
  if ((flags & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_liveTravelTime;
  if ((flags & 2) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_historicTravelTime;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v6 = 0;
LABEL_8:
  unint64_t v7 = [(GEOPlaceSearchResponse *)self->_placeSearchResponse hash];
  if (*(_WORD *)&self->_flags) {
    uint64_t v8 = 2654435761 * self->_distance;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v5 ^ v4 ^ v6 ^ v8 ^ v7;
  uint64_t v10 = [(NSMutableArray *)self->_sortedETAs hash];
  return v9 ^ v10 ^ [(NSMutableArray *)self->_etaRouteIncidents hash];
}

@end