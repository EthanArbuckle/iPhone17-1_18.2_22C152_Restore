@interface HDCodableSleepSchedule
- (BOOL)applyToObject:(id)a3;
- (BOOL)applyToObject:(id)a3 error:(id *)a4;
- (BOOL)friday;
- (BOOL)hasBedHour;
- (BOOL)hasBedMinute;
- (BOOL)hasFriday;
- (BOOL)hasMonday;
- (BOOL)hasOverrideDayIndex;
- (BOOL)hasSample;
- (BOOL)hasSaturday;
- (BOOL)hasSunday;
- (BOOL)hasThursday;
- (BOOL)hasTuesday;
- (BOOL)hasWakeHour;
- (BOOL)hasWakeMinute;
- (BOOL)hasWednesday;
- (BOOL)isEqual:(id)a3;
- (BOOL)monday;
- (BOOL)readFrom:(id)a3;
- (BOOL)saturday;
- (BOOL)sunday;
- (BOOL)thursday;
- (BOOL)tuesday;
- (BOOL)wednesday;
- (HDCodableSample)sample;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)bedHour;
- (int64_t)bedMinute;
- (int64_t)overrideDayIndex;
- (int64_t)wakeHour;
- (int64_t)wakeMinute;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBedHour:(int64_t)a3;
- (void)setBedMinute:(int64_t)a3;
- (void)setFriday:(BOOL)a3;
- (void)setHasBedHour:(BOOL)a3;
- (void)setHasBedMinute:(BOOL)a3;
- (void)setHasFriday:(BOOL)a3;
- (void)setHasMonday:(BOOL)a3;
- (void)setHasOverrideDayIndex:(BOOL)a3;
- (void)setHasSaturday:(BOOL)a3;
- (void)setHasSunday:(BOOL)a3;
- (void)setHasThursday:(BOOL)a3;
- (void)setHasTuesday:(BOOL)a3;
- (void)setHasWakeHour:(BOOL)a3;
- (void)setHasWakeMinute:(BOOL)a3;
- (void)setHasWednesday:(BOOL)a3;
- (void)setMonday:(BOOL)a3;
- (void)setOverrideDayIndex:(int64_t)a3;
- (void)setSample:(id)a3;
- (void)setSaturday:(BOOL)a3;
- (void)setSunday:(BOOL)a3;
- (void)setThursday:(BOOL)a3;
- (void)setTuesday:(BOOL)a3;
- (void)setWakeHour:(int64_t)a3;
- (void)setWakeMinute:(int64_t)a3;
- (void)setWednesday:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableSleepSchedule

- (BOOL)applyToObject:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = 0;
  BOOL v3 = [(HDCodableSleepSchedule *)self applyToObject:a3 error:&v7];
  id v4 = v7;
  if (!v3)
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E4F29F18];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F18], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "Failed to decode object of type HKSleepSchedule with error %@", buf, 0xCu);
    }
  }

  return v3;
}

- (BOOL)applyToObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E4F28C58];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    objc_msgSend(v13, "hk_assignError:code:format:", a4, 3, @"Unexpected class %@", v15);

LABEL_14:
    BOOL v12 = 0;
    goto LABEL_15;
  }
  id v7 = [(HDCodableSleepSchedule *)self sample];
  char v8 = [v7 applyToObject:v6];

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 3, @"Failed to decode superclass message");
    goto LABEL_14;
  }
  [(HDCodableSleepSchedule *)self monday];
  [(HDCodableSleepSchedule *)self tuesday];
  [(HDCodableSleepSchedule *)self wednesday];
  [(HDCodableSleepSchedule *)self thursday];
  [(HDCodableSleepSchedule *)self friday];
  [(HDCodableSleepSchedule *)self saturday];
  [(HDCodableSleepSchedule *)self sunday];
  [v6 _setWeekdays:HKSleepScheduleWeekdaysMake()];
  if ([(HDCodableSleepSchedule *)self hasWakeHour]
    && [(HDCodableSleepSchedule *)self hasWakeMinute])
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithHour:minute:", -[HDCodableSleepSchedule wakeHour](self, "wakeHour"), -[HDCodableSleepSchedule wakeMinute](self, "wakeMinute"));
    [v6 _setWakeTimeComponents:v9];
  }
  if ([(HDCodableSleepSchedule *)self hasBedHour]
    && [(HDCodableSleepSchedule *)self hasBedMinute])
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1C9D8], "hk_componentsWithHour:minute:", -[HDCodableSleepSchedule bedHour](self, "bedHour"), -[HDCodableSleepSchedule bedMinute](self, "bedMinute"));
    [v6 _setBedTimeComponents:v10];
  }
  if ([(HDCodableSleepSchedule *)self hasOverrideDayIndex])
  {
    v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDCodableSleepSchedule overrideDayIndex](self, "overrideDayIndex"));
    [v6 _setOverrideDayIndex:v11];
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

- (BOOL)hasSample
{
  return self->_sample != 0;
}

- (void)setMonday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_monday = a3;
}

- (void)setHasMonday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasMonday
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setTuesday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_tuesday = a3;
}

- (void)setHasTuesday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTuesday
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWednesday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_wednesday = a3;
}

- (void)setHasWednesday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWednesday
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setThursday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_thursday = a3;
}

- (void)setHasThursday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasThursday
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFriday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_friday = a3;
}

- (void)setHasFriday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasFriday
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setSaturday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_saturday = a3;
}

- (void)setHasSaturday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSaturday
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setSunday:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_sunday = a3;
}

- (void)setHasSunday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSunday
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWakeHour:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_wakeHour = a3;
}

- (void)setHasWakeHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasWakeHour
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWakeMinute:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_wakeMinute = a3;
}

- (void)setHasWakeMinute:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasWakeMinute
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBedHour:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_bedHour = a3;
}

- (void)setHasBedHour:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBedHour
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setBedMinute:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bedMinute = a3;
}

- (void)setHasBedMinute:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBedMinute
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setOverrideDayIndex:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_overrideDayIndex = a3;
}

- (void)setHasOverrideDayIndex:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOverrideDayIndex
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (NSString)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableSleepSchedule;
  id v4 = [(HDCodableSleepSchedule *)&v8 description];
  v5 = [(HDCodableSleepSchedule *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    id v9 = [NSNumber numberWithBool:self->_monday];
    [v3 setObject:v9 forKey:@"monday"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  uint64_t v10 = [NSNumber numberWithBool:self->_tuesday];
  [v3 setObject:v10 forKey:@"tuesday"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  v11 = [NSNumber numberWithBool:self->_wednesday];
  [v3 setObject:v11 forKey:@"wednesday"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  BOOL v12 = [NSNumber numberWithBool:self->_thursday];
  [v3 setObject:v12 forKey:@"thursday"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  v13 = [NSNumber numberWithBool:self->_friday];
  [v3 setObject:v13 forKey:@"friday"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  v14 = [NSNumber numberWithBool:self->_saturday];
  [v3 setObject:v14 forKey:@"saturday"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  v15 = [NSNumber numberWithBool:self->_sunday];
  [v3 setObject:v15 forKey:@"sunday"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  v16 = [NSNumber numberWithLongLong:self->_wakeHour];
  [v3 setObject:v16 forKey:@"wakeHour"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  v17 = [NSNumber numberWithLongLong:self->_wakeMinute];
  [v3 setObject:v17 forKey:@"wakeMinute"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  v18 = [NSNumber numberWithLongLong:self->_bedHour];
  [v3 setObject:v18 forKey:@"bedHour"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_29:
  v19 = [NSNumber numberWithLongLong:self->_bedMinute];
  [v3 setObject:v19 forKey:@"bedMinute"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_15:
    id v7 = [NSNumber numberWithLongLong:self->_overrideDayIndex];
    [v3 setObject:v7 forKey:@"overrideDayIndex"];
  }
LABEL_16:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableSleepScheduleReadFrom((uint64_t)self, (uint64_t)a3);
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
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_16:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_sample)
  {
    id v6 = v4;
    objc_msgSend(v4, "setSample:");
    id v4 = v6;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *((unsigned char *)v4 + 57) = self->_monday;
    *((_WORD *)v4 + 32) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_5:
      if ((has & 0x800) == 0) {
        goto LABEL_6;
      }
      goto LABEL_21;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 61) = self->_tuesday;
  *((_WORD *)v4 + 32) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_6:
    if ((has & 0x200) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)v4 + 62) = self->_wednesday;
  *((_WORD *)v4 + 32) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 60) = self->_thursday;
  *((_WORD *)v4 + 32) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_8:
    if ((has & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)v4 + 56) = self->_friday;
  *((_WORD *)v4 + 32) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)v4 + 58) = self->_saturday;
  *((_WORD *)v4 + 32) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)v4 + 59) = self->_sunday;
  *((_WORD *)v4 + 32) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_11:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((void *)v4 + 4) = self->_wakeHour;
  *((_WORD *)v4 + 32) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_12:
    if ((has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((void *)v4 + 5) = self->_wakeMinute;
  *((_WORD *)v4 + 32) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_13:
    if ((has & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 1) = self->_bedHour;
  *((_WORD *)v4 + 32) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_14:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_29:
  *((void *)v4 + 2) = self->_bedMinute;
  *((_WORD *)v4 + 32) |= 2u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_15:
    *((void *)v4 + 3) = self->_overrideDayIndex;
    *((_WORD *)v4 + 32) |= 4u;
  }
LABEL_16:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(HDCodableSample *)self->_sample copyWithZone:a3];
  id v7 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 57) = self->_monday;
    *(_WORD *)(v5 + 64) |= 0x40u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x800) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 61) = self->_tuesday;
  *(_WORD *)(v5 + 64) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_4:
    if ((has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(unsigned char *)(v5 + 62) = self->_wednesday;
  *(_WORD *)(v5 + 64) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *(unsigned char *)(v5 + 60) = self->_thursday;
  *(_WORD *)(v5 + 64) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x80) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(unsigned char *)(v5 + 56) = self->_friday;
  *(_WORD *)(v5 + 64) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(unsigned char *)(v5 + 58) = self->_saturday;
  *(_WORD *)(v5 + 64) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(unsigned char *)(v5 + 59) = self->_sunday;
  *(_WORD *)(v5 + 64) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 32) = self->_wakeHour;
  *(_WORD *)(v5 + 64) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(void *)(v5 + 40) = self->_wakeMinute;
  *(_WORD *)(v5 + 64) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_11:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
LABEL_25:
    *(void *)(v5 + 16) = self->_bedMinute;
    *(_WORD *)(v5 + 64) |= 2u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_13;
  }
LABEL_24:
  *(void *)(v5 + 8) = self->_bedHour;
  *(_WORD *)(v5 + 64) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_25;
  }
LABEL_12:
  if ((has & 4) != 0)
  {
LABEL_13:
    *(void *)(v5 + 24) = self->_overrideDayIndex;
    *(_WORD *)(v5 + 64) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_85;
  }
  sample = self->_sample;
  if ((unint64_t)sample | *((void *)v4 + 6))
  {
    if (!-[HDCodableSample isEqual:](sample, "isEqual:")) {
      goto LABEL_85;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0) {
      goto LABEL_85;
    }
    if (self->_monday)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x400) == 0) {
      goto LABEL_85;
    }
    if (self->_tuesday)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x800) == 0) {
      goto LABEL_85;
    }
    if (self->_wednesday)
    {
      if (!*((unsigned char *)v4 + 62)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 62))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x800) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x200) == 0) {
      goto LABEL_85;
    }
    if (self->_thursday)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_85;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x200) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0) {
      goto LABEL_85;
    }
    if (self->_friday)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_85;
    }
    if (self->_saturday)
    {
      if (!*((unsigned char *)v4 + 58)) {
        goto LABEL_85;
      }
    }
    else if (*((unsigned char *)v4 + 58))
    {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_85;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 32) & 0x100) != 0)
    {
      if (self->_sunday)
      {
        if (!*((unsigned char *)v4 + 59)) {
          goto LABEL_85;
        }
        goto LABEL_60;
      }
      if (!*((unsigned char *)v4 + 59)) {
        goto LABEL_60;
      }
    }
LABEL_85:
    BOOL v8 = 0;
    goto LABEL_86;
  }
  if ((*((_WORD *)v4 + 32) & 0x100) != 0) {
    goto LABEL_85;
  }
LABEL_60:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_wakeHour != *((void *)v4 + 4)) {
      goto LABEL_85;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_wakeMinute != *((void *)v4 + 5)) {
      goto LABEL_85;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_85;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_bedHour != *((void *)v4 + 1)) {
      goto LABEL_85;
    }
  }
  else if (v7)
  {
    goto LABEL_85;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_bedMinute != *((void *)v4 + 2)) {
      goto LABEL_85;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_85;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_overrideDayIndex != *((void *)v4 + 3)) {
      goto LABEL_85;
    }
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = (v7 & 4) == 0;
  }
LABEL_86:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HDCodableSample *)self->_sample hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    uint64_t v5 = 2654435761 * self->_monday;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v6 = 2654435761 * self->_tuesday;
      if ((*(_WORD *)&self->_has & 0x800) != 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_wednesday;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v8 = 2654435761 * self->_thursday;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v8 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v9 = 2654435761 * self->_friday;
    if ((has & 0x80) != 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_7:
    uint64_t v10 = 2654435761 * self->_saturday;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_8:
    uint64_t v11 = 2654435761 * self->_sunday;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v11 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    uint64_t v12 = 2654435761 * self->_wakeHour;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v12 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    uint64_t v13 = 2654435761 * self->_wakeMinute;
    if (has) {
      goto LABEL_11;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v13 = 0;
  if (has)
  {
LABEL_11:
    uint64_t v14 = 2654435761 * self->_bedHour;
    if ((has & 2) != 0) {
      goto LABEL_12;
    }
LABEL_24:
    uint64_t v15 = 0;
    if ((has & 4) != 0) {
      goto LABEL_13;
    }
LABEL_25:
    uint64_t v16 = 0;
    return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_23:
  uint64_t v14 = 0;
  if ((has & 2) == 0) {
    goto LABEL_24;
  }
LABEL_12:
  uint64_t v15 = 2654435761 * self->_bedMinute;
  if ((has & 4) == 0) {
    goto LABEL_25;
  }
LABEL_13:
  uint64_t v16 = 2654435761 * self->_overrideDayIndex;
  return v5 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  sample = self->_sample;
  uint64_t v6 = *((void *)v4 + 6);
  if (sample)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[HDCodableSample mergeFrom:](sample, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[HDCodableSleepSchedule setSample:](self, "setSample:");
  }
  id v4 = v8;
LABEL_7:
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x40) != 0)
  {
    self->_monday = *((unsigned char *)v4 + 57);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v7 = *((_WORD *)v4 + 32);
    if ((v7 & 0x400) == 0)
    {
LABEL_9:
      if ((v7 & 0x800) == 0) {
        goto LABEL_10;
      }
      goto LABEL_25;
    }
  }
  else if ((*((_WORD *)v4 + 32) & 0x400) == 0)
  {
    goto LABEL_9;
  }
  self->_tuesday = *((unsigned char *)v4 + 61);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x800) == 0)
  {
LABEL_10:
    if ((v7 & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_wednesday = *((unsigned char *)v4 + 62);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x200) == 0)
  {
LABEL_11:
    if ((v7 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_thursday = *((unsigned char *)v4 + 60);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x20) == 0)
  {
LABEL_12:
    if ((v7 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_friday = *((unsigned char *)v4 + 56);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x80) == 0)
  {
LABEL_13:
    if ((v7 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_saturday = *((unsigned char *)v4 + 58);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x100) == 0)
  {
LABEL_14:
    if ((v7 & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_sunday = *((unsigned char *)v4 + 59);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 8) == 0)
  {
LABEL_15:
    if ((v7 & 0x10) == 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_wakeHour = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 0x10) == 0)
  {
LABEL_16:
    if ((v7 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_wakeMinute = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 1) == 0)
  {
LABEL_17:
    if ((v7 & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_bedHour = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v7 = *((_WORD *)v4 + 32);
  if ((v7 & 2) == 0)
  {
LABEL_18:
    if ((v7 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_33:
  self->_bedMinute = *((void *)v4 + 2);
  *(_WORD *)&self->_has |= 2u;
  if ((*((_WORD *)v4 + 32) & 4) != 0)
  {
LABEL_19:
    self->_overrideDayIndex = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_20:
}

- (HDCodableSample)sample
{
  return self->_sample;
}

- (void)setSample:(id)a3
{
}

- (BOOL)monday
{
  return self->_monday;
}

- (BOOL)tuesday
{
  return self->_tuesday;
}

- (BOOL)wednesday
{
  return self->_wednesday;
}

- (BOOL)thursday
{
  return self->_thursday;
}

- (BOOL)friday
{
  return self->_friday;
}

- (BOOL)saturday
{
  return self->_saturday;
}

- (BOOL)sunday
{
  return self->_sunday;
}

- (int64_t)wakeHour
{
  return self->_wakeHour;
}

- (int64_t)wakeMinute
{
  return self->_wakeMinute;
}

- (int64_t)bedHour
{
  return self->_bedHour;
}

- (int64_t)bedMinute
{
  return self->_bedMinute;
}

- (int64_t)overrideDayIndex
{
  return self->_overrideDayIndex;
}

- (void).cxx_destruct
{
}

@end