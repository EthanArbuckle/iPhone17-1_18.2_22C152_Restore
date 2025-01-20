@interface GEOPDURLData
+ (BOOL)isValid:(id)a3;
- (BOOL)hasDisplayTitle;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)displayTitle;
- (GEOPDURLData)init;
- (GEOPDURLData)initWithData:(id)a3;
- (GEOPDURLData)initWithDictionary:(id)a3;
- (GEOPDURLData)initWithJSON:(id)a3;
- (NSString)url;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readDisplayTitle;
- (void)_readUrl;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setDisplayTitle:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDURLData

- (GEOPDURLData)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOPDURLData;
  v2 = [(GEOPDURLData *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDURLData)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOPDURLData;
  v3 = [(GEOPDURLData *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDisplayTitle
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
        GEOPDURLDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDisplayTitle_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasDisplayTitle
{
  return self->_displayTitle != 0;
}

- (GEOLocalizedString)displayTitle
{
  -[GEOPDURLData _readDisplayTitle]((uint64_t)self);
  displayTitle = self->_displayTitle;

  return displayTitle;
}

- (void)setDisplayTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_displayTitle, a3);
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
        GEOPDURLDataReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readUrl_tags_9736);
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
  -[GEOPDURLData _readUrl]((uint64_t)self);
  url = self->_url;

  return url;
}

- (void)setUrl:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_url, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDURLData;
  v4 = [(GEOPDURLData *)&v8 description];
  v5 = [(GEOPDURLData *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDURLData _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 displayTitle];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"displayTitle";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"display_title";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 url];
    if (v9) {
      [v4 setObject:v9 forKey:@"url"];
    }

    v10 = (void *)a1[2];
    if (v10)
    {
      v11 = [v10 dictionaryRepresentation];
      v12 = v11;
      if (a2)
      {
        v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __42__GEOPDURLData__dictionaryRepresentation___block_invoke;
        v17[3] = &unk_1E53D8860;
        id v14 = v13;
        id v18 = v14;
        [v12 enumerateKeysAndObjectsUsingBlock:v17];
        id v15 = v14;

        v12 = v15;
      }
      [v4 setObject:v12 forKey:@"Unknown Fields"];
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
  return -[GEOPDURLData _dictionaryRepresentation:](self, 1);
}

void __42__GEOPDURLData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDURLData)initWithDictionary:(id)a3
{
  return (GEOPDURLData *)-[GEOPDURLData _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"displayTitle";
      }
      else {
        objc_super v6 = @"display_title";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOLocalizedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOLocalizedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setDisplayTitle:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"url"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = (void *)[v11 copy];
        [a1 setUrl:v12];
      }
    }
  }

  return a1;
}

- (GEOPDURLData)initWithJSON:(id)a3
{
  return (GEOPDURLData *)-[GEOPDURLData _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_9737;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_9738;
    }
    GEOPDURLDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLocalizedString *)self->_displayTitle readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDURLDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDURLDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDURLDataIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOPDURLData *)self readAll:0];
    if (self->_displayTitle) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_url)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  v4 = (id *)a3;
  [(GEOPDURLData *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_displayTitle) {
    objc_msgSend(v4, "setDisplayTitle:");
  }
  if (self->_url) {
    objc_msgSend(v4, "setUrl:");
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
    [(GEOPDURLData *)self readAll:0];
    id v8 = [(GEOLocalizedString *)self->_displayTitle copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v8;

    uint64_t v10 = [(NSString *)self->_url copyWithZone:a3];
    v11 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOPDURLDataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOPDURLData *)self readAll:1],
         [v4 readAll:1],
         displayTitle = self->_displayTitle,
         !((unint64_t)displayTitle | v4[3]))
     || -[GEOLocalizedString isEqual:](displayTitle, "isEqual:")))
  {
    url = self->_url;
    if ((unint64_t)url | v4[4]) {
      char v7 = -[NSString isEqual:](url, "isEqual:");
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
  [(GEOPDURLData *)self readAll:1];
  unint64_t v3 = [(GEOLocalizedString *)self->_displayTitle hash];
  return [(NSString *)self->_url hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  objc_super v6 = a3;
  [v6 readAll:0];
  displayTitle = self->_displayTitle;
  uint64_t v5 = v6[3];
  if (displayTitle)
  {
    if (v5) {
      -[GEOLocalizedString mergeFrom:](displayTitle, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOPDURLData setDisplayTitle:](self, "setDisplayTitle:");
  }
  if (v6[4]) {
    -[GEOPDURLData setUrl:](self, "setUrl:");
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
      GEOPDURLDataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_9742);
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
    [(GEOPDURLData *)self readAll:0];
    displayTitle = self->_displayTitle;
    [(GEOLocalizedString *)displayTitle clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_displayTitle, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end