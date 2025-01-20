@interface HKSleepDaySummaryQueryConfiguration
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange;
- (BOOL)ascending;
- (HKSleepDaySummaryCacheSettings)cacheSettings;
- (HKSleepDaySummaryQueryConfiguration)initWithCoder:(id)a3;
- (NSCalendar)calendarOverrides;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)limit;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
- (void)setAscending:(BOOL)a3;
- (void)setCacheSettings:(id)a3;
- (void)setCalendarOverrides:(id)a3;
- (void)setLimit:(int64_t)a3;
- (void)setMorningIndexRange:(id)a3;
- (void)setOptions:(unint64_t)a3;
@end

@implementation HKSleepDaySummaryQueryConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  id v4 = [(HKQueryServerConfiguration *)&v12 copyWithZone:a3];
  uint64_t v5 = [(HKSleepDaySummaryQueryConfiguration *)self morningIndexRange];
  objc_msgSend(v4, "setMorningIndexRange:", v5, v6);
  objc_msgSend(v4, "setAscending:", -[HKSleepDaySummaryQueryConfiguration ascending](self, "ascending"));
  objc_msgSend(v4, "setLimit:", -[HKSleepDaySummaryQueryConfiguration limit](self, "limit"));
  objc_msgSend(v4, "setOptions:", -[HKSleepDaySummaryQueryConfiguration options](self, "options"));
  v7 = [(HKSleepDaySummaryQueryConfiguration *)self cacheSettings];
  v8 = (void *)[v7 copy];
  [v4 setCacheSettings:v8];

  v9 = [(HKSleepDaySummaryQueryConfiguration *)self calendarOverrides];
  v10 = (void *)[v9 copy];
  [v4 setCalendarOverrides:v10];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSleepDaySummaryQueryConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  uint64_t v5 = [(HKQueryServerConfiguration *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_morningIndexRange.start = [v4 decodeIntegerForKey:@"MorningIndexRangeStart"];
    v5->_morningIndexRange.duration = [v4 decodeIntegerForKey:@"MorningIndexRangeDuration"];
    v5->_ascending = [v4 decodeBoolForKey:@"Ascending"];
    v5->_limit = [v4 decodeIntegerForKey:@"Limit"];
    v5->_options = [v4 decodeIntegerForKey:@"Options"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CacheSettings"];
    cacheSettings = v5->_cacheSettings;
    v5->_cacheSettings = (HKSleepDaySummaryCacheSettings *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CalendarOverrides"];
    calendarOverrides = v5->_calendarOverrides;
    v5->_calendarOverrides = (NSCalendar *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  id v4 = a3;
  [(HKQueryServerConfiguration *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_morningIndexRange.start, @"MorningIndexRangeStart", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_morningIndexRange.duration forKey:@"MorningIndexRangeDuration"];
  [v4 encodeBool:self->_ascending forKey:@"Ascending"];
  [v4 encodeInteger:self->_limit forKey:@"Limit"];
  [v4 encodeInteger:self->_options forKey:@"Options"];
  [v4 encodeObject:self->_cacheSettings forKey:@"CacheSettings"];
  [v4 encodeObject:self->_calendarOverrides forKey:@"CalendarOverrides"];
}

- (id)description
{
  id v3 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)HKSleepDaySummaryQueryConfiguration;
  id v4 = [(HKSleepDaySummaryQueryConfiguration *)&v13 description];
  objc_super v5 = NSStringFromHKDayIndexRange(self->_morningIndexRange.start, self->_morningIndexRange.duration);
  uint64_t v6 = HKStringFromBool(self->_ascending);
  int64_t limit = self->_limit;
  uint64_t v8 = HKSleepDaySummaryQueryOptionsStringRepresentation(self->_options);
  v9 = [(HKSleepDaySummaryQueryConfiguration *)self cacheSettings];
  v10 = [(HKSleepDaySummaryQueryConfiguration *)self calendarOverrides];
  objc_super v11 = (void *)[v3 initWithFormat:@"<%@ Configuration - morningIndexRange: %@, ascending: %@, limit: %ld, options: %@, cacheSettings: %@, calendarOverrides: %@>", v4, v5, v6, limit, v8, v9, v10];

  return v11;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)morningIndexRange
{
  p_morningIndexRange = &self->_morningIndexRange;
  int64_t start = self->_morningIndexRange.start;
  int64_t duration = p_morningIndexRange->duration;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (void)setMorningIndexRange:(id)a3
{
  self->_morningIndexRange = ($BB81632A5F90EABF970498852D8C14B8)a3;
}

- (BOOL)ascending
{
  return self->_ascending;
}

- (void)setAscending:(BOOL)a3
{
  self->_ascending = a3;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_int64_t limit = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (HKSleepDaySummaryCacheSettings)cacheSettings
{
  return self->_cacheSettings;
}

- (void)setCacheSettings:(id)a3
{
}

- (NSCalendar)calendarOverrides
{
  return self->_calendarOverrides;
}

- (void)setCalendarOverrides:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarOverrides, 0);

  objc_storeStrong((id *)&self->_cacheSettings, 0);
}

@end