@interface GEOSearchAttribution
+ (BOOL)isValid:(id)a3;
+ (Class)attributionURLsType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSearchAttribution)init;
- (GEOSearchAttribution)initWithData:(id)a3;
- (GEOSearchAttribution)initWithDictionary:(id)a3;
- (GEOSearchAttribution)initWithJSON:(id)a3;
- (NSMutableArray)attributionURLs;
- (NSString)sourceIdentifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)attributionURLsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)attributionURLsCount;
- (unint64_t)hash;
- (unsigned)sourceVersion;
- (void)_addNoFlagsAttributionURLs:(uint64_t)a1;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readAttributionURLs;
- (void)addAttributionURLs:(id)a3;
- (void)clearAttributionURLs;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAttributionURLs:(id)a3;
- (void)setSourceIdentifier:(id)a3;
- (void)setSourceVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSearchAttribution

- (GEOSearchAttribution)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSearchAttribution;
  v2 = [(GEOSearchAttribution *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSearchAttribution)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSearchAttribution;
  v3 = [(GEOSearchAttribution *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)sourceIdentifier
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 4) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOSearchAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSourceIdentifier_tags);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  sourceIdentifier = self->_sourceIdentifier;

  return sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_sourceIdentifier, a3);
}

- (unsigned)sourceVersion
{
  return self->_sourceVersion;
}

- (void)setSourceVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_sourceVersion = a3;
}

- (void)_readAttributionURLs
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOSearchAttributionReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAttributionURLs_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)attributionURLs
{
  -[GEOSearchAttribution _readAttributionURLs]((uint64_t)self);
  attributionURLs = self->_attributionURLs;

  return attributionURLs;
}

- (void)setAttributionURLs:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  attributionURLs = self->_attributionURLs;
  self->_attributionURLs = v4;
}

- (void)clearAttributionURLs
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  attributionURLs = self->_attributionURLs;

  [(NSMutableArray *)attributionURLs removeAllObjects];
}

- (void)addAttributionURLs:(id)a3
{
  id v4 = a3;
  -[GEOSearchAttribution _readAttributionURLs]((uint64_t)self);
  -[GEOSearchAttribution _addNoFlagsAttributionURLs:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsAttributionURLs:(uint64_t)a1
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

- (unint64_t)attributionURLsCount
{
  -[GEOSearchAttribution _readAttributionURLs]((uint64_t)self);
  attributionURLs = self->_attributionURLs;

  return [(NSMutableArray *)attributionURLs count];
}

- (id)attributionURLsAtIndex:(unint64_t)a3
{
  -[GEOSearchAttribution _readAttributionURLs]((uint64_t)self);
  attributionURLs = self->_attributionURLs;

  return (id)[(NSMutableArray *)attributionURLs objectAtIndex:a3];
}

+ (Class)attributionURLsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttribution;
  id v4 = [(GEOSearchAttribution *)&v8 description];
  id v5 = [(GEOSearchAttribution *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSearchAttribution _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [(id)a1 sourceIdentifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"sourceIdentifier"];
    }

    objc_super v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
    [v4 setObject:v6 forKey:@"sourceVersion"];

    if (*(void *)(a1 + 24))
    {
      id v7 = [(id)a1 attributionURLs];
      [v4 setObject:v7 forKey:@"attributionURLs"];
    }
    objc_super v8 = *(void **)(a1 + 16);
    if (v8)
    {
      v9 = [v8 dictionaryRepresentation];
      v10 = v9;
      if (a2)
      {
        v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __50__GEOSearchAttribution__dictionaryRepresentation___block_invoke;
        v15[3] = &unk_1E53D8860;
        id v12 = v11;
        id v16 = v12;
        [v10 enumerateKeysAndObjectsUsingBlock:v15];
        id v13 = v12;

        v10 = v13;
      }
      [v4 setObject:v10 forKey:@"Unknown Fields"];
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
  return -[GEOSearchAttribution _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEOSearchAttribution__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSearchAttribution)initWithDictionary:(id)a3
{
  return (GEOSearchAttribution *)-[GEOSearchAttribution _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v4 = [v3 objectForKeyedSubscript:@"sourceIdentifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = (void *)[v4 copy];
        [a1 setSourceIdentifier:v5];
      }
      objc_super v6 = [v3 objectForKeyedSubscript:@"sourceVersion"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setSourceVersion:", objc_msgSend(v6, "unsignedIntValue"));
      }

      id v7 = [v3 objectForKeyedSubscript:@"attributionURLs"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v18 = 0u;
        long long v19 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v17;
          do
          {
            uint64_t v12 = 0;
            do
            {
              if (*(void *)v17 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v14 = objc_msgSend(v13, "copy", (void)v16);
                [a1 addAttributionURLs:v14];
              }
              ++v12;
            }
            while (v10 != v12);
            uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
          }
          while (v10);
        }
      }
    }
  }

  return a1;
}

- (GEOSearchAttribution)initWithJSON:(id)a3
{
  return (GEOSearchAttribution *)-[GEOSearchAttribution _initWithDictionary:isJSON:](self, a3);
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
      id v8 = (int *)&readAll__recursiveTag_3146;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_3147;
    }
    GEOSearchAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSearchAttributionIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSearchAttributionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
  {
    uint64_t v10 = self->_reader;
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
    [(GEOSearchAttribution *)self readAll:0];
    PBDataWriterWriteStringField();
    PBDataWriterWriteUint32Field();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_attributionURLs;
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
          PBDataWriterWriteStringField();
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
  [(GEOSearchAttribution *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v8 setSourceIdentifier:self->_sourceIdentifier];
  *((_DWORD *)v8 + 13) = self->_sourceVersion;
  if ([(GEOSearchAttribution *)self attributionURLsCount])
  {
    [v8 clearAttributionURLs];
    unint64_t v4 = [(GEOSearchAttribution *)self attributionURLsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOSearchAttribution *)self attributionURLsAtIndex:i];
        [v8 addAttributionURLs:v7];
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
      GEOSearchAttributionReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOSearchAttribution *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_sourceIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(_DWORD *)(v5 + 52) = self->_sourceVersion;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v10 = self->_attributionURLs;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "copyWithZone:", a3, (void)v16);
        [(id)v5 addAttributionURLs:v14];
      }
      uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOSearchAttribution *)self readAll:1],
         [v4 readAll:1],
         sourceIdentifier = self->_sourceIdentifier,
         !((unint64_t)sourceIdentifier | v4[4]))
     || -[NSString isEqual:](sourceIdentifier, "isEqual:"))
    && self->_sourceVersion == *((_DWORD *)v4 + 13))
  {
    attributionURLs = self->_attributionURLs;
    if ((unint64_t)attributionURLs | v4[3]) {
      char v7 = -[NSMutableArray isEqual:](attributionURLs, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  [(GEOSearchAttribution *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_sourceIdentifier hash];
  uint64_t v4 = 2654435761 * self->_sourceVersion;
  return v4 ^ v3 ^ [(NSMutableArray *)self->_attributionURLs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  if (*((void *)v4 + 4)) {
    -[GEOSearchAttribution setSourceIdentifier:](self, "setSourceIdentifier:");
  }
  self->_sourceVersion = *((_DWORD *)v4 + 13);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 3);
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
        -[GEOSearchAttribution addAttributionURLs:](self, "addAttributionURLs:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
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
      GEOSearchAttributionReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3151);
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
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 9u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOSearchAttribution *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_attributionURLs, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end