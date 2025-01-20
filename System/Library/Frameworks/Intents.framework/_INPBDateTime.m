@interface _INPBDateTime
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCalendarSystem;
- (BOOL)hasDate;
- (BOOL)hasTime;
- (BOOL)hasTimeZoneID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)timeZoneID;
- (_INPBDateTime)initWithCoder:(id)a3;
- (_INPBLocalDate)date;
- (_INPBLocalTime)time;
- (id)calendarSystemAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (int)StringAsCalendarSystem:(id)a3;
- (int)calendarSystem;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCalendarSystem:(int)a3;
- (void)setDate:(id)a3;
- (void)setHasCalendarSystem:(BOOL)a3;
- (void)setTime:(id)a3;
- (void)setTimeZoneID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBDateTime

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneID, 0);
  objc_storeStrong((id *)&self->_time, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

- (NSString)timeZoneID
{
  return self->_timeZoneID;
}

- (_INPBLocalTime)time
{
  return self->_time;
}

- (_INPBLocalDate)date
{
  return self->_date;
}

- (int)calendarSystem
{
  return self->_calendarSystem;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBDateTime *)self hasCalendarSystem])
  {
    uint64_t v4 = [(_INPBDateTime *)self calendarSystem];
    if ((v4 - 1) >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E5519908[(v4 - 1)];
    }
    [v3 setObject:v5 forKeyedSubscript:@"calendarSystem"];
  }
  v6 = [(_INPBDateTime *)self date];
  v7 = [v6 dictionaryRepresentation];
  [v3 setObject:v7 forKeyedSubscript:@"date"];

  v8 = [(_INPBDateTime *)self time];
  v9 = [v8 dictionaryRepresentation];
  [v3 setObject:v9 forKeyedSubscript:@"time"];

  if (self->_timeZoneID)
  {
    v10 = [(_INPBDateTime *)self timeZoneID];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"timeZoneID"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBDateTime *)self hasCalendarSystem]) {
    uint64_t v3 = 2654435761 * self->_calendarSystem;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(_INPBLocalDate *)self->_date hash] ^ v3;
  unint64_t v5 = [(_INPBLocalTime *)self->_time hash];
  return v4 ^ v5 ^ [(NSString *)self->_timeZoneID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_21;
  }
  int v5 = [(_INPBDateTime *)self hasCalendarSystem];
  if (v5 != [v4 hasCalendarSystem]) {
    goto LABEL_21;
  }
  if ([(_INPBDateTime *)self hasCalendarSystem])
  {
    if ([v4 hasCalendarSystem])
    {
      int calendarSystem = self->_calendarSystem;
      if (calendarSystem != [v4 calendarSystem]) {
        goto LABEL_21;
      }
    }
  }
  v7 = [(_INPBDateTime *)self date];
  v8 = [v4 date];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v9 = [(_INPBDateTime *)self date];
  if (v9)
  {
    v10 = (void *)v9;
    v11 = [(_INPBDateTime *)self date];
    v12 = [v4 date];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBDateTime *)self time];
  v8 = [v4 time];
  if ((v7 == 0) == (v8 != 0)) {
    goto LABEL_20;
  }
  uint64_t v14 = [(_INPBDateTime *)self time];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = [(_INPBDateTime *)self time];
    v17 = [v4 time];
    int v18 = [v16 isEqual:v17];

    if (!v18) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  v7 = [(_INPBDateTime *)self timeZoneID];
  v8 = [v4 timeZoneID];
  if ((v7 == 0) != (v8 != 0))
  {
    uint64_t v19 = [(_INPBDateTime *)self timeZoneID];
    if (!v19)
    {

LABEL_24:
      BOOL v24 = 1;
      goto LABEL_22;
    }
    v20 = (void *)v19;
    v21 = [(_INPBDateTime *)self timeZoneID];
    v22 = [v4 timeZoneID];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_24;
    }
  }
  else
  {
LABEL_20:
  }
LABEL_21:
  BOOL v24 = 0;
LABEL_22:

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v5 = [+[_INPBDateTime allocWithZone:](_INPBDateTime, "allocWithZone:") init];
  if ([(_INPBDateTime *)self hasCalendarSystem]) {
    [(_INPBDateTime *)v5 setCalendarSystem:[(_INPBDateTime *)self calendarSystem]];
  }
  id v6 = [(_INPBLocalDate *)self->_date copyWithZone:a3];
  [(_INPBDateTime *)v5 setDate:v6];

  id v7 = [(_INPBLocalTime *)self->_time copyWithZone:a3];
  [(_INPBDateTime *)v5 setTime:v7];

  v8 = (void *)[(NSString *)self->_timeZoneID copyWithZone:a3];
  [(_INPBDateTime *)v5 setTimeZoneID:v8];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBDateTime *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBDateTime)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBDateTime *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBDateTime *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBDateTime *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v10 = a3;
  if ([(_INPBDateTime *)self hasCalendarSystem]) {
    PBDataWriterWriteInt32Field();
  }
  id v4 = [(_INPBDateTime *)self date];

  if (v4)
  {
    int v5 = [(_INPBDateTime *)self date];
    PBDataWriterWriteSubmessage();
  }
  id v6 = [(_INPBDateTime *)self time];

  if (v6)
  {
    uint64_t v7 = [(_INPBDateTime *)self time];
    PBDataWriterWriteSubmessage();
  }
  v8 = [(_INPBDateTime *)self timeZoneID];

  uint64_t v9 = v10;
  if (v8)
  {
    PBDataWriterWriteStringField();
    uint64_t v9 = v10;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDateTimeReadFrom(self, (uint64_t)a3);
}

- (BOOL)hasTimeZoneID
{
  return self->_timeZoneID != 0;
}

- (void)setTimeZoneID:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  timeZoneID = self->_timeZoneID;
  self->_timeZoneID = v4;

  MEMORY[0x1F41817F8](v4, timeZoneID);
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setTime:(id)a3
{
}

- (BOOL)hasDate
{
  return self->_date != 0;
}

- (void)setDate:(id)a3
{
}

- (int)StringAsCalendarSystem:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BUDDHIST"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CHINESE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"HEBREW"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"HIJRI"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"HINDU"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"ISLAMIC_UMALQURA"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"ISLAMIC"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"GREGORIAN"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"JAPANESE"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"JULIAN"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"PERSIAN"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"REPUBLIC_OF_CHINA"])
  {
    int v4 = 12;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (id)calendarSystemAsString:(int)a3
{
  if ((a3 - 1) >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E5519908[a3 - 1];
  }

  return v3;
}

- (void)setHasCalendarSystem:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCalendarSystem
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCalendarSystem:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int calendarSystem = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end