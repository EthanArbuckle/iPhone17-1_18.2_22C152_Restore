@interface GEOPDQuickLinkActionDataParams
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDQuickLinkActionDataParams)init;
- (GEOPDQuickLinkActionDataParams)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)appAdamId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)url;
- (unint64_t)hash;
- (void)_readAppAdamId;
- (void)_readUrl;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDQuickLinkActionDataParams

- (GEOPDQuickLinkActionDataParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDQuickLinkActionDataParams;
  v2 = [(GEOPDQuickLinkActionDataParams *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDQuickLinkActionDataParams)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDQuickLinkActionDataParams;
  v3 = [(GEOPDQuickLinkActionDataParams *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_7954);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDQuickLinkActionDataParams _readUrl]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readAppAdamId
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
        GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAppAdamId_tags_7955);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)appAdamId
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDQuickLinkActionDataParams _readAppAdamId]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDQuickLinkActionDataParams;
  v4 = [(GEOPDQuickLinkActionDataParams *)&v8 description];
  v5 = [(GEOPDQuickLinkActionDataParams *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDQuickLinkActionDataParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDQuickLinkActionDataParams readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 8) == 0)
    {
      v5 = *(void **)(a1 + 8);
      if (v5)
      {
        id v6 = v5;
        objc_sync_enter(v6);
        GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_7953);
        objc_sync_exit(v6);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v7 = *(id *)(a1 + 40);
    if (v7) {
      [v4 setObject:v7 forKey:@"title"];
    }

    objc_super v8 = -[GEOPDQuickLinkActionDataParams url]((id *)a1);
    if (v8) {
      [v4 setObject:v8 forKey:@"url"];
    }

    v9 = -[GEOPDQuickLinkActionDataParams appAdamId]((id *)a1);
    if (v9)
    {
      if (a2) {
        v10 = @"appAdamId";
      }
      else {
        v10 = @"app_adam_id";
      }
      [v4 setObject:v9 forKey:v10];
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 4) == 0)
    {
      v11 = *(void **)(a1 + 8);
      if (v11)
      {
        id v12 = v11;
        objc_sync_enter(v12);
        GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readSymbolImageName_tags_7956);
        objc_sync_exit(v12);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    id v13 = *(id *)(a1 + 32);
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
        v22[2] = __60__GEOPDQuickLinkActionDataParams__dictionaryRepresentation___block_invoke;
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
    v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDQuickLinkActionDataParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        id v6 = (int *)&readAll__recursiveTag_7957;
      }
      else {
        id v6 = (int *)&readAll__nonRecursiveTag_7958;
      }
      GEOPDQuickLinkActionDataParamsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __60__GEOPDQuickLinkActionDataParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDQuickLinkActionDataParamsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3E) == 0))
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
    -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_appAdamId)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_symbolImageName)
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
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    uint64_t v10 = [(NSString *)self->_url copyWithZone:a3];
    v11 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v10;

    uint64_t v12 = [(NSString *)self->_appAdamId copyWithZone:a3];
    id v13 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v12;

    uint64_t v14 = [(NSString *)self->_symbolImageName copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDQuickLinkActionDataParamsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 1),
         -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[5]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((url = self->_url, !((unint64_t)url | v4[6])) || -[NSString isEqual:](url, "isEqual:"))
    && ((appAdamId = self->_appAdamId, !((unint64_t)appAdamId | v4[3]))
     || -[NSString isEqual:](appAdamId, "isEqual:")))
  {
    symbolImageName = self->_symbolImageName;
    if ((unint64_t)symbolImageName | v4[4]) {
      char v9 = -[NSString isEqual:](symbolImageName, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  -[GEOPDQuickLinkActionDataParams readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_appAdamId hash] ^ v3;
  return v5 ^ [(NSString *)self->_symbolImageName hash];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_symbolImageName, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end