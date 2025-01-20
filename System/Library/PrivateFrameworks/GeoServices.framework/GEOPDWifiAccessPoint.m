@interface GEOPDWifiAccessPoint
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDWifiAccessPoint)initWithGEOWifiAccessPoint:(id)a3;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (unint64_t)hash;
- (void)setMacId:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDWifiAccessPoint

void __50__GEOPDWifiAccessPoint__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    v8 = [v5 base64EncodedStringWithOptions:0];
    v9 = [v10 description];
    [v7 setObject:v8 forKey:v9];
  }
  else
  {
    v8 = [v10 description];
    [v7 setObject:v5 forKey:v8];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_macId copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
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

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    uint64_t v5 = 0;
    goto LABEL_13;
  }
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = v4;
  if (*(void *)(a1 + 16)) {
    objc_msgSend(v4, "setObject:forKey:");
  }
  char v6 = *(unsigned char *)(a1 + 44);
  if ((v6 & 8) != 0)
  {
    v15 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    [v5 setObject:v15 forKey:@"rssi"];

    char v6 = *(unsigned char *)(a1 + 44);
    if ((v6 & 4) == 0)
    {
LABEL_6:
      if ((v6 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)(a1 + 44) & 4) == 0)
  {
    goto LABEL_6;
  }
  v16 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 36)];
  [v5 setObject:v16 forKey:@"channel"];

  char v6 = *(unsigned char *)(a1 + 44);
  if ((v6 & 1) == 0)
  {
LABEL_7:
    if ((v6 & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_18:
  v17 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 24)];
  if (a2) {
    v18 = @"scanTimestamp";
  }
  else {
    v18 = @"scan_timestamp";
  }
  [v5 setObject:v17 forKey:v18];

  if ((*(unsigned char *)(a1 + 44) & 2) != 0)
  {
LABEL_8:
    v7 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 32)];
    [v5 setObject:v7 forKey:@"age"];
  }
LABEL_9:
  v8 = *(void **)(a1 + 8);
  if (v8)
  {
    v9 = [v8 dictionaryRepresentation];
    id v10 = v9;
    if (a2)
    {
      v11 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __50__GEOPDWifiAccessPoint__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E53D8860;
      id v12 = v11;
      id v20 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v19];
      id v13 = v12;

      id v10 = v13;
    }
    [v5 setObject:v10 forKey:@"Unknown Fields"];
  }
LABEL_13:

  return v5;
}

- (void)setMacId:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDWifiAccessPoint;
  id v4 = [(GEOPDWifiAccessPoint *)&v8 description];
  uint64_t v5 = [(GEOPDWifiAccessPoint *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)jsonRepresentation
{
  return -[GEOPDWifiAccessPoint _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDWifiAccessPointReadAllFrom((uint64_t)self, a3);
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

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_macId, 0);

  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (GEOPDWifiAccessPoint)initWithGEOWifiAccessPoint:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOPDWifiAccessPoint;
  uint64_t v5 = [(GEOPDWifiAccessPoint *)&v12 init];
  if (v5)
  {
    if ([v4 hasMacId])
    {
      unint64_t v6 = [v4 macId];
      -[GEOPDWifiAccessPoint setMacId:]((uint64_t)v5, v6);
    }
    if ([v4 hasAge])
    {
      unsigned int v7 = [v4 age];
      *(unsigned char *)&v5->_flags |= 2u;
      v5->_age = v7;
    }
    if ([v4 hasChannel])
    {
      int v8 = [v4 channel];
      *(unsigned char *)&v5->_flags |= 4u;
      v5->_channel = v8;
    }
    if ([v4 hasRssi])
    {
      int v9 = [v4 rssi];
      *(unsigned char *)&v5->_flags |= 8u;
      v5->_rssi = v9;
    }
    if ([v4 hasScanTimestamp])
    {
      uint64_t v10 = [v4 scanTimestamp];
      *(unsigned char *)&v5->_flags |= 1u;
      v5->_scanTimestamp = v10;
    }
  }

  return v5;
}

@end