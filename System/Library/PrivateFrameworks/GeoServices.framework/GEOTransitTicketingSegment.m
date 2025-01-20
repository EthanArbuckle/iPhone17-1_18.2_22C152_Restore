@interface GEOTransitTicketingSegment
+ (BOOL)isValid:(id)a3;
+ (Class)pathType;
- (BOOL)hasSegmentName;
- (BOOL)hasTicketingUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOTransitTicketingSegment)init;
- (GEOTransitTicketingSegment)initWithData:(id)a3;
- (GEOTransitTicketingSegment)initWithDictionary:(id)a3;
- (GEOTransitTicketingSegment)initWithJSON:(id)a3;
- (NSMutableArray)paths;
- (NSString)segmentName;
- (NSString)ticketingUrl;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)pathAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pathsCount;
- (void)_addNoFlagsPath:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readPaths;
- (void)_readSegmentName;
- (void)_readTicketingUrl;
- (void)addPath:(id)a3;
- (void)clearPaths;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setPaths:(id)a3;
- (void)setSegmentName:(id)a3;
- (void)setTicketingUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitTicketingSegment

- (GEOTransitTicketingSegment)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitTicketingSegment;
  v2 = [(GEOTransitTicketingSegment *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitTicketingSegment)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitTicketingSegment;
  v3 = [(GEOTransitTicketingSegment *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTicketingUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitTicketingSegmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTicketingUrl_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTicketingUrl
{
  return self->_ticketingUrl != 0;
}

- (NSString)ticketingUrl
{
  -[GEOTransitTicketingSegment _readTicketingUrl]((uint64_t)self);
  ticketingUrl = self->_ticketingUrl;

  return ticketingUrl;
}

- (void)setTicketingUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_ticketingUrl, a3);
}

- (void)_readSegmentName
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
        GEOTransitTicketingSegmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSegmentName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSegmentName
{
  return self->_segmentName != 0;
}

- (NSString)segmentName
{
  -[GEOTransitTicketingSegment _readSegmentName]((uint64_t)self);
  segmentName = self->_segmentName;

  return segmentName;
}

- (void)setSegmentName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_segmentName, a3);
}

- (void)_readPaths
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitTicketingSegmentReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPaths_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (NSMutableArray)paths
{
  -[GEOTransitTicketingSegment _readPaths]((uint64_t)self);
  paths = self->_paths;

  return paths;
}

- (void)setPaths:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  paths = self->_paths;
  self->_paths = v4;
}

- (void)clearPaths
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  paths = self->_paths;

  [(NSMutableArray *)paths removeAllObjects];
}

- (void)addPath:(id)a3
{
  id v4 = a3;
  -[GEOTransitTicketingSegment _readPaths]((uint64_t)self);
  -[GEOTransitTicketingSegment _addNoFlagsPath:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsPath:(uint64_t)a1
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

- (unint64_t)pathsCount
{
  -[GEOTransitTicketingSegment _readPaths]((uint64_t)self);
  paths = self->_paths;

  return [(NSMutableArray *)paths count];
}

- (id)pathAtIndex:(unint64_t)a3
{
  -[GEOTransitTicketingSegment _readPaths]((uint64_t)self);
  paths = self->_paths;

  return (id)[(NSMutableArray *)paths objectAtIndex:a3];
}

+ (Class)pathType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitTicketingSegment;
  id v4 = [(GEOTransitTicketingSegment *)&v8 description];
  id v5 = [(GEOTransitTicketingSegment *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitTicketingSegment _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 ticketingUrl];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"ticketingUrl";
      }
      else {
        objc_super v6 = @"ticketing_url";
      }
      [v4 setObject:v5 forKey:v6];
    }

    id v7 = [(id)a1 segmentName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"segmentName";
      }
      else {
        objc_super v8 = @"segment_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if ([*(id *)(a1 + 24) count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v10 = *(id *)(a1 + 24);
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

      [v4 setObject:v9 forKey:@"path"];
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
        v24[2] = __56__GEOTransitTicketingSegment__dictionaryRepresentation___block_invoke;
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
  return -[GEOTransitTicketingSegment _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEOTransitTicketingSegment__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = *(void **)(a1 + 32);
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

- (GEOTransitTicketingSegment)initWithDictionary:(id)a3
{
  return (GEOTransitTicketingSegment *)-[GEOTransitTicketingSegment _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"ticketingUrl";
      }
      else {
        objc_super v6 = @"ticketing_url";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setTicketingUrl:v8];
      }
      if (a3) {
        v9 = @"segmentName";
      }
      else {
        v9 = @"segment_name";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v10 copy];
        [a1 setSegmentName:v11];
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:@"path"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        v23 = v12;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v25 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v19 = [GEOTransitPath alloc];
                if (a3) {
                  uint64_t v20 = [(GEOTransitPath *)v19 initWithJSON:v18];
                }
                else {
                  uint64_t v20 = [(GEOTransitPath *)v19 initWithDictionary:v18];
                }
                id v21 = (void *)v20;
                [a1 addPath:v20];
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v15);
        }

        uint64_t v12 = v23;
      }
    }
  }

  return a1;
}

- (GEOTransitTicketingSegment)initWithJSON:(id)a3
{
  return (GEOTransitTicketingSegment *)-[GEOTransitTicketingSegment _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_2137;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_2138;
    }
    GEOTransitTicketingSegmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOTransitTicketingSegmentCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitTicketingSegmentIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitTicketingSegmentReadAllFrom((uint64_t)self, a3, 0);
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
    uint64_t v11 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v4 writeData:v11];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitTicketingSegment *)self readAll:0];
    if (self->_ticketingUrl) {
      PBDataWriterWriteStringField();
    }
    if (self->_segmentName) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_paths;
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

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEOTransitTicketingSegment *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 12) = self->_readerMarkPos;
  *((_DWORD *)v8 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_ticketingUrl) {
    objc_msgSend(v8, "setTicketingUrl:");
  }
  if (self->_segmentName) {
    objc_msgSend(v8, "setSegmentName:");
  }
  if ([(GEOTransitTicketingSegment *)self pathsCount])
  {
    [v8 clearPaths];
    unint64_t v4 = [(GEOTransitTicketingSegment *)self pathsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOTransitTicketingSegment *)self pathAtIndex:i];
        [v8 addPath:v7];
      }
    }
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
      GEOTransitTicketingSegmentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTransitTicketingSegment *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_ticketingUrl copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_segmentName copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_paths;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addPath:v16];
      }
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitTicketingSegment *)self readAll:1],
         [v4 readAll:1],
         ticketingUrl = self->_ticketingUrl,
         !((unint64_t)ticketingUrl | v4[5]))
     || -[NSString isEqual:](ticketingUrl, "isEqual:"))
    && ((segmentName = self->_segmentName, !((unint64_t)segmentName | v4[4]))
     || -[NSString isEqual:](segmentName, "isEqual:")))
  {
    paths = self->_paths;
    if ((unint64_t)paths | v4[3]) {
      char v8 = -[NSMutableArray isEqual:](paths, "isEqual:");
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
  [(GEOTransitTicketingSegment *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_ticketingUrl hash];
  NSUInteger v4 = [(NSString *)self->_segmentName hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_paths hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[5]) {
    -[GEOTransitTicketingSegment setTicketingUrl:](self, "setTicketingUrl:");
  }
  if (v4[4]) {
    -[GEOTransitTicketingSegment setSegmentName:](self, "setSegmentName:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[3];
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
        -[GEOTransitTicketingSegment addPath:](self, "addPath:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
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
      id v5 = reader;
      objc_sync_enter(v5);
      GEOTransitTicketingSegmentReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2142);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTransitTicketingSegment *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_paths;
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
  objc_storeStrong((id *)&self->_ticketingUrl, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end