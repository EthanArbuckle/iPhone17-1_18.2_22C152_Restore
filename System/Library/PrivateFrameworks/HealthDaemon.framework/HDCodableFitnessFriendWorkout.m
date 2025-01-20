@interface HDCodableFitnessFriendWorkout
- (BOOL)applyToObject:(id)a3;
- (BOOL)hasAmm;
- (BOOL)hasBundleID;
- (BOOL)hasDeviceManufacturer;
- (BOOL)hasDeviceModel;
- (BOOL)hasDuration;
- (BOOL)hasFriendUUID;
- (BOOL)hasGoal;
- (BOOL)hasGoalType;
- (BOOL)hasIsIndoorWorkout;
- (BOOL)hasIsWatchWorkout;
- (BOOL)hasSample;
- (BOOL)hasSeymourCatalogWorkoutIdentifier;
- (BOOL)hasSeymourMediaType;
- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit;
- (BOOL)hasTotalDistanceInCanonicalUnit;
- (BOOL)hasTotalEnergyBurnedInCanonicalUnit;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HDCodableSample)sample;
- (NSData)friendUUID;
- (NSString)bundleID;
- (NSString)description;
- (NSString)deviceManufacturer;
- (NSString)deviceModel;
- (NSString)seymourCatalogWorkoutIdentifier;
- (NSString)seymourMediaType;
- (double)duration;
- (double)goal;
- (double)totalBasalEnergyBurnedInCanonicalUnit;
- (double)totalDistanceInCanonicalUnit;
- (double)totalEnergyBurnedInCanonicalUnit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)amm;
- (int64_t)goalType;
- (int64_t)isIndoorWorkout;
- (int64_t)isWatchWorkout;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmm:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceManufacturer:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFriendUUID:(id)a3;
- (void)setGoal:(double)a3;
- (void)setGoalType:(int64_t)a3;
- (void)setHasAmm:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasGoal:(BOOL)a3;
- (void)setHasGoalType:(BOOL)a3;
- (void)setHasIsIndoorWorkout:(BOOL)a3;
- (void)setHasIsWatchWorkout:(BOOL)a3;
- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsIndoorWorkout:(int64_t)a3;
- (void)setIsWatchWorkout:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setSeymourCatalogWorkoutIdentifier:(id)a3;
- (void)setSeymourMediaType:(id)a3;
- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3;
- (void)setTotalDistanceInCanonicalUnit:(double)a3;
- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableFitnessFriendWorkout

- (BOOL)applyToObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(HDCodableFitnessFriendWorkout *)self sample];
    int v6 = [v5 applyToObject:v4];
    if (v6)
    {
      if ([(HDCodableFitnessFriendWorkout *)self hasFriendUUID])
      {
        v7 = (void *)MEMORY[0x1E4F29128];
        v8 = [(HDCodableFitnessFriendWorkout *)self friendUUID];
        v9 = objc_msgSend(v7, "hk_UUIDWithData:", v8);

        [v4 setFriendUUID:v9];
      }
      [(HDCodableFitnessFriendWorkout *)self duration];
      objc_msgSend(v4, "setDuration:");
      if ([(HDCodableFitnessFriendWorkout *)self hasTotalEnergyBurnedInCanonicalUnit])
      {
        v10 = (void *)MEMORY[0x1E4F2B370];
        v11 = _HKWorkoutCanonicalEnergyBurnedUnit();
        [(HDCodableFitnessFriendWorkout *)self totalEnergyBurnedInCanonicalUnit];
        v12 = objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11);

        [v4 setTotalEnergyBurned:v12];
      }
      if ([(HDCodableFitnessFriendWorkout *)self hasTotalBasalEnergyBurnedInCanonicalUnit])
      {
        v13 = (void *)MEMORY[0x1E4F2B370];
        v14 = _HKWorkoutCanonicalEnergyBurnedUnit();
        [(HDCodableFitnessFriendWorkout *)self totalBasalEnergyBurnedInCanonicalUnit];
        v15 = objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);

        [v4 setTotalBasalEnergyBurned:v15];
      }
      if ([(HDCodableFitnessFriendWorkout *)self hasTotalDistanceInCanonicalUnit])
      {
        v16 = (void *)MEMORY[0x1E4F2B370];
        v17 = _HKWorkoutCanonicalDistanceUnit();
        [(HDCodableFitnessFriendWorkout *)self totalDistanceInCanonicalUnit];
        v18 = objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);

        [v4 setTotalDistance:v18];
      }
      objc_msgSend(v4, "setWorkoutActivityType:", -[HDCodableFitnessFriendWorkout type](self, "type"));
      objc_msgSend(v4, "setGoalType:", -[HDCodableFitnessFriendWorkout goalType](self, "goalType"));
      if ([(HDCodableFitnessFriendWorkout *)self hasGoal])
      {
        [v4 goalType];
        if (_HKWorkoutGoalTypeIsValidForGoal())
        {
          v19 = (void *)MEMORY[0x1E4F2B370];
          [(HDCodableFitnessFriendWorkout *)self goalType];
          v20 = _HKWorkoutCanonicalUnitForGoalType();
          [(HDCodableFitnessFriendWorkout *)self goal];
          v21 = objc_msgSend(v19, "quantityWithUnit:doubleValue:", v20);

          [v4 setGoal:v21];
        }
      }
      v22 = [(HDCodableFitnessFriendWorkout *)self bundleID];
      [v4 setBundleID:v22];

      objc_msgSend(v4, "setIsWatchWorkout:", -[HDCodableFitnessFriendWorkout isWatchWorkout](self, "isWatchWorkout") != 0);
      objc_msgSend(v4, "setIsIndoorWorkout:", -[HDCodableFitnessFriendWorkout isIndoorWorkout](self, "isIndoorWorkout") != 0);
      objc_msgSend(v4, "setAmm:", -[HDCodableFitnessFriendWorkout amm](self, "amm"));
      if ([(HDCodableFitnessFriendWorkout *)self hasDeviceManufacturer])
      {
        v23 = [(HDCodableFitnessFriendWorkout *)self deviceManufacturer];
        [v4 setDeviceManufacturer:v23];
      }
      if ([(HDCodableFitnessFriendWorkout *)self hasDeviceModel])
      {
        v24 = [(HDCodableFitnessFriendWorkout *)self deviceModel];
        [v4 setDeviceModel:v24];
      }
      v25 = [(HDCodableFitnessFriendWorkout *)self seymourCatalogWorkoutIdentifier];

      if (v25)
      {
        v26 = [(HDCodableFitnessFriendWorkout *)self seymourCatalogWorkoutIdentifier];
        [v4 setSeymourCatalogWorkoutIdentifier:v26];
      }
      v27 = [(HDCodableFitnessFriendWorkout *)self seymourMediaType];

      if (v27)
      {
        v28 = [(HDCodableFitnessFriendWorkout *)self seymourMediaType];
        [v4 setSeymourMediaType:v28];
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (BOOL)hasFriendUUID
{
  return self->_friendUUID != 0;
}

- (void)setType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDuration:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_totalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTotalEnergyBurnedInCanonicalUnit
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalBasalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTotalDistanceInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_totalDistanceInCanonicalUnit = a3;
}

- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTotalDistanceInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setGoalType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_goalType = a3;
}

- (void)setHasGoalType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasGoalType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setGoal:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_goal = a3;
}

- (void)setHasGoal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGoal
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setIsWatchWorkout:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_isWatchWorkout = a3;
}

- (void)setHasIsWatchWorkout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasIsWatchWorkout
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setIsIndoorWorkout:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_isIndoorWorkout = a3;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasIsIndoorWorkout
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasDeviceManufacturer
{
  return self->_deviceManufacturer != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setAmm:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_amm = a3;
}

- (void)setHasAmm:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAmm
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasSeymourCatalogWorkoutIdentifier
{
  return self->_seymourCatalogWorkoutIdentifier != 0;
}

- (BOOL)hasSeymourMediaType
{
  return self->_seymourMediaType != 0;
}

- (NSString)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableFitnessFriendWorkout;
  id v4 = [(HDCodableFitnessFriendWorkout *)&v8 description];
  v5 = [(HDCodableFitnessFriendWorkout *)self dictionaryRepresentation];
  int v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    v19 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v19 forKey:@"type"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  v20 = [NSNumber numberWithDouble:self->_duration];
  [v3 setObject:v20 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  v21 = [NSNumber numberWithDouble:self->_totalEnergyBurnedInCanonicalUnit];
  [v3 setObject:v21 forKey:@"totalEnergyBurnedInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  v22 = [NSNumber numberWithDouble:self->_totalBasalEnergyBurnedInCanonicalUnit];
  [v3 setObject:v22 forKey:@"totalBasalEnergyBurnedInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  v23 = [NSNumber numberWithDouble:self->_totalDistanceInCanonicalUnit];
  [v3 setObject:v23 forKey:@"totalDistanceInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_37:
  v24 = [NSNumber numberWithLongLong:self->_goalType];
  [v3 setObject:v24 forKey:@"goalType"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    objc_super v8 = [NSNumber numberWithDouble:self->_goal];
    [v3 setObject:v8 forKey:@"goal"];
  }
LABEL_13:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    v11 = [NSNumber numberWithLongLong:self->_isWatchWorkout];
    [v3 setObject:v11 forKey:@"isWatchWorkout"];

    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 0x10) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_isIndoorWorkout];
    [v3 setObject:v12 forKey:@"isIndoorWorkout"];
  }
  deviceManufacturer = self->_deviceManufacturer;
  if (deviceManufacturer) {
    [v3 setObject:deviceManufacturer forKey:@"deviceManufacturer"];
  }
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"deviceModel"];
  }
  if (*(_WORD *)&self->_has)
  {
    v15 = [NSNumber numberWithLongLong:self->_amm];
    [v3 setObject:v15 forKey:@"amm"];
  }
  seymourCatalogWorkoutIdentifier = self->_seymourCatalogWorkoutIdentifier;
  if (seymourCatalogWorkoutIdentifier) {
    [v3 setObject:seymourCatalogWorkoutIdentifier forKey:@"seymourCatalogWorkoutIdentifier"];
  }
  seymourMediaType = self->_seymourMediaType;
  if (seymourMediaType) {
    [v3 setObject:seymourMediaType forKey:@"seymourMediaType"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableFitnessFriendWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_sample)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_friendUUID)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_37:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_13:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
  if (self->_deviceManufacturer)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_deviceModel)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (*(_WORD *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
  if (self->_seymourCatalogWorkoutIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_seymourMediaType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_sample)
  {
    objc_msgSend(v4, "setSample:");
    id v4 = v7;
  }
  if (self->_friendUUID)
  {
    objc_msgSend(v7, "setFriendUUID:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((void *)v4 + 10) = self->_type;
    *((_WORD *)v4 + 72) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 0x100) == 0) {
        goto LABEL_8;
      }
      goto LABEL_34;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = *(void *)&self->_duration;
  *((_WORD *)v4 + 72) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 9) = *(void *)&self->_totalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 72) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x80) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)v4 + 7) = *(void *)&self->_totalBasalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 72) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)v4 + 8) = *(void *)&self->_totalDistanceInCanonicalUnit;
  *((_WORD *)v4 + 72) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_37:
  *((void *)v4 + 4) = self->_goalType;
  *((_WORD *)v4 + 72) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_12:
    *((void *)v4 + 3) = *(void *)&self->_goal;
    *((_WORD *)v4 + 72) |= 4u;
  }
LABEL_13:
  if (self->_bundleID)
  {
    objc_msgSend(v7, "setBundleID:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x20) != 0)
  {
    *((void *)v4 + 6) = self->_isWatchWorkout;
    *((_WORD *)v4 + 72) |= 0x20u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x10) != 0)
  {
    *((void *)v4 + 5) = self->_isIndoorWorkout;
    *((_WORD *)v4 + 72) |= 0x10u;
  }
  if (self->_deviceManufacturer)
  {
    objc_msgSend(v7, "setDeviceManufacturer:");
    id v4 = v7;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v7, "setDeviceModel:");
    id v4 = v7;
  }
  if (*(_WORD *)&self->_has)
  {
    *((void *)v4 + 1) = self->_amm;
    *((_WORD *)v4 + 72) |= 1u;
  }
  if (self->_seymourCatalogWorkoutIdentifier)
  {
    objc_msgSend(v7, "setSeymourCatalogWorkoutIdentifier:");
    id v4 = v7;
  }
  if (self->_seymourMediaType)
  {
    objc_msgSend(v7, "setSeymourMediaType:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  id v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSData *)self->_friendUUID copyWithZone:a3];
  v9 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v8;

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(void *)(v5 + 80) = self->_type;
    *(_WORD *)(v5 + 144) |= 0x200u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 16) = self->_duration;
  *(_WORD *)(v5 + 144) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 72) = self->_totalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 144) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 56) = self->_totalBasalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 144) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 64) = self->_totalDistanceInCanonicalUnit;
  *(_WORD *)(v5 + 144) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_21:
  *(void *)(v5 + 32) = self->_goalType;
  *(_WORD *)(v5 + 144) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(double *)(v5 + 24) = self->_goal;
    *(_WORD *)(v5 + 144) |= 4u;
  }
LABEL_9:
  uint64_t v11 = [(NSString *)self->_bundleID copyWithZone:a3];
  v12 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v11;

  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_isWatchWorkout;
    *(_WORD *)(v5 + 144) |= 0x20u;
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_isIndoorWorkout;
    *(_WORD *)(v5 + 144) |= 0x10u;
  }
  uint64_t v14 = [(NSString *)self->_deviceManufacturer copyWithZone:a3];
  v15 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v14;

  uint64_t v16 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_amm;
    *(_WORD *)(v5 + 144) |= 1u;
  }
  uint64_t v18 = [(NSString *)self->_seymourCatalogWorkoutIdentifier copyWithZone:a3];
  v19 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v18;

  uint64_t v20 = [(NSString *)self->_seymourMediaType copyWithZone:a3];
  v21 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v20;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_67;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 15))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_67;
    }
  }
  friendUUID = self->_friendUUID;
  if ((unint64_t)friendUUID | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](friendUUID, "isEqual:")) {
      goto LABEL_67;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)v4 + 72);
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x200) == 0 || self->_type != *((void *)v4 + 10)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x200) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_67;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 72) & 0x100) == 0 || self->_totalEnergyBurnedInCanonicalUnit != *((double *)v4 + 9)) {
      goto LABEL_67;
    }
  }
  else if ((*((_WORD *)v4 + 72) & 0x100) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_totalBasalEnergyBurnedInCanonicalUnit != *((double *)v4 + 7)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0 || self->_totalDistanceInCanonicalUnit != *((double *)v4 + 8)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_goalType != *((void *)v4 + 4)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_goal != *((double *)v4 + 3)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_67;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:"))
    {
LABEL_67:
      char v15 = 0;
      goto LABEL_68;
    }
    __int16 has = (__int16)self->_has;
    __int16 v8 = *((_WORD *)v4 + 72);
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_isWatchWorkout != *((void *)v4 + 6)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_67;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_isIndoorWorkout != *((void *)v4 + 5)) {
      goto LABEL_67;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_67;
  }
  deviceManufacturer = self->_deviceManufacturer;
  if ((unint64_t)deviceManufacturer | *((void *)v4 + 12)
    && !-[NSString isEqual:](deviceManufacturer, "isEqual:"))
  {
    goto LABEL_67;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_67;
    }
  }
  __int16 v12 = *((_WORD *)v4 + 72);
  if (*(_WORD *)&self->_has)
  {
    if ((v12 & 1) == 0 || self->_amm != *((void *)v4 + 1)) {
      goto LABEL_67;
    }
  }
  else if (v12)
  {
    goto LABEL_67;
  }
  seymourCatalogWorkoutIdentifier = self->_seymourCatalogWorkoutIdentifier;
  if ((unint64_t)seymourCatalogWorkoutIdentifier | *((void *)v4 + 16)
    && !-[NSString isEqual:](seymourCatalogWorkoutIdentifier, "isEqual:"))
  {
    goto LABEL_67;
  }
  seymourMediaType = self->_seymourMediaType;
  if ((unint64_t)seymourMediaType | *((void *)v4 + 17)) {
    char v15 = -[NSString isEqual:](seymourMediaType, "isEqual:");
  }
  else {
    char v15 = 1;
  }
LABEL_68:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v45 = [(HDCodableSample *)self->_sample hash];
  uint64_t v44 = [(NSData *)self->_friendUUID hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    uint64_t v43 = 2654435761 * self->_type;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v43 = 0;
  if ((has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double duration = self->_duration;
  double v5 = -duration;
  if (duration >= 0.0) {
    double v5 = self->_duration;
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
  if ((has & 0x100) != 0)
  {
    double totalEnergyBurnedInCanonicalUnit = self->_totalEnergyBurnedInCanonicalUnit;
    double v11 = -totalEnergyBurnedInCanonicalUnit;
    if (totalEnergyBurnedInCanonicalUnit >= 0.0) {
      double v11 = self->_totalEnergyBurnedInCanonicalUnit;
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
  if ((has & 0x40) != 0)
  {
    double totalBasalEnergyBurnedInCanonicalUnit = self->_totalBasalEnergyBurnedInCanonicalUnit;
    double v16 = -totalBasalEnergyBurnedInCanonicalUnit;
    if (totalBasalEnergyBurnedInCanonicalUnit >= 0.0) {
      double v16 = self->_totalBasalEnergyBurnedInCanonicalUnit;
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
  unint64_t v42 = v9;
  if ((has & 0x80) != 0)
  {
    double totalDistanceInCanonicalUnit = self->_totalDistanceInCanonicalUnit;
    double v21 = -totalDistanceInCanonicalUnit;
    if (totalDistanceInCanonicalUnit >= 0.0) {
      double v21 = self->_totalDistanceInCanonicalUnit;
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
  if ((has & 8) != 0) {
    uint64_t v39 = 2654435761 * self->_goalType;
  }
  else {
    uint64_t v39 = 0;
  }
  unint64_t v41 = v14;
  if ((has & 4) != 0)
  {
    double goal = self->_goal;
    double v26 = -goal;
    if (goal >= 0.0) {
      double v26 = self->_goal;
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
  NSUInteger v29 = [(NSString *)self->_bundleID hash];
  __int16 v30 = (__int16)self->_has;
  if ((v30 & 0x20) != 0)
  {
    uint64_t v31 = 2654435761 * self->_isWatchWorkout;
    if ((v30 & 0x10) != 0) {
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((v30 & 0x10) != 0)
    {
LABEL_48:
      uint64_t v32 = 2654435761 * self->_isIndoorWorkout;
      goto LABEL_51;
    }
  }
  uint64_t v32 = 0;
LABEL_51:
  NSUInteger v33 = [(NSString *)self->_deviceManufacturer hash];
  NSUInteger v34 = [(NSString *)self->_deviceModel hash];
  if (*(_WORD *)&self->_has) {
    uint64_t v35 = 2654435761 * self->_amm;
  }
  else {
    uint64_t v35 = 0;
  }
  unint64_t v36 = v44 ^ v45 ^ v43 ^ v8 ^ v42 ^ v41 ^ v19 ^ v40 ^ v24 ^ v29 ^ v31 ^ v32 ^ v33 ^ v34;
  NSUInteger v37 = v35 ^ [(NSString *)self->_seymourCatalogWorkoutIdentifier hash];
  return v36 ^ v37 ^ [(NSString *)self->_seymourMediaType hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 15);
  id v9 = v4;
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
    -[HDCodableFitnessFriendWorkout setSample:](self, "setSample:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 14))
  {
    -[HDCodableFitnessFriendWorkout setFriendUUID:](self, "setFriendUUID:");
    id v4 = v9;
  }
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x200) != 0)
  {
    self->_type = *((void *)v4 + 10);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v7 = *((_WORD *)v4 + 72);
    if ((v7 & 2) == 0)
    {
LABEL_11:
      if ((v7 & 0x100) == 0) {
        goto LABEL_12;
      }
      goto LABEL_38;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_double duration = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x100) == 0)
  {
LABEL_12:
    if ((v7 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double totalEnergyBurnedInCanonicalUnit = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x40) == 0)
  {
LABEL_13:
    if ((v7 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_double totalBasalEnergyBurnedInCanonicalUnit = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 0x80) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_double totalDistanceInCanonicalUnit = *((double *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v7 = *((_WORD *)v4 + 72);
  if ((v7 & 8) == 0)
  {
LABEL_15:
    if ((v7 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_41:
  self->_goalType = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 72) & 4) != 0)
  {
LABEL_16:
    self->_double goal = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_17:
  if (*((void *)v4 + 11))
  {
    -[HDCodableFitnessFriendWorkout setBundleID:](self, "setBundleID:");
    id v4 = v9;
  }
  __int16 v8 = *((_WORD *)v4 + 72);
  if ((v8 & 0x20) != 0)
  {
    self->_isWatchWorkout = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v8 = *((_WORD *)v4 + 72);
  }
  if ((v8 & 0x10) != 0)
  {
    self->_isIndoorWorkout = *((void *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 12))
  {
    -[HDCodableFitnessFriendWorkout setDeviceManufacturer:](self, "setDeviceManufacturer:");
    id v4 = v9;
  }
  if (*((void *)v4 + 13))
  {
    -[HDCodableFitnessFriendWorkout setDeviceModel:](self, "setDeviceModel:");
    id v4 = v9;
  }
  if (*((_WORD *)v4 + 72))
  {
    self->_amm = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 16))
  {
    [(HDCodableFitnessFriendWorkout *)self setSeymourCatalogWorkoutIdentifier:"setSeymourCatalogWorkoutIdentifier:"];
    id v4 = v9;
  }
  if (*((void *)v4 + 17))
  {
    -[HDCodableFitnessFriendWorkout setSeymourMediaType:](self, "setSeymourMediaType:");
    id v4 = v9;
  }
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (NSData)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (double)duration
{
  return self->_duration;
}

- (double)totalEnergyBurnedInCanonicalUnit
{
  return self->_totalEnergyBurnedInCanonicalUnit;
}

- (double)totalBasalEnergyBurnedInCanonicalUnit
{
  return self->_totalBasalEnergyBurnedInCanonicalUnit;
}

- (double)totalDistanceInCanonicalUnit
{
  return self->_totalDistanceInCanonicalUnit;
}

- (int64_t)goalType
{
  return self->_goalType;
}

- (double)goal
{
  return self->_goal;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (int64_t)isWatchWorkout
{
  return self->_isWatchWorkout;
}

- (int64_t)isIndoorWorkout
{
  return self->_isIndoorWorkout;
}

- (NSString)deviceManufacturer
{
  return self->_deviceManufacturer;
}

- (void)setDeviceManufacturer:(id)a3
{
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (int64_t)amm
{
  return self->_amm;
}

- (NSString)seymourCatalogWorkoutIdentifier
{
  return self->_seymourCatalogWorkoutIdentifier;
}

- (void)setSeymourCatalogWorkoutIdentifier:(id)a3
{
}

- (NSString)seymourMediaType
{
  return self->_seymourMediaType;
}

- (void)setSeymourMediaType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seymourMediaType, 0);
  objc_storeStrong((id *)&self->_seymourCatalogWorkoutIdentifier, 0);
  objc_storeStrong((id *)&self->_sample, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end