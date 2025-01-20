@interface _HKActivityStatisticsStandHourInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_HKActivityStatisticsStandHourInfo)initWithCoder:(id)a3;
- (_HKActivityStatisticsStandHourInfo)initWithTimeStamp:(double)a3 state:(int64_t)a4;
- (double)timeStamp;
- (id)description;
- (int64_t)state;
- (void)encodeWithCoder:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTimeStamp:(double)a3;
@end

@implementation _HKActivityStatisticsStandHourInfo

- (_HKActivityStatisticsStandHourInfo)initWithTimeStamp:(double)a3 state:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_HKActivityStatisticsStandHourInfo;
  result = [(_HKActivityStatisticsStandHourInfo *)&v7 init];
  if (result)
  {
    result->_timeStamp = a3;
    result->_state = a4;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double timeStamp = self->_timeStamp;
  id v5 = a3;
  v6 = NSStringFromSelector(sel_timeStamp);
  [v5 encodeDouble:v6 forKey:timeStamp];

  int64_t state = self->_state;
  NSStringFromSelector(sel_state);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:state forKey:v8];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKActivityStatisticsStandHourInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HKActivityStatisticsStandHourInfo;
  id v5 = [(_HKActivityStatisticsStandHourInfo *)&v10 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_timeStamp);
    [v4 decodeDoubleForKey:v6];
    v5->_double timeStamp = v7;

    id v8 = NSStringFromSelector(sel_state);
    v5->_int64_t state = [v4 decodeIntegerForKey:v8];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    [v4 timeStamp];
    CFDateRef v7 = CFDateCreate(v5, v6);
    [(_HKActivityStatisticsStandHourInfo *)self timeStamp];
    CFDateRef v9 = CFDateCreate(v5, v8);
    if ([(__CFDate *)v7 isEqualToDate:v9])
    {
      uint64_t v10 = [v4 state];
      BOOL v11 = v10 == [(_HKActivityStatisticsStandHourInfo *)self state];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_HKActivityStatisticsStandHourInfo;
  id v4 = [(_HKActivityStatisticsStandHourInfo *)&v11 description];
  CFAllocatorRef v5 = (void *)MEMORY[0x1E4F1C9C8];
  [(_HKActivityStatisticsStandHourInfo *)self timeStamp];
  CFAbsoluteTime v6 = objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:");
  int64_t v7 = [(_HKActivityStatisticsStandHourInfo *)self state];
  CFAbsoluteTime v8 = @"Idle";
  if (!v7) {
    CFAbsoluteTime v8 = @"Stood";
  }
  CFDateRef v9 = [v3 stringWithFormat:@"%@: Start Date %@; State: %@", v4, v6, v8];

  return v9;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(double)a3
{
  self->_double timeStamp = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

@end