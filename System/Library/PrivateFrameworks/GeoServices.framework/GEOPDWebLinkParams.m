@interface GEOPDWebLinkParams
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDWebLinkParams)init;
- (GEOPDWebLinkParams)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)icon;
- (id)jsonRepresentation;
- (id)title;
- (id)url;
- (unint64_t)hash;
- (void)_readIcon;
- (void)_readTitle;
- (void)_readUrl;
- (void)readAll:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDWebLinkParams

- (GEOPDWebLinkParams)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDWebLinkParams;
  v2 = [(GEOPDWebLinkParams *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDWebLinkParams)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDWebLinkParams;
  v3 = [(GEOPDWebLinkParams *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTitle
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDWebLinkParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_9853);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDWebLinkParams _readTitle]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readUrl
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDWebLinkParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_9854);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)url
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDWebLinkParams _readUrl]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)_readIcon
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOPDWebLinkParamsReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIcon_tags_9855);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (id)icon
{
  if (a1)
  {
    v2 = a1;
    -[GEOPDWebLinkParams _readIcon]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDWebLinkParams;
  v4 = [(GEOPDWebLinkParams *)&v8 description];
  v5 = [(GEOPDWebLinkParams *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWebLinkParams _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOPDWebLinkParams readAll:](a1, 1);
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOPDWebLinkParams title]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"title"];
    }

    objc_super v6 = -[GEOPDWebLinkParams url]((id *)a1);
    if (v6) {
      [v4 setObject:v6 forKey:@"url"];
    }

    objc_super v7 = -[GEOPDWebLinkParams icon]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2) {
        [v7 jsonRepresentation];
      }
      else {
      v9 = [v7 dictionaryRepresentation];
      }
      [v4 setObject:v9 forKey:@"icon"];
    }
    if (*(unsigned char *)(a1 + 64))
    {
      v10 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 60)];
      if (a2) {
        v11 = @"supportsEmbeddedWebBrowser";
      }
      else {
        v11 = @"supports_embedded_web_browser";
      }
      [v4 setObject:v10 forKey:v11];
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
        v19[2] = __48__GEOPDWebLinkParams__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDWebLinkParams _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_9862;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_9863;
      }
      GEOPDWebLinkParamsReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __48__GEOPDWebLinkParams__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDWebLinkParamsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
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
    -[GEOPDWebLinkParams readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_icon)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
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
  if (reader)
  {
    objc_super v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOPDWebLinkParamsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDWebLinkParams readAll:]((uint64_t)self, 0);
  uint64_t v9 = [(NSString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_url copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  id v13 = [(GEOPDIcon *)self->_icon copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 60) = self->_supportsEmbeddedWebBrowser;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  v15 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  -[GEOPDWebLinkParams readAll:]((uint64_t)self, 1);
  -[GEOPDWebLinkParams readAll:]((uint64_t)v4, 1);
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_10;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_10;
    }
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((void *)v4 + 3))
  {
    if (!-[GEOPDIcon isEqual:](icon, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 64) & 1) == 0;
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0)
    {
LABEL_10:
      BOOL v8 = 0;
      goto LABEL_11;
    }
    if (self->_supportsEmbeddedWebBrowser)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_10;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_10;
    }
    BOOL v8 = 1;
  }
LABEL_11:

  return v8;
}

- (unint64_t)hash
{
  -[GEOPDWebLinkParams readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_url hash];
  unint64_t v5 = [(GEOPDIcon *)self->_icon hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_supportsEmbeddedWebBrowser;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end