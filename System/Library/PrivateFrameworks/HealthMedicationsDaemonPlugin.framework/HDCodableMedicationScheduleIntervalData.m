@interface HDCodableMedicationScheduleIntervalData
- (BOOL)hasCycleIndex;
- (BOOL)hasCycleIntervalDays;
- (BOOL)hasDayOfWeek;
- (BOOL)hasDose;
- (BOOL)hasStartTimeComponents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableDateComponents)startTimeComponents;
- (double)dose;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)cycleIndex;
- (int64_t)cycleIntervalDays;
- (int64_t)dayOfWeek;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCycleIndex:(int64_t)a3;
- (void)setCycleIntervalDays:(int64_t)a3;
- (void)setDayOfWeek:(int64_t)a3;
- (void)setDose:(double)a3;
- (void)setHasCycleIndex:(BOOL)a3;
- (void)setHasCycleIntervalDays:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasDose:(BOOL)a3;
- (void)setStartTimeComponents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableMedicationScheduleIntervalData

- (void).cxx_destruct
{
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_startTimeComponents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_8:
}

- (void)setStartTimeComponents:(id)a3
{
}

- (void)setDose:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_dose = a3;
}

- (void)setDayOfWeek:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_dayOfWeek = a3;
}

- (BOOL)hasStartTimeComponents
{
  return self->_startTimeComponents != 0;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCycleIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cycleIndex = a3;
}

- (void)setHasCycleIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCycleIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCycleIntervalDays:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cycleIntervalDays = a3;
}

- (void)setHasCycleIntervalDays:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCycleIntervalDays
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDose:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDose
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableMedicationScheduleIntervalData;
  id v4 = [(HDCodableMedicationScheduleIntervalData *)&v8 description];
  v5 = [(HDCodableMedicationScheduleIntervalData *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  startTimeComponents = self->_startTimeComponents;
  if (startTimeComponents)
  {
    v5 = [(HDCodableDateComponents *)startTimeComponents dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"startTimeComponents"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v9 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_dayOfWeek];
    [v3 setObject:v9 forKey:@"dayOfWeek"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  v10 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_cycleIndex];
  [v3 setObject:v10 forKey:@"cycleIndex"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  v11 = [MEMORY[0x1E4F28ED0] numberWithLongLong:self->_cycleIntervalDays];
  [v3 setObject:v11 forKey:@"cycleIntervalDays"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    v7 = [MEMORY[0x1E4F28ED0] numberWithDouble:self->_dose];
    [v3 setObject:v7 forKey:@"dose"];
  }
LABEL_8:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableMedicationScheduleIntervalDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_startTimeComponents)
  {
    id v6 = v4;
    objc_msgSend(v4, "setStartTimeComponents:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_dayOfWeek;
    *((unsigned char *)v4 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 1) = self->_cycleIndex;
  *((unsigned char *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)v4 + 2) = self->_cycleIntervalDays;
  *((unsigned char *)v4 + 48) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((void *)v4 + 4) = *(void *)&self->_dose;
    *((unsigned char *)v4 + 48) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(HDCodableDateComponents *)self->_startTimeComponents copyWithZone:a3];
  v7 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_dayOfWeek;
    *(unsigned char *)(v5 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 16) = self->_cycleIntervalDays;
      *(unsigned char *)(v5 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 8) = self->_cycleIndex;
  *(unsigned char *)(v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(double *)(v5 + 32) = self->_dose;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  startTimeComponents = self->_startTimeComponents;
  if ((unint64_t)startTimeComponents | *((void *)v4 + 5))
  {
    if (!-[HDCodableDateComponents isEqual:](startTimeComponents, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_dayOfWeek != *((void *)v4 + 3)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_cycleIndex != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_23;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_cycleIntervalDays != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 48) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_dose != *((double *)v4 + 4)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HDCodableDateComponents *)self->_startTimeComponents hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_dayOfWeek;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_cycleIndex;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v11;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_cycleIntervalDays;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double dose = self->_dose;
  double v8 = -dose;
  if (dose >= 0.0) {
    double v8 = self->_dose;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  startTimeComponents = self->_startTimeComponents;
  uint64_t v6 = *((void *)v4 + 5);
  if (startTimeComponents)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    startTimeComponents = (HDCodableDateComponents *)-[HDCodableDateComponents mergeFrom:](startTimeComponents, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    startTimeComponents = (HDCodableDateComponents *)-[HDCodableMedicationScheduleIntervalData setStartTimeComponents:](self, "setStartTimeComponents:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 4) != 0)
  {
    self->_dayOfWeek = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 48);
    if ((v7 & 1) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_cycleIndex = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v7 = *((unsigned char *)v4 + 48);
  if ((v7 & 2) == 0)
  {
LABEL_10:
    if ((v7 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_cycleIntervalDays = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
LABEL_11:
    self->_double dose = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_12:
  MEMORY[0x1F41817F8](startTimeComponents, v4);
}

- (HDCodableDateComponents)startTimeComponents
{
  return self->_startTimeComponents;
}

- (int64_t)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int64_t)cycleIndex
{
  return self->_cycleIndex;
}

- (int64_t)cycleIntervalDays
{
  return self->_cycleIntervalDays;
}

- (double)dose
{
  return self->_dose;
}

@end