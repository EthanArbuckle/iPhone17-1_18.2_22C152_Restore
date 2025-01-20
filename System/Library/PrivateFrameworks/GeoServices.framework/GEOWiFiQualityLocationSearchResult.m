@interface GEOWiFiQualityLocationSearchResult
+ (BOOL)isValid:(id)a3;
+ (Class)essType;
+ (Class)tileType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasStatus;
- (BOOL)hasTileKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOWiFiQualityLocationSearchResult)init;
- (GEOWiFiQualityLocationSearchResult)initWithData:(id)a3;
- (GEOWiFiQualityLocationSearchResult)initWithDictionary:(id)a3;
- (GEOWiFiQualityLocationSearchResult)initWithJSON:(id)a3;
- (NSMutableArray)ess;
- (NSMutableArray)tiles;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)essAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (id)statusAsString:(int)a3;
- (id)tileAtIndex:(unint64_t)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)essCount;
- (unint64_t)hash;
- (unint64_t)tileKey;
- (unint64_t)tilesCount;
- (void)_addNoFlagsEss:(uint64_t)a1;
- (void)_addNoFlagsTile:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readEss;
- (void)_readLocation;
- (void)_readTiles;
- (void)addEss:(id)a3;
- (void)addTile:(id)a3;
- (void)clearEss;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearTiles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEss:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setHasTileKey:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setStatus:(int)a3;
- (void)setTileKey:(unint64_t)a3;
- (void)setTiles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityLocationSearchResult

- (GEOWiFiQualityLocationSearchResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityLocationSearchResult;
  v2 = [(GEOWiFiQualityLocationSearchResult *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityLocationSearchResult)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityLocationSearchResult;
  v3 = [(GEOWiFiQualityLocationSearchResult *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readLocation
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_399);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOWiFiQualityLocationSearchResult _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (unint64_t)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_tileKey = a3;
}

- (void)setHasTileKey:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasTileKey
{
  return *(unsigned char *)&self->_flags & 1;
}

- (int)status
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E1FC8[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"OK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"NOT_FOUND"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readEss
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEss_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)ess
{
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  ess = self->_ess;

  return ess;
}

- (void)setEss:(id)a3
{
  int v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  ess = self->_ess;
  self->_ess = v4;
}

- (void)clearEss
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  ess = self->_ess;

  [(NSMutableArray *)ess removeAllObjects];
}

- (void)addEss:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  -[GEOWiFiQualityLocationSearchResult _addNoFlagsEss:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsEss:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id v4 = *(void **)(a1 + 16);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v5;

      id v4 = *(void **)(a1 + 16);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (unint64_t)essCount
{
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  ess = self->_ess;

  return [(NSMutableArray *)ess count];
}

- (id)essAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  ess = self->_ess;

  return (id)[(NSMutableArray *)ess objectAtIndex:a3];
}

+ (Class)essType
{
  return (Class)objc_opt_class();
}

- (void)_readTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchResultReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTiles_tags_400);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)tiles
{
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return tiles;
}

- (void)setTiles:(id)a3
{
  id v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  tiles = self->_tiles;
  self->_tiles = v4;
}

- (void)clearTiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
  tiles = self->_tiles;

  [(NSMutableArray *)tiles removeAllObjects];
}

- (void)addTile:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  -[GEOWiFiQualityLocationSearchResult _addNoFlagsTile:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsTile:(uint64_t)a1
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

- (unint64_t)tilesCount
{
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return [(NSMutableArray *)tiles count];
}

- (id)tileAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return (id)[(NSMutableArray *)tiles objectAtIndex:a3];
}

+ (Class)tileType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityLocationSearchResult;
  id v4 = [(GEOWiFiQualityLocationSearchResult *)&v8 description];
  id v5 = [(GEOWiFiQualityLocationSearchResult *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityLocationSearchResult _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 location];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      id v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"location"];
    }
    char v8 = *(unsigned char *)(a1 + 64);
    if (v8)
    {
      v9 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v9 forKey:@"tileKey"];

      char v8 = *(unsigned char *)(a1 + 64);
    }
    if ((v8 & 2) != 0)
    {
      uint64_t v10 = *(int *)(a1 + 60);
      if (v10 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 60));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E53E1FC8[v10];
      }
      [v4 setObject:v11 forKey:@"status"];
    }
    if ([*(id *)(a1 + 16) count])
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = *(id *)(a1 + 16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v34 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            if (a2) {
              [v18 jsonRepresentation];
            }
            else {
            v19 = [v18 dictionaryRepresentation];
            }
            [v12 addObject:v19];
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v15);
      }

      [v4 setObject:v12 forKey:@"ess"];
    }
    if ([*(id *)(a1 + 40) count])
    {
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v21 = *(id *)(a1 + 40);
      uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v23; ++j)
          {
            if (*(void *)v30 != v24) {
              objc_enumerationMutation(v21);
            }
            v26 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            if (a2) {
              [v26 jsonRepresentation];
            }
            else {
            v27 = [v26 dictionaryRepresentation];
            }
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v23);
      }

      [v4 setObject:v20 forKey:@"tile"];
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
  return -[GEOWiFiQualityLocationSearchResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiQualityLocationSearchResult)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityLocationSearchResult *)-[GEOWiFiQualityLocationSearchResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_51;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_51;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"location"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [GEOLocation alloc];
    if (a3) {
      uint64_t v8 = [(GEOLocation *)v7 initWithJSON:v6];
    }
    else {
      uint64_t v8 = [(GEOLocation *)v7 initWithDictionary:v6];
    }
    v9 = (void *)v8;
    [a1 setLocation:v8];
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"tileKey"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTileKey:", objc_msgSend(v10, "unsignedLongLongValue"));
  }

  v11 = [v5 objectForKeyedSubscript:@"status"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
    if ([v12 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v13 = 0;
    }
    else if ([v12 isEqualToString:@"OK"])
    {
      uint64_t v13 = 1;
    }
    else if ([v12 isEqualToString:@"NOT_FOUND"])
    {
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 0;
    }

    goto LABEL_21;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v11 intValue];
LABEL_21:
    [a1 setStatus:v13];
  }

  uint64_t v14 = [v5 objectForKeyedSubscript:@"ess"];
  objc_opt_class();
  id v35 = v5;
  if (objc_opt_isKindOfClass())
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v41 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v21 = [GEOWiFiESS alloc];
            if (a3) {
              uint64_t v22 = [(GEOWiFiESS *)v21 initWithJSON:v20];
            }
            else {
              uint64_t v22 = [(GEOWiFiESS *)v21 initWithDictionary:v20];
            }
            uint64_t v23 = (void *)v22;
            [a1 addEss:v22];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }
      while (v17);
    }

    id v5 = v35;
  }

  uint64_t v24 = [v5 objectForKeyedSubscript:@"tile"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v25 = v24;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v37;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void *)(*((void *)&v36 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v31 = [GEOWiFiQualitySearchResultTile alloc];
            if (a3) {
              uint64_t v32 = [(GEOWiFiQualitySearchResultTile *)v31 initWithJSON:v30];
            }
            else {
              uint64_t v32 = [(GEOWiFiQualitySearchResultTile *)v31 initWithDictionary:v30];
            }
            long long v33 = (void *)v32;
            [a1 addTile:v32];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v27);
    }

    id v5 = v35;
  }

LABEL_51:
  return a1;
}

- (GEOWiFiQualityLocationSearchResult)initWithJSON:(id)a3
{
  return (GEOWiFiQualityLocationSearchResult *)-[GEOWiFiQualityLocationSearchResult _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_408;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_409;
    }
    GEOWiFiQualityLocationSearchResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiQualityLocationSearchResultCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityLocationSearchResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityLocationSearchResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiQualityLocationSearchResultIsDirty((uint64_t)self) & 1) == 0)
  {
    id v15 = self->_reader;
    objc_sync_enter(v15);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v16 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v16];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiQualityLocationSearchResult *)self readAll:0];
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    char flags = (char)self->_flags;
    if (flags)
    {
      PBDataWriterWriteUint64Field();
      char flags = (char)self->_flags;
    }
    if ((flags & 2) != 0) {
      PBDataWriterWriteInt32Field();
    }
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = self->_ess;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v7);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v11 = self->_tiles;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v11);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  -[GEOWiFiQualityLocationSearchResult _readEss]((uint64_t)self);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = self->_ess;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([*(id *)(*((void *)&v20 + 1) + 8 * v9) hasGreenTeaWithValue:v3]) {
        goto LABEL_20;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  -[GEOWiFiQualityLocationSearchResult _readLocation]((uint64_t)self);
  if (![(GEOLocation *)self->_location hasGreenTeaWithValue:v3])
  {
    -[GEOWiFiQualityLocationSearchResult _readTiles]((uint64_t)self);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = self->_tiles;
    uint64_t v11 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (!v11)
    {
LABEL_19:
      BOOL v10 = 0;
LABEL_21:

      return v10;
    }
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
LABEL_13:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v17 != v13) {
        objc_enumerationMutation(v5);
      }
      if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v14), "hasGreenTeaWithValue:", v3, (void)v16)) {
        break;
      }
      if (v12 == ++v14)
      {
        uint64_t v12 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v12) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
LABEL_20:
    BOOL v10 = 1;
    goto LABEL_21;
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  uint64_t v13 = (id *)a3;
  [(GEOWiFiQualityLocationSearchResult *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 12) = self->_readerMarkPos;
  *((_DWORD *)v13 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_location) {
    objc_msgSend(v13, "setLocation:");
  }
  char flags = (char)self->_flags;
  if (flags)
  {
    v13[4] = self->_tileKey;
    *((unsigned char *)v13 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 15) = self->_status;
    *((unsigned char *)v13 + 64) |= 2u;
  }
  if ([(GEOWiFiQualityLocationSearchResult *)self essCount])
  {
    [v13 clearEss];
    unint64_t v5 = [(GEOWiFiQualityLocationSearchResult *)self essCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(GEOWiFiQualityLocationSearchResult *)self essAtIndex:i];
        [v13 addEss:v8];
      }
    }
  }
  if ([(GEOWiFiQualityLocationSearchResult *)self tilesCount])
  {
    [v13 clearTiles];
    unint64_t v9 = [(GEOWiFiQualityLocationSearchResult *)self tilesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(GEOWiFiQualityLocationSearchResult *)self tileAtIndex:j];
        [v13 addTile:v12];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiQualityLocationSearchResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualityLocationSearchResult *)self readAll:0];
  id v9 = [(GEOLocation *)self->_location copyWithZone:a3];
  unint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  char flags = (char)self->_flags;
  if (flags)
  {
    *(void *)(v5 + 32) = self->_tileKey;
    *(unsigned char *)(v5 + 64) |= 1u;
    char flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_status;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = self->_ess;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v12);
        }
        long long v16 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addEss:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = self->_tiles;
  uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v8);
        }
        long long v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (void)v22);
        [(id)v5 addTile:v20];
      }
      uint64_t v17 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  [(GEOWiFiQualityLocationSearchResult *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 3))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_tileKey != *((void *)v4 + 4)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_status != *((_DWORD *)v4 + 15)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    goto LABEL_18;
  }
  ess = self->_ess;
  if ((unint64_t)ess | *((void *)v4 + 2) && !-[NSMutableArray isEqual:](ess, "isEqual:")) {
    goto LABEL_18;
  }
  tiles = self->_tiles;
  if ((unint64_t)tiles | *((void *)v4 + 5)) {
    char v8 = -[NSMutableArray isEqual:](tiles, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  [(GEOWiFiQualityLocationSearchResult *)self readAll:1];
  unint64_t v3 = [(GEOLocation *)self->_location hash];
  if (*(unsigned char *)&self->_flags)
  {
    unint64_t v4 = 2654435761u * self->_tileKey;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    goto LABEL_6;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_status;
LABEL_6:
  uint64_t v6 = v4 ^ v3 ^ v5 ^ [(NSMutableArray *)self->_ess hash];
  return v6 ^ [(NSMutableArray *)self->_tiles hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 3);
  if (location)
  {
    if (v6) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOWiFiQualityLocationSearchResult setLocation:](self, "setLocation:");
  }
  char v7 = *((unsigned char *)v4 + 64);
  if (v7)
  {
    self->_tileKey = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
    char v7 = *((unsigned char *)v4 + 64);
  }
  if ((v7 & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_flags |= 2u;
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = *((id *)v4 + 2);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v8);
        }
        [(GEOWiFiQualityLocationSearchResult *)self addEss:*(void *)(*((void *)&v22 + 1) + 8 * i)];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v10);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = *((id *)v4 + 5);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[GEOWiFiQualityLocationSearchResult addTile:](self, "addTile:", *(void *)(*((void *)&v18 + 1) + 8 * j), (void)v18);
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ess, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end