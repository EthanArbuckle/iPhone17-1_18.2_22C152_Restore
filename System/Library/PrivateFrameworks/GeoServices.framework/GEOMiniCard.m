@interface GEOMiniCard
+ (BOOL)isValid:(id)a3;
- (BOOL)hasButtonText;
- (BOOL)hasDetail;
- (BOOL)hasMetadata;
- (BOOL)hasShouldEmphasize;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldEmphasize;
- (GEOFormattedString)detail;
- (GEOFormattedString)metadata;
- (GEOFormattedString)title;
- (GEOMiniCard)init;
- (GEOMiniCard)initWithData:(id)a3;
- (GEOMiniCard)initWithDictionary:(id)a3;
- (GEOMiniCard)initWithJSON:(id)a3;
- (NSString)buttonText;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readButtonText;
- (void)_readDetail;
- (void)_readMetadata;
- (void)_readTitle;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setButtonText:(id)a3;
- (void)setDetail:(id)a3;
- (void)setHasShouldEmphasize:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setShouldEmphasize:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOMiniCard

- (GEOMiniCard)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOMiniCard;
  v2 = [(GEOMiniCard *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOMiniCard)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOMiniCard;
  v3 = [(GEOMiniCard *)&v7 initWithData:a3];
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
    if ((*(unsigned char *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMiniCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readTitle_tags_3851);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (GEOFormattedString)title
{
  -[GEOMiniCard _readTitle]((uint64_t)self);
  title = self->_title;

  return title;
}

- (void)setTitle:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readDetail
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMiniCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readDetail_tags_3852);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDetail
{
  return self->_detail != 0;
}

- (GEOFormattedString)detail
{
  -[GEOMiniCard _readDetail]((uint64_t)self);
  detail = self->_detail;

  return detail;
}

- (void)setDetail:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void)_readButtonText
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMiniCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readButtonText_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasButtonText
{
  return self->_buttonText != 0;
}

- (NSString)buttonText
{
  -[GEOMiniCard _readButtonText]((uint64_t)self);
  buttonText = self->_buttonText;

  return buttonText;
}

- (void)setButtonText:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_buttonText, a3);
}

- (BOOL)shouldEmphasize
{
  return self->_shouldEmphasize;
}

- (void)setShouldEmphasize:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x41u;
  self->_shouldEmphasize = a3;
}

- (void)setHasShouldEmphasize:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasShouldEmphasize
{
  return *(unsigned char *)&self->_flags & 1;
}

- (void)_readMetadata
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(unsigned char *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOMiniCardReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readMetadata_tags_3853);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (GEOFormattedString)metadata
{
  -[GEOMiniCard _readMetadata]((uint64_t)self);
  metadata = self->_metadata;

  return metadata;
}

- (void)setMetadata:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOMiniCard;
  v4 = [(GEOMiniCard *)&v8 description];
  v5 = [(GEOMiniCard *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMiniCard _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 title];
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
    objc_super v8 = [(id)a1 detail];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"detail"];
    }
    v11 = [(id)a1 buttonText];
    if (v11)
    {
      if (a2) {
        v12 = @"buttonText";
      }
      else {
        v12 = @"button_text";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if (*(unsigned char *)(a1 + 72))
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 68)];
      if (a2) {
        v14 = @"shouldEmphasize";
      }
      else {
        v14 = @"should_emphasize";
      }
      [v4 setObject:v13 forKey:v14];
    }
    v15 = [(id)a1 metadata];
    v16 = v15;
    if (v15)
    {
      if (a2) {
        [v15 jsonRepresentation];
      }
      else {
      v17 = [v15 dictionaryRepresentation];
      }
      [v4 setObject:v17 forKey:@"metadata"];
    }
    v18 = *(void **)(a1 + 16);
    if (v18)
    {
      v19 = [v18 dictionaryRepresentation];
      v20 = v19;
      if (a2)
      {
        v21 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __41__GEOMiniCard__dictionaryRepresentation___block_invoke;
        v25[3] = &unk_1E53D8860;
        id v22 = v21;
        id v26 = v22;
        [v20 enumerateKeysAndObjectsUsingBlock:v25];
        id v23 = v22;

        v20 = v23;
      }
      [v4 setObject:v20 forKey:@"Unknown Fields"];
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
  return -[GEOMiniCard _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __41__GEOMiniCard__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMiniCard)initWithDictionary:(id)a3
{
  return (GEOMiniCard *)-[GEOMiniCard _initWithDictionary:isJSON:](self, a3, 0);
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
      id v10 = [v5 objectForKeyedSubscript:@"detail"];
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
        [a1 setDetail:v12];
      }
      if (a3) {
        v14 = @"buttonText";
      }
      else {
        v14 = @"button_text";
      }
      v15 = [v5 objectForKeyedSubscript:v14];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[v15 copy];
        [a1 setButtonText:v16];
      }
      if (a3) {
        v17 = @"shouldEmphasize";
      }
      else {
        v17 = @"should_emphasize";
      }
      v18 = [v5 objectForKeyedSubscript:v17];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setShouldEmphasize:", objc_msgSend(v18, "BOOLValue"));
      }

      v19 = [v5 objectForKeyedSubscript:@"metadata"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v20 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v21 = [(GEOFormattedString *)v20 initWithJSON:v19];
        }
        else {
          uint64_t v21 = [(GEOFormattedString *)v20 initWithDictionary:v19];
        }
        id v22 = (void *)v21;
        [a1 setMetadata:v21];
      }
    }
  }

  return a1;
}

- (GEOMiniCard)initWithJSON:(id)a3
{
  return (GEOMiniCard *)-[GEOMiniCard _initWithDictionary:isJSON:](self, a3, 1);
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
      uint64_t v8 = (int *)&readAll__recursiveTag_3866;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_3867;
    }
    GEOMiniCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOFormattedString *)self->_title readAll:1];
    [(GEOFormattedString *)self->_detail readAll:1];
    [(GEOFormattedString *)self->_metadata readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMiniCardIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOMiniCardReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMiniCardIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOMiniCard *)self readAll:0];
    if (self->_title) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_detail)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (self->_buttonText)
    {
      PBDataWriterWriteStringField();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteBOOLField();
      id v5 = v8;
    }
    if (self->_metadata)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOMiniCard *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_title) {
    objc_msgSend(v5, "setTitle:");
  }
  if (self->_detail) {
    objc_msgSend(v5, "setDetail:");
  }
  v4 = v5;
  if (self->_buttonText)
  {
    objc_msgSend(v5, "setButtonText:");
    v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((unsigned char *)v4 + 68) = self->_shouldEmphasize;
    *((unsigned char *)v4 + 72) |= 1u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
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
    if ((*(unsigned char *)&self->_flags & 0x40) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOMiniCardReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOMiniCard *)self readAll:0];
  id v9 = [(GEOFormattedString *)self->_title copyWithZone:a3];
  id v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  id v11 = [(GEOFormattedString *)self->_detail copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_buttonText copyWithZone:a3];
  v14 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v13;

  if (*(unsigned char *)&self->_flags)
  {
    *(unsigned char *)(v5 + 68) = self->_shouldEmphasize;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v15 = [(GEOFormattedString *)self->_metadata copyWithZone:a3];
  v16 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v15;

  v17 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v17;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  [(GEOMiniCard *)self readAll:1];
  [v4 readAll:1];
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6))
  {
    if (!-[GEOFormattedString isEqual:](title, "isEqual:")) {
      goto LABEL_12;
    }
  }
  detail = self->_detail;
  if ((unint64_t)detail | *((void *)v4 + 4))
  {
    if (!-[GEOFormattedString isEqual:](detail, "isEqual:")) {
      goto LABEL_12;
    }
  }
  buttonText = self->_buttonText;
  if ((unint64_t)buttonText | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](buttonText, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if (*((unsigned char *)v4 + 72))
    {
      if (self->_shouldEmphasize)
      {
        if (*((unsigned char *)v4 + 68)) {
          goto LABEL_18;
        }
      }
      else if (!*((unsigned char *)v4 + 68))
      {
        goto LABEL_18;
      }
    }
LABEL_12:
    char v8 = 0;
    goto LABEL_13;
  }
  if (*((unsigned char *)v4 + 72)) {
    goto LABEL_12;
  }
LABEL_18:
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((void *)v4 + 5)) {
    char v8 = -[GEOFormattedString isEqual:](metadata, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  [(GEOMiniCard *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_title hash];
  unint64_t v4 = [(GEOFormattedString *)self->_detail hash];
  NSUInteger v5 = [(NSString *)self->_buttonText hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_shouldEmphasize;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(GEOFormattedString *)self->_metadata hash];
}

- (void)mergeFrom:(id)a3
{
  id v11 = a3;
  [v11 readAll:0];
  unint64_t v4 = v11;
  title = self->_title;
  uint64_t v6 = v11[6];
  if (title)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOFormattedString mergeFrom:](title, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[GEOMiniCard setTitle:](self, "setTitle:");
  }
  unint64_t v4 = v11;
LABEL_7:
  detail = self->_detail;
  uint64_t v8 = v4[4];
  if (detail)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[GEOMiniCard setDetail:](self, "setDetail:");
  }
  unint64_t v4 = v11;
LABEL_13:
  if (v4[3])
  {
    -[GEOMiniCard setButtonText:](self, "setButtonText:");
    unint64_t v4 = v11;
  }
  if (v4[9])
  {
    self->_shouldEmphasize = *((unsigned char *)v4 + 68);
    *(unsigned char *)&self->_flags |= 1u;
  }
  metadata = self->_metadata;
  uint64_t v10 = v4[5];
  if (metadata)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEOFormattedString mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[GEOMiniCard setMetadata:](self, "setMetadata:");
  }
  unint64_t v4 = v11;
LABEL_23:
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      NSUInteger v5 = reader;
      objc_sync_enter(v5);
      GEOMiniCardReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3871);
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
  *(unsigned char *)&self->_flags |= 0x42u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOMiniCard *)self readAll:0];
    [(GEOFormattedString *)self->_title clearUnknownFields:1];
    [(GEOFormattedString *)self->_detail clearUnknownFields:1];
    metadata = self->_metadata;
    [(GEOFormattedString *)metadata clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end