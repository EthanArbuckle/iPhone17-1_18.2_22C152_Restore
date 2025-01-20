@interface GEOWiFiQualityNetworkSearch
+ (BOOL)isValid:(id)a3;
+ (Class)essType;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasLocation;
- (BOOL)hasRadius;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocation)location;
- (GEOWiFiQualityNetworkSearch)init;
- (GEOWiFiQualityNetworkSearch)initWithData:(id)a3;
- (GEOWiFiQualityNetworkSearch)initWithDictionary:(id)a3;
- (GEOWiFiQualityNetworkSearch)initWithJSON:(id)a3;
- (NSMutableArray)ess;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)essAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)essCount;
- (unint64_t)hash;
- (unint64_t)radius;
- (void)_addNoFlagsEss:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readEss;
- (void)_readLocation;
- (void)addEss:(id)a3;
- (void)clearEss;
- (void)clearSensitiveFields:(unint64_t)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEss:(id)a3;
- (void)setHasRadius:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setRadius:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualityNetworkSearch

- (GEOWiFiQualityNetworkSearch)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualityNetworkSearch;
  v2 = [(GEOWiFiQualityNetworkSearch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualityNetworkSearch)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualityNetworkSearch;
  v3 = [(GEOWiFiQualityNetworkSearch *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEss
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
        GEOWiFiQualityNetworkSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEss_tags_435);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)ess
{
  -[GEOWiFiQualityNetworkSearch _readEss]((uint64_t)self);
  ess = self->_ess;

  return ess;
}

- (void)setEss:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  ess = self->_ess;
  self->_ess = v4;
}

- (void)clearEss
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  ess = self->_ess;

  [(NSMutableArray *)ess removeAllObjects];
}

- (void)addEss:(id)a3
{
  id v4 = a3;
  -[GEOWiFiQualityNetworkSearch _readEss]((uint64_t)self);
  -[GEOWiFiQualityNetworkSearch _addNoFlagsEss:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
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
  -[GEOWiFiQualityNetworkSearch _readEss]((uint64_t)self);
  ess = self->_ess;

  return [(NSMutableArray *)ess count];
}

- (id)essAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualityNetworkSearch _readEss]((uint64_t)self);
  ess = self->_ess;

  return (id)[(NSMutableArray *)ess objectAtIndex:a3];
}

+ (Class)essType
{
  return (Class)objc_opt_class();
}

- (void)_readLocation
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
        GEOWiFiQualityNetworkSearchReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocation_tags_436);
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
  -[GEOWiFiQualityNetworkSearch _readLocation]((uint64_t)self);
  location = self->_location;

  return location;
}

- (void)setLocation:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_location, a3);
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
  v8.super_class = (Class)GEOWiFiQualityNetworkSearch;
  id v4 = [(GEOWiFiQualityNetworkSearch *)&v8 description];
  id v5 = [(GEOWiFiQualityNetworkSearch *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualityNetworkSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 16) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v6 = *(id *)(a1 + 16);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v19 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = objc_msgSend(v11, "dictionaryRepresentation", (void)v18);
            }
            objc_msgSend(v5, "addObject:", v12, (void)v18);
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"ess"];
    }
    v13 = objc_msgSend((id)a1, "location", (void)v18);
    v14 = v13;
    if (v13)
    {
      if (a2) {
        [v13 jsonRepresentation];
      }
      else {
      v15 = [v13 dictionaryRepresentation];
      }
      [v4 setObject:v15 forKey:@"location"];
    }
    if (*(unsigned char *)(a1 + 52))
    {
      v16 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
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
  return -[GEOWiFiQualityNetworkSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiQualityNetworkSearch)initWithDictionary:(id)a3
{
  return (GEOWiFiQualityNetworkSearch *)-[GEOWiFiQualityNetworkSearch _initWithDictionary:isJSON:](self, a3, 0);
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
      id v6 = [v5 objectForKeyedSubscript:@"ess"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v22 = v5;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOWiFiESS alloc];
                if (a3) {
                  uint64_t v14 = [(GEOWiFiESS *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOWiFiESS *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addEss:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
          }
          while (v9);
        }

        id v5 = v22;
      }

      v16 = [v5 objectForKeyedSubscript:@"location"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOLocation alloc];
        if (a3) {
          uint64_t v18 = [(GEOLocation *)v17 initWithJSON:v16];
        }
        else {
          uint64_t v18 = [(GEOLocation *)v17 initWithDictionary:v16];
        }
        long long v19 = (void *)v18;
        [a1 setLocation:v18];
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

- (GEOWiFiQualityNetworkSearch)initWithJSON:(id)a3
{
  return (GEOWiFiQualityNetworkSearch *)-[GEOWiFiQualityNetworkSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_437;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_438;
    }
    GEOWiFiQualityNetworkSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiQualityNetworkSearchCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualityNetworkSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualityNetworkSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiQualityNetworkSearchIsDirty((uint64_t)self) & 1) == 0)
  {
    uint64_t v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiQualityNetworkSearch *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_ess;
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

    if (self->_location) {
      PBDataWriterWriteSubmessage();
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
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  -[GEOWiFiQualityNetworkSearch _readEss]((uint64_t)self);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = self->_ess;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (void)v11))
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  -[GEOWiFiQualityNetworkSearch _readLocation]((uint64_t)self);
  return [(GEOLocation *)self->_location hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOWiFiQualityNetworkSearch *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOWiFiQualityNetworkSearch *)self essCount])
  {
    [v8 clearEss];
    unint64_t v4 = [(GEOWiFiQualityNetworkSearch *)self essCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWiFiQualityNetworkSearch *)self essAtIndex:i];
        [v8 addEss:v7];
      }
    }
  }
  if (self->_location) {
    objc_msgSend(v8, "setLocation:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_radius;
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
      GEOWiFiQualityNetworkSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualityNetworkSearch *)self readAll:0];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = self->_ess;
  uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [(id)v5 addEss:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = [(GEOLocation *)self->_location copyWithZone:a3];
  long long v15 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v14;

  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_radius;
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
  [(GEOWiFiQualityNetworkSearch *)self readAll:1];
  [v4 readAll:1];
  ess = self->_ess;
  if ((unint64_t)ess | *((void *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](ess, "isEqual:")) {
      goto LABEL_10;
    }
  }
  location = self->_location;
  if ((unint64_t)location | *((void *)v4 + 3))
  {
    if (!-[GEOLocation isEqual:](location, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_radius == *((void *)v4 + 4))
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
  [(GEOWiFiQualityNetworkSearch *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_ess hash];
  unint64_t v4 = [(GEOLocation *)self->_location hash];
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
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOWiFiQualityNetworkSearch addEss:](self, "addEss:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  location = self->_location;
  uint64_t v11 = *((void *)v4 + 3);
  if (location)
  {
    if (v11) {
      -[GEOLocation mergeFrom:](location, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[GEOWiFiQualityNetworkSearch setLocation:](self, "setLocation:");
  }
  if (*((unsigned char *)v4 + 52))
  {
    self->_radius = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_ess, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end