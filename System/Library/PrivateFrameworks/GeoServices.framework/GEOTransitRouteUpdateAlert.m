@interface GEOTransitRouteUpdateAlert
+ (BOOL)isValid:(id)a3;
- (BOOL)hasContent;
- (BOOL)hasIdentifier;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOFormattedString)content;
- (GEOFormattedString)title;
- (GEOTransitRouteUpdateAlert)init;
- (GEOTransitRouteUpdateAlert)initWithData:(id)a3;
- (GEOTransitRouteUpdateAlert)initWithDictionary:(id)a3;
- (GEOTransitRouteUpdateAlert)initWithJSON:(id)a3;
- (NSData)identifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readContent;
- (void)_readIdentifier;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setContent:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTransitRouteUpdateAlert

- (GEOTransitRouteUpdateAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdateAlert;
  v2 = [(GEOTransitRouteUpdateAlert *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdateAlert)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateAlert;
  v3 = [(GEOTransitRouteUpdateAlert *)&v7 initWithData:a3];
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
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOTransitRouteUpdateAlert _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readContent
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(unsigned char *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasContent
{
  return self->_content != 0;
}

- (GEOFormattedString)content
{
  -[GEOTransitRouteUpdateAlert _readContent]((uint64_t)self);
  content = self->_content;

  return content;
}

- (void)setContent:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_content, a3);
}

- (void)_readIdentifier
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
        GEOTransitRouteUpdateAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSData)identifier
{
  -[GEOTransitRouteUpdateAlert _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTransitRouteUpdateAlert;
  v4 = [(GEOTransitRouteUpdateAlert *)&v8 description];
  v5 = [(GEOTransitRouteUpdateAlert *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdateAlert _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 title];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2) {
        [v5 jsonRepresentation];
      }
      else {
      objc_super v7 = [v5 dictionaryRepresentation];
      }
      [v4 setObject:v7 forKey:@"title"];
    }
    objc_super v8 = [a1 content];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"content"];
    }
    v11 = [a1 identifier];
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 base64EncodedStringWithOptions:0];
        [v4 setObject:v13 forKey:@"identifier"];
      }
      else
      {
        [v4 setObject:v11 forKey:@"identifier"];
      }
    }

    v14 = (void *)a1[2];
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __56__GEOTransitRouteUpdateAlert__dictionaryRepresentation___block_invoke;
        v21[3] = &unk_1E53D8860;
        id v18 = v17;
        id v22 = v18;
        [v16 enumerateKeysAndObjectsUsingBlock:v21];
        id v19 = v18;

        v16 = v19;
      }
      [v4 setObject:v16 forKey:@"Unknown Fields"];
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
  return -[GEOTransitRouteUpdateAlert _dictionaryRepresentation:](self, 1);
}

void __56__GEOTransitRouteUpdateAlert__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteUpdateAlert)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdateAlert *)-[GEOTransitRouteUpdateAlert _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      objc_super v6 = [v5 objectForKeyedSubscript:@"title"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v7 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOFormattedString *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setTitle:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"content"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v12 = [(GEOFormattedString *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOFormattedString *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setContent:v12];
      }
      v14 = [v5 objectForKeyedSubscript:@"identifier"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:0];
        [a1 setIdentifier:v15];
      }
    }
  }

  return a1;
}

- (GEOTransitRouteUpdateAlert)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdateAlert *)-[GEOTransitRouteUpdateAlert _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_190;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_191;
    }
    GEOTransitRouteUpdateAlertReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOFormattedString *)self->_title readAll:1];
    [(GEOFormattedString *)self->_content readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateAlertIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateAlertReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitRouteUpdateAlertIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOTransitRouteUpdateAlert *)self readAll:0];
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_content)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_identifier)
    {
      PBDataWriterWriteDataField();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTransitRouteUpdateAlert *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title) {
    objc_msgSend(v5, "setTitle:");
  }
  if (self->_content) {
    objc_msgSend(v5, "setContent:");
  }
  v4 = v5;
  if (self->_identifier)
  {
    objc_msgSend(v5, "setIdentifier:");
    v4 = v5;
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
  if ((*(unsigned char *)&self->_flags & 0x10) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOTransitRouteUpdateAlert *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v8;

    id v10 = [(GEOFormattedString *)self->_content copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    uint64_t v12 = [(NSData *)self->_identifier copyWithZone:a3];
    v13 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v12;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOTransitRouteUpdateAlertReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOTransitRouteUpdateAlert *)self readAll:1],
         [v4 readAll:1],
         title = self->_title,
         !((unint64_t)title | v4[5]))
     || -[GEOFormattedString isEqual:](title, "isEqual:"))
    && ((content = self->_content, !((unint64_t)content | v4[3]))
     || -[GEOFormattedString isEqual:](content, "isEqual:")))
  {
    identifier = self->_identifier;
    if ((unint64_t)identifier | v4[4]) {
      char v8 = -[NSData isEqual:](identifier, "isEqual:");
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
  [(GEOTransitRouteUpdateAlert *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_title hash];
  unint64_t v4 = [(GEOFormattedString *)self->_content hash] ^ v3;
  return v4 ^ [(NSData *)self->_identifier hash];
}

- (void)mergeFrom:(id)a3
{
  char v8 = a3;
  [v8 readAll:0];
  title = self->_title;
  uint64_t v5 = v8[5];
  if (title)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOTransitRouteUpdateAlert setTitle:](self, "setTitle:");
  }
  content = self->_content;
  uint64_t v7 = v8[3];
  if (content)
  {
    if (v7) {
      -[GEOFormattedString mergeFrom:](content, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOTransitRouteUpdateAlert setContent:](self, "setContent:");
  }
  if (v8[4]) {
    -[GEOTransitRouteUpdateAlert setIdentifier:](self, "setIdentifier:");
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
      GEOTransitRouteUpdateAlertReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_195);
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
    [(GEOTransitRouteUpdateAlert *)self readAll:0];
    [(GEOFormattedString *)self->_title clearUnknownFields:1];
    content = self->_content;
    [(GEOFormattedString *)content clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end