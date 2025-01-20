@interface _INPBLocalTime
+ (BOOL)supportsSecureCoding;
- (BOOL)hasHourOfDay;
- (BOOL)hasMillisOfSecond;
- (BOOL)hasMinuteOfHour;
- (BOOL)hasSecondOfMinute;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBLocalTime)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int64_t)hourOfDay;
- (int64_t)millisOfSecond;
- (int64_t)minuteOfHour;
- (int64_t)secondOfMinute;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHasHourOfDay:(BOOL)a3;
- (void)setHasMillisOfSecond:(BOOL)a3;
- (void)setHasMinuteOfHour:(BOOL)a3;
- (void)setHasSecondOfMinute:(BOOL)a3;
- (void)setHourOfDay:(int64_t)a3;
- (void)setMillisOfSecond:(int64_t)a3;
- (void)setMinuteOfHour:(int64_t)a3;
- (void)setSecondOfMinute:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLocalTime

- (int64_t)secondOfMinute
{
  return self->_secondOfMinute;
}

- (int64_t)minuteOfHour
{
  return self->_minuteOfHour;
}

- (int64_t)millisOfSecond
{
  return self->_millisOfSecond;
}

- (int64_t)hourOfDay
{
  return self->_hourOfDay;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBLocalTime *)self hasHourOfDay])
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalTime hourOfDay](self, "hourOfDay"));
    [v3 setObject:v4 forKeyedSubscript:@"hourOfDay"];
  }
  if ([(_INPBLocalTime *)self hasMillisOfSecond])
  {
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalTime millisOfSecond](self, "millisOfSecond"));
    [v3 setObject:v5 forKeyedSubscript:@"millisOfSecond"];
  }
  if ([(_INPBLocalTime *)self hasMinuteOfHour])
  {
    v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalTime minuteOfHour](self, "minuteOfHour"));
    [v3 setObject:v6 forKeyedSubscript:@"minuteOfHour"];
  }
  if ([(_INPBLocalTime *)self hasSecondOfMinute])
  {
    v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalTime secondOfMinute](self, "secondOfMinute"));
    [v3 setObject:v7 forKeyedSubscript:@"secondOfMinute"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBLocalTime *)self hasHourOfDay]) {
    uint64_t v3 = 2654435761 * self->_hourOfDay;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBLocalTime *)self hasMillisOfSecond]) {
    uint64_t v4 = 2654435761 * self->_millisOfSecond;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBLocalTime *)self hasMinuteOfHour]) {
    uint64_t v5 = 2654435761 * self->_minuteOfHour;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBLocalTime *)self hasSecondOfMinute]) {
    uint64_t v6 = 2654435761 * self->_secondOfMinute;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  int v5 = [(_INPBLocalTime *)self hasHourOfDay];
  if (v5 != [v4 hasHourOfDay]) {
    goto LABEL_15;
  }
  if ([(_INPBLocalTime *)self hasHourOfDay])
  {
    if ([v4 hasHourOfDay])
    {
      int64_t hourOfDay = self->_hourOfDay;
      if (hourOfDay != [v4 hourOfDay]) {
        goto LABEL_15;
      }
    }
  }
  if ((int v7 = [(_INPBLocalTime *)self hasMillisOfSecond],
        v7 == [v4 hasMillisOfSecond])
    && (![(_INPBLocalTime *)self hasMillisOfSecond]
     || ![v4 hasMillisOfSecond]
     || (int64_t millisOfSecond = self->_millisOfSecond, millisOfSecond == [v4 millisOfSecond]))
    && (int v9 = [(_INPBLocalTime *)self hasMinuteOfHour],
        v9 == [v4 hasMinuteOfHour])
    && (![(_INPBLocalTime *)self hasMinuteOfHour]
     || ![v4 hasMinuteOfHour]
     || (int64_t minuteOfHour = self->_minuteOfHour, minuteOfHour == [v4 minuteOfHour]))
    && (int v11 = [(_INPBLocalTime *)self hasSecondOfMinute],
        v11 == [v4 hasSecondOfMinute])
    && (![(_INPBLocalTime *)self hasSecondOfMinute]
     || ![v4 hasSecondOfMinute]
     || (int64_t secondOfMinute = self->_secondOfMinute, secondOfMinute == [v4 secondOfMinute])))
  {
    BOOL v12 = 1;
  }
  else
  {
LABEL_15:
    BOOL v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBLocalTime allocWithZone:a3] init];
  if ([(_INPBLocalTime *)self hasHourOfDay]) {
    [(_INPBLocalTime *)v4 setHourOfDay:[(_INPBLocalTime *)self hourOfDay]];
  }
  if ([(_INPBLocalTime *)self hasMillisOfSecond]) {
    [(_INPBLocalTime *)v4 setMillisOfSecond:[(_INPBLocalTime *)self millisOfSecond]];
  }
  if ([(_INPBLocalTime *)self hasMinuteOfHour]) {
    [(_INPBLocalTime *)v4 setMinuteOfHour:[(_INPBLocalTime *)self minuteOfHour]];
  }
  if ([(_INPBLocalTime *)self hasSecondOfMinute]) {
    [(_INPBLocalTime *)v4 setSecondOfMinute:[(_INPBLocalTime *)self secondOfMinute]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLocalTime *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLocalTime)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLocalTime *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLocalTime *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLocalTime *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBLocalTime *)self hasHourOfDay]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_INPBLocalTime *)self hasMillisOfSecond]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_INPBLocalTime *)self hasMinuteOfHour]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_INPBLocalTime *)self hasSecondOfMinute]) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLocalTimeReadFrom(self, (uint64_t)a3);
}

- (void)setHasSecondOfMinute:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSecondOfMinute
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSecondOfMinute:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int64_t secondOfMinute = a3;
}

- (void)setHasMinuteOfHour:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMinuteOfHour
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMinuteOfHour:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t minuteOfHour = a3;
}

- (void)setHasMillisOfSecond:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMillisOfSecond
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setMillisOfSecond:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64_t millisOfSecond = a3;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHourOfDay
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHourOfDay:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t hourOfDay = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end