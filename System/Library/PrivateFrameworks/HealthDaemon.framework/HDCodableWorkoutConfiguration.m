@interface HDCodableWorkoutConfiguration
- (BOOL)hasActivityType;
- (BOOL)hasLocationType;
- (BOOL)hasWLengthUnitString;
- (BOOL)hasWLengthValue;
- (BOOL)hasWLocationType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)wLengthUnitString;
- (double)wLengthValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)activityType;
- (int64_t)locationType;
- (int64_t)wLocationType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActivityType:(int64_t)a3;
- (void)setHasActivityType:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasWLengthValue:(BOOL)a3;
- (void)setHasWLocationType:(BOOL)a3;
- (void)setLocationType:(int64_t)a3;
- (void)setWLengthUnitString:(id)a3;
- (void)setWLengthValue:(double)a3;
- (void)setWLocationType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutConfiguration

- (void)setActivityType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activityType = a3;
}

- (void)setHasActivityType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLocationType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWLocationType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_wLocationType = a3;
}

- (void)setHasWLocationType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasWLocationType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setWLengthValue:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_wLengthValue = a3;
}

- (void)setHasWLengthValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasWLengthValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasWLengthUnitString
{
  return self->_wLengthUnitString != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutConfiguration;
  v4 = [(HDCodableWorkoutConfiguration *)&v8 description];
  v5 = [(HDCodableWorkoutConfiguration *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_activityType];
    [v3 setObject:v8 forKey:@"activityType"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v9 = [NSNumber numberWithLongLong:self->_locationType];
  [v3 setObject:v9 forKey:@"locationType"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v10 = [NSNumber numberWithLongLong:self->_wLocationType];
  [v3 setObject:v10 forKey:@"wLocationType"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithDouble:self->_wLengthValue];
    [v3 setObject:v5 forKey:@"wLengthValue"];
  }
LABEL_6:
  wLengthUnitString = self->_wLengthUnitString;
  if (wLengthUnitString) {
    [v3 setObject:wLengthUnitString forKey:@"wLengthUnitString"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_6:
  if (self->_wLengthUnitString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_activityType;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_locationType;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  v4[4] = self->_wLocationType;
  *((unsigned char *)v4 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[3] = *(void *)&self->_wLengthValue;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_6:
  if (self->_wLengthUnitString)
  {
    id v6 = v4;
    objc_msgSend(v4, "setWLengthUnitString:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_activityType;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 32) = self->_wLocationType;
      *(unsigned char *)(v5 + 48) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_locationType;
  *(unsigned char *)(v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(double *)(v5 + 24) = self->_wLengthValue;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_6:
  uint64_t v8 = [(NSString *)self->_wLengthUnitString copyWithZone:a3];
  v9 = (void *)v6[5];
  v6[5] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_activityType != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_24:
    char v6 = 0;
    goto LABEL_25;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_locationType != *((void *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_wLocationType != *((void *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_wLengthValue != *((double *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  wLengthUnitString = self->_wLengthUnitString;
  if ((unint64_t)wLengthUnitString | *((void *)v4 + 5)) {
    char v6 = -[NSString isEqual:](wLengthUnitString, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_25:

  return v6;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_activityType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_locationType;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v10 = 0;
      return v4 ^ v3 ^ v5 ^ v10 ^ [(NSString *)self->_wLengthUnitString hash];
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_wLocationType;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double wLengthValue = self->_wLengthValue;
  double v7 = -wLengthValue;
  if (wLengthValue >= 0.0) {
    double v7 = self->_wLengthValue;
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
  return v4 ^ v3 ^ v5 ^ v10 ^ [(NSString *)self->_wLengthUnitString hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_activityType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_locationType = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  self->_wLocationType = *((void *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_5:
    self->_double wLengthValue = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  if (*((void *)v4 + 5))
  {
    id v6 = v4;
    -[HDCodableWorkoutConfiguration setWLengthUnitString:](self, "setWLengthUnitString:");
    id v4 = v6;
  }
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (int64_t)wLocationType
{
  return self->_wLocationType;
}

- (double)wLengthValue
{
  return self->_wLengthValue;
}

- (NSString)wLengthUnitString
{
  return self->_wLengthUnitString;
}

- (void)setWLengthUnitString:(id)a3
{
}

- (void).cxx_destruct
{
}

@end