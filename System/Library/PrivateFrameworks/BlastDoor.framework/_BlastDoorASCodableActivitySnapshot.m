@interface _BlastDoorASCodableActivitySnapshot
- (BOOL)hasActiveHours;
- (BOOL)hasActiveHoursGoal;
- (BOOL)hasAmm;
- (BOOL)hasBriskMinutes;
- (BOOL)hasBriskMinutesGoal;
- (BOOL)hasEnergyBurned;
- (BOOL)hasEnergyBurnedGoal;
- (BOOL)hasMmg;
- (BOOL)hasMmv;
- (BOOL)hasPushCount;
- (BOOL)hasSample;
- (BOOL)hasSnapshotIndex;
- (BOOL)hasSourceUUID;
- (BOOL)hasStepCount;
- (BOOL)hasTimeZoneOffsetFromUTCForNoon;
- (BOOL)hasWalkingAndRunningDistance;
- (BOOL)hasWheelchairUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)sourceUUID;
- (_BlastDoorASCodableSample)sample;
- (double)activeHours;
- (double)activeHoursGoal;
- (double)briskMinutes;
- (double)briskMinutesGoal;
- (double)energyBurned;
- (double)energyBurnedGoal;
- (double)mmg;
- (double)mmv;
- (double)pushCount;
- (double)stepCount;
- (double)walkingAndRunningDistance;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)amm;
- (int64_t)snapshotIndex;
- (int64_t)timeZoneOffsetFromUTCForNoon;
- (int64_t)wheelchairUse;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveHours:(double)a3;
- (void)setActiveHoursGoal:(double)a3;
- (void)setAmm:(int64_t)a3;
- (void)setBriskMinutes:(double)a3;
- (void)setBriskMinutesGoal:(double)a3;
- (void)setEnergyBurned:(double)a3;
- (void)setEnergyBurnedGoal:(double)a3;
- (void)setHasActiveHours:(BOOL)a3;
- (void)setHasActiveHoursGoal:(BOOL)a3;
- (void)setHasAmm:(BOOL)a3;
- (void)setHasBriskMinutes:(BOOL)a3;
- (void)setHasBriskMinutesGoal:(BOOL)a3;
- (void)setHasEnergyBurned:(BOOL)a3;
- (void)setHasEnergyBurnedGoal:(BOOL)a3;
- (void)setHasMmg:(BOOL)a3;
- (void)setHasMmv:(BOOL)a3;
- (void)setHasPushCount:(BOOL)a3;
- (void)setHasSnapshotIndex:(BOOL)a3;
- (void)setHasStepCount:(BOOL)a3;
- (void)setHasTimeZoneOffsetFromUTCForNoon:(BOOL)a3;
- (void)setHasWalkingAndRunningDistance:(BOOL)a3;
- (void)setHasWheelchairUse:(BOOL)a3;
- (void)setMmg:(double)a3;
- (void)setMmv:(double)a3;
- (void)setPushCount:(double)a3;
- (void)setSample:(id)a3;
- (void)setSnapshotIndex:(int64_t)a3;
- (void)setSourceUUID:(id)a3;
- (void)setStepCount:(double)a3;
- (void)setTimeZoneOffsetFromUTCForNoon:(int64_t)a3;
- (void)setWalkingAndRunningDistance:(double)a3;
- (void)setWheelchairUse:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _BlastDoorASCodableActivitySnapshot

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (void)setSnapshotIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_snapshotIndex = a3;
}

- (void)setHasSnapshotIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasSnapshotIndex
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTimeZoneOffsetFromUTCForNoon:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_timeZoneOffsetFromUTCForNoon = a3;
}

- (void)setHasTimeZoneOffsetFromUTCForNoon:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasTimeZoneOffsetFromUTCForNoon
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setEnergyBurned:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_energyBurned = a3;
}

- (void)setHasEnergyBurned:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEnergyBurned
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_energyBurnedGoal = a3;
}

- (void)setHasEnergyBurnedGoal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasEnergyBurnedGoal
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBriskMinutes:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_briskMinutes = a3;
}

- (void)setHasBriskMinutes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBriskMinutes
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBriskMinutesGoal:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_briskMinutesGoal = a3;
}

- (void)setHasBriskMinutesGoal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBriskMinutesGoal
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setActiveHours:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_activeHours = a3;
}

- (void)setHasActiveHours:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasActiveHours
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setActiveHoursGoal:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_activeHoursGoal = a3;
}

- (void)setHasActiveHoursGoal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasActiveHoursGoal
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_walkingAndRunningDistance = a3;
}

- (void)setHasWalkingAndRunningDistance:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasWalkingAndRunningDistance
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setStepCount:(double)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_stepCount = a3;
}

- (void)setHasStepCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasStepCount
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setPushCount:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_pushCount = a3;
}

- (void)setHasPushCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPushCount
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setWheelchairUse:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_wheelchairUse = a3;
}

- (void)setHasWheelchairUse:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasWheelchairUse
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setMmv:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mmv = a3;
}

- (void)setHasMmv:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMmv
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMmg:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_mmg = a3;
}

- (void)setHasMmg:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMmg
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setAmm:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_amm = a3;
}

- (void)setHasAmm:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAmm
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_BlastDoorASCodableActivitySnapshot;
  v4 = [(_BlastDoorASCodableActivitySnapshot *)&v8 description];
  v5 = [(_BlastDoorASCodableActivitySnapshot *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(_BlastDoorASCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  sourceUUID = self->_sourceUUID;
  if (sourceUUID) {
    [v3 setObject:sourceUUID forKey:@"sourceUUID"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    v10 = [NSNumber numberWithLongLong:self->_snapshotIndex];
    [v3 setObject:v10 forKey:@"snapshotIndex"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  v11 = [NSNumber numberWithLongLong:self->_timeZoneOffsetFromUTCForNoon];
  [v3 setObject:v11 forKey:@"timeZoneOffsetFromUTCForNoon"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  v12 = [NSNumber numberWithDouble:self->_energyBurned];
  [v3 setObject:v12 forKey:@"energyBurned"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  v13 = [NSNumber numberWithDouble:self->_energyBurnedGoal];
  [v3 setObject:v13 forKey:@"energyBurnedGoal"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  v14 = [NSNumber numberWithDouble:self->_briskMinutes];
  [v3 setObject:v14 forKey:@"briskMinutes"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  v15 = [NSNumber numberWithDouble:self->_briskMinutesGoal];
  [v3 setObject:v15 forKey:@"briskMinutesGoal"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  v16 = [NSNumber numberWithDouble:self->_activeHours];
  [v3 setObject:v16 forKey:@"activeHours"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  v17 = [NSNumber numberWithDouble:self->_activeHoursGoal];
  [v3 setObject:v17 forKey:@"activeHoursGoal"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = [NSNumber numberWithDouble:self->_walkingAndRunningDistance];
  [v3 setObject:v18 forKey:@"walkingAndRunningDistance"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  v19 = [NSNumber numberWithDouble:self->_stepCount];
  [v3 setObject:v19 forKey:@"stepCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  v20 = [NSNumber numberWithDouble:self->_pushCount];
  [v3 setObject:v20 forKey:@"pushCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
LABEL_35:
  v21 = [NSNumber numberWithLongLong:self->_wheelchairUse];
  [v3 setObject:v21 forKey:@"wheelchairUse"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  v22 = [NSNumber numberWithDouble:self->_mmv];
  [v3 setObject:v22 forKey:@"mmv"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_37:
  v23 = [NSNumber numberWithDouble:self->_mmg];
  [v3 setObject:v23 forKey:@"mmg"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_20:
    objc_super v8 = [NSNumber numberWithLongLong:self->_amm];
    [v3 setObject:v8 forKey:@"amm"];
  }
LABEL_21:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _BlastDoorASCodableActivitySnapshotReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_20:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_21:
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
  if (self->_sourceUUID)
  {
    objc_msgSend(v6, "setSourceUUID:");
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *((void *)v4 + 11) = self->_snapshotIndex;
    *((_WORD *)v4 + 72) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 13) = self->_timeZoneOffsetFromUTCForNoon;
  *((_WORD *)v4 + 72) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)v4 + 6) = *(void *)&self->_energyBurned;
  *((_WORD *)v4 + 72) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v4 + 7) = *(void *)&self->_energyBurnedGoal;
  *((_WORD *)v4 + 72) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 4) = *(void *)&self->_briskMinutes;
  *((_WORD *)v4 + 72) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)v4 + 5) = *(void *)&self->_briskMinutesGoal;
  *((_WORD *)v4 + 72) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 1) = *(void *)&self->_activeHours;
  *((_WORD *)v4 + 72) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v4 + 2) = *(void *)&self->_activeHoursGoal;
  *((_WORD *)v4 + 72) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 14) = *(void *)&self->_walkingAndRunningDistance;
  *((_WORD *)v4 + 72) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)v4 + 12) = *(void *)&self->_stepCount;
  *((_WORD *)v4 + 72) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 10) = *(void *)&self->_pushCount;
  *((_WORD *)v4 + 72) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_17:
    if ((has & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 15) = self->_wheelchairUse;
  *((_WORD *)v4 + 72) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_18:
    if ((has & 0x80) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v4 + 9) = *(void *)&self->_mmv;
  *((_WORD *)v4 + 72) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_19:
    if ((has & 4) == 0) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
LABEL_37:
  *((void *)v4 + 8) = *(void *)&self->_mmg;
  *((_WORD *)v4 + 72) |= 0x80u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_20:
    *((void *)v4 + 3) = self->_amm;
    *((_WORD *)v4 + 72) |= 4u;
  }
LABEL_21:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_BlastDoorASCodableSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v6;

  uint64_t v8 = [(NSData *)self->_sourceUUID copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0)
  {
    *(void *)(v5 + 88) = self->_snapshotIndex;
    *(_WORD *)(v5 + 144) |= 0x400u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 104) = self->_timeZoneOffsetFromUTCForNoon;
  *(_WORD *)(v5 + 144) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_energyBurned;
  *(_WORD *)(v5 + 144) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(double *)(v5 + 56) = self->_energyBurnedGoal;
  *(_WORD *)(v5 + 144) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(double *)(v5 + 32) = self->_briskMinutes;
  *(_WORD *)(v5 + 144) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 40) = self->_briskMinutesGoal;
  *(_WORD *)(v5 + 144) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v5 + 8) = self->_activeHours;
  *(_WORD *)(v5 + 144) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v5 + 16) = self->_activeHoursGoal;
  *(_WORD *)(v5 + 144) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x800) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 112) = self->_walkingAndRunningDistance;
  *(_WORD *)(v5 + 144) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 96) = self->_stepCount;
  *(_WORD *)(v5 + 144) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 0x4000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 80) = self->_pushCount;
  *(_WORD *)(v5 + 144) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(void *)(v5 + 120) = self->_wheelchairUse;
  *(_WORD *)(v5 + 144) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      goto LABEL_15;
    }
LABEL_31:
    *(double *)(v5 + 64) = self->_mmg;
    *(_WORD *)(v5 + 144) |= 0x80u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_16;
  }
LABEL_30:
  *(double *)(v5 + 72) = self->_mmv;
  *(_WORD *)(v5 + 144) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0) {
    goto LABEL_31;
  }
LABEL_15:
  if ((has & 4) != 0)
  {
LABEL_16:
    *(void *)(v5 + 24) = self->_amm;
    *(_WORD *)(v5 + 144) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_81;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 16))
  {
    if (!-[_BlastDoorASCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_81;
    }
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((void *)v4 + 17))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:")) {
      goto LABEL_81;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 72);
  if ((has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x400) == 0 || self->_snapshotIndex != *((void *)v4 + 11)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x400) != 0)
  {
LABEL_81:
    BOOL v9 = 0;
    goto LABEL_82;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x1000) == 0 || self->_timeZoneOffsetFromUTCForNoon != *((void *)v4 + 13)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x1000) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_energyBurned != *((double *)v4 + 6)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_energyBurnedGoal != *((double *)v4 + 7)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_briskMinutes != *((double *)v4 + 4)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_briskMinutesGoal != *((double *)v4 + 5)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_activeHours != *((double *)v4 + 1)) {
      goto LABEL_81;
    }
  }
  else if (v8)
  {
    goto LABEL_81;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_activeHoursGoal != *((double *)v4 + 2)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x2000) == 0 || self->_walkingAndRunningDistance != *((double *)v4 + 14)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x2000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x800) == 0 || self->_stepCount != *((double *)v4 + 12)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x800) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x200) == 0 || self->_pushCount != *((double *)v4 + 10)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x4000) == 0 || self->_wheelchairUse != *((void *)v4 + 15)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x4000) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x100) == 0 || self->_mmv != *((double *)v4 + 9)) {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x100) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_mmg != *((double *)v4 + 8)) {
      goto LABEL_81;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_81;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_amm != *((void *)v4 + 3)) {
      goto LABEL_81;
    }
    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = (v8 & 4) == 0;
  }
LABEL_82:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v70 = [(_BlastDoorASCodableSample *)self->_sample hash];
  uint64_t v69 = [(NSData *)self->_sourceUUID hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
    uint64_t v68 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_3;
    }
LABEL_9:
    uint64_t v67 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_4;
    }
LABEL_10:
    unint64_t v8 = 0;
    goto LABEL_13;
  }
  uint64_t v68 = 2654435761 * self->_snapshotIndex;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_9;
  }
LABEL_3:
  uint64_t v67 = 2654435761 * self->_timeZoneOffsetFromUTCForNoon;
  if ((has & 0x20) == 0) {
    goto LABEL_10;
  }
LABEL_4:
  double energyBurned = self->_energyBurned;
  double v5 = -energyBurned;
  if (energyBurned >= 0.0) {
    double v5 = self->_energyBurned;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_13:
  if ((has & 0x40) != 0)
  {
    double energyBurnedGoal = self->_energyBurnedGoal;
    double v11 = -energyBurnedGoal;
    if (energyBurnedGoal >= 0.0) {
      double v11 = self->_energyBurnedGoal;
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
  if ((has & 8) != 0)
  {
    double briskMinutes = self->_briskMinutes;
    double v16 = -briskMinutes;
    if (briskMinutes >= 0.0) {
      double v16 = self->_briskMinutes;
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
  if ((has & 0x10) != 0)
  {
    double briskMinutesGoal = self->_briskMinutesGoal;
    double v21 = -briskMinutesGoal;
    if (briskMinutesGoal >= 0.0) {
      double v21 = self->_briskMinutesGoal;
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
  if (has)
  {
    double activeHours = self->_activeHours;
    double v26 = -activeHours;
    if (activeHours >= 0.0) {
      double v26 = self->_activeHours;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  if ((has & 2) != 0)
  {
    double activeHoursGoal = self->_activeHoursGoal;
    double v31 = -activeHoursGoal;
    if (activeHoursGoal >= 0.0) {
      double v31 = self->_activeHoursGoal;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x2000) != 0)
  {
    double walkingAndRunningDistance = self->_walkingAndRunningDistance;
    double v36 = -walkingAndRunningDistance;
    if (walkingAndRunningDistance >= 0.0) {
      double v36 = self->_walkingAndRunningDistance;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v65 = v24;
  if ((has & 0x800) != 0)
  {
    double stepCount = self->_stepCount;
    double v41 = -stepCount;
    if (stepCount >= 0.0) {
      double v41 = self->_stepCount;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  unint64_t v64 = v29;
  unint64_t v66 = v19;
  if ((has & 0x200) != 0)
  {
    double pushCount = self->_pushCount;
    double v46 = -pushCount;
    if (pushCount >= 0.0) {
      double v46 = self->_pushCount;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    unint64_t v44 = 2654435761u * (unint64_t)fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      if (v48 > 0.0) {
        v44 += (unint64_t)v48;
      }
    }
    else
    {
      v44 -= (unint64_t)fabs(v48);
    }
  }
  else
  {
    unint64_t v44 = 0;
  }
  unint64_t v49 = v34;
  if ((has & 0x4000) != 0) {
    uint64_t v50 = 2654435761 * self->_wheelchairUse;
  }
  else {
    uint64_t v50 = 0;
  }
  unint64_t v51 = v8;
  if ((has & 0x100) != 0)
  {
    double mmv = self->_mmv;
    double v54 = -mmv;
    if (mmv >= 0.0) {
      double v54 = self->_mmv;
    }
    long double v55 = floor(v54 + 0.5);
    double v56 = (v54 - v55) * 1.84467441e19;
    unint64_t v52 = 2654435761u * (unint64_t)fmod(v55, 1.84467441e19);
    if (v56 >= 0.0)
    {
      if (v56 > 0.0) {
        v52 += (unint64_t)v56;
      }
    }
    else
    {
      v52 -= (unint64_t)fabs(v56);
    }
  }
  else
  {
    unint64_t v52 = 0;
  }
  if ((has & 0x80) != 0)
  {
    double mmg = self->_mmg;
    double v59 = -mmg;
    if (mmg >= 0.0) {
      double v59 = self->_mmg;
    }
    long double v60 = floor(v59 + 0.5);
    double v61 = (v59 - v60) * 1.84467441e19;
    unint64_t v57 = 2654435761u * (unint64_t)fmod(v60, 1.84467441e19);
    if (v61 >= 0.0)
    {
      if (v61 > 0.0) {
        v57 += (unint64_t)v61;
      }
    }
    else
    {
      v57 -= (unint64_t)fabs(v61);
    }
  }
  else
  {
    unint64_t v57 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v62 = 2654435761 * self->_amm;
  }
  else {
    uint64_t v62 = 0;
  }
  return v69 ^ v70 ^ v68 ^ v67 ^ v51 ^ v9 ^ v14 ^ v66 ^ v65 ^ v64 ^ v49 ^ v39 ^ v44 ^ v50 ^ v52 ^ v57 ^ v62;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 16);
  id v8 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_BlastDoorASCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[_BlastDoorASCodableActivitySnapshot setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 17))
  {
    -[_BlastDoorASCodableActivitySnapshot setSourceUUID:](self, "setSourceUUID:");
    id v4 = v8;
  }
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x400) != 0)
  {
    self->_snapshotIndex = *((void *)v4 + 11);
    *(_WORD *)&self->_has |= 0x400u;
    __int16 v7 = *((_WORD *)v4 + 72);
    if ((v7 & 0x1000) == 0)
    {
LABEL_11:
      if ((v7 & 0x20) == 0) {
        goto LABEL_12;
      }
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x1000) == 0)
  {
    goto LABEL_11;
  }
  self->_timeZoneOffsetFromUTCForNoon = *((void *)v4 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double energyBurned = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_double energyBurnedGoal = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 8) == 0)
  {
LABEL_14:
    if ((v7 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_double briskMinutes = *((double *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x10) == 0)
  {
LABEL_15:
    if ((v7 & 1) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_double briskMinutesGoal = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 1) == 0)
  {
LABEL_16:
    if ((v7 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_double activeHours = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 2) == 0)
  {
LABEL_17:
    if ((v7 & 0x2000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_double activeHoursGoal = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x2000) == 0)
  {
LABEL_18:
    if ((v7 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_double walkingAndRunningDistance = *((double *)v4 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x800) == 0)
  {
LABEL_19:
    if ((v7 & 0x200) == 0) {
      goto LABEL_20;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_double stepCount = *((double *)v4 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x200) == 0)
  {
LABEL_20:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double pushCount = *((double *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x4000) == 0)
  {
LABEL_21:
    if ((v7 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_wheelchairUse = *((void *)v4 + 15);
  *(_WORD *)&self->_has |= 0x4000u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x100) == 0)
  {
LABEL_22:
    if ((v7 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double mmv = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x80) == 0)
  {
LABEL_23:
    if ((v7 & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_41:
  self->_double mmg = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  if ((*((_WORD *)v4 + 72) & 4) != 0)
  {
LABEL_24:
    self->_amm = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_25:
  MEMORY[0x1F41817F8]();
}

- (_BlastDoorASCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (void)setSourceUUID:(id)a3
{
}

- (int64_t)snapshotIndex
{
  return self->_snapshotIndex;
}

- (int64_t)timeZoneOffsetFromUTCForNoon
{
  return self->_timeZoneOffsetFromUTCForNoon;
}

- (double)energyBurned
{
  return self->_energyBurned;
}

- (double)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (double)stepCount
{
  return self->_stepCount;
}

- (double)pushCount
{
  return self->_pushCount;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (double)mmv
{
  return self->_mmv;
}

- (double)mmg
{
  return self->_mmg;
}

- (int64_t)amm
{
  return self->_amm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

@end