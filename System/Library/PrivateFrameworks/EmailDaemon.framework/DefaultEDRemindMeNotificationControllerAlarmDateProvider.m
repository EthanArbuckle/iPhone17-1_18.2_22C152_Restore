@interface DefaultEDRemindMeNotificationControllerAlarmDateProvider
- (NSDate)nextDate;
- (void)setNextDate:(id)a3;
@end

@implementation DefaultEDRemindMeNotificationControllerAlarmDateProvider

- (NSDate)nextDate
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v3 = [v2 objectForKey:@"EDRemindMeNotificationControllerNextAlarmDate"];

  return (NSDate *)v3;
}

- (void)setNextDate:(id)a3
{
  id v4 = a3;
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  [v3 setObject:v4 forKey:@"EDRemindMeNotificationControllerNextAlarmDate"];
}

@end