@interface GEORPCorrectedField
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCorrectedValue;
- (BOOL)hasField;
- (BOOL)hasFieldName;
- (BOOL)hasIsMarkedIncorrect;
- (BOOL)hasOriginalValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMarkedIncorrect;
- (BOOL)readFrom:(id)a3;
- (GEORPCorrectedField)init;
- (GEORPCorrectedField)initWithData:(id)a3;
- (GEORPCorrectedField)initWithDictionary:(id)a3;
- (GEORPCorrectedField)initWithJSON:(id)a3;
- (NSString)correctedValue;
- (NSString)fieldName;
- (NSString)originalValue;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)fieldAsString:(int)a3;
- (id)jsonRepresentation;
- (int)StringAsField:(id)a3;
- (int)field;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readCorrectedValue;
- (void)_readFieldName;
- (void)_readOriginalValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCorrectedValue:(id)a3;
- (void)setField:(int)a3;
- (void)setFieldName:(id)a3;
- (void)setHasField:(BOOL)a3;
- (void)setHasIsMarkedIncorrect:(BOOL)a3;
- (void)setIsMarkedIncorrect:(BOOL)a3;
- (void)setOriginalValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEORPCorrectedField

- (GEORPCorrectedField)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEORPCorrectedField;
  v2 = [(GEORPCorrectedField *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPCorrectedField)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEORPCorrectedField;
  v3 = [(GEORPCorrectedField *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)field
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_field;
  }
  else {
    return 0;
  }
}

- (void)setField:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_field = a3;
}

- (void)setHasField:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasField
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)fieldAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E53E69D0[a3];
  }

  return v3;
}

- (int)StringAsField:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ADDRESS_TYPE_NAME"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_PHONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_HOURS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_URL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_CATEGORY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_STREET"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_CITY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_STATE"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_ZIP"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_COUNTRY"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_SUBPREMISE"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ADDRESS_TYPE_SUBLOCALITY"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readFieldName
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readFieldName_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasFieldName
{
  return self->_fieldName != 0;
}

- (NSString)fieldName
{
  -[GEORPCorrectedField _readFieldName]((uint64_t)self);
  fieldName = self->_fieldName;

  return fieldName;
}

- (void)setFieldName:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_fieldName, a3);
}

- (void)_readOriginalValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readOriginalValue_tags_0);
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
  -[GEORPCorrectedField _readOriginalValue]((uint64_t)self);
  originalValue = self->_originalValue;

  return originalValue;
}

- (void)setOriginalValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_originalValue, a3);
}

- (void)_readCorrectedValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 60) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEORPCorrectedFieldReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readCorrectedValue_tags_0);
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
  -[GEORPCorrectedField _readCorrectedValue]((uint64_t)self);
  correctedValue = self->_correctedValue;

  return correctedValue;
}

- (void)setCorrectedValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_correctedValue, a3);
}

- (BOOL)isMarkedIncorrect
{
  return self->_isMarkedIncorrect;
}

- (void)setIsMarkedIncorrect:(BOOL)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_isMarkedIncorrect = a3;
}

- (void)setHasIsMarkedIncorrect:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsMarkedIncorrect
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEORPCorrectedField;
  int v4 = [(GEORPCorrectedField *)&v8 description];
  v5 = [(GEORPCorrectedField *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPCorrectedField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    if (*(unsigned char *)(a1 + 60))
    {
      uint64_t v5 = *(int *)(a1 + 52);
      if (v5 >= 0xC)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v6 = off_1E53E69D0[v5];
      }
      [v4 setObject:v6 forKey:@"field"];
    }
    objc_super v7 = [(id)a1 fieldName];
    if (v7)
    {
      if (a2) {
        objc_super v8 = @"fieldName";
      }
      else {
        objc_super v8 = @"field_name";
      }
      [v4 setObject:v7 forKey:v8];
    }

    v9 = [(id)a1 originalValue];
    if (v9)
    {
      if (a2) {
        v10 = @"originalValue";
      }
      else {
        v10 = @"original_value";
      }
      [v4 setObject:v9 forKey:v10];
    }

    v11 = [(id)a1 correctedValue];
    if (v11)
    {
      if (a2) {
        v12 = @"correctedValue";
      }
      else {
        v12 = @"corrected_value";
      }
      [v4 setObject:v11 forKey:v12];
    }

    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      v13 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
      if (a2) {
        v14 = @"isMarkedIncorrect";
      }
      else {
        v14 = @"is_marked_incorrect";
      }
      [v4 setObject:v13 forKey:v14];
    }
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPCorrectedField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPCorrectedField)initWithDictionary:(id)a3
{
  return (GEORPCorrectedField *)-[GEORPCorrectedField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_54;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_54;
  }
  objc_super v6 = [v5 objectForKeyedSubscript:@"field"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"ADDRESS_TYPE_NAME"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_PHONE"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_HOURS"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_URL"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_CATEGORY"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_STREET"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_CITY"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_STATE"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_ZIP"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_COUNTRY"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_SUBPREMISE"])
    {
      uint64_t v8 = 10;
    }
    else if ([v7 isEqualToString:@"ADDRESS_TYPE_SUBLOCALITY"])
    {
      uint64_t v8 = 11;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_32;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_32:
    [a1 setField:v8];
  }

  if (a3) {
    v9 = @"fieldName";
  }
  else {
    v9 = @"field_name";
  }
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = (void *)[v10 copy];
    [a1 setFieldName:v11];
  }
  if (a3) {
    v12 = @"originalValue";
  }
  else {
    v12 = @"original_value";
  }
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v14 = (void *)[v13 copy];
    [a1 setOriginalValue:v14];
  }
  if (a3) {
    v15 = @"correctedValue";
  }
  else {
    v15 = @"corrected_value";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v17 = (void *)[v16 copy];
    [a1 setCorrectedValue:v17];
  }
  if (a3) {
    v18 = @"isMarkedIncorrect";
  }
  else {
    v18 = @"is_marked_incorrect";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setIsMarkedIncorrect:", objc_msgSend(v19, "BOOLValue"));
  }

LABEL_54:
  return a1;
}

- (GEORPCorrectedField)initWithJSON:(id)a3
{
  return (GEORPCorrectedField *)-[GEORPCorrectedField _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      uint64_t v8 = (int *)&readAll__recursiveTag_330;
    }
    else {
      uint64_t v8 = (int *)&readAll__nonRecursiveTag_331;
    }
    GEORPCorrectedFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPCorrectedFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPCorrectedFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x3C) == 0))
  {
    id v5 = self->_reader;
    objc_sync_enter(v5);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    objc_super v6 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v7 writeData:v6];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEORPCorrectedField *)self readAll:0];
    if (*(unsigned char *)&self->_flags) {
      PBDataWriterWriteInt32Field();
    }
    if (self->_fieldName) {
      PBDataWriterWriteStringField();
    }
    if (self->_originalValue) {
      PBDataWriterWriteStringField();
    }
    if (self->_correctedValue) {
      PBDataWriterWriteStringField();
    }
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      PBDataWriterWriteBOOLField();
    }
  }
}

- (void)copyTo:(id)a3
{
  int v4 = (id *)a3;
  [(GEORPCorrectedField *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v4 + 1, self->_reader);
  *((_DWORD *)v4 + 10) = self->_readerMarkPos;
  *((_DWORD *)v4 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_field;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  if (self->_fieldName) {
    objc_msgSend(v4, "setFieldName:");
  }
  if (self->_originalValue) {
    objc_msgSend(v4, "setOriginalValue:");
  }
  if (self->_correctedValue) {
    objc_msgSend(v4, "setCorrectedValue:");
  }
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_isMarkedIncorrect;
    *((unsigned char *)v4 + 60) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    id v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEORPCorrectedFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEORPCorrectedField *)self readAll:0];
  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_field;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_fieldName copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_originalValue copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_correctedValue copyWithZone:a3];
  v14 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v13;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(unsigned char *)(v5 + 56) = self->_isMarkedIncorrect;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  [(GEORPCorrectedField *)self readAll:1];
  [v4 readAll:1];
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_field != *((_DWORD *)v4 + 13)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_15;
  }
  fieldName = self->_fieldName;
  if ((unint64_t)fieldName | *((void *)v4 + 3) && !-[NSString isEqual:](fieldName, "isEqual:")) {
    goto LABEL_15;
  }
  originalValue = self->_originalValue;
  if ((unint64_t)originalValue | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](originalValue, "isEqual:")) {
      goto LABEL_15;
    }
  }
  correctedValue = self->_correctedValue;
  if ((unint64_t)correctedValue | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](correctedValue, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 60) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0)
    {
LABEL_15:
      BOOL v8 = 0;
      goto LABEL_16;
    }
    if (self->_isMarkedIncorrect)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_15;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_15;
    }
    BOOL v8 = 1;
  }
LABEL_16:

  return v8;
}

- (unint64_t)hash
{
  [(GEORPCorrectedField *)self readAll:1];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v3 = 2654435761 * self->_field;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_fieldName hash];
  NSUInteger v5 = [(NSString *)self->_originalValue hash];
  NSUInteger v6 = [(NSString *)self->_correctedValue hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_isMarkedIncorrect;
  }
  else {
    uint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v5 = (int *)a3;
  [v5 readAll:0];
  NSUInteger v4 = v5;
  if (v5[15])
  {
    self->_field = v5[13];
    *(unsigned char *)&self->_flags |= 1u;
  }
  if (*((void *)v5 + 3))
  {
    -[GEORPCorrectedField setFieldName:](self, "setFieldName:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[GEORPCorrectedField setOriginalValue:](self, "setOriginalValue:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[GEORPCorrectedField setCorrectedValue:](self, "setCorrectedValue:");
    NSUInteger v4 = v5;
  }
  if ((v4[15] & 2) != 0)
  {
    self->_isMarkedIncorrect = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_flags |= 2u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_fieldName, 0);
  objc_storeStrong((id *)&self->_correctedValue, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end