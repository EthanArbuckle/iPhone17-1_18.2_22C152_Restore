@interface GEOLogMsgStateMapSettings
+ (BOOL)isValid:(id)a3;
+ (Class)navVoiceSettingsType;
- (BOOL)avoidBusyRoads;
- (BOOL)avoidHighways;
- (BOOL)avoidHills;
- (BOOL)avoidStairs;
- (BOOL)avoidTolls;
- (BOOL)bikingAvoidBusyRoads;
- (BOOL)bikingAvoidHills;
- (BOOL)bikingAvoidStairs;
- (BOOL)directionsWakeDevice;
- (BOOL)eBike;
- (BOOL)findMyCarEnabled;
- (BOOL)hFPEnabled;
- (BOOL)hasAvoidBusyRoads;
- (BOOL)hasAvoidHighways;
- (BOOL)hasAvoidHills;
- (BOOL)hasAvoidStairs;
- (BOOL)hasAvoidTolls;
- (BOOL)hasBikingAvoidBusyRoads;
- (BOOL)hasBikingAvoidHills;
- (BOOL)hasBikingAvoidStairs;
- (BOOL)hasCyclingVoiceSettings;
- (BOOL)hasDirectionsWakeDevice;
- (BOOL)hasDrivingVoiceSettings;
- (BOOL)hasEBike;
- (BOOL)hasFindMyCarEnabled;
- (BOOL)hasHFPEnabled;
- (BOOL)hasHeadingEnabled;
- (BOOL)hasLabelEnabled;
- (BOOL)hasLocationType;
- (BOOL)hasNavVoiceVolume;
- (BOOL)hasPauseSpokenAudioEnabled;
- (BOOL)hasPreferredTransportMode;
- (BOOL)hasSpeedLimitEnabled;
- (BOOL)hasTrafficEnabled;
- (BOOL)hasWalkingAvoidBusyRoads;
- (BOOL)hasWalkingAvoidHills;
- (BOOL)hasWalkingAvoidStairs;
- (BOOL)hasWalkingVoiceSettings;
- (BOOL)headingEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)labelEnabled;
- (BOOL)pauseSpokenAudioEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)speedLimitEnabled;
- (BOOL)trafficEnabled;
- (BOOL)walkingAvoidBusyRoads;
- (BOOL)walkingAvoidHills;
- (BOOL)walkingAvoidStairs;
- (GEOLogMsgStateMapSettings)initWithDictionary:(id)a3;
- (GEOLogMsgStateMapSettings)initWithJSON:(id)a3;
- (NSMutableArray)navVoiceSettings;
- (id)_dictionaryRepresentation:(uint64_t)a1;
- (id)_initWithDictionary:(int)a3 isJSON:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)cyclingVoiceSettingsAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)drivingVoiceSettingsAsString:(int)a3;
- (id)jsonRepresentation;
- (id)locationTypeAsString:(int)a3;
- (id)navVoiceSettingsAtIndex:(unint64_t)a3;
- (id)navVoiceVolumeAsString:(int)a3;
- (id)preferredTransportModeAsString:(int)a3;
- (id)walkingVoiceSettingsAsString:(int)a3;
- (int)StringAsCyclingVoiceSettings:(id)a3;
- (int)StringAsDrivingVoiceSettings:(id)a3;
- (int)StringAsLocationType:(id)a3;
- (int)StringAsNavVoiceVolume:(id)a3;
- (int)StringAsPreferredTransportMode:(id)a3;
- (int)StringAsWalkingVoiceSettings:(id)a3;
- (int)cyclingVoiceSettings;
- (int)drivingVoiceSettings;
- (int)locationType;
- (int)navVoiceVolume;
- (int)preferredTransportMode;
- (int)walkingVoiceSettings;
- (unint64_t)hash;
- (unint64_t)navVoiceSettingsCount;
- (void)addNavVoiceSettings:(id)a3;
- (void)clearNavVoiceSettings;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvoidBusyRoads:(BOOL)a3;
- (void)setAvoidHighways:(BOOL)a3;
- (void)setAvoidHills:(BOOL)a3;
- (void)setAvoidStairs:(BOOL)a3;
- (void)setAvoidTolls:(BOOL)a3;
- (void)setBikingAvoidBusyRoads:(BOOL)a3;
- (void)setBikingAvoidHills:(BOOL)a3;
- (void)setBikingAvoidStairs:(BOOL)a3;
- (void)setCyclingVoiceSettings:(int)a3;
- (void)setDirectionsWakeDevice:(BOOL)a3;
- (void)setDrivingVoiceSettings:(int)a3;
- (void)setEBike:(BOOL)a3;
- (void)setFindMyCarEnabled:(BOOL)a3;
- (void)setHFPEnabled:(BOOL)a3;
- (void)setHasAvoidBusyRoads:(BOOL)a3;
- (void)setHasAvoidHighways:(BOOL)a3;
- (void)setHasAvoidHills:(BOOL)a3;
- (void)setHasAvoidStairs:(BOOL)a3;
- (void)setHasAvoidTolls:(BOOL)a3;
- (void)setHasBikingAvoidBusyRoads:(BOOL)a3;
- (void)setHasBikingAvoidHills:(BOOL)a3;
- (void)setHasBikingAvoidStairs:(BOOL)a3;
- (void)setHasCyclingVoiceSettings:(BOOL)a3;
- (void)setHasDirectionsWakeDevice:(BOOL)a3;
- (void)setHasDrivingVoiceSettings:(BOOL)a3;
- (void)setHasEBike:(BOOL)a3;
- (void)setHasFindMyCarEnabled:(BOOL)a3;
- (void)setHasHFPEnabled:(BOOL)a3;
- (void)setHasHeadingEnabled:(BOOL)a3;
- (void)setHasLabelEnabled:(BOOL)a3;
- (void)setHasLocationType:(BOOL)a3;
- (void)setHasNavVoiceVolume:(BOOL)a3;
- (void)setHasPauseSpokenAudioEnabled:(BOOL)a3;
- (void)setHasPreferredTransportMode:(BOOL)a3;
- (void)setHasSpeedLimitEnabled:(BOOL)a3;
- (void)setHasTrafficEnabled:(BOOL)a3;
- (void)setHasWalkingAvoidBusyRoads:(BOOL)a3;
- (void)setHasWalkingAvoidHills:(BOOL)a3;
- (void)setHasWalkingAvoidStairs:(BOOL)a3;
- (void)setHasWalkingVoiceSettings:(BOOL)a3;
- (void)setHeadingEnabled:(BOOL)a3;
- (void)setLabelEnabled:(BOOL)a3;
- (void)setLocationType:(int)a3;
- (void)setNavVoiceSettings:(id)a3;
- (void)setNavVoiceVolume:(int)a3;
- (void)setPauseSpokenAudioEnabled:(BOOL)a3;
- (void)setPreferredTransportMode:(int)a3;
- (void)setSpeedLimitEnabled:(BOOL)a3;
- (void)setTrafficEnabled:(BOOL)a3;
- (void)setWalkingAvoidBusyRoads:(BOOL)a3;
- (void)setWalkingAvoidHills:(BOOL)a3;
- (void)setWalkingAvoidStairs:(BOOL)a3;
- (void)setWalkingVoiceSettings:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation GEOLogMsgStateMapSettings

- (BOOL)hasLocationType
{
  return (*(unsigned char *)&self->_flags >> 2) & 1;
}

- (void).cxx_destruct
{
}

- (void)setLocationType:(int)a3
{
  *(_DWORD *)&self->_flags |= 4u;
  self->_locationType = a3;
}

- (int)locationType
{
  if ((*(unsigned char *)&self->_flags & 4) != 0) {
    return self->_locationType;
  }
  else {
    return 0;
  }
}

- (void)setWalkingVoiceSettings:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20u;
  self->_walkingVoiceSettings = a3;
}

- (void)setTrafficEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400000u;
  self->_trafficEnabled = a3;
}

- (void)setSpeedLimitEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200000u;
  self->_speedLimitEnabled = a3;
}

- (void)setPreferredTransportMode:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10u;
  self->_preferredTransportMode = a3;
}

- (void)setPauseSpokenAudioEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100000u;
  self->_pauseSpokenAudioEnabled = a3;
}

- (void)setLabelEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000u;
  self->_labelEnabled = a3;
}

- (void)setHeadingEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40000u;
  self->_headingEnabled = a3;
}

- (void)setHFPEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40u;
  self->_hFPEnabled = a3;
}

- (void)setDrivingVoiceSettings:(int)a3
{
  *(_DWORD *)&self->_flags |= 2u;
  self->_drivingVoiceSettings = a3;
}

- (void)setCyclingVoiceSettings:(int)a3
{
  *(_DWORD *)&self->_flags |= 1u;
  self->_cyclingVoiceSettings = a3;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x10000) != 0) {
LABEL_16:
  }
    PBDataWriterWriteBOOLField();
LABEL_17:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v6 = self->_navVoiceSettings;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
    if ((*(unsigned char *)&v11 & 2) == 0)
    {
LABEL_26:
      if ((*(unsigned char *)&v11 & 0x20) == 0) {
        goto LABEL_27;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v11 & 2) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteInt32Field();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v11 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(unsigned char *)&v11 & 1) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v11 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v11 & 0x800000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x800000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v11 & 0x2000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v11 & 0x2000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v11 & 0x4000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v11 & 0x1000) == 0) {
      goto LABEL_34;
    }
LABEL_61:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x1000) != 0) {
    goto LABEL_61;
  }
LABEL_34:
  if ((*(_WORD *)&v11 & 0x8000) != 0) {
LABEL_35:
  }
    PBDataWriterWriteBOOLField();
LABEL_36:
}

- (int)preferredTransportMode
{
  if ((*(unsigned char *)&self->_flags & 0x10) != 0) {
    return self->_preferredTransportMode;
  }
  else {
    return 0;
  }
}

- (void)setHasPreferredTransportMode:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasPreferredTransportMode
{
  return (*(unsigned char *)&self->_flags >> 4) & 1;
}

- (id)preferredTransportModeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F85F8[a3];
  }

  return v3;
}

- (int)StringAsPreferredTransportMode:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"DRIVING_MODE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"WALKING_MODE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TRANSIT_MODE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RIDESHARE_MODE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"CYCLING_MODE"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasAvoidTolls
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasAvoidHighways
{
  return *((unsigned char *)&self->_flags + 1) & 1;
}

- (BOOL)headingEnabled
{
  return self->_headingEnabled;
}

- (void)setHasHeadingEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v3);
}

- (BOOL)hasHeadingEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (BOOL)speedLimitEnabled
{
  return self->_speedLimitEnabled;
}

- (void)setHasSpeedLimitEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | v3);
}

- (BOOL)hasSpeedLimitEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (int)navVoiceVolume
{
  if ((*(unsigned char *)&self->_flags & 8) != 0) {
    return self->_navVoiceVolume;
  }
  else {
    return 0;
  }
}

- (void)setNavVoiceVolume:(int)a3
{
  *(_DWORD *)&self->_flags |= 8u;
  self->_navVoiceVolume = a3;
}

- (void)setHasNavVoiceVolume:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNavVoiceVolume
{
  return (*(unsigned char *)&self->_flags >> 3) & 1;
}

- (id)navVoiceVolumeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F7FB0[a3];
  }

  return v3;
}

- (int)StringAsNavVoiceVolume:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VOICE_VOLUME"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO_VOICE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LOW_VOLUME"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"NORMAL_VOLUME"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LOUD_VOLUME"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)pauseSpokenAudioEnabled
{
  return self->_pauseSpokenAudioEnabled;
}

- (void)setHasPauseSpokenAudioEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v3);
}

- (BOOL)hasPauseSpokenAudioEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)findMyCarEnabled
{
  return self->_findMyCarEnabled;
}

- (void)setFindMyCarEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_findMyCarEnabled = a3;
}

- (void)setHasFindMyCarEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasFindMyCarEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)trafficEnabled
{
  return self->_trafficEnabled;
}

- (void)setHasTrafficEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v3);
}

- (BOOL)hasTrafficEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)labelEnabled
{
  return self->_labelEnabled;
}

- (void)setHasLabelEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v3);
}

- (BOOL)hasLabelEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setAvoidHills:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200u;
  self->_avoidHills = a3;
}

- (void)setHasAvoidHills:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasAvoidHills
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setAvoidStairs:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400u;
  self->_avoidStairs = a3;
}

- (void)setHasAvoidStairs:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasAvoidStairs
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80u;
  self->_avoidBusyRoads = a3;
}

- (void)setHasAvoidBusyRoads:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasAvoidBusyRoads
{
  return *(unsigned char *)&self->_flags >> 7;
}

- (void)setHasLocationType:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F7FD8[a3];
  }

  return v3;
}

- (int)StringAsLocationType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NO_AUTH"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"PRECISE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"COARSE"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)eBike
{
  return self->_eBike;
}

- (void)setEBike:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_eBike = a3;
}

- (void)setHasEBike:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasEBike
{
  return *((unsigned char *)&self->_flags + 2) & 1;
}

- (NSMutableArray)navVoiceSettings
{
  return self->_navVoiceSettings;
}

- (void)setNavVoiceSettings:(id)a3
{
}

- (void)clearNavVoiceSettings
{
}

- (void)addNavVoiceSettings:(id)a3
{
  id v4 = a3;
  navVoiceSettings = self->_navVoiceSettings;
  id v8 = v4;
  if (!navVoiceSettings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_navVoiceSettings;
    self->_navVoiceSettings = v6;

    id v4 = v8;
    navVoiceSettings = self->_navVoiceSettings;
  }
  [(NSMutableArray *)navVoiceSettings addObject:v4];
}

- (unint64_t)navVoiceSettingsCount
{
  return [(NSMutableArray *)self->_navVoiceSettings count];
}

- (id)navVoiceSettingsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_navVoiceSettings objectAtIndex:a3];
}

+ (Class)navVoiceSettingsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hFPEnabled
{
  return self->_hFPEnabled;
}

- (void)setHasHFPEnabled:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasHFPEnabled
{
  return (*(unsigned char *)&self->_flags >> 6) & 1;
}

- (int)drivingVoiceSettings
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return self->_drivingVoiceSettings;
  }
  else {
    return 0;
  }
}

- (void)setHasDrivingVoiceSettings:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDrivingVoiceSettings
{
  return (*(unsigned char *)&self->_flags >> 1) & 1;
}

- (id)drivingVoiceSettingsAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F85D8[a3];
  }

  return v3;
}

- (int)StringAsDrivingVoiceSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEVEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEVEL_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEVEL_INCIDENTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEVEL_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)walkingVoiceSettings
{
  if ((*(unsigned char *)&self->_flags & 0x20) != 0) {
    return self->_walkingVoiceSettings;
  }
  else {
    return 0;
  }
}

- (void)setHasWalkingVoiceSettings:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasWalkingVoiceSettings
{
  return (*(unsigned char *)&self->_flags >> 5) & 1;
}

- (id)walkingVoiceSettingsAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v3 = off_1E53F85D8[a3];
  }

  return v3;
}

- (int)StringAsWalkingVoiceSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEVEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEVEL_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEVEL_INCIDENTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEVEL_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)cyclingVoiceSettings
{
  if (*(unsigned char *)&self->_flags) {
    return self->_cyclingVoiceSettings;
  }
  else {
    return 0;
  }
}

- (void)setHasCyclingVoiceSettings:(BOOL)a3
{
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3);
}

- (BOOL)hasCyclingVoiceSettings
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)cyclingVoiceSettingsAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E53F85D8[a3];
  }

  return v3;
}

- (int)StringAsCyclingVoiceSettings:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"LEVEL_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LEVEL_NONE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LEVEL_INCIDENTS"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LEVEL_FULL"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)walkingAvoidHills
{
  return self->_walkingAvoidHills;
}

- (void)setWalkingAvoidHills:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x1000000u;
  self->_walkingAvoidHills = a3;
}

- (void)setHasWalkingAvoidHills:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFEFFFFFF | v3);
}

- (BOOL)hasWalkingAvoidHills
{
  return *((unsigned char *)&self->_flags + 3) & 1;
}

- (BOOL)walkingAvoidBusyRoads
{
  return self->_walkingAvoidBusyRoads;
}

- (void)setWalkingAvoidBusyRoads:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800000u;
  self->_walkingAvoidBusyRoads = a3;
}

- (void)setHasWalkingAvoidBusyRoads:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFF7FFFFF | v3);
}

- (BOOL)hasWalkingAvoidBusyRoads
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (BOOL)walkingAvoidStairs
{
  return self->_walkingAvoidStairs;
}

- (void)setWalkingAvoidStairs:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2000000u;
  self->_walkingAvoidStairs = a3;
}

- (void)setHasWalkingAvoidStairs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFDFFFFFF | v3);
}

- (BOOL)hasWalkingAvoidStairs
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)bikingAvoidHills
{
  return self->_bikingAvoidHills;
}

- (void)setBikingAvoidHills:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2000u;
  self->_bikingAvoidHills = a3;
}

- (void)setHasBikingAvoidHills:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasBikingAvoidHills
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)bikingAvoidStairs
{
  return self->_bikingAvoidStairs;
}

- (void)setBikingAvoidStairs:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x4000u;
  self->_bikingAvoidStairs = a3;
}

- (void)setHasBikingAvoidStairs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasBikingAvoidStairs
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)bikingAvoidBusyRoads
{
  return self->_bikingAvoidBusyRoads;
}

- (void)setBikingAvoidBusyRoads:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x1000u;
  self->_bikingAvoidBusyRoads = a3;
}

- (void)setHasBikingAvoidBusyRoads:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasBikingAvoidBusyRoads
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)directionsWakeDevice
{
  return self->_directionsWakeDevice;
}

- (void)setDirectionsWakeDevice:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000u;
  self->_directionsWakeDevice = a3;
}

- (void)setHasDirectionsWakeDevice:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_$BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (BOOL)hasDirectionsWakeDevice
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (id)description
{
  int v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)GEOLogMsgStateMapSettings;
  int v4 = [(GEOLogMsgStateMapSettings *)&v8 description];
  v5 = [(GEOLogMsgStateMapSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    [(id)a1 readAll:1];
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x10) != 0)
    {
      uint64_t v6 = *(int *)(a1 + 32);
      if (v6 >= 6)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 32));
        uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v7 = off_1E53F85F8[v6];
      }
      if (a2) {
        objc_super v8 = @"preferredTransportMode";
      }
      else {
        objc_super v8 = @"preferred_transport_mode";
      }
      [v4 setObject:v7 forKey:v8];

      int v5 = *(_DWORD *)(a1 + 60);
    }
    if ((v5 & 0x800) != 0)
    {
      v25 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 45)];
      if (a2) {
        v26 = @"avoidTolls";
      }
      else {
        v26 = @"avoid_tolls";
      }
      [v4 setObject:v25 forKey:v26];

      int v5 = *(_DWORD *)(a1 + 60);
      if ((v5 & 0x100) == 0)
      {
LABEL_12:
        if ((v5 & 0x40000) == 0) {
          goto LABEL_13;
        }
        goto LABEL_70;
      }
    }
    else if ((v5 & 0x100) == 0)
    {
      goto LABEL_12;
    }
    v27 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 42)];
    if (a2) {
      v28 = @"avoidHighways";
    }
    else {
      v28 = @"avoid_highways";
    }
    [v4 setObject:v27 forKey:v28];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x40000) == 0)
    {
LABEL_13:
      if ((v5 & 0x200000) == 0) {
        goto LABEL_14;
      }
      goto LABEL_74;
    }
LABEL_70:
    v29 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 52)];
    if (a2) {
      v30 = @"headingEnabled";
    }
    else {
      v30 = @"heading_enabled";
    }
    [v4 setObject:v29 forKey:v30];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x200000) == 0)
    {
LABEL_14:
      if ((v5 & 8) == 0) {
        goto LABEL_15;
      }
      goto LABEL_78;
    }
LABEL_74:
    v31 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 55)];
    if (a2) {
      v32 = @"speedLimitEnabled";
    }
    else {
      v32 = @"speed_limit_enabled";
    }
    [v4 setObject:v31 forKey:v32];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_15:
      if ((v5 & 0x100000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_91;
    }
LABEL_78:
    uint64_t v33 = *(int *)(a1 + 28);
    if (v33 >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 28));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E53F7FB0[v33];
    }
    if (a2) {
      v39 = @"navVoiceVolume";
    }
    else {
      v39 = @"nav_voice_volume";
    }
    [v4 setObject:v34 forKey:v39];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x100000) == 0)
    {
LABEL_16:
      if ((v5 & 0x20000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_95;
    }
LABEL_91:
    v40 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 54)];
    if (a2) {
      v41 = @"pauseSpokenAudioEnabled";
    }
    else {
      v41 = @"pause_spoken_audio_enabled";
    }
    [v4 setObject:v40 forKey:v41];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x20000) == 0)
    {
LABEL_17:
      if ((v5 & 0x400000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_99;
    }
LABEL_95:
    v42 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 51)];
    if (a2) {
      v43 = @"findMyCarEnabled";
    }
    else {
      v43 = @"find_my_car_enabled";
    }
    [v4 setObject:v42 forKey:v43];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x400000) == 0)
    {
LABEL_18:
      if ((v5 & 0x80000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_103;
    }
LABEL_99:
    v44 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
    if (a2) {
      v45 = @"trafficEnabled";
    }
    else {
      v45 = @"traffic_enabled";
    }
    [v4 setObject:v44 forKey:v45];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x80000) == 0)
    {
LABEL_19:
      if ((v5 & 0x200) == 0) {
        goto LABEL_20;
      }
      goto LABEL_107;
    }
LABEL_103:
    v46 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 53)];
    if (a2) {
      v47 = @"labelEnabled";
    }
    else {
      v47 = @"label_enabled";
    }
    [v4 setObject:v46 forKey:v47];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x200) == 0)
    {
LABEL_20:
      if ((v5 & 0x400) == 0) {
        goto LABEL_21;
      }
      goto LABEL_111;
    }
LABEL_107:
    v48 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 43)];
    if (a2) {
      v49 = @"avoidHills";
    }
    else {
      v49 = @"avoid_hills";
    }
    [v4 setObject:v48 forKey:v49];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x400) == 0)
    {
LABEL_21:
      if ((v5 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_115;
    }
LABEL_111:
    v50 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 44)];
    if (a2) {
      v51 = @"avoidStairs";
    }
    else {
      v51 = @"avoid_stairs";
    }
    [v4 setObject:v50 forKey:v51];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x80) == 0)
    {
LABEL_22:
      if ((v5 & 4) == 0) {
        goto LABEL_23;
      }
      goto LABEL_119;
    }
LABEL_115:
    v52 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 41)];
    if (a2) {
      v53 = @"avoidBusyRoads";
    }
    else {
      v53 = @"avoid_busy_roads";
    }
    [v4 setObject:v52 forKey:v53];

    int v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_23:
      if ((v5 & 0x10000) == 0) {
        goto LABEL_28;
      }
      goto LABEL_24;
    }
LABEL_119:
    uint64_t v54 = *(int *)(a1 + 24);
    if (v54 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 24));
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = off_1E53F7FD8[v54];
    }
    if (a2) {
      v59 = @"locationType";
    }
    else {
      v59 = @"location_type";
    }
    [v4 setObject:v55 forKey:v59];

    if ((*(_DWORD *)(a1 + 60) & 0x10000) == 0)
    {
LABEL_28:
      if ([*(id *)(a1 + 8) count])
      {
        $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v12 = *(id *)(a1 + 8);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v76 objects:v80 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v77;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v77 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v17 = *(void **)(*((void *)&v76 + 1) + 8 * i);
              if (a2) {
                [v17 jsonRepresentation];
              }
              else {
              id v18 = [v17 dictionaryRepresentation];
              }

              [v11 addObject:v18];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v76 objects:v80 count:16];
          }
          while (v14);
        }

        if (a2) {
          v19 = @"navVoiceSettings";
        }
        else {
          v19 = @"nav_voice_settings";
        }
        [v4 setObject:v11 forKey:v19];
      }
      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x40) != 0)
      {
        v35 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
        if (a2) {
          v36 = @"hFPEnabled";
        }
        else {
          v36 = @"HFP_enabled";
        }
        [v4 setObject:v35 forKey:v36];

        int v20 = *(_DWORD *)(a1 + 60);
        if ((v20 & 2) == 0)
        {
LABEL_45:
          if ((v20 & 0x20) == 0) {
            goto LABEL_46;
          }
          goto LABEL_126;
        }
      }
      else if ((v20 & 2) == 0)
      {
        goto LABEL_45;
      }
      uint64_t v37 = *(int *)(a1 + 20);
      if (v37 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 20));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = off_1E53F85D8[v37];
      }
      if (a2) {
        v56 = @"drivingVoiceSettings";
      }
      else {
        v56 = @"driving_voice_settings";
      }
      [v4 setObject:v38 forKey:v56];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x20) == 0)
      {
LABEL_46:
        if ((v20 & 1) == 0) {
          goto LABEL_47;
        }
        goto LABEL_139;
      }
LABEL_126:
      uint64_t v57 = *(int *)(a1 + 36);
      if (v57 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 36));
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v58 = off_1E53F85D8[v57];
      }
      if (a2) {
        v60 = @"walkingVoiceSettings";
      }
      else {
        v60 = @"walking_voice_settings";
      }
      [v4 setObject:v58 forKey:v60];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 1) == 0)
      {
LABEL_47:
        if ((v20 & 0x1000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_146;
      }
LABEL_139:
      uint64_t v61 = *(int *)(a1 + 16);
      if (v61 >= 4)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(int *)(a1 + 16));
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v62 = off_1E53F85D8[v61];
      }
      if (a2) {
        v63 = @"cyclingVoiceSettings";
      }
      else {
        v63 = @"cycling_voice_settings";
      }
      [v4 setObject:v62 forKey:v63];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x1000000) == 0)
      {
LABEL_48:
        if ((v20 & 0x800000) == 0) {
          goto LABEL_49;
        }
        goto LABEL_150;
      }
LABEL_146:
      v64 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 58)];
      if (a2) {
        v65 = @"walkingAvoidHills";
      }
      else {
        v65 = @"walking_avoid_hills";
      }
      [v4 setObject:v64 forKey:v65];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x800000) == 0)
      {
LABEL_49:
        if ((v20 & 0x2000000) == 0) {
          goto LABEL_50;
        }
        goto LABEL_154;
      }
LABEL_150:
      v66 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 57)];
      if (a2) {
        v67 = @"walkingAvoidBusyRoads";
      }
      else {
        v67 = @"walking_avoid_busy_roads";
      }
      [v4 setObject:v66 forKey:v67];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x2000000) == 0)
      {
LABEL_50:
        if ((v20 & 0x2000) == 0) {
          goto LABEL_51;
        }
        goto LABEL_158;
      }
LABEL_154:
      v68 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 59)];
      if (a2) {
        v69 = @"walkingAvoidStairs";
      }
      else {
        v69 = @"walking_avoid_stairs";
      }
      [v4 setObject:v68 forKey:v69];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x2000) == 0)
      {
LABEL_51:
        if ((v20 & 0x4000) == 0) {
          goto LABEL_52;
        }
        goto LABEL_162;
      }
LABEL_158:
      v70 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 47)];
      if (a2) {
        v71 = @"bikingAvoidHills";
      }
      else {
        v71 = @"biking_avoid_hills";
      }
      [v4 setObject:v70 forKey:v71];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x4000) == 0)
      {
LABEL_52:
        if ((v20 & 0x1000) == 0) {
          goto LABEL_53;
        }
        goto LABEL_166;
      }
LABEL_162:
      v72 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
      if (a2) {
        v73 = @"bikingAvoidStairs";
      }
      else {
        v73 = @"biking_avoid_stairs";
      }
      [v4 setObject:v72 forKey:v73];

      int v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x1000) == 0)
      {
LABEL_53:
        if ((v20 & 0x8000) == 0)
        {
LABEL_58:
          id v23 = v4;

          goto LABEL_59;
        }
LABEL_54:
        v21 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 49)];
        if (a2) {
          v22 = @"directionsWakeDevice";
        }
        else {
          v22 = @"directions_wake_device";
        }
        [v4 setObject:v21 forKey:v22];

        goto LABEL_58;
      }
LABEL_166:
      v74 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 46)];
      if (a2) {
        v75 = @"bikingAvoidBusyRoads";
      }
      else {
        v75 = @"biking_avoid_busy_roads";
      }
      [v4 setObject:v74 forKey:v75];

      if ((*(_DWORD *)(a1 + 60) & 0x8000) == 0) {
        goto LABEL_58;
      }
      goto LABEL_54;
    }
LABEL_24:
    uint64_t v9 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 50)];
    if (a2) {
      uint64_t v10 = @"eBike";
    }
    else {
      uint64_t v10 = @"e_bike";
    }
    [v4 setObject:v9 forKey:v10];

    goto LABEL_28;
  }
  id v23 = 0;
LABEL_59:

  return v23;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapSettings *)-[GEOLogMsgStateMapSettings _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (!a1) {
    goto LABEL_229;
  }
  a1 = (id)[a1 init];

  if (!a1) {
    goto LABEL_229;
  }
  if (a3) {
    uint64_t v6 = @"preferredTransportMode";
  }
  else {
    uint64_t v6 = @"preferred_transport_mode";
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    if ([v8 isEqualToString:@"UNKNOWN_TRANSPORT_MODE"])
    {
      uint64_t v9 = 0;
    }
    else if ([v8 isEqualToString:@"DRIVING_MODE"])
    {
      uint64_t v9 = 1;
    }
    else if ([v8 isEqualToString:@"WALKING_MODE"])
    {
      uint64_t v9 = 2;
    }
    else if ([v8 isEqualToString:@"TRANSIT_MODE"])
    {
      uint64_t v9 = 3;
    }
    else if ([v8 isEqualToString:@"RIDESHARE_MODE"])
    {
      uint64_t v9 = 4;
    }
    else if ([v8 isEqualToString:@"CYCLING_MODE"])
    {
      uint64_t v9 = 5;
    }
    else
    {
      uint64_t v9 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    uint64_t v9 = [v7 intValue];
  }
  [a1 setPreferredTransportMode:v9];
LABEL_24:

  if (a3) {
    uint64_t v10 = @"avoidTolls";
  }
  else {
    uint64_t v10 = @"avoid_tolls";
  }
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11 = [v5 objectForKeyedSubscript:v10];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAvoidTolls:", objc_msgSend(v11, "BOOLValue"));
  }

  if (a3) {
    id v12 = @"avoidHighways";
  }
  else {
    id v12 = @"avoid_highways";
  }
  uint64_t v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAvoidHighways:", objc_msgSend(v13, "BOOLValue"));
  }

  if (a3) {
    uint64_t v14 = @"headingEnabled";
  }
  else {
    uint64_t v14 = @"heading_enabled";
  }
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHeadingEnabled:", objc_msgSend(v15, "BOOLValue"));
  }

  if (a3) {
    v16 = @"speedLimitEnabled";
  }
  else {
    v16 = @"speed_limit_enabled";
  }
  uint64_t v17 = [v5 objectForKeyedSubscript:v16];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setSpeedLimitEnabled:", objc_msgSend(v17, "BOOLValue"));
  }

  if (a3) {
    id v18 = @"navVoiceVolume";
  }
  else {
    id v18 = @"nav_voice_volume";
  }
  v19 = [v5 objectForKeyedSubscript:v18];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = v19;
    if ([v20 isEqualToString:@"UNKNOWN_VOICE_VOLUME"])
    {
      uint64_t v21 = 0;
    }
    else if ([v20 isEqualToString:@"NO_VOICE"])
    {
      uint64_t v21 = 1;
    }
    else if ([v20 isEqualToString:@"LOW_VOLUME"])
    {
      uint64_t v21 = 2;
    }
    else if ([v20 isEqualToString:@"NORMAL_VOLUME"])
    {
      uint64_t v21 = 3;
    }
    else if ([v20 isEqualToString:@"LOUD_VOLUME"])
    {
      uint64_t v21 = 4;
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_63;
    }
    uint64_t v21 = [v19 intValue];
  }
  [a1 setNavVoiceVolume:v21];
LABEL_63:

  if (a3) {
    v22 = @"pauseSpokenAudioEnabled";
  }
  else {
    v22 = @"pause_spoken_audio_enabled";
  }
  id v23 = [v5 objectForKeyedSubscript:v22];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setPauseSpokenAudioEnabled:", objc_msgSend(v23, "BOOLValue"));
  }

  if (a3) {
    v24 = @"findMyCarEnabled";
  }
  else {
    v24 = @"find_my_car_enabled";
  }
  v25 = [v5 objectForKeyedSubscript:v24];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setFindMyCarEnabled:", objc_msgSend(v25, "BOOLValue"));
  }

  if (a3) {
    v26 = @"trafficEnabled";
  }
  else {
    v26 = @"traffic_enabled";
  }
  v27 = [v5 objectForKeyedSubscript:v26];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setTrafficEnabled:", objc_msgSend(v27, "BOOLValue"));
  }

  if (a3) {
    v28 = @"labelEnabled";
  }
  else {
    v28 = @"label_enabled";
  }
  v29 = [v5 objectForKeyedSubscript:v28];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setLabelEnabled:", objc_msgSend(v29, "BOOLValue"));
  }

  if (a3) {
    v30 = @"avoidHills";
  }
  else {
    v30 = @"avoid_hills";
  }
  v31 = [v5 objectForKeyedSubscript:v30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAvoidHills:", objc_msgSend(v31, "BOOLValue"));
  }

  if (a3) {
    v32 = @"avoidStairs";
  }
  else {
    v32 = @"avoid_stairs";
  }
  uint64_t v33 = [v5 objectForKeyedSubscript:v32];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAvoidStairs:", objc_msgSend(v33, "BOOLValue"));
  }

  if (a3) {
    v34 = @"avoidBusyRoads";
  }
  else {
    v34 = @"avoid_busy_roads";
  }
  v35 = [v5 objectForKeyedSubscript:v34];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setAvoidBusyRoads:", objc_msgSend(v35, "BOOLValue"));
  }

  if (a3) {
    v36 = @"locationType";
  }
  else {
    v36 = @"location_type";
  }
  uint64_t v37 = [v5 objectForKeyedSubscript:v36];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v38 = v37;
    if ([v38 isEqualToString:@"UNKNOWN"])
    {
      uint64_t v39 = 0;
    }
    else if ([v38 isEqualToString:@"NO_AUTH"])
    {
      uint64_t v39 = 1;
    }
    else if ([v38 isEqualToString:@"PRECISE"])
    {
      uint64_t v39 = 2;
    }
    else if ([v38 isEqualToString:@"COARSE"])
    {
      uint64_t v39 = 3;
    }
    else
    {
      uint64_t v39 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_115;
    }
    uint64_t v39 = [v37 intValue];
  }
  [a1 setLocationType:v39];
LABEL_115:

  if (a3) {
    v40 = @"eBike";
  }
  else {
    v40 = @"e_bike";
  }
  v41 = [v5 objectForKeyedSubscript:v40];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setEBike:", objc_msgSend(v41, "BOOLValue"));
  }

  if (a3) {
    v42 = @"navVoiceSettings";
  }
  else {
    v42 = @"nav_voice_settings";
  }
  v43 = [v5 objectForKeyedSubscript:v42];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v82 = v5;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v44 = v43;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v83 objects:v87 count:16];
    if (v45)
    {
      uint64_t v46 = v45;
      uint64_t v47 = *(void *)v84;
      do
      {
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v84 != v47) {
            objc_enumerationMutation(v44);
          }
          uint64_t v49 = *(void *)(*((void *)&v83 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v50 = [GEONavVoiceGuidanceSettings alloc];
            if (a3) {
              uint64_t v51 = [(GEONavVoiceGuidanceSettings *)v50 initWithJSON:v49];
            }
            else {
              uint64_t v51 = [(GEONavVoiceGuidanceSettings *)v50 initWithDictionary:v49];
            }
            v52 = (void *)v51;
            [a1 addNavVoiceSettings:v51];
          }
        }
        uint64_t v46 = [v44 countByEnumeratingWithState:&v83 objects:v87 count:16];
      }
      while (v46);
    }

    id v5 = v82;
  }

  if (a3) {
    v53 = @"hFPEnabled";
  }
  else {
    v53 = @"HFP_enabled";
  }
  uint64_t v54 = [v5 objectForKeyedSubscript:v53];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setHFPEnabled:", objc_msgSend(v54, "BOOLValue"));
  }

  if (a3) {
    v55 = @"drivingVoiceSettings";
  }
  else {
    v55 = @"driving_voice_settings";
  }
  v56 = [v5 objectForKeyedSubscript:v55];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v57 = v56;
    if ([v57 isEqualToString:@"LEVEL_UNKNOWN"])
    {
      uint64_t v58 = 0;
    }
    else if ([v57 isEqualToString:@"LEVEL_NONE"])
    {
      uint64_t v58 = 1;
    }
    else if ([v57 isEqualToString:@"LEVEL_INCIDENTS"])
    {
      uint64_t v58 = 2;
    }
    else if ([v57 isEqualToString:@"LEVEL_FULL"])
    {
      uint64_t v58 = 3;
    }
    else
    {
      uint64_t v58 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_159;
    }
    uint64_t v58 = [v56 intValue];
  }
  [a1 setDrivingVoiceSettings:v58];
LABEL_159:

  if (a3) {
    v59 = @"walkingVoiceSettings";
  }
  else {
    v59 = @"walking_voice_settings";
  }
  v60 = [v5 objectForKeyedSubscript:v59];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v61 = v60;
    if ([v61 isEqualToString:@"LEVEL_UNKNOWN"])
    {
      uint64_t v62 = 0;
    }
    else if ([v61 isEqualToString:@"LEVEL_NONE"])
    {
      uint64_t v62 = 1;
    }
    else if ([v61 isEqualToString:@"LEVEL_INCIDENTS"])
    {
      uint64_t v62 = 2;
    }
    else if ([v61 isEqualToString:@"LEVEL_FULL"])
    {
      uint64_t v62 = 3;
    }
    else
    {
      uint64_t v62 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_176;
    }
    uint64_t v62 = [v60 intValue];
  }
  [a1 setWalkingVoiceSettings:v62];
LABEL_176:

  if (a3) {
    v63 = @"cyclingVoiceSettings";
  }
  else {
    v63 = @"cycling_voice_settings";
  }
  v64 = [v5 objectForKeyedSubscript:v63];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v65 = v64;
    if ([v65 isEqualToString:@"LEVEL_UNKNOWN"])
    {
      uint64_t v66 = 0;
    }
    else if ([v65 isEqualToString:@"LEVEL_NONE"])
    {
      uint64_t v66 = 1;
    }
    else if ([v65 isEqualToString:@"LEVEL_INCIDENTS"])
    {
      uint64_t v66 = 2;
    }
    else if ([v65 isEqualToString:@"LEVEL_FULL"])
    {
      uint64_t v66 = 3;
    }
    else
    {
      uint64_t v66 = 0;
    }

    goto LABEL_192;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v66 = [v64 intValue];
LABEL_192:
    [a1 setCyclingVoiceSettings:v66];
  }

  if (a3) {
    v67 = @"walkingAvoidHills";
  }
  else {
    v67 = @"walking_avoid_hills";
  }
  v68 = [v5 objectForKeyedSubscript:v67];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWalkingAvoidHills:", objc_msgSend(v68, "BOOLValue"));
  }

  if (a3) {
    v69 = @"walkingAvoidBusyRoads";
  }
  else {
    v69 = @"walking_avoid_busy_roads";
  }
  v70 = [v5 objectForKeyedSubscript:v69];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWalkingAvoidBusyRoads:", objc_msgSend(v70, "BOOLValue"));
  }

  if (a3) {
    v71 = @"walkingAvoidStairs";
  }
  else {
    v71 = @"walking_avoid_stairs";
  }
  v72 = [v5 objectForKeyedSubscript:v71];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setWalkingAvoidStairs:", objc_msgSend(v72, "BOOLValue"));
  }

  if (a3) {
    v73 = @"bikingAvoidHills";
  }
  else {
    v73 = @"biking_avoid_hills";
  }
  v74 = [v5 objectForKeyedSubscript:v73];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBikingAvoidHills:", objc_msgSend(v74, "BOOLValue"));
  }

  if (a3) {
    v75 = @"bikingAvoidStairs";
  }
  else {
    v75 = @"biking_avoid_stairs";
  }
  long long v76 = [v5 objectForKeyedSubscript:v75];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBikingAvoidStairs:", objc_msgSend(v76, "BOOLValue"));
  }

  if (a3) {
    long long v77 = @"bikingAvoidBusyRoads";
  }
  else {
    long long v77 = @"biking_avoid_busy_roads";
  }
  long long v78 = [v5 objectForKeyedSubscript:v77];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setBikingAvoidBusyRoads:", objc_msgSend(v78, "BOOLValue"));
  }

  if (a3) {
    long long v79 = @"directionsWakeDevice";
  }
  else {
    long long v79 = @"directions_wake_device";
  }
  v80 = [v5 objectForKeyedSubscript:v79];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(a1, "setDirectionsWakeDevice:", objc_msgSend(v80, "BOOLValue"));
  }

  a1 = a1;
LABEL_229:

  return a1;
}

- (GEOLogMsgStateMapSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapSettings *)-[GEOLogMsgStateMapSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapSettingsReadAllFrom(self, a3);
}

- (void)copyTo:(id)a3
{
  uint64_t v10 = a3;
  [(GEOLogMsgStateMapSettings *)self readAll:0];
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    v10[8] = self->_preferredTransportMode;
    v10[15] |= 0x10u;
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_38;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v10 + 45) = self->_avoidTolls;
  v10[15] |= 0x800u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((unsigned char *)v10 + 42) = self->_avoidHighways;
  v10[15] |= 0x100u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((unsigned char *)v10 + 52) = self->_headingEnabled;
  v10[15] |= 0x40000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((unsigned char *)v10 + 55) = self->_speedLimitEnabled;
  v10[15] |= 0x200000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_42;
  }
LABEL_41:
  v10[7] = self->_navVoiceVolume;
  v10[15] |= 8u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((unsigned char *)v10 + 54) = self->_pauseSpokenAudioEnabled;
  v10[15] |= 0x100000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)v10 + 51) = self->_findMyCarEnabled;
  v10[15] |= 0x20000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((unsigned char *)v10 + 56) = self->_trafficEnabled;
  v10[15] |= 0x400000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((unsigned char *)v10 + 53) = self->_labelEnabled;
  v10[15] |= 0x80000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((unsigned char *)v10 + 43) = self->_avoidHills;
  v10[15] |= 0x200u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((unsigned char *)v10 + 44) = self->_avoidStairs;
  v10[15] |= 0x400u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_15;
    }
LABEL_49:
    v10[6] = self->_locationType;
    v10[15] |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_48:
  *((unsigned char *)v10 + 41) = self->_avoidBusyRoads;
  v10[15] |= 0x80u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    goto LABEL_49;
  }
LABEL_15:
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
LABEL_16:
    *((unsigned char *)v10 + 50) = self->_eBike;
    v10[15] |= 0x10000u;
  }
LABEL_17:
  if ([(GEOLogMsgStateMapSettings *)self navVoiceSettingsCount])
  {
    [v10 clearNavVoiceSettings];
    unint64_t v5 = [(GEOLogMsgStateMapSettings *)self navVoiceSettingsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        id v8 = [(GEOLogMsgStateMapSettings *)self navVoiceSettingsAtIndex:i];
        [v10 addNavVoiceSettings:v8];
      }
    }
  }
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x40) != 0)
  {
    *((unsigned char *)v10 + 40) = self->_hFPEnabled;
    v10[15] |= 0x40u;
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
    if ((*(unsigned char *)&v9 & 2) == 0)
    {
LABEL_23:
      if ((*(unsigned char *)&v9 & 0x20) == 0) {
        goto LABEL_24;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&v9 & 2) == 0)
  {
    goto LABEL_23;
  }
  v10[5] = self->_drivingVoiceSettings;
  v10[15] |= 2u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 0x20) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&v9 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_54;
  }
LABEL_53:
  v10[9] = self->_walkingVoiceSettings;
  v10[15] |= 0x20u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(unsigned char *)&v9 & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_55;
  }
LABEL_54:
  v10[4] = self->_cyclingVoiceSettings;
  v10[15] |= 1u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((unsigned char *)v10 + 58) = self->_walkingAvoidHills;
  v10[15] |= 0x1000000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)v10 + 57) = self->_walkingAvoidBusyRoads;
  v10[15] |= 0x800000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)v10 + 59) = self->_walkingAvoidStairs;
  v10[15] |= 0x2000000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x4000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)v10 + 47) = self->_bikingAvoidHills;
  v10[15] |= 0x2000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v9 & 0x1000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)v10 + 48) = self->_bikingAvoidStairs;
  v10[15] |= 0x4000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_60:
  *((unsigned char *)v10 + 46) = self->_bikingAvoidBusyRoads;
  v10[15] |= 0x1000u;
  if ((*(_DWORD *)&self->_flags & 0x8000) != 0)
  {
LABEL_32:
    *((unsigned char *)v10 + 49) = self->_directionsWakeDevice;
    v10[15] |= 0x8000u;
  }
LABEL_33:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_preferredTransportMode;
    *(_DWORD *)(v5 + 60) |= 0x10u;
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 45) = self->_avoidTolls;
  *(_DWORD *)(v5 + 60) |= 0x800u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&flags & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(unsigned char *)(v5 + 42) = self->_avoidHighways;
  *(_DWORD *)(v5 + 60) |= 0x100u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(unsigned char *)(v5 + 52) = self->_headingEnabled;
  *(_DWORD *)(v5 + 60) |= 0x40000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&flags & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(unsigned char *)(v5 + 55) = self->_speedLimitEnabled;
  *(_DWORD *)(v5 + 60) |= 0x200000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 28) = self->_navVoiceVolume;
  *(_DWORD *)(v5 + 60) |= 8u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&flags & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(unsigned char *)(v5 + 54) = self->_pauseSpokenAudioEnabled;
  *(_DWORD *)(v5 + 60) |= 0x100000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(unsigned char *)(v5 + 51) = self->_findMyCarEnabled;
  *(_DWORD *)(v5 + 60) |= 0x20000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&flags & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(unsigned char *)(v5 + 56) = self->_trafficEnabled;
  *(_DWORD *)(v5 + 60) |= 0x400000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(unsigned char *)(v5 + 53) = self->_labelEnabled;
  *(_DWORD *)(v5 + 60) |= 0x80000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(unsigned char *)(v5 + 43) = self->_avoidHills;
  *(_DWORD *)(v5 + 60) |= 0x200u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&flags & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(unsigned char *)(v5 + 44) = self->_avoidStairs;
  *(_DWORD *)(v5 + 60) |= 0x400u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x80) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&flags & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(unsigned char *)(v5 + 41) = self->_avoidBusyRoads;
  *(_DWORD *)(v5 + 60) |= 0x80u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_50:
  *(_DWORD *)(v5 + 24) = self->_locationType;
  *(_DWORD *)(v5 + 60) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x10000) != 0)
  {
LABEL_16:
    *(unsigned char *)(v5 + 50) = self->_eBike;
    *(_DWORD *)(v5 + 60) |= 0x10000u;
  }
LABEL_17:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = self->_navVoiceSettings;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v12), "copyWithZone:", a3, (void)v16);
        [(id)v6 addNavVoiceSettings:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 0x40) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_hFPEnabled;
    *(_DWORD *)(v6 + 60) |= 0x40u;
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
    if ((*(unsigned char *)&v14 & 2) == 0)
    {
LABEL_26:
      if ((*(unsigned char *)&v14 & 0x20) == 0) {
        goto LABEL_27;
      }
      goto LABEL_54;
    }
  }
  else if ((*(unsigned char *)&v14 & 2) == 0)
  {
    goto LABEL_26;
  }
  *(_DWORD *)(v6 + 20) = self->_drivingVoiceSettings;
  *(_DWORD *)(v6 + 60) |= 2u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 0x20) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v14 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v6 + 36) = self->_walkingVoiceSettings;
  *(_DWORD *)(v6 + 60) |= 0x20u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(unsigned char *)&v14 & 1) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 16) = self->_cyclingVoiceSettings;
  *(_DWORD *)(v6 + 60) |= 1u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v14 & 0x800000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(unsigned char *)(v6 + 58) = self->_walkingAvoidHills;
  *(_DWORD *)(v6 + 60) |= 0x1000000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(unsigned char *)(v6 + 57) = self->_walkingAvoidBusyRoads;
  *(_DWORD *)(v6 + 60) |= 0x800000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v14 & 0x2000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(unsigned char *)(v6 + 59) = self->_walkingAvoidStairs;
  *(_DWORD *)(v6 + 60) |= 0x2000000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v14 & 0x4000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(unsigned char *)(v6 + 47) = self->_bikingAvoidHills;
  *(_DWORD *)(v6 + 60) |= 0x2000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v14 & 0x1000) == 0) {
      goto LABEL_34;
    }
LABEL_61:
    *(unsigned char *)(v6 + 46) = self->_bikingAvoidBusyRoads;
    *(_DWORD *)(v6 + 60) |= 0x1000u;
    if ((*(_DWORD *)&self->_flags & 0x8000) == 0) {
      return (id)v6;
    }
    goto LABEL_35;
  }
LABEL_60:
  *(unsigned char *)(v6 + 48) = self->_bikingAvoidStairs;
  *(_DWORD *)(v6 + 60) |= 0x4000u;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x1000) != 0) {
    goto LABEL_61;
  }
LABEL_34:
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
LABEL_35:
    *(unsigned char *)(v6 + 49) = self->_directionsWakeDevice;
    *(_DWORD *)(v6 + 60) |= 0x8000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_190;
  }
  [(GEOLogMsgStateMapSettings *)self readAll:1];
  [v4 readAll:1];
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  int v6 = *((_DWORD *)v4 + 15);
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_preferredTransportMode != *((_DWORD *)v4 + 8)) {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0) {
      goto LABEL_190;
    }
    if (self->_avoidTolls)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0) {
      goto LABEL_190;
    }
    if (self->_avoidHighways)
    {
      if (!*((unsigned char *)v4 + 42)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 42))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0) {
      goto LABEL_190;
    }
    if (self->_headingEnabled)
    {
      if (!*((unsigned char *)v4 + 52)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 52))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0) {
      goto LABEL_190;
    }
    if (self->_speedLimitEnabled)
    {
      if (!*((unsigned char *)v4 + 55)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 55))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(unsigned char *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_navVoiceVolume != *((_DWORD *)v4 + 7)) {
      goto LABEL_190;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0) {
      goto LABEL_190;
    }
    if (self->_pauseSpokenAudioEnabled)
    {
      if (!*((unsigned char *)v4 + 54)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 54))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0) {
      goto LABEL_190;
    }
    if (self->_findMyCarEnabled)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0) {
      goto LABEL_190;
    }
    if (self->_trafficEnabled)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0) {
      goto LABEL_190;
    }
    if (self->_labelEnabled)
    {
      if (!*((unsigned char *)v4 + 53)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 53))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0) {
      goto LABEL_190;
    }
    if (self->_avoidHills)
    {
      if (!*((unsigned char *)v4 + 43)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 43))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0) {
      goto LABEL_190;
    }
    if (self->_avoidStairs)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_190;
  }
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0) {
      goto LABEL_190;
    }
    if (self->_avoidBusyRoads)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_190;
  }
  if ((*(unsigned char *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_locationType != *((_DWORD *)v4 + 6)) {
      goto LABEL_190;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0) {
      goto LABEL_190;
    }
    if (self->_eBike)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_190;
  }
  navVoiceSettings = self->_navVoiceSettings;
  if ((unint64_t)navVoiceSettings | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](navVoiceSettings, "isEqual:")) {
      goto LABEL_190;
    }
    $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
    int v6 = *((_DWORD *)v4 + 15);
  }
  if ((*(unsigned char *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0) {
      goto LABEL_190;
    }
    if (self->_hFPEnabled)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_190;
  }
  if ((*(unsigned char *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drivingVoiceSettings != *((_DWORD *)v4 + 5)) {
      goto LABEL_190;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_190;
  }
  if ((*(unsigned char *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_walkingVoiceSettings != *((_DWORD *)v4 + 9)) {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_190;
  }
  if (*(unsigned char *)&flags)
  {
    if ((v6 & 1) == 0 || self->_cyclingVoiceSettings != *((_DWORD *)v4 + 4)) {
      goto LABEL_190;
    }
  }
  else if (v6)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_190;
    }
    if (self->_walkingAvoidHills)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0) {
      goto LABEL_190;
    }
    if (self->_walkingAvoidBusyRoads)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_190;
    }
    if (self->_walkingAvoidStairs)
    {
      if (!*((unsigned char *)v4 + 59)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 59))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0) {
      goto LABEL_190;
    }
    if (self->_bikingAvoidHills)
    {
      if (!*((unsigned char *)v4 + 47)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 47))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0) {
      goto LABEL_190;
    }
    if (self->_bikingAvoidStairs)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0) {
      goto LABEL_190;
    }
    if (self->_bikingAvoidBusyRoads)
    {
      if (!*((unsigned char *)v4 + 46)) {
        goto LABEL_190;
      }
    }
    else if (*((unsigned char *)v4 + 46))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) != 0)
    {
      if (self->_directionsWakeDevice)
      {
        if (!*((unsigned char *)v4 + 49)) {
          goto LABEL_190;
        }
      }
      else if (*((unsigned char *)v4 + 49))
      {
        goto LABEL_190;
      }
      BOOL v8 = 1;
      goto LABEL_191;
    }
LABEL_190:
    BOOL v8 = 0;
    goto LABEL_191;
  }
  BOOL v8 = (v6 & 0x8000) == 0;
LABEL_191:

  return v8;
}

- (unint64_t)hash
{
  [(GEOLogMsgStateMapSettings *)self readAll:1];
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags = self->_flags;
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    uint64_t v33 = 2654435761 * self->_preferredTransportMode;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
LABEL_3:
      uint64_t v32 = 2654435761 * self->_avoidTolls;
      if ((*(_WORD *)&flags & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v33 = 0;
    if ((*(_WORD *)&flags & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v32 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_4:
    uint64_t v31 = 2654435761 * self->_avoidHighways;
    if ((*(_DWORD *)&flags & 0x40000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
LABEL_5:
    uint64_t v30 = 2654435761 * self->_headingEnabled;
    if ((*(_DWORD *)&flags & 0x200000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
LABEL_6:
    uint64_t v29 = 2654435761 * self->_speedLimitEnabled;
    if ((*(unsigned char *)&flags & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v29 = 0;
  if ((*(unsigned char *)&flags & 8) != 0)
  {
LABEL_7:
    uint64_t v28 = 2654435761 * self->_navVoiceVolume;
    if ((*(_DWORD *)&flags & 0x100000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
LABEL_8:
    uint64_t v27 = 2654435761 * self->_pauseSpokenAudioEnabled;
    if ((*(_DWORD *)&flags & 0x20000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_9:
    uint64_t v25 = 2654435761 * self->_findMyCarEnabled;
    if ((*(_DWORD *)&flags & 0x400000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
LABEL_10:
    uint64_t v4 = 2654435761 * self->_trafficEnabled;
    if ((*(_DWORD *)&flags & 0x80000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
LABEL_11:
    uint64_t v5 = 2654435761 * self->_labelEnabled;
    if ((*(_WORD *)&flags & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v5 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_12:
    uint64_t v6 = 2654435761 * self->_avoidHills;
    if ((*(_WORD *)&flags & 0x400) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v6 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_13:
    uint64_t v7 = 2654435761 * self->_avoidStairs;
    if ((*(unsigned char *)&flags & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&flags & 0x80) != 0)
  {
LABEL_14:
    uint64_t v8 = 2654435761 * self->_avoidBusyRoads;
    if ((*(unsigned char *)&flags & 4) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v9 = 0;
    if ((*(_DWORD *)&flags & 0x10000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&flags & 4) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v9 = 2654435761 * self->_locationType;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
LABEL_16:
    uint64_t v10 = 2654435761 * self->_eBike;
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v10 = 0;
LABEL_32:
  uint64_t v11 = [(NSMutableArray *)self->_navVoiceSettings hash];
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v12 = self->_flags;
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
    uint64_t v13 = 2654435761 * self->_hFPEnabled;
    if ((*(unsigned char *)&v12 & 2) != 0)
    {
LABEL_34:
      uint64_t v14 = 2654435761 * self->_drivingVoiceSettings;
      if ((*(unsigned char *)&v12 & 0x20) != 0) {
        goto LABEL_35;
      }
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&v12 & 2) != 0) {
      goto LABEL_34;
    }
  }
  uint64_t v14 = 0;
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
LABEL_35:
    uint64_t v15 = 2654435761 * self->_walkingVoiceSettings;
    if (*(unsigned char *)&v12) {
      goto LABEL_36;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v15 = 0;
  if (*(unsigned char *)&v12)
  {
LABEL_36:
    uint64_t v16 = 2654435761 * self->_cyclingVoiceSettings;
    if ((*(_DWORD *)&v12 & 0x1000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
LABEL_37:
    uint64_t v17 = 2654435761 * self->_walkingAvoidHills;
    if ((*(_DWORD *)&v12 & 0x800000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
LABEL_38:
    uint64_t v18 = 2654435761 * self->_walkingAvoidBusyRoads;
    if ((*(_DWORD *)&v12 & 0x2000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
LABEL_39:
    uint64_t v19 = 2654435761 * self->_walkingAvoidStairs;
    if ((*(_WORD *)&v12 & 0x2000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v19 = 0;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
LABEL_40:
    uint64_t v20 = 2654435761 * self->_bikingAvoidHills;
    if ((*(_WORD *)&v12 & 0x4000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v20 = 0;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
LABEL_41:
    uint64_t v21 = 2654435761 * self->_bikingAvoidStairs;
    if ((*(_WORD *)&v12 & 0x1000) != 0) {
      goto LABEL_42;
    }
LABEL_53:
    uint64_t v22 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0) {
      goto LABEL_43;
    }
LABEL_54:
    uint64_t v23 = 0;
    return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_52:
  uint64_t v21 = 0;
  if ((*(_WORD *)&v12 & 0x1000) == 0) {
    goto LABEL_53;
  }
LABEL_42:
  uint64_t v22 = 2654435761 * self->_bikingAvoidBusyRoads;
  if ((*(_WORD *)&v12 & 0x8000) == 0) {
    goto LABEL_54;
  }
LABEL_43:
  uint64_t v23 = 2654435761 * self->_directionsWakeDevice;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 readAll:0];
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x10) != 0)
  {
    self->_preferredTransportMode = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_flags |= 0x10u;
    int v5 = *((_DWORD *)v4 + 15);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidTolls = *((unsigned char *)v4 + 45);
  *(_DWORD *)&self->_flags |= 0x800u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_avoidHighways = *((unsigned char *)v4 + 42);
  *(_DWORD *)&self->_flags |= 0x100u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x40000) == 0)
  {
LABEL_5:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_headingEnabled = *((unsigned char *)v4 + 52);
  *(_DWORD *)&self->_flags |= 0x40000u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x200000) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_speedLimitEnabled = *((unsigned char *)v4 + 55);
  *(_DWORD *)&self->_flags |= 0x200000u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_navVoiceVolume = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_flags |= 8u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x100000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_pauseSpokenAudioEnabled = *((unsigned char *)v4 + 54);
  *(_DWORD *)&self->_flags |= 0x100000u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_findMyCarEnabled = *((unsigned char *)v4 + 51);
  *(_DWORD *)&self->_flags |= 0x20000u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x400000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_trafficEnabled = *((unsigned char *)v4 + 56);
  *(_DWORD *)&self->_flags |= 0x400000u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_labelEnabled = *((unsigned char *)v4 + 53);
  *(_DWORD *)&self->_flags |= 0x80000u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x400) == 0) {
      goto LABEL_13;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_avoidHills = *((unsigned char *)v4 + 43);
  *(_DWORD *)&self->_flags |= 0x200u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x400) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_avoidStairs = *((unsigned char *)v4 + 44);
  *(_DWORD *)&self->_flags |= 0x400u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_avoidBusyRoads = *((unsigned char *)v4 + 41);
  *(_DWORD *)&self->_flags |= 0x80u;
  int v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_50:
  self->_locationType = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 15) & 0x10000) != 0)
  {
LABEL_16:
    self->_eBike = *((unsigned char *)v4 + 50);
    *(_DWORD *)&self->_flags |= 0x10000u;
  }
LABEL_17:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = *((id *)v4 + 1);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        -[GEOLogMsgStateMapSettings addNavVoiceSettings:](self, "addNavVoiceSettings:", *(void *)(*((void *)&v12 + 1) + 8 * v10++), (void)v12);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x40) != 0)
  {
    self->_hFPEnabled = *((unsigned char *)v4 + 40);
    *(_DWORD *)&self->_flags |= 0x40u;
    int v11 = *((_DWORD *)v4 + 15);
    if ((v11 & 2) == 0)
    {
LABEL_26:
      if ((v11 & 0x20) == 0) {
        goto LABEL_27;
      }
      goto LABEL_54;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_26;
  }
  self->_drivingVoiceSettings = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_flags |= 2u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x20) == 0)
  {
LABEL_27:
    if ((v11 & 1) == 0) {
      goto LABEL_28;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_walkingVoiceSettings = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_flags |= 0x20u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 1) == 0)
  {
LABEL_28:
    if ((v11 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_cyclingVoiceSettings = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_flags |= 1u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_29:
    if ((v11 & 0x800000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_walkingAvoidHills = *((unsigned char *)v4 + 58);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x800000) == 0)
  {
LABEL_30:
    if ((v11 & 0x2000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_walkingAvoidBusyRoads = *((unsigned char *)v4 + 57);
  *(_DWORD *)&self->_flags |= 0x800000u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_31:
    if ((v11 & 0x2000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_walkingAvoidStairs = *((unsigned char *)v4 + 59);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x2000) == 0)
  {
LABEL_32:
    if ((v11 & 0x4000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_bikingAvoidHills = *((unsigned char *)v4 + 47);
  *(_DWORD *)&self->_flags |= 0x2000u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x4000) == 0)
  {
LABEL_33:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_34;
    }
LABEL_61:
    self->_bikingAvoidBusyRoads = *((unsigned char *)v4 + 46);
    *(_DWORD *)&self->_flags |= 0x1000u;
    if ((*((_DWORD *)v4 + 15) & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_60:
  self->_bikingAvoidStairs = *((unsigned char *)v4 + 48);
  *(_DWORD *)&self->_flags |= 0x4000u;
  int v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x1000) != 0) {
    goto LABEL_61;
  }
LABEL_34:
  if ((v11 & 0x8000) != 0)
  {
LABEL_35:
    self->_directionsWakeDevice = *((unsigned char *)v4 + 49);
    *(_DWORD *)&self->_flags |= 0x8000u;
  }
LABEL_36:
}

@end