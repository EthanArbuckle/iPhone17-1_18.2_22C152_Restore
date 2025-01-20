@interface GEOLogMsgEventTileCacheAnalytic
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCacheHit;
- (BOOL)hasCacheMiss;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOCacheHit)cacheHit;
- (GEOCacheMiss)cacheMiss;
- (GEOLogMsgEventTileCacheAnalytic)init;
- (GEOLogMsgEventTileCacheAnalytic)initWithData:(id)a3;
- (GEOLogMsgEventTileCacheAnalytic)initWithDictionary:(id)a3;
- (GEOLogMsgEventTileCacheAnalytic)initWithJSON:(id)a3;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCacheHit;
- (void)_readCacheMiss;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCacheHit:(id)a3;
- (void)setCacheMiss:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgEventTileCacheAnalytic

- (GEOLogMsgEventTileCacheAnalytic)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventTileCacheAnalytic;
  v2 = [(GEOLogMsgEventTileCacheAnalytic *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventTileCacheAnalytic)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventTileCacheAnalytic;
  v3 = [(GEOLogMsgEventTileCacheAnalytic *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readCacheHit
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTileCacheAnalyticReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCacheHit_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCacheHit
{
  return self->_cacheHit != 0;
}

- (GEOCacheHit)cacheHit
{
  -[GEOLogMsgEventTileCacheAnalytic _readCacheHit]((uint64_t)self);
  cacheHit = self->_cacheHit;

  return cacheHit;
}

- (void)setCacheHit:(id)a3
{
  *(unsigned char *)&self->_flags |= 5u;
  objc_storeStrong((id *)&self->_cacheHit, a3);
}

- (void)_readCacheMiss
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if ((*(unsigned char *)(a1 + 44) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventTileCacheAnalyticReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCacheMiss_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }
}

- (BOOL)hasCacheMiss
{
  return self->_cacheMiss != 0;
}

- (GEOCacheMiss)cacheMiss
{
  -[GEOLogMsgEventTileCacheAnalytic _readCacheMiss]((uint64_t)self);
  cacheMiss = self->_cacheMiss;

  return cacheMiss;
}

- (void)setCacheMiss:(id)a3
{
  *(unsigned char *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_cacheMiss, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgEventTileCacheAnalytic;
  v4 = [(GEOLogMsgEventTileCacheAnalytic *)&v8 description];
  v5 = [(GEOLogMsgEventTileCacheAnalytic *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventTileCacheAnalytic _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 cacheHit];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"cacheHit";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"cache_hit";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 cacheMiss];
    v10 = v9;
    if (v9)
    {
      if (a2)
      {
        v11 = [v9 jsonRepresentation];
        v12 = @"cacheMiss";
      }
      else
      {
        v11 = [v9 dictionaryRepresentation];
        v12 = @"cache_miss";
      }
      [v4 setObject:v11 forKey:v12];
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventTileCacheAnalytic _dictionaryRepresentation:](self, 1);
}

- (GEOLogMsgEventTileCacheAnalytic)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventTileCacheAnalytic *)-[GEOLogMsgEventTileCacheAnalytic _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      if (a3) {
        objc_super v6 = @"cacheHit";
      }
      else {
        objc_super v6 = @"cache_hit";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOCacheHit alloc];
        if (a3) {
          uint64_t v9 = [(GEOCacheHit *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOCacheHit *)v8 initWithDictionary:v7];
        }
        v10 = (void *)v9;
        [a1 setCacheHit:v9];
      }
      if (a3) {
        v11 = @"cacheMiss";
      }
      else {
        v11 = @"cache_miss";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = [GEOCacheMiss alloc];
        if (a3) {
          uint64_t v14 = [(GEOCacheMiss *)v13 initWithJSON:v12];
        }
        else {
          uint64_t v14 = [(GEOCacheMiss *)v13 initWithDictionary:v12];
        }
        v15 = (void *)v14;
        [a1 setCacheMiss:v14];
      }
    }
  }

  return a1;
}

- (GEOLogMsgEventTileCacheAnalytic)initWithJSON:(id)a3
{
  return (GEOLogMsgEventTileCacheAnalytic *)-[GEOLogMsgEventTileCacheAnalytic _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_5083;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_5084;
    }
    GEOLogMsgEventTileCacheAnalyticReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOCacheHit *)self->_cacheHit readAll:1];
    [(GEOCacheMiss *)self->_cacheMiss readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventTileCacheAnalyticIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventTileCacheAnalyticReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 7) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventTileCacheAnalytic *)self readAll:0];
    if (self->_cacheHit) {
      PBDataWriterWriteSubmessage();
    }
    if (self->_cacheMiss) {
      PBDataWriterWriteSubmessage();
    }
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOLogMsgEventTileCacheAnalytic *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 8) = self->_readerMarkPos;
  *((_DWORD *)v4 + 9) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_cacheHit) {
    objc_msgSend(v4, "setCacheHit:");
  }
  if (self->_cacheMiss) {
    objc_msgSend(v4, "setCacheMiss:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOLogMsgEventTileCacheAnalytic *)self readAll:0];
    id v8 = [(GEOCacheHit *)self->_cacheHit copyWithZone:a3];
    uint64_t v9 = (void *)v5[2];
    v5[2] = v8;

    id v10 = [(GEOCacheMiss *)self->_cacheMiss copyWithZone:a3];
    id v7 = (PBDataReader *)v5[3];
    v5[3] = v10;
    goto LABEL_6;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOLogMsgEventTileCacheAnalyticReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOLogMsgEventTileCacheAnalytic *)self readAll:1],
         [v4 readAll:1],
         cacheHit = self->_cacheHit,
         !((unint64_t)cacheHit | v4[2]))
     || -[GEOCacheHit isEqual:](cacheHit, "isEqual:")))
  {
    cacheMiss = self->_cacheMiss;
    if ((unint64_t)cacheMiss | v4[3]) {
      char v7 = -[GEOCacheMiss isEqual:](cacheMiss, "isEqual:");
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
  [(GEOLogMsgEventTileCacheAnalytic *)self readAll:1];
  unint64_t v3 = [(GEOCacheHit *)self->_cacheHit hash];
  return [(GEOCacheMiss *)self->_cacheMiss hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  cacheHit = self->_cacheHit;
  uint64_t v5 = v8[2];
  if (cacheHit)
  {
    if (v5) {
      -[GEOCacheHit mergeFrom:](cacheHit, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOLogMsgEventTileCacheAnalytic setCacheHit:](self, "setCacheHit:");
  }
  cacheMiss = self->_cacheMiss;
  uint64_t v7 = v8[3];
  if (cacheMiss)
  {
    if (v7) {
      -[GEOCacheMiss mergeFrom:](cacheMiss, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOLogMsgEventTileCacheAnalytic setCacheMiss:](self, "setCacheMiss:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMiss, 0);
  objc_storeStrong((id *)&self->_cacheHit, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end