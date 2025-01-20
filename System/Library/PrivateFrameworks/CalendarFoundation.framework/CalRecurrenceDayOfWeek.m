@interface CalRecurrenceDayOfWeek
+ (id)dayOfWeek:(int64_t)a3;
+ (id)dayOfWeek:(int64_t)a3 weekNumber:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (CalRecurrenceDayOfWeek)initWithCoder:(id)a3;
- (CalRecurrenceDayOfWeek)initWithDayOfTheWeek:(int64_t)a3 weekNumber:(int64_t)a4;
- (id)description;
- (id)iCalendarDescription;
- (id)iCalendarValueFromDayOfTheWeek:(unint64_t)a3;
- (int64_t)dayOfTheWeek;
- (int64_t)weekNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CalRecurrenceDayOfWeek

+ (id)dayOfWeek:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDayOfTheWeek:a3 weekNumber:0];

  return v3;
}

+ (id)dayOfWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDayOfTheWeek:a3 weekNumber:a4];

  return v4;
}

- (CalRecurrenceDayOfWeek)initWithDayOfTheWeek:(int64_t)a3 weekNumber:(int64_t)a4
{
  if ((unint64_t)(a3 - 8) <= 0xFFFFFFFFFFFFFFF8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid day number"];
  }
  v8.receiver = self;
  v8.super_class = (Class)CalRecurrenceDayOfWeek;
  result = [(CalRecurrenceDayOfWeek *)&v8 init];
  if (result)
  {
    result->_dayOfTheWeek = a3;
    result->_weekNumber = a4;
  }
  return result;
}

- (CalRecurrenceDayOfWeek)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CalRecurrenceDayOfWeek;
  v5 = [(CalRecurrenceDayOfWeek *)&v7 init];
  if (v5)
  {
    v5->_dayOfTheWeek = [v4 decodeIntegerForKey:@"dayOfTheWeek"];
    v5->_weekNumber = [v4 decodeIntegerForKey:@"weekNumber"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t dayOfTheWeek = self->_dayOfTheWeek;
  id v5 = a3;
  [v5 encodeInteger:dayOfTheWeek forKey:@"dayOfTheWeek"];
  [v5 encodeInteger:self->_weekNumber forKey:@"weekNumber"];
}

- (id)iCalendarValueFromDayOfTheWeek:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return &stru_1EE0C39E0;
  }
  else {
    return off_1E56CE588[a3 - 1];
  }
}

- (id)iCalendarDescription
{
  int64_t weekNumber = self->_weekNumber;
  if (weekNumber)
  {
    v3 = NSString;
    id v4 = [(CalRecurrenceDayOfWeek *)self iCalendarValueFromDayOfTheWeek:self->_dayOfTheWeek];
    id v5 = [v3 stringWithFormat:@"%ld%@", weekNumber, v4];
  }
  else
  {
    id v5 = [(CalRecurrenceDayOfWeek *)self iCalendarValueFromDayOfTheWeek:self->_dayOfTheWeek];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(CalRecurrenceDayOfWeek *)self iCalendarDescription];
  v6 = [v3 stringWithFormat:@"%@ <%p> { %@ }", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  int64_t v3 = [(CalRecurrenceDayOfWeek *)self dayOfTheWeek];
  return [(CalRecurrenceDayOfWeek *)self weekNumber] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CalRecurrenceDayOfWeek *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      int64_t v6 = [(CalRecurrenceDayOfWeek *)self dayOfTheWeek];
      if (v6 == [(CalRecurrenceDayOfWeek *)v5 dayOfTheWeek])
      {
        int64_t v7 = [(CalRecurrenceDayOfWeek *)self weekNumber];
        BOOL v8 = v7 == [(CalRecurrenceDayOfWeek *)v5 weekNumber];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (int64_t)dayOfTheWeek
{
  return self->_dayOfTheWeek;
}

- (int64_t)weekNumber
{
  return self->_weekNumber;
}

@end