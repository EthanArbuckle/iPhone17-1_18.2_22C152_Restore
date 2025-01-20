@interface ATXPBPredictionLocationOfInterest
- (BOOL)hasLatitude;
- (BOOL)hasLongitude;
- (BOOL)hasType;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)uuid;
- (double)latitude;
- (double)longitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasLatitude:(BOOL)a3;
- (void)setHasLongitude:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setLatitude:(double)a3;
- (void)setLongitude:(double)a3;
- (void)setType:(int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBPredictionLocationOfInterest

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
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
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68AD990[a3];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
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

- (void)setLatitude:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLatitude
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLongitude:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLongitude
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBPredictionLocationOfInterest;
  int v4 = [(ATXPBPredictionLocationOfInterest *)&v8 description];
  v5 = [(ATXPBPredictionLocationOfInterest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      objc_super v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v8 = off_1E68AD990[type];
    }
    [v4 setObject:v8 forKey:@"type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = [NSNumber numberWithDouble:self->_latitude];
    [v4 setObject:v9 forKey:@"latitude"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_longitude];
    [v4 setObject:v10 forKey:@"longitude"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBPredictionLocationOfInterestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_uuid)
  {
    id v6 = v4;
    objc_msgSend(v4, "setUuid:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_type;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = *(void *)&self->_latitude;
  *((unsigned char *)v4 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((void *)v4 + 2) = *(void *)&self->_longitude;
    *((unsigned char *)v4 + 40) |= 2u;
  }
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_uuid copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(double *)(v5 + 8) = self->_latitude;
    *(unsigned char *)(v5 + 40) |= 1u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 24) = self->_type;
  *(unsigned char *)(v5 + 40) |= 4u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *(double *)(v5 + 16) = self->_longitude;
    *(unsigned char *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_type != *((_DWORD *)v4 + 6)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_latitude != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_longitude != *((double *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_uuid hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double latitude = self->_latitude;
  double v7 = -latitude;
  if (latitude >= 0.0) {
    double v7 = self->_latitude;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  if ((has & 2) != 0)
  {
    double longitude = self->_longitude;
    double v13 = -longitude;
    if (longitude >= 0.0) {
      double v13 = self->_longitude;
    }
    long double v14 = floor(v13 + 0.5);
    double v15 = (v13 - v14) * 1.84467441e19;
    unint64_t v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0) {
        v11 += (unint64_t)v15;
      }
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[ATXPBPredictionLocationOfInterest setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_uint64_t type = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_double latitude = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_6:
    self->_double longitude = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void).cxx_destruct
{
}

@end