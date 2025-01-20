@interface GEOTextLink
+ (BOOL)isValid:(id)a3;
- (BOOL)hasText;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)text;
- (GEOTextLink)init;
- (GEOTextLink)initWithData:(id)a3;
- (GEOTextLink)initWithDictionary:(id)a3;
- (GEOTextLink)initWithJSON:(id)a3;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readText;
- (void)_readUrl;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTextLink

- (GEOTextLink)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTextLink;
  v2 = [(GEOTextLink *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTextLink)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTextLink;
  v3 = [(GEOTextLink *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTextLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_8);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (NSString)url
{
  -[GEOTextLink _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_url, a3);
}

- (void)_readText
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
        GEOTextLinkReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readText_tags_1);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (GEOLocalizedString)text
{
  -[GEOTextLink _readText]((uint64_t)self);
  text = self->_text;

  return text;
}

- (void)setText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_text, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTextLink;
  v4 = [(GEOTextLink *)&v8 description];
  v5 = [(GEOTextLink *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTextLink _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 url];
    if (v5) {
      [v4 setObject:v5 forKey:@"url"];
    }

    objc_super v6 = [a1 text];
    objc_super v7 = v6;
    if (v6)
    {
      if (a2) {
        [v6 jsonRepresentation];
      }
      else {
      objc_super v8 = [v6 dictionaryRepresentation];
      }
      [v4 setObject:v8 forKey:@"text"];
    }
    v9 = (void *)a1[2];
    if (v9)
    {
      v10 = [v9 dictionaryRepresentation];
      v11 = v10;
      if (a2)
      {
        v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __41__GEOTextLink__dictionaryRepresentation___block_invoke;
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
  return -[GEOTextLink _dictionaryRepresentation:](self, 1);
}

void __41__GEOTextLink__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTextLink)initWithDictionary:(id)a3
{
  return (GEOTextLink *)-[GEOTextLink _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = (void *)[v6 copy];
        [a1 setUrl:v7];
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"text"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v10 = [(GEOLocalizedString *)v9 initWithJSON:v8];
        }
        else {
          uint64_t v10 = [(GEOLocalizedString *)v9 initWithDictionary:v8];
        }
        v11 = (void *)v10;
        [a1 setText:v10];
      }
    }
  }

  return a1;
}

- (GEOTextLink)initWithJSON:(id)a3
{
  return (GEOTextLink *)-[GEOTextLink _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1654;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1655;
    }
    GEOTextLinkReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLocalizedString *)self->_text readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTextLinkIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTextLinkReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOTextLinkIsDirty((uint64_t)self))
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
    [(GEOTextLink *)self readAll:0];
    if (self->_url) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_text)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOTextLink *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_url) {
    objc_msgSend(v4, "setUrl:");
  }
  if (self->_text) {
    objc_msgSend(v4, "setText:");
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
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTextLink *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_url copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOLocalizedString *)self->_text copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTextLinkReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTextLink *)self readAll:1],
         [v4 readAll:1],
         url = self->_url,
         !((unint64_t)url | v4[4]))
     || -[NSString isEqual:](url, "isEqual:")))
  {
    text = self->_text;
    if ((unint64_t)text | v4[3]) {
      char v7 = -[GEOLocalizedString isEqual:](text, "isEqual:");
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
  [(GEOTextLink *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_url hash];
  return [(GEOLocalizedString *)self->_text hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  if (v6[4]) {
    -[GEOTextLink setUrl:](self, "setUrl:");
  }
  text = self->_text;
  uint64_t v5 = v6[3];
  if (text)
  {
    if (v5) {
      -[GEOLocalizedString mergeFrom:](text, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTextLink setText:](self, "setText:");
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
      GEOTextLinkReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1659);
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
    [(GEOTextLink *)self readAll:0];
    text = self->_text;
    [(GEOLocalizedString *)text clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end