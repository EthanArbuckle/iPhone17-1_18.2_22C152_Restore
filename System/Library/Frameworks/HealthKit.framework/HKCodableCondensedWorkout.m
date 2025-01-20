@interface HKCodableCondensedWorkout
- (BOOL)hasCondenserDate;
- (BOOL)hasCondenserVersion;
- (BOOL)hasCreationDate;
- (BOOL)hasDuration;
- (BOOL)hasEndDate;
- (BOOL)hasPersistentID;
- (BOOL)hasStartDate;
- (BOOL)hasType;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)uuid;
- (double)condenserDate;
- (double)creationDate;
- (double)duration;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)condenserVersion;
- (int64_t)persistentID;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCondenserDate:(double)a3;
- (void)setCondenserVersion:(int64_t)a3;
- (void)setCreationDate:(double)a3;
- (void)setDuration:(double)a3;
- (void)setEndDate:(double)a3;
- (void)setHasCondenserDate:(BOOL)a3;
- (void)setHasCondenserVersion:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasPersistentID:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setPersistentID:(int64_t)a3;
- (void)setStartDate:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableCondensedWorkout

- (void)setPersistentID:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_persistentID = a3;
}

- (void)setHasPersistentID:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasPersistentID
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (void)setCreationDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCreationDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCondenserVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_condenserVersion = a3;
}

- (void)setHasCondenserVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCondenserVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCondenserDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_condenserDate = a3;
}

- (void)setHasCondenserDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCondenserDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableCondensedWorkout;
  v4 = [(HKCodableCondensedWorkout *)&v8 description];
  v5 = [(HKCodableCondensedWorkout *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4 = [NSNumber numberWithLongLong:self->_persistentID];
    [v3 setObject:v4 forKey:@"persistentID"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [NSNumber numberWithDouble:self->_creationDate];
    [v3 setObject:v9 forKey:@"creationDate"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v10 = [NSNumber numberWithDouble:self->_startDate];
  [v3 setObject:v10 forKey:@"startDate"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v11 = [NSNumber numberWithDouble:self->_endDate];
  [v3 setObject:v11 forKey:@"endDate"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithLongLong:self->_type];
  [v3 setObject:v12 forKey:@"type"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithDouble:self->_duration];
  [v3 setObject:v13 forKey:@"duration"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  v14 = [NSNumber numberWithLongLong:self->_condenserVersion];
  [v3 setObject:v14 forKey:@"condenserVersion"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    v7 = [NSNumber numberWithDouble:self->_condenserDate];
    [v3 setObject:v7 forKey:@"condenserDate"];
  }
LABEL_13:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableCondensedWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  PBDataWriterWriteInt64Field();
  if (*(unsigned char *)&self->_has) {
LABEL_12:
  }
    PBDataWriterWriteDoubleField();
LABEL_13:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v4[6] = self->_persistentID;
    *((unsigned char *)v4 + 80) |= 0x20u;
  }
  if (self->_uuid)
  {
    v6 = v4;
    objc_msgSend(v4, "setUuid:");
    v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_creationDate;
    *((unsigned char *)v4 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_7;
  }
  v4[7] = *(void *)&self->_startDate;
  *((unsigned char *)v4 + 80) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  v4[5] = *(void *)&self->_endDate;
  *((unsigned char *)v4 + 80) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[8] = self->_type;
  *((unsigned char *)v4 + 80) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[4] = *(void *)&self->_duration;
  *((unsigned char *)v4 + 80) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  v4[2] = self->_condenserVersion;
  *((unsigned char *)v4 + 80) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_12:
    v4[1] = *(void *)&self->_condenserDate;
    *((unsigned char *)v4 + 80) |= 1u;
  }
LABEL_13:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_persistentID;
    *(unsigned char *)(v5 + 80) |= 0x20u;
  }
  uint64_t v7 = [(NSData *)self->_uuid copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v6 + 24) = self->_creationDate;
    *(unsigned char *)(v6 + 80) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x10) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v6 + 56) = self->_startDate;
  *(unsigned char *)(v6 + 80) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(double *)(v6 + 40) = self->_endDate;
  *(unsigned char *)(v6 + 80) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(void *)(v6 + 64) = self->_type;
  *(unsigned char *)(v6 + 80) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    *(void *)(v6 + 16) = self->_condenserVersion;
    *(unsigned char *)(v6 + 80) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return (id)v6;
    }
    goto LABEL_10;
  }
LABEL_16:
  *(double *)(v6 + 32) = self->_duration;
  *(unsigned char *)(v6 + 80) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if (has)
  {
LABEL_10:
    *(double *)(v6 + 8) = self->_condenserDate;
    *(unsigned char *)(v6 + 80) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x20) == 0 || self->_persistentID != *((void *)v4 + 6)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x20) != 0)
  {
    goto LABEL_44;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 9))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_44;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 4) == 0 || self->_creationDate != *((double *)v4 + 3)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x40) == 0 || self->_startDate != *((double *)v4 + 7)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x10) == 0 || self->_endDate != *((double *)v4 + 5)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 80) & 0x80) == 0) {
      goto LABEL_27;
    }
LABEL_44:
    BOOL v7 = 0;
    goto LABEL_45;
  }
  if ((*((unsigned char *)v4 + 80) & 0x80) == 0 || self->_type != *((void *)v4 + 8)) {
    goto LABEL_44;
  }
LABEL_27:
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 8) == 0 || self->_duration != *((double *)v4 + 4)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 80) & 2) == 0 || self->_condenserVersion != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 2) != 0)
  {
    goto LABEL_44;
  }
  BOOL v7 = (*((unsigned char *)v4 + 80) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 80) & 1) == 0 || self->_condenserDate != *((double *)v4 + 1)) {
      goto LABEL_44;
    }
    BOOL v7 = 1;
  }
LABEL_45:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v33 = 2654435761 * self->_persistentID;
  }
  else {
    uint64_t v33 = 0;
  }
  uint64_t v3 = [(NSData *)self->_uuid hash];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double creationDate = self->_creationDate;
    double v7 = -creationDate;
    if (creationDate >= 0.0) {
      double v7 = self->_creationDate;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double startDate = self->_startDate;
    double v12 = -startDate;
    if (startDate >= 0.0) {
      double v12 = self->_startDate;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double endDate = self->_endDate;
    double v17 = -endDate;
    if (endDate >= 0.0) {
      double v17 = self->_endDate;
    }
    long double v18 = floor(v17 + 0.5);
    double v19 = (v17 - v18) * 1.84467441e19;
    unint64_t v15 = 2654435761u * (unint64_t)fmod(v18, 1.84467441e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0) {
        v15 += (unint64_t)v19;
      }
    }
    else
    {
      v15 -= (unint64_t)fabs(v19);
    }
  }
  else
  {
    unint64_t v15 = 0;
  }
  if (has < 0)
  {
    uint64_t v20 = 2654435761 * self->_type;
    if ((has & 8) == 0) {
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v20 = 0;
    if ((has & 8) == 0)
    {
LABEL_30:
      unint64_t v21 = 0;
      goto LABEL_38;
    }
  }
  double duration = self->_duration;
  double v23 = -duration;
  if (duration >= 0.0) {
    double v23 = self->_duration;
  }
  long double v24 = floor(v23 + 0.5);
  double v25 = (v23 - v24) * 1.84467441e19;
  unint64_t v21 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0) {
      v21 += (unint64_t)v25;
    }
  }
  else
  {
    v21 -= (unint64_t)fabs(v25);
  }
LABEL_38:
  if ((has & 2) != 0)
  {
    uint64_t v26 = 2654435761 * self->_condenserVersion;
    if (has) {
      goto LABEL_40;
    }
LABEL_45:
    unint64_t v31 = 0;
    return v3 ^ v33 ^ v5 ^ v10 ^ v15 ^ v20 ^ v21 ^ v26 ^ v31;
  }
  uint64_t v26 = 0;
  if ((has & 1) == 0) {
    goto LABEL_45;
  }
LABEL_40:
  double condenserDate = self->_condenserDate;
  double v28 = -condenserDate;
  if (condenserDate >= 0.0) {
    double v28 = self->_condenserDate;
  }
  long double v29 = floor(v28 + 0.5);
  double v30 = (v28 - v29) * 1.84467441e19;
  unint64_t v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0) {
      v31 += (unint64_t)v30;
    }
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
  return v3 ^ v33 ^ v5 ^ v10 ^ v15 ^ v20 ^ v21 ^ v26 ^ v31;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 80) & 0x20) != 0)
  {
    self->_persistentID = *((void *)v4 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
  }
  if (*((void *)v4 + 9))
  {
    id v6 = v4;
    -[HKCodableCondensedWorkout setUuid:](self, "setUuid:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 4) != 0)
  {
    self->_double creationDate = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 80);
    if ((v5 & 0x40) == 0)
    {
LABEL_7:
      if ((v5 & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 80) & 0x40) == 0)
  {
    goto LABEL_7;
  }
  self->_double startDate = *((double *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_double endDate = *((double *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 0x80) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_type = *((void *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double duration = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 80);
  if ((v5 & 2) == 0)
  {
LABEL_11:
    if ((v5 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_21:
  self->_condenserVersion = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 80))
  {
LABEL_12:
    self->_double condenserDate = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_13:
}

- (int64_t)persistentID
{
  return self->_persistentID;
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)creationDate
{
  return self->_creationDate;
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (int64_t)condenserVersion
{
  return self->_condenserVersion;
}

- (double)condenserDate
{
  return self->_condenserDate;
}

- (void).cxx_destruct
{
}

@end