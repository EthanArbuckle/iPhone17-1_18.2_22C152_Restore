@interface GEORPCorrectedString
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrectedValue;
- (BOOL)hasOriginalValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedString)init;
- (GEORPCorrectedString)initWithData:(id)a3;
- (GEORPCorrectedString)initWithDictionary:(id)a3;
- (GEORPCorrectedString)initWithJSON:(id)a3;
- (NSString)correctedValue;
- (NSString)originalValue;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrectedValue;
- (void)_readOriginalValue;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectedValue:(id)a3;
- (void)setOriginalValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCorrectedString

- (GEORPCorrectedString)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedString;
  v2 = [(GEORPCorrectedString *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedString)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedString;
  v3 = [(GEORPCorrectedString *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readOriginalValue
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
        GEORPCorrectedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasOriginalValue
{
  return self->_originalValue != 0;
}

- (NSString)originalValue
{
  -[GEORPCorrectedString _readOriginalValue]((uint64_t)self);
  originalValue = self->_originalValue;

  return originalValue;
}

- (void)setOriginalValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_originalValue, a3);
}

- (void)_readCorrectedValue
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
        GEORPCorrectedStringReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasCorrectedValue
{
  return self->_correctedValue != 0;
}

- (NSString)correctedValue
{
  -[GEORPCorrectedString _readCorrectedValue]((uint64_t)self);
  correctedValue = self->_correctedValue;

  return correctedValue;
}

- (void)setCorrectedValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0xAu;
  objc_storeStrong((id *)&self->_correctedValue, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCorrectedString;
  v4 = [(GEORPCorrectedString *)&v8 description];
  v5 = [(GEORPCorrectedString *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedString _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(void *)a1
{
  if (a1)
  {
    [a1 readAll:1];
    v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [a1 originalValue];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"originalValue";
      }
      else {
        objc_super v6 = @"original_value";
      }
      [v4 setObject:v5 forKey:v6];
    }

    objc_super v7 = [a1 correctedValue];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"correctedValue";
      }
      else {
        objc_super v8 = @"corrected_value";
      }
      [v4 setObject:v7 forKey:v8];
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
        v16[2] = __50__GEORPCorrectedString__dictionaryRepresentation___block_invoke;
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
  return -[GEORPCorrectedString _dictionaryRepresentation:](self, 1);
}

void __50__GEORPCorrectedString__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPCorrectedString)initWithDictionary:(id)a3
{
  return (GEORPCorrectedString *)-[GEORPCorrectedString _initWithDictionary:isJSON:](self, a3, 0);
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
        objc_super v6 = @"originalValue";
      }
      else {
        objc_super v6 = @"original_value";
      }
      objc_super v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setOriginalValue:v8];
      }
      if (a3) {
        v9 = @"correctedValue";
      }
      else {
        v9 = @"corrected_value";
      }
      id v10 = [v5 objectForKeyedSubscript:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v11 = (void *)[v10 copy];
        [a1 setCorrectedValue:v11];
      }
    }
  }

  return a1;
}

- (GEORPCorrectedString)initWithJSON:(id)a3
{
  return (GEORPCorrectedString *)-[GEORPCorrectedString _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_449;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_450;
    }
    GEORPCorrectedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedStringIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedStringReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0xE) == 0))
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
    [(GEORPCorrectedString *)self readAll:0];
    if (self->_originalValue) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (self->_correctedValue)
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
  [(GEORPCorrectedString *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_originalValue) {
    objc_msgSend(v4, "setOriginalValue:");
  }
  if (self->_correctedValue) {
    objc_msgSend(v4, "setCorrectedValue:");
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
    [(GEORPCorrectedString *)self readAll:0];
    uint64_t v8 = [(NSString *)self->_originalValue copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_correctedValue copyWithZone:a3];
    v11 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v10;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
  [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
  GEORPCorrectedStringReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (([(GEORPCorrectedString *)self readAll:1],
         [v4 readAll:1],
         originalValue = self->_originalValue,
         !((unint64_t)originalValue | v4[4]))
     || -[NSString isEqual:](originalValue, "isEqual:")))
  {
    correctedValue = self->_correctedValue;
    if ((unint64_t)correctedValue | v4[3]) {
      char v7 = -[NSString isEqual:](correctedValue, "isEqual:");
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
  [(GEORPCorrectedString *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_originalValue hash];
  return [(NSString *)self->_correctedValue hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  [v4 readAll:0];
  if (v4[4]) {
    -[GEORPCorrectedString setOriginalValue:](self, "setOriginalValue:");
  }
  if (v4[3]) {
    -[GEORPCorrectedString setCorrectedValue:](self, "setCorrectedValue:");
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
      GEORPCorrectedStringReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_454);
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
    [(GEORPCorrectedString *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_correctedValue, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end