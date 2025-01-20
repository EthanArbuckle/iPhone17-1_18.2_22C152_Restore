@interface GEOTileSetVersion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTileSetVersion)init;
- (GEOTileSetVersion)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reserveAvailableTiles:(uint64_t)result;
- (uint64_t)_reserveGenericTiles:(uint64_t)result;
- (uint64_t)genericTileAtIndex:(uint64_t)result;
- (unint64_t)hash;
- (void)_readAvailableTiles;
- (void)_readGenericTiles;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOTileSetVersion

- (GEOTileSetVersion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTileSetVersion;
  v2 = [(GEOTileSetVersion *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTileSetVersion)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTileSetVersion;
  v3 = [(GEOTileSetVersion *)&v7 initWithData:a3];
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
  if (self)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)&self->_flags |= 8u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(unsigned char *)&self->_flags |= 0x20u;
    self->_availableTilesSpace = 0;
    self->_availableTilesCount = 0;
    free(self->_availableTiles);
    self->_availableTiles = 0;
    os_unfair_lock_lock_with_options();
    *(unsigned char *)&self->_flags |= 0x10u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(unsigned char *)&self->_flags |= 0x20u;
    self->_genericTilesSpace = 0;
    self->_genericTilesCount = 0;
    free(self->_genericTiles);
    self->_genericTiles = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEOTileSetVersion;
  [(GEOTileSetVersion *)&v3 dealloc];
}

- (void)_readAvailableTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 96) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetVersionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAvailableTiles_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (uint64_t)_reserveAvailableTiles:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 32);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 40);
    if (v5 >= v4) {
      return 1;
    }
    unint64_t v6 = v5 + a2;
    if (v5 + a2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        unint64_t v8 = v7;
        if (v7 >= v6) {
          break;
        }
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          unint64_t v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (v8 < a2) {
      return 0;
    }
LABEL_11:
    if (24 * v8 < v8) {
      return 0;
    }
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 24 * v8, 0x7B08A0EDuLL);
    if (result)
    {
      v2[5] = v8;
      v2[3] = result;
      bzero((void *)(result + 24 * v2[4]), 24 * (v8 - v2[4]));
      return 1;
    }
  }
  return result;
}

- (void)_readGenericTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(unsigned char *)(a1 + 96) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTileSetVersionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readGenericTiles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (uint64_t)_reserveGenericTiles:(uint64_t)result
{
  if (result)
  {
    v2 = (void *)result;
    unint64_t v3 = *(void *)(result + 56);
    unint64_t v4 = v3 + a2;
    if (v3 + a2 <= v3) {
      return 0;
    }
    unint64_t v5 = *(void *)(result + 64);
    if (v5 >= v4) {
      return 1;
    }
    unint64_t v6 = v5 + a2;
    if (v5 + a2)
    {
      unint64_t v7 = 1;
      while (1)
      {
        unint64_t v8 = v7;
        if (v7 >= v6) {
          break;
        }
        v7 *= 2;
        if ((v8 & 0x8000000000000000) != 0)
        {
          unint64_t v8 = -1;
          goto LABEL_11;
        }
      }
    }
    else
    {
      unint64_t v8 = 0;
    }
    if (v8 < a2) {
      return 0;
    }
LABEL_11:
    if (16 * v8 < v8) {
      return 0;
    }
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 48), 16 * v8, 0x4CB67AF0uLL);
    if (result)
    {
      v2[8] = v8;
      v2[6] = result;
      bzero((void *)(result + 16 * v2[7]), 16 * (v8 - v2[7]));
      return 1;
    }
  }
  return result;
}

- (uint64_t)genericTileAtIndex:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    -[GEOTileSetVersion _readGenericTiles](result);
    unint64_t v4 = *(void *)(v3 + 56);
    if (v4 <= a2)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v6 = *MEMORY[0x1E4F1C4A8];
      unint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a2, v4);
      unint64_t v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
      [v8 raise];
    }
    return *(void *)(*(void *)(v3 + 48) + 16 * a2);
  }
  return result;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTileSetVersion;
  unint64_t v4 = [(GEOTileSetVersion *)&v8 description];
  unint64_t v5 = [(GEOTileSetVersion *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTileSetVersion _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOTileSetVersion readAll:](a1, 1);
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    unint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
    [v3 setObject:v4 forKey:@"identifier"];

    if (*(void *)(a1 + 32))
    {
      unint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
      if (*(void *)(a1 + 32))
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        do
        {
          objc_super v8 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v6));
          [v5 addObject:v8];

          ++v7;
          v6 += 24;
        }
        while (v7 < *(void *)(a1 + 32));
      }
      [v3 setObject:v5 forKey:@"availableTiles"];
    }
    if ((*(unsigned char *)(a1 + 96) & 2) != 0)
    {
      v9 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
      [v3 setObject:v9 forKey:@"timeToLiveSeconds"];
    }
    if (*(void *)(a1 + 56))
    {
      v29 = v3;
      v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 56)];
      if (*(void *)(a1 + 56))
      {
        uint64_t v11 = 0;
        for (unint64_t i = 0; i < *(void *)(a1 + 56); ++i)
        {
          uint64_t v13 = *(void *)(a1 + 48);
          v14 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v15 = v13 + v11;
          char v16 = *(unsigned char *)(v13 + v11 + 12);
          if (v16)
          {
            v17 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v13 + v11)];
            [v14 setObject:v17 forKey:@"resourceIndex"];

            char v16 = *(unsigned char *)(v15 + 12);
            if ((v16 & 2) == 0)
            {
LABEL_14:
              if ((v16 & 4) != 0) {
                goto LABEL_18;
              }
              goto LABEL_24;
            }
          }
          else if ((*(unsigned char *)(v13 + v11 + 12) & 2) == 0)
          {
            goto LABEL_14;
          }
          v18 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v13 + v11 + 4)];
          [v14 setObject:v18 forKey:@"textureIndex"];

          if ((*(unsigned char *)(v15 + 12) & 4) != 0)
          {
LABEL_18:
            int v19 = *(_DWORD *)(v13 + v11 + 8);
            if (v19 == 1)
            {
              v20 = @"WATER";
            }
            else if (v19 == 2)
            {
              v20 = @"NO_TILE";
            }
            else
            {
              objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(unsigned int *)(v13 + v11 + 8));
              v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            [v14 setObject:v20 forKey:@"tileType"];
          }
LABEL_24:
          [v10 addObject:v14];

          v11 += 16;
        }
      }
      uint64_t v3 = v29;
      [v29 setObject:v10 forKey:@"genericTile"];
    }
    if (*(unsigned char *)(a1 + 96))
    {
      v21 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
      [v3 setObject:v21 forKey:@"supportedLanguagesVersion"];
    }
    v22 = *(void **)(a1 + 16);
    if (v22)
    {
      v23 = [v22 dictionaryRepresentation];
      v24 = v23;
      if (a2)
      {
        v25 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __47__GEOTileSetVersion__dictionaryRepresentation___block_invoke;
        v31[3] = &unk_1E53D8860;
        id v26 = v25;
        id v32 = v26;
        [v24 enumerateKeysAndObjectsUsingBlock:v31];
        id v27 = v26;

        v24 = v27;
      }
      [v3 setObject:v24 forKey:@"Unknown Fields"];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)jsonRepresentation
{
  return -[GEOTileSetVersion _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    unint64_t v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        uint64_t v6 = (int *)&readAll__recursiveTag_360_0;
      }
      else {
        uint64_t v6 = (int *)&readAll__nonRecursiveTag_361_0;
      }
      GEOTileSetVersionReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __47__GEOTileSetVersion__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
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

- (BOOL)readFrom:(id)a3
{
  return GEOTileSetVersionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v13 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v13];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTileSetVersion readAll:]((uint64_t)self, 0);
    PBDataWriterWriteUint32Field();
    if (self->_availableTilesCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_availableTilesCount);
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteUint32Field();
    }
    if (self->_genericTilesCount)
    {
      uint64_t v8 = 0;
      for (unint64_t i = 0; i < self->_genericTilesCount; ++i)
      {
        PBDataWriterPlaceMark();
        id v10 = &self->_genericTiles[v8];
        char var3 = (char)v10->var3;
        if ((var3 & 4) != 0)
        {
          PBDataWriterWriteInt32Field();
          char var3 = (char)v10->var3;
          if ((var3 & 2) != 0)
          {
LABEL_17:
            PBDataWriterWriteUint32Field();
            if ((*(unsigned char *)&v10->var3 & 1) == 0) {
              goto LABEL_14;
            }
LABEL_13:
            PBDataWriterWriteUint32Field();
            goto LABEL_14;
          }
        }
        else if ((*(unsigned char *)&v10->var3 & 2) != 0)
        {
          goto LABEL_17;
        }
        if (var3) {
          goto LABEL_13;
        }
LABEL_14:
        PBDataWriterRecallMark();
        ++v8;
      }
    }
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint32Field();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v6 = reader;
    objc_sync_enter(v6);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTileSetVersionReadAllFrom(v4, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v7 = (id)v4;
      objc_sync_exit(v6);

      goto LABEL_14;
    }
    objc_sync_exit(v6);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTileSetVersion readAll:]((uint64_t)self, 0);
  *(_DWORD *)(v4 + 84) = self->_identifier;
  unint64_t availableTilesCount = self->_availableTilesCount;
  if (availableTilesCount)
  {
    -[GEOTileSetVersion _reserveAvailableTiles:](v4, availableTilesCount);
    memcpy(*(void **)(v4 + 24), self->_availableTiles, 24 * self->_availableTilesCount);
    *(void *)(v4 + 32) = self->_availableTilesCount;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v4 + 92) = self->_timeToLiveSeconds;
    *(unsigned char *)(v4 + 96) |= 2u;
  }
  unint64_t genericTilesCount = self->_genericTilesCount;
  if (genericTilesCount)
  {
    -[GEOTileSetVersion _reserveGenericTiles:](v4, genericTilesCount);
    memcpy(*(void **)(v4 + 48), self->_genericTiles, 16 * self->_genericTilesCount);
    *(void *)(v4 + 56) = self->_genericTilesCount;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v4 + 88) = self->_supportedLanguagesVersion;
    *(unsigned char *)(v4 + 96) |= 1u;
  }
  id v10 = self->_unknownFields;
  id v7 = *(id *)(v4 + 16);
  *(void *)(v4 + 16) = v10;
LABEL_14:

  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_5;
  }
  -[GEOTileSetVersion readAll:]((uint64_t)self, 1);
  -[GEOTileSetVersion readAll:]((uint64_t)v4, 1);
  if (self->_identifier != *((_DWORD *)v4 + 21)) {
    goto LABEL_5;
  }
  unint64_t availableTilesCount = self->_availableTilesCount;
  if ((const void *)availableTilesCount != v4[4] || memcmp(self->_availableTiles, v4[3], 24 * availableTilesCount)) {
    goto LABEL_5;
  }
  char flags = (char)self->_flags;
  char v9 = *((unsigned char *)v4 + 96);
  if ((flags & 2) != 0)
  {
    if (((_BYTE)v4[12] & 2) == 0 || self->_timeToLiveSeconds != *((_DWORD *)v4 + 23)) {
      goto LABEL_5;
    }
  }
  else if (((_BYTE)v4[12] & 2) != 0)
  {
    goto LABEL_5;
  }
  unint64_t genericTilesCount = self->_genericTilesCount;
  if ((const void *)genericTilesCount == v4[7] && !memcmp(self->_genericTiles, v4[6], 16 * genericTilesCount))
  {
    BOOL v6 = (v9 & 1) == 0;
    if ((flags & 1) == 0) {
      goto LABEL_6;
    }
    if ((v9 & 1) != 0 && self->_supportedLanguagesVersion == *((_DWORD *)v4 + 22))
    {
      BOOL v6 = 1;
      goto LABEL_6;
    }
  }
LABEL_5:
  BOOL v6 = 0;
LABEL_6:

  return v6;
}

- (unint64_t)hash
{
  -[GEOTileSetVersion readAll:]((uint64_t)self, 1);
  unsigned int identifier = self->_identifier;
  uint64_t v4 = PBHashBytes();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_timeToLiveSeconds;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = PBHashBytes();
  if (*(unsigned char *)&self->_flags) {
    uint64_t v7 = 2654435761 * self->_supportedLanguagesVersion;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ (2654435761 * identifier) ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end