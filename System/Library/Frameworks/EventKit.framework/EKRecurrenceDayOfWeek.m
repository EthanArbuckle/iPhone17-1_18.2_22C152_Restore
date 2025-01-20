@interface EKRecurrenceDayOfWeek
+ (BOOL)supportsSecureCoding;
+ (EKRecurrenceDayOfWeek)dayOfWeek:(EKWeekday)dayOfTheWeek;
+ (EKRecurrenceDayOfWeek)dayOfWeek:(EKWeekday)dayOfTheWeek weekNumber:(NSInteger)weekNumber;
+ (id)iCalendarValueFromDayOfTheWeek:(int64_t)a3;
+ (int64_t)icsWeekDayFromDayOfTheWeek:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (EKRecurrenceDayOfWeek)initWithCoder:(id)a3;
- (EKWeekday)dayOfTheWeek;
- (NSInteger)weekNumber;
- (id)description;
- (id)iCalendarDescription;
- (id)initWithDayOfTheWeek:(EKWeekday)dayOfTheWeek weekNumber:(NSInteger)weekNumber;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKRecurrenceDayOfWeek

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (EKRecurrenceDayOfWeek)dayOfWeek:(EKWeekday)dayOfTheWeek
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDayOfTheWeek:dayOfTheWeek weekNumber:0];

  return (EKRecurrenceDayOfWeek *)v3;
}

+ (EKRecurrenceDayOfWeek)dayOfWeek:(EKWeekday)dayOfTheWeek weekNumber:(NSInteger)weekNumber
{
  v4 = (void *)[objc_alloc((Class)a1) initWithDayOfTheWeek:dayOfTheWeek weekNumber:weekNumber];

  return (EKRecurrenceDayOfWeek *)v4;
}

- (id)initWithDayOfTheWeek:(EKWeekday)dayOfTheWeek weekNumber:(NSInteger)weekNumber
{
  if ((unint64_t)(dayOfTheWeek - 8) <= 0xFFFFFFFFFFFFFFF8) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Invalid day number"];
  }
  v8.receiver = self;
  v8.super_class = (Class)EKRecurrenceDayOfWeek;
  id result = [(EKRecurrenceDayOfWeek *)&v8 init];
  if (result)
  {
    *((void *)result + 1) = dayOfTheWeek;
    *((void *)result + 2) = weekNumber;
  }
  return result;
}

- (EKRecurrenceDayOfWeek)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EKRecurrenceDayOfWeek;
  v5 = [(EKRecurrenceDayOfWeek *)&v7 init];
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

+ (id)iCalendarValueFromDayOfTheWeek:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return &stru_1EF932508;
  }
  else {
    return off_1E5B99108[a3 - 1];
  }
}

+ (int64_t)icsWeekDayFromDayOfTheWeek:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 6) {
    return 1;
  }
  else {
    return a3;
  }
}

- (id)iCalendarDescription
{
  int64_t weekNumber = self->_weekNumber;
  if (weekNumber)
  {
    v3 = NSString;
    id v4 = [(id)objc_opt_class() iCalendarValueFromDayOfTheWeek:self->_dayOfTheWeek];
    id v5 = [v3 stringWithFormat:@"%ld%@", weekNumber, v4];
  }
  else
  {
    id v5 = [(id)objc_opt_class() iCalendarValueFromDayOfTheWeek:self->_dayOfTheWeek];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(EKRecurrenceDayOfWeek *)self iCalendarDescription];
  v6 = [v3 stringWithFormat:@"%@ <%p> { %@ }", v4, self, v5];

  return v6;
}

- (unint64_t)hash
{
  EKWeekday v3 = [(EKRecurrenceDayOfWeek *)self dayOfTheWeek];
  return [(EKRecurrenceDayOfWeek *)self weekNumber] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (EKRecurrenceDayOfWeek *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (EKWeekday v6 = [(EKRecurrenceDayOfWeek *)self dayOfTheWeek],
          v6 == [(EKRecurrenceDayOfWeek *)v4 dayOfTheWeek]))
    {
      NSInteger v7 = [(EKRecurrenceDayOfWeek *)self weekNumber];
      BOOL v8 = v7 == [(EKRecurrenceDayOfWeek *)v4 weekNumber];
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (EKWeekday)dayOfTheWeek
{
  return self->_dayOfTheWeek;
}

- (NSInteger)weekNumber
{
  return self->_weekNumber;
}

@end