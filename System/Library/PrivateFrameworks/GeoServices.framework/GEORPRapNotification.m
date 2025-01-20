@interface GEORPRapNotification
+ (BOOL)isValid:(id)a3;
- (BOOL)hasBody;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLocalizedString)body;
- (GEOLocalizedString)title;
- (GEORPRapNotification)init;
- (GEORPRapNotification)initWithData:(id)a3;
- (GEORPRapNotification)initWithDictionary:(id)a3;
- (GEORPRapNotification)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(char)a3 isJSON:;
- (void)_readBody;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setBody:(id)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPRapNotification

- (GEORPRapNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPRapNotification;
  v2 = [(GEORPRapNotification *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPRapNotification)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPRapNotification;
  v3 = [(GEORPRapNotification *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPRapNotificationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_914);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOLocalizedString)title
{
  -[GEORPRapNotification _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readBody
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
        GEORPRapNotificationReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readBody_tags_915);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasBody
{
  return self->_body != 0;
}

- (GEOLocalizedString)body
{
  -[GEORPRapNotification _readBody]((uint64_t)self);
  body = self->_body;

  return body;
}

- (void)setBody:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_body, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPRapNotification;
  v4 = [(GEORPRapNotification *)&v8 description];
  v5 = [(GEORPRapNotification *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPRapNotification _dictionaryRepresentation:](self, 0);
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
    objc_super v8 = [a1 body];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"body"];
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
        v18[2] = __50__GEORPRapNotification__dictionaryRepresentation___block_invoke;
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
  return -[GEORPRapNotification _dictionaryRepresentation:](self, 1);
}

void __50__GEORPRapNotification__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPRapNotification)initWithDictionary:(id)a3
{
  return (GEORPRapNotification *)-[GEORPRapNotification _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v7 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v8 = [(GEOLocalizedString *)v7 initWithJSON:v6];
        }
        else {
          uint64_t v8 = [(GEOLocalizedString *)v7 initWithDictionary:v6];
        }
        v9 = (void *)v8;
        [a1 setTitle:v8];
      }
      id v10 = [v5 objectForKeyedSubscript:@"body"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = [GEOLocalizedString alloc];
        if (a3) {
          uint64_t v12 = [(GEOLocalizedString *)v11 initWithJSON:v10];
        }
        else {
          uint64_t v12 = [(GEOLocalizedString *)v11 initWithDictionary:v10];
        }
        v13 = (void *)v12;
        [a1 setBody:v12];
      }
    }
  }

  return a1;
}

- (GEORPRapNotification)initWithJSON:(id)a3
{
  return (GEORPRapNotification *)-[GEORPRapNotification _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_916;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_917;
    }
    GEORPRapNotificationReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOLocalizedString *)self->_title readAll:1];
    [(GEOLocalizedString *)self->_body readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPRapNotificationIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPRapNotificationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPRapNotificationIsDirty((uint64_t)self))
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
    [(GEORPRapNotification *)self readAll:0];
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_body)
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
  [(GEORPRapNotification *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title) {
    objc_msgSend(v4, "setTitle:");
  }
  if (self->_body) {
    objc_msgSend(v4, "setBody:");
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
    [(GEORPRapNotification *)self readAll:0];
    id v8 = [(GEOLocalizedString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOLocalizedString *)self->_body copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPRapNotificationReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPRapNotification *)self readAll:1],
         [v4 readAll:1],
         title = self->_title,
         !((unint64_t)title | v4[4]))
     || -[GEOLocalizedString isEqual:](title, "isEqual:")))
  {
    body = self->_body;
    if ((unint64_t)body | v4[3]) {
      char v7 = -[GEOLocalizedString isEqual:](body, "isEqual:");
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
  [(GEORPRapNotification *)self readAll:1];
  unint64_t v3 = [(GEOLocalizedString *)self->_title hash];
  return [(GEOLocalizedString *)self->_body hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  title = self->_title;
  uint64_t v5 = v8[4];
  if (title)
  {
    if (v5) {
      -[GEOLocalizedString mergeFrom:](title, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEORPRapNotification setTitle:](self, "setTitle:");
  }
  body = self->_body;
  uint64_t v7 = v8[3];
  if (body)
  {
    if (v7) {
      -[GEOLocalizedString mergeFrom:](body, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEORPRapNotification setBody:](self, "setBody:");
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
      GEORPRapNotificationReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_921);
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
    [(GEORPRapNotification *)self readAll:0];
    [(GEOLocalizedString *)self->_title clearUnknownFields:1];
    body = self->_body;
    [(GEOLocalizedString *)body clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end