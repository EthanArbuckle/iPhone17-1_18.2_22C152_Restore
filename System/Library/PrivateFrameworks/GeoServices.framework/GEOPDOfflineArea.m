@interface GEOPDOfflineArea
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDOfflineArea)init;
- (GEOPDOfflineArea)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)mapRegion;
- (uint64_t)hasGreenTeaWithValue:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsDisplayMapRegion:(uint64_t)a1;
- (void)_readDisplayMapRegions;
- (void)_readMapRegion;
- (void)_readMaximumAllowedMapRegion;
- (void)addDisplayMapRegion:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDOfflineArea

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v3 = (id *)result;
    -[GEOPDOfflineArea _readDisplayMapRegions](result);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3[3];
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

    -[GEOPDOfflineArea _readMapRegion]((uint64_t)v3);
    if ([v3[4] hasGreenTeaWithValue:a2])
    {
      return 1;
    }
    else
    {
      -[GEOPDOfflineArea _readMaximumAllowedMapRegion]((uint64_t)v3);
      return [v3[5] hasGreenTeaWithValue:a2];
    }
  }
  return result;
}

- (GEOPDOfflineArea)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDOfflineArea;
  v2 = [(GEOPDOfflineArea *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    id v4 = v2;
  }

  return v3;
}

- (GEOPDOfflineArea)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDOfflineArea;
  v3 = [(GEOPDOfflineArea *)&v7 initWithData:a3];
  id v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (void)_readMapRegion
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDOfflineAreaReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMapRegion_tags_6760);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)mapRegion
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDOfflineArea _readMapRegion]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readMaximumAllowedMapRegion
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 8) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDOfflineAreaReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMaximumAllowedMapRegion_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)_readDisplayMapRegions
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(unsigned char *)(a1 + 60) & 2) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEOPDOfflineAreaReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayMapRegions_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addDisplayMapRegion:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEOPDOfflineArea _readDisplayMapRegions](a1);
    -[GEOPDOfflineArea _addNoFlagsDisplayMapRegion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 60) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    *(unsigned char *)(a1 + 60) |= 0x10u;
  }
}

- (void)_addNoFlagsDisplayMapRegion:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDOfflineArea;
  id v4 = [(GEOPDOfflineArea *)&v8 description];
  id v5 = [(GEOPDOfflineArea *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDOfflineArea _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    -[GEOPDOfflineArea readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = -[GEOPDOfflineArea mapRegion]((id *)a1);
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        id v7 = [v5 jsonRepresentation];
        objc_super v8 = @"mapRegion";
      }
      else
      {
        id v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"map_region";
      }
      [v4 setObject:v7 forKey:v8];
    }
    -[GEOPDOfflineArea _readMaximumAllowedMapRegion](a1);
    id v9 = *(id *)(a1 + 40);
    long long v10 = v9;
    if (v9)
    {
      if (a2)
      {
        long long v11 = [v9 jsonRepresentation];
        long long v12 = @"maximumAllowedMapRegion";
      }
      else
      {
        long long v11 = [v9 dictionaryRepresentation];
        long long v12 = @"maximum_allowed_map_region";
      }
      [v4 setObject:v11 forKey:v12];
    }
    if ([*(id *)(a1 + 24) count])
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v14 = *(id *)(a1 + 24);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v32 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (a2) {
              [v19 jsonRepresentation];
            }
            else {
            v20 = [v19 dictionaryRepresentation];
            }
            [v13 addObject:v20];
          }
          uint64_t v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
        }
        while (v16);
      }

      if (a2) {
        v21 = @"displayMapRegion";
      }
      else {
        v21 = @"display_map_region";
      }
      [v4 setObject:v13 forKey:v21];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __46__GEOPDOfflineArea__dictionaryRepresentation___block_invoke;
        v29[3] = &unk_1E53D8860;
        id v26 = v25;
        id v30 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v29];
        id v27 = v26;

        v24 = v27;
      }
      [v4 setObject:v24 forKey:@"Unknown Fields"];
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
  return -[GEOPDOfflineArea _dictionaryRepresentation:]((uint64_t)self, 1);
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
        objc_super v6 = (int *)&readAll__recursiveTag_6767;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_6768;
      }
      GEOPDOfflineAreaReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEOPDOfflineAreaCallReadAllRecursiveWithoutSynchronized((id *)a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __46__GEOPDOfflineArea__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDOfflineAreaReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    long long v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDOfflineArea readAll:]((uint64_t)self, 0);
    if (self->_mapRegion) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_maximumAllowedMapRegion) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_displayMapRegions;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
      GEOPDOfflineAreaReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDOfflineArea readAll:]((uint64_t)self, 0);
  id v8 = [(GEOMapRegion *)self->_mapRegion copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(GEOMapRegion *)self->_maximumAllowedMapRegion copyWithZone:a3];
  long long v11 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_displayMapRegions;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        -[GEOPDOfflineArea addDisplayMapRegion:](v5, v16);

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDOfflineArea readAll:]((uint64_t)self, 1),
         -[GEOPDOfflineArea readAll:]((uint64_t)v4, 1),
         mapRegion = self->_mapRegion,
         !((unint64_t)mapRegion | v4[4]))
     || -[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
    && ((maximumAllowedMapRegion = self->_maximumAllowedMapRegion, !((unint64_t)maximumAllowedMapRegion | v4[5]))
     || -[GEOMapRegion isEqual:](maximumAllowedMapRegion, "isEqual:")))
  {
    displayMapRegions = self->_displayMapRegions;
    if ((unint64_t)displayMapRegions | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](displayMapRegions, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDOfflineArea readAll:]((uint64_t)self, 1);
  unint64_t v3 = [(GEOMapRegion *)self->_mapRegion hash];
  unint64_t v4 = [(GEOMapRegion *)self->_maximumAllowedMapRegion hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_displayMapRegions hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAllowedMapRegion, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_displayMapRegions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end