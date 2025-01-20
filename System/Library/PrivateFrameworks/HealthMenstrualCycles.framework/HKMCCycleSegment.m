@interface HKMCCycleSegment
+ (BOOL)supportsSecureCoding;
+ (id)_fertileWindowSegmentWithDays:(id)a3;
+ (id)_menstruationSegmentWithDays:(id)a3;
- ($0AC6E346AE4835514AAA8AC86D8F4844)days;
- (BOOL)isEqual:(id)a3;
- (HKMCCycleSegment)initWithCoder:(id)a3;
- (NSString)hk_redactedDescription;
- (id)_initWithType:(int64_t)a3 days:(id)a4;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCCycleSegment

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"Type"];
  [v5 encodeInteger:self->_days.start forKey:@"DaysStart"];
  [v5 encodeInteger:self->_days.duration forKey:@"DaysDuration"];
}

- (HKMCCycleSegment)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCCycleSegment;
  id v5 = [(HKMCCycleSegment *)&v7 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"Type"];
    v5->_days.start = [v4 decodeIntegerForKey:@"DaysStart"];
    v5->_days.duration = [v4 decodeIntegerForKey:@"DaysDuration"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_menstruationSegmentWithDays:(id)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:days:", 0, a3.var0, a3.var1);
  return v3;
}

+ (id)_fertileWindowSegmentWithDays:(id)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "_initWithType:days:", 1, a3.var0, a3.var1);
  return v3;
}

- (id)_initWithType:(int64_t)a3 days:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  v8.receiver = self;
  v8.super_class = (Class)HKMCCycleSegment;
  id result = [(HKMCCycleSegment *)&v8 init];
  if (result)
  {
    *((void *)result + 2) = var1;
    *((void *)result + 3) = a3;
    *((void *)result + 1) = var0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [NSNumber numberWithInteger:self->_type];
  v6 = NSStringFromHKDayIndexRange();
  objc_super v7 = [v3 stringWithFormat:@"<%@:%p type:%@ days:%@>", v4, self, v5, v6];

  return v7;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCCycleSegment *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(HKMCCycleSegment *)self type], v5 == [(HKMCCycleSegment *)v4 type]))
    {
      uint64_t v6 = [(HKMCCycleSegment *)self days];
      uint64_t v8 = v7;
      BOOL v11 = v6 == [(HKMCCycleSegment *)v4 days] && v8 == v9;
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_days.start ^ self->_type ^ self->_days.duration;
}

- (int64_t)type
{
  return self->_type;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)days
{
  int64_t duration = self->_days.duration;
  int64_t start = self->_days.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

@end