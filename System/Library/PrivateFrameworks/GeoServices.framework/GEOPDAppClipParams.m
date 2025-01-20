@interface GEOPDAppClipParams
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDAppClipParams)init;
- (GEOPDAppClipParams)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)bundleId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)url;
- (unint64_t)hash;
- (void)_readBundleId;
- (void)_readUrl;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDAppClipParams

- (GEOPDAppClipParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDAppClipParams;
  v2 = [(GEOPDAppClipParams *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAppClipParams)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDAppClipParams;
  v3 = [(GEOPDAppClipParams *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAppClipParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_5);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAppClipParams _readUrl]((uint64_t)a1);
    a1 = (id *)v2[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readBundleId
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDAppClipParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBundleId_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (id)bundleId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDAppClipParams _readBundleId]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAppClipParams;
  v4 = [(GEOPDAppClipParams *)&v8 description];
  v5 = [(GEOPDAppClipParams *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAppClipParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDAppClipParams readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 0x10) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDAppClipParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_539);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v7 = *(id *)(a1 + 48);
    if (v7) {
      [v4 setObject:v7 forKey:@"title"];
    }

    objc_super v8 = -[GEOPDAppClipParams url]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"url"];
    }

    v9 = -[GEOPDAppClipParams bundleId]((id *)a1);
    if (v9)
    {
      if (a2) {
        v10 = @"bundleId";
      }
      else {
        v10 = @"bundle_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 8) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDAppClipParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolImageName_tags_540);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v13 = *(id *)(a1 + 40);
    if (v13)
    {
      if (a2) {
        v14 = @"symbolImageName";
      }
      else {
        v14 = @"symbol_image_name";
      }
      [v4 setObject:v13 forKey:v14];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(unsigned char *)(a1 + 76) & 2) == 0)
    {
      v15 = *(void **)(a1 + 8);
      if (v15)
      {
        id v16 = v15;
        objc_sync_enter(v16);
        GEOPDAppClipParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppAdamId_tags_541);
        objc_sync_exit(v16);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    id v17 = *(id *)(a1 + 24);
    if (v17)
    {
      if (a2) {
        v18 = @"appAdamId";
      }
      else {
        v18 = @"app_adam_id";
      }
      [v4 setObject:v17 forKey:v18];
    }

    v19 = *(void **)(a1 + 16);
    if (v19)
    {
      v20 = [v19 dictionaryRepresentation];
      v21 = v20;
      if (a2)
      {
        v22 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __48__GEOPDAppClipParams__dictionaryRepresentation___block_invoke;
        v26[3] = &unk_1E53D8860;
        id v23 = v22;
        id v27 = v23;
        [v21 enumerateKeysAndObjectsUsingBlock:v26];
        id v24 = v23;

        v21 = v24;
      }
      [v4 setObject:v21 forKey:@"Unknown Fields"];
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
  return -[GEOPDAppClipParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_551;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_552;
      }
      GEOPDAppClipParamsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void __48__GEOPDAppClipParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDAppClipParamsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x7E) == 0))
  {
    id v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    id v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAppClipParams readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_bundleId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_symbolImageName)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
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
  if ((*(unsigned char *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAppClipParams readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    uint64_t v10 = [(NSString *)self->_url copyWithZone:a3];
    v11 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v10;

    uint64_t v12 = [(NSString *)self->_bundleId copyWithZone:a3];
    id v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    uint64_t v14 = [(NSString *)self->_symbolImageName copyWithZone:a3];
    v15 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v14;

    uint64_t v16 = [(NSString *)self->_appAdamId copyWithZone:a3];
    id v17 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v16;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDAppClipParamsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDAppClipParams readAll:]((uint64_t)self, 1),
         -[GEOPDAppClipParams readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[7])) || -[NSString isEqual:](url, "isEqual:"))
    && ((bundleId = self->_bundleId, !((unint64_t)bundleId | v4[4]))
     || -[NSString isEqual:](bundleId, "isEqual:"))
    && ((symbolImageName = self->_symbolImageName, !((unint64_t)symbolImageName | v4[5]))
     || -[NSString isEqual:](symbolImageName, "isEqual:")))
  {
    appAdamId = self->_appAdamId;
    if ((unint64_t)appAdamId | v4[3]) {
      char v10 = -[NSString isEqual:](appAdamId, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  -[GEOPDAppClipParams readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_bundleId hash] ^ v3;
  NSUInteger v6 = [(NSString *)self->_symbolImageName hash];
  return v5 ^ v6 ^ [(NSString *)self->_appAdamId hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end