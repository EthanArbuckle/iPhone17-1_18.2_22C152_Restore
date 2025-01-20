@interface GEOWiFiQualitySearchResultTile
+ (BOOL)isValid:(id)a3;
+ (Class)essType;
- (BOOL)hasEtag;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasTileKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWiFiQualitySearchResultTile)init;
- (GEOWiFiQualitySearchResultTile)initWithData:(id)a3;
- (GEOWiFiQualitySearchResultTile)initWithDictionary:(id)a3;
- (GEOWiFiQualitySearchResultTile)initWithJSON:(id)a3;
- (NSMutableArray)ess;
- (NSString)etag;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)essAtIndex:(unint64_t)a3;
- (id)jsonRepresentation;
- (unint64_t)essCount;
- (unint64_t)hash;
- (unint64_t)tileKey;
- (void)_addNoFlagsEss:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readEss;
- (void)_readEtag;
- (void)addEss:(id)a3;
- (void)clearEss;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEss:(id)a3;
- (void)setEtag:(id)a3;
- (void)setHasTileKey:(BOOL)a3;
- (void)setTileKey:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWiFiQualitySearchResultTile

- (GEOWiFiQualitySearchResultTile)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiQualitySearchResultTile;
  v2 = [(GEOWiFiQualitySearchResultTile *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiQualitySearchResultTile)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiQualitySearchResultTile;
  v3 = [(GEOWiFiQualitySearchResultTile *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)tileKey
{
  return self->_tileKey;
}

- (void)setTileKey:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  self->_tileKey = a3;
}

- (void)setHasTileKey:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 8;
}

- (BOOL)hasTileKey
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readEtag
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
        GEOWiFiQualitySearchResultTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtag_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (NSString)etag
{
  -[GEOWiFiQualitySearchResultTile _readEtag]((uint64_t)self);
  etag = self->_etag;

  return etag;
}

- (void)setEtag:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_etag, a3);
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
        GEOWiFiQualitySearchResultTileReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEss_tags_494);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)ess
{
  -[GEOWiFiQualitySearchResultTile _readEss]((uint64_t)self);
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
  -[GEOWiFiQualitySearchResultTile _readEss]((uint64_t)self);
  -[GEOWiFiQualitySearchResultTile _addNoFlagsEss:]((uint64_t)self, v4);

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
  -[GEOWiFiQualitySearchResultTile _readEss]((uint64_t)self);
  ess = self->_ess;

  return [(NSMutableArray *)ess count];
}

- (id)essAtIndex:(unint64_t)a3
{
  -[GEOWiFiQualitySearchResultTile _readEss]((uint64_t)self);
  ess = self->_ess;

  return (id)[(NSMutableArray *)ess objectAtIndex:a3];
}

+ (Class)essType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWiFiQualitySearchResultTile;
  id v4 = [(GEOWiFiQualitySearchResultTile *)&v8 description];
  id v5 = [(GEOWiFiQualitySearchResultTile *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiQualitySearchResultTile _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 52))
    {
      id v5 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
      [v4 setObject:v5 forKey:@"tileKey"];
    }
    objc_super v6 = [(id)a1 etag];
    if (v6) {
      [v4 setObject:v6 forKey:@"etag"];
    }

    if ([*(id *)(a1 + 16) count])
    {
      id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = *(id *)(a1 + 16);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v17 != v11) {
              objc_enumerationMutation(v8);
            }
            v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (a2) {
              [v13 jsonRepresentation];
            }
            else {
            v14 = objc_msgSend(v13, "dictionaryRepresentation", (void)v16);
            }
            objc_msgSend(v7, "addObject:", v14, (void)v16);
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }

      [v4 setObject:v7 forKey:@"ess"];
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
  return -[GEOWiFiQualitySearchResultTile _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiQualitySearchResultTile)initWithDictionary:(id)a3
{
  return (GEOWiFiQualitySearchResultTile *)-[GEOWiFiQualitySearchResultTile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"tileKey"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setTileKey:", objc_msgSend(v6, "unsignedLongLongValue"));
      }

      id v7 = [v5 objectForKeyedSubscript:@"etag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = (void *)[v7 copy];
        [a1 setEtag:v8];
      }
      uint64_t v9 = [v5 objectForKeyedSubscript:@"ess"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v20 = v9;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v22 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                long long v16 = [GEOWiFiESS alloc];
                if (a3) {
                  uint64_t v17 = [(GEOWiFiESS *)v16 initWithJSON:v15];
                }
                else {
                  uint64_t v17 = [(GEOWiFiESS *)v16 initWithDictionary:v15];
                }
                long long v18 = (void *)v17;
                [a1 addEss:v17];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v12);
        }

        uint64_t v9 = v20;
      }
    }
  }

  return a1;
}

- (GEOWiFiQualitySearchResultTile)initWithJSON:(id)a3
{
  return (GEOWiFiQualitySearchResultTile *)-[GEOWiFiQualitySearchResultTile _initWithDictionary:isJSON:](self, a3, 1);
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
      id v8 = (int *)&readAll__recursiveTag_498_0;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_499_0;
    }
    GEOWiFiQualitySearchResultTileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOWiFiQualitySearchResultTileCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiQualitySearchResultTileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiQualitySearchResultTileReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOWiFiQualitySearchResultTileIsDirty((uint64_t)self) & 1) == 0)
  {
    id v10 = self->_reader;
    objc_sync_enter(v10);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOWiFiQualitySearchResultTile *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteUint64Field();
    }
    if (self->_etag) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_ess;
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
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  -[GEOWiFiQualitySearchResultTile _readEss]((uint64_t)self);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_ess;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOWiFiQualitySearchResultTile *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    v8[4] = self->_tileKey;
    *((unsigned char *)v8 + 52) |= 1u;
  }
  if (self->_etag) {
    objc_msgSend(v8, "setEtag:");
  }
  if ([(GEOWiFiQualitySearchResultTile *)self essCount])
  {
    [v8 clearEss];
    unint64_t v4 = [(GEOWiFiQualitySearchResultTile *)self essCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOWiFiQualitySearchResultTile *)self essAtIndex:i];
        [v8 addEss:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
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
      GEOWiFiQualitySearchResultTileReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      uint64_t v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOWiFiQualitySearchResultTile *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(void *)(v5 + 32) = self->_tileKey;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_etag copyWithZone:a3];
  BOOL v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_ess;
  uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addEss:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOWiFiQualitySearchResultTile *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_tileKey != *((void *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 3) && !-[NSString isEqual:](etag, "isEqual:")) {
    goto LABEL_11;
  }
  ess = self->_ess;
  if ((unint64_t)ess | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](ess, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOWiFiQualitySearchResultTile *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    unint64_t v3 = 2654435761u * self->_tileKey;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_etag hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_ess hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((unsigned char *)v4 + 52))
  {
    self->_tileKey = *((void *)v4 + 4);
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v4 + 3)) {
    -[GEOWiFiQualitySearchResultTile setEtag:](self, "setEtag:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[GEOWiFiQualitySearchResultTile addEss:](self, "addEss:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_ess, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end