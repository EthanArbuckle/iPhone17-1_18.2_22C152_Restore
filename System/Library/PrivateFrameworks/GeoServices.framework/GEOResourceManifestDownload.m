@interface GEOResourceManifestDownload
+ (BOOL)isValid:(id)a3;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasResources;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEODownloadMetadata)metadata;
- (GEOResourceManifestDownload)init;
- (GEOResourceManifestDownload)initWithData:(id)a3;
- (GEOResourceManifestDownload)initWithDictionary:(id)a3;
- (GEOResourceManifestDownload)initWithJSON:(id)a3;
- (GEOResourceManifestDownload)initWithResourceManifestData:(id)a3;
- (GEOResources)resources;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readResources;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setResources:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOResourceManifestDownload

- (GEOResources)resources
{
  -[GEOResourceManifestDownload _readResources]((uint64_t)self);
  resources = self->_resources;

  return resources;
}

- (void)_readResources
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
        GEOResourceManifestDownloadReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readResources_tags_1368);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (GEODownloadMetadata)metadata
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
        GEOResourceManifestDownloadReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readMetadata_tags_0);
        objc_sync_exit(v4);
      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOResourceManifestDownloadIsDirty((uint64_t)self))
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResourceManifestDownload *)self readAll:0];
    if (self->_resources) {
      PBDataWriterWriteSubmessage();
    }
    PBDataWriterWriteSubmessage();
    [(PBUnknownFields *)self->_unknownFields writeTo:v7];
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
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOResourceManifestDownload *)self readAll:0];
    id v8 = [(GEOResources *)self->_resources copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEODownloadMetadata *)self->_metadata copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOResourceManifestDownloadReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
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
      id v8 = (int *)&readAll__recursiveTag_1377;
    }
    else {
      id v8 = (int *)&readAll__nonRecursiveTag_1378;
    }
    GEOResourceManifestDownloadReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOResources *)self->_resources readAll:1];
    [(GEODownloadMetadata *)self->_metadata readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

- (GEOResourceManifestDownload)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOResourceManifestDownload;
  v2 = [(GEOResourceManifestDownload *)&v6 init];
  BOOL v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOResourceManifestDownload)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestDownload;
  BOOL v3 = [(GEOResourceManifestDownload *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    uint64_t v5 = v3;
  }

  return v4;
}

- (BOOL)hasResources
{
  return self->_resources != 0;
}

- (void)setResources:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_resources, a3);
}

- (id)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOResourceManifestDownload;
  v4 = [(GEOResourceManifestDownload *)&v8 description];
  uint64_t v5 = [(GEOResourceManifestDownload *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOResourceManifestDownload _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [a1 resources];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"resources"];
    }
    objc_super v8 = [a1 metadata];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      id v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"metadata"];
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
        v18[2] = __57__GEOResourceManifestDownload__dictionaryRepresentation___block_invoke;
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
  return -[GEOResourceManifestDownload _dictionaryRepresentation:](self, 1);
}

void __57__GEOResourceManifestDownload__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOResourceManifestDownload)initWithDictionary:(id)a3
{
  return (GEOResourceManifestDownload *)-[GEOResourceManifestDownload _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"resources"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOResources alloc];
        if (a3) {
          uint64_t v8 = [(GEOResources *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOResources *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setResources:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"metadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEODownloadMetadata alloc];
        if (a3) {
          uint64_t v12 = [(GEODownloadMetadata *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEODownloadMetadata *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setMetadata:v12];
      }
    }
  }

  return a1;
}

- (GEOResourceManifestDownload)initWithJSON:(id)a3
{
  return (GEOResourceManifestDownload *)-[GEOResourceManifestDownload _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOResourceManifestDownloadIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOResourceManifestDownloadReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOResourceManifestDownload _readResources]((uint64_t)self);
  resources = self->_resources;

  return [(GEOResources *)resources hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOResourceManifestDownload *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_resources) {
    objc_msgSend(v4, "setResources:");
  }
  [v4 setMetadata:self->_metadata];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOResourceManifestDownload *)self readAll:1],
         [v4 readAll:1],
         resources = self->_resources,
         !((unint64_t)resources | v4[4]))
     || -[GEOResources isEqual:](resources, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[3]) {
      char v7 = -[GEODownloadMetadata isEqual:](metadata, "isEqual:");
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
  [(GEOResourceManifestDownload *)self readAll:1];
  unint64_t v3 = [(GEOResources *)self->_resources hash];
  return [(GEODownloadMetadata *)self->_metadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v8 = a3;
  [v8 readAll:0];
  resources = self->_resources;
  uint64_t v5 = v8[4];
  if (resources)
  {
    if (v5) {
      -[GEOResources mergeFrom:](resources, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOResourceManifestDownload setResources:](self, "setResources:");
  }
  metadata = self->_metadata;
  uint64_t v7 = v8[3];
  if (metadata)
  {
    if (v7) {
      -[GEODownloadMetadata mergeFrom:](metadata, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOResourceManifestDownload setMetadata:](self, "setMetadata:");
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
      GEOResourceManifestDownloadReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1382);
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
    [(GEOResourceManifestDownload *)self readAll:0];
    [(GEOResources *)self->_resources clearUnknownFields:1];
    metadata = self->_metadata;
    [(GEODownloadMetadata *)metadata clearUnknownFields:1];
  }
}

- (GEOResourceManifestDownload)initWithResourceManifestData:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOResourceManifestDownload;
  uint64_t v5 = [(GEOResourceManifestDownload *)&v10 init];
  if (v5)
  {
    objc_super v6 = [[GEOResources alloc] initWithData:v4];
    if (v6)
    {
      [(GEOResourceManifestDownload *)v5 setResources:v6];
      uint64_t v7 = objc_alloc_init(GEODownloadMetadata);
      [(GEODownloadMetadata *)v7 setTimestamp:CFAbsoluteTimeGetCurrent()];
      [(GEOResourceManifestDownload *)v5 setMetadata:v7];
      uint64_t v8 = v5;
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end