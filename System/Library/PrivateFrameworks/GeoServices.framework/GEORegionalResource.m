@interface GEORegionalResource
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORegionalResource)init;
- (GEORegionalResource)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (uint64_t)_reserveTileRanges:(uint64_t)result;
- (unint64_t)hash;
- (void)_addNoFlagsAttribution:(uint64_t)a1;
- (void)_addNoFlagsIcon:(uint64_t)a1;
- (void)_addNoFlagsIconChecksum:(uint64_t)a1;
- (void)_readIconChecksums;
- (void)_readIcons;
- (void)addAttribution:(uint64_t)a1;
- (void)addIcon:(uint64_t)a1;
- (void)addIconChecksum:(uint64_t)a1;
- (void)dealloc;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEORegionalResource

- (GEORegionalResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResource;
  v2 = [(GEORegionalResource *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORegionalResource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResource;
  v3 = [(GEORegionalResource *)&v7 initWithData:a3];
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
    *(_WORD *)&self->_flags |= 0x10u;
    os_unfair_lock_unlock(&self->_readerLock);
    *(_WORD *)&self->_flags |= 0x100u;
    self->_tileRangesSpace = 0;
    self->_tileRangesCount = 0;
    free(self->_tileRanges);
    self->_tileRanges = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)GEORegionalResource;
  [(GEORegionalResource *)&v3 dealloc];
}

- (void)_readIcons
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x80) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEORegionalResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcons_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)addIcon:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEORegionalResource _readIcons](a1);
    -[GEORegionalResource _addNoFlagsIcon:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x80u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x100u;
  }
}

- (void)_addNoFlagsIcon:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 64);
      *(void *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)addAttribution:(uint64_t)a1
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
        GEORegionalResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributions_tags);
        objc_sync_exit(v5);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    -[GEORegionalResource _addNoFlagsAttribution:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x100u;
  }
}

- (void)_addNoFlagsAttribution:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)_readIconChecksums
{
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 96) & 0x40) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      id v3 = v2;
      objc_sync_enter(v3);
      GEORegionalResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIconChecksums_tags);
      objc_sync_exit(v3);
    }
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
}

- (void)addIconChecksum:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    -[GEORegionalResource _readIconChecksums](a1);
    -[GEORegionalResource _addNoFlagsIconChecksum:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x40u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_WORD *)(a1 + 96) |= 0x100u;
  }
}

- (void)_addNoFlagsIconChecksum:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (uint64_t)_reserveTileRanges:(uint64_t)result
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
    result = (uint64_t)malloc_type_realloc(*(void **)(result + 24), 24 * v8, 0xDBB1BA69uLL);
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

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORegionalResource;
  unint64_t v4 = [(GEORegionalResource *)&v8 description];
  unint64_t v5 = [(GEORegionalResource *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    unint64_t v4 = 0;
    goto LABEL_31;
  }
  -[GEORegionalResource readAll:](a1, 1);
  unint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 v5 = *(_WORD *)(a1 + 96);
  if ((v5 & 1) == 0)
  {
    if ((v5 & 2) == 0) {
      goto LABEL_4;
    }
LABEL_35:
    v29 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 88)];
    [v4 setObject:v29 forKey:@"y"];

    if ((*(_WORD *)(a1 + 96) & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v28 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 84)];
  [v4 setObject:v28 forKey:@"x"];

  __int16 v5 = *(_WORD *)(a1 + 96);
  if ((v5 & 2) != 0) {
    goto LABEL_35;
  }
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    unint64_t v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 92)];
    [v4 setObject:v6 forKey:@"z"];
  }
LABEL_6:
  if (*(void *)(a1 + 64))
  {
    -[GEORegionalResource _readIcons](a1);
    id v7 = *(id *)(a1 + 64);
    [v4 setObject:v7 forKey:@"icon"];
  }
  if ([*(id *)(a1 + 48) count])
  {
    objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v33 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (a2) {
            [v14 jsonRepresentation];
          }
          else {
          v15 = [v14 dictionaryRepresentation];
          }
          [v8 addObject:v15];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v11);
    }

    [v4 setObject:v8 forKey:@"attribution"];
  }
  if (*(void *)(a1 + 56))
  {
    -[GEORegionalResource _readIconChecksums](a1);
    id v16 = *(id *)(a1 + 56);
    [v4 setObject:v16 forKey:@"iconChecksum"];
  }
  if (*(void *)(a1 + 32))
  {
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
    if (*(void *)(a1 + 32))
    {
      uint64_t v18 = 0;
      unint64_t v19 = 0;
      do
      {
        v20 = _GEOTileSetRegionDictionaryRepresentation((unsigned int *)(*(void *)(a1 + 24) + v18));
        [v17 addObject:v20];

        ++v19;
        v18 += 24;
      }
      while (v19 < *(void *)(a1 + 32));
    }
    [v4 setObject:v17 forKey:@"tileRange"];
  }
  v21 = *(void **)(a1 + 16);
  if (v21)
  {
    v22 = [v21 dictionaryRepresentation];
    v23 = v22;
    if (a2)
    {
      v24 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __49__GEORegionalResource__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E53D8860;
      id v25 = v24;
      id v31 = v25;
      [v23 enumerateKeysAndObjectsUsingBlock:v30];
      id v26 = v25;

      v23 = v26;
    }
    [v4 setObject:v23 forKey:@"Unknown Fields"];
  }
LABEL_31:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORegionalResource _dictionaryRepresentation:]((uint64_t)self, 1);
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
        unint64_t v6 = (int *)&readAll__recursiveTag_518;
      }
      else {
        unint64_t v6 = (int *)&readAll__nonRecursiveTag_519;
      }
      GEORegionalResourceReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2) {
      _GEORegionalResourceCallReadAllRecursiveWithoutSynchronized(a1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __49__GEORegionalResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEORegionalResourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLocuint64_t k = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1F0) == 0))
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v22 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v22];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORegionalResource readAll:]((uint64_t)self, 0);
    __int16 flags = (__int16)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      __int16 flags = (__int16)self->_flags;
    }
    if ((flags & 4) != 0) {
      PBDataWriterWriteUint32Field();
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = self->_icons;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v8);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = self->_attributions;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v12);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v15 = self->_iconChecksums;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v15);
          }
          PBDataWriterWriteStringField();
        }
        uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v16);
    }

    if (self->_tileRangesCount)
    {
      uint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v20;
        v19 += 24;
      }
      while (v20 < self->_tileRangesCount);
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v4];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
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
      GEORegionalResourceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_33;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORegionalResource readAll:]((uint64_t)self, 0);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((flags & 2) == 0) {
      goto LABEL_7;
    }
LABEL_35:
    *(_DWORD *)(v5 + 88) = self->_y;
    *(_WORD *)(v5 + 96) |= 2u;
    if ((*(_WORD *)&self->_flags & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 84) = self->_x;
  *(_WORD *)(v5 + 96) |= 1u;
  __int16 flags = (__int16)self->_flags;
  if ((flags & 2) != 0) {
    goto LABEL_35;
  }
LABEL_7:
  if ((flags & 4) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 92) = self->_z;
    *(_WORD *)(v5 + 96) |= 4u;
  }
LABEL_9:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v10 = self->_icons;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v37 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = (void *)[*(id *)(*((void *)&v36 + 1) + 8 * i) copyWithZone:a3];
        -[GEORegionalResource addIcon:](v5, v14);
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v11);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v15 = self->_attributions;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v15);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * j) copyWithZone:a3];
        -[GEORegionalResource addAttribution:](v5, v19);
      }
      uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v16);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  unint64_t v20 = self->_iconChecksums;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * k), "copyWithZone:", a3, (void)v28);
        -[GEORegionalResource addIconChecksum:](v5, v24);
      }
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v21);
  }

  unint64_t tileRangesCount = self->_tileRangesCount;
  if (tileRangesCount)
  {
    -[GEORegionalResource _reserveTileRanges:](v5, tileRangesCount);
    memcpy(*(void **)(v5 + 24), self->_tileRanges, 24 * self->_tileRangesCount);
    *(void *)(v5 + 32) = self->_tileRangesCount;
  }
  long long v26 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v26;
LABEL_33:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (const void **)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_25;
  }
  -[GEORegionalResource readAll:]((uint64_t)self, 1);
  -[GEORegionalResource readAll:]((uint64_t)v4, 1);
  __int16 flags = (__int16)self->_flags;
  __int16 v6 = *((_WORD *)v4 + 48);
  if (flags)
  {
    if ((v6 & 1) == 0 || self->_x != *((_DWORD *)v4 + 21)) {
      goto LABEL_25;
    }
  }
  else if (v6)
  {
LABEL_25:
    BOOL v11 = 0;
    goto LABEL_26;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_y != *((_DWORD *)v4 + 22)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_25;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_z != *((_DWORD *)v4 + 23)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  icons = self->_icons;
  if ((unint64_t)icons | (unint64_t)v4[8] && !-[NSMutableArray isEqual:](icons, "isEqual:")) {
    goto LABEL_25;
  }
  attributions = self->_attributions;
  if ((unint64_t)attributions | (unint64_t)v4[6])
  {
    if (!-[NSMutableArray isEqual:](attributions, "isEqual:")) {
      goto LABEL_25;
    }
  }
  iconChecksums = self->_iconChecksums;
  if ((unint64_t)iconChecksums | (unint64_t)v4[7])
  {
    if (!-[NSMutableArray isEqual:](iconChecksums, "isEqual:")) {
      goto LABEL_25;
    }
  }
  unint64_t tileRangesCount = self->_tileRangesCount;
  if ((const void *)tileRangesCount != v4[4]) {
    goto LABEL_25;
  }
  BOOL v11 = memcmp(self->_tileRanges, v4[3], 24 * tileRangesCount) == 0;
LABEL_26:

  return v11;
}

- (unint64_t)hash
{
  -[GEORegionalResource readAll:]((uint64_t)self, 1);
  __int16 flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
    uint64_t v4 = 0;
    if ((flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v5 = 0;
    if ((flags & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = 2654435761 * self->_x;
  if ((flags & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_y;
  if ((flags & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_z;
LABEL_8:
  uint64_t v7 = v5 ^ v4 ^ v6 ^ [(NSMutableArray *)self->_icons hash];
  uint64_t v8 = [(NSMutableArray *)self->_attributions hash];
  uint64_t v9 = v7 ^ v8 ^ [(NSMutableArray *)self->_iconChecksums hash];
  return v9 ^ PBHashBytes();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_iconChecksums, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end