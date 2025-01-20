@interface HKCodableSummaryActivityRingsValue
- (BOOL)hasActiveEnergyBurned;
- (BOOL)hasActiveEnergyBurnedGoal;
- (BOOL)hasActivityMoveMode;
- (BOOL)hasActivityResumeDate;
- (BOOL)hasAppleExerciseTime;
- (BOOL)hasAppleExerciseTimeGoal;
- (BOOL)hasAppleMoveTime;
- (BOOL)hasAppleMoveTimeGoal;
- (BOOL)hasAppleStandHours;
- (BOOL)hasAppleStandHoursGoal;
- (BOOL)hasCreationDate;
- (BOOL)hasDateData;
- (BOOL)hasEndDate;
- (BOOL)hasEverHadAWatch;
- (BOOL)hasHasEverHadAWatch;
- (BOOL)hasPaused;
- (BOOL)hasStartDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)paused;
- (BOOL)readFrom:(id)a3;
- (HKCodableQuantity)activeEnergyBurned;
- (HKCodableQuantity)activeEnergyBurnedGoal;
- (HKCodableQuantity)appleExerciseTime;
- (HKCodableQuantity)appleExerciseTimeGoal;
- (HKCodableQuantity)appleMoveTime;
- (HKCodableQuantity)appleMoveTimeGoal;
- (HKCodableQuantity)appleStandHours;
- (HKCodableQuantity)appleStandHoursGoal;
- (double)activityResumeDate;
- (double)creationDate;
- (double)dateData;
- (double)endDate;
- (double)startDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)activityMoveMode;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveEnergyBurned:(id)a3;
- (void)setActiveEnergyBurnedGoal:(id)a3;
- (void)setActivityMoveMode:(int64_t)a3;
- (void)setActivityResumeDate:(double)a3;
- (void)setAppleExerciseTime:(id)a3;
- (void)setAppleExerciseTimeGoal:(id)a3;
- (void)setAppleMoveTime:(id)a3;
- (void)setAppleMoveTimeGoal:(id)a3;
- (void)setAppleStandHours:(id)a3;
- (void)setAppleStandHoursGoal:(id)a3;
- (void)setCreationDate:(double)a3;
- (void)setDateData:(double)a3;
- (void)setEndDate:(double)a3;
- (void)setHasActivityMoveMode:(BOOL)a3;
- (void)setHasActivityResumeDate:(BOOL)a3;
- (void)setHasCreationDate:(BOOL)a3;
- (void)setHasDateData:(BOOL)a3;
- (void)setHasEndDate:(BOOL)a3;
- (void)setHasEverHadAWatch:(BOOL)a3;
- (void)setHasHasEverHadAWatch:(BOOL)a3;
- (void)setHasPaused:(BOOL)a3;
- (void)setHasStartDate:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)setStartDate:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableSummaryActivityRingsValue

- (void)setDateData:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_dateData = a3;
}

- (void)setHasDateData:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasDateData
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setActivityMoveMode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_activityMoveMode = a3;
}

- (void)setHasActivityMoveMode:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasActivityMoveMode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasActiveEnergyBurned
{
  return self->_activeEnergyBurned != 0;
}

- (BOOL)hasActiveEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal != 0;
}

- (BOOL)hasAppleMoveTime
{
  return self->_appleMoveTime != 0;
}

- (BOOL)hasAppleMoveTimeGoal
{
  return self->_appleMoveTimeGoal != 0;
}

- (BOOL)hasAppleExerciseTime
{
  return self->_appleExerciseTime != 0;
}

- (BOOL)hasAppleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal != 0;
}

- (BOOL)hasAppleStandHours
{
  return self->_appleStandHours != 0;
}

- (BOOL)hasAppleStandHoursGoal
{
  return self->_appleStandHoursGoal != 0;
}

- (void)setStartDate:(double)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_startDate = a3;
}

- (void)setHasStartDate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasStartDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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

- (void)setHasEverHadAWatch:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_hasEverHadAWatch = a3;
}

- (void)setHasHasEverHadAWatch:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasHasEverHadAWatch
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setPaused:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_paused = a3;
}

- (void)setHasPaused:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasPaused
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setActivityResumeDate:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_activityResumeDate = a3;
}

- (void)setHasActivityResumeDate:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasActivityResumeDate
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableSummaryActivityRingsValue;
  v4 = [(HKCodableSummaryActivityRingsValue *)&v8 description];
  v5 = [(HKCodableSummaryActivityRingsValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v5 = [NSNumber numberWithDouble:self->_dateData];
    [v3 setObject:v5 forKey:@"dateData"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithLongLong:self->_activityMoveMode];
    [v3 setObject:v6 forKey:@"activityMoveMode"];
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  if (activeEnergyBurned)
  {
    objc_super v8 = [(HKCodableQuantity *)activeEnergyBurned dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"activeEnergyBurned"];
  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if (activeEnergyBurnedGoal)
  {
    v10 = [(HKCodableQuantity *)activeEnergyBurnedGoal dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"activeEnergyBurnedGoal"];
  }
  appleMoveTime = self->_appleMoveTime;
  if (appleMoveTime)
  {
    v12 = [(HKCodableQuantity *)appleMoveTime dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"appleMoveTime"];
  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if (appleMoveTimeGoal)
  {
    v14 = [(HKCodableQuantity *)appleMoveTimeGoal dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"appleMoveTimeGoal"];
  }
  appleExerciseTime = self->_appleExerciseTime;
  if (appleExerciseTime)
  {
    v16 = [(HKCodableQuantity *)appleExerciseTime dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"appleExerciseTime"];
  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if (appleExerciseTimeGoal)
  {
    v18 = [(HKCodableQuantity *)appleExerciseTimeGoal dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"appleExerciseTimeGoal"];
  }
  appleStandHours = self->_appleStandHours;
  if (appleStandHours)
  {
    v20 = [(HKCodableQuantity *)appleStandHours dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"appleStandHours"];
  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if (appleStandHoursGoal)
  {
    v22 = [(HKCodableQuantity *)appleStandHoursGoal dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"appleStandHoursGoal"];
  }
  char v23 = (char)self->_has;
  if ((v23 & 0x20) != 0)
  {
    v26 = [NSNumber numberWithDouble:self->_startDate];
    [v3 setObject:v26 forKey:@"startDate"];

    char v23 = (char)self->_has;
    if ((v23 & 0x10) == 0)
    {
LABEL_23:
      if ((v23 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v27 = [NSNumber numberWithDouble:self->_endDate];
  [v3 setObject:v27 forKey:@"endDate"];

  char v23 = (char)self->_has;
  if ((v23 & 4) == 0)
  {
LABEL_24:
    if ((v23 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  v28 = [NSNumber numberWithDouble:self->_creationDate];
  [v3 setObject:v28 forKey:@"creationDate"];

  char v23 = (char)self->_has;
  if ((v23 & 0x40) == 0)
  {
LABEL_25:
    if ((v23 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  v29 = [NSNumber numberWithBool:self->_hasEverHadAWatch];
  [v3 setObject:v29 forKey:@"hasEverHadAWatch"];

  char v23 = (char)self->_has;
  if ((v23 & 0x80) == 0)
  {
LABEL_26:
    if ((v23 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_35:
  v30 = [NSNumber numberWithBool:self->_paused];
  [v3 setObject:v30 forKey:@"paused"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_27:
    v24 = [NSNumber numberWithDouble:self->_activityResumeDate];
    [v3 setObject:v24 forKey:@"activityResumeDate"];
  }
LABEL_28:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableSummaryActivityRingsValueReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_activeEnergyBurned) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activeEnergyBurnedGoal) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleMoveTime) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleMoveTimeGoal) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleExerciseTime) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleExerciseTimeGoal) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleStandHours) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_appleStandHoursGoal) {
    PBDataWriterWriteSubmessage();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x20) != 0)
  {
    PBDataWriterWriteDoubleField();
    char v5 = (char)self->_has;
    if ((v5 & 0x10) == 0)
    {
LABEL_23:
      if ((v5 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  PBDataWriterWriteDoubleField();
  char v5 = (char)self->_has;
  if ((v5 & 4) == 0)
  {
LABEL_24:
    if ((v5 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  char v5 = (char)self->_has;
  if ((v5 & 0x40) == 0)
  {
LABEL_25:
    if ((v5 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  char v5 = (char)self->_has;
  if ((v5 & 0x80) == 0)
  {
LABEL_26:
    if ((v5 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_27:
  }
    PBDataWriterWriteDoubleField();
LABEL_28:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[4] = *(void *)&self->_dateData;
    *((unsigned char *)v4 + 124) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[1] = self->_activityMoveMode;
    *((unsigned char *)v4 + 124) |= 1u;
  }
  v7 = v4;
  if (self->_activeEnergyBurned)
  {
    objc_msgSend(v4, "setActiveEnergyBurned:");
    v4 = v7;
  }
  if (self->_activeEnergyBurnedGoal)
  {
    objc_msgSend(v7, "setActiveEnergyBurnedGoal:");
    v4 = v7;
  }
  if (self->_appleMoveTime)
  {
    objc_msgSend(v7, "setAppleMoveTime:");
    v4 = v7;
  }
  if (self->_appleMoveTimeGoal)
  {
    objc_msgSend(v7, "setAppleMoveTimeGoal:");
    v4 = v7;
  }
  if (self->_appleExerciseTime)
  {
    objc_msgSend(v7, "setAppleExerciseTime:");
    v4 = v7;
  }
  if (self->_appleExerciseTimeGoal)
  {
    objc_msgSend(v7, "setAppleExerciseTimeGoal:");
    v4 = v7;
  }
  if (self->_appleStandHours)
  {
    objc_msgSend(v7, "setAppleStandHours:");
    v4 = v7;
  }
  if (self->_appleStandHoursGoal)
  {
    objc_msgSend(v7, "setAppleStandHoursGoal:");
    v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    v4[6] = *(void *)&self->_startDate;
    *((unsigned char *)v4 + 124) |= 0x20u;
    char v6 = (char)self->_has;
    if ((v6 & 0x10) == 0)
    {
LABEL_23:
      if ((v6 & 4) == 0) {
        goto LABEL_24;
      }
      goto LABEL_33;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_23;
  }
  v4[5] = *(void *)&self->_endDate;
  *((unsigned char *)v4 + 124) |= 0x10u;
  char v6 = (char)self->_has;
  if ((v6 & 4) == 0)
  {
LABEL_24:
    if ((v6 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[3] = *(void *)&self->_creationDate;
  *((unsigned char *)v4 + 124) |= 4u;
  char v6 = (char)self->_has;
  if ((v6 & 0x40) == 0)
  {
LABEL_25:
    if ((v6 & 0x80) == 0) {
      goto LABEL_26;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((unsigned char *)v4 + 120) = self->_hasEverHadAWatch;
  *((unsigned char *)v4 + 124) |= 0x40u;
  char v6 = (char)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_35:
  *((unsigned char *)v4 + 121) = self->_paused;
  *((unsigned char *)v4 + 124) |= 0x80u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_27:
    v4[2] = *(void *)&self->_activityResumeDate;
    *((unsigned char *)v4 + 124) |= 2u;
  }
LABEL_28:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(double *)(v5 + 32) = self->_dateData;
    *(unsigned char *)(v5 + 124) |= 8u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_activityMoveMode;
    *(unsigned char *)(v5 + 124) |= 1u;
  }
  id v8 = [(HKCodableQuantity *)self->_activeEnergyBurned copyWithZone:a3];
  v9 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v8;

  id v10 = [(HKCodableQuantity *)self->_activeEnergyBurnedGoal copyWithZone:a3];
  v11 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v10;

  id v12 = [(HKCodableQuantity *)self->_appleMoveTime copyWithZone:a3];
  v13 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v12;

  id v14 = [(HKCodableQuantity *)self->_appleMoveTimeGoal copyWithZone:a3];
  v15 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v14;

  id v16 = [(HKCodableQuantity *)self->_appleExerciseTime copyWithZone:a3];
  v17 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v16;

  id v18 = [(HKCodableQuantity *)self->_appleExerciseTimeGoal copyWithZone:a3];
  v19 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v18;

  id v20 = [(HKCodableQuantity *)self->_appleStandHours copyWithZone:a3];
  v21 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v20;

  id v22 = [(HKCodableQuantity *)self->_appleStandHoursGoal copyWithZone:a3];
  char v23 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v22;

  char v24 = (char)self->_has;
  if ((v24 & 0x20) != 0)
  {
    *(double *)(v6 + 48) = self->_startDate;
    *(unsigned char *)(v6 + 124) |= 0x20u;
    char v24 = (char)self->_has;
    if ((v24 & 0x10) == 0)
    {
LABEL_7:
      if ((v24 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v6 + 40) = self->_endDate;
  *(unsigned char *)(v6 + 124) |= 0x10u;
  char v24 = (char)self->_has;
  if ((v24 & 4) == 0)
  {
LABEL_8:
    if ((v24 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v6 + 24) = self->_creationDate;
  *(unsigned char *)(v6 + 124) |= 4u;
  char v24 = (char)self->_has;
  if ((v24 & 0x40) == 0)
  {
LABEL_9:
    if ((v24 & 0x80) == 0) {
      goto LABEL_10;
    }
LABEL_17:
    *(unsigned char *)(v6 + 121) = self->_paused;
    *(unsigned char *)(v6 + 124) |= 0x80u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return (id)v6;
    }
    goto LABEL_11;
  }
LABEL_16:
  *(unsigned char *)(v6 + 120) = self->_hasEverHadAWatch;
  *(unsigned char *)(v6 + 124) |= 0x40u;
  char v24 = (char)self->_has;
  if (v24 < 0) {
    goto LABEL_17;
  }
LABEL_10:
  if ((v24 & 2) != 0)
  {
LABEL_11:
    *(double *)(v6 + 16) = self->_activityResumeDate;
    *(unsigned char *)(v6 + 124) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 8) == 0 || self->_dateData != *((double *)v4 + 4)) {
      goto LABEL_63;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 8) != 0)
  {
    goto LABEL_63;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 124) & 1) == 0 || self->_activityMoveMode != *((void *)v4 + 1)) {
      goto LABEL_63;
    }
  }
  else if (*((unsigned char *)v4 + 124))
  {
    goto LABEL_63;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  if ((unint64_t)activeEnergyBurned | *((void *)v4 + 7)
    && !-[HKCodableQuantity isEqual:](activeEnergyBurned, "isEqual:"))
  {
    goto LABEL_63;
  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if ((unint64_t)activeEnergyBurnedGoal | *((void *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](activeEnergyBurnedGoal, "isEqual:")) {
      goto LABEL_63;
    }
  }
  appleMoveTime = self->_appleMoveTime;
  if ((unint64_t)appleMoveTime | *((void *)v4 + 11))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTime, "isEqual:")) {
      goto LABEL_63;
    }
  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if ((unint64_t)appleMoveTimeGoal | *((void *)v4 + 12))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTimeGoal, "isEqual:")) {
      goto LABEL_63;
    }
  }
  appleExerciseTime = self->_appleExerciseTime;
  if ((unint64_t)appleExerciseTime | *((void *)v4 + 9))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTime, "isEqual:")) {
      goto LABEL_63;
    }
  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if ((unint64_t)appleExerciseTimeGoal | *((void *)v4 + 10))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTimeGoal, "isEqual:")) {
      goto LABEL_63;
    }
  }
  appleStandHours = self->_appleStandHours;
  if ((unint64_t)appleStandHours | *((void *)v4 + 13))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHours, "isEqual:")) {
      goto LABEL_63;
    }
  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if ((unint64_t)appleStandHoursGoal | *((void *)v4 + 14))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHoursGoal, "isEqual:")) {
      goto LABEL_63;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x20) == 0 || self->_startDate != *((double *)v4 + 6)) {
      goto LABEL_63;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 0x20) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x10) == 0 || self->_endDate != *((double *)v4 + 5)) {
      goto LABEL_63;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 0x10) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 4) == 0 || self->_creationDate != *((double *)v4 + 3)) {
      goto LABEL_63;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 4) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x40) == 0) {
      goto LABEL_63;
    }
    if (self->_hasEverHadAWatch)
    {
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_63;
      }
    }
    else if (*((unsigned char *)v4 + 120))
    {
      goto LABEL_63;
    }
  }
  else if ((*((unsigned char *)v4 + 124) & 0x40) != 0)
  {
    goto LABEL_63;
  }
  if ((*(unsigned char *)&self->_has & 0x80) == 0)
  {
    if ((*((unsigned char *)v4 + 124) & 0x80) == 0) {
      goto LABEL_53;
    }
LABEL_63:
    BOOL v13 = 0;
    goto LABEL_64;
  }
  if ((*((unsigned char *)v4 + 124) & 0x80) == 0) {
    goto LABEL_63;
  }
  if (self->_paused)
  {
    if (!*((unsigned char *)v4 + 121)) {
      goto LABEL_63;
    }
  }
  else if (*((unsigned char *)v4 + 121))
  {
    goto LABEL_63;
  }
LABEL_53:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 124) & 2) == 0 || self->_activityResumeDate != *((double *)v4 + 2)) {
      goto LABEL_63;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (*((unsigned char *)v4 + 124) & 2) == 0;
  }
LABEL_64:

  return v13;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    double dateData = self->_dateData;
    double v6 = -dateData;
    if (dateData >= 0.0) {
      double v6 = self->_dateData;
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
  if (has) {
    uint64_t v41 = 2654435761 * self->_activityMoveMode;
  }
  else {
    uint64_t v41 = 0;
  }
  unint64_t v40 = [(HKCodableQuantity *)self->_activeEnergyBurned hash];
  unint64_t v39 = [(HKCodableQuantity *)self->_activeEnergyBurnedGoal hash];
  unint64_t v38 = [(HKCodableQuantity *)self->_appleMoveTime hash];
  unint64_t v37 = [(HKCodableQuantity *)self->_appleMoveTimeGoal hash];
  unint64_t v36 = [(HKCodableQuantity *)self->_appleExerciseTime hash];
  unint64_t v35 = [(HKCodableQuantity *)self->_appleExerciseTimeGoal hash];
  unint64_t v34 = [(HKCodableQuantity *)self->_appleStandHours hash];
  unint64_t v9 = [(HKCodableQuantity *)self->_appleStandHoursGoal hash];
  char v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    double startDate = self->_startDate;
    double v13 = -startDate;
    if (startDate >= 0.0) {
      double v13 = self->_startDate;
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
  if ((v10 & 0x10) != 0)
  {
    double endDate = self->_endDate;
    double v18 = -endDate;
    if (endDate >= 0.0) {
      double v18 = self->_endDate;
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
  if ((v10 & 4) != 0)
  {
    double creationDate = self->_creationDate;
    double v23 = -creationDate;
    if (creationDate >= 0.0) {
      double v23 = self->_creationDate;
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
  if ((v10 & 0x40) == 0)
  {
    uint64_t v26 = 0;
    if (v10 < 0) {
      goto LABEL_38;
    }
LABEL_44:
    uint64_t v27 = 0;
    if ((v10 & 2) != 0) {
      goto LABEL_39;
    }
LABEL_45:
    unint64_t v32 = 0;
    return v41 ^ v4 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v9 ^ v11 ^ v16 ^ v21 ^ v26 ^ v27 ^ v32;
  }
  uint64_t v26 = 2654435761 * self->_hasEverHadAWatch;
  if ((v10 & 0x80) == 0) {
    goto LABEL_44;
  }
LABEL_38:
  uint64_t v27 = 2654435761 * self->_paused;
  if ((v10 & 2) == 0) {
    goto LABEL_45;
  }
LABEL_39:
  double activityResumeDate = self->_activityResumeDate;
  double v29 = -activityResumeDate;
  if (activityResumeDate >= 0.0) {
    double v29 = self->_activityResumeDate;
  }
  long double v30 = floor(v29 + 0.5);
  double v31 = (v29 - v30) * 1.84467441e19;
  unint64_t v32 = 2654435761u * (unint64_t)fmod(v30, 1.84467441e19);
  if (v31 >= 0.0)
  {
    if (v31 > 0.0) {
      v32 += (unint64_t)v31;
    }
  }
  else
  {
    v32 -= (unint64_t)fabs(v31);
  }
  return v41 ^ v4 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v9 ^ v11 ^ v16 ^ v21 ^ v26 ^ v27 ^ v32;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 124);
  if ((v6 & 8) != 0)
  {
    self->_double dateData = *((double *)v4 + 4);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 124);
  }
  if (v6)
  {
    self->_activityMoveMode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  uint64_t v8 = *((void *)v5 + 7);
  id v24 = v5;
  if (activeEnergyBurned)
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[HKCodableQuantity mergeFrom:](activeEnergyBurned, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_11;
    }
    -[HKCodableSummaryActivityRingsValue setActiveEnergyBurned:](self, "setActiveEnergyBurned:");
  }
  id v5 = v24;
LABEL_11:
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  uint64_t v10 = *((void *)v5 + 8);
  if (activeEnergyBurnedGoal)
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[HKCodableQuantity mergeFrom:](activeEnergyBurnedGoal, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_17;
    }
    -[HKCodableSummaryActivityRingsValue setActiveEnergyBurnedGoal:](self, "setActiveEnergyBurnedGoal:");
  }
  id v5 = v24;
LABEL_17:
  appleMoveTime = self->_appleMoveTime;
  uint64_t v12 = *((void *)v5 + 11);
  if (appleMoveTime)
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[HKCodableQuantity mergeFrom:](appleMoveTime, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_23;
    }
    -[HKCodableSummaryActivityRingsValue setAppleMoveTime:](self, "setAppleMoveTime:");
  }
  id v5 = v24;
LABEL_23:
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  uint64_t v14 = *((void *)v5 + 12);
  if (appleMoveTimeGoal)
  {
    if (!v14) {
      goto LABEL_29;
    }
    -[HKCodableQuantity mergeFrom:](appleMoveTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_29;
    }
    -[HKCodableSummaryActivityRingsValue setAppleMoveTimeGoal:](self, "setAppleMoveTimeGoal:");
  }
  id v5 = v24;
LABEL_29:
  appleExerciseTime = self->_appleExerciseTime;
  uint64_t v16 = *((void *)v5 + 9);
  if (appleExerciseTime)
  {
    if (!v16) {
      goto LABEL_35;
    }
    -[HKCodableQuantity mergeFrom:](appleExerciseTime, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_35;
    }
    -[HKCodableSummaryActivityRingsValue setAppleExerciseTime:](self, "setAppleExerciseTime:");
  }
  id v5 = v24;
LABEL_35:
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  uint64_t v18 = *((void *)v5 + 10);
  if (appleExerciseTimeGoal)
  {
    if (!v18) {
      goto LABEL_41;
    }
    -[HKCodableQuantity mergeFrom:](appleExerciseTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_41;
    }
    -[HKCodableSummaryActivityRingsValue setAppleExerciseTimeGoal:](self, "setAppleExerciseTimeGoal:");
  }
  id v5 = v24;
LABEL_41:
  appleStandHours = self->_appleStandHours;
  uint64_t v20 = *((void *)v5 + 13);
  if (appleStandHours)
  {
    if (!v20) {
      goto LABEL_47;
    }
    -[HKCodableQuantity mergeFrom:](appleStandHours, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_47;
    }
    -[HKCodableSummaryActivityRingsValue setAppleStandHours:](self, "setAppleStandHours:");
  }
  id v5 = v24;
LABEL_47:
  appleStandHoursGoal = self->_appleStandHoursGoal;
  uint64_t v22 = *((void *)v5 + 14);
  if (appleStandHoursGoal)
  {
    if (!v22) {
      goto LABEL_53;
    }
    appleStandHoursGoal = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](appleStandHoursGoal, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_53;
    }
    appleStandHoursGoal = (HKCodableQuantity *)-[HKCodableSummaryActivityRingsValue setAppleStandHoursGoal:](self, "setAppleStandHoursGoal:");
  }
  id v5 = v24;
LABEL_53:
  char v23 = *((unsigned char *)v5 + 124);
  if ((v23 & 0x20) != 0)
  {
    self->_double startDate = *((double *)v5 + 6);
    *(unsigned char *)&self->_has |= 0x20u;
    char v23 = *((unsigned char *)v5 + 124);
    if ((v23 & 0x10) == 0)
    {
LABEL_55:
      if ((v23 & 4) == 0) {
        goto LABEL_56;
      }
      goto LABEL_65;
    }
  }
  else if ((*((unsigned char *)v5 + 124) & 0x10) == 0)
  {
    goto LABEL_55;
  }
  self->_double endDate = *((double *)v5 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v23 = *((unsigned char *)v5 + 124);
  if ((v23 & 4) == 0)
  {
LABEL_56:
    if ((v23 & 0x40) == 0) {
      goto LABEL_57;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_double creationDate = *((double *)v5 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v23 = *((unsigned char *)v5 + 124);
  if ((v23 & 0x40) == 0)
  {
LABEL_57:
    if ((v23 & 0x80) == 0) {
      goto LABEL_58;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_hasEverHadAWatch = *((unsigned char *)v5 + 120);
  *(unsigned char *)&self->_has |= 0x40u;
  char v23 = *((unsigned char *)v5 + 124);
  if ((v23 & 0x80) == 0)
  {
LABEL_58:
    if ((v23 & 2) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_67:
  self->_paused = *((unsigned char *)v5 + 121);
  *(unsigned char *)&self->_has |= 0x80u;
  if ((*((unsigned char *)v5 + 124) & 2) != 0)
  {
LABEL_59:
    self->_double activityResumeDate = *((double *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_60:
  MEMORY[0x1F41817F8](appleStandHoursGoal, v5);
}

- (double)dateData
{
  return self->_dateData;
}

- (int64_t)activityMoveMode
{
  return self->_activityMoveMode;
}

- (HKCodableQuantity)activeEnergyBurned
{
  return self->_activeEnergyBurned;
}

- (void)setActiveEnergyBurned:(id)a3
{
}

- (HKCodableQuantity)activeEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal;
}

- (void)setActiveEnergyBurnedGoal:(id)a3
{
}

- (HKCodableQuantity)appleMoveTime
{
  return self->_appleMoveTime;
}

- (void)setAppleMoveTime:(id)a3
{
}

- (HKCodableQuantity)appleMoveTimeGoal
{
  return self->_appleMoveTimeGoal;
}

- (void)setAppleMoveTimeGoal:(id)a3
{
}

- (HKCodableQuantity)appleExerciseTime
{
  return self->_appleExerciseTime;
}

- (void)setAppleExerciseTime:(id)a3
{
}

- (HKCodableQuantity)appleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (void)setAppleExerciseTimeGoal:(id)a3
{
}

- (HKCodableQuantity)appleStandHours
{
  return self->_appleStandHours;
}

- (void)setAppleStandHours:(id)a3
{
}

- (HKCodableQuantity)appleStandHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (void)setAppleStandHoursGoal:(id)a3
{
}

- (double)startDate
{
  return self->_startDate;
}

- (double)endDate
{
  return self->_endDate;
}

- (double)creationDate
{
  return self->_creationDate;
}

- (BOOL)hasEverHadAWatch
{
  return self->_hasEverHadAWatch;
}

- (BOOL)paused
{
  return self->_paused;
}

- (double)activityResumeDate
{
  return self->_activityResumeDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleStandHoursGoal, 0);
  objc_storeStrong((id *)&self->_appleStandHours, 0);
  objc_storeStrong((id *)&self->_appleMoveTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleMoveTime, 0);
  objc_storeStrong((id *)&self->_appleExerciseTimeGoal, 0);
  objc_storeStrong((id *)&self->_appleExerciseTime, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurnedGoal, 0);
  objc_storeStrong((id *)&self->_activeEnergyBurned, 0);
}

@end