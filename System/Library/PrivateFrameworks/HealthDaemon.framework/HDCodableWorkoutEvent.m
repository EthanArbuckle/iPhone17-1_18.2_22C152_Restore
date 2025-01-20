@interface HDCodableWorkoutEvent
- (BOOL)hasDate;
- (BOOL)hasDuration;
- (BOOL)hasMetadataDictionary;
- (BOOL)hasSwimmingStrokeStyle;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableMetadataDictionary)metadataDictionary;
- (double)date;
- (double)duration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decodedDateIntervalStartDate;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)swimmingStrokeStyle;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDate:(double)a3;
- (void)setDuration:(double)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasSwimmingStrokeStyle:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMetadataDictionary:(id)a3;
- (void)setSwimmingStrokeStyle:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableWorkoutEvent

- (void)setType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDate:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSwimmingStrokeStyle:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_swimmingStrokeStyle = a3;
}

- (void)setHasSwimmingStrokeStyle:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSwimmingStrokeStyle
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasMetadataDictionary
{
  return self->_metadataDictionary != 0;
}

- (void)setDuration:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableWorkoutEvent;
  v4 = [(HDCodableWorkoutEvent *)&v8 description];
  v5 = [(HDCodableWorkoutEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v10 forKey:@"type"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v11 = [NSNumber numberWithDouble:self->_date];
  [v3 setObject:v11 forKey:@"date"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_swimmingStrokeStyle];
    [v3 setObject:v5 forKey:@"swimmingStrokeStyle"];
  }
LABEL_5:
  metadataDictionary = self->_metadataDictionary;
  if (metadataDictionary)
  {
    v7 = [(HDCodableMetadataDictionary *)metadataDictionary dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"metadataDictionary"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithDouble:self->_duration];
    [v3 setObject:v8 forKey:@"duration"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableWorkoutEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_metadataDictionary) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = self->_type;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = *(void *)&self->_date;
  *((unsigned char *)v4 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_swimmingStrokeStyle;
    *((unsigned char *)v4 + 48) |= 4u;
  }
LABEL_5:
  if (self->_metadataDictionary)
  {
    v6 = v4;
    objc_msgSend(v4, "setMetadataDictionary:");
    v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = *(void *)&self->_duration;
    *((unsigned char *)v4 + 48) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_type;
    *(unsigned char *)(v5 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 8) = self->_date;
  *(unsigned char *)(v5 + 48) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_swimmingStrokeStyle;
    *(unsigned char *)(v5 + 48) |= 4u;
  }
LABEL_5:
  id v8 = [(HDCodableMetadataDictionary *)self->_metadataDictionary copyWithZone:a3];
  v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_duration;
    *(unsigned char *)(v6 + 48) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 48);
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_type != *((void *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_date != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_swimmingStrokeStyle != *((void *)v4 + 3)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_24;
  }
  metadataDictionary = self->_metadataDictionary;
  if ((unint64_t)metadataDictionary | *((void *)v4 + 5))
  {
    if (!-[HDCodableMetadataDictionary isEqual:](metadataDictionary, "isEqual:"))
    {
LABEL_24:
      BOOL v8 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 48);
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_24;
    }
    BOOL v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_type;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double date = self->_date;
  double v6 = -date;
  if (date >= 0.0) {
    double v6 = self->_date;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) != 0) {
    uint64_t v10 = 2654435761 * self->_swimmingStrokeStyle;
  }
  else {
    uint64_t v10 = 0;
  }
  unint64_t v11 = [(HDCodableMetadataDictionary *)self->_metadataDictionary hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double duration = self->_duration;
    double v14 = -duration;
    if (duration >= 0.0) {
      double v14 = self->_duration;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  return v9 ^ v4 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_type = *((void *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_double date = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_4:
    self->_swimmingStrokeStyle = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  metadataDictionary = self->_metadataDictionary;
  uint64_t v8 = *((void *)v5 + 5);
  if (metadataDictionary)
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = v5;
    -[HDCodableMetadataDictionary mergeFrom:](metadataDictionary, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = v5;
    -[HDCodableWorkoutEvent setMetadataDictionary:](self, "setMetadataDictionary:");
  }
  id v5 = v9;
LABEL_14:
  if ((*((unsigned char *)v5 + 48) & 2) != 0)
  {
    self->_double duration = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)type
{
  return self->_type;
}

- (double)date
{
  return self->_date;
}

- (int64_t)swimmingStrokeStyle
{
  return self->_swimmingStrokeStyle;
}

- (HDCodableMetadataDictionary)metadataDictionary
{
  return self->_metadataDictionary;
}

- (void)setMetadataDictionary:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
}

- (id)decodedDateIntervalStartDate
{
  if ([(HDCodableWorkoutEvent *)self hasDate])
  {
    v2 = HDDecodeDateForValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end