@interface BMPBSemanticLocationEvent
- (BOOL)hasLoiIdentifier;
- (BOOL)hasPlaceType;
- (BOOL)hasStarting;
- (BOOL)hasUserSpecificPlaceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)starting;
- (NSString)loiIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)placeTypeAsString:(int)a3;
- (id)userSpecificPlaceTypeAsString:(int)a3;
- (int)StringAsPlaceType:(id)a3;
- (int)StringAsUserSpecificPlaceType:(id)a3;
- (int)placeType;
- (int)userSpecificPlaceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPlaceType:(BOOL)a3;
- (void)setHasStarting:(BOOL)a3;
- (void)setHasUserSpecificPlaceType:(BOOL)a3;
- (void)setLoiIdentifier:(id)a3;
- (void)setPlaceType:(int)a3;
- (void)setStarting:(BOOL)a3;
- (void)setUserSpecificPlaceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSemanticLocationEvent

- (void)setStarting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_starting = a3;
}

- (void)setHasStarting:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStarting
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (int)userSpecificPlaceType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_userSpecificPlaceType;
  }
  else {
    return 0;
  }
}

- (void)setUserSpecificPlaceType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_userSpecificPlaceType = a3;
}

- (void)setHasUserSpecificPlaceType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUserSpecificPlaceType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)userSpecificPlaceTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E55D7BC8[a3];
  }

  return v3;
}

- (int)StringAsUserSpecificPlaceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unkown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Home"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Work"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"School"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Gym"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)placeType
{
  if (*(unsigned char *)&self->_has) {
    return self->_placeType;
  }
  else {
    return 0;
  }
}

- (void)setPlaceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPlaceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)placeTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E55D7BF0[a3];
  }

  return v3;
}

- (int)StringAsPlaceType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"AreaOfInterest"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PointOfInterest"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Address"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasLoiIdentifier
{
  return self->_loiIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSemanticLocationEvent;
  int v4 = [(BMPBSemanticLocationEvent *)&v8 description];
  v5 = [(BMPBSemanticLocationEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v5 = [NSNumber numberWithBool:self->_starting];
    [v3 setObject:v5 forKey:@"starting"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t userSpecificPlaceType = self->_userSpecificPlaceType;
  if (userSpecificPlaceType >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_userSpecificPlaceType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_1E55D7BC8[userSpecificPlaceType];
  }
  [v3 setObject:v7 forKey:@"userSpecificPlaceType"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_10:
    uint64_t placeType = self->_placeType;
    if (placeType >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_placeType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E55D7BF0[placeType];
    }
    [v3 setObject:v9 forKey:@"placeType"];
  }
LABEL_14:
  loiIdentifier = self->_loiIdentifier;
  if (loiIdentifier) {
    [v3 setObject:loiIdentifier forKey:@"loiIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSemanticLocationEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
  if (self->_loiIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[24] = self->_starting;
    v4[28] |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 5) = self->_userSpecificPlaceType;
  v4[28] |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_4:
    *((_DWORD *)v4 + 4) = self->_placeType;
    v4[28] |= 1u;
  }
LABEL_5:
  if (self->_loiIdentifier)
  {
    id v6 = v4;
    objc_msgSend(v4, "setLoiIdentifier:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 20) = self->_userSpecificPlaceType;
    *(unsigned char *)(v5 + 28) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(unsigned char *)(v5 + 24) = self->_starting;
  *(unsigned char *)(v5 + 28) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_placeType;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_loiIdentifier copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) != 0)
    {
      if (self->_starting)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_22;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_22:
    char v6 = 0;
    goto LABEL_23;
  }
  if ((*((unsigned char *)v4 + 28) & 4) != 0) {
    goto LABEL_22;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_userSpecificPlaceType != *((_DWORD *)v4 + 5)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_22;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_placeType != *((_DWORD *)v4 + 4)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_22;
  }
  loiIdentifier = self->_loiIdentifier;
  if ((unint64_t)loiIdentifier | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](loiIdentifier, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_23:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_loiIdentifier hash];
  }
  uint64_t v2 = 2654435761 * self->_starting;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_userSpecificPlaceType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_placeType;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_loiIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if ((v5 & 4) != 0)
  {
    self->_starting = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t userSpecificPlaceType = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 28))
  {
LABEL_4:
    self->_uint64_t placeType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[BMPBSemanticLocationEvent setLoiIdentifier:](self, "setLoiIdentifier:");
    id v4 = v6;
  }
}

- (BOOL)starting
{
  return self->_starting;
}

- (NSString)loiIdentifier
{
  return self->_loiIdentifier;
}

- (void)setLoiIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end