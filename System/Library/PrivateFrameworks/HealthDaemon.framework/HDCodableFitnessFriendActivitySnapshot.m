@interface HDCodableFitnessFriendActivitySnapshot
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasActiveHours;
- (BOOL)hasActiveHoursGoal;
- (BOOL)hasAmm;
- (BOOL)hasBriskMinutes;
- (BOOL)hasBriskMinutesGoal;
- (BOOL)hasDate;
- (BOOL)hasEnergyBurned;
- (BOOL)hasEnergyBurnedGoal;
- (BOOL)hasFriendUUID;
- (BOOL)hasMmg;
- (BOOL)hasMmv;
- (BOOL)hasPushCount;
- (BOOL)hasSample;
- (BOOL)hasSnapshotIndex;
- (BOOL)hasSourceUUID;
- (BOOL)hasStepCount;
- (BOOL)hasTimeZoneOffsetFromUTCForNoon;
- (BOOL)hasUploadedDate;
- (BOOL)hasWalkingAndRunningDistance;
- (BOOL)hasWheelchairUse;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)friendUUID;
- (NSData)sourceUUID;
- (NSString)description;
- (double)activeHours;
- (double)activeHoursGoal;
- (double)briskMinutes;
- (double)briskMinutesGoal;
- (double)date;
- (double)energyBurned;
- (double)energyBurnedGoal;
- (double)mmg;
- (double)mmv;
- (double)pushCount;
- (double)stepCount;
- (double)uploadedDate;
- (double)walkingAndRunningDistance;
- (id)copyWithZone:(_NSZone *)a3;
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
- (void)setDate:(double)a3;
- (void)setEnergyBurned:(double)a3;
- (void)setEnergyBurnedGoal:(double)a3;
- (void)setFriendUUID:(id)a3;
- (void)setHasActiveHours:(BOOL)a3;
- (void)setHasActiveHoursGoal:(BOOL)a3;
- (void)setHasAmm:(BOOL)a3;
- (void)setHasBriskMinutes:(BOOL)a3;
- (void)setHasBriskMinutesGoal:(BOOL)a3;
- (void)setHasDate:(BOOL)a3;
- (void)setHasEnergyBurned:(BOOL)a3;
- (void)setHasEnergyBurnedGoal:(BOOL)a3;
- (void)setHasMmg:(BOOL)a3;
- (void)setHasMmv:(BOOL)a3;
- (void)setHasPushCount:(BOOL)a3;
- (void)setHasSnapshotIndex:(BOOL)a3;
- (void)setHasStepCount:(BOOL)a3;
- (void)setHasTimeZoneOffsetFromUTCForNoon:(BOOL)a3;
- (void)setHasUploadedDate:(BOOL)a3;
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
- (void)setUploadedDate:(double)a3;
- (void)setWalkingAndRunningDistance:(double)a3;
- (void)setWheelchairUse:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableFitnessFriendActivitySnapshot

- (void)setSample:(id)a3
{
}

- (void)setFriendUUID:(id)a3
{
}

- (void)setSourceUUID:(id)a3
{
}

- (void)setActiveHours:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_activeHours = a3;
}

- (void)setActiveHoursGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_activeHoursGoal = a3;
}

- (void)setBriskMinutes:(double)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_briskMinutes = a3;
}

- (void)setBriskMinutesGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_briskMinutesGoal = a3;
}

- (void)setEnergyBurned:(double)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_energyBurned = a3;
}

- (void)setEnergyBurnedGoal:(double)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_energyBurnedGoal = a3;
}

- (void)setWalkingAndRunningDistance:(double)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_walkingAndRunningDistance = a3;
}

- (void)setStepCount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_stepCount = a3;
}

- (void)setSnapshotIndex:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_snapshotIndex = a3;
}

- (void)setUploadedDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_uploadedDate = a3;
}

- (void)setPushCount:(double)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_pushCount = a3;
}

- (void)setWheelchairUse:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_wheelchairUse = a3;
}

- (void)setTimeZoneOffsetFromUTCForNoon:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_timeZoneOffsetFromUTCForNoon = a3;
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
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_sourceUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_43:
  PBDataWriterWriteDoubleField();
  id v4 = v6;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_25:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceUUID, 0);
  objc_storeStrong((id *)&self->_sample, 0);

  objc_storeStrong((id *)&self->_friendUUID, 0);
}

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDCodableFitnessFriendActivitySnapshot *)self sample];
    int v6 = [v5 applyToObject:v4];
    if (v6)
    {
      if ([(HDCodableFitnessFriendActivitySnapshot *)self hasFriendUUID])
      {
        v7 = (void *)MEMORY[0x1E4F29128];
        v8 = [(HDCodableFitnessFriendActivitySnapshot *)self friendUUID];
        v9 = objc_msgSend(v7, "hk_UUIDWithData:", v8);

        [v4 setFriendUUID:v9];
      }
      if ([(HDCodableFitnessFriendActivitySnapshot *)self hasSourceUUID])
      {
        v10 = (void *)MEMORY[0x1E4F29128];
        v11 = [(HDCodableFitnessFriendActivitySnapshot *)self sourceUUID];
        v12 = objc_msgSend(v10, "hk_UUIDWithData:", v11);

        [v4 setSourceUUID:v12];
      }
      if ([(HDCodableFitnessFriendActivitySnapshot *)self hasTimeZoneOffsetFromUTCForNoon])
      {
        v13 = objc_msgSend(NSNumber, "numberWithLongLong:", -[HDCodableFitnessFriendActivitySnapshot timeZoneOffsetFromUTCForNoon](self, "timeZoneOffsetFromUTCForNoon"));
        [v4 setTimeZoneOffsetFromUTCForNoon:v13];
      }
      [(HDCodableFitnessFriendActivitySnapshot *)self activeHours];
      objc_msgSend(v4, "setActiveHours:");
      [(HDCodableFitnessFriendActivitySnapshot *)self activeHoursGoal];
      objc_msgSend(v4, "setActiveHoursGoal:");
      [(HDCodableFitnessFriendActivitySnapshot *)self briskMinutes];
      objc_msgSend(v4, "setBriskMinutes:");
      [(HDCodableFitnessFriendActivitySnapshot *)self briskMinutesGoal];
      objc_msgSend(v4, "setBriskMinutesGoal:");
      [(HDCodableFitnessFriendActivitySnapshot *)self energyBurned];
      objc_msgSend(v4, "setEnergyBurned:");
      [(HDCodableFitnessFriendActivitySnapshot *)self energyBurnedGoal];
      objc_msgSend(v4, "setEnergyBurnedGoal:");
      [(HDCodableFitnessFriendActivitySnapshot *)self mmv];
      objc_msgSend(v4, "setMmv:");
      [(HDCodableFitnessFriendActivitySnapshot *)self mmg];
      objc_msgSend(v4, "setMmg:");
      objc_msgSend(v4, "setAmm:", -[HDCodableFitnessFriendActivitySnapshot amm](self, "amm"));
      [(HDCodableFitnessFriendActivitySnapshot *)self walkingAndRunningDistance];
      objc_msgSend(v4, "setWalkingAndRunningDistance:");
      [(HDCodableFitnessFriendActivitySnapshot *)self stepCount];
      objc_msgSend(v4, "setStepCount:");
      objc_msgSend(v4, "setSnapshotIndex:", -[HDCodableFitnessFriendActivitySnapshot snapshotIndex](self, "snapshotIndex"));
      id v14 = objc_alloc(MEMORY[0x1E4F1C9C8]);
      [(HDCodableFitnessFriendActivitySnapshot *)self uploadedDate];
      v15 = objc_msgSend(v14, "initWithTimeIntervalSinceReferenceDate:");
      [v4 setSnapshotUploadedDate:v15];

      [(HDCodableFitnessFriendActivitySnapshot *)self pushCount];
      objc_msgSend(v4, "setPushCount:");
      objc_msgSend(v4, "setWheelchairUse:", -[HDCodableFitnessFriendActivitySnapshot wheelchairUse](self, "wheelchairUse"));
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (BOOL)hasSourceUUID
{
  return self->_sourceUUID != 0;
}

- (NSData)sourceUUID
{
  return self->_sourceUUID;
}

- (BOOL)hasTimeZoneOffsetFromUTCForNoon
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int64_t)timeZoneOffsetFromUTCForNoon
{
  return self->_timeZoneOffsetFromUTCForNoon;
}

- (double)activeHours
{
  return self->_activeHours;
}

- (double)activeHoursGoal
{
  return self->_activeHoursGoal;
}

- (double)briskMinutes
{
  return self->_briskMinutes;
}

- (double)briskMinutesGoal
{
  return self->_briskMinutesGoal;
}

- (double)energyBurned
{
  return self->_energyBurned;
}

- (double)energyBurnedGoal
{
  return self->_energyBurnedGoal;
}

- (double)walkingAndRunningDistance
{
  return self->_walkingAndRunningDistance;
}

- (double)stepCount
{
  return self->_stepCount;
}

- (int64_t)snapshotIndex
{
  return self->_snapshotIndex;
}

- (double)uploadedDate
{
  return self->_uploadedDate;
}

- (double)pushCount
{
  return self->_pushCount;
}

- (int64_t)wheelchairUse
{
  return self->_wheelchairUse;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setHasSnapshotIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSnapshotIndex
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDate:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasDate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasTimeZoneOffsetFromUTCForNoon:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (void)setHasEnergyBurned:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasEnergyBurned
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setHasEnergyBurnedGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasEnergyBurnedGoal
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHasBriskMinutes:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasBriskMinutes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasBriskMinutesGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBriskMinutesGoal
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasActiveHours:(BOOL)a3
{
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasActiveHours
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setHasActiveHoursGoal:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasActiveHoursGoal
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasWalkingAndRunningDistance:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasWalkingAndRunningDistance
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHasStepCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasStepCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setHasPushCount:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPushCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setHasWheelchairUse:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasWheelchairUse
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHasUploadedDate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasUploadedDate
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setMmv:(double)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_mmv = a3;
}

- (void)setHasMmv:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasMmv
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setMmg:(double)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_mmg = a3;
}

- (void)setHasMmg:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMmg
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setAmm:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_amm = a3;
}

- (void)setHasAmm:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$081F708D30B0F12373AF125BF1BBEDA9 has = ($081F708D30B0F12373AF125BF1BBEDA9)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAmm
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (NSString)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableFitnessFriendActivitySnapshot;
  id v4 = [(HDCodableFitnessFriendActivitySnapshot *)&v8 description];
  v5 = [(HDCodableFitnessFriendActivitySnapshot *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  int v3 = [MEMORY[0x1E4F1CA60] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(HDCodableSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  friendUUID = self->_friendUUID;
  if (friendUUID) {
    [v3 setObject:friendUUID forKey:@"friendUUID"];
  }
  sourceUUID = self->_sourceUUID;
  if (sourceUUID) {
    [v3 setObject:sourceUUID forKey:@"sourceUUID"];
  }
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_snapshotIndex];
    [v3 setObject:v11 forKey:@"snapshotIndex"];

    $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithDouble:self->_date];
  [v3 setObject:v12 forKey:@"date"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  v13 = [NSNumber numberWithLongLong:self->_timeZoneOffsetFromUTCForNoon];
  [v3 setObject:v13 forKey:@"timeZoneOffsetFromUTCForNoon"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  id v14 = [NSNumber numberWithDouble:self->_energyBurned];
  [v3 setObject:v14 forKey:@"energyBurned"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  v15 = [NSNumber numberWithDouble:self->_energyBurnedGoal];
  [v3 setObject:v15 forKey:@"energyBurnedGoal"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  v16 = [NSNumber numberWithDouble:self->_briskMinutes];
  [v3 setObject:v16 forKey:@"briskMinutes"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  v17 = [NSNumber numberWithDouble:self->_briskMinutesGoal];
  [v3 setObject:v17 forKey:@"briskMinutesGoal"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  v18 = [NSNumber numberWithDouble:self->_activeHours];
  [v3 setObject:v18 forKey:@"activeHours"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  v19 = [NSNumber numberWithDouble:self->_activeHoursGoal];
  [v3 setObject:v19 forKey:@"activeHoursGoal"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  v20 = [NSNumber numberWithDouble:self->_walkingAndRunningDistance];
  [v3 setObject:v20 forKey:@"walkingAndRunningDistance"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  v21 = [NSNumber numberWithDouble:self->_stepCount];
  [v3 setObject:v21 forKey:@"stepCount"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = [NSNumber numberWithDouble:self->_pushCount];
  [v3 setObject:v22 forKey:@"pushCount"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = [NSNumber numberWithLongLong:self->_wheelchairUse];
  [v3 setObject:v23 forKey:@"wheelchairUse"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_41:
  v24 = [NSNumber numberWithDouble:self->_uploadedDate];
  [v3 setObject:v24 forKey:@"uploadedDate"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_43;
  }
LABEL_42:
  v25 = [NSNumber numberWithDouble:self->_mmv];
  [v3 setObject:v25 forKey:@"mmv"];

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_43:
  v26 = [NSNumber numberWithDouble:self->_mmg];
  [v3 setObject:v26 forKey:@"mmg"];

  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    v9 = [NSNumber numberWithLongLong:self->_amm];
    [v3 setObject:v9 forKey:@"amm"];
  }
LABEL_25:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFitnessFriendActivitySnapshotReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_friendUUID)
  {
    objc_msgSend(v6, "setFriendUUID:");
    id v4 = v6;
  }
  if (self->_sourceUUID)
  {
    objc_msgSend(v6, "setSourceUUID:");
    id v4 = v6;
  }
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *((void *)v4 + 12) = self->_snapshotIndex;
    *((_DWORD *)v4 + 42) |= 0x800u;
    $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_9;
  }
  *((void *)v4 + 6) = *(void *)&self->_date;
  *((_DWORD *)v4 + 42) |= 0x20u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 14) = self->_timeZoneOffsetFromUTCForNoon;
  *((_DWORD *)v4 + 42) |= 0x2000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((void *)v4 + 7) = *(void *)&self->_energyBurned;
  *((_DWORD *)v4 + 42) |= 0x40u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 8) = *(void *)&self->_energyBurnedGoal;
  *((_DWORD *)v4 + 42) |= 0x80u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)v4 + 4) = *(void *)&self->_briskMinutes;
  *((_DWORD *)v4 + 42) |= 8u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 5) = *(void *)&self->_briskMinutesGoal;
  *((_DWORD *)v4 + 42) |= 0x10u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 1) = *(void *)&self->_activeHours;
  *((_DWORD *)v4 + 42) |= 1u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v4 + 2) = *(void *)&self->_activeHoursGoal;
  *((_DWORD *)v4 + 42) |= 2u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((void *)v4 + 16) = *(void *)&self->_walkingAndRunningDistance;
  *((_DWORD *)v4 + 42) |= 0x8000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((void *)v4 + 13) = *(void *)&self->_stepCount;
  *((_DWORD *)v4 + 42) |= 0x1000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((void *)v4 + 11) = *(void *)&self->_pushCount;
  *((_DWORD *)v4 + 42) |= 0x400u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((void *)v4 + 17) = self->_wheelchairUse;
  *((_DWORD *)v4 + 42) |= 0x10000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((void *)v4 + 15) = *(void *)&self->_uploadedDate;
  *((_DWORD *)v4 + 42) |= 0x4000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_23;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)v4 + 10) = *(void *)&self->_mmv;
  *((_DWORD *)v4 + 42) |= 0x200u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_43:
  *((void *)v4 + 9) = *(void *)&self->_mmg;
  *((_DWORD *)v4 + 42) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_24:
    *((void *)v4 + 3) = self->_amm;
    *((_DWORD *)v4 + 42) |= 4u;
  }
LABEL_25:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  v7 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v6;

  uint64_t v8 = [(NSData *)self->_friendUUID copyWithZone:a3];
  v9 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v8;

  uint64_t v10 = [(NSData *)self->_sourceUUID copyWithZone:a3];
  v11 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v10;

  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(void *)(v5 + 96) = self->_snapshotIndex;
    *(_DWORD *)(v5 + 168) |= 0x800u;
    $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
    if ((*(unsigned char *)&has & 0x20) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x2000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 48) = self->_date;
  *(_DWORD *)(v5 + 168) |= 0x20u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 112) = self->_timeZoneOffsetFromUTCForNoon;
  *(_DWORD *)(v5 + 168) |= 0x2000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 56) = self->_energyBurned;
  *(_DWORD *)(v5 + 168) |= 0x40u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v5 + 64) = self->_energyBurnedGoal;
  *(_DWORD *)(v5 + 168) |= 0x80u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v5 + 32) = self->_briskMinutes;
  *(_DWORD *)(v5 + 168) |= 8u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 40) = self->_briskMinutesGoal;
  *(_DWORD *)(v5 + 168) |= 0x10u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 8) = self->_activeHours;
  *(_DWORD *)(v5 + 168) |= 1u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 16) = self->_activeHoursGoal;
  *(_DWORD *)(v5 + 168) |= 2u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 128) = self->_walkingAndRunningDistance;
  *(_DWORD *)(v5 + 168) |= 0x8000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 104) = self->_stepCount;
  *(_DWORD *)(v5 + 168) |= 0x1000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 88) = self->_pushCount;
  *(_DWORD *)(v5 + 168) |= 0x400u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v5 + 136) = self->_wheelchairUse;
  *(_DWORD *)(v5 + 168) |= 0x10000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(double *)(v5 + 120) = self->_uploadedDate;
  *(_DWORD *)(v5 + 168) |= 0x4000u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_17;
    }
LABEL_35:
    *(double *)(v5 + 72) = self->_mmg;
    *(_DWORD *)(v5 + 168) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_18;
  }
LABEL_34:
  *(double *)(v5 + 80) = self->_mmv;
  *(_DWORD *)(v5 + 168) |= 0x200u;
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0) {
    goto LABEL_35;
  }
LABEL_17:
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_18:
    *(void *)(v5 + 24) = self->_amm;
    *(_DWORD *)(v5 + 168) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_93;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 19))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_93;
    }
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:")) {
      goto LABEL_93;
    }
  }
  sourceUUID = self->_sourceUUID;
  if ((unint64_t)sourceUUID | *((void *)v4 + 20))
  {
    if (!-[NSData isEqual:](sourceUUID, "isEqual:")) {
      goto LABEL_93;
    }
  }
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  int v9 = *((_DWORD *)v4 + 42);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_snapshotIndex != *((void *)v4 + 12)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x800) != 0)
  {
LABEL_93:
    BOOL v10 = 0;
    goto LABEL_94;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_date != *((double *)v4 + 6)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_timeZoneOffsetFromUTCForNoon != *((void *)v4 + 14)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_energyBurned != *((double *)v4 + 7)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_energyBurnedGoal != *((double *)v4 + 8)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_briskMinutes != *((double *)v4 + 4)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_briskMinutesGoal != *((double *)v4 + 5)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_93;
  }
  if (*(unsigned char *)&has)
  {
    if ((v9 & 1) == 0 || self->_activeHours != *((double *)v4 + 1)) {
      goto LABEL_93;
    }
  }
  else if (v9)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_activeHoursGoal != *((double *)v4 + 2)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_walkingAndRunningDistance != *((double *)v4 + 16)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_stepCount != *((double *)v4 + 13)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_pushCount != *((double *)v4 + 11)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_wheelchairUse != *((void *)v4 + 17)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_uploadedDate != *((double *)v4 + 15)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_mmv != *((double *)v4 + 10)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_93;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_mmg != *((double *)v4 + 9)) {
      goto LABEL_93;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_93;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_amm != *((void *)v4 + 3)) {
      goto LABEL_93;
    }
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = (*((_DWORD *)v4 + 42) & 4) == 0;
  }
LABEL_94:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v82 = [(HDCodableSample *)self->_sample hash];
  uint64_t v81 = [(NSData *)self->_friendUUID hash];
  uint64_t v80 = [(NSData *)self->_sourceUUID hash];
  $081F708D30B0F12373AF125BF1BBEDA9 has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    uint64_t v79 = 2654435761 * self->_snapshotIndex;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v79 = 0;
  if ((*(unsigned char *)&has & 0x20) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double date = self->_date;
  double v5 = -date;
  if (date >= 0.0) {
    double v5 = self->_date;
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
LABEL_11:
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    uint64_t v78 = 2654435761 * self->_timeZoneOffsetFromUTCForNoon;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_13;
    }
LABEL_18:
    unint64_t v13 = 0;
    goto LABEL_21;
  }
  uint64_t v78 = 0;
  if ((*(unsigned char *)&has & 0x40) == 0) {
    goto LABEL_18;
  }
LABEL_13:
  double energyBurned = self->_energyBurned;
  double v10 = -energyBurned;
  if (energyBurned >= 0.0) {
    double v10 = self->_energyBurned;
  }
  long double v11 = floor(v10 + 0.5);
  double v12 = (v10 - v11) * 1.84467441e19;
  unint64_t v13 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
  if (v12 >= 0.0)
  {
    if (v12 > 0.0) {
      v13 += (unint64_t)v12;
    }
  }
  else
  {
    v13 -= (unint64_t)fabs(v12);
  }
LABEL_21:
  unint64_t v75 = v13;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    double energyBurnedGoal = self->_energyBurnedGoal;
    double v16 = -energyBurnedGoal;
    if (energyBurnedGoal >= 0.0) {
      double v16 = self->_energyBurnedGoal;
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
  if ((*(unsigned char *)&has & 8) != 0)
  {
    double briskMinutes = self->_briskMinutes;
    double v21 = -briskMinutes;
    if (briskMinutes >= 0.0) {
      double v21 = self->_briskMinutes;
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
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    double briskMinutesGoal = self->_briskMinutesGoal;
    double v26 = -briskMinutesGoal;
    if (briskMinutesGoal >= 0.0) {
      double v26 = self->_briskMinutesGoal;
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
  if (*(unsigned char *)&has)
  {
    double activeHours = self->_activeHours;
    double v31 = -activeHours;
    if (activeHours >= 0.0) {
      double v31 = self->_activeHours;
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
  if ((*(unsigned char *)&has & 2) != 0)
  {
    double activeHoursGoal = self->_activeHoursGoal;
    double v36 = -activeHoursGoal;
    if (activeHoursGoal >= 0.0) {
      double v36 = self->_activeHoursGoal;
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
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    double walkingAndRunningDistance = self->_walkingAndRunningDistance;
    double v41 = -walkingAndRunningDistance;
    if (walkingAndRunningDistance >= 0.0) {
      double v41 = self->_walkingAndRunningDistance;
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
  unint64_t v44 = v39;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    double stepCount = self->_stepCount;
    double v46 = -stepCount;
    if (stepCount >= 0.0) {
      double v46 = self->_stepCount;
    }
    long double v47 = floor(v46 + 0.5);
    double v48 = (v46 - v47) * 1.84467441e19;
    double v49 = fmod(v47, 1.84467441e19);
    if (v48 >= 0.0)
    {
      unint64_t v83 = 2654435761u * (unint64_t)v49;
      unint64_t v39 = v44;
      if (v48 > 0.0) {
        v83 += (unint64_t)v48;
      }
    }
    else
    {
      unint64_t v83 = 2654435761u * (unint64_t)v49 - (unint64_t)fabs(v48);
      unint64_t v39 = v44;
    }
  }
  else
  {
    unint64_t v83 = 0;
  }
  unint64_t v77 = v8;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    double pushCount = self->_pushCount;
    double v52 = -pushCount;
    if (pushCount >= 0.0) {
      double v52 = self->_pushCount;
    }
    long double v53 = floor(v52 + 0.5);
    double v54 = (v52 - v53) * 1.84467441e19;
    unint64_t v50 = 2654435761u * (unint64_t)fmod(v53, 1.84467441e19);
    if (v54 >= 0.0)
    {
      unint64_t v39 = v44;
      if (v54 > 0.0) {
        v50 += (unint64_t)v54;
      }
    }
    else
    {
      v50 -= (unint64_t)fabs(v54);
      unint64_t v39 = v44;
    }
  }
  else
  {
    unint64_t v50 = 0;
  }
  unint64_t v76 = v14;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    uint64_t v74 = 2654435761 * self->_wheelchairUse;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_87;
    }
LABEL_92:
    unint64_t v60 = v34;
    unint64_t v59 = 0;
    goto LABEL_95;
  }
  uint64_t v74 = 0;
  if ((*(_WORD *)&has & 0x4000) == 0) {
    goto LABEL_92;
  }
LABEL_87:
  double uploadedDate = self->_uploadedDate;
  double v56 = -uploadedDate;
  if (uploadedDate >= 0.0) {
    double v56 = self->_uploadedDate;
  }
  long double v57 = floor(v56 + 0.5);
  double v58 = (v56 - v57) * 1.84467441e19;
  unint64_t v59 = 2654435761u * (unint64_t)fmod(v57, 1.84467441e19);
  unint64_t v60 = v34;
  if (v58 >= 0.0)
  {
    unint64_t v39 = v44;
    if (v58 > 0.0) {
      v59 += (unint64_t)v58;
    }
  }
  else
  {
    v59 -= (unint64_t)fabs(v58);
    unint64_t v39 = v44;
  }
LABEL_95:
  unint64_t v61 = v19;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    double mmv = self->_mmv;
    double v64 = -mmv;
    if (mmv >= 0.0) {
      double v64 = self->_mmv;
    }
    long double v65 = floor(v64 + 0.5);
    double v66 = (v64 - v65) * 1.84467441e19;
    unint64_t v62 = 2654435761u * (unint64_t)fmod(v65, 1.84467441e19);
    if (v66 >= 0.0)
    {
      unint64_t v39 = v44;
      if (v66 > 0.0) {
        v62 += (unint64_t)v66;
      }
    }
    else
    {
      v62 -= (unint64_t)fabs(v66);
      unint64_t v39 = v44;
    }
  }
  else
  {
    unint64_t v62 = 0;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    double mmg = self->_mmg;
    double v69 = -mmg;
    if (mmg >= 0.0) {
      double v69 = self->_mmg;
    }
    long double v70 = floor(v69 + 0.5);
    double v71 = (v69 - v70) * 1.84467441e19;
    unint64_t v67 = 2654435761u * (unint64_t)fmod(v70, 1.84467441e19);
    if (v71 >= 0.0)
    {
      unint64_t v39 = v44;
      if (v71 > 0.0) {
        v67 += (unint64_t)v71;
      }
    }
    else
    {
      v67 -= (unint64_t)fabs(v71);
      unint64_t v39 = v44;
    }
  }
  else
  {
    unint64_t v67 = 0;
  }
  if ((*(unsigned char *)&has & 4) != 0) {
    uint64_t v72 = 2654435761 * self->_amm;
  }
  else {
    uint64_t v72 = 0;
  }
  return v81 ^ v82 ^ v80 ^ v79 ^ v77 ^ v78 ^ v75 ^ v76 ^ v61 ^ v24 ^ v29 ^ v60 ^ v39 ^ v83 ^ v50 ^ v74 ^ v59 ^ v62 ^ v67 ^ v72;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 19);
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
    -[HDCodableFitnessFriendActivitySnapshot setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  if (*((void *)v4 + 18))
  {
    -[HDCodableFitnessFriendActivitySnapshot setFriendUUID:](self, "setFriendUUID:");
    id v4 = v8;
  }
  if (*((void *)v4 + 20))
  {
    -[HDCodableFitnessFriendActivitySnapshot setSourceUUID:](self, "setSourceUUID:");
    id v4 = v8;
  }
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x800) != 0)
  {
    self->_snapshotIndex = *((void *)v4 + 12);
    *(_DWORD *)&self->_has |= 0x800u;
    int v7 = *((_DWORD *)v4 + 42);
    if ((v7 & 0x20) == 0)
    {
LABEL_13:
      if ((v7 & 0x2000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_34;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_13;
  }
  self->_double date = *((double *)v4 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x2000) == 0)
  {
LABEL_14:
    if ((v7 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_timeZoneOffsetFromUTCForNoon = *((void *)v4 + 14);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x40) == 0)
  {
LABEL_15:
    if ((v7 & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_double energyBurned = *((double *)v4 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x80) == 0)
  {
LABEL_16:
    if ((v7 & 8) == 0) {
      goto LABEL_17;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_double energyBurnedGoal = *((double *)v4 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 8) == 0)
  {
LABEL_17:
    if ((v7 & 0x10) == 0) {
      goto LABEL_18;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_double briskMinutes = *((double *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x10) == 0)
  {
LABEL_18:
    if ((v7 & 1) == 0) {
      goto LABEL_19;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double briskMinutesGoal = *((double *)v4 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 1) == 0)
  {
LABEL_19:
    if ((v7 & 2) == 0) {
      goto LABEL_20;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_double activeHours = *((double *)v4 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 2) == 0)
  {
LABEL_20:
    if ((v7 & 0x8000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double activeHoursGoal = *((double *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x8000) == 0)
  {
LABEL_21:
    if ((v7 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_double walkingAndRunningDistance = *((double *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x1000) == 0)
  {
LABEL_22:
    if ((v7 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_double stepCount = *((double *)v4 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x400) == 0)
  {
LABEL_23:
    if ((v7 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_double pushCount = *((double *)v4 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x10000) == 0)
  {
LABEL_24:
    if ((v7 & 0x4000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_wheelchairUse = *((void *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x4000) == 0)
  {
LABEL_25:
    if ((v7 & 0x200) == 0) {
      goto LABEL_26;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_double uploadedDate = *((double *)v4 + 15);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x200) == 0)
  {
LABEL_26:
    if ((v7 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_double mmv = *((double *)v4 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v7 = *((_DWORD *)v4 + 42);
  if ((v7 & 0x100) == 0)
  {
LABEL_27:
    if ((v7 & 4) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_47:
  self->_double mmg = *((double *)v4 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)v4 + 42) & 4) != 0)
  {
LABEL_28:
    self->_amm = *((void *)v4 + 3);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_29:
}

- (double)date
{
  return self->_date;
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

@end