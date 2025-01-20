@interface EKRecurrenceEnd
+ (BOOL)supportsSecureCoding;
+ (EKRecurrenceEnd)recurrenceEndWithEndDate:(NSDate *)endDate;
+ (EKRecurrenceEnd)recurrenceEndWithOccurrenceCount:(NSUInteger)occurrenceCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesEndDate;
- (EKRecurrenceEnd)initWithCoder:(id)a3;
- (EKRecurrenceEnd)initWithEndDate:(id)a3;
- (EKRecurrenceEnd)initWithOccurrenceCount:(unint64_t)a3;
- (NSDate)endDate;
- (NSUInteger)occurrenceCount;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EKRecurrenceEnd

+ (EKRecurrenceEnd)recurrenceEndWithEndDate:(NSDate *)endDate
{
  v3 = endDate;
  v4 = [[EKRecurrenceEnd alloc] initWithEndDate:v3];

  return v4;
}

+ (EKRecurrenceEnd)recurrenceEndWithOccurrenceCount:(NSUInteger)occurrenceCount
{
  v3 = [[EKRecurrenceEnd alloc] initWithOccurrenceCount:occurrenceCount];

  return v3;
}

- (EKRecurrenceEnd)initWithEndDate:(id)a3
{
  id v4 = a3;
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"endDate is nil"];
  }
  v11.receiver = self;
  v11.super_class = (Class)EKRecurrenceEnd;
  v5 = [(EKRecurrenceEnd *)&v11 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E4F1C9C8];
      [v4 timeIntervalSinceReferenceDate];
      uint64_t v8 = [v6 dateWithTimeIntervalSinceReferenceDate:floor(v7)];
    }
    else
    {
      uint64_t v8 = 0;
    }
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v8;
  }
  return v5;
}

- (EKRecurrenceEnd)initWithOccurrenceCount:(unint64_t)a3
{
  if (!a3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"occurrenceCount == 0"];
  }
  v6.receiver = self;
  v6.super_class = (Class)EKRecurrenceEnd;
  result = [(EKRecurrenceEnd *)&v6 init];
  if (result) {
    result->_occurrenceCount = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EKRecurrenceEnd)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKRecurrenceEnd;
  v5 = [(EKRecurrenceEnd *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v6;

    v5->_occurrenceCount = (int)[v4 decodeIntForKey:@"occurrenceCount"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  endDate = self->_endDate;
  id v5 = a3;
  [v5 encodeObject:endDate forKey:@"endDate"];
  [v5 encodeInteger:self->_occurrenceCount forKey:@"occurrenceCount"];
}

- (BOOL)usesEndDate
{
  return self->_endDate != 0;
}

- (id)description
{
  BOOL v3 = [(EKRecurrenceEnd *)self usesEndDate];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  if (v3)
  {
    uint64_t v6 = [(EKRecurrenceEnd *)self endDate];
    double v7 = +[EKRecurrenceRule iCalendarValueFromDate:v6 isDateOnly:0 isFloating:0];
    uint64_t v8 = [v4 stringWithFormat:@"%@ <%p> { UNTIL=%@ } ", v5, self, v7];
  }
  else
  {
    uint64_t v8 = [v4 stringWithFormat:@"%@ <%p> { COUNT=%lu }", v5, self, -[EKRecurrenceEnd occurrenceCount](self, "occurrenceCount")];
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(EKRecurrenceEnd *)self occurrenceCount];
  id v4 = [(EKRecurrenceEnd *)self endDate];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EKRecurrenceEnd *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class()
      && (NSUInteger v6 = [(EKRecurrenceEnd *)self occurrenceCount],
          v6 == [(EKRecurrenceEnd *)v4 occurrenceCount]))
    {
      double v7 = [(EKRecurrenceEnd *)self endDate];
      uint64_t v8 = [(EKRecurrenceEnd *)v4 endDate];
      if (v7 == v8)
      {
        char v11 = 1;
      }
      else
      {
        objc_super v9 = [(EKRecurrenceEnd *)self endDate];
        v10 = [(EKRecurrenceEnd *)v4 endDate];
        char v11 = [v9 isEqualToDate:v10];
      }
    }
    else
    {
      char v11 = 0;
    }
  }

  return v11;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSUInteger)occurrenceCount
{
  return self->_occurrenceCount;
}

- (void).cxx_destruct
{
}

@end