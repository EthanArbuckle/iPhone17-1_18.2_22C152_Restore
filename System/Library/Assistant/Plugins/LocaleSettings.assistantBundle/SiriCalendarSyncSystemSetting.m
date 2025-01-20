@interface SiriCalendarSyncSystemSetting
- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6;
- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4;
@end

@implementation SiriCalendarSyncSystemSetting

- (void)getChangeAfterAnchor:(id)a3 changeInfo:(id)a4
{
  id v11 = a3;
  v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a4;
  v7 = [v5 currentCalendar];
  v8 = [v7 calendarIdentifier];

  if ([v11 isEqualToString:v8])
  {
    [v6 setPostAnchor:v11];
    [v6 setObject:0];
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x263F64740]);
    v10 = [NSURL URLWithString:@"CalendarSystemSettingIdentifier"];
    [v9 setIdentifier:v10];

    [v9 setCalendarType:v8];
    [v6 setObject:v9];
    [v6 setPostAnchor:v8];
  }
  [v6 setIsDelete:0];
}

- (void)beginSyncWithAnchor:(id)a3 validity:(id)a4 forKey:(id)a5 beginInfo:(id)a6
{
  id v7 = a6;
  if (([a4 isEqualToString:@"CalendarSystemSettingValidity"] & 1) == 0) {
    [v7 resetWithValidity:@"CalendarSystemSettingValidity"];
  }
}

@end