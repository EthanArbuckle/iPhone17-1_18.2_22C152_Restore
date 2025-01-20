@interface HKMCDaySummaryQueryConfiguration
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange;
- (BOOL)ascending;
- (HKMCDaySummaryQueryConfiguration)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)limit;
- (void)encodeWithCoder:(id)a3;
- (void)setAscending:(BOOL)a3;
- (void)setDayIndexRange:(id)a3;
- (void)setLimit:(int64_t)a3;
@end

@implementation HKMCDaySummaryQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HKMCDaySummaryQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v8 copyWithZone:a3];
  uint64_t v5 = [(HKMCDaySummaryQueryConfiguration *)self dayIndexRange];
  objc_msgSend(v4, "setDayIndexRange:", v5, v6);
  objc_msgSend(v4, "setAscending:", -[HKMCDaySummaryQueryConfiguration ascending](self, "ascending"));
  objc_msgSend(v4, "setLimit:", -[HKMCDaySummaryQueryConfiguration limit](self, "limit"));
  return v4;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void)setDayIndexRange:(id)a3
{
  self->_dayIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  p_dayIndexRange = &self->_dayIndexRange;
  int64_t start = self->_dayIndexRange.start;
  int64_t duration = p_dayIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (HKMCDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKMCDaySummaryQueryConfiguration;
  uint64_t v5 = [(HKQueryServerConfiguration *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_dayIndexRange.int64_t start = [v4 decodeIntegerForKey:@"DayIndexRangeStart"];
    v5->_dayIndexRange.int64_t duration = [v4 decodeIntegerForKey:@"DayIndexRangeDuration"];
    v5->_ascending = [v4 decodeBoolForKey:@"Ascending"];
    v5->_limit = [v4 decodeIntegerForKey:@"Limit"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKMCDaySummaryQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_dayIndexRange.start, @"DayIndexRangeStart", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_dayIndexRange.duration forKey:@"DayIndexRangeDuration"];
  [v4 encodeBool:self->_ascending forKey:@"Ascending"];
  [v4 encodeInteger:self->_limit forKey:@"Limit"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end