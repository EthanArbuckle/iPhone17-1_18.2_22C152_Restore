@interface GEOWifiAccessPoint
+ (BOOL)isValid:(id)a3;
- (BOOL)hasAge;
- (BOOL)hasChannel;
- (BOOL)hasMacId;
- (BOOL)hasRssi;
- (BOOL)hasScanTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOWifiAccessPoint)initWithDictionary:(id)a3;
- (GEOWifiAccessPoint)initWithJSON:(id)a3;
- (NSString)macId;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)channel;
- (int)rssi;
- (unint64_t)hash;
- (unint64_t)scanTimestamp;
- (unsigned)age;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAge:(unsigned int)a3;
- (void)setChannel:(int)a3;
- (void)setHasAge:(BOOL)a3;
- (void)setHasChannel:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasScanTimestamp:(BOOL)a3;
- (void)setMacId:(id)a3;
- (void)setRssi:(int)a3;
- (void)setScanTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOWifiAccessPoint

- (BOOL)hasMacId
{
  return self->_macId != 0;
}

- (NSString)macId
{
  return self->_macId;
}

- (void)setMacId:(id)a3
{
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setRssi:(int)a3
{
  *(unsigned char *)&self->_flags |= 8u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xF7 | v3;
}

- (BOOL)hasRssi
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (int)channel
{
  return self->_channel;
}

- (void)setChannel:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_channel = a3;
}

- (void)setHasChannel:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasChannel
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (unint64_t)scanTimestamp
{
  return self->_scanTimestamp;
}

- (void)setScanTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_scanTimestamp = a3;
}

- (void)setHasScanTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasScanTimestamp
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)age
{
  return self->_age;
}

- (void)setAge:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_age = a3;
}

- (void)setHasAge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAge
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOWifiAccessPoint;
  v4 = [(GEOWifiAccessPoint *)&v8 description];
  v5 = [(GEOWifiAccessPoint *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    v4 = 0;
    goto LABEL_16;
  }
  [(id)a1 readAll:1];
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = [(id)a1 macId];
  if (v5)
  {
    if (a2) {
      v6 = @"macId";
    }
    else {
      v6 = @"mac_id";
    }
    [v4 setObject:v5 forKey:v6];
  }

  char v7 = *(unsigned char *)(a1 + 44);
  if ((v7 & 8) != 0)
  {
    v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v4 setObject:v16 forKey:@"rssi"];

    char v7 = *(unsigned char *)(a1 + 44);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_9;
  }
  v17 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  [v4 setObject:v17 forKey:@"channel"];

  char v7 = *(unsigned char *)(a1 + 44);
  if ((v7 & 1) == 0)
  {
LABEL_10:
    if ((v7 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_21:
  v18 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
  if (a2) {
    v19 = @"scanTimestamp";
  }
  else {
    v19 = @"scan_timestamp";
  }
  [v4 setObject:v18 forKey:v19];

  if ((*(unsigned char *)(a1 + 44) & 2) != 0)
  {
LABEL_11:
    objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
    [v4 setObject:v8 forKey:@"age"];
  }
LABEL_12:
  v9 = *(void **)(a1 + 8);
  if (v9)
  {
    v10 = [v9 dictionaryRepresentation];
    v11 = v10;
    if (a2)
    {
      v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __48__GEOWifiAccessPoint__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E53D8860;
      id v13 = v12;
      id v21 = v13;
      [v11 enumerateKeysAndObjectsUsingBlock:v20];
      id v14 = v13;

      v11 = v14;
    }
    [v4 setObject:v11 forKey:@"Unknown Fields"];
  }
LABEL_16:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOWifiAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  char v7 = *(void **)(a1 + 32);
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

- (GEOWifiAccessPoint)initWithDictionary:(id)a3
{
  return (GEOWifiAccessPoint *)-[GEOWifiAccessPoint _initWithDictionary:isJSON:](self, a3, 0);
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
        v6 = @"macId";
      }
      else {
        v6 = @"mac_id";
      }
      char v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_super v8 = (void *)[v7 copy];
        [a1 setMacId:v8];
      }
      v9 = [v5 objectForKeyedSubscript:@"rssi"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setRssi:", objc_msgSend(v9, "intValue"));
      }

      id v10 = [v5 objectForKeyedSubscript:@"channel"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setChannel:", objc_msgSend(v10, "intValue"));
      }

      if (a3) {
        v11 = @"scanTimestamp";
      }
      else {
        v11 = @"scan_timestamp";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setScanTimestamp:", objc_msgSend(v12, "unsignedLongLongValue"));
      }

      id v13 = [v5 objectForKeyedSubscript:@"age"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setAge:", objc_msgSend(v13, "unsignedIntValue"));
      }
    }
  }

  return a1;
}

- (GEOWifiAccessPoint)initWithJSON:(id)a3
{
  return (GEOWifiAccessPoint *)-[GEOWifiAccessPoint _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWifiAccessPointIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWifiAccessPointReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_macId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_8:
  [(PBUnknownFields *)self->_unknownFields writeTo:v4];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOWifiAccessPoint *)self readAll:0];
  if (self->_macId) {
    objc_msgSend(v5, "setMacId:");
  }
  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_rssi;
    *((unsigned char *)v5 + 44) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v5 + 9) = self->_channel;
  *((unsigned char *)v5 + 44) |= 4u;
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_6:
    if ((flags & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)v5 + 3) = self->_scanTimestamp;
  *((unsigned char *)v5 + 44) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 8) = self->_age;
    *((unsigned char *)v5 + 44) |= 2u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_macId copyWithZone:a3];
  char v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  char flags = (char)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_rssi;
    *(unsigned char *)(v5 + 44) |= 8u;
    char flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 24) = self->_scanTimestamp;
      *(unsigned char *)(v5 + 44) |= 1u;
      if ((*(unsigned char *)&self->_flags & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 36) = self->_channel;
  *(unsigned char *)(v5 + 44) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_9;
  }
LABEL_4:
  if ((flags & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 32) = self->_age;
    *(unsigned char *)(v5 + 44) |= 2u;
  }
LABEL_6:
  objc_storeStrong((id *)(v5 + 8), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  [(GEOWifiAccessPoint *)self readAll:1];
  [v4 readAll:1];
  macId = self->_macId;
  if ((unint64_t)macId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](macId, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_rssi != *((_DWORD *)v4 + 10)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_channel != *((_DWORD *)v4 + 9)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_scanTimestamp != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_age != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  [(GEOWifiAccessPoint *)self readAll:1];
  NSUInteger v3 = [(NSString *)self->_macId hash];
  if ((*(unsigned char *)&self->_flags & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_rssi;
    if ((*(unsigned char *)&self->_flags & 4) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_channel;
      if (*(unsigned char *)&self->_flags) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v6 = 0;
      if ((*(unsigned char *)&self->_flags & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_scanTimestamp;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_age;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  if (*((void *)v5 + 2)) {
    -[GEOWifiAccessPoint setMacId:](self, "setMacId:");
  }
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 8) != 0)
  {
    self->_rssi = *((_DWORD *)v5 + 10);
    *(unsigned char *)&self->_flags |= 8u;
    char v4 = *((unsigned char *)v5 + 44);
    if ((v4 & 4) == 0)
    {
LABEL_5:
      if ((v4 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v5 + 44) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_channel = *((_DWORD *)v5 + 9);
  *(unsigned char *)&self->_flags |= 4u;
  char v4 = *((unsigned char *)v5 + 44);
  if ((v4 & 1) == 0)
  {
LABEL_6:
    if ((v4 & 2) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_scanTimestamp = *((void *)v5 + 3);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 44) & 2) != 0)
  {
LABEL_7:
    self->_age = *((_DWORD *)v5 + 8);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_8:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  BOOL v3 = a3;
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    [(GEOWifiAccessPoint *)self readAll:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end