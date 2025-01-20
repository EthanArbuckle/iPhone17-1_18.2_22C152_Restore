@interface DMDataMigratorMigrationStatistics
- (BOOL)hasBuildMigratedFrom;
- (BOOL)hasDuration;
- (BOOL)hasFastPluginDuration;
- (BOOL)hasMigratedAfterUpgrade;
- (BOOL)hasMigratedFromBackup;
- (BOOL)hasMigratedFromBackupSourceDifferentDevice;
- (BOOL)hasMigratedFromBackupSourceiCloud;
- (BOOL)hasPluginCrashCount;
- (BOOL)hasPluginReturnedFalseCount;
- (BOOL)hasPluginWatchdogCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)migratedAfterUpgrade;
- (BOOL)migratedFromBackup;
- (BOOL)migratedFromBackupSourceDifferentDevice;
- (BOOL)migratedFromBackupSourceiCloud;
- (BOOL)readFrom:(id)a3;
- (NSString)buildMigratedFrom;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)duration;
- (unsigned)fastPluginDuration;
- (unsigned)pluginCrashCount;
- (unsigned)pluginReturnedFalseCount;
- (unsigned)pluginWatchdogCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBuildMigratedFrom:(id)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setFastPluginDuration:(unsigned int)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasFastPluginDuration:(BOOL)a3;
- (void)setHasMigratedAfterUpgrade:(BOOL)a3;
- (void)setHasMigratedFromBackup:(BOOL)a3;
- (void)setHasMigratedFromBackupSourceDifferentDevice:(BOOL)a3;
- (void)setHasMigratedFromBackupSourceiCloud:(BOOL)a3;
- (void)setHasPluginCrashCount:(BOOL)a3;
- (void)setHasPluginReturnedFalseCount:(BOOL)a3;
- (void)setHasPluginWatchdogCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMigratedAfterUpgrade:(BOOL)a3;
- (void)setMigratedFromBackup:(BOOL)a3;
- (void)setMigratedFromBackupSourceDifferentDevice:(BOOL)a3;
- (void)setMigratedFromBackupSourceiCloud:(BOOL)a3;
- (void)setPluginCrashCount:(unsigned int)a3;
- (void)setPluginReturnedFalseCount:(unsigned int)a3;
- (void)setPluginWatchdogCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation DMDataMigratorMigrationStatistics

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setDuration:(unsigned int)a3
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

- (void)setFastPluginDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_fastPluginDuration = a3;
}

- (void)setHasFastPluginDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasFastPluginDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setPluginCrashCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pluginCrashCount = a3;
}

- (void)setHasPluginCrashCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPluginCrashCount
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setPluginWatchdogCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_pluginWatchdogCount = a3;
}

- (void)setHasPluginWatchdogCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPluginWatchdogCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPluginReturnedFalseCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_pluginReturnedFalseCount = a3;
}

- (void)setHasPluginReturnedFalseCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPluginReturnedFalseCount
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasBuildMigratedFrom
{
  return self->_buildMigratedFrom != 0;
}

- (void)setMigratedAfterUpgrade:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_migratedAfterUpgrade = a3;
}

- (void)setHasMigratedAfterUpgrade:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMigratedAfterUpgrade
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setMigratedFromBackup:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_migratedFromBackup = a3;
}

- (void)setHasMigratedFromBackup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMigratedFromBackup
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMigratedFromBackupSourceDifferentDevice:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_migratedFromBackupSourceDifferentDevice = a3;
}

- (void)setHasMigratedFromBackupSourceDifferentDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMigratedFromBackupSourceDifferentDevice
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setMigratedFromBackupSourceiCloud:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_migratedFromBackupSourceiCloud = a3;
}

- (void)setHasMigratedFromBackupSourceiCloud:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasMigratedFromBackupSourceiCloud
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DMDataMigratorMigrationStatistics;
  __int16 v3 = [(DMDataMigratorMigrationStatistics *)&v7 description];
  v4 = [(DMDataMigratorMigrationStatistics *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v10 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v10 forKey:@"timestamp"];

    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  v11 = +[NSNumber numberWithUnsignedInt:self->_duration];
  [v3 setObject:v11 forKey:@"duration"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v12 = +[NSNumber numberWithUnsignedInt:self->_fastPluginDuration];
  [v3 setObject:v12 forKey:@"fastPluginDuration"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v13 = +[NSNumber numberWithUnsignedInt:self->_pluginCrashCount];
  [v3 setObject:v13 forKey:@"pluginCrashCount"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  v14 = +[NSNumber numberWithUnsignedInt:self->_pluginWatchdogCount];
  [v3 setObject:v14 forKey:@"pluginWatchdogCount"];

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    v5 = +[NSNumber numberWithUnsignedInt:self->_pluginReturnedFalseCount];
    [v3 setObject:v5 forKey:@"pluginReturnedFalseCount"];
  }
LABEL_8:
  buildMigratedFrom = self->_buildMigratedFrom;
  if (buildMigratedFrom) {
    [v3 setObject:buildMigratedFrom forKey:@"buildMigratedFrom"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x40) != 0)
  {
    v15 = +[NSNumber numberWithBool:self->_migratedAfterUpgrade];
    [v3 setObject:v15 forKey:@"migratedAfterUpgrade"];

    __int16 v7 = (__int16)self->_has;
    if ((v7 & 0x80) == 0)
    {
LABEL_12:
      if ((v7 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  v16 = +[NSNumber numberWithBool:self->_migratedFromBackup];
  [v3 setObject:v16 forKey:@"migratedFromBackup"];

  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_26:
  v17 = +[NSNumber numberWithBool:self->_migratedFromBackupSourceDifferentDevice];
  [v3 setObject:v17 forKey:@"migratedFromBackupSourceDifferentDevice"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    v8 = +[NSNumber numberWithBool:self->_migratedFromBackupSourceiCloud];
    [v3 setObject:v8 forKey:@"migratedFromBackupSourceiCloud"];
  }
LABEL_15:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DMDataMigratorMigrationStatisticsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint32Field();
LABEL_8:
  if (self->_buildMigratedFrom) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 0x80) == 0)
    {
LABEL_12:
      if ((v5 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_26;
    }
  }
  else if ((v5 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteBOOLField();
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 0x100) == 0)
  {
LABEL_13:
    if ((v5 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_14:
  }
    PBDataWriterWriteBOOLField();
LABEL_15:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((_WORD *)v4 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 6) = self->_duration;
  *((_WORD *)v4 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v4 + 7) = self->_fastPluginDuration;
  *((_WORD *)v4 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 8) = self->_pluginCrashCount;
  *((_WORD *)v4 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  *((_DWORD *)v4 + 10) = self->_pluginWatchdogCount;
  *((_WORD *)v4 + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 9) = self->_pluginReturnedFalseCount;
    *((_WORD *)v4 + 24) |= 0x10u;
  }
LABEL_8:
  if (self->_buildMigratedFrom)
  {
    __int16 v7 = v4;
    objc_msgSend(v4, "setBuildMigratedFrom:");
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((unsigned char *)v4 + 44) = self->_migratedAfterUpgrade;
    *((_WORD *)v4 + 24) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  *((unsigned char *)v4 + 45) = self->_migratedFromBackup;
  *((_WORD *)v4 + 24) |= 0x80u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x100) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_26:
  *((unsigned char *)v4 + 46) = self->_migratedFromBackupSourceDifferentDevice;
  *((_WORD *)v4 + 24) |= 0x100u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_14:
    *((unsigned char *)v4 + 47) = self->_migratedFromBackupSourceiCloud;
    *((_WORD *)v4 + 24) |= 0x200u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  __int16 v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  __int16 v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v5[1] = self->_timestamp;
    *((_WORD *)v5 + 24) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 6) = self->_duration;
  *((_WORD *)v5 + 24) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v5 + 7) = self->_fastPluginDuration;
  *((_WORD *)v5 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v5 + 8) = self->_pluginCrashCount;
  *((_WORD *)v5 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_18:
  *((_DWORD *)v5 + 10) = self->_pluginWatchdogCount;
  *((_WORD *)v5 + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v5 + 9) = self->_pluginReturnedFalseCount;
    *((_WORD *)v5 + 24) |= 0x10u;
  }
LABEL_8:
  id v8 = [(NSString *)self->_buildMigratedFrom copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x40) != 0)
  {
    *((unsigned char *)v6 + 44) = self->_migratedAfterUpgrade;
    *((_WORD *)v6 + 24) |= 0x40u;
    __int16 v10 = (__int16)self->_has;
    if ((v10 & 0x80) == 0)
    {
LABEL_10:
      if ((v10 & 0x100) == 0) {
        goto LABEL_11;
      }
LABEL_22:
      *((unsigned char *)v6 + 46) = self->_migratedFromBackupSourceDifferentDevice;
      *((_WORD *)v6 + 24) |= 0x100u;
      if ((*(_WORD *)&self->_has & 0x200) == 0) {
        return v6;
      }
      goto LABEL_12;
    }
  }
  else if ((v10 & 0x80) == 0)
  {
    goto LABEL_10;
  }
  *((unsigned char *)v6 + 45) = self->_migratedFromBackup;
  *((_WORD *)v6 + 24) |= 0x80u;
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x100) != 0) {
    goto LABEL_22;
  }
LABEL_11:
  if ((v10 & 0x200) != 0)
  {
LABEL_12:
    *((unsigned char *)v6 + 47) = self->_migratedFromBackupSourceiCloud;
    *((_WORD *)v6 + 24) |= 0x200u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_62;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 24);
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_62;
    }
  }
  else if (v6)
  {
    goto LABEL_62;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_duration != *((_DWORD *)v4 + 6)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_fastPluginDuration != *((_DWORD *)v4 + 7)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_pluginCrashCount != *((_DWORD *)v4 + 8)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_pluginWatchdogCount != *((_DWORD *)v4 + 10)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_pluginReturnedFalseCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_62;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_62;
  }
  buildMigratedFrom = self->_buildMigratedFrom;
  if ((unint64_t)buildMigratedFrom | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buildMigratedFrom, "isEqual:")) {
      goto LABEL_62;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 24);
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_62;
    }
    if (self->_migratedAfterUpgrade)
    {
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_62;
      }
    }
    else if (*((unsigned char *)v4 + 44))
    {
      goto LABEL_62;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_62;
    }
    if (self->_migratedFromBackup)
    {
      if (!*((unsigned char *)v4 + 45)) {
        goto LABEL_62;
      }
    }
    else if (*((unsigned char *)v4 + 45))
    {
      goto LABEL_62;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x100) == 0) {
      goto LABEL_62;
    }
    if (self->_migratedFromBackupSourceDifferentDevice)
    {
      if (!*((unsigned char *)v4 + 46)) {
        goto LABEL_62;
      }
    }
    else if (*((unsigned char *)v4 + 46))
    {
      goto LABEL_62;
    }
  }
  else if ((*((_WORD *)v4 + 24) & 0x100) != 0)
  {
    goto LABEL_62;
  }
  if ((has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 24) & 0x200) != 0)
    {
      if (self->_migratedFromBackupSourceiCloud)
      {
        if (!*((unsigned char *)v4 + 47)) {
          goto LABEL_62;
        }
      }
      else if (*((unsigned char *)v4 + 47))
      {
        goto LABEL_62;
      }
      BOOL v9 = 1;
      goto LABEL_63;
    }
LABEL_62:
    BOOL v9 = 0;
    goto LABEL_63;
  }
  BOOL v9 = (v8 & 0x200) == 0;
LABEL_63:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_duration;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_fastPluginDuration;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_pluginCrashCount;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_pluginWatchdogCount;
  if ((has & 0x10) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_pluginReturnedFalseCount;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v9 = 0;
LABEL_14:
  NSUInteger v10 = [(NSString *)self->_buildMigratedFrom hash];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    uint64_t v12 = 2654435761 * self->_migratedAfterUpgrade;
    if ((v11 & 0x80) != 0)
    {
LABEL_16:
      uint64_t v13 = 2654435761 * self->_migratedFromBackup;
      if ((*(_WORD *)&self->_has & 0x100) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v14 = 0;
      if ((*(_WORD *)&self->_has & 0x200) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v15 = 0;
      return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((v11 & 0x80) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v14 = 2654435761 * self->_migratedFromBackupSourceDifferentDevice;
  if ((*(_WORD *)&self->_has & 0x200) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v15 = 2654435761 * self->_migratedFromBackupSourceiCloud;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v12 ^ v13 ^ v14 ^ v15 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 24);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)v4 + 24);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_duration = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_fastPluginDuration = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_pluginCrashCount = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 24);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_22:
  self->_pluginWatchdogCount = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)v4 + 24) & 0x10) != 0)
  {
LABEL_7:
    self->_pluginReturnedFalseCount = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_8:
  if (*((void *)v4 + 2))
  {
    id v7 = v4;
    -[DMDataMigratorMigrationStatistics setBuildMigratedFrom:](self, "setBuildMigratedFrom:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 24);
  if ((v6 & 0x40) != 0)
  {
    self->_migratedAfterUpgrade = *((unsigned char *)v4 + 44);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 24);
    if ((v6 & 0x80) == 0)
    {
LABEL_12:
      if ((v6 & 0x100) == 0) {
        goto LABEL_13;
      }
      goto LABEL_26;
    }
  }
  else if ((v6 & 0x80) == 0)
  {
    goto LABEL_12;
  }
  self->_migratedFromBackup = *((unsigned char *)v4 + 45);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v6 = *((_WORD *)v4 + 24);
  if ((v6 & 0x100) == 0)
  {
LABEL_13:
    if ((v6 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_26:
  self->_migratedFromBackupSourceDifferentDevice = *((unsigned char *)v4 + 46);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 24) & 0x200) != 0)
  {
LABEL_14:
    self->_migratedFromBackupSourceiCloud = *((unsigned char *)v4 + 47);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_15:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)duration
{
  return self->_duration;
}

- (unsigned)fastPluginDuration
{
  return self->_fastPluginDuration;
}

- (unsigned)pluginCrashCount
{
  return self->_pluginCrashCount;
}

- (unsigned)pluginWatchdogCount
{
  return self->_pluginWatchdogCount;
}

- (unsigned)pluginReturnedFalseCount
{
  return self->_pluginReturnedFalseCount;
}

- (NSString)buildMigratedFrom
{
  return self->_buildMigratedFrom;
}

- (void)setBuildMigratedFrom:(id)a3
{
}

- (BOOL)migratedAfterUpgrade
{
  return self->_migratedAfterUpgrade;
}

- (BOOL)migratedFromBackup
{
  return self->_migratedFromBackup;
}

- (BOOL)migratedFromBackupSourceDifferentDevice
{
  return self->_migratedFromBackupSourceDifferentDevice;
}

- (BOOL)migratedFromBackupSourceiCloud
{
  return self->_migratedFromBackupSourceiCloud;
}

- (void).cxx_destruct
{
}

@end