@interface GEOConditionalFormattedString
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCondition;
- (BOOL)hasFormattedString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOConditionalFormattedString)init;
- (GEOConditionalFormattedString)initWithData:(id)a3;
- (GEOConditionalFormattedString)initWithDictionary:(id)a3;
- (GEOConditionalFormattedString)initWithJSON:(id)a3;
- (GEOServerCondition)condition;
- (GEOServerFormattedString)formattedString;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCondition;
- (void)_readFormattedString;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCondition:(id)a3;
- (void)setFormattedString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOConditionalFormattedString

- (GEOConditionalFormattedString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOConditionalFormattedString;
  v2 = [(GEOConditionalFormattedString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOConditionalFormattedString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOConditionalFormattedString;
  v3 = [(GEOConditionalFormattedString *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readFormattedString
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
        GEOConditionalFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFormattedString_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasFormattedString
{
  return self->_formattedString != 0;
}

- (GEOServerFormattedString)formattedString
{
  -[GEOConditionalFormattedString _readFormattedString]((uint64_t)self);
  formattedString = self->_formattedString;

  return (GEOServerFormattedString *)formattedString;
}

- (void)setFormattedString:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_formattedString, a3);
}

- (void)_readCondition
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
        GEOConditionalFormattedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCondition_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCondition
{
  return self->_condition != 0;
}

- (GEOServerCondition)condition
{
  -[GEOConditionalFormattedString _readCondition]((uint64_t)self);
  condition = self->_condition;

  return (GEOServerCondition *)condition;
}

- (void)setCondition:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_condition, a3);
}

- (NSString)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOConditionalFormattedString;
  v4 = [(GEOConditionalFormattedString *)&v8 description];
  v5 = [(GEOConditionalFormattedString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOConditionalFormattedString _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 formattedString];
    objc_super v6 = v5;
    if (v5)
    {
      if (a2)
      {
        objc_super v7 = [v5 jsonRepresentation];
        objc_super v8 = @"formattedString";
      }
      else
      {
        objc_super v7 = [v5 dictionaryRepresentation];
        objc_super v8 = @"formatted_string";
      }
      [v4 setObject:v7 forKey:v8];
    }
    v9 = [a1 condition];
    v10 = v9;
    if (v9)
    {
      if (a2) {
        [v9 jsonRepresentation];
      }
      else {
      v11 = [v9 dictionaryRepresentation];
      }
      [v4 setObject:v11 forKey:@"condition"];
    }
    v12 = (void *)a1[2];
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __59__GEOConditionalFormattedString__dictionaryRepresentation___block_invoke;
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
  return -[GEOConditionalFormattedString _dictionaryRepresentation:](self, 1);
}

void __59__GEOConditionalFormattedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOConditionalFormattedString)initWithDictionary:(id)a3
{
  return (GEOConditionalFormattedString *)-[GEOConditionalFormattedString _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"formattedString";
      }
      else {
        objc_super v6 = @"formatted_string";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = [GEOFormattedString alloc];
        if (a3) {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithJSON:v7];
        }
        else {
          uint64_t v9 = [(GEOFormattedString *)v8 initWithDictionary:v7];
        }
        id v10 = (void *)v9;
        [a1 setFormattedString:v9];
      }
      v11 = [v5 objectForKeyedSubscript:@"condition"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v12 = [GEOCondition alloc];
        if (a3) {
          uint64_t v13 = [(GEOCondition *)v12 initWithJSON:v11];
        }
        else {
          uint64_t v13 = [(GEOCondition *)v12 initWithDictionary:v11];
        }
        v14 = (void *)v13;
        [a1 setCondition:v13];
      }
    }
  }

  return a1;
}

- (GEOConditionalFormattedString)initWithJSON:(id)a3
{
  return (GEOConditionalFormattedString *)-[GEOConditionalFormattedString _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_1195;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_1196;
    }
    GEOConditionalFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3)
  {
    [(GEOFormattedString *)self->_formattedString readAll:1];
    [(GEOCondition *)self->_condition readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOConditionalFormattedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOConditionalFormattedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOConditionalFormattedStringIsDirty((uint64_t)self) & 1) == 0)
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
    [(GEOConditionalFormattedString *)self readAll:0];
    if (self->_formattedString) {
      PBDataWriterWriteSubmessage();
    }
    id v5 = v8;
    if (self->_condition)
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
  [(GEOConditionalFormattedString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_formattedString) {
    objc_msgSend(v4, "setFormattedString:");
  }
  if (self->_condition) {
    objc_msgSend(v4, "setCondition:");
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
    [(GEOConditionalFormattedString *)self readAll:0];
    id v8 = [(GEOFormattedString *)self->_formattedString copyWithZone:a3];
    uint64_t v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    id v10 = [(GEOCondition *)self->_condition copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEOConditionalFormattedStringReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEOConditionalFormattedString *)self readAll:1],
         [v4 readAll:1],
         formattedString = self->_formattedString,
         !((unint64_t)formattedString | v4[4]))
     || -[GEOFormattedString isEqual:](formattedString, "isEqual:")))
  {
    condition = self->_condition;
    if ((unint64_t)condition | v4[3]) {
      char v7 = -[GEOCondition isEqual:](condition, "isEqual:");
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
  [(GEOConditionalFormattedString *)self readAll:1];
  unint64_t v3 = [(GEOFormattedString *)self->_formattedString hash];
  return [(GEOCondition *)self->_condition hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v8 = a3;
  [v8 readAll:0];
  formattedString = self->_formattedString;
  uint64_t v5 = v8[4];
  if (formattedString)
  {
    if (v5) {
      -[GEOFormattedString mergeFrom:](formattedString, "mergeFrom:");
    }
  }
  else if (v5)
  {
    -[GEOConditionalFormattedString setFormattedString:](self, "setFormattedString:");
  }
  condition = self->_condition;
  uint64_t v7 = v8[3];
  if (condition)
  {
    if (v7) {
      -[GEOCondition mergeFrom:](condition, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[GEOConditionalFormattedString setCondition:](self, "setCondition:");
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
      GEOConditionalFormattedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1200);
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
    [(GEOConditionalFormattedString *)self readAll:0];
    [(GEOFormattedString *)self->_formattedString clearUnknownFields:1];
    condition = self->_condition;
    [(GEOCondition *)condition clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedString, 0);
  objc_storeStrong((id *)&self->_condition, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end