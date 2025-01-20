@interface GEODownloadMetadata
+ (BOOL)isValid:(id)a3;
- (BOOL)hasEnvironment;
- (BOOL)hasEtag;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODownloadMetadata)init;
- (GEODownloadMetadata)initWithData:(id)a3;
- (GEODownloadMetadata)initWithDictionary:(id)a3;
- (GEODownloadMetadata)initWithJSON:(id)a3;
- (NSString)environment;
- (NSString)etag;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (double)timestamp;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2;
- (void)_readEnvironment;
- (void)_readEtag;
- (void)_readUrl;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setEnvironment:(id)a3;
- (void)setEtag:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEODownloadMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSString)url
{
  -[GEODownloadMetadata _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODownloadMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_3);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (void)setUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_flags |= 0x10u;
  self->_timestamp = a3;
}

- (void)setEtag:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_etag, a3);
}

- (void)setEnvironment:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_environment, a3);
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (void)_readEtag
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODownloadMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEtag_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasEnvironment
{
  return self->_environment != 0;
}

- (NSString)etag
{
  -[GEODownloadMetadata _readEtag]((uint64_t)self);
  etag = self->_etag;

  return etag;
}

- (void)_readEnvironment
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEODownloadMetadataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readEnvironment_tags_1195);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (double)timestamp
{
  return self->_timestamp;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODownloadMetadata *)self readAll:0];
    *(double *)(v5 + 40) = self->_timestamp;
    uint64_t v8 = [(NSString *)self->_etag copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_url copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    uint64_t v12 = [(NSString *)self->_environment copyWithZone:a3];
    v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEODownloadMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (GEODownloadMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEODownloadMetadata;
  v2 = [(GEODownloadMetadata *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEODownloadMetadata *)self readAll:0];
    PBDataWriterWriteDoubleField();
    if (self->_etag) {
      PBDataWriterWriteStringField();
    }
    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_environment)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      id v8 = (int *)&readAll__recursiveTag_1205;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1206;
    }
    GEODownloadMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEODownloadMetadata)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEODownloadMetadata;
  BOOL v3 = [(GEODownloadMetadata *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    id v5 = v3;
  }

  return v4;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)environment
{
  -[GEODownloadMetadata _readEnvironment]((uint64_t)self);
  environment = self->_environment;

  return environment;
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEODownloadMetadata;
  v4 = [(GEODownloadMetadata *)&v8 description];
  id v5 = [(GEODownloadMetadata *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODownloadMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
    [v4 setObject:v5 forKey:@"timestamp"];

    objc_super v6 = [(id)a1 etag];
    if (v6) {
      [v4 setObject:v6 forKey:@"etag"];
    }

    objc_super v7 = [(id)a1 url];
    if (v7) {
      [v4 setObject:v7 forKey:@"url"];
    }

    objc_super v8 = [(id)a1 environment];
    if (v8) {
      [v4 setObject:v8 forKey:@"environment"];
    }

    v9 = *(void **)(a1 + 16);
    if (v9)
    {
      uint64_t v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __49__GEODownloadMetadata__dictionaryRepresentation___block_invoke;
        v16[3] = &unk_1E53D8860;
        id v13 = v12;
        id v17 = v13;
        [v11 enumerateKeysAndObjectsUsingBlock:v16];
        id v14 = v13;

        v11 = v14;
      }
      [v4 setObject:v11 forKey:@"Unknown Fields"];
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
  return -[GEODownloadMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEODownloadMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEODownloadMetadata)initWithDictionary:(id)a3
{
  return (GEODownloadMetadata *)-[GEODownloadMetadata _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v4 = [v3 objectForKeyedSubscript:@"timestamp"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v4 doubleValue];
        objc_msgSend(a1, "setTimestamp:");
      }

      id v5 = [v3 objectForKeyedSubscript:@"etag"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v6 = (void *)[v5 copy];
        [a1 setEtag:v6];
      }
      objc_super v7 = [v3 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setUrl:v8];
      }
      v9 = [v3 objectForKeyedSubscript:@"environment"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = (void *)[v9 copy];
        [a1 setEnvironment:v10];
      }
    }
  }

  return a1;
}

- (GEODownloadMetadata)initWithJSON:(id)a3
{
  return (GEODownloadMetadata *)-[GEODownloadMetadata _initWithDictionary:isJSON:](self, a3);
}

+ (BOOL)isValid:(id)a3
{
  return GEODownloadMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODownloadMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEODownloadMetadata *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  v5[5] = *(id *)&self->_timestamp;
  if (self->_etag)
  {
    objc_msgSend(v5, "setEtag:");
    v4 = v5;
  }
  if (self->_url)
  {
    objc_msgSend(v5, "setUrl:");
    v4 = v5;
  }
  if (self->_environment)
  {
    objc_msgSend(v5, "setEnvironment:");
    v4 = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ([(GEODownloadMetadata *)self readAll:1],
        [v4 readAll:1],
        self->_timestamp == *((double *)v4 + 5))
    && ((etag = self->_etag, !((unint64_t)etag | v4[4])) || -[NSString isEqual:](etag, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[6])) || -[NSString isEqual:](url, "isEqual:")))
  {
    environment = self->_environment;
    if ((unint64_t)environment | v4[3]) {
      char v8 = -[NSString isEqual:](environment, "isEqual:");
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
  [(GEODownloadMetadata *)self readAll:1];
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  NSUInteger v12 = [(NSString *)self->_etag hash];
  NSUInteger v13 = v11 ^ [(NSString *)self->_url hash];
  return v12 ^ [(NSString *)self->_environment hash] ^ v13;
}

- (void)mergeFrom:(id)a3
{
  double v4 = (double *)a3;
  [v4 readAll:0];
  self->_double timestamp = v4[5];
  if (*((void *)v4 + 4)) {
    -[GEODownloadMetadata setEtag:](self, "setEtag:");
  }
  if (*((void *)v4 + 6)) {
    -[GEODownloadMetadata setUrl:](self, "setUrl:");
  }
  if (*((void *)v4 + 3)) {
    -[GEODownloadMetadata setEnvironment:](self, "setEnvironment:");
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
      long double v5 = reader;
      objc_sync_enter(v5);
      GEODownloadMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1210);
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
  *(unsigned char *)&self->_flags |= 0x11u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEODownloadMetadata *)self readAll:0];
  }
}

@end