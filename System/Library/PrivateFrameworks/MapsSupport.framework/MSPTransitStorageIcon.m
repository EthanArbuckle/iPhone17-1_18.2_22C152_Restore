@interface MSPTransitStorageIcon
- (BOOL)hasCartoID;
- (BOOL)hasDefaultTransitType;
- (BOOL)hasIconAttributeKey;
- (BOOL)hasIconAttributeValue;
- (BOOL)hasIconType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MSPTransitStorageIcon)initWithIcon:(id)a3;
- (NSString)description;
- (PBUnknownFields)unknownFields;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)iconTypeAsString:(int)a3;
- (int)StringAsIconType:(id)a3;
- (int)iconType;
- (unint64_t)hash;
- (unsigned)cartoID;
- (unsigned)defaultTransitType;
- (unsigned)iconAttributeKey;
- (unsigned)iconAttributeValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCartoID:(unsigned int)a3;
- (void)setDefaultTransitType:(unsigned int)a3;
- (void)setHasCartoID:(BOOL)a3;
- (void)setHasDefaultTransitType:(BOOL)a3;
- (void)setHasIconAttributeKey:(BOOL)a3;
- (void)setHasIconAttributeValue:(BOOL)a3;
- (void)setHasIconType:(BOOL)a3;
- (void)setIconAttributeKey:(unsigned int)a3;
- (void)setIconAttributeValue:(unsigned int)a3;
- (void)setIconType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MSPTransitStorageIcon

- (MSPTransitStorageIcon)initWithIcon:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIcon;
  v5 = [(MSPTransitStorageIcon *)&v8 init];
  if (v5)
  {
    -[MSPTransitStorageIcon setIconType:](v5, "setIconType:", [v4 iconType]);
    -[MSPTransitStorageIcon setCartoID:](v5, "setCartoID:", [v4 cartoID]);
    -[MSPTransitStorageIcon setDefaultTransitType:](v5, "setDefaultTransitType:", [v4 defaultTransitType]);
    -[MSPTransitStorageIcon setIconAttributeKey:](v5, "setIconAttributeKey:", [v4 iconAttributeKey]);
    -[MSPTransitStorageIcon setIconAttributeValue:](v5, "setIconAttributeValue:", [v4 iconAttributeValue]);
    v6 = v5;
  }

  return v5;
}

- (void)setIconType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_iconType = a3;
}

- (void)setHasIconType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIconType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)iconTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      id v4 = @"GEOTransitIconTypeGeneric";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", a3);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v4 = @"GEOTransitIconTypeSystem";
  }
  return v4;
}

- (int)StringAsIconType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GEOTransitIconTypeSystem"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"GEOTransitIconTypeGeneric"];
  }

  return v4;
}

- (void)setCartoID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cartoID = a3;
}

- (void)setHasCartoID:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCartoID
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDefaultTransitType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_defaultTransitType = a3;
}

- (void)setHasDefaultTransitType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDefaultTransitType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIconAttributeKey:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_iconAttributeKey = a3;
}

- (void)setHasIconAttributeKey:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIconAttributeKey
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIconAttributeValue:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_iconAttributeValue = a3;
}

- (void)setHasIconAttributeValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIconAttributeValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MSPTransitStorageIcon;
  int v4 = [(MSPTransitStorageIcon *)&v8 description];
  v5 = [(MSPTransitStorageIcon *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    int iconType = self->_iconType;
    if (iconType)
    {
      if (iconType == 1)
      {
        v6 = @"GEOTransitIconTypeGeneric";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", iconType);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v6 = @"GEOTransitIconTypeSystem";
    }
    [v3 setObject:v6 forKey:@"icon_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v11 = [NSNumber numberWithUnsignedInt:self->_cartoID];
    [v3 setObject:v11 forKey:@"cartoID"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_10:
      if ((has & 4) == 0) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_10;
  }
  v12 = [NSNumber numberWithUnsignedInt:self->_defaultTransitType];
  [v3 setObject:v12 forKey:@"default_transit_type"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_20:
  v13 = [NSNumber numberWithUnsignedInt:self->_iconAttributeKey];
  [v3 setObject:v13 forKey:@"icon_attribute_key"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_12:
    v7 = [NSNumber numberWithUnsignedInt:self->_iconAttributeValue];
    [v3 setObject:v7 forKey:@"icon_attribute_value"];
  }
LABEL_13:
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v9 = [(PBUnknownFields *)unknownFields dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"Unknown Fields"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MSPTransitStorageIconReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_6:
  }
    PBDataWriterWriteUint32Field();
LABEL_7:
  [(PBUnknownFields *)self->_unknownFields writeTo:v5];
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[8] = self->_iconType;
    *((unsigned char *)v4 + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_cartoID;
  *((unsigned char *)v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v4[5] = self->_defaultTransitType;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v4[6] = self->_iconAttributeKey;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_6:
    v4[7] = self->_iconAttributeValue;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v5 = (void *)v4;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_iconType;
    *(unsigned char *)(v4 + 36) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 16) = self->_cartoID;
  *(unsigned char *)(v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    *(_DWORD *)(v4 + 24) = self->_iconAttributeKey;
    *(unsigned char *)(v4 + 36) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_10:
  *(_DWORD *)(v4 + 20) = self->_defaultTransitType;
  *(unsigned char *)(v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_DWORD *)(v4 + 28) = self->_iconAttributeValue;
    *(unsigned char *)(v4 + 36) |= 8u;
  }
LABEL_7:
  objc_storeStrong((id *)(v4 + 8), self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_iconType != *((_DWORD *)v4 + 8)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
LABEL_26:
    BOOL v5 = 0;
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_cartoID != *((_DWORD *)v4 + 4)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_defaultTransitType != *((_DWORD *)v4 + 5)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_iconAttributeKey != *((_DWORD *)v4 + 6)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_26;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_iconAttributeValue != *((_DWORD *)v4 + 7)) {
      goto LABEL_26;
    }
    BOOL v5 = 1;
  }
LABEL_27:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v2 = 2654435761 * self->_iconType;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_cartoID;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_defaultTransitType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_iconAttributeKey;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_iconAttributeValue;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) != 0)
  {
    self->_int iconType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_cartoID = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_defaultTransitType = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_iconAttributeKey = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_6:
    self->_iconAttributeValue = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_7:
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (int)iconType
{
  return self->_iconType;
}

- (unsigned)cartoID
{
  return self->_cartoID;
}

- (unsigned)defaultTransitType
{
  return self->_defaultTransitType;
}

- (unsigned)iconAttributeKey
{
  return self->_iconAttributeKey;
}

- (unsigned)iconAttributeValue
{
  return self->_iconAttributeValue;
}

- (void).cxx_destruct
{
}

@end