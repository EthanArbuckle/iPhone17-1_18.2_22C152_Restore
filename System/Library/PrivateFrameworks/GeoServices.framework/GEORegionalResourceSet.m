@interface GEORegionalResourceSet
+ (BOOL)isValid:(id)a3;
+ (Class)resourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORegionalResourceSet)init;
- (GEORegionalResourceSet)initWithData:(id)a3;
- (GEORegionalResourceSet)initWithDictionary:(id)a3;
- (GEORegionalResourceSet)initWithJSON:(id)a3;
- (GEOTileSetRegion)regionAtIndex:(SEL)a3;
- (GEOTileSetRegion)regions;
- (NSMutableArray)resources;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)resourceAtIndex:(unint64_t)a3;
- (uint64_t)_reserveRegions:(uint64_t)a1;
- (unint64_t)hash;
- (unint64_t)regionsCount;
- (unint64_t)resourcesCount;
- (void)_addNoFlagsResource:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readRegions;
- (void)_readResources;
- (void)addRegion:(GEOTileSetRegion *)a3;
- (void)addResource:(id)a3;
- (void)clearRegions;
- (void)clearResources;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4;
- (void)setResources:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORegionalResourceSet

- (GEOTileSetRegion)regionAtIndex:(SEL)a3
{
  -[GEORegionalResourceSet _readRegions]((uint64_t)self);
  unint64_t regionsCount = self->_regionsCount;
  if (regionsCount <= a4)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C4A8];
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%tu) is out of range (%tu)", a4, regionsCount);
    v12 = [v9 exceptionWithName:v10 reason:v11 userInfo:0];
    [v12 raise];
  }
  v13 = &self->_regions[a4];
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v13->var0;
  *(void *)&retstr->var4 = *(void *)&v13->var4;
  return result;
}

- (unint64_t)regionsCount
{
  return self->_regionsCount;
}

- (void)_readRegions
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readRegions_tags_2);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)resources
{
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  resources = self->_resources;

  return resources;
}

- (void)_readResources
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORegionalResourceSetReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResources_tags_1264);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (GEORegionalResourceSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORegionalResourceSet;
  v2 = [(GEORegionalResourceSet *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (uint64_t)_reserveRegions:(uint64_t)a1
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    unint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = v4 + a2;
    if (v4 + a2 <= v4) {
      return 0;
    }
    unint64_t v6 = *(void *)(a1 + 40);
    if (v6 >= v5) {
      return 1;
    }
    unint64_t v7 = v6 + a2;
    if (v6 + a2)
    {
      unint64_t v8 = 1;
      while (1)
      {
        unint64_t v9 = v8;
        if (v8 >= v7) {
          break;
        }
        v8 *= 2;
        if ((v9 & 0x8000000000000000) != 0)
        {
          unint64_t v9 = -1;
          goto LABEL_12;
        }
      }
    }
    else
    {
      unint64_t v9 = 0;
    }
    if (v9 < a2) {
      return 0;
    }
LABEL_12:
    if (24 * v9 < v9) {
      return 0;
    }
    uint64_t result = (uint64_t)malloc_type_realloc(*(void **)(a1 + 24), 24 * v9, 0x5518D065uLL);
    if (result)
    {
      *(void *)(a1 + 40) = v9;
      *(void *)(a1 + 24) = result;
      bzero((void *)(result + 24 * *(void *)(a1 + 32)), 24 * (v9 - *(void *)(a1 + 32)));
      return 1;
    }
  }
  return result;
}

- (void)_addNoFlagsResource:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    unint64_t v4 = *(void **)(a1 + 48);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      unint64_t v6 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v5;

      unint64_t v4 = *(void **)(a1 + 48);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      unint64_t v8 = (int *)&readAll__recursiveTag_1268;
    }
    else {
      unint64_t v8 = (int *)&readAll__nonRecursiveTag_1269;
    }
    GEORegionalResourceSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORegionalResourceSetCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEORegionalResourceSet)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORegionalResourceSet;
  BOOL v3 = [(GEORegionalResourceSet *)&v7 initWithData:a3];
  unint64_t v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  [(GEORegionalResourceSet *)self clearRegions];
  v3.receiver = self;
  v3.super_class = (Class)GEORegionalResourceSet;
  [(GEORegionalResourceSet *)&v3 dealloc];
}

- (GEOTileSetRegion)regions
{
  return self->_regions;
}

- (void)clearRegions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  self->_regionsSpace = 0;
  self->_unint64_t regionsCount = 0;
  free(self->_regions);
  self->_regions = 0;
}

- (void)addRegion:(GEOTileSetRegion *)a3
{
  -[GEORegionalResourceSet _readRegions]((uint64_t)self);
  GEOTileSetRegion v5 = *a3;
  if (self && -[GEORegionalResourceSet _reserveRegions:]((uint64_t)self, 1uLL)) {
    self->_regions[self->_regionsCount++] = v5;
  }
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)setRegions:(GEOTileSetRegion *)a3 count:(unint64_t)a4
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  [(GEORegionalResourceSet *)self clearRegions];
  if (-[GEORegionalResourceSet _reserveRegions:]((uint64_t)self, a4))
  {
    memcpy(self->_regions, a3, 24 * a4);
    self->_unint64_t regionsCount = a4;
  }
}

- (void)setResources:(id)a3
{
  unint64_t v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  resources = self->_resources;
  self->_resources = v4;
}

- (void)clearResources
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  resources = self->_resources;

  [(NSMutableArray *)resources removeAllObjects];
}

- (void)addResource:(id)a3
{
  id v4 = a3;
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  -[GEORegionalResourceSet _addNoFlagsResource:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (unint64_t)resourcesCount
{
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  resources = self->_resources;

  return [(NSMutableArray *)resources count];
}

- (id)resourceAtIndex:(unint64_t)a3
{
  -[GEORegionalResourceSet _readResources]((uint64_t)self);
  resources = self->_resources;

  return (id)[(NSMutableArray *)resources objectAtIndex:a3];
}

+ (Class)resourceType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORegionalResourceSet;
  id v4 = [(GEORegionalResourceSet *)&v8 description];
  GEOTileSetRegion v5 = [(GEORegionalResourceSet *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORegionalResourceSet _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(void *)(a1 + 32))
    {
      GEOTileSetRegion v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 32)];
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
      [v4 setObject:v5 forKey:@"region"];
    }
    if ([*(id *)(a1 + 48) count])
    {
      unint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = *(id *)(a1 + 48);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v27;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v27 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = [v15 dictionaryRepresentation];
            }
            [v9 addObject:v16];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"resource"];
    }
    v17 = *(void **)(a1 + 16);
    if (v17)
    {
      v18 = [v17 dictionaryRepresentation];
      v19 = v18;
      if (a2)
      {
        v20 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __52__GEORegionalResourceSet__dictionaryRepresentation___block_invoke;
        v24[3] = &unk_1E53D8860;
        id v21 = v20;
        id v25 = v21;
        [v19 enumerateKeysAndObjectsUsingBlock:v24];
        id v22 = v21;

        v19 = v22;
      }
      [v4 setObject:v19 forKey:@"Unknown Fields"];
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
  return -[GEORegionalResourceSet _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEORegionalResourceSet__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  unint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    objc_super v8 = [v5 base64EncodedStringWithOptions:0];
    unint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    objc_super v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEORegionalResourceSet)initWithDictionary:(id)a3
{
  return (GEORegionalResourceSet *)-[GEORegionalResourceSet _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      uint64_t v6 = [v5 objectForKeyedSubscript:@"region"];
      objc_opt_class();
      id v24 = v5;
      if (objc_opt_isKindOfClass())
      {
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v34 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v31 = 0uLL;
                uint64_t v32 = 0;
                _GEOTileSetRegionFromDictionaryRepresentation(v12, &v31);
                long long v29 = v31;
                uint64_t v30 = v32;
                [a1 addRegion:&v29];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }
          while (v9);
        }

        id v5 = v24;
      }

      uint64_t v13 = [v5 objectForKeyedSubscript:@"resource"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v37 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v26;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * j);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v20 = [GEOResource alloc];
                if (a3) {
                  uint64_t v21 = [(GEOResource *)v20 initWithJSON:v19];
                }
                else {
                  uint64_t v21 = [(GEOResource *)v20 initWithDictionary:v19];
                }
                id v22 = (void *)v21;
                [a1 addResource:v21];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v37 count:16];
          }
          while (v16);
        }

        id v5 = v24;
      }
    }
  }

  return a1;
}

- (GEORegionalResourceSet)initWithJSON:(id)a3
{
  return (GEORegionalResourceSet *)-[GEORegionalResourceSet _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEORegionalResourceSetIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORegionalResourceSetReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORegionalResourceSetIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v12 = self->_reader;
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
    [(GEORegionalResourceSet *)self readAll:0];
    if (self->_regionsCount)
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      do
      {
        uint64_t v18 = 0;
        PBDataWriterPlaceMark();
        GEOTileSetRegionWriteTo();
        PBDataWriterRecallMark();
        ++v7;
        v6 += 24;
      }
      while (v7 < self->_regionsCount);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = self->_resources;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v9);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = (id *)a3;
  [(GEORegionalResourceSet *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 14) = self->_readerMarkPos;
  *((_DWORD *)v4 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEORegionalResourceSet *)self regionsCount])
  {
    [v4 clearRegions];
    unint64_t v5 = [(GEORegionalResourceSet *)self regionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        [(GEORegionalResourceSet *)self regionAtIndex:i];
        [v4 addRegion:v12];
      }
    }
  }
  if ([(GEORegionalResourceSet *)self resourcesCount])
  {
    [v4 clearResources];
    unint64_t v8 = [(GEORegionalResourceSet *)self resourcesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(GEORegionalResourceSet *)self resourceAtIndex:j];
        [v4 addResource:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    unint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORegionalResourceSetReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORegionalResourceSet *)self readAll:0];
  unint64_t regionsCount = self->_regionsCount;
  if (regionsCount)
  {
    -[GEORegionalResourceSet _reserveRegions:](v5, regionsCount);
    memcpy(*(void **)(v5 + 24), self->_regions, 24 * self->_regionsCount);
    *(void *)(v5 + 32) = self->_regionsCount;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v9 = self->_resources;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v5 addResource:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEORegionalResourceSet *)self readAll:1],
        [v4 readAll:1],
        unint64_t regionsCount = self->_regionsCount,
        regionsCount == *((void *)v4 + 4))
    && !memcmp(self->_regions, *((const void **)v4 + 3), 24 * regionsCount))
  {
    resources = self->_resources;
    if ((unint64_t)resources | *((void *)v4 + 6)) {
      char v6 = -[NSMutableArray isEqual:](resources, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  [(GEORegionalResourceSet *)self readAll:1];
  uint64_t v3 = PBHashBytes();
  return [(NSMutableArray *)self->_resources hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (id *)a3;
  [v4 readAll:0];
  uint64_t v5 = [v4 regionsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (v4) {
        [v4 regionAtIndex:i];
      }
      else {
        memset(v17, 0, sizeof(v17));
      }
      [(GEORegionalResourceSet *)self addRegion:v17];
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4[6];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[GEORegionalResourceSet addResource:](self, "addResource:", *(void *)(*((void *)&v13 + 1) + 8 * j), (void)v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEORegionalResourceSetReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1273);
      objc_sync_exit(v5);
    }
  }
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;

  return unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEORegionalResourceSet *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_resources;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (void)v12);
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end