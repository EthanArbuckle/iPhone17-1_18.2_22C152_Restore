@interface GEOTrafficSignal
+ (BOOL)isValid:(id)a3;
- (BOOL)hasCountryCodeStyleId;
- (BOOL)hasGreenTeaWithValue:(BOOL)a3;
- (BOOL)hasIdentifier;
- (BOOL)hasPosition;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOLatLng)position;
- (GEOTrafficSignal)init;
- (GEOTrafficSignal)initWithData:(id)a3;
- (GEOTrafficSignal)initWithDictionary:(id)a3;
- (GEOTrafficSignal)initWithJSON:(id)a3;
- (NSString)identifier;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unsigned)countryCodeStyleId;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)_readIdentifier;
- (void)_readPosition;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)readAll:(BOOL)a3;
- (void)setCountryCodeStyleId:(unsigned int)a3;
- (void)setHasCountryCodeStyleId:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setPosition:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOTrafficSignal

- (GEOTrafficSignal)init
{
  v6.receiver = self;
  v6.super_class = (Class)GEOTrafficSignal;
  v2 = [(GEOTrafficSignal *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTrafficSignal)initWithData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GEOTrafficSignal;
  v3 = [(GEOTrafficSignal *)&v7 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readIdentifier
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
        GEOTrafficSignalReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readIdentifier_tags_8176);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOTrafficSignal _readIdentifier]((uint64_t)self);
  identifier = self->_identifier;

  return identifier;
}

- (void)setIdentifier:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int)type
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 0x22u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 34;
  }
  else {
    char v3 = 32;
  }
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E07B8[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"STOP_LIGHT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"STOP_SIGN"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)_readPosition
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
        GEOTrafficSignalReadSpecified(a1, *(void *)(a1 + 8), (int *)&_readPosition_tags_8177);
        objc_sync_exit(v3);
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasPosition
{
  return self->_position != 0;
}

- (GEOLatLng)position
{
  -[GEOTrafficSignal _readPosition]((uint64_t)self);
  position = self->_position;

  return position;
}

- (void)setPosition:(id)a3
{
  *(unsigned char *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_position, a3);
}

- (unsigned)countryCodeStyleId
{
  return self->_countryCodeStyleId;
}

- (void)setCountryCodeStyleId:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 0x21u;
  self->_countryCodeStyleId = a3;
}

- (void)setHasCountryCodeStyleId:(BOOL)a3
{
  *(unsigned char *)&self->_char flags = *(unsigned char *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasCountryCodeStyleId
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOTrafficSignal;
  int v4 = [(GEOTrafficSignal *)&v8 description];
  v5 = [(GEOTrafficSignal *)self dictionaryRepresentation];
  objc_super v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTrafficSignal _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    v5 = [(id)a1 identifier];
    if (v5) {
      [v4 setObject:v5 forKey:@"identifier"];
    }

    if ((*(unsigned char *)(a1 + 60) & 2) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 56);
      if (v6 >= 3)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 56));
        objc_super v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_super v7 = off_1E53E07B8[v6];
      }
      [v4 setObject:v7 forKey:@"type"];
    }
    objc_super v8 = [(id)a1 position];
    v9 = v8;
    if (v8)
    {
      if (a2) {
        [v8 jsonRepresentation];
      }
      else {
      v10 = [v8 dictionaryRepresentation];
      }
      [v4 setObject:v10 forKey:@"position"];
    }
    if (*(unsigned char *)(a1 + 60))
    {
      v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
      if (a2) {
        v12 = @"countryCodeStyleId";
      }
      else {
        v12 = @"country_code_style_id";
      }
      [v4 setObject:v11 forKey:v12];
    }
    v13 = *(void **)(a1 + 16);
    if (v13)
    {
      v14 = [v13 dictionaryRepresentation];
      v15 = v14;
      if (a2)
      {
        v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __46__GEOTrafficSignal__dictionaryRepresentation___block_invoke;
        v20[3] = &unk_1E53D8860;
        id v17 = v16;
        id v21 = v17;
        [v15 enumerateKeysAndObjectsUsingBlock:v20];
        id v18 = v17;

        v15 = v18;
      }
      [v4 setObject:v15 forKey:@"Unknown Fields"];
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
  return -[GEOTrafficSignal _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEOTrafficSignal__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTrafficSignal)initWithDictionary:(id)a3
{
  return (GEOTrafficSignal *)-[GEOTrafficSignal _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_28;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_28;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"identifier"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v7 = (void *)[v6 copy];
    [a1 setIdentifier:v7];
  }
  objc_super v8 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    if ([v9 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v10 = 0;
    }
    else if ([v9 isEqualToString:@"STOP_LIGHT"])
    {
      uint64_t v10 = 1;
    }
    else if ([v9 isEqualToString:@"STOP_SIGN"])
    {
      uint64_t v10 = 2;
    }
    else
    {
      uint64_t v10 = 0;
    }

    goto LABEL_16;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 intValue];
LABEL_16:
    [a1 setType:v10];
  }

  v11 = [v5 objectForKeyedSubscript:@"position"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [GEOLatLng alloc];
    if (a3) {
      uint64_t v13 = [(GEOLatLng *)v12 initWithJSON:v11];
    }
    else {
      uint64_t v13 = [(GEOLatLng *)v12 initWithDictionary:v11];
    }
    v14 = (void *)v13;
    [a1 setPosition:v13];
  }
  if (a3) {
    v15 = @"countryCodeStyleId";
  }
  else {
    v15 = @"country_code_style_id";
  }
  v16 = [v5 objectForKeyedSubscript:v15];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setCountryCodeStyleId:", objc_msgSend(v16, "unsignedIntValue"));
  }

LABEL_28:
  return a1;
}

- (GEOTrafficSignal)initWithJSON:(id)a3
{
  return (GEOTrafficSignal *)-[GEOTrafficSignal _initWithDictionary:isJSON:](self, a3, 1);
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
      objc_super v8 = (int *)&readAll__recursiveTag_8178;
    }
    else {
      objc_super v8 = (int *)&readAll__nonRecursiveTag_8179;
    }
    GEOTrafficSignalReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);
  }
  if (v3) {
    [(GEOLatLng *)self->_position readAll:1];
  }

  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTrafficSignalIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTrafficSignalReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(unsigned char *)&self->_flags & 0x38) == 0))
  {
    uint64_t v6 = self->_reader;
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
    [(GEOTrafficSignal *)self readAll:0];
    if (self->_identifier) {
      PBDataWriterWriteStringField();
    }
    id v5 = v8;
    if ((*(unsigned char *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      id v5 = v8;
    }
    if (self->_position)
    {
      PBDataWriterWriteSubmessage();
      id v5 = v8;
    }
    if (*(unsigned char *)&self->_flags)
    {
      PBDataWriterWriteUint32Field();
      id v5 = v8;
    }
    [(PBUnknownFields *)self->_unknownFields writeTo:v5];
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  BOOL v3 = a3;
  -[GEOTrafficSignal _readPosition]((uint64_t)self);
  position = self->_position;

  return [(GEOLatLng *)position hasGreenTeaWithValue:v3];
}

- (void)copyTo:(id)a3
{
  id v5 = (id *)a3;
  [(GEOTrafficSignal *)self readAll:0];
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 10) = self->_readerMarkPos;
  *((_DWORD *)v5 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier) {
    objc_msgSend(v5, "setIdentifier:");
  }
  int v4 = v5;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_type;
    *((unsigned char *)v5 + 60) |= 2u;
  }
  if (self->_position)
  {
    objc_msgSend(v5, "setPosition:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_flags)
  {
    *((_DWORD *)v4 + 13) = self->_countryCodeStyleId;
    *((unsigned char *)v4 + 60) |= 1u;
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
    if ((*(unsigned char *)&self->_flags & 0x20) == 0)
    {
      *(void *)((char *)self->_reader + (int)*MEMORY[0x1E4F940E0]) = self->_readerMarkLength;
      [(PBDataReader *)self->_reader seekToOffset:self->_readerMarkPos];
      GEOTrafficSignalReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      id v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);
  }
  os_unfair_lock_unlock(&self->_readerLock);
  [(GEOTrafficSignal *)self readAll:0];
  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  uint64_t v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_type;
    *(unsigned char *)(v5 + 60) |= 2u;
  }
  id v11 = [(GEOLatLng *)self->_position copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  if (*(unsigned char *)&self->_flags)
  {
    *(_DWORD *)(v5 + 52) = self->_countryCodeStyleId;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v13 = self->_unknownFields;
  id v8 = *(id *)(v5 + 16);
  *(void *)(v5 + 16) = v13;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOTrafficSignal *)self readAll:1];
  [v4 readAll:1];
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_16;
    }
  }
  char flags = (char)self->_flags;
  char v7 = *((unsigned char *)v4 + 60);
  if ((flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_type != *((_DWORD *)v4 + 14)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_16;
  }
  position = self->_position;
  if ((unint64_t)position | *((void *)v4 + 4))
  {
    if (!-[GEOLatLng isEqual:](position, "isEqual:"))
    {
LABEL_16:
      BOOL v9 = 0;
      goto LABEL_17;
    }
    char flags = (char)self->_flags;
    char v7 = *((unsigned char *)v4 + 60);
  }
  BOOL v9 = (v7 & 1) == 0;
  if (flags)
  {
    if ((v7 & 1) == 0 || self->_countryCodeStyleId != *((_DWORD *)v4 + 13)) {
      goto LABEL_16;
    }
    BOOL v9 = 1;
  }
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  [(GEOTrafficSignal *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(GEOLatLng *)self->_position hash];
  if (*(unsigned char *)&self->_flags) {
    uint64_t v6 = 2654435761 * self->_countryCodeStyleId;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v7 = a3;
  [v7 readAll:0];
  uint64_t v4 = v7;
  if (v7[3])
  {
    -[GEOTrafficSignal setIdentifier:](self, "setIdentifier:");
    uint64_t v4 = v7;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_type = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_flags |= 2u;
  }
  position = self->_position;
  uint64_t v6 = v4[4];
  if (position)
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOLatLng mergeFrom:](position, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    -[GEOTrafficSignal setPosition:](self, "setPosition:");
  }
  uint64_t v4 = v7;
LABEL_11:
  if (*((unsigned char *)v4 + 60))
  {
    self->_countryCodeStyleId = *((_DWORD *)v4 + 13);
    *(unsigned char *)&self->_flags |= 1u;
  }
}

- (PBUnknownFields)unknownFields
{
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      unint64_t v5 = reader;
      objc_sync_enter(v5);
      GEOTrafficSignalReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_8183);
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
  *(unsigned char *)&self->_flags |= 0x24u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOTrafficSignal *)self readAll:0];
    position = self->_position;
    [(GEOLatLng *)position clearUnknownFields:1];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

@end