@interface GEORPCurrentEnvironmentManifestURLs
+ (BOOL)isValid:(id)a3;
+ (Class)urlType;
- (BOOL)hasEnvironmentDisplayName;
- (BOOL)hasEnvironmentReleaseName;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCurrentEnvironmentManifestURLs)init;
- (GEORPCurrentEnvironmentManifestURLs)initWithData:(id)a3;
- (GEORPCurrentEnvironmentManifestURLs)initWithDictionary:(id)a3;
- (GEORPCurrentEnvironmentManifestURLs)initWithJSON:(id)a3;
- (NSMutableArray)urls;
- (NSString)environmentDisplayName;
- (NSString)environmentReleaseName;
- (id)_dictionaryRepresentation:(id *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)urlAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)urlsCount;
- (void)_addNoFlagsUrl:(uint64_t)a1;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readEnvironmentDisplayName;
- (void)_readEnvironmentReleaseName;
- (void)_readUrls;
- (void)addUrl:(id)a3;
- (void)clearUrls;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEnvironmentDisplayName:(id)a3;
- (void)setEnvironmentReleaseName:(id)a3;
- (void)setUrls:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCurrentEnvironmentManifestURLs

- (GEORPCurrentEnvironmentManifestURLs)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCurrentEnvironmentManifestURLs;
  v2 = [(GEORPCurrentEnvironmentManifestURLs *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCurrentEnvironmentManifestURLs)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCurrentEnvironmentManifestURLs;
  v3 = [(GEORPCurrentEnvironmentManifestURLs *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readEnvironmentDisplayName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCurrentEnvironmentManifestURLsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnvironmentDisplayName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEnvironmentDisplayName
{
  return self->_environmentDisplayName != 0;
}

- (NSString)environmentDisplayName
{
  -[GEORPCurrentEnvironmentManifestURLs _readEnvironmentDisplayName]((uint64_t)self);
  environmentDisplayName = self->_environmentDisplayName;

  return environmentDisplayName;
}

- (void)setEnvironmentDisplayName:(id)a3
{
  *(unsigned char *)&self->_flags |= 9u;
  objc_storeStrong((id *)&self->_environmentDisplayName, a3);
}

- (void)_readEnvironmentReleaseName
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
        GEORPCurrentEnvironmentManifestURLsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnvironmentReleaseName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasEnvironmentReleaseName
{
  return self->_environmentReleaseName != 0;
}

- (NSString)environmentReleaseName
{
  -[GEORPCurrentEnvironmentManifestURLs _readEnvironmentReleaseName]((uint64_t)self);
  environmentReleaseName = self->_environmentReleaseName;

  return environmentReleaseName;
}

- (void)setEnvironmentReleaseName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_environmentReleaseName, a3);
}

- (void)_readUrls
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
        GEORPCurrentEnvironmentManifestURLsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrls_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)urls
{
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  urls = self->_urls;

  return urls;
}

- (void)setUrls:(id)a3
{
  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  urls = self->_urls;
  self->_urls = v4;
}

- (void)clearUrls
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
  urls = self->_urls;

  [(NSMutableArray *)urls removeAllObjects];
}

- (void)addUrl:(id)a3
{
  id v4 = a3;
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  -[GEORPCurrentEnvironmentManifestURLs _addNoFlagsUrl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(unsigned char *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(unsigned char *)&self->_flags |= 8u;
}

- (void)_addNoFlagsUrl:(uint64_t)a1
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

- (unint64_t)urlsCount
{
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  urls = self->_urls;

  return [(NSMutableArray *)urls count];
}

- (id)urlAtIndex:(unint64_t)a3
{
  -[GEORPCurrentEnvironmentManifestURLs _readUrls]((uint64_t)self);
  urls = self->_urls;

  return (id)[(NSMutableArray *)urls objectAtIndex:a3];
}

+ (Class)urlType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCurrentEnvironmentManifestURLs;
  id v4 = [(GEORPCurrentEnvironmentManifestURLs *)&v8 description];
  id v5 = [(GEORPCurrentEnvironmentManifestURLs *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCurrentEnvironmentManifestURLs _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [a1 readAll:1];
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [a1 environmentDisplayName];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"environmentDisplayName";
      }
      else {
        objc_super v6 = @"environment_display_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    id v7 = [a1 environmentReleaseName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"environmentReleaseName";
      }
      else {
        objc_super v8 = @"environment_release_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    if ([a1[4] count])
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1[4], "count"));
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v10 = a1[4];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v19 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v18 + 1) + 8 * i);
            if (a2) {
              [v15 jsonRepresentation];
            }
            else {
            v16 = objc_msgSend(v15, "dictionaryRepresentation", (void)v18);
            }
            objc_msgSend(v9, "addObject:", v16, (void)v18);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v12);
      }

      [v4 setObject:v9 forKey:@"url"];
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
  return -[GEORPCurrentEnvironmentManifestURLs _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEORPCurrentEnvironmentManifestURLs)initWithDictionary:(id)a3
{
  return (GEORPCurrentEnvironmentManifestURLs *)-[GEORPCurrentEnvironmentManifestURLs _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"environmentDisplayName";
      }
      else {
        objc_super v6 = @"environment_display_name";
      }
      id v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setEnvironmentDisplayName:v8];
      }
      if (a3) {
        v9 = @"environmentReleaseName";
      }
      else {
        v9 = @"environment_release_name";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v11 = (void *)[v10 copy];
        [a1 setEnvironmentReleaseName:v11];
      }
      uint64_t v12 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v23 = v12;
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
                long long v19 = [GEORPManifestURL alloc];
                if (a3) {
                  uint64_t v20 = [(GEORPManifestURL *)v19 initWithJSON:v18];
                }
                else {
                  uint64_t v20 = [(GEORPManifestURL *)v19 initWithDictionary:v18];
                }
                long long v21 = (void *)v20;
                [a1 addUrl:v20];
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

- (GEORPCurrentEnvironmentManifestURLs)initWithJSON:(id)a3
{
  return (GEORPCurrentEnvironmentManifestURLs *)-[GEORPCurrentEnvironmentManifestURLs _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_612;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_613;
    }
    GEORPCurrentEnvironmentManifestURLsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    _GEORPCurrentEnvironmentManifestURLsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCurrentEnvironmentManifestURLsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCurrentEnvironmentManifestURLsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPCurrentEnvironmentManifestURLsIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEORPCurrentEnvironmentManifestURLs *)self readAll:0];
    if (self->_environmentDisplayName) {
      PBDataWriterWriteStringField();
    }
    if (self->_environmentReleaseName) {
      PBDataWriterWriteStringField();
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    objc_super v6 = self->_urls;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = (id *)a3;
  [(GEORPCurrentEnvironmentManifestURLs *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 10) = self->_readerMarkPos;
  *((_DWORD *)v8 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_environmentDisplayName) {
    objc_msgSend(v8, "setEnvironmentDisplayName:");
  }
  if (self->_environmentReleaseName) {
    objc_msgSend(v8, "setEnvironmentReleaseName:");
  }
  if ([(GEORPCurrentEnvironmentManifestURLs *)self urlsCount])
  {
    [v8 clearUrls];
    unint64_t v4 = [(GEORPCurrentEnvironmentManifestURLs *)self urlsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(GEORPCurrentEnvironmentManifestURLs *)self urlAtIndex:i];
        [v8 addUrl:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
      GEORPCurrentEnvironmentManifestURLsReadAllFrom((uint64_t)v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPCurrentEnvironmentManifestURLs *)self readAll:0];
  uint64_t v8 = [(NSString *)self->_environmentDisplayName copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_environmentReleaseName copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v12 = self->_urls;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v15), "copyWithZone:", a3, (void)v18);
        [v5 addUrl:v16];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPCurrentEnvironmentManifestURLs *)self readAll:1],
         [v4 readAll:1],
         environmentDisplayName = self->_environmentDisplayName,
         !((unint64_t)environmentDisplayName | v4[2]))
     || -[NSString isEqual:](environmentDisplayName, "isEqual:"))
    && ((environmentReleaseName = self->_environmentReleaseName, !((unint64_t)environmentReleaseName | v4[3]))
     || -[NSString isEqual:](environmentReleaseName, "isEqual:")))
  {
    urls = self->_urls;
    if ((unint64_t)urls | v4[4]) {
      char v8 = -[NSMutableArray isEqual:](urls, "isEqual:");
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
  [(GEORPCurrentEnvironmentManifestURLs *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_environmentDisplayName hash];
  NSUInteger v4 = [(NSString *)self->_environmentReleaseName hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_urls hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  [v4 readAll:0];
  if (v4[2]) {
    -[GEORPCurrentEnvironmentManifestURLs setEnvironmentDisplayName:](self, "setEnvironmentDisplayName:");
  }
  if (v4[3]) {
    -[GEORPCurrentEnvironmentManifestURLs setEnvironmentReleaseName:](self, "setEnvironmentReleaseName:");
  }
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
        -[GEORPCurrentEnvironmentManifestURLs addUrl:](self, "addUrl:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_environmentReleaseName, 0);
  objc_storeStrong((id *)&self->_environmentDisplayName, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end