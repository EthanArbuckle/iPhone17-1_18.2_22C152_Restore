@interface GEOPDEvChargingPort
+ (BOOL)isValid:(id)a3;
- (BOOL)hasChargingConnectorType;
- (BOOL)hasChargingLevel;
- (BOOL)hasPower;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (GEOPDEvChargingPort)initWithDictionary:(id)a3;
- (GEOPDEvChargingPort)initWithJSON:(id)a3;
- (PBUnknownFields)unknownFields;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)chargingConnectorTypeAsString:(int)a3;
- (id)chargingLevelAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)jsonRepresentation;
- (int)StringAsChargingConnectorType:(id)a3;
- (int)StringAsChargingLevel:(id)a3;
- (int)chargingConnectorType;
- (int)chargingLevel;
- (unint64_t)hash;
- (unsigned)power;
- (void)_initWithDictionary:(int)a3 isJSON:;
- (void)clearUnknownFields:(BOOL)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChargingConnectorType:(int)a3;
- (void)setChargingLevel:(int)a3;
- (void)setHasChargingConnectorType:(BOOL)a3;
- (void)setHasChargingLevel:(BOOL)a3;
- (void)setHasPower:(BOOL)a3;
- (void)setPower:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOPDEvChargingPort

- (unsigned)power
{
  return self->_power;
}

- (void)setPower:(unsigned int)a3
{
  *(unsigned char *)&self->_flags |= 4u;
  self->_power = a3;
}

- (void)setHasPower:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasPower
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (int)chargingConnectorType
{
  if (*(unsigned char *)&self->_flags) {
    return self->_chargingConnectorType;
  }
  else {
    return 0;
  }
}

- (void)setChargingConnectorType:(int)a3
{
  *(unsigned char *)&self->_flags |= 1u;
  self->_chargingConnectorType = a3;
}

- (void)setHasChargingConnectorType:(BOOL)a3
{
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasChargingConnectorType
{
  return *(unsigned char *)&self->_flags & 1;
}

- (id)chargingConnectorTypeAsString:(int)a3
{
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E3F38[a3];
  }

  return v3;
}

- (int)StringAsChargingConnectorType:(id)a3
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

- (int)chargingLevel
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_chargingLevel;
  }
  else {
    return 0;
  }
}

- (void)setChargingLevel:(int)a3
{
  *(unsigned char *)&self->_flags |= 2u;
  self->_chargingLevel = a3;
}

- (void)setHasChargingLevel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasChargingLevel
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)chargingLevelAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E53E39A8[a3];
  }

  return v3;
}

- (int)StringAsChargingLevel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEVEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEVEL_ONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEVEL_TWO"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEVEL_THREE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOPDEvChargingPort;
  int v4 = [(GEOPDEvChargingPort *)&v8 description];
  v5 = [(GEOPDEvChargingPort *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDEvChargingPort _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  if (!a1)
  {
    int v4 = 0;
    goto LABEL_25;
  }
  [(id)a1 readAll:1];
  int v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = *(unsigned char *)(a1 + 28);
  if ((v5 & 4) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 24)];
    [v4 setObject:v6 forKey:@"power"];

    char v5 = *(unsigned char *)(a1 + 28);
    if ((v5 & 1) == 0)
    {
LABEL_4:
      if ((v5 & 2) == 0) {
        goto LABEL_21;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)(a1 + 28) & 1) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v7 = *(int *)(a1 + 16);
  if (v7 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
    objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_super v8 = off_1E53E3F38[v7];
  }
  if (a2) {
    v9 = @"chargingConnectorType";
  }
  else {
    v9 = @"charging_connector_type";
  }
  [v4 setObject:v8 forKey:v9];

  if ((*(unsigned char *)(a1 + 28) & 2) != 0)
  {
LABEL_14:
    uint64_t v10 = *(int *)(a1 + 20);
    if (v10 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E53E39A8[v10];
    }
    if (a2) {
      v12 = @"chargingLevel";
    }
    else {
      v12 = @"charging_level";
    }
    [v4 setObject:v11 forKey:v12];
  }
LABEL_21:
  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    v14 = [v13 dictionaryRepresentation];
    v15 = v14;
    if (a2)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __49__GEOPDEvChargingPort__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E53D8860;
      id v17 = v16;
      id v21 = v17;
      [v15 enumerateKeysAndObjectsUsingBlock:v20];
      id v18 = v17;

      v15 = v18;
    }
    [v4 setObject:v15 forKey:@"Unknown Fields"];
  }
LABEL_25:

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDEvChargingPort _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDEvChargingPort__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDEvChargingPort)initWithDictionary:(id)a3
{
  return (GEOPDEvChargingPort *)-[GEOPDEvChargingPort _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5 = a2;
  if (a1)
  {
    a1 = (void *)[a1 init];
    if (a1)
    {
      v6 = [v5 objectForKeyedSubscript:@"power"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        objc_msgSend(a1, "setPower:", objc_msgSend(v6, "unsignedIntValue"));
      }

      if (a3) {
        uint64_t v7 = @"chargingConnectorType";
      }
      else {
        uint64_t v7 = @"charging_connector_type";
      }
      objc_super v8 = [v5 objectForKeyedSubscript:v7];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = v8;
        if ([v9 isEqualToString:@"CONNECTOR_TYPE_UNKNOWN"])
        {
          uint64_t v10 = 0;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_CHADEMO"])
        {
          uint64_t v10 = 1;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_J1772"])
        {
          uint64_t v10 = 2;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_TESLA"])
        {
          uint64_t v10 = 3;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_CCS1"])
        {
          uint64_t v10 = 4;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_CCS2"])
        {
          uint64_t v10 = 5;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_GBT1"])
        {
          uint64_t v10 = 6;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_GBT2"])
        {
          uint64_t v10 = 7;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_MENNEKES"])
        {
          uint64_t v10 = 8;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_NACS_AC"])
        {
          uint64_t v10 = 9;
        }
        else if ([v9 isEqualToString:@"CONNECTOR_TYPE_NACS_DC"])
        {
          uint64_t v10 = 10;
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_36;
        }
        uint64_t v10 = [v8 intValue];
      }
      [a1 setChargingConnectorType:v10];
LABEL_36:

      if (a3) {
        v11 = @"chargingLevel";
      }
      else {
        v11 = @"charging_level";
      }
      v12 = [v5 objectForKeyedSubscript:v11];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = v12;
        if ([v13 isEqualToString:@"LEVEL_UNKNOWN"])
        {
          uint64_t v14 = 0;
        }
        else if ([v13 isEqualToString:@"LEVEL_ONE"])
        {
          uint64_t v14 = 1;
        }
        else if ([v13 isEqualToString:@"LEVEL_TWO"])
        {
          uint64_t v14 = 2;
        }
        else if ([v13 isEqualToString:@"LEVEL_THREE"])
        {
          uint64_t v14 = 3;
        }
        else
        {
          uint64_t v14 = 0;
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_53:

          goto LABEL_54;
        }
        uint64_t v14 = [v12 intValue];
      }
      [a1 setChargingLevel:v14];
      goto LABEL_53;
    }
  }
LABEL_54:

  return a1;
}

- (GEOPDEvChargingPort)initWithJSON:(id)a3
{
  return (GEOPDEvChargingPort *)-[GEOPDEvChargingPort _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDEvChargingPortIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDEvChargingPortReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
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
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [(GEOPDEvChargingPort *)self readAll:0];
  char flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    v5[6] = self->_power;
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
  v5[4] = self->_chargingConnectorType;
  *((unsigned char *)v5 + 28) |= 1u;
  if ((*(unsigned char *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v5[5] = self->_chargingLevel;
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
    *(_DWORD *)(v4 + 16) = self->_chargingConnectorType;
    *(unsigned char *)(v4 + 28) |= 1u;
    if ((*(unsigned char *)&self->_flags & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v4 + 24) = self->_power;
  *(unsigned char *)(v4 + 28) |= 4u;
  char flags = (char)self->_flags;
  if (flags) {
    goto LABEL_7;
  }
LABEL_3:
  if ((flags & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v4 + 20) = self->_chargingLevel;
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
  [(GEOPDEvChargingPort *)self readAll:1];
  [v4 readAll:1];
  if ((*(unsigned char *)&self->_flags & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0 || self->_power != *((_DWORD *)v4 + 6)) {
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
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_chargingConnectorType != *((_DWORD *)v4 + 4)) {
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
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_chargingLevel != *((_DWORD *)v4 + 5)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  [(GEOPDEvChargingPort *)self readAll:1];
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
  uint64_t v3 = 2654435761 * self->_power;
  if ((*(unsigned char *)&self->_flags & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_chargingConnectorType;
  if ((*(unsigned char *)&self->_flags & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_chargingLevel;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v5 = a3;
  [v5 readAll:0];
  char v4 = *((unsigned char *)v5 + 28);
  if ((v4 & 4) != 0)
  {
    self->_power = *((_DWORD *)v5 + 6);
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
  self->_chargingConnectorType = *((_DWORD *)v5 + 4);
  *(unsigned char *)&self->_flags |= 1u;
  if ((*((unsigned char *)v5 + 28) & 2) != 0)
  {
LABEL_4:
    self->_chargingLevel = *((_DWORD *)v5 + 5);
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
    [(GEOPDEvChargingPort *)self readAll:0];
  }
}

- (void).cxx_destruct
{
}

@end