@interface LocalEditViewControllerTestCase
- (id)controller;
@end

@implementation LocalEditViewControllerTestCase

- (id)controller
{
  v2 = objc_opt_new();
  v3 = objc_opt_new();
  v4 = [MEMORY[0x1E4F254C0] calendarForEntityType:0 eventStore:v2];
  [v4 setTitle:@"CalendarTestTitle"];
  [v4 setSource:v3];
  v5 = [MEMORY[0x1E4F25538] eventWithEventStore:v2];
  [v5 setTitle:@"EventTestTitle"];
  [v5 setCalendar:v4];
  v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  [v5 setStartDate:v6];

  v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:3600.0];
  [v5 setEndDateUnadjustedForLegacyClients:v7];

  v8 = objc_opt_new();
  [v8 setEvent:v5];

  return v8;
}

@end