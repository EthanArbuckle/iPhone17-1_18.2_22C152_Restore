@interface ATXBedtimeFocusModeEventProvider
- (ATXBedtimeFocusModeEventProvider)init;
- (id)biomePublisherWithBookmark:(id)a3;
@end

@implementation ATXBedtimeFocusModeEventProvider

- (ATXBedtimeFocusModeEventProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXBedtimeFocusModeEventProvider;
  return [(ATXModeTransitionModeEventProvider *)&v3 initWithMode:5];
}

- (id)biomePublisherWithBookmark:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar", a3);
  v5 = objc_opt_new();
  v6 = [v4 dateBySettingHour:22 minute:0 second:0 ofDate:v5 options:0];

  v7 = objc_opt_new();
  v8 = [v4 dateBySettingHour:23 minute:59 second:0 ofDate:v7 options:0];

  v9 = [(ATXModeTransitionModeEventProvider *)self bmStoreEventsForLast61DaysWithStartDateToday:v6 endDateToday:v8 includeWeekends:1 includeHolidays:1];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:v9];

  return v10;
}

@end