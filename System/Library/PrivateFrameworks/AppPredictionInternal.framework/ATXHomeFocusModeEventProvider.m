@interface ATXHomeFocusModeEventProvider
- (ATXHomeFocusModeEventProvider)init;
- (id)biomePublisherWithBookmark:(id)a3;
@end

@implementation ATXHomeFocusModeEventProvider

- (ATXHomeFocusModeEventProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXHomeFocusModeEventProvider;
  return [(ATXModeTransitionModeEventProvider *)&v3 initWithMode:1];
}

- (id)biomePublisherWithBookmark:(id)a3
{
  objc_super v3 = objc_opt_new();
  v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v5 = objc_opt_new();
  v6 = [v4 dateBySettingHour:17 minute:0 second:0 ofDate:v5 options:0];

  v7 = objc_opt_new();
  v8 = [v4 dateBySettingHour:22 minute:0 second:0 ofDate:v7 options:0];

  v9 = objc_opt_new();
  v23 = [v4 dateBySettingHour:10 minute:0 second:0 ofDate:v9 options:0];

  v10 = objc_opt_new();
  v22 = [v4 dateBySettingHour:22 minute:0 second:0 ofDate:v10 options:0];

  uint64_t v11 = -61;
  do
  {
    v12 = objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, v11 + 1, v6, 0, v22);
    v13 = [v4 dateByAddingUnit:16 value:v11 + 1 toDate:v8 options:0];
    if ([v4 isDateInWeekend:v12])
    {
      uint64_t v14 = [v4 dateByAddingUnit:16 value:v11 + 1 toDate:v23 options:0];

      uint64_t v15 = [v4 dateByAddingUnit:16 value:v11 + 1 toDate:v22 options:0];

      v13 = (void *)v15;
      v12 = (void *)v14;
    }
    v16 = [[ATXModeEvent alloc] initWithStartDate:v12 endDate:v13];
    id v17 = objc_alloc(MEMORY[0x1E4F50280]);
    [v12 timeIntervalSinceReferenceDate];
    v18 = objc_msgSend(v17, "initWithEventBody:timestamp:", v16);
    [v3 addObject:v18];
  }
  while (!__CFADD__(v11++, 1));
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:v3];

  return v20;
}

@end