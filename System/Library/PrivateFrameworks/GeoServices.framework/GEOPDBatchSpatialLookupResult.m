@interface GEOPDBatchSpatialLookupResult
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDBatchSpatialLookupResult)init;
- (GEOPDBatchSpatialLookupResult)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)spatialEventLookupResults;
- (id)spatialPlaceLookupResults;
- (uint64_t)statusCode;
- (unint64_t)hash;
- (void)_addNoFlagsSpatialEventLookupResult:(uint64_t)a1;
- (void)_addNoFlagsSpatialPlaceLookupResult:(uint64_t)a1;
- (void)_readSpatialEventLookupResults;
- (void)_readSpatialPlaceLookupResults;
- (void)addSpatialEventLookupResult:(uint64_t)a1;
- (void)addSpatialPlaceLookupResult:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDBatchSpatialLookupResult

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)self, 1);
  -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)v4, 1);
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_statusCode != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  spatialPlaceLookupResults = self->_spatialPlaceLookupResults;
  if ((unint64_t)spatialPlaceLookupResults | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](spatialPlaceLookupResults, "isEqual:"))
  {
    goto LABEL_11;
  }
  spatialEventLookupResults = self->_spatialEventLookupResults;
  if ((unint64_t)spatialEventLookupResults | *((void *)v4 + 3)) {
    char v7 = -[NSMutableArray isEqual:](spatialEventLookupResults, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        v6 = (int *)&readAll__recursiveTag_2219;
      }
      else {
        v6 = (int *)&readAll__nonRecursiveTag_2220;
      }
      GEOPDBatchSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDBatchSpatialLookupResultCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (void)_addNoFlagsSpatialEventLookupResult:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 24);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v6 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v5;

      id v4 = *(void **)(a1 + 24);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (GEOPDBatchSpatialLookupResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDBatchSpatialLookupResult;
  v2 = [(GEOPDBatchSpatialLookupResult *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDBatchSpatialLookupResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDBatchSpatialLookupResult;
  id v3 = [(GEOPDBatchSpatialLookupResult *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (uint64_t)statusCode
{
  if (result)
  {
    uint64_t v1 = result;
    os_unfair_lock_lock_with_options();
    char v2 = *(unsigned char *)(v1 + 56);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 48));
    if (v2) {
      return *(unsigned int *)(v1 + 52);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_readSpatialPlaceLookupResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBatchSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpatialPlaceLookupResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)spatialPlaceLookupResults
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDBatchSpatialLookupResult _readSpatialPlaceLookupResults]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSpatialPlaceLookupResult:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDBatchSpatialLookupResult _readSpatialPlaceLookupResults](a1);
    -[GEOPDBatchSpatialLookupResult _addNoFlagsSpatialPlaceLookupResult:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 56) |= 0x10u;
  }
}

- (void)_addNoFlagsSpatialPlaceLookupResult:(uint64_t)a1
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

- (void)_readSpatialEventLookupResults
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      char v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDBatchSpatialLookupResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSpatialEventLookupResults_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)spatialEventLookupResults
{
  if (a1)
  {
    char v2 = a1;
    -[GEOPDBatchSpatialLookupResult _readSpatialEventLookupResults]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)addSpatialEventLookupResult:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDBatchSpatialLookupResult _readSpatialEventLookupResults](a1);
    -[GEOPDBatchSpatialLookupResult _addNoFlagsSpatialEventLookupResult:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 56) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(unsigned char *)(a1 + 56) |= 0x10u;
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDBatchSpatialLookupResult;
  id v4 = [(GEOPDBatchSpatialLookupResult *)&v8 description];
  id v5 = [(GEOPDBatchSpatialLookupResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDBatchSpatialLookupResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = 0;
    goto LABEL_58;
  }
  -[GEOPDBatchSpatialLookupResult readAll:](a1, 1);
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)(a1 + 56))
  {
    int v5 = *(_DWORD *)(a1 + 52);
    if (v5 <= 29)
    {
      objc_super v6 = @"STATUS_SUCCESS";
      switch(v5)
      {
        case 0:
          goto LABEL_20;
        case 1:
          objc_super v6 = @"STATUS_FAILED";
          break;
        case 2:
          objc_super v6 = @"STATUS_INCOMPLETE";
          break;
        case 3:
        case 4:
          goto LABEL_15;
        case 5:
          objc_super v6 = @"INVALID_REQUEST";
          break;
        default:
          if (v5 != 20) {
            goto LABEL_15;
          }
          objc_super v6 = @"FAILED_NO_RESULT";
          break;
      }
      goto LABEL_20;
    }
    if (v5 > 49)
    {
      if (v5 == 50)
      {
        objc_super v6 = @"STATUS_DEDUPED";
        goto LABEL_20;
      }
      if (v5 == 60)
      {
        objc_super v6 = @"VERSION_MISMATCH";
        goto LABEL_20;
      }
    }
    else
    {
      if (v5 == 30)
      {
        objc_super v6 = @"NEEDS_REFINEMENT";
        goto LABEL_20;
      }
      if (v5 == 40)
      {
        objc_super v6 = @"FAILED_NOT_AUTHORIZED";
LABEL_20:
        if (a2) {
          id v7 = @"statusCode";
        }
        else {
          id v7 = @"status_code";
        }
        [v4 setObject:v6 forKey:v7];

        goto LABEL_24;
      }
    }
LABEL_15:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(a1 + 52));
    objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
LABEL_24:
  if ([*(id *)(a1 + 32) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v40 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v39 objects:v44 count:16];
      }
      while (v11);
    }

    if (a2) {
      v16 = @"spatialPlaceLookupResult";
    }
    else {
      v16 = @"spatial_place_lookup_result";
    }
    [v4 setObject:v8 forKey:v16];
  }
  if ([*(id *)(a1 + 24) count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v18 = *(id *)(a1 + 24);
    uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v35 + 1) + 8 * j);
          if (a2) {
            [v23 jsonRepresentation];
          }
          else {
          v24 = [v23 dictionaryRepresentation];
          }
          [v17 addObject:v24];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v20);
    }

    if (a2) {
      v25 = @"spatialEventLookupResult";
    }
    else {
      v25 = @"spatial_event_lookup_result";
    }
    [v4 setObject:v17 forKey:v25];
  }
  v26 = *(void **)(a1 + 16);
  if (v26)
  {
    v27 = [v26 dictionaryRepresentation];
    v28 = v27;
    if (a2)
    {
      v29 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v27, "count"));
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __59__GEOPDBatchSpatialLookupResult__dictionaryRepresentation___block_invoke;
      v33[3] = &unk_1E53D8860;
      id v30 = v29;
      id v34 = v30;
      [v28 enumerateKeysAndObjectsUsingBlock:v33];
      id v31 = v30;

      v28 = v31;
    }
    [v4 setObject:v28 forKey:@"Unknown Fields"];
  }
LABEL_58:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDBatchSpatialLookupResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPDBatchSpatialLookupResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    id v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDBatchSpatialLookupResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDBatchSpatialLookupResultIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
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
    -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)self, 0);
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    objc_super v6 = self->_spatialPlaceLookupResults;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v21;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v7);
    }

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = self->_spatialEventLookupResults;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v10);
          }
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v11);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDBatchSpatialLookupResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_22;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)self, 0);
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_statusCode;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = self->_spatialPlaceLookupResults;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        -[GEOPDBatchSpatialLookupResult addSpatialPlaceLookupResult:](v5, v13);
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v14 = self->_spatialEventLookupResults;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v14);
        }
        long long v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (void)v21);
        -[GEOPDBatchSpatialLookupResult addSpatialEventLookupResult:](v5, v18);
      }
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v15);
  }

  long long v19 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v19;
LABEL_22:

  return (id)v5;
}

- (unint64_t)hash
{
  -[GEOPDBatchSpatialLookupResult readAll:]((uint64_t)self, 1);
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_statusCode;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_spatialPlaceLookupResults hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_spatialEventLookupResults hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spatialPlaceLookupResults, 0);
  objc_storeStrong((id *)&self->_spatialEventLookupResults, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end