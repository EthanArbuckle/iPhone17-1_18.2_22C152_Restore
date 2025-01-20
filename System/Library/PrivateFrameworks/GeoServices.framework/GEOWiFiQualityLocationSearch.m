@interface GEOWiFiQualityLocationSearch
+ (BOOL)isValid:(id)a3;
+ (Class)tilesType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOWiFiQualityLocationSearch)init;
- (GEOWiFiQualityLocationSearch)initWithData:(id)a3;
- (GEOWiFiQualityLocationSearch)initWithDictionary:(id)a3;
- (GEOWiFiQualityLocationSearch)initWithJSON:(id)a3;
- (NSMutableArray)tiles;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)tilesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)radius;
- (unint64_t)tilesCount;
- (void)_addNoFlagsTiles:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readLocation;
- (void)_readTiles;
- (void)addTiles:(id)a3;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)clearTiles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setRadius:(unint64_t)a3;
- (void)setTiles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityLocationSearch

- (GEOWiFiQualityLocationSearch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityLocationSearch;
  v2 = [(GEOWiFiQualityLocationSearch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityLocationSearch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityLocationSearch;
  v3 = [(GEOWiFiQualityLocationSearch *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_357);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasLocation
{
  return self->_location != 0;
}

- (GEOLocation)location
{
  -[GEOWiFiQualityLocationSearch _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readTiles
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiQualityLocationSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTiles_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)tiles
{
  -[GEOWiFiQualityLocationSearch _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return tiles;
}

- (void)setTiles:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  tiles = self->_tiles;
  self->_tiles = v4;
}

- (void)clearTiles
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  tiles = self->_tiles;

  [(NSMutableArray *)tiles removeAllObjects];
}

- (void)addTiles:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityLocationSearch _readTiles]((uint64_t)self);
  -[GEOWiFiQualityLocationSearch _addNoFlagsTiles:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsTiles:(uint64_t)a1
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

- (unint64_t)tilesCount
{
  -[GEOWiFiQualityLocationSearch _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return [(NSMutableArray *)tiles count];
}

- (id)tilesAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityLocationSearch _readTiles]((uint64_t)self);
  tiles = self->_tiles;

  return (id)[(NSMutableArray *)tiles objectAtIndex:a3];
}

+ (Class)tilesType
{
  return (Class)objc_opt_class();
}

- (unint64_t)radius
{
  return self->_radius;
}

- (void)setRadius:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_radius = a3;
}

- (void)setHasRadius:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasRadius
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualityLocationSearch;
  id v4 = [(GEOWiFiQualityLocationSearch *)&v8 description];
  id v5 = [(GEOWiFiQualityLocationSearch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityLocationSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
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
    if ([*(id *)(a1 + 32) count])
    {
      objc_super v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v9 = *(id *)(a1 + 32);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v14 jsonRepresentation];
            }
            else {
            v15 = objc_msgSend(v14, "dictionaryRepresentation", (void)v18);
            }
            objc_msgSend(v8, "addObject:", v15, (void)v18);
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      [v4 setObject:v8 forKey:@"tiles"];
    }
    if (*(unsigned char *)(a1 + 52))
    {
      v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
      [v4 setObject:v16 forKey:@"radius"];
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
  return -[GEOWiFiQualityLocationSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiQualityLocationSearch)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityLocationSearch *)-[GEOWiFiQualityLocationSearch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
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
        id v9 = (void *)v8;
        [a1 setLocation:v8];
      }
      uint64_t v10 = [v5 objectForKeyedSubscript:@"tiles"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v5;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v17 = [GEOWiFiQualitySearchTile alloc];
                if (a3) {
                  uint64_t v18 = [(GEOWiFiQualitySearchTile *)v17 initWithJSON:v16];
                }
                else {
                  uint64_t v18 = [(GEOWiFiQualitySearchTile *)v17 initWithDictionary:v16];
                }
                long long v19 = (void *)v18;
                [a1 addTiles:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v13);
        }

        id v5 = v22;
      }

      long long v20 = [v5 objectForKeyedSubscript:@"radius"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRadius:", objc_msgSend(v20, "unsignedLongLongValue"));
      }
    }
  }

  return a1;
}

- (GEOWiFiQualityLocationSearch)initWithJSON:(id)a3
{
  return (GEOWiFiQualityLocationSearch *)-[GEOWiFiQualityLocationSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_366;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_367;
    }
    GEOWiFiQualityLocationSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiQualityLocationSearchCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityLocationSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityLocationSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiQualityLocationSearchIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiQualityLocationSearch *)self readAll:0];
    if (self->_location) {
      PBDataWriterWriteSubmessage();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_tiles;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
        }
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOWiFiQualityLocationSearch _readLocation]((uint64_t)self);
  location = self->_location;

  return [(GEOLocation *)location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOWiFiQualityLocationSearch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_location) {
    objc_msgSend(v8, "setLocation:");
  }
  if ([(GEOWiFiQualityLocationSearch *)self tilesCount])
  {
    [v8 clearTiles];
    unint64_t v4 = [(GEOWiFiQualityLocationSearch *)self tilesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWiFiQualityLocationSearch *)self tilesAtIndex:i];
        [v8 addTiles:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    v8[3] = self->_radius;
    *((unsigned char *)v8 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 8) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOWiFiQualityLocationSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualityLocationSearch *)self readAll:0];
  id v9 = [(GEOLocation *)self->_location copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v9;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v11 = self->_tiles;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v11);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addTiles:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 24) = self->_radius;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOWiFiQualityLocationSearch *)self readAll:1];
  [v4 readAll:1];
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 2))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_10;
    }
  }
  tiles = self->_tiles;
  if ((unint64_t)tiles | *((void *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](tiles, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_radius == *((void *)v4 + 3))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  [(GEOWiFiQualityLocationSearch *)self readAll:1];
  unint64_t v3 = [(GEOLocation *)self->_location hash];
  uint64_t v4 = [(NSMutableArray *)self->_tiles hash];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v5 = 2654435761u * self->_radius;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  location = self->_location;
  uint64_t v6 = *((void *)v4 + 2);
  if (location)
  {
    if (v6) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[GEOWiFiQualityLocationSearch setLocation:](self, "setLocation:");
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[GEOWiFiQualityLocationSearch addTiles:](self, "addTiles:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if (*((unsigned char *)v4 + 52))
  {
    self->_radius = *((void *)v4 + 3);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end