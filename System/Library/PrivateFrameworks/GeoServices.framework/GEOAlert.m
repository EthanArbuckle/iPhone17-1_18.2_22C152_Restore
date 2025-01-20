@interface GEOAlert
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOAlert)init;
- (GEOAlert)initWithData:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)content;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)formattedContent;
- (id)formattedTitle;
- (id)jsonRepresentation;
- (id)title;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readContent;
- (void)_readFormattedContent;
- (void)_readFormattedTitle;
- (void)_readTitle;
- (void)clearUnknownFields:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)readAll:(uint64_t)a1;
- (void)setContent:(uint64_t)a1;
- (void)setFormattedContent:(uint64_t)a1;
- (void)setFormattedTitle:(uint64_t)a1;
- (void)setTitle:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOAlert

- (GEOAlert)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOAlert;
  v2 = [(GEOAlert *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAlert)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOAlert;
  v3 = [(GEOAlert *)&v7 initWithData:a3];
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_542);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)title
{
  if (a1)
  {
    v2 = a1;
    -[GEOAlert _readTitle]((uint64_t)a1);
    a1 = (id *)v2[6];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setTitle:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 0x10u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

- (void)_readContent
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
        GEOAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readContent_tags_0);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)content
{
  if (a1)
  {
    v2 = a1;
    -[GEOAlert _readContent]((uint64_t)a1);
    a1 = (id *)v2[3];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setContent:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 2u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)_readFormattedTitle
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
        GEOAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedTitle_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)formattedTitle
{
  if (a1)
  {
    v2 = a1;
    -[GEOAlert _readFormattedTitle]((uint64_t)a1);
    a1 = (id *)v2[5];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFormattedTitle:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 8u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (void)_readFormattedContent
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
        GEOAlertReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedContent_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (id)formattedContent
{
  if (a1)
  {
    v2 = a1;
    -[GEOAlert _readFormattedContent]((uint64_t)a1);
    a1 = (id *)v2[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setFormattedContent:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 68) |= 4u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOAlert;
  id v4 = [(GEOAlert *)&v8 description];
  v5 = [(GEOAlert *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAlert _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    -[GEOAlert readAll:](a1, 1);
    id v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = -[GEOAlert title]((id *)a1);
    if (v5) {
      [v4 setObject:v5 forKey:@"title"];
    }

    objc_super v6 = -[GEOAlert content]((id *)a1);
    if (v6) {
      [v4 setObject:v6 forKey:@"content"];
    }

    objc_super v7 = -[GEOAlert formattedTitle]((id *)a1);
    objc_super v8 = v7;
    if (v7)
    {
      if (a2)
      {
        v9 = [v7 jsonRepresentation];
        v10 = @"formattedTitle";
      }
      else
      {
        v9 = [v7 dictionaryRepresentation];
        v10 = @"formatted_title";
      }
      [v4 setObject:v9 forKey:v10];
    }
    v11 = -[GEOAlert formattedContent]((id *)a1);
    v12 = v11;
    if (v11)
    {
      if (a2)
      {
        v13 = [v11 jsonRepresentation];
        v14 = @"formattedContent";
      }
      else
      {
        v13 = [v11 dictionaryRepresentation];
        v14 = @"formatted_content";
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
        v22[2] = __38__GEOAlert__dictionaryRepresentation___block_invoke;
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
    id v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAlert _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    id v4 = *(void **)(a1 + 8);
    if (v4)
    {
      id v5 = v4;
      objc_sync_enter(v5);
      if (a2) {
        objc_super v6 = (int *)&readAll__recursiveTag_558;
      }
      else {
        objc_super v6 = (int *)&readAll__nonRecursiveTag_559;
      }
      GEOAlertReadSpecified(a1, *(void *)(a1 + 8), v6);
      objc_sync_exit(v5);
    }
    if (a2)
    {
      [*(id *)(a1 + 40) readAll:1];
      [*(id *)(a1 + 32) readAll:1];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

void __38__GEOAlert__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_initWithDictionary:(int)a3 isJSON:
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
        objc_super v7 = (void *)[v6 copy];
        -[GEOAlert setTitle:]((uint64_t)a1, v7);
      }
      objc_super v8 = [v5 objectForKeyedSubscript:@"content"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v9 = (void *)[v8 copy];
        -[GEOAlert setContent:]((uint64_t)a1, v9);
      }
      if (a3) {
        id v10 = @"formattedTitle";
      }
      else {
        id v10 = @"formatted_title";
      }
      v11 = [v5 objectForKeyedSubscript:v10];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOFormattedString alloc];
        if (a3) {
          v13 = [(GEOFormattedString *)v12 initWithJSON:v11];
        }
        else {
          v13 = [(GEOFormattedString *)v12 initWithDictionary:v11];
        }
        v14 = v13;
        -[GEOAlert setFormattedTitle:]((uint64_t)a1, v13);
      }
      if (a3) {
        v15 = @"formattedContent";
      }
      else {
        v15 = @"formatted_content";
      }
      v16 = [v5 objectForKeyedSubscript:v15];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = [GEOFormattedString alloc];
        if (a3) {
          v18 = [(GEOFormattedString *)v17 initWithJSON:v16];
        }
        else {
          v18 = [(GEOFormattedString *)v17 initWithDictionary:v16];
        }
        id v19 = v18;
        -[GEOAlert setFormattedContent:]((uint64_t)a1, v18);
      }
    }
  }

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOAlertReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAlertIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOAlert readAll:]((uint64_t)self, 0);
    if (self->_title) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_content)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (self->_formattedTitle)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_formattedContent)
    {
      PBDataWriterWriteSubmessage();
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
  objc_super v7 = reader;
  objc_sync_enter(v7);
  if ((*(unsigned char *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAlert readAll:]((uint64_t)self, 0);
    uint64_t v8 = [(NSString *)self->_title copyWithZone:a3];
    v9 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v8;

    uint64_t v10 = [(NSString *)self->_content copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    id v12 = [(GEOFormattedString *)self->_formattedTitle copyWithZone:a3];
    v13 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v12;

    id v14 = [(GEOFormattedString *)self->_formattedContent copyWithZone:a3];
    v15 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v14;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOAlertReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((-[GEOAlert readAll:]((uint64_t)self, 1),
         -[GEOAlert readAll:]((uint64_t)v4, 1),
         title = self->_title,
         !((unint64_t)title | v4[6]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((content = self->_content, !((unint64_t)content | v4[3]))
     || -[NSString isEqual:](content, "isEqual:"))
    && ((formattedTitle = self->_formattedTitle, !((unint64_t)formattedTitle | v4[5]))
     || -[GEOFormattedString isEqual:](formattedTitle, "isEqual:")))
  {
    formattedContent = self->_formattedContent;
    if ((unint64_t)formattedContent | v4[4]) {
      char v9 = -[GEOFormattedString isEqual:](formattedContent, "isEqual:");
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
  -[GEOAlert readAll:]((uint64_t)self, 1);
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_content hash] ^ v3;
  unint64_t v5 = [(GEOFormattedString *)self->_formattedTitle hash];
  return v4 ^ v5 ^ [(GEOFormattedString *)self->_formattedContent hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  id v9 = a2;
  if (a1)
  {
    -[GEOAlert readAll:]((uint64_t)v9, 0);
    NSUInteger v3 = (void *)*((void *)v9 + 6);
    if (v3) {
      -[GEOAlert setTitle:](a1, v3);
    }
    NSUInteger v4 = (void *)*((void *)v9 + 3);
    if (v4) {
      -[GEOAlert setContent:](a1, v4);
    }
    unint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *((void *)v9 + 5);
    if (v5)
    {
      if (v6) {
        objc_msgSend(v5, "mergeFrom:");
      }
    }
    else if (v6)
    {
      -[GEOAlert setFormattedTitle:](a1, *((void **)v9 + 5));
    }
    objc_super v7 = *(void **)(a1 + 32);
    uint64_t v8 = *((void *)v9 + 4);
    if (v7)
    {
      if (v8) {
        objc_msgSend(v7, "mergeFrom:");
      }
    }
    else if (v8)
    {
      -[GEOAlert setFormattedContent:](a1, *((void **)v9 + 4));
    }
  }
}

- (void)clearUnknownFields:(uint64_t)a1
{
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(unsigned char *)(a1 + 68) |= 1u;
    *(unsigned char *)(a1 + 68) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    NSUInteger v4 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOAlert readAll:](a1, 0);
      [*(id *)(a1 + 40) clearUnknownFields:1];
      unint64_t v5 = *(void **)(a1 + 32);
      [v5 clearUnknownFields:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_formattedTitle, 0);
  objc_storeStrong((id *)&self->_formattedContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end