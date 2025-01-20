@interface _INPBRecurrenceValue
+ (BOOL)supportsSecureCoding;
- (BOOL)hasFrequency;
- (BOOL)hasInterval;
- (BOOL)hasOrdinal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_INPBRecurrenceValue)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)frequencyAsString:(int)a3;
- (id)weeklyRecurrenceDaysAsString:(int)a3;
- (int)StringAsFrequency:(id)a3;
- (int)StringAsWeeklyRecurrenceDays:(id)a3;
- (int)frequency;
- (int)weeklyRecurrenceDays;
- (int)weeklyRecurrenceDaysAtIndex:(unint64_t)a3;
- (int64_t)ordinal;
- (unint64_t)hash;
- (unint64_t)interval;
- (unint64_t)weeklyRecurrenceDaysCount;
- (void)addWeeklyRecurrenceDays:(int)a3;
- (void)clearWeeklyRecurrenceDays;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setFrequency:(int)a3;
- (void)setHasFrequency:(BOOL)a3;
- (void)setHasInterval:(BOOL)a3;
- (void)setHasOrdinal:(BOOL)a3;
- (void)setInterval:(unint64_t)a3;
- (void)setOrdinal:(int64_t)a3;
- (void)setWeeklyRecurrenceDays:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation _INPBRecurrenceValue

- (int64_t)ordinal
{
  return self->_ordinal;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (int)frequency
{
  return self->_frequency;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(_INPBRecurrenceValue *)self hasFrequency])
  {
    uint64_t v4 = [(_INPBRecurrenceValue *)self frequency];
    if ((int)v4 <= 49)
    {
      switch(v4)
      {
        case 0:
          v5 = @"UNKNOWN";
          goto LABEL_19;
        case 0x1E:
          v5 = @"MINUTE";
          goto LABEL_19;
        case 0x28:
          v5 = @"HOURLY";
          goto LABEL_19;
      }
    }
    else if ((int)v4 > 79)
    {
      if (v4 == 80)
      {
        v5 = @"MONTHLY";
        goto LABEL_19;
      }
      if (v4 == 110)
      {
        v5 = @"YEARLY";
        goto LABEL_19;
      }
    }
    else
    {
      if (v4 == 50)
      {
        v5 = @"DAILY";
        goto LABEL_19;
      }
      if (v4 == 60)
      {
        v5 = @"WEEKLY";
LABEL_19:
        [v3 setObject:v5 forKeyedSubscript:@"frequency"];

        goto LABEL_20;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
LABEL_20:
  if ([(_INPBRecurrenceValue *)self hasInterval])
  {
    v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[_INPBRecurrenceValue interval](self, "interval"));
    [v3 setObject:v6 forKeyedSubscript:@"interval"];
  }
  if ([(_INPBRecurrenceValue *)self hasOrdinal])
  {
    v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[_INPBRecurrenceValue ordinal](self, "ordinal"));
    [v3 setObject:v7 forKeyedSubscript:@"ordinal"];
  }
  if (self->_weeklyRecurrenceDays.count)
  {
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[_INPBRecurrenceValue weeklyRecurrenceDaysCount](self, "weeklyRecurrenceDaysCount"));
    if ([(_INPBRecurrenceValue *)self weeklyRecurrenceDaysCount])
    {
      unint64_t v9 = 0;
      do
      {
        uint64_t v10 = self->_weeklyRecurrenceDays.list[v9];
        if (v10 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_weeklyRecurrenceDays.list[v9]);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = off_1E551A330[v10];
        }
        [v8 addObject:v11];

        ++v9;
      }
      while (v9 < [(_INPBRecurrenceValue *)self weeklyRecurrenceDaysCount]);
    }
    [v3 setObject:v8 forKeyedSubscript:@"weeklyRecurrenceDays"];
  }

  return v3;
}

- (unint64_t)hash
{
  if ([(_INPBRecurrenceValue *)self hasFrequency]) {
    uint64_t v3 = 2654435761 * self->_frequency;
  }
  else {
    uint64_t v3 = 0;
  }
  if ([(_INPBRecurrenceValue *)self hasInterval]) {
    unint64_t v4 = 2654435761u * self->_interval;
  }
  else {
    unint64_t v4 = 0;
  }
  if ([(_INPBRecurrenceValue *)self hasOrdinal]) {
    uint64_t v5 = 2654435761 * self->_ordinal;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ PBRepeatedInt32Hash();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (int v5 = [(_INPBRecurrenceValue *)self hasFrequency],
        v5 == [v4 hasFrequency])
    && (![(_INPBRecurrenceValue *)self hasFrequency]
     || ![v4 hasFrequency]
     || (int frequency = self->_frequency, frequency == [v4 frequency]))
    && (int v7 = [(_INPBRecurrenceValue *)self hasInterval],
        v7 == [v4 hasInterval])
    && (![(_INPBRecurrenceValue *)self hasInterval]
     || ![v4 hasInterval]
     || (unint64_t interval = self->_interval, interval == [v4 interval]))
    && (int v9 = -[_INPBRecurrenceValue hasOrdinal](self, "hasOrdinal"), v9 == [v4 hasOrdinal])
    && (![(_INPBRecurrenceValue *)self hasOrdinal]
     || ![v4 hasOrdinal]
     || (int64_t ordinal = self->_ordinal, ordinal == [v4 ordinal])))
  {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[_INPBRecurrenceValue allocWithZone:a3] init];
  if ([(_INPBRecurrenceValue *)self hasFrequency]) {
    [(_INPBRecurrenceValue *)v4 setFrequency:[(_INPBRecurrenceValue *)self frequency]];
  }
  if ([(_INPBRecurrenceValue *)self hasInterval]) {
    [(_INPBRecurrenceValue *)v4 setInterval:[(_INPBRecurrenceValue *)self interval]];
  }
  if ([(_INPBRecurrenceValue *)self hasOrdinal]) {
    [(_INPBRecurrenceValue *)v4 setOrdinal:[(_INPBRecurrenceValue *)self ordinal]];
  }
  PBRepeatedInt32Copy();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBRecurrenceValue *)self data];
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBRecurrenceValue)initWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBRecurrenceValue *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBRecurrenceValue *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBRecurrenceValue *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)dealloc
{
  [(_INPBRecurrenceValue *)self clearWeeklyRecurrenceDays];
  v3.receiver = self;
  v3.super_class = (Class)_INPBRecurrenceValue;
  [(_INPBRecurrenceValue *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if ([(_INPBRecurrenceValue *)self hasFrequency]) {
    PBDataWriterWriteInt32Field();
  }
  if ([(_INPBRecurrenceValue *)self hasInterval]) {
    PBDataWriterWriteUint64Field();
  }
  if ([(_INPBRecurrenceValue *)self hasOrdinal]) {
    PBDataWriterWriteInt64Field();
  }
  p_weeklyRecurrenceDays = &self->_weeklyRecurrenceDays;
  int v5 = v7;
  if (p_weeklyRecurrenceDays->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      int v5 = v7;
      ++v6;
    }
    while (v6 < p_weeklyRecurrenceDays->count);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBRecurrenceValueReadFrom(self, (uint64_t)a3);
}

- (int)StringAsWeeklyRecurrenceDays:(id)a3
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

- (id)weeklyRecurrenceDaysAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E551A330[a3];
  }

  return v3;
}

- (int)weeklyRecurrenceDaysAtIndex:(unint64_t)a3
{
  return self->_weeklyRecurrenceDays.list[a3];
}

- (unint64_t)weeklyRecurrenceDaysCount
{
  return self->_weeklyRecurrenceDays.count;
}

- (void)addWeeklyRecurrenceDays:(int)a3
{
  if (a3 != 0x7FFFFFFF) {
    PBRepeatedInt32Add();
  }
}

- (void)clearWeeklyRecurrenceDays
{
}

- (int)weeklyRecurrenceDays
{
  return self->_weeklyRecurrenceDays.list;
}

- (void)setWeeklyRecurrenceDays:(int *)a3 count:(unint64_t)a4
{
}

- (void)setHasOrdinal:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOrdinal
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setOrdinal:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int64_t ordinal = a3;
}

- (void)setHasInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInterval:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t interval = a3;
}

- (int)StringAsFrequency:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"MINUTE"])
  {
    int v4 = 30;
  }
  else if ([v3 isEqualToString:@"HOURLY"])
  {
    int v4 = 40;
  }
  else if ([v3 isEqualToString:@"DAILY"])
  {
    int v4 = 50;
  }
  else if ([v3 isEqualToString:@"WEEKLY"])
  {
    int v4 = 60;
  }
  else if ([v3 isEqualToString:@"MONTHLY"])
  {
    int v4 = 80;
  }
  else if ([v3 isEqualToString:@"YEARLY"])
  {
    int v4 = 110;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)frequencyAsString:(int)a3
{
  if (a3 <= 49)
  {
    switch(a3)
    {
      case 0:
        int v4 = @"UNKNOWN";
        return v4;
      case 30:
        int v4 = @"MINUTE";
        return v4;
      case 40:
        int v4 = @"HOURLY";
        return v4;
    }
LABEL_28:
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v4;
  }
  if (a3 > 79)
  {
    if (a3 == 80)
    {
      int v4 = @"MONTHLY";
      return v4;
    }
    if (a3 == 110)
    {
      int v4 = @"YEARLY";
      return v4;
    }
    goto LABEL_28;
  }
  if (a3 != 50)
  {
    if (a3 == 60)
    {
      int v4 = @"WEEKLY";
      return v4;
    }
    goto LABEL_28;
  }
  int v4 = @"DAILY";
  return v4;
}

- (void)setHasFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFrequency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setFrequency:(int)a3
{
  char has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(unsigned char *)&self->_char has = has & 0xFE;
  }
  else
  {
    *(unsigned char *)&self->_char has = has | 1;
    self->_int frequency = a3;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end