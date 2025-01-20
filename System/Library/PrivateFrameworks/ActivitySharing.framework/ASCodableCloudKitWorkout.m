@interface ASCodableCloudKitWorkout
- (ASCodableCloudKitSample)sample;
- (BOOL)hasAmm;
- (BOOL)hasBundleID;
- (BOOL)hasDeviceManufacturer;
- (BOOL)hasDeviceModel;
- (BOOL)hasDuration;
- (BOOL)hasGoalInCanonicalUnit;
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
- (BOOL)isAmm;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndoorWorkout;
- (BOOL)isWatchWorkout;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleID;
- (NSString)deviceManufacturer;
- (NSString)deviceModel;
- (NSString)seymourCatalogWorkoutIdentifier;
- (NSString)seymourMediaType;
- (double)duration;
- (double)goalInCanonicalUnit;
- (double)totalBasalEnergyBurnedInCanonicalUnit;
- (double)totalDistanceInCanonicalUnit;
- (double)totalEnergyBurnedInCanonicalUnit;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)amm;
- (int64_t)goalType;
- (int64_t)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAmm:(int64_t)a3;
- (void)setBundleID:(id)a3;
- (void)setDeviceManufacturer:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDuration:(double)a3;
- (void)setGoalInCanonicalUnit:(double)a3;
- (void)setGoalType:(int64_t)a3;
- (void)setHasAmm:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasGoalInCanonicalUnit:(BOOL)a3;
- (void)setHasGoalType:(BOOL)a3;
- (void)setHasIsIndoorWorkout:(BOOL)a3;
- (void)setHasIsWatchWorkout:(BOOL)a3;
- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3;
- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsIndoorWorkout:(BOOL)a3;
- (void)setIsWatchWorkout:(BOOL)a3;
- (void)setSample:(id)a3;
- (void)setSeymourCatalogWorkoutIdentifier:(id)a3;
- (void)setSeymourMediaType:(id)a3;
- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3;
- (void)setTotalDistanceInCanonicalUnit:(double)a3;
- (void)setTotalEnergyBurnedInCanonicalUnit:(double)a3;
- (void)setType:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableCloudKitWorkout

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
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
  *(_WORD *)&self->_has |= 0x40u;
  self->_totalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTotalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTotalBasalEnergyBurnedInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_totalBasalEnergyBurnedInCanonicalUnit = a3;
}

- (void)setHasTotalBasalEnergyBurnedInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTotalBasalEnergyBurnedInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setTotalDistanceInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_totalDistanceInCanonicalUnit = a3;
}

- (void)setHasTotalDistanceInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasTotalDistanceInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 5) & 1;
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

- (void)setGoalInCanonicalUnit:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_goalInCanonicalUnit = a3;
}

- (void)setHasGoalInCanonicalUnit:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasGoalInCanonicalUnit
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasBundleID
{
  return self->_bundleID != 0;
}

- (void)setIsWatchWorkout:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isWatchWorkout = a3;
}

- (void)setHasIsWatchWorkout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsWatchWorkout
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIsIndoorWorkout:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_isIndoorWorkout = a3;
}

- (void)setHasIsIndoorWorkout:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasIsIndoorWorkout
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
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

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitWorkout;
  v4 = [(ASCodableCloudKitWorkout *)&v8 description];
  v5 = [(ASCodableCloudKitWorkout *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  sample = self->_sample;
  if (sample)
  {
    v5 = [(ASCodableCloudKitSample *)sample dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"sample"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v18 = [NSNumber numberWithLongLong:self->_type];
    [v3 setObject:v18 forKey:@"type"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  v19 = [NSNumber numberWithDouble:self->_duration];
  [v3 setObject:v19 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  v20 = [NSNumber numberWithDouble:self->_totalEnergyBurnedInCanonicalUnit];
  [v3 setObject:v20 forKey:@"totalEnergyBurnedInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  v21 = [NSNumber numberWithDouble:self->_totalBasalEnergyBurnedInCanonicalUnit];
  [v3 setObject:v21 forKey:@"totalBasalEnergyBurnedInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  v22 = [NSNumber numberWithDouble:self->_totalDistanceInCanonicalUnit];
  [v3 setObject:v22 forKey:@"totalDistanceInCanonicalUnit"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_35:
  v23 = [NSNumber numberWithLongLong:self->_goalType];
  [v3 setObject:v23 forKey:@"goalType"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    v7 = [NSNumber numberWithDouble:self->_goalInCanonicalUnit];
    [v3 setObject:v7 forKey:@"goalInCanonicalUnit"];
  }
LABEL_11:
  bundleID = self->_bundleID;
  if (bundleID) {
    [v3 setObject:bundleID forKey:@"bundleID"];
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    v10 = [NSNumber numberWithBool:self->_isWatchWorkout];
    [v3 setObject:v10 forKey:@"isWatchWorkout"];

    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x100) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_isIndoorWorkout];
    [v3 setObject:v11 forKey:@"isIndoorWorkout"];
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
    v14 = [NSNumber numberWithLongLong:self->_amm];
    [v3 setObject:v14 forKey:@"amm"];
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
  return ASCodableCloudKitWorkoutReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteDoubleField();
    id v4 = v7;
  }
LABEL_11:
  if (self->_bundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    PBDataWriterWriteBOOLField();
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *((void *)v4 + 8) = self->_type;
    *((_WORD *)v4 + 62) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 0x40) == 0) {
        goto LABEL_6;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = *(void *)&self->_duration;
  *((_WORD *)v4 + 62) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((void *)v4 + 7) = *(void *)&self->_totalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 62) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((void *)v4 + 5) = *(void *)&self->_totalBasalEnergyBurnedInCanonicalUnit;
  *((_WORD *)v4 + 62) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((void *)v4 + 6) = *(void *)&self->_totalDistanceInCanonicalUnit;
  *((_WORD *)v4 + 62) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_35:
  *((void *)v4 + 4) = self->_goalType;
  *((_WORD *)v4 + 62) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_10:
    *((void *)v4 + 3) = *(void *)&self->_goalInCanonicalUnit;
    *((_WORD *)v4 + 62) |= 4u;
  }
LABEL_11:
  if (self->_bundleID)
  {
    objc_msgSend(v7, "setBundleID:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x200) != 0)
  {
    *((unsigned char *)v4 + 121) = self->_isWatchWorkout;
    *((_WORD *)v4 + 62) |= 0x200u;
    __int16 v6 = (__int16)self->_has;
  }
  if ((v6 & 0x100) != 0)
  {
    *((unsigned char *)v4 + 120) = self->_isIndoorWorkout;
    *((_WORD *)v4 + 62) |= 0x100u;
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
    *((_WORD *)v4 + 62) |= 1u;
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
  id v6 = [(ASCodableCloudKitSample *)self->_sample copyWithZone:a3];
  id v7 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(void *)(v5 + 64) = self->_type;
    *(_WORD *)(v5 + 124) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 0x40) == 0) {
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
  *(_WORD *)(v5 + 124) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(double *)(v5 + 56) = self->_totalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 124) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(double *)(v5 + 40) = self->_totalBasalEnergyBurnedInCanonicalUnit;
  *(_WORD *)(v5 + 124) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(double *)(v5 + 48) = self->_totalDistanceInCanonicalUnit;
  *(_WORD *)(v5 + 124) |= 0x20u;
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
  *(_WORD *)(v5 + 124) |= 8u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_8:
    *(double *)(v5 + 24) = self->_goalInCanonicalUnit;
    *(_WORD *)(v5 + 124) |= 4u;
  }
LABEL_9:
  uint64_t v9 = [(NSString *)self->_bundleID copyWithZone:a3];
  v10 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v9;

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x200) != 0)
  {
    *(unsigned char *)(v5 + 121) = self->_isWatchWorkout;
    *(_WORD *)(v5 + 124) |= 0x200u;
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x100) != 0)
  {
    *(unsigned char *)(v5 + 120) = self->_isIndoorWorkout;
    *(_WORD *)(v5 + 124) |= 0x100u;
  }
  uint64_t v12 = [(NSString *)self->_deviceManufacturer copyWithZone:a3];
  v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  uint64_t v14 = [(NSString *)self->_deviceModel copyWithZone:a3];
  v15 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v14;

  if (*(_WORD *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_amm;
    *(_WORD *)(v5 + 124) |= 1u;
  }
  uint64_t v16 = [(NSString *)self->_seymourCatalogWorkoutIdentifier copyWithZone:a3];
  v17 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v16;

  uint64_t v18 = [(NSString *)self->_seymourMediaType copyWithZone:a3];
  v19 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_71;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 12))
  {
    if (!-[ASCodableCloudKitSample isEqual:](sample, "isEqual:")) {
      goto LABEL_71;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_type != *((void *)v4 + 8)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_duration != *((double *)v4 + 2)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_totalEnergyBurnedInCanonicalUnit != *((double *)v4 + 7)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_totalBasalEnergyBurnedInCanonicalUnit != *((double *)v4 + 5)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_totalDistanceInCanonicalUnit != *((double *)v4 + 6)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_goalType != *((void *)v4 + 4)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_goalInCanonicalUnit != *((double *)v4 + 3)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  bundleID = self->_bundleID;
  if ((unint64_t)bundleID | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](bundleID, "isEqual:")) {
      goto LABEL_71;
    }
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x200) == 0) {
      goto LABEL_71;
    }
    if (self->_isWatchWorkout)
    {
      if (!*((unsigned char *)v4 + 121)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)v4 + 121))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)v4 + 62) & 0x200) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 62) & 0x100) != 0)
    {
      if (self->_isIndoorWorkout)
      {
        if (!*((unsigned char *)v4 + 120)) {
          goto LABEL_71;
        }
        goto LABEL_58;
      }
      if (!*((unsigned char *)v4 + 120)) {
        goto LABEL_58;
      }
    }
LABEL_71:
    char v14 = 0;
    goto LABEL_72;
  }
  if ((*((_WORD *)v4 + 62) & 0x100) != 0) {
    goto LABEL_71;
  }
LABEL_58:
  deviceManufacturer = self->_deviceManufacturer;
  if ((unint64_t)deviceManufacturer | *((void *)v4 + 10)
    && !-[NSString isEqual:](deviceManufacturer, "isEqual:"))
  {
    goto LABEL_71;
  }
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:")) {
      goto LABEL_71;
    }
  }
  __int16 v11 = *((_WORD *)v4 + 62);
  if (*(_WORD *)&self->_has)
  {
    if ((v11 & 1) == 0 || self->_amm != *((void *)v4 + 1)) {
      goto LABEL_71;
    }
  }
  else if (v11)
  {
    goto LABEL_71;
  }
  seymourCatalogWorkoutIdentifier = self->_seymourCatalogWorkoutIdentifier;
  if ((unint64_t)seymourCatalogWorkoutIdentifier | *((void *)v4 + 13)
    && !-[NSString isEqual:](seymourCatalogWorkoutIdentifier, "isEqual:"))
  {
    goto LABEL_71;
  }
  seymourMediaType = self->_seymourMediaType;
  if ((unint64_t)seymourMediaType | *((void *)v4 + 14)) {
    char v14 = -[NSString isEqual:](seymourMediaType, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_72:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v43 = [(ASCodableCloudKitSample *)self->_sample hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    uint64_t v42 = 2654435761 * self->_type;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v42 = 0;
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
  if ((has & 0x40) != 0)
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
  if ((has & 0x10) != 0)
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
  unint64_t v41 = v8;
  if ((has & 0x20) != 0)
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
  unint64_t v40 = v14;
  if ((has & 8) != 0) {
    uint64_t v39 = 2654435761 * self->_goalType;
  }
  else {
    uint64_t v39 = 0;
  }
  unint64_t v24 = v9;
  if ((has & 4) != 0)
  {
    double goalInCanonicalUnit = self->_goalInCanonicalUnit;
    double v27 = -goalInCanonicalUnit;
    if (goalInCanonicalUnit >= 0.0) {
      double v27 = self->_goalInCanonicalUnit;
    }
    long double v28 = floor(v27 + 0.5);
    double v29 = (v27 - v28) * 1.84467441e19;
    unint64_t v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0) {
        v25 += (unint64_t)v29;
      }
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    unint64_t v25 = 0;
  }
  NSUInteger v30 = [(NSString *)self->_bundleID hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v31 = 2654435761 * self->_isWatchWorkout;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_48;
    }
  }
  else
  {
    uint64_t v31 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
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
  unint64_t v36 = v42 ^ v43 ^ v41 ^ v24 ^ v40 ^ v19 ^ v39 ^ v25 ^ v30 ^ v31 ^ v32 ^ v33 ^ v34;
  NSUInteger v37 = v35 ^ [(NSString *)self->_seymourCatalogWorkoutIdentifier hash];
  return v36 ^ v37 ^ [(NSString *)self->_seymourMediaType hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 12);
  id v9 = v4;
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableCloudKitSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ASCodableCloudKitWorkout setSample:](self, "setSample:");
  }
  id v4 = v9;
LABEL_7:
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x80) != 0)
  {
    self->_type = *((void *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v7 = *((_WORD *)v4 + 62);
    if ((v7 & 2) == 0)
    {
LABEL_9:
      if ((v7 & 0x40) == 0) {
        goto LABEL_10;
      }
      goto LABEL_36;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_double duration = *((double *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x40) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_double totalEnergyBurnedInCanonicalUnit = *((double *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_double totalBasalEnergyBurnedInCanonicalUnit = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_double totalDistanceInCanonicalUnit = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = *((_WORD *)v4 + 62);
  if ((v7 & 8) == 0)
  {
LABEL_13:
    if ((v7 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_39:
  self->_goalType = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)v4 + 62) & 4) != 0)
  {
LABEL_14:
    self->_double goalInCanonicalUnit = *((double *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_15:
  if (*((void *)v4 + 9))
  {
    -[ASCodableCloudKitWorkout setBundleID:](self, "setBundleID:");
    id v4 = v9;
  }
  __int16 v8 = *((_WORD *)v4 + 62);
  if ((v8 & 0x200) != 0)
  {
    self->_isWatchWorkout = *((unsigned char *)v4 + 121);
    *(_WORD *)&self->_has |= 0x200u;
    __int16 v8 = *((_WORD *)v4 + 62);
  }
  if ((v8 & 0x100) != 0)
  {
    self->_isIndoorWorkout = *((unsigned char *)v4 + 120);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((void *)v4 + 10))
  {
    -[ASCodableCloudKitWorkout setDeviceManufacturer:](self, "setDeviceManufacturer:");
    id v4 = v9;
  }
  if (*((void *)v4 + 11))
  {
    -[ASCodableCloudKitWorkout setDeviceModel:](self, "setDeviceModel:");
    id v4 = v9;
  }
  if (*((_WORD *)v4 + 62))
  {
    self->_amm = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 13))
  {
    [(ASCodableCloudKitWorkout *)self setSeymourCatalogWorkoutIdentifier:"setSeymourCatalogWorkoutIdentifier:"];
    id v4 = v9;
  }
  if (*((void *)v4 + 14)) {
    -[ASCodableCloudKitWorkout setSeymourMediaType:](self, "setSeymourMediaType:");
  }

  MEMORY[0x270F9A758]();
}

- (ASCodableCloudKitSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
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

- (double)goalInCanonicalUnit
{
  return self->_goalInCanonicalUnit;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (BOOL)isWatchWorkout
{
  return self->_isWatchWorkout;
}

- (BOOL)isIndoorWorkout
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
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_deviceManufacturer, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (BOOL)isAmm
{
  return [(ASCodableCloudKitWorkout *)self amm] == 2;
}

@end