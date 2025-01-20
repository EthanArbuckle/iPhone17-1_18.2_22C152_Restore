@interface GEOPublisherAttributionSource
+ (BOOL)isValid:(id)a3;
+ (Class)localizedAttributionType;
- (BOOL)hasAppAdamID;
- (BOOL)hasWebsiteURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPublisherAttributionSource)init;
- (GEOPublisherAttributionSource)initWithData:(id)a3;
- (GEOPublisherAttributionSource)initWithDictionary:(id)a3;
- (GEOPublisherAttributionSource)initWithJSON:(id)a3;
- (NSMutableArray)localizedAttributions;
- (NSString)appAdamID;
- (NSString)websiteURL;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)localizedAttributionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)localizedAttributionsCount;
- (void)_addNoFlagsLocalizedAttribution:(uint64_t)a1;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readAppAdamID;
- (void)_readLocalizedAttributions;
- (void)_readWebsiteURL;
- (void)addLocalizedAttribution:(id)a3;
- (void)clearLocalizedAttributions;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAppAdamID:(id)a3;
- (void)setLocalizedAttributions:(id)a3;
- (void)setWebsiteURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPublisherAttributionSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_websiteURL, 0);
  objc_storeStrong((id *)&self->_localizedAttributions, 0);
  objc_storeStrong((id *)&self->_appAdamID, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPublisherAttributionSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPublisherAttributionSource;
  v2 = [(GEOPublisherAttributionSource *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)_addNoFlagsLocalizedAttribution:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    id v7 = v3;
    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      objc_super v6 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    [v4 addObject:v7];
    id v3 = v7;
  }
}

- (NSString)websiteURL
{
  -[GEOPublisherAttributionSource _readWebsiteURL]((uint64_t)self);
  websiteURL = self->_websiteURL;

  return websiteURL;
}

- (NSMutableArray)localizedAttributions
{
  -[GEOPublisherAttributionSource _readLocalizedAttributions]((uint64_t)self);
  localizedAttributions = self->_localizedAttributions;

  return localizedAttributions;
}

- (NSString)appAdamID
{
  -[GEOPublisherAttributionSource _readAppAdamID]((uint64_t)self);
  appAdamID = self->_appAdamID;

  return appAdamID;
}

- (void)_readWebsiteURL
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
        GEOPublisherAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readWebsiteURL_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readLocalizedAttributions
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
        GEOPublisherAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readLocalizedAttributions_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (void)_readAppAdamID
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
        GEOPublisherAttributionSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppAdamID_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (GEOPublisherAttributionSource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPublisherAttributionSource;
  id v3 = [(GEOPublisherAttributionSource *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (void)setLocalizedAttributions:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizedAttributions = self->_localizedAttributions;
  self->_localizedAttributions = v4;
}

- (void)clearLocalizedAttributions
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
  localizedAttributions = self->_localizedAttributions;

  [(NSMutableArray *)localizedAttributions removeAllObjects];
}

- (void)addLocalizedAttribution:(id)a3
{
  id v4 = a3;
  -[GEOPublisherAttributionSource _readLocalizedAttributions]((uint64_t)self);
  -[GEOPublisherAttributionSource _addNoFlagsLocalizedAttribution:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 0x10u;
}

- (unint64_t)localizedAttributionsCount
{
  -[GEOPublisherAttributionSource _readLocalizedAttributions]((uint64_t)self);
  localizedAttributions = self->_localizedAttributions;

  return [(NSMutableArray *)localizedAttributions count];
}

- (id)localizedAttributionAtIndex:(unint64_t)a3
{
  -[GEOPublisherAttributionSource _readLocalizedAttributions]((uint64_t)self);
  localizedAttributions = self->_localizedAttributions;

  return (id)[(NSMutableArray *)localizedAttributions objectAtIndex:a3];
}

+ (Class)localizedAttributionType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppAdamID
{
  return self->_appAdamID != 0;
}

- (void)setAppAdamID:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_appAdamID, a3);
}

- (BOOL)hasWebsiteURL
{
  return self->_websiteURL != 0;
}

- (void)setWebsiteURL:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_websiteURL, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPublisherAttributionSource;
  id v4 = [(GEOPublisherAttributionSource *)&v8 description];
  id v5 = [(GEOPublisherAttributionSource *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPublisherAttributionSource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if ([*(id *)(a1 + 32) count])
    {
      id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v6 = *(id *)(a1 + 32);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v25 != v9) {
              objc_enumerationMutation(v6);
            }
            v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
            if (a2) {
              [v11 jsonRepresentation];
            }
            else {
            v12 = [v11 dictionaryRepresentation];
            }
            [v5 addObject:v12];
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v8);
      }

      [v4 setObject:v5 forKey:@"localizedAttribution"];
    }
    v13 = [(id)a1 appAdamID];
    if (v13) {
      [v4 setObject:v13 forKey:@"appAdamID"];
    }

    v14 = [(id)a1 websiteURL];
    if (v14) {
      [v4 setObject:v14 forKey:@"websiteURL"];
    }

    v15 = *(void **)(a1 + 16);
    if (v15)
    {
      v16 = [v15 dictionaryRepresentation];
      v17 = v16;
      if (a2)
      {
        v18 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v16, "count"));
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __59__GEOPublisherAttributionSource__dictionaryRepresentation___block_invoke;
        v22[3] = &unk_1E53D8860;
        id v19 = v18;
        id v23 = v19;
        [v17 enumerateKeysAndObjectsUsingBlock:v22];
        id v20 = v19;

        v17 = v20;
      }
      [v4 setObject:v17 forKey:@"Unknown Fields"];
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
  return -[GEOPublisherAttributionSource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __59__GEOPublisherAttributionSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    uint64_t v8 = [v5 base64EncodedStringWithOptions:0];
    uint64_t v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    uint64_t v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (GEOPublisherAttributionSource)initWithDictionary:(id)a3
{
  return (GEOPublisherAttributionSource *)-[GEOPublisherAttributionSource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      id v6 = [v5 objectForKeyedSubscript:@"localizedAttribution"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v21 = v6;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v13 = [GEOLocalizedPublisherAttribution alloc];
                if (a3) {
                  uint64_t v14 = [(GEOLocalizedPublisherAttribution *)v13 initWithJSON:v12];
                }
                else {
                  uint64_t v14 = [(GEOLocalizedPublisherAttribution *)v13 initWithDictionary:v12];
                }
                v15 = (void *)v14;
                [a1 addLocalizedAttribution:v14];
              }
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          }
          while (v9);
        }

        id v6 = v21;
      }

      v16 = [v5 objectForKeyedSubscript:@"appAdamID"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = (void *)[v16 copy];
        [a1 setAppAdamID:v17];
      }
      v18 = [v5 objectForKeyedSubscript:@"websiteURL"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v19 = (void *)[v18 copy];
        [a1 setWebsiteURL:v19];
      }
    }
  }

  return a1;
}

- (GEOPublisherAttributionSource)initWithJSON:(id)a3
{
  return (GEOPublisherAttributionSource *)-[GEOPublisherAttributionSource _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_312_0;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_313_0;
    }
    GEOPublisherAttributionSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEOPublisherAttributionSourceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPublisherAttributionSourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPublisherAttributionSourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    [(GEOPublisherAttributionSource *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_localizedAttributions;
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

    if (self->_appAdamID) {
      PBDataWriterWriteStringField();
    }
    if (self->_websiteURL) {
      PBDataWriterWriteStringField();
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = (id *)a3;
  [(GEOPublisherAttributionSource *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 12) = self->_readerMarkPos;
  *((_DWORD *)v9 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ([(GEOPublisherAttributionSource *)self localizedAttributionsCount])
  {
    [v9 clearLocalizedAttributions];
    unint64_t v4 = [(GEOPublisherAttributionSource *)self localizedAttributionsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEOPublisherAttributionSource *)self localizedAttributionAtIndex:i];
        [v9 addLocalizedAttribution:v7];
      }
    }
  }
  if (self->_appAdamID) {
    objc_msgSend(v9, "setAppAdamID:");
  }
  uint64_t v8 = v9;
  if (self->_websiteURL)
  {
    objc_msgSend(v9, "setWebsiteURL:");
    uint64_t v8 = v9;
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
      GEOPublisherAttributionSourceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOPublisherAttributionSource *)self readAll:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = self->_localizedAttributions;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (void)v18);
        [(id)v5 addLocalizedAttribution:v12];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_appAdamID copyWithZone:a3];
  long long v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  uint64_t v15 = [(NSString *)self->_websiteURL copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPublisherAttributionSource *)self readAll:1],
         [v4 readAll:1],
         localizedAttributions = self->_localizedAttributions,
         !((unint64_t)localizedAttributions | v4[4]))
     || -[NSMutableArray isEqual:](localizedAttributions, "isEqual:"))
    && ((appAdamID = self->_appAdamID, !((unint64_t)appAdamID | v4[3]))
     || -[NSString isEqual:](appAdamID, "isEqual:")))
  {
    websiteURL = self->_websiteURL;
    if ((unint64_t)websiteURL | v4[5]) {
      char v8 = -[NSString isEqual:](websiteURL, "isEqual:");
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
  [(GEOPublisherAttributionSource *)self readAll:1];
  uint64_t v3 = [(NSMutableArray *)self->_localizedAttributions hash];
  NSUInteger v4 = [(NSString *)self->_appAdamID hash] ^ v3;
  return v4 ^ [(NSString *)self->_websiteURL hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4[4];
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
        -[GEOPublisherAttributionSource addLocalizedAttribution:](self, "addLocalizedAttribution:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[3]) {
    -[GEOPublisherAttributionSource setAppAdamID:](self, "setAppAdamID:");
  }
  if (v4[5]) {
    -[GEOPublisherAttributionSource setWebsiteURL:](self, "setWebsiteURL:");
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
      GEOPublisherAttributionSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_317_0);
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
    [(GEOPublisherAttributionSource *)self readAll:0];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = self->_localizedAttributions;
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

@end