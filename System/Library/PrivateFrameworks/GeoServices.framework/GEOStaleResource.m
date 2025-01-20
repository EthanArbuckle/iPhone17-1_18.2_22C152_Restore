@interface GEOStaleResource
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDesiredResource;
- (BOOL)hasFallbackResource;
- (BOOL)hasOriginalTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOResource)desiredResource;
- (GEOResource)fallbackResource;
- (GEOStaleResource)init;
- (GEOStaleResource)initWithData:(id)a3;
- (GEOStaleResource)initWithDictionary:(id)a3;
- (GEOStaleResource)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (double)originalTimestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readDesiredResource;
- (void)_readFallbackResource;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDesiredResource:(id)a3;
- (void)setFallbackResource:(id)a3;
- (void)setHasOriginalTimestamp:(BOOL)a3;
- (void)setOriginalTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOStaleResource

- (GEOStaleResource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOStaleResource;
  v2 = [(GEOStaleResource *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOStaleResource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOStaleResource;
  v3 = [(GEOStaleResource *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDesiredResource
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
        GEOStaleResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDesiredResource_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasDesiredResource
{
  return self->_desiredResource != 0;
}

- (GEOResource)desiredResource
{
  -[GEOStaleResource _readDesiredResource]((uint64_t)self);
  desiredResource = self->_desiredResource;

  return desiredResource;
}

- (void)setDesiredResource:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_desiredResource, a3);
}

- (void)_readFallbackResource
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
        GEOStaleResourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFallbackResource_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasFallbackResource
{
  return self->_fallbackResource != 0;
}

- (GEOResource)fallbackResource
{
  -[GEOStaleResource _readFallbackResource]((uint64_t)self);
  fallbackResource = self->_fallbackResource;

  return fallbackResource;
}

- (void)setFallbackResource:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_fallbackResource, a3);
}

- (double)originalTimestamp
{
  return self->_originalTimestamp;
}

- (void)setOriginalTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_originalTimestamp = a3;
}

- (void)setHasOriginalTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasOriginalTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOStaleResource;
  v4 = [(GEOStaleResource *)&v8 description];
  v5 = [(GEOStaleResource *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOStaleResource _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 desiredResource];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"desiredResource"];
    }
    objc_super v8 = [(id)a1 fallbackResource];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"fallbackResource"];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      v11 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
      [v4 setObject:v11 forKey:@"originalTimestamp"];
    }
    v12 = *(void **)(a1 + 16);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __46__GEOStaleResource__dictionaryRepresentation___block_invoke;
        v19[3] = &unk_1E53D8860;
        id v16 = v15;
        id v20 = v16;
        [v14 enumerateKeysAndObjectsUsingBlock:v19];
        id v17 = v16;

        v14 = v17;
      }
      [v4 setObject:v14 forKey:@"Unknown Fields"];
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
  return -[GEOStaleResource _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOStaleResource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_super v7 = *(void **)(a1 + 32);
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

- (GEOStaleResource)initWithDictionary:(id)a3
{
  return (GEOStaleResource *)-[GEOStaleResource _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"desiredResource"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOResource alloc];
        if (a3) {
          uint64_t v8 = [(GEOResource *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOResource *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setDesiredResource:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"fallbackResource"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOResource alloc];
        if (a3) {
          uint64_t v12 = [(GEOResource *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOResource *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setFallbackResource:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"originalTimestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v14 doubleValue];
        objc_msgSend(a1, "setOriginalTimestamp:");
      }
    }
  }

  return a1;
}

- (GEOStaleResource)initWithJSON:(id)a3
{
  return (GEOStaleResource *)-[GEOStaleResource _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_1431;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_1432;
    }
    GEOStaleResourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOResource *)self->_desiredResource readAll:1];
    [(GEOResource *)self->_fallbackResource readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOStaleResourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOStaleResourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOStaleResourceIsDirty((uint64_t)self) & 1) == 0)
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOStaleResource *)self readAll:0];
    if (self->_desiredResource) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_fallbackResource)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteDoubleField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOStaleResource *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 12) = self->_readerMarkPos;
  *((_DWORD *)v4 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_desiredResource) {
    objc_msgSend(v4, "setDesiredResource:");
  }
  if (self->_fallbackResource) {
    objc_msgSend(v4, "setFallbackResource:");
  }
  if (*(unsigned char *)&self->_flags)
  {
    v4[5] = *(id *)&self->_originalTimestamp;
    *((unsigned char *)v4 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOStaleResourceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOStaleResource *)self readAll:0];
  id v9 = [(GEOResource *)self->_desiredResource copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  id v11 = [(GEOResource *)self->_fallbackResource copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(double *)(v5 + 40) = self->_originalTimestamp;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  [(GEOStaleResource *)self readAll:1];
  [v4 readAll:1];
  desiredResource = self->_desiredResource;
  if ((unint64_t)desiredResource | *((void *)v4 + 3))
  {
    if (!-[GEOResource isEqual:](desiredResource, "isEqual:")) {
      goto LABEL_10;
    }
  }
  fallbackResource = self->_fallbackResource;
  if ((unint64_t)fallbackResource | *((void *)v4 + 4))
  {
    if (!-[GEOResource isEqual:](fallbackResource, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) != 0 && self->_originalTimestamp == *((double *)v4 + 5))
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
  [(GEOStaleResource *)self readAll:1];
  unint64_t v3 = [(GEOResource *)self->_desiredResource hash];
  unint64_t v4 = [(GEOResource *)self->_fallbackResource hash];
  if (*(unsigned char *)&self->_flags)
  {
    double originalTimestamp = self->_originalTimestamp;
    double v7 = -originalTimestamp;
    if (originalTimestamp >= 0.0) {
      double v7 = self->_originalTimestamp;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double v9 = a3;
  [v9 readAll:0];
  unint64_t v4 = v9;
  desiredResource = self->_desiredResource;
  uint64_t v6 = v9[3];
  if (desiredResource)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOResource mergeFrom:](desiredResource, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOStaleResource setDesiredResource:](self, "setDesiredResource:");
  }
  unint64_t v4 = v9;
LABEL_7:
  fallbackResource = self->_fallbackResource;
  uint64_t v8 = v4[4];
  if (fallbackResource)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOResource mergeFrom:](fallbackResource, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOStaleResource setFallbackResource:](self, "setFallbackResource:");
  }
  unint64_t v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 60))
  {
    self->_double originalTimestamp = (double)v4[5];
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOStaleResourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_1436);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOStaleResource *)self readAll:0];
    [(GEOResource *)self->_desiredResource clearUnknownFields:1];
    fallbackResource = self->_fallbackResource;
    [(GEOResource *)fallbackResource clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackResource, 0);
  objc_storeStrong((id *)&self->_desiredResource, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end