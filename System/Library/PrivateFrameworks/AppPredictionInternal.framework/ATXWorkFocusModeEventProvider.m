@interface ATXWorkFocusModeEventProvider
- (ATXWorkFocusModeEventProvider)init;
- (id)biomePublisherWithBookmark:(id)a3;
@end

@implementation ATXWorkFocusModeEventProvider

- (ATXWorkFocusModeEventProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXWorkFocusModeEventProvider;
  return [(ATXModeTransitionModeEventProvider *)&v3 initWithMode:2];
}

- (id)biomePublisherWithBookmark:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1C9A8], "currentCalendar", a3);
  v5 = objc_opt_new();
  v6 = [v4 dateBySettingHour:9 minute:0 second:0 ofDate:v5 options:0];

  v7 = objc_opt_new();
  v8 = [v4 dateBySettingHour:17 minute:0 second:0 ofDate:v7 options:0];

  v9 = [(ATXModeTransitionModeEventProvider *)self bmStoreEventsForLast61DaysWithStartDateToday:v6 endDateToday:v8 includeWeekends:0 includeHolidays:0];
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:v9];

  return v10;
}

@end