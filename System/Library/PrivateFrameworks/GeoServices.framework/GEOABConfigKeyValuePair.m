@interface GEOABConfigKeyValuePair
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAbConfigKey;
- (BOOL)hasAbConfigValue;
- (BOOL)hasAbConfigValueType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOABConfigKeyValuePair)init;
- (GEOABConfigKeyValuePair)initWithData:(id)a3;
- (GEOABConfigKeyValuePair)initWithDictionary:(id)a3;
- (GEOABConfigKeyValuePair)initWithJSON:(id)a3;
- (GEOABConfigValue)abConfigValue;
- (NSString)abConfigKey;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)abConfigValueTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsAbConfigValueType:(id)a3;
- (int)abConfigValueType;
- (unint64_t)hash;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readAbConfigKey;
- (void)_readAbConfigValue;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setAbConfigKey:(id)a3;
- (void)setAbConfigValue:(id)a3;
- (void)setAbConfigValueType:(int)a3;
- (void)setHasAbConfigValueType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOABConfigKeyValuePair

- (GEOABConfigKeyValuePair)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOABConfigKeyValuePair;
  v2 = [(GEOABConfigKeyValuePair *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOABConfigKeyValuePair)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOABConfigKeyValuePair;
  v3 = [(GEOABConfigKeyValuePair *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAbConfigKey
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABConfigKeyValuePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbConfigKey_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAbConfigKey
{
  return self->_abConfigKey != 0;
}

- (NSString)abConfigKey
{
  -[GEOABConfigKeyValuePair _readAbConfigKey]((uint64_t)self);
  abConfigKey = self->_abConfigKey;

  return abConfigKey;
}

- (void)setAbConfigKey:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x14u;
  objc_storeStrong((id *)&self->_abConfigKey, a3);
}

- (int)abConfigValueType
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags) {
    return self->_abConfigValueType;
  }
  else {
    return 0;
  }
}

- (void)setAbConfigValueType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x11u;
  self->_abConfigValueType = a3;
}

- (void)setHasAbConfigValueType:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasAbConfigValueType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)abConfigValueTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53EC110[a3];
  }

  return v3;
}

- (int)StringAsAbConfigValueType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ABVAL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ABVAL_SINT64"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ABVAL_DOUBLE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"ABVAL_STRING"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ABVAL_BOOL"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readAbConfigValue
{
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(unsigned char *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        id v3 = v2;
        objc_sync_enter(v3);
        GEOABConfigKeyValuePairReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readAbConfigValue_tags);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAbConfigValue
{
  return self->_abConfigValue != 0;
}

- (GEOABConfigValue)abConfigValue
{
  -[GEOABConfigKeyValuePair _readAbConfigValue]((uint64_t)self);
  abConfigValue = self->_abConfigValue;

  return abConfigValue;
}

- (void)setAbConfigValue:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_abConfigValue, a3);
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOABConfigKeyValuePair;
  int v4 = [(GEOABConfigKeyValuePair *)&v8 description];
  v5 = [(GEOABConfigKeyValuePair *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOABConfigKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 abConfigKey];
    if (v5)
    {
      if (a2) {
        objc_super v6 = @"abConfigKey";
      }
      else {
        objc_super v6 = @"ab_config_key";
      }
      [v4 setObject:v5 forKey:v6];
    }

    if (*(unsigned char *)(a1 + 56))
    {
      uint64_t v7 = *(int *)(a1 + 52);
      if (v7 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 52));
        objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v8 = off_1E53EC110[v7];
      }
      if (a2) {
        v9 = @"abConfigValueType";
      }
      else {
        v9 = @"ab_config_value_type";
      }
      [v4 setObject:v8 forKey:v9];
    }
    v10 = [(id)a1 abConfigValue];
    v11 = v10;
    if (v10)
    {
      if (a2)
      {
        v12 = [v10 jsonRepresentation];
        v13 = @"abConfigValue";
      }
      else
      {
        v12 = [v10 dictionaryRepresentation];
        v13 = @"ab_config_value";
      }
      [v4 setObject:v12 forKey:v13];
    }
    v14 = *(void **)(a1 + 16);
    if (v14)
    {
      v15 = [v14 dictionaryRepresentation];
      v16 = v15;
      if (a2)
      {
        v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __53__GEOABConfigKeyValuePair__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOABConfigKeyValuePair _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __53__GEOABConfigKeyValuePair__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v7 = *(void **)(a1 + 32);
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

- (GEOABConfigKeyValuePair)initWithDictionary:(id)a3
{
  return (GEOABConfigKeyValuePair *)-[GEOABConfigKeyValuePair _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_36;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_36;
  }
  if (a3) {
    objc_super v6 = @"abConfigKey";
  }
  else {
    objc_super v6 = @"ab_config_key";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v8 = (void *)[v7 copy];
    [a1 setAbConfigKey:v8];
  }
  if (a3) {
    v9 = @"abConfigValueType";
  }
  else {
    v9 = @"ab_config_value_type";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    if ([v11 isEqualToString:@"ABVAL_UNKNOWN"])
    {
      uint64_t v12 = 0;
    }
    else if ([v11 isEqualToString:@"ABVAL_SINT64"])
    {
      uint64_t v12 = 1;
    }
    else if ([v11 isEqualToString:@"ABVAL_DOUBLE"])
    {
      uint64_t v12 = 2;
    }
    else if ([v11 isEqualToString:@"ABVAL_STRING"])
    {
      uint64_t v12 = 3;
    }
    else if ([v11 isEqualToString:@"ABVAL_BOOL"])
    {
      uint64_t v12 = 4;
    }
    else
    {
      uint64_t v12 = 0;
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = [v10 intValue];
LABEL_26:
    [a1 setAbConfigValueType:v12];
  }

  if (a3) {
    v13 = @"abConfigValue";
  }
  else {
    v13 = @"ab_config_value";
  }
  v14 = [v5 objectForKeyedSubscript:v13];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v15 = [GEOABConfigValue alloc];
    if (a3) {
      uint64_t v16 = [(GEOABConfigValue *)v15 initWithJSON:v14];
    }
    else {
      uint64_t v16 = [(GEOABConfigValue *)v15 initWithDictionary:v14];
    }
    v17 = (void *)v16;
    [a1 setAbConfigValue:v16];
  }
LABEL_36:

  return a1;
}

- (GEOABConfigKeyValuePair)initWithJSON:(id)a3
{
  return (GEOABConfigKeyValuePair *)-[GEOABConfigKeyValuePair _initWithDictionary:isJSON:](self, a3, 1);
}

- (void)readAll:(BOOL)a3
{
  BOOL v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if (v3) {
      objc_super v8 = (int *)&readAll__recursiveTag_435;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_436;
    }
    GEOABConfigKeyValuePairReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOABConfigValue *)self->_abConfigValue readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOABConfigKeyValuePairIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOABConfigKeyValuePairReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x1C) == 0))
  {
    objc_super v6 = self->_reader;
    objc_sync_enter(v6);
    *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
    [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
    uint64_t v7 = [(PBDataReader *)self->_reader readBytes:self->_readerMarkLength - self->_readerMarkPos];
    [v8 writeData:v7];
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    [(GEOABConfigKeyValuePair *)self readAll:0];
    if (self->_abConfigKey) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_abConfigValue)
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
  [(GEOABConfigKeyValuePair *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_abConfigKey) {
    objc_msgSend(v5, "setAbConfigKey:");
  }
  int v4 = v5;
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v5 + 13) = self->_abConfigValueType;
    *((unsigned char *)v5 + 56) |= 1u;
  }
  if (self->_abConfigValue)
  {
    objc_msgSend(v5, "setAbConfigValue:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    uint64_t v7 = reader;
    objc_sync_enter(v7);
    if ((*(unsigned char *)&self->_flags & 0x10) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOABConfigKeyValuePairReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOABConfigKeyValuePair *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_abConfigKey copyWithZone:a3];
  id v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_abConfigValueType;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  id v11 = [(GEOABConfigValue *)self->_abConfigValue copyWithZone:a3];
  uint64_t v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  [(GEOABConfigKeyValuePair *)self readAll:1];
  [v4 readAll:1];
  abConfigKey = self->_abConfigKey;
  if ((unint64_t)abConfigKey | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](abConfigKey, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_abConfigValueType != *((_DWORD *)v4 + 13)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  abConfigValue = self->_abConfigValue;
  if ((unint64_t)abConfigValue | *((void *)v4 + 4)) {
    char v7 = -[GEOABConfigValue isEqual:](abConfigValue, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  [(GEOABConfigKeyValuePair *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_abConfigKey hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v4 = 2654435761 * self->_abConfigValueType;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ [(GEOABConfigValue *)self->_abConfigValue hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  char v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = v7;
  if (v7[3])
  {
    -[GEOABConfigKeyValuePair setAbConfigKey:](self, "setAbConfigKey:");
    uint64_t v4 = v7;
  }
  if (v4[7])
  {
    self->_abConfigValueType = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
  abConfigValue = self->_abConfigValue;
  uint64_t v6 = v4[4];
  if (abConfigValue)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOABConfigValue mergeFrom:](abConfigValue, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOABConfigKeyValuePair setAbConfigValue:](self, "setAbConfigValue:");
  }
  uint64_t v4 = v7;
LABEL_11:
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
      uint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOABConfigKeyValuePairReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_440);
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
  *(unsigned char *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOABConfigKeyValuePair *)self readAll:0];
    abConfigValue = self->_abConfigValue;
    [(GEOABConfigValue *)abConfigValue clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abConfigValue, 0);
  objc_storeStrong((id *)&self->_abConfigKey, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end