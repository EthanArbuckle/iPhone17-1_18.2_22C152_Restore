@interface ATXSleepSuggestionOccurrence
+ (BOOL)supportsSecureCoding;
- (ATXSleepSuggestionOccurrence)initWithBedtimeComponents:(id)a3 wakeupComponents:(id)a4 weekdays:(unint64_t)a5;
- (ATXSleepSuggestionOccurrence)initWithCoder:(id)a3;
- (NSDateComponents)bedtimeComponents;
- (NSDateComponents)wakeUpComponents;
- (unint64_t)weekdays;
- (void)encodeWithCoder:(id)a3;
- (void)setBedtimeComponents:(id)a3;
- (void)setWakeUpComponents:(id)a3;
- (void)setWeekdays:(unint64_t)a3;
@end

@implementation ATXSleepSuggestionOccurrence

- (ATXSleepSuggestionOccurrence)initWithBedtimeComponents:(id)a3 wakeupComponents:(id)a4 weekdays:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXSleepSuggestionOccurrence;
  v11 = [(ATXSleepSuggestionOccurrence *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_bedtimeComponents, a3);
    objc_storeStrong((id *)&v12->_wakeUpComponents, a4);
    v12->_weekdays = a5;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  bedtimeComponents = self->_bedtimeComponents;
  id v5 = a3;
  [v5 encodeObject:bedtimeComponents forKey:@"bedtimeComponents"];
  [v5 encodeObject:self->_wakeUpComponents forKey:@"wakeUpComponents"];
  [v5 encodeInteger:self->_weekdays forKey:@"weekdays"];
}

- (ATXSleepSuggestionOccurrence)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXSleepSuggestionOccurrence;
  id v5 = [(ATXSleepSuggestionOccurrence *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bedtimeComponents"];
    bedtimeComponents = v5->_bedtimeComponents;
    v5->_bedtimeComponents = (NSDateComponents *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"wakeUpComponents"];
    wakeUpComponents = v5->_wakeUpComponents;
    v5->_wakeUpComponents = (NSDateComponents *)v8;

    v5->_weekdays = [v4 decodeIntegerForKey:@"weekdays"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDateComponents)bedtimeComponents
{
  return self->_bedtimeComponents;
}

- (void)setBedtimeComponents:(id)a3
{
}

- (NSDateComponents)wakeUpComponents
{
  return self->_wakeUpComponents;
}

- (void)setWakeUpComponents:(id)a3
{
}

- (unint64_t)weekdays
{
  return self->_weekdays;
}

- (void)setWeekdays:(unint64_t)a3
{
  self->_weekdays = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeUpComponents, 0);

  objc_storeStrong((id *)&self->_bedtimeComponents, 0);
}

@end