@interface GEOSource
+ (BOOL)isValid:(id)a3;
- (BOOL)hasSourceVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOSource)init;
- (GEOSource)initWithAttributionID:(id)a3;
- (GEOSource)initWithData:(id)a3;
- (GEOSource)initWithDictionary:(id)a3;
- (GEOSource)initWithJSON:(id)a3;
- (NSString)sourceId;
- (NSString)sourceName;
- (NSString)sourceVersion;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readSourceVersion;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setSourceId:(id)a3;
- (void)setSourceName:(id)a3;
- (void)setSourceVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOSource

- (void)setSourceName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_sourceName, a3);
}

- (void)setSourceId:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_sourceId, a3);
}

- (GEOSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOSource;
  v2 = [(GEOSource *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOSource)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOSource;
  v3 = [(GEOSource *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)sourceName
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
        GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSourceName_tags_0);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  sourceName = self->_sourceName;

  return sourceName;
}

- (NSString)sourceId
{
  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(unsigned char *)&self->_flags & 2) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readSourceId_tags_1);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  sourceId = self->_sourceId;

  return sourceId;
}

- (void)_readSourceVersion
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
        GEOSourceReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSourceVersion_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceVersion
{
  return self->_sourceVersion != 0;
}

- (NSString)sourceVersion
{
  -[GEOSource _readSourceVersion]((uint64_t)self);
  sourceVersion = self->_sourceVersion;

  return sourceVersion;
}

- (void)setSourceVersion:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_sourceVersion, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOSource;
  v4 = [(GEOSource *)&v8 description];
  v5 = [(GEOSource *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOSource _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 sourceName];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"sourceName";
      }
      else {
        objc_super v6 = @"source_name";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 sourceId];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"sourceId";
      }
      else {
        objc_super v8 = @"source_id";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [a1 sourceVersion];
    if (v9)
    {
      if (a2) {
        v10 = @"sourceVersion";
      }
      else {
        v10 = @"source_version";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = (void *)a1[2];
    if (v11)
    {
      v12 = [v11 dictionaryRepresentation];
      v13 = v12;
      if (a2)
      {
        v14 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __39__GEOSource__dictionaryRepresentation___block_invoke;
        v18[3] = &unk_1E53D8860;
        id v15 = v14;
        id v19 = v15;
        [v13 enumerateKeysAndObjectsUsingBlock:v18];
        id v16 = v15;

        v13 = v16;
      }
      [v4 setObject:v13 forKey:@"Unknown Fields"];
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
  return -[GEOSource _dictionaryRepresentation:](self, 1);
}

void __39__GEOSource__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOSource)initWithDictionary:(id)a3
{
  return (GEOSource *)-[GEOSource _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"sourceName";
      }
      else {
        objc_super v6 = @"source_name";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setSourceName:v8];
      }
      if (a3) {
        v9 = @"sourceId";
      }
      else {
        v9 = @"source_id";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setSourceId:v11];
      }
      if (a3) {
        v12 = @"sourceVersion";
      }
      else {
        v12 = @"source_version";
      }
      v13 = [v5 objectForKeyedSubscript:v12];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (void *)[v13 copy];
        [a1 setSourceVersion:v14];
      }
    }
  }

  return a1;
}

- (GEOSource)initWithJSON:(id)a3
{
  return (GEOSource *)-[GEOSource _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_3235;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_3236;
    }
    GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOSourceIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOSourceReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1E) == 0))
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
    [(GEOSource *)self readAll:0];
    PBDataWriterWriteStringField();
    PBDataWriterWriteStringField();
    if (self->_sourceVersion) {
      PBDataWriterWriteStringField();
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v7];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOSource *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 12) = self->_readerMarkPos;
  *((_DWORD *)v4 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  [v4 setSourceName:self->_sourceName];
  [v4 setSourceId:self->_sourceId];
  if (self->_sourceVersion) {
    objc_msgSend(v4, "setSourceVersion:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader) {
    goto LABEL_5;
  }
  id v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOSource *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_sourceName copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_sourceId copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(NSString *)self->_sourceVersion copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOSourceReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOSource *)self readAll:1],
         [v4 readAll:1],
         sourceName = self->_sourceName,
         !((unint64_t)sourceName | v4[4]))
     || -[NSString isEqual:](sourceName, "isEqual:"))
    && ((sourceId = self->_sourceId, !((unint64_t)sourceId | v4[3]))
     || -[NSString isEqual:](sourceId, "isEqual:")))
  {
    sourceVersion = self->_sourceVersion;
    if ((unint64_t)sourceVersion | v4[5]) {
      char v8 = -[NSString isEqual:](sourceVersion, "isEqual:");
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
  [(GEOSource *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_sourceName hash];
  NSUInteger v4 = [(NSString *)self->_sourceId hash] ^ v3;
  return v4 ^ [(NSString *)self->_sourceVersion hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEOSource setSourceName:](self, "setSourceName:");
  }
  if (v4[3]) {
    -[GEOSource setSourceId:](self, "setSourceId:");
  }
  if (v4[5]) {
    -[GEOSource setSourceVersion:](self, "setSourceVersion:");
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOSourceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3240);
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
    [(GEOSource *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceVersion, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_sourceId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOSource)initWithAttributionID:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOSource;
  uint64_t v5 = [(GEOSource *)&v9 init];
  objc_super v6 = v5;
  if (v5)
  {
    [(GEOSource *)v5 setSourceName:@"yelp"];
    [(GEOSource *)v6 setSourceId:v4];
    id v7 = v6;
  }

  return v6;
}

@end