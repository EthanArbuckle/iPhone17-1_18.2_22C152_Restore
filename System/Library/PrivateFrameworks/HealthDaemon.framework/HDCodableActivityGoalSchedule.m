@interface HDCodableActivityGoalSchedule
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasFridayGoal;
- (BOOL)hasGoalType;
- (BOOL)hasMondayGoal;
- (BOOL)hasSample;
- (BOOL)hasSaturdayGoal;
- (BOOL)hasSundayGoal;
- (BOOL)hasThursdayGoal;
- (BOOL)hasTuesdayGoal;
- (BOOL)hasUnitString;
- (BOOL)hasWednesdayGoal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSString)description;
- (NSString)unitString;
- (double)fridayGoal;
- (double)mondayGoal;
- (double)saturdayGoal;
- (double)sundayGoal;
- (double)thursdayGoal;
- (double)tuesdayGoal;
- (double)wednesdayGoal;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)goalType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFridayGoal:(double)a3;
- (void)setGoalType:(int64_t)a3;
- (void)setHasFridayGoal:(BOOL)a3;
- (void)setHasGoalType:(BOOL)a3;
- (void)setHasMondayGoal:(BOOL)a3;
- (void)setHasSaturdayGoal:(BOOL)a3;
- (void)setHasSundayGoal:(BOOL)a3;
- (void)setHasThursdayGoal:(BOOL)a3;
- (void)setHasTuesdayGoal:(BOOL)a3;
- (void)setHasWednesdayGoal:(BOOL)a3;
- (void)setMondayGoal:(double)a3;
- (void)setSample:(id)a3;
- (void)setSaturdayGoal:(double)a3;
- (void)setSundayGoal:(double)a3;
- (void)setThursdayGoal:(double)a3;
- (void)setTuesdayGoal:(double)a3;
- (void)setUnitString:(id)a3;
- (void)setWednesdayGoal:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableActivityGoalSchedule

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setGoalType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGoalType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasUnitString
{
  return self->_unitString != 0;
}

- (void)setMondayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_mondayGoal = a3;
}

- (void)setHasMondayGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMondayGoal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTuesdayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_tuesdayGoal = a3;
}

- (void)setHasTuesdayGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasTuesdayGoal
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setWednesdayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_wednesdayGoal = a3;
}

- (void)setHasWednesdayGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasWednesdayGoal
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setThursdayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_thursdayGoal = a3;
}

- (void)setHasThursdayGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasThursdayGoal
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setFridayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_fridayGoal = a3;
}

- (void)setHasFridayGoal:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFridayGoal
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSaturdayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_saturdayGoal = a3;
}

- (void)setHasSaturdayGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSaturdayGoal
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSundayGoal:(double)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_sundayGoal = a3;
}

- (void)setHasSundayGoal:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSundayGoal
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableActivityGoalSchedule;
  v4 = [(HDCodableActivityGoalSchedule *)&v8 description];
  v5 = [(HDCodableActivityGoalSchedule *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithLongLong:self->_goalType];
    [v3 setObject:v6 forKey:@"goalType"];
  }
  unitString = self->_unitString;
  if (unitString) {
    [v3 setObject:unitString forKey:@"unitString"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v11 = [NSNumber numberWithDouble:self->_mondayGoal];
    [v3 setObject:v11 forKey:@"mondayGoal"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithDouble:self->_tuesdayGoal];
  [v3 setObject:v12 forKey:@"tuesdayGoal"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithDouble:self->_wednesdayGoal];
  [v3 setObject:v13 forKey:@"wednesdayGoal"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  v14 = [NSNumber numberWithDouble:self->_thursdayGoal];
  [v3 setObject:v14 forKey:@"thursdayGoal"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = [NSNumber numberWithDouble:self->_fridayGoal];
  [v3 setObject:v15 forKey:@"fridayGoal"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  v16 = [NSNumber numberWithDouble:self->_saturdayGoal];
  [v3 setObject:v16 forKey:@"saturdayGoal"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    v9 = [NSNumber numberWithDouble:self->_sundayGoal];
    [v3 setObject:v9 forKey:@"sundayGoal"];
  }
LABEL_15:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableActivityGoalScheduleReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_unitString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_15:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_goalType;
    *((unsigned char *)v4 + 88) |= 2u;
  }
  if (self->_unitString)
  {
    objc_msgSend(v6, "setUnitString:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = *(void *)&self->_mondayGoal;
    *((unsigned char *)v4 + 88) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_9:
      if ((has & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_20;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 7) = *(void *)&self->_tuesdayGoal;
  *((unsigned char *)v4 + 88) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((void *)v4 + 8) = *(void *)&self->_wednesdayGoal;
  *((unsigned char *)v4 + 88) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((void *)v4 + 6) = *(void *)&self->_thursdayGoal;
  *((unsigned char *)v4 + 88) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((void *)v4 + 1) = *(void *)&self->_fridayGoal;
  *((unsigned char *)v4 + 88) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_23:
  *((void *)v4 + 4) = *(void *)&self->_saturdayGoal;
  *((unsigned char *)v4 + 88) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_14:
    *((void *)v4 + 5) = *(void *)&self->_sundayGoal;
    *((unsigned char *)v4 + 88) |= 0x10u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_goalType;
    *(unsigned char *)(v5 + 88) |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_unitString copyWithZone:a3];
  v9 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v8;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(double *)(v5 + 24) = self->_mondayGoal;
    *(unsigned char *)(v5 + 88) |= 4u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_5:
      if ((has & 0x80) == 0) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 56) = self->_tuesdayGoal;
  *(unsigned char *)(v5 + 88) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *(double *)(v5 + 64) = self->_wednesdayGoal;
  *(unsigned char *)(v5 + 88) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v5 + 48) = self->_thursdayGoal;
  *(unsigned char *)(v5 + 88) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_17:
    *(double *)(v5 + 32) = self->_saturdayGoal;
    *(unsigned char *)(v5 + 88) |= 8u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return (id)v5;
    }
    goto LABEL_10;
  }
LABEL_16:
  *(double *)(v5 + 8) = self->_fridayGoal;
  *(unsigned char *)(v5 + 88) |= 1u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_17;
  }
LABEL_9:
  if ((has & 0x10) != 0)
  {
LABEL_10:
    *(double *)(v5 + 40) = self->_sundayGoal;
    *(unsigned char *)(v5 + 88) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 9))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_46;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 88);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 88) & 2) == 0 || self->_goalType != *((void *)v4 + 2)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    goto LABEL_46;
  }
  unitString = self->_unitString;
  if ((unint64_t)unitString | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](unitString, "isEqual:")) {
      goto LABEL_46;
    }
    char has = (char)self->_has;
    char v7 = *((unsigned char *)v4 + 88);
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_mondayGoal != *((double *)v4 + 3)) {
      goto LABEL_46;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_tuesdayGoal != *((double *)v4 + 7)) {
      goto LABEL_46;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 0x80) == 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_24;
    }
LABEL_46:
    BOOL v9 = 0;
    goto LABEL_47;
  }
  if ((v7 & 0x80) == 0 || self->_wednesdayGoal != *((double *)v4 + 8)) {
    goto LABEL_46;
  }
LABEL_24:
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_thursdayGoal != *((double *)v4 + 6)) {
      goto LABEL_46;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_fridayGoal != *((double *)v4 + 1)) {
      goto LABEL_46;
    }
  }
  else if (v7)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_saturdayGoal != *((double *)v4 + 4)) {
      goto LABEL_46;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_46;
  }
  BOOL v9 = (v7 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_sundayGoal != *((double *)v4 + 5)) {
      goto LABEL_46;
    }
    BOOL v9 = 1;
  }
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v45 = [(HDCodableSample *)self->_sample hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    NSUInteger v3 = [(NSString *)self->_unitString hash];
  }
  else {
    NSUInteger v3 = [(NSString *)self->_unitString hash];
  }
  NSUInteger v4 = v3;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    double mondayGoal = self->_mondayGoal;
    double v8 = -mondayGoal;
    if (mondayGoal >= 0.0) {
      double v8 = self->_mondayGoal;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 0x40) != 0)
  {
    double tuesdayGoal = self->_tuesdayGoal;
    double v13 = -tuesdayGoal;
    if (tuesdayGoal >= 0.0) {
      double v13 = self->_tuesdayGoal;
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
  if (has < 0)
  {
    double wednesdayGoal = self->_wednesdayGoal;
    double v18 = -wednesdayGoal;
    if (wednesdayGoal >= 0.0) {
      double v18 = self->_wednesdayGoal;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    unint64_t v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0) {
        v16 += (unint64_t)v20;
      }
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  if ((has & 0x20) != 0)
  {
    double thursdayGoal = self->_thursdayGoal;
    double v23 = -thursdayGoal;
    if (thursdayGoal >= 0.0) {
      double v23 = self->_thursdayGoal;
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
  }
  else
  {
    unint64_t v21 = 0;
  }
  if (has)
  {
    double fridayGoal = self->_fridayGoal;
    double v28 = -fridayGoal;
    if (fridayGoal >= 0.0) {
      double v28 = self->_fridayGoal;
    }
    long double v29 = floor(v28 + 0.5);
    double v30 = (v28 - v29) * 1.84467441e19;
    unint64_t v26 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
    if (v30 >= 0.0)
    {
      if (v30 > 0.0) {
        v26 += (unint64_t)v30;
      }
    }
    else
    {
      v26 -= (unint64_t)fabs(v30);
    }
  }
  else
  {
    unint64_t v26 = 0;
  }
  if ((has & 8) != 0)
  {
    double saturdayGoal = self->_saturdayGoal;
    double v33 = -saturdayGoal;
    if (saturdayGoal >= 0.0) {
      double v33 = self->_saturdayGoal;
    }
    long double v34 = floor(v33 + 0.5);
    double v35 = (v33 - v34) * 1.84467441e19;
    unint64_t v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0) {
        v31 += (unint64_t)v35;
      }
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    unint64_t v31 = 0;
  }
  if ((has & 0x10) == 0)
  {
    unint64_t v36 = 0;
LABEL_58:
    uint64_t v42 = v44;
    unint64_t v41 = v45;
    return v42 ^ v41 ^ v4 ^ v6 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v36;
  }
  double sundayGoal = self->_sundayGoal;
  double v38 = -sundayGoal;
  if (sundayGoal >= 0.0) {
    double v38 = self->_sundayGoal;
  }
  long double v39 = floor(v38 + 0.5);
  double v40 = (v38 - v39) * 1.84467441e19;
  unint64_t v36 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
  if (v40 < 0.0)
  {
    v36 -= (unint64_t)fabs(v40);
    goto LABEL_58;
  }
  uint64_t v42 = v44;
  unint64_t v41 = v45;
  if (v40 > 0.0) {
    v36 += (unint64_t)v40;
  }
  return v42 ^ v41 ^ v4 ^ v6 ^ v11 ^ v16 ^ v21 ^ v26 ^ v31 ^ v36;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 9);
  id v8 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HDCodableActivityGoalSchedule setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  if ((*((unsigned char *)v4 + 88) & 2) != 0)
  {
    self->_goalType = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 10))
  {
    -[HDCodableActivityGoalSchedule setUnitString:](self, "setUnitString:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 4) != 0)
  {
    self->_double mondayGoal = *((double *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 88);
    if ((v7 & 0x40) == 0)
    {
LABEL_13:
      if ((v7 & 0x80) == 0) {
        goto LABEL_14;
      }
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 88) & 0x40) == 0)
  {
    goto LABEL_13;
  }
  self->_double tuesdayGoal = *((double *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x40u;
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 0x80) == 0)
  {
LABEL_14:
    if ((v7 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double wednesdayGoal = *((double *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x80u;
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 0x20) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double thursdayGoal = *((double *)v4 + 6);
  *(unsigned char *)&self->_has |= 0x20u;
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double fridayGoal = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v7 = *((unsigned char *)v4 + 88);
  if ((v7 & 8) == 0)
  {
LABEL_17:
    if ((v7 & 0x10) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_27:
  self->_double saturdayGoal = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 88) & 0x10) != 0)
  {
LABEL_18:
    self->_double sundayGoal = *((double *)v4 + 5);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_19:
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (NSString)unitString
{
  return self->_unitString;
}

- (void)setUnitString:(id)a3
{
}

- (double)mondayGoal
{
  return self->_mondayGoal;
}

- (double)tuesdayGoal
{
  return self->_tuesdayGoal;
}

- (double)wednesdayGoal
{
  return self->_wednesdayGoal;
}

- (double)thursdayGoal
{
  return self->_thursdayGoal;
}

- (double)fridayGoal
{
  return self->_fridayGoal;
}

- (double)saturdayGoal
{
  return self->_saturdayGoal;
}

- (double)sundayGoal
{
  return self->_sundayGoal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitString, 0);

  objc_storeStrong((id *)&self->_sample, 0);
}

- (BOOL)applyToObject:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v30 = 0;
  id v4 = a3;
  if (self)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(HDCodableActivityGoalSchedule *)self sample];
      char v6 = [v5 applyToObject:v4];

      if (v6)
      {
        objc_msgSend(v4, "setGoalType:", -[HDCodableActivityGoalSchedule goalType](self, "goalType"));
        char v7 = [(HDCodableActivityGoalSchedule *)self unitString];
        id v8 = [MEMORY[0x1E4F2B618] unitFromString:v7];
        long double v9 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self mondayGoal];
        double v10 = objc_msgSend(v9, "quantityWithUnit:doubleValue:", v8);
        [v4 setMondayGoal:v10];

        unint64_t v11 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self tuesdayGoal];
        v12 = objc_msgSend(v11, "quantityWithUnit:doubleValue:", v8);
        [v4 setTuesdayGoal:v12];

        double v13 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self wednesdayGoal];
        long double v14 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v8);
        [v4 setWednesdayGoal:v14];

        double v15 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self thursdayGoal];
        unint64_t v16 = objc_msgSend(v15, "quantityWithUnit:doubleValue:", v8);
        [v4 setThursdayGoal:v16];

        v17 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self fridayGoal];
        double v18 = objc_msgSend(v17, "quantityWithUnit:doubleValue:", v8);
        [v4 setFridayGoal:v18];

        long double v19 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self saturdayGoal];
        double v20 = objc_msgSend(v19, "quantityWithUnit:doubleValue:", v8);
        [v4 setSaturdayGoal:v20];

        unint64_t v21 = (void *)MEMORY[0x1E4F2B370];
        [(HDCodableActivityGoalSchedule *)self sundayGoal];
        v22 = objc_msgSend(v21, "quantityWithUnit:doubleValue:", v8);
        [v4 setSundayGoal:v22];

        id v23 = 0;
        BOOL v24 = 1;
        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v30, 3, @"Failed to decode superclass message");
    }
    else
    {
      double v25 = (void *)MEMORY[0x1E4F28C58];
      unint64_t v26 = (objc_class *)objc_opt_class();
      v27 = NSStringFromClass(v26);
      objc_msgSend(v25, "hk_assignError:code:format:", &v30, 3, @"Unexpected class %@", v27);
    }
  }

  id v23 = v30;
  _HKInitializeLogging();
  double v28 = *MEMORY[0x1E4F29F18];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v23;
    _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKActivityGoalSchedule with error %@", buf, 0xCu);
  }
  BOOL v24 = 0;
LABEL_10:

  return v24;
}

@end