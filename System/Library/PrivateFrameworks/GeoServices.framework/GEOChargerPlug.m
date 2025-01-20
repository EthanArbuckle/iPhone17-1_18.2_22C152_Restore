@interface GEOChargerPlug
+ (BOOL)isValid:(id)a3;
- (BOOL)hasMaximumPower;
- (BOOL)hasMaximumVoltage;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOChargerPlug)initWithDictionary:(id)a3;
- (GEOChargerPlug)initWithJSON:(id)a3;
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
- (unsigned)maximumPower;
- (unsigned)maximumVoltage;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaximumPower:(BOOL)a3;
- (void)setHasMaximumVoltage:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMaximumPower:(unsigned int)a3;
- (void)setMaximumVoltage:(unsigned int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOChargerPlug

- (int)type
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53DFF68[a3];
  }

  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"CONNECTOR_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_CHADEMO"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_J1772"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_TESLA"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_CCS1"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_CCS2"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_GBT1"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_GBT2"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_MENNEKES"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_NACS_AC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"CONNECTOR_TYPE_NACS_DC"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unsigned)maximumPower
{
  return self->_maximumPower;
}

- (void)setMaximumPower:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_maximumPower = a3;
}

- (void)setHasMaximumPower:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasMaximumPower
{
  return *(unsigned char *)&self->_flags & 1;
}

- (unsigned)maximumVoltage
{
  return self->_maximumVoltage;
}

- (void)setMaximumVoltage:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_maximumVoltage = a3;
}

- (void)setHasMaximumVoltage:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasMaximumVoltage
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOChargerPlug;
  int v4 = [(GEOChargerPlug *)&v8 description];
  v5 = [(GEOChargerPlug *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOChargerPlug _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 4) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 24);
      if (v6 >= 0xB)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E53DFF68[v6];
      }
      [v4 setObject:v7 forKey:@"type"];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if (v5)
    {
      objc_super v8 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 16)];
      if (a2) {
        v9 = @"maximumPower";
      }
      else {
        v9 = @"maximum_power";
      }
      [v4 setObject:v8 forKey:v9];

      char v5 = *(unsigned char *)(a1 + 28);
    }
    if ((v5 & 2) != 0)
    {
      v10 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 20)];
      if (a2) {
        v11 = @"maximumVoltage";
      }
      else {
        v11 = @"maximum_voltage";
      }
      [v4 setObject:v10 forKey:v11];
    }
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = [v12 dictionaryRepresentation];
      v14 = v13;
      if (a2)
      {
        v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __44__GEOChargerPlug__dictionaryRepresentation___block_invoke;
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
    int v4 = 0;
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOChargerPlug _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOChargerPlug__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
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

- (GEOChargerPlug)initWithDictionary:(id)a3
{
  return (GEOChargerPlug *)-[GEOChargerPlug _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (!a1) {
    goto LABEL_42;
  }
  a1 = (void *)[a1 init];
  if (!a1) {
    goto LABEL_42;
  }
  uint64_t v6 = [v5 objectForKeyedSubscript:@"type"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    if ([v7 isEqualToString:@"CONNECTOR_TYPE_UNKNOWN"])
    {
      uint64_t v8 = 0;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_CHADEMO"])
    {
      uint64_t v8 = 1;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_J1772"])
    {
      uint64_t v8 = 2;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_TESLA"])
    {
      uint64_t v8 = 3;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_CCS1"])
    {
      uint64_t v8 = 4;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_CCS2"])
    {
      uint64_t v8 = 5;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_GBT1"])
    {
      uint64_t v8 = 6;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_GBT2"])
    {
      uint64_t v8 = 7;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_MENNEKES"])
    {
      uint64_t v8 = 8;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_NACS_AC"])
    {
      uint64_t v8 = 9;
    }
    else if ([v7 isEqualToString:@"CONNECTOR_TYPE_NACS_DC"])
    {
      uint64_t v8 = 10;
    }
    else
    {
      uint64_t v8 = 0;
    }

    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 intValue];
LABEL_30:
    [a1 setType:v8];
  }

  if (a3) {
    v9 = @"maximumPower";
  }
  else {
    v9 = @"maximum_power";
  }
  id v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMaximumPower:", objc_msgSend(v10, "unsignedIntValue"));
  }

  if (a3) {
    v11 = @"maximumVoltage";
  }
  else {
    v11 = @"maximum_voltage";
  }
  v12 = [v5 objectForKeyedSubscript:v11];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setMaximumVoltage:", objc_msgSend(v12, "unsignedIntValue"));
  }

LABEL_42:
  return a1;
}

- (GEOChargerPlug)initWithJSON:(id)a3
{
  return (GEOChargerPlug *)-[GEOChargerPlug _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOChargerPlugIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOChargerPlugReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOChargerPlug *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_type;
    *((unsigned char *)v5 + 28) |= 4u;
    char flags = (char)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_flags & 1) == 0)
  {
    goto LABEL_3;
  }
  v5[4] = self->_maximumPower;
  *((unsigned char *)v5 + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5[5] = self->_maximumVoltage;
    *((unsigned char *)v5 + 28) |= 2u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(unsigned char *)&self->_flags & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v4 + 16) = self->_maximumPower;
    *(unsigned char *)(v4 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_type;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_maximumVoltage;
    *(unsigned char *)(v4 + 28) |= 2u;
  }
LABEL_5:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  [(GEOChargerPlug *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_flags)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_maximumPower != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 2) == 0;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_maximumVoltage != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOChargerPlug *)self readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) == 0)
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_flags) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_flags & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v3 = 2654435761 * self->_type;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_maximumPower;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_maximumVoltage;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 4) != 0)
  {
    self->_type = *((_DWORD *)v5 + 6);
    *(unsigned char *)&self->_flags |= 4u;
    char v4 = *((unsigned char *)v5 + 28);
    if ((v4 & 1) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v5 + 28) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_maximumPower = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 28) & 2) != 0)
  {
LABEL_4:
    self->_maximumVoltage = *((_DWORD *)v5 + 5);
    *(unsigned char *)&self->_flags |= 2u;
  }
LABEL_5:
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
    [(GEOChargerPlug *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end