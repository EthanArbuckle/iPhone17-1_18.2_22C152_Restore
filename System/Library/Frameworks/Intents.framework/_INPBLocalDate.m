@interface _INPBLocalDate
+ (BOOL)supportsSecureCoding;
- (BOOL)hasDayOfMonth;
- (BOOL)hasDayOfWeek;
- (BOOL)hasMonth;
- (BOOL)hasYear;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBLocalDate)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dayOfWeekAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsDayOfWeek:(id)a3;
- (int)dayOfWeek;
- (int64_t)dayOfMonth;
- (int64_t)month;
- (int64_t)year;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDayOfMonth:(int64_t)a3;
- (void)setDayOfWeek:(int)a3;
- (void)setHasDayOfMonth:(BOOL)a3;
- (void)setHasDayOfWeek:(BOOL)a3;
- (void)setHasMonth:(BOOL)a3;
- (void)setHasYear:(BOOL)a3;
- (void)setMonth:(int64_t)a3;
- (void)setYear:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBLocalDate

- (int64_t)year
{
  return self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (int)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int64_t)dayOfMonth
{
  return self->_dayOfMonth;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBLocalDate *)self hasDayOfMonth])
  {
    v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalDate dayOfMonth](self, "dayOfMonth"));
    [v3 setObject:v4 forKeyedSubscript:@"dayOfMonth"];
  }
  if ([(_INPBLocalDate *)self hasDayOfWeek])
  {
    uint64_t v5 = [(_INPBLocalDate *)self dayOfWeek];
    if (v5 >= 8)
    {
      v6 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
    }
    else
    {
      v6 = *(&off_1E5519DA0 + v5);
    }
    [v3 setObject:v6 forKeyedSubscript:@"dayOfWeek"];
  }
  if ([(_INPBLocalDate *)self hasMonth])
  {
    v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalDate month](self, "month"));
    [v3 setObject:v7 forKeyedSubscript:@"month"];
  }
  if ([(_INPBLocalDate *)self hasYear])
  {
    v8 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBLocalDate year](self, "year"));
    [v3 setObject:v8 forKeyedSubscript:@"year"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBLocalDate *)self hasDayOfMonth]) {
    uint64_t v3 = 2654435761 * self->_dayOfMonth;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBLocalDate *)self hasDayOfWeek]) {
    uint64_t v4 = 2654435761 * self->_dayOfWeek;
  }
  else {
    uint64_t v4 = 0;
  }
  if ([(_INPBLocalDate *)self hasMonth]) {
    uint64_t v5 = 2654435761 * self->_month;
  }
  else {
    uint64_t v5 = 0;
  }
  if ([(_INPBLocalDate *)self hasYear]) {
    uint64_t v6 = 2654435761 * self->_year;
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
  int v5 = [(_INPBLocalDate *)self hasDayOfMonth];
  if (v5 != [v4 hasDayOfMonth]) {
    goto LABEL_15;
  }
  if ([(_INPBLocalDate *)self hasDayOfMonth])
  {
    if ([v4 hasDayOfMonth])
    {
      int64_t dayOfMonth = self->_dayOfMonth;
      if (dayOfMonth != [v4 dayOfMonth]) {
        goto LABEL_15;
      }
    }
  }
  if ((int v7 = -[_INPBLocalDate hasDayOfWeek](self, "hasDayOfWeek"), v7 == [v4 hasDayOfWeek])
    && (![(_INPBLocalDate *)self hasDayOfWeek]
     || ![v4 hasDayOfWeek]
     || (int dayOfWeek = self->_dayOfWeek, dayOfWeek == [v4 dayOfWeek]))
    && (int v9 = -[_INPBLocalDate hasMonth](self, "hasMonth"), v9 == [v4 hasMonth])
    && (![(_INPBLocalDate *)self hasMonth]
     || ![v4 hasMonth]
     || (int64_t month = self->_month, month == [v4 month]))
    && (int v11 = -[_INPBLocalDate hasYear](self, "hasYear"), v11 == [v4 hasYear])
    && (![(_INPBLocalDate *)self hasYear]
     || ![v4 hasYear]
     || (int64_t year = self->_year, year == [v4 year])))
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
  id v4 = [+[_INPBLocalDate allocWithZone:a3] init];
  if ([(_INPBLocalDate *)self hasDayOfMonth]) {
    [(_INPBLocalDate *)v4 setDayOfMonth:[(_INPBLocalDate *)self dayOfMonth]];
  }
  if ([(_INPBLocalDate *)self hasDayOfWeek]) {
    [(_INPBLocalDate *)v4 setDayOfWeek:[(_INPBLocalDate *)self dayOfWeek]];
  }
  if ([(_INPBLocalDate *)self hasMonth]) {
    [(_INPBLocalDate *)v4 setMonth:[(_INPBLocalDate *)self month]];
  }
  if ([(_INPBLocalDate *)self hasYear]) {
    [(_INPBLocalDate *)v4 setYear:[(_INPBLocalDate *)self year]];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBLocalDate *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBLocalDate)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBLocalDate *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBLocalDate *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBLocalDate *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ([(_INPBLocalDate *)self hasDayOfMonth]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_INPBLocalDate *)self hasDayOfWeek]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBLocalDate *)self hasMonth]) {
    PBDataWriterWriteInt64Field();
  }
  if ([(_INPBLocalDate *)self hasYear]) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBLocalDateReadFrom(self, (uint64_t)a3);
}

- (void)setHasYear:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasYear
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setYear:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int64_t year = a3;
}

- (void)setHasMonth:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasMonth
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setMonth:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t month = a3;
}

- (int)StringAsDayOfWeek:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MONDAY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TUESDAY"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"WEDNESDAY"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"THURSDAY"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"FRIDAY"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"SATURDAY"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SUNDAY"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dayOfWeekAsString:(int)a3
{
  if (a3 >= 8)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E5519DA0 + a3);
  }

  return v3;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDayOfWeek
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDayOfWeek:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFD;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 2;
    self->_int dayOfWeek = a3;
  }
}

- (void)setHasDayOfMonth:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDayOfMonth
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDayOfMonth:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t dayOfMonth = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end