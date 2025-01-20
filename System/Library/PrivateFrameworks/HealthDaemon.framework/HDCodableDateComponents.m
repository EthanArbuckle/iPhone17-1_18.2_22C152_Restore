@interface HDCodableDateComponents
- (BOOL)hasCalendar;
- (BOOL)hasDay;
- (BOOL)hasEra;
- (BOOL)hasHour;
- (BOOL)hasMinute;
- (BOOL)hasMonth;
- (BOOL)hasNanosecond;
- (BOOL)hasQuarter;
- (BOOL)hasSecond;
- (BOOL)hasTimeZone;
- (BOOL)hasWeekOfMonth;
- (BOOL)hasWeekOfYear;
- (BOOL)hasWeekday;
- (BOOL)hasWeekdayOrdinal;
- (BOOL)hasYear;
- (BOOL)hasYearForWeekOfYear;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)calendar;
- (NSString)timeZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)day;
- (int64_t)era;
- (int64_t)hour;
- (int64_t)minute;
- (int64_t)month;
- (int64_t)nanosecond;
- (int64_t)quarter;
- (int64_t)second;
- (int64_t)weekOfMonth;
- (int64_t)weekOfYear;
- (int64_t)weekday;
- (int64_t)weekdayOrdinal;
- (int64_t)year;
- (int64_t)yearForWeekOfYear;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCalendar:(id)a3;
- (void)setDay:(int64_t)a3;
- (void)setEra:(int64_t)a3;
- (void)setHasDay:(BOOL)a3;
- (void)setHasEra:(BOOL)a3;
- (void)setHasHour:(BOOL)a3;
- (void)setHasMinute:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasNanosecond:(BOOL)a3;
- (void)setHasQuarter:(BOOL)a3;
- (void)setHasSecond:(BOOL)a3;
- (void)setHasWeekOfMonth:(BOOL)a3;
- (void)setHasWeekOfYear:(BOOL)a3;
- (void)setHasWeekday:(BOOL)a3;
- (void)setHasWeekdayOrdinal:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setHasYearForWeekOfYear:(BOOL)a3;
- (void)setHour:(int64_t)a3;
- (void)setMinute:(int64_t)a3;
- (void)setMonth:(int64_t)a3;
- (void)setNanosecond:(int64_t)a3;
- (void)setQuarter:(int64_t)a3;
- (void)setSecond:(int64_t)a3;
- (void)setTimeZone:(id)a3;
- (void)setWeekOfMonth:(int64_t)a3;
- (void)setWeekOfYear:(int64_t)a3;
- (void)setWeekday:(int64_t)a3;
- (void)setWeekdayOrdinal:(int64_t)a3;
- (void)setYear:(int64_t)a3;
- (void)setYearForWeekOfYear:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HDCodableDateComponents

- (void)setEra:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_era = a3;
}

- (void)setHasEra:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasEra
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setYear:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_year = a3;
}

- (void)setHasYear:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasYear
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setMonth:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_month = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasMonth
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setDay:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_day = a3;
}

- (void)setHasDay:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasDay
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setHour:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hour = a3;
}

- (void)setHasHour:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHour
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMinute:(int64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_minute = a3;
}

- (void)setHasMinute:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasMinute
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSecond:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_second = a3;
}

- (void)setHasSecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasSecond
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWeekday:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_weekday = a3;
}

- (void)setHasWeekday:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWeekday
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setWeekdayOrdinal:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_weekdayOrdinal = a3;
}

- (void)setHasWeekdayOrdinal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasWeekdayOrdinal
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setQuarter:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_quarter = a3;
}

- (void)setHasQuarter:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasQuarter
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWeekOfMonth:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_weekOfMonth = a3;
}

- (void)setHasWeekOfMonth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasWeekOfMonth
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setWeekOfYear:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_weekOfYear = a3;
}

- (void)setHasWeekOfYear:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasWeekOfYear
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setYearForWeekOfYear:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_yearForWeekOfYear = a3;
}

- (void)setHasYearForWeekOfYear:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasYearForWeekOfYear
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setNanosecond:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_nanosecond = a3;
}

- (void)setHasNanosecond:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNanosecond
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasCalendar
{
  return self->_calendar != 0;
}

- (BOOL)hasTimeZone
{
  return self->_timeZone != 0;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HDCodableDateComponents;
  v4 = [(HDCodableDateComponents *)&v8 description];
  v5 = [(HDCodableDateComponents *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x1E4F1CA60] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v9 = [NSNumber numberWithLongLong:self->_era];
    [v3 setObject:v9 forKey:@"era"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v10 = [NSNumber numberWithLongLong:self->_year];
  [v3 setObject:v10 forKey:@"year"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v11 = [NSNumber numberWithLongLong:self->_month];
  [v3 setObject:v11 forKey:@"month"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v12 = [NSNumber numberWithLongLong:self->_day];
  [v3 setObject:v12 forKey:@"day"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  v13 = [NSNumber numberWithLongLong:self->_hour];
  [v3 setObject:v13 forKey:@"hour"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  v14 = [NSNumber numberWithLongLong:self->_minute];
  [v3 setObject:v14 forKey:@"minute"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v15 = [NSNumber numberWithLongLong:self->_second];
  [v3 setObject:v15 forKey:@"second"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  v16 = [NSNumber numberWithLongLong:self->_weekday];
  [v3 setObject:v16 forKey:@"weekday"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  v17 = [NSNumber numberWithLongLong:self->_weekdayOrdinal];
  [v3 setObject:v17 forKey:@"weekdayOrdinal"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  v18 = [NSNumber numberWithLongLong:self->_quarter];
  [v3 setObject:v18 forKey:@"quarter"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  v19 = [NSNumber numberWithLongLong:self->_weekOfMonth];
  [v3 setObject:v19 forKey:@"weekOfMonth"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  v20 = [NSNumber numberWithLongLong:self->_weekOfYear];
  [v3 setObject:v20 forKey:@"weekOfYear"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_35:
  v21 = [NSNumber numberWithLongLong:self->_yearForWeekOfYear];
  [v3 setObject:v21 forKey:@"yearForWeekOfYear"];

  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    v5 = [NSNumber numberWithLongLong:self->_nanosecond];
    [v3 setObject:v5 forKey:@"nanosecond"];
  }
LABEL_16:
  calendar = self->_calendar;
  if (calendar) {
    [v3 setObject:calendar forKey:@"calendar"];
  }
  timeZone = self->_timeZone;
  if (timeZone) {
    [v3 setObject:timeZone forKey:@"timeZone"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HDCodableDateComponentsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_16:
  if (self->_calendar)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_timeZone)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_era;
    *((_WORD *)v4 + 68) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_year;
  *((_WORD *)v4 + 68) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  v4[5] = self->_month;
  *((_WORD *)v4 + 68) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  v4[1] = self->_day;
  *((_WORD *)v4 + 68) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  v4[3] = self->_hour;
  *((_WORD *)v4 + 68) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[4] = self->_minute;
  *((_WORD *)v4 + 68) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  v4[8] = self->_second;
  *((_WORD *)v4 + 68) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  v4[11] = self->_weekday;
  *((_WORD *)v4 + 68) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  v4[12] = self->_weekdayOrdinal;
  *((_WORD *)v4 + 68) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  v4[7] = self->_quarter;
  *((_WORD *)v4 + 68) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  v4[9] = self->_weekOfMonth;
  *((_WORD *)v4 + 68) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  v4[10] = self->_weekOfYear;
  *((_WORD *)v4 + 68) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_35:
  v4[14] = self->_yearForWeekOfYear;
  *((_WORD *)v4 + 68) |= 0x2000u;
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
LABEL_15:
    v4[6] = self->_nanosecond;
    *((_WORD *)v4 + 68) |= 0x20u;
  }
LABEL_16:
  id v6 = v4;
  if (self->_calendar)
  {
    objc_msgSend(v4, "setCalendar:");
    id v4 = v6;
  }
  if (self->_timeZone)
  {
    objc_msgSend(v6, "setTimeZone:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_era;
    *(_WORD *)(v5 + 136) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x1000) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 104) = self->_year;
  *(_WORD *)(v5 + 136) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *(void *)(v5 + 40) = self->_month;
  *(_WORD *)(v5 + 136) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *(void *)(v5 + 8) = self->_day;
  *(_WORD *)(v5 + 136) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(void *)(v5 + 24) = self->_hour;
  *(_WORD *)(v5 + 136) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(void *)(v5 + 32) = self->_minute;
  *(_WORD *)(v5 + 136) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(void *)(v5 + 64) = self->_second;
  *(_WORD *)(v5 + 136) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_9:
    if ((has & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(void *)(v5 + 88) = self->_weekday;
  *(_WORD *)(v5 + 136) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(void *)(v5 + 96) = self->_weekdayOrdinal;
  *(_WORD *)(v5 + 136) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(void *)(v5 + 56) = self->_quarter;
  *(_WORD *)(v5 + 136) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(void *)(v5 + 72) = self->_weekOfMonth;
  *(_WORD *)(v5 + 136) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x2000) == 0) {
      goto LABEL_14;
    }
LABEL_29:
    *(void *)(v5 + 112) = self->_yearForWeekOfYear;
    *(_WORD *)(v5 + 136) |= 0x2000u;
    if ((*(_WORD *)&self->_has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_28:
  *(void *)(v5 + 80) = self->_weekOfYear;
  *(_WORD *)(v5 + 136) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) != 0) {
    goto LABEL_29;
  }
LABEL_14:
  if ((has & 0x20) != 0)
  {
LABEL_15:
    *(void *)(v5 + 48) = self->_nanosecond;
    *(_WORD *)(v5 + 136) |= 0x20u;
  }
LABEL_16:
  uint64_t v8 = [(NSString *)self->_calendar copyWithZone:a3];
  v9 = (void *)v6[15];
  v6[15] = v8;

  uint64_t v10 = [(NSString *)self->_timeZone copyWithZone:a3];
  v11 = (void *)v6[16];
  v6[16] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_76;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 68);
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_era != *((void *)v4 + 2)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 2) != 0)
  {
LABEL_76:
    char v9 = 0;
    goto LABEL_77;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x1000) == 0 || self->_year != *((void *)v4 + 13)) {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x1000) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_month != *((void *)v4 + 5)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_76;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_day != *((void *)v4 + 1)) {
      goto LABEL_76;
    }
  }
  else if (v6)
  {
    goto LABEL_76;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_hour != *((void *)v4 + 3)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_minute != *((void *)v4 + 4)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_second != *((void *)v4 + 8)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x400) == 0 || self->_weekday != *((void *)v4 + 11)) {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x400) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x800) == 0 || self->_weekdayOrdinal != *((void *)v4 + 12)) {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x800) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_quarter != *((void *)v4 + 7)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x100) == 0 || self->_weekOfMonth != *((void *)v4 + 9)) {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x100) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x200) == 0 || self->_weekOfYear != *((void *)v4 + 10)) {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x200) != 0)
  {
    goto LABEL_76;
  }
  if ((*(_WORD *)&self->_has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 68) & 0x2000) == 0 || self->_yearForWeekOfYear != *((void *)v4 + 14)) {
      goto LABEL_76;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x2000) != 0)
  {
    goto LABEL_76;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_nanosecond != *((void *)v4 + 6)) {
      goto LABEL_76;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_76;
  }
  calendar = self->_calendar;
  if ((unint64_t)calendar | *((void *)v4 + 15) && !-[NSString isEqual:](calendar, "isEqual:")) {
    goto LABEL_76;
  }
  timeZone = self->_timeZone;
  if ((unint64_t)timeZone | *((void *)v4 + 16)) {
    char v9 = -[NSString isEqual:](timeZone, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_77:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_era;
    if ((*(_WORD *)&self->_has & 0x1000) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_year;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_month;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_day;
    if ((has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_hour;
    if ((has & 8) != 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((has & 8) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_minute;
    if ((has & 0x80) != 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v9 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_second;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_weekday;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_weekdayOrdinal;
    if ((has & 0x40) != 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_11:
    uint64_t v13 = 2654435761 * self->_quarter;
    if ((has & 0x100) != 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_12:
    uint64_t v14 = 2654435761 * self->_weekOfMonth;
    if ((has & 0x200) != 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v14 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_13:
    uint64_t v15 = 2654435761 * self->_weekOfYear;
    if ((has & 0x2000) != 0) {
      goto LABEL_14;
    }
LABEL_28:
    uint64_t v16 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_15;
    }
LABEL_29:
    uint64_t v17 = 0;
    goto LABEL_30;
  }
LABEL_27:
  uint64_t v15 = 0;
  if ((has & 0x2000) == 0) {
    goto LABEL_28;
  }
LABEL_14:
  uint64_t v16 = 2654435761 * self->_yearForWeekOfYear;
  if ((has & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_15:
  uint64_t v17 = 2654435761 * self->_nanosecond;
LABEL_30:
  NSUInteger v18 = v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_calendar hash];
  return v18 ^ [(NSString *)self->_timeZone hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 2) != 0)
  {
    self->_era = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v5 = *((_WORD *)v4 + 68);
    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*((_WORD *)v4 + 68) & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  self->_year = *((void *)v4 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_month = *((void *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_day = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_hour = *((void *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_minute = *((void *)v4 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x400) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_second = *((void *)v4 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x400) == 0)
  {
LABEL_9:
    if ((v5 & 0x800) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_weekday = *((void *)v4 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x800) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_weekdayOrdinal = *((void *)v4 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_quarter = *((void *)v4 + 7);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x100) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_weekOfMonth = *((void *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_weekOfYear = *((void *)v4 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 68);
  if ((v5 & 0x2000) == 0)
  {
LABEL_14:
    if ((v5 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_35:
  self->_yearForWeekOfYear = *((void *)v4 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  if ((*((_WORD *)v4 + 68) & 0x20) != 0)
  {
LABEL_15:
    self->_nanosecond = *((void *)v4 + 6);
    *(_WORD *)&self->_has |= 0x20u;
  }
LABEL_16:
  id v6 = v4;
  if (*((void *)v4 + 15))
  {
    -[HDCodableDateComponents setCalendar:](self, "setCalendar:");
    id v4 = v6;
  }
  if (*((void *)v4 + 16))
  {
    -[HDCodableDateComponents setTimeZone:](self, "setTimeZone:");
    id v4 = v6;
  }
}

- (int64_t)era
{
  return self->_era;
}

- (int64_t)year
{
  return self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (int64_t)day
{
  return self->_day;
}

- (int64_t)hour
{
  return self->_hour;
}

- (int64_t)minute
{
  return self->_minute;
}

- (int64_t)second
{
  return self->_second;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (int64_t)weekdayOrdinal
{
  return self->_weekdayOrdinal;
}

- (int64_t)quarter
{
  return self->_quarter;
}

- (int64_t)weekOfMonth
{
  return self->_weekOfMonth;
}

- (int64_t)weekOfYear
{
  return self->_weekOfYear;
}

- (int64_t)yearForWeekOfYear
{
  return self->_yearForWeekOfYear;
}

- (int64_t)nanosecond
{
  return self->_nanosecond;
}

- (NSString)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end