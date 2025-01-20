@interface HKCodableHandwashingEvent
- (BOOL)hasAverageDailyCount;
- (BOOL)hasAverageDuration;
- (BOOL)hasCount;
- (BOOL)hasEndDate;
- (BOOL)hasMeetsGoal;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)meetsGoal;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)averageDuration;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)averageDailyCount;
- (int64_t)count;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAverageDailyCount:(int64_t)a3;
- (void)setAverageDuration:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setEndDate:(double)a3;
- (void)setHasAverageDailyCount:(BOOL)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasMeetsGoal:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setMeetsGoal:(BOOL)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableHandwashingEvent

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEndDate:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endDate = a3;
}

- (void)setHasEndDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAverageDuration
{
  return self->_averageDuration != 0;
}

- (void)setCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAverageDailyCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_averageDailyCount = a3;
}

- (void)setHasAverageDailyCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAverageDailyCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMeetsGoal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_meetsGoal = a3;
}

- (void)setHasMeetsGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMeetsGoal
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableHandwashingEvent;
  v4 = [(HKCodableHandwashingEvent *)&v8 description];
  v5 = [(HKCodableHandwashingEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_startDate];
    [v3 setObject:v5 forKey:@"startDate"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = [NSNumber numberWithDouble:self->_endDate];
    [v3 setObject:v6 forKey:@"endDate"];
  }
  averageDuration = self->_averageDuration;
  if (averageDuration)
  {
    objc_super v8 = [(HKCodableQuantity *)averageDuration dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"averageDuration"];
  }
  char v9 = (char)self->_has;
  if ((v9 & 2) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_count];
    [v3 setObject:v12 forKey:@"count"];

    char v9 = (char)self->_has;
    if ((v9 & 1) == 0)
    {
LABEL_9:
      if ((v9 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v13 = [NSNumber numberWithLongLong:self->_averageDailyCount];
  [v3 setObject:v13 forKey:@"averageDailyCount"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    v10 = [NSNumber numberWithBool:self->_meetsGoal];
    [v3 setObject:v10 forKey:@"meetsGoal"];
  }
LABEL_11:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableHandwashingEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_averageDuration) {
    PBDataWriterWriteSubmessage();
  }
  char v5 = (char)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char v5 = (char)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_10:
  }
    PBDataWriterWriteBOOLField();
LABEL_11:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 52) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[3] = *(void *)&self->_endDate;
    *((unsigned char *)v4 + 52) |= 4u;
  }
  if (self->_averageDuration)
  {
    v7 = v4;
    objc_msgSend(v4, "setAverageDuration:");
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[2] = self->_count;
    *((unsigned char *)v4 + 52) |= 2u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_9:
      if ((v6 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v4[1] = self->_averageDailyCount;
  *((unsigned char *)v4 + 52) |= 1u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    *((unsigned char *)v4 + 48) = self->_meetsGoal;
    *((unsigned char *)v4 + 52) |= 0x10u;
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_startDate;
    *(unsigned char *)(v5 + 52) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_endDate;
    *(unsigned char *)(v5 + 52) |= 4u;
  }
  id v8 = [(HKCodableQuantity *)self->_averageDuration copyWithZone:a3];
  char v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(void *)(v6 + 8) = self->_averageDailyCount;
    *(unsigned char *)(v6 + 52) |= 1u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v6;
    }
    goto LABEL_8;
  }
  *(void *)(v6 + 16) = self->_count;
  *(unsigned char *)(v6 + 52) |= 2u;
  char v10 = (char)self->_has;
  if (v10) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v10 & 0x10) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 48) = self->_meetsGoal;
    *(unsigned char *)(v6 + 52) |= 0x10u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) == 0 || self->_startDate != *((double *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    goto LABEL_27;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_endDate != *((double *)v4 + 3)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_27;
  }
  averageDuration = self->_averageDuration;
  if ((unint64_t)averageDuration | *((void *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](averageDuration, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_count != *((void *)v4 + 2)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_averageDailyCount != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_27;
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
    {
      if (self->_meetsGoal)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_27;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_27;
      }
      BOOL v7 = 1;
      goto LABEL_28;
    }
LABEL_27:
    BOOL v7 = 0;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double startDate = self->_startDate;
    double v6 = -startDate;
    if (startDate >= 0.0) {
      double v6 = self->_startDate;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  if ((has & 4) != 0)
  {
    double endDate = self->_endDate;
    double v11 = -endDate;
    if (endDate >= 0.0) {
      double v11 = self->_endDate;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  unint64_t v14 = [(HKCodableQuantity *)self->_averageDuration hash];
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v15 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_19;
    }
LABEL_22:
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_20;
    }
LABEL_23:
    uint64_t v17 = 0;
    return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v14;
  }
  uint64_t v15 = 2654435761 * self->_count;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v16 = 2654435761 * self->_averageDailyCount;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_23;
  }
LABEL_20:
  uint64_t v17 = 2654435761 * self->_meetsGoal;
  return v9 ^ v4 ^ v15 ^ v16 ^ v17 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 52);
  if ((v6 & 8) != 0)
  {
    self->_double startDate = v4[4];
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 52);
  }
  if ((v6 & 4) != 0)
  {
    self->_double endDate = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
  averageDuration = self->_averageDuration;
  uint64_t v8 = *((void *)v5 + 5);
  if (averageDuration)
  {
    if (!v8) {
      goto LABEL_11;
    }
    char v10 = v5;
    averageDuration = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](averageDuration, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    char v10 = v5;
    averageDuration = (HKCodableQuantity *)-[HKCodableHandwashingEvent setAverageDuration:](self, "setAverageDuration:");
  }
  uint64_t v5 = v10;
LABEL_11:
  char v9 = *((unsigned char *)v5 + 52);
  if ((v9 & 2) != 0)
  {
    self->_count = (int64_t)v5[2];
    *(unsigned char *)&self->_has |= 2u;
    char v9 = *((unsigned char *)v5 + 52);
    if ((v9 & 1) == 0)
    {
LABEL_13:
      if ((v9 & 0x10) == 0) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v5 + 52) & 1) == 0)
  {
    goto LABEL_13;
  }
  self->_averageDailyCount = (int64_t)v5[1];
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v5 + 52) & 0x10) != 0)
  {
LABEL_14:
    self->_meetsGoal = *((unsigned char *)v5 + 48);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_15:
  MEMORY[0x1F41817F8](averageDuration, v5);
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (HKCodableQuantity)averageDuration
{
  return self->_averageDuration;
}

- (void)setAverageDuration:(id)a3
{
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)averageDailyCount
{
  return self->_averageDailyCount;
}

- (BOOL)meetsGoal
{
  return self->_meetsGoal;
}

- (void).cxx_destruct
{
}

@end