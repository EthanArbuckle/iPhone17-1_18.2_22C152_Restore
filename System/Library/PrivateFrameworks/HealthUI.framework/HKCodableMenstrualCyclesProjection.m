@interface HKCodableMenstrualCyclesProjection
- (BOOL)hasAllDays;
- (BOOL)hasDaysOffsetFromCalendarMethod;
- (BOOL)hasEndMean;
- (BOOL)hasEndStandardDeviation;
- (BOOL)hasIsPartiallyLogged;
- (BOOL)hasPredictionPrimarySource;
- (BOOL)hasStartMean;
- (BOOL)hasStartStandardDeviation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPartiallyLogged;
- (BOOL)readFrom:(id)a3;
- (HKCodableDayIndexRange)allDays;
- (double)endMean;
- (double)endStandardDeviation;
- (double)startMean;
- (double)startStandardDeviation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)daysOffsetFromCalendarMethod;
- (int64_t)predictionPrimarySource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAllDays:(id)a3;
- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3;
- (void)setEndMean:(double)a3;
- (void)setEndStandardDeviation:(double)a3;
- (void)setHasDaysOffsetFromCalendarMethod:(BOOL)a3;
- (void)setHasEndMean:(BOOL)a3;
- (void)setHasEndStandardDeviation:(BOOL)a3;
- (void)setHasIsPartiallyLogged:(BOOL)a3;
- (void)setHasPredictionPrimarySource:(BOOL)a3;
- (void)setHasStartMean:(BOOL)a3;
- (void)setHasStartStandardDeviation:(BOOL)a3;
- (void)setIsPartiallyLogged:(BOOL)a3;
- (void)setPredictionPrimarySource:(int64_t)a3;
- (void)setStartMean:(double)a3;
- (void)setStartStandardDeviation:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableMenstrualCyclesProjection

- (void)setStartMean:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_startMean = a3;
}

- (void)setHasStartMean:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasStartMean
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setStartStandardDeviation:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startStandardDeviation = a3;
}

- (void)setHasStartStandardDeviation:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartStandardDeviation
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setEndMean:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_endMean = a3;
}

- (void)setHasEndMean:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEndMean
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEndStandardDeviation:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_endStandardDeviation = a3;
}

- (void)setHasEndStandardDeviation:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasEndStandardDeviation
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasAllDays
{
  return self->_allDays != 0;
}

- (void)setIsPartiallyLogged:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isPartiallyLogged = a3;
}

- (void)setHasIsPartiallyLogged:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsPartiallyLogged
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_daysOffsetFromCalendarMethod = a3;
}

- (void)setHasDaysOffsetFromCalendarMethod:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDaysOffsetFromCalendarMethod
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setPredictionPrimarySource:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_predictionPrimarySource = a3;
}

- (void)setHasPredictionPrimarySource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPredictionPrimarySource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableMenstrualCyclesProjection;
  v4 = [(HKCodableMenstrualCyclesProjection *)&v8 description];
  v5 = [(HKCodableMenstrualCyclesProjection *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_startMean];
    [v3 setObject:v11 forKey:@"startMean"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v12 = [NSNumber numberWithDouble:self->_startStandardDeviation];
  [v3 setObject:v12 forKey:@"startStandardDeviation"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  v13 = [NSNumber numberWithDouble:self->_endMean];
  [v3 setObject:v13 forKey:@"endMean"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v5 = [NSNumber numberWithDouble:self->_endStandardDeviation];
    [v3 setObject:v5 forKey:@"endStandardDeviation"];
  }
LABEL_6:
  allDays = self->_allDays;
  if (allDays)
  {
    v7 = [(HKCodableDayIndexRange *)allDays dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"allDays"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 0x40) != 0)
  {
    v14 = [NSNumber numberWithBool:self->_isPartiallyLogged];
    [v3 setObject:v14 forKey:@"isPartiallyLogged"];

    char v8 = (char)self->_has;
    if ((v8 & 1) == 0)
    {
LABEL_10:
      if ((v8 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  v15 = [NSNumber numberWithLongLong:self->_daysOffsetFromCalendarMethod];
  [v3 setObject:v15 forKey:@"daysOffsetFromCalendarMethod"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    v9 = [NSNumber numberWithLongLong:self->_predictionPrimarySource];
    [v3 setObject:v9 forKey:@"predictionPrimarySource"];
  }
LABEL_12:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableMenstrualCyclesProjectionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_5:
  }
    PBDataWriterWriteDoubleField();
LABEL_6:
  if (self->_allDays) {
    PBDataWriterWriteSubmessage();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_10:
      if ((v5 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_11:
  }
    PBDataWriterWriteInt64Field();
LABEL_12:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v4[5] = *(void *)&self->_startMean;
    *((unsigned char *)v4 + 68) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = *(void *)&self->_startStandardDeviation;
  *((unsigned char *)v4 + 68) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_17:
  v4[2] = *(void *)&self->_endMean;
  *((unsigned char *)v4 + 68) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    v4[3] = *(void *)&self->_endStandardDeviation;
    *((unsigned char *)v4 + 68) |= 4u;
  }
LABEL_6:
  if (self->_allDays)
  {
    v7 = v4;
    objc_msgSend(v4, "setAllDays:");
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_isPartiallyLogged;
    *((unsigned char *)v4 + 68) |= 0x40u;
    char v6 = (char)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_10:
      if ((v6 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_10;
  }
  v4[1] = self->_daysOffsetFromCalendarMethod;
  *((unsigned char *)v4 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_11:
    v4[4] = self->_predictionPrimarySource;
    *((unsigned char *)v4 + 68) |= 8u;
  }
LABEL_12:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(double *)(v5 + 40) = self->_startMean;
    *(unsigned char *)(v5 + 68) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_startStandardDeviation;
  *(unsigned char *)(v5 + 68) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *(double *)(v5 + 16) = self->_endMean;
  *(unsigned char *)(v5 + 68) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_5:
    *(double *)(v5 + 24) = self->_endStandardDeviation;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
LABEL_6:
  id v8 = [(HKCodableDayIndexRange *)self->_allDays copyWithZone:a3];
  v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 0x40) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_8;
    }
LABEL_16:
    *(void *)(v6 + 8) = self->_daysOffsetFromCalendarMethod;
    *(unsigned char *)(v6 + 68) |= 1u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v6;
    }
    goto LABEL_9;
  }
  *(unsigned char *)(v6 + 64) = self->_isPartiallyLogged;
  *(unsigned char *)(v6 + 68) |= 0x40u;
  char v10 = (char)self->_has;
  if (v10) {
    goto LABEL_16;
  }
LABEL_8:
  if ((v10 & 8) != 0)
  {
LABEL_9:
    *(void *)(v6 + 32) = self->_predictionPrimarySource;
    *(unsigned char *)(v6 + 68) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_startMean != *((double *)v4 + 5)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x20) == 0 || self->_startStandardDeviation != *((double *)v4 + 6)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_endMean != *((double *)v4 + 2)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_endStandardDeviation != *((double *)v4 + 3)) {
      goto LABEL_42;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_42;
  }
  allDays = self->_allDays;
  if ((unint64_t)allDays | *((void *)v4 + 7))
  {
    if (!-[HKCodableDayIndexRange isEqual:](allDays, "isEqual:")) {
      goto LABEL_42;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x40) != 0)
    {
      if (self->_isPartiallyLogged)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_42;
        }
        goto LABEL_33;
      }
      if (!*((unsigned char *)v4 + 64)) {
        goto LABEL_33;
      }
    }
LABEL_42:
    BOOL v7 = 0;
    goto LABEL_43;
  }
  if ((*((unsigned char *)v4 + 68) & 0x40) != 0) {
    goto LABEL_42;
  }
LABEL_33:
  if (has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_daysOffsetFromCalendarMethod != *((void *)v4 + 1)) {
      goto LABEL_42;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_42;
  }
  BOOL v7 = (*((unsigned char *)v4 + 68) & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_predictionPrimarySource != *((void *)v4 + 4)) {
      goto LABEL_42;
    }
    BOOL v7 = 1;
  }
LABEL_43:

  return v7;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    double startMean = self->_startMean;
    double v6 = -startMean;
    if (startMean >= 0.0) {
      double v6 = self->_startMean;
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
  if ((has & 0x20) != 0)
  {
    double startStandardDeviation = self->_startStandardDeviation;
    double v11 = -startStandardDeviation;
    if (startStandardDeviation >= 0.0) {
      double v11 = self->_startStandardDeviation;
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
  if ((has & 2) != 0)
  {
    double endMean = self->_endMean;
    double v16 = -endMean;
    if (endMean >= 0.0) {
      double v16 = self->_endMean;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 4) != 0)
  {
    double endStandardDeviation = self->_endStandardDeviation;
    double v21 = -endStandardDeviation;
    if (endStandardDeviation >= 0.0) {
      double v21 = self->_endStandardDeviation;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  unint64_t v24 = [(HKCodableDayIndexRange *)self->_allDays hash];
  if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    uint64_t v25 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_35;
    }
LABEL_38:
    uint64_t v26 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_36;
    }
LABEL_39:
    uint64_t v27 = 0;
    return v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v26 ^ v27 ^ v24;
  }
  uint64_t v25 = 2654435761 * self->_isPartiallyLogged;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_38;
  }
LABEL_35:
  uint64_t v26 = 2654435761 * self->_daysOffsetFromCalendarMethod;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_39;
  }
LABEL_36:
  uint64_t v27 = 2654435761 * self->_predictionPrimarySource;
  return v9 ^ v4 ^ v14 ^ v19 ^ v25 ^ v26 ^ v27 ^ v24;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (double *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 68);
  if ((v6 & 0x10) != 0)
  {
    self->_double startMean = v4[5];
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 68);
    if ((v6 & 0x20) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_double startStandardDeviation = v4[6];
  *(unsigned char *)&self->_has |= 0x20u;
  char v6 = *((unsigned char *)v4 + 68);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_double endMean = v4[2];
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
LABEL_5:
    self->_double endStandardDeviation = v4[3];
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_6:
  allDays = self->_allDays;
  uint64_t v8 = *((void *)v5 + 7);
  if (allDays)
  {
    if (!v8) {
      goto LABEL_16;
    }
    char v10 = v5;
    allDays = (HKCodableDayIndexRange *)-[HKCodableDayIndexRange mergeFrom:](allDays, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_16;
    }
    char v10 = v5;
    allDays = (HKCodableDayIndexRange *)-[HKCodableMenstrualCyclesProjection setAllDays:](self, "setAllDays:");
  }
  uint64_t v5 = v10;
LABEL_16:
  char v9 = *((unsigned char *)v5 + 68);
  if ((v9 & 0x40) != 0)
  {
    self->_isPartiallyLogged = *((unsigned char *)v5 + 64);
    *(unsigned char *)&self->_has |= 0x40u;
    char v9 = *((unsigned char *)v5 + 68);
    if ((v9 & 1) == 0)
    {
LABEL_18:
      if ((v9 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v5 + 68) & 1) == 0)
  {
    goto LABEL_18;
  }
  self->_daysOffsetFromCalendarMethod = (int64_t)v5[1];
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v5 + 68) & 8) != 0)
  {
LABEL_19:
    self->_predictionPrimarySource = (int64_t)v5[4];
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_20:
  MEMORY[0x1F41817F8](allDays, v5);
}

- (double)startMean
{
  return self->_startMean;
}

- (double)startStandardDeviation
{
  return self->_startStandardDeviation;
}

- (double)endMean
{
  return self->_endMean;
}

- (double)endStandardDeviation
{
  return self->_endStandardDeviation;
}

- (HKCodableDayIndexRange)allDays
{
  return self->_allDays;
}

- (void)setAllDays:(id)a3
{
}

- (BOOL)isPartiallyLogged
{
  return self->_isPartiallyLogged;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (int64_t)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void).cxx_destruct
{
}

@end