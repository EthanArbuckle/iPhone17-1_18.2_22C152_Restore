@interface HKCodableActivitySummaryEntry
- (BOOL)hasActiveEnergyBurned;
- (BOOL)hasActiveEnergyBurnedGoal;
- (BOOL)hasActivityMoveMode;
- (BOOL)hasAppleExerciseTime;
- (BOOL)hasAppleExerciseTimeGoal;
- (BOOL)hasAppleMoveTime;
- (BOOL)hasAppleMoveTimeGoal;
- (BOOL)hasAppleStandHours;
- (BOOL)hasAppleStandHoursGoal;
- (BOOL)hasGregorianDateComponents;
- (BOOL)hasPaused;
- (BOOL)isEqual:(id)a3;
- (BOOL)paused;
- (BOOL)readFrom:(id)a3;
- (HKCodableDateComponents)gregorianDateComponents;
- (HKCodableQuantity)activeEnergyBurned;
- (HKCodableQuantity)activeEnergyBurnedGoal;
- (HKCodableQuantity)appleExerciseTime;
- (HKCodableQuantity)appleExerciseTimeGoal;
- (HKCodableQuantity)appleMoveTime;
- (HKCodableQuantity)appleMoveTimeGoal;
- (HKCodableQuantity)appleStandHours;
- (HKCodableQuantity)appleStandHoursGoal;
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
- (void)setAppleExerciseTime:(id)a3;
- (void)setAppleExerciseTimeGoal:(id)a3;
- (void)setAppleMoveTime:(id)a3;
- (void)setAppleMoveTimeGoal:(id)a3;
- (void)setAppleStandHours:(id)a3;
- (void)setAppleStandHoursGoal:(id)a3;
- (void)setGregorianDateComponents:(id)a3;
- (void)setHasActivityMoveMode:(BOOL)a3;
- (void)setHasPaused:(BOOL)a3;
- (void)setPaused:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HKCodableActivitySummaryEntry

- (BOOL)hasGregorianDateComponents
{
  return self->_gregorianDateComponents != 0;
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

- (BOOL)hasAppleMoveTime
{
  return self->_appleMoveTime != 0;
}

- (BOOL)hasAppleExerciseTime
{
  return self->_appleExerciseTime != 0;
}

- (BOOL)hasAppleStandHours
{
  return self->_appleStandHours != 0;
}

- (BOOL)hasActiveEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal != 0;
}

- (BOOL)hasAppleMoveTimeGoal
{
  return self->_appleMoveTimeGoal != 0;
}

- (BOOL)hasAppleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal != 0;
}

- (BOOL)hasAppleStandHoursGoal
{
  return self->_appleStandHoursGoal != 0;
}

- (void)setPaused:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_paused = a3;
}

- (void)setHasPaused:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPaused
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HKCodableActivitySummaryEntry;
  v4 = [(HKCodableActivitySummaryEntry *)&v8 description];
  v5 = [(HKCodableActivitySummaryEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  gregorianDateComponents = self->_gregorianDateComponents;
  if (gregorianDateComponents)
  {
    v5 = [(HKCodableDateComponents *)gregorianDateComponents dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"gregorianDateComponents"];
  }
  if (*(unsigned char *)&self->_has)
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
  appleMoveTime = self->_appleMoveTime;
  if (appleMoveTime)
  {
    v10 = [(HKCodableQuantity *)appleMoveTime dictionaryRepresentation];
    [v3 setObject:v10 forKey:@"appleMoveTime"];
  }
  appleExerciseTime = self->_appleExerciseTime;
  if (appleExerciseTime)
  {
    v12 = [(HKCodableQuantity *)appleExerciseTime dictionaryRepresentation];
    [v3 setObject:v12 forKey:@"appleExerciseTime"];
  }
  appleStandHours = self->_appleStandHours;
  if (appleStandHours)
  {
    v14 = [(HKCodableQuantity *)appleStandHours dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"appleStandHours"];
  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if (activeEnergyBurnedGoal)
  {
    v16 = [(HKCodableQuantity *)activeEnergyBurnedGoal dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"activeEnergyBurnedGoal"];
  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if (appleMoveTimeGoal)
  {
    v18 = [(HKCodableQuantity *)appleMoveTimeGoal dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"appleMoveTimeGoal"];
  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if (appleExerciseTimeGoal)
  {
    v20 = [(HKCodableQuantity *)appleExerciseTimeGoal dictionaryRepresentation];
    [v3 setObject:v20 forKey:@"appleExerciseTimeGoal"];
  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if (appleStandHoursGoal)
  {
    v22 = [(HKCodableQuantity *)appleStandHoursGoal dictionaryRepresentation];
    [v3 setObject:v22 forKey:@"appleStandHoursGoal"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v23 = [NSNumber numberWithBool:self->_paused];
    [v3 setObject:v23 forKey:@"paused"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKCodableActivitySummaryEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gregorianDateComponents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_activeEnergyBurned)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleMoveTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleExerciseTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleStandHours)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_activeEnergyBurnedGoal)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleMoveTimeGoal)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleExerciseTimeGoal)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_appleStandHoursGoal)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_gregorianDateComponents)
  {
    objc_msgSend(v4, "setGregorianDateComponents:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_activityMoveMode;
    *((unsigned char *)v4 + 92) |= 1u;
  }
  if (self->_activeEnergyBurned)
  {
    objc_msgSend(v5, "setActiveEnergyBurned:");
    id v4 = v5;
  }
  if (self->_appleMoveTime)
  {
    objc_msgSend(v5, "setAppleMoveTime:");
    id v4 = v5;
  }
  if (self->_appleExerciseTime)
  {
    objc_msgSend(v5, "setAppleExerciseTime:");
    id v4 = v5;
  }
  if (self->_appleStandHours)
  {
    objc_msgSend(v5, "setAppleStandHours:");
    id v4 = v5;
  }
  if (self->_activeEnergyBurnedGoal)
  {
    objc_msgSend(v5, "setActiveEnergyBurnedGoal:");
    id v4 = v5;
  }
  if (self->_appleMoveTimeGoal)
  {
    objc_msgSend(v5, "setAppleMoveTimeGoal:");
    id v4 = v5;
  }
  if (self->_appleExerciseTimeGoal)
  {
    objc_msgSend(v5, "setAppleExerciseTimeGoal:");
    id v4 = v5;
  }
  if (self->_appleStandHoursGoal)
  {
    objc_msgSend(v5, "setAppleStandHoursGoal:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v4 + 88) = self->_paused;
    *((unsigned char *)v4 + 92) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HKCodableDateComponents *)self->_gregorianDateComponents copyWithZone:a3];
  v7 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_activityMoveMode;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  id v8 = [(HKCodableQuantity *)self->_activeEnergyBurned copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  id v10 = [(HKCodableQuantity *)self->_appleMoveTime copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  id v12 = [(HKCodableQuantity *)self->_appleExerciseTime copyWithZone:a3];
  v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  id v14 = [(HKCodableQuantity *)self->_appleStandHours copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  id v16 = [(HKCodableQuantity *)self->_activeEnergyBurnedGoal copyWithZone:a3];
  v17 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v16;

  id v18 = [(HKCodableQuantity *)self->_appleMoveTimeGoal copyWithZone:a3];
  v19 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v18;

  id v20 = [(HKCodableQuantity *)self->_appleExerciseTimeGoal copyWithZone:a3];
  v21 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v20;

  id v22 = [(HKCodableQuantity *)self->_appleStandHoursGoal copyWithZone:a3];
  v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 88) = self->_paused;
    *(unsigned char *)(v5 + 92) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  gregorianDateComponents = self->_gregorianDateComponents;
  if ((unint64_t)gregorianDateComponents | *((void *)v4 + 10))
  {
    if (!-[HKCodableDateComponents isEqual:](gregorianDateComponents, "isEqual:")) {
      goto LABEL_27;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_activityMoveMode != *((void *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_27;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  if ((unint64_t)activeEnergyBurned | *((void *)v4 + 2)
    && !-[HKCodableQuantity isEqual:](activeEnergyBurned, "isEqual:"))
  {
    goto LABEL_27;
  }
  appleMoveTime = self->_appleMoveTime;
  if ((unint64_t)appleMoveTime | *((void *)v4 + 6))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTime, "isEqual:")) {
      goto LABEL_27;
    }
  }
  appleExerciseTime = self->_appleExerciseTime;
  if ((unint64_t)appleExerciseTime | *((void *)v4 + 4))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTime, "isEqual:")) {
      goto LABEL_27;
    }
  }
  appleStandHours = self->_appleStandHours;
  if ((unint64_t)appleStandHours | *((void *)v4 + 8))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHours, "isEqual:")) {
      goto LABEL_27;
    }
  }
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  if ((unint64_t)activeEnergyBurnedGoal | *((void *)v4 + 3))
  {
    if (!-[HKCodableQuantity isEqual:](activeEnergyBurnedGoal, "isEqual:")) {
      goto LABEL_27;
    }
  }
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  if ((unint64_t)appleMoveTimeGoal | *((void *)v4 + 7))
  {
    if (!-[HKCodableQuantity isEqual:](appleMoveTimeGoal, "isEqual:")) {
      goto LABEL_27;
    }
  }
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  if ((unint64_t)appleExerciseTimeGoal | *((void *)v4 + 5))
  {
    if (!-[HKCodableQuantity isEqual:](appleExerciseTimeGoal, "isEqual:")) {
      goto LABEL_27;
    }
  }
  appleStandHoursGoal = self->_appleStandHoursGoal;
  if ((unint64_t)appleStandHoursGoal | *((void *)v4 + 9))
  {
    if (!-[HKCodableQuantity isEqual:](appleStandHoursGoal, "isEqual:")) {
      goto LABEL_27;
    }
  }
  BOOL v14 = (*((unsigned char *)v4 + 92) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0)
    {
LABEL_27:
      BOOL v14 = 0;
      goto LABEL_28;
    }
    if (self->_paused)
    {
      if (!*((unsigned char *)v4 + 88)) {
        goto LABEL_27;
      }
    }
    else if (*((unsigned char *)v4 + 88))
    {
      goto LABEL_27;
    }
    BOOL v14 = 1;
  }
LABEL_28:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v14 = [(HKCodableDateComponents *)self->_gregorianDateComponents hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_activityMoveMode;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(HKCodableQuantity *)self->_activeEnergyBurned hash];
  unint64_t v5 = [(HKCodableQuantity *)self->_appleMoveTime hash];
  unint64_t v6 = [(HKCodableQuantity *)self->_appleExerciseTime hash];
  unint64_t v7 = [(HKCodableQuantity *)self->_appleStandHours hash];
  unint64_t v8 = [(HKCodableQuantity *)self->_activeEnergyBurnedGoal hash];
  unint64_t v9 = [(HKCodableQuantity *)self->_appleMoveTimeGoal hash];
  unint64_t v10 = [(HKCodableQuantity *)self->_appleExerciseTimeGoal hash];
  unint64_t v11 = [(HKCodableQuantity *)self->_appleStandHoursGoal hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_paused;
  }
  else {
    uint64_t v12 = 0;
  }
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  gregorianDateComponents = self->_gregorianDateComponents;
  uint64_t v6 = *((void *)v4 + 10);
  id v23 = v4;
  if (gregorianDateComponents)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableDateComponents mergeFrom:](gregorianDateComponents, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[HKCodableActivitySummaryEntry setGregorianDateComponents:](self, "setGregorianDateComponents:");
  }
  id v4 = v23;
LABEL_7:
  if (*((unsigned char *)v4 + 92))
  {
    self->_activityMoveMode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  activeEnergyBurned = self->_activeEnergyBurned;
  uint64_t v8 = *((void *)v4 + 2);
  if (activeEnergyBurned)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HKCodableQuantity mergeFrom:](activeEnergyBurned, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[HKCodableActivitySummaryEntry setActiveEnergyBurned:](self, "setActiveEnergyBurned:");
  }
  id v4 = v23;
LABEL_15:
  appleMoveTime = self->_appleMoveTime;
  uint64_t v10 = *((void *)v4 + 6);
  if (appleMoveTime)
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[HKCodableQuantity mergeFrom:](appleMoveTime, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_21;
    }
    -[HKCodableActivitySummaryEntry setAppleMoveTime:](self, "setAppleMoveTime:");
  }
  id v4 = v23;
LABEL_21:
  appleExerciseTime = self->_appleExerciseTime;
  uint64_t v12 = *((void *)v4 + 4);
  if (appleExerciseTime)
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[HKCodableQuantity mergeFrom:](appleExerciseTime, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_27;
    }
    -[HKCodableActivitySummaryEntry setAppleExerciseTime:](self, "setAppleExerciseTime:");
  }
  id v4 = v23;
LABEL_27:
  appleStandHours = self->_appleStandHours;
  uint64_t v14 = *((void *)v4 + 8);
  if (appleStandHours)
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[HKCodableQuantity mergeFrom:](appleStandHours, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_33;
    }
    -[HKCodableActivitySummaryEntry setAppleStandHours:](self, "setAppleStandHours:");
  }
  id v4 = v23;
LABEL_33:
  activeEnergyBurnedGoal = self->_activeEnergyBurnedGoal;
  uint64_t v16 = *((void *)v4 + 3);
  if (activeEnergyBurnedGoal)
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[HKCodableQuantity mergeFrom:](activeEnergyBurnedGoal, "mergeFrom:");
  }
  else
  {
    if (!v16) {
      goto LABEL_39;
    }
    -[HKCodableActivitySummaryEntry setActiveEnergyBurnedGoal:](self, "setActiveEnergyBurnedGoal:");
  }
  id v4 = v23;
LABEL_39:
  appleMoveTimeGoal = self->_appleMoveTimeGoal;
  uint64_t v18 = *((void *)v4 + 7);
  if (appleMoveTimeGoal)
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[HKCodableQuantity mergeFrom:](appleMoveTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v18) {
      goto LABEL_45;
    }
    -[HKCodableActivitySummaryEntry setAppleMoveTimeGoal:](self, "setAppleMoveTimeGoal:");
  }
  id v4 = v23;
LABEL_45:
  appleExerciseTimeGoal = self->_appleExerciseTimeGoal;
  uint64_t v20 = *((void *)v4 + 5);
  if (appleExerciseTimeGoal)
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[HKCodableQuantity mergeFrom:](appleExerciseTimeGoal, "mergeFrom:");
  }
  else
  {
    if (!v20) {
      goto LABEL_51;
    }
    -[HKCodableActivitySummaryEntry setAppleExerciseTimeGoal:](self, "setAppleExerciseTimeGoal:");
  }
  id v4 = v23;
LABEL_51:
  appleStandHoursGoal = self->_appleStandHoursGoal;
  uint64_t v22 = *((void *)v4 + 9);
  if (appleStandHoursGoal)
  {
    if (!v22) {
      goto LABEL_57;
    }
    appleStandHoursGoal = (HKCodableQuantity *)-[HKCodableQuantity mergeFrom:](appleStandHoursGoal, "mergeFrom:");
  }
  else
  {
    if (!v22) {
      goto LABEL_57;
    }
    appleStandHoursGoal = (HKCodableQuantity *)-[HKCodableActivitySummaryEntry setAppleStandHoursGoal:](self, "setAppleStandHoursGoal:");
  }
  id v4 = v23;
LABEL_57:
  if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    self->_paused = *((unsigned char *)v4 + 88);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8](appleStandHoursGoal, v4);
}

- (HKCodableDateComponents)gregorianDateComponents
{
  return self->_gregorianDateComponents;
}

- (void)setGregorianDateComponents:(id)a3
{
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

- (HKCodableQuantity)appleMoveTime
{
  return self->_appleMoveTime;
}

- (void)setAppleMoveTime:(id)a3
{
}

- (HKCodableQuantity)appleExerciseTime
{
  return self->_appleExerciseTime;
}

- (void)setAppleExerciseTime:(id)a3
{
}

- (HKCodableQuantity)appleStandHours
{
  return self->_appleStandHours;
}

- (void)setAppleStandHours:(id)a3
{
}

- (HKCodableQuantity)activeEnergyBurnedGoal
{
  return self->_activeEnergyBurnedGoal;
}

- (void)setActiveEnergyBurnedGoal:(id)a3
{
}

- (HKCodableQuantity)appleMoveTimeGoal
{
  return self->_appleMoveTimeGoal;
}

- (void)setAppleMoveTimeGoal:(id)a3
{
}

- (HKCodableQuantity)appleExerciseTimeGoal
{
  return self->_appleExerciseTimeGoal;
}

- (void)setAppleExerciseTimeGoal:(id)a3
{
}

- (HKCodableQuantity)appleStandHoursGoal
{
  return self->_appleStandHoursGoal;
}

- (void)setAppleStandHoursGoal:(id)a3
{
}

- (BOOL)paused
{
  return self->_paused;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianDateComponents, 0);
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