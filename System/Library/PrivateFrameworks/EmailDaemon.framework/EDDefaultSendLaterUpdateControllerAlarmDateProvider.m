@interface EDDefaultSendLaterUpdateControllerAlarmDateProvider
- (NSDate)nextDate;
- (void)setNextDate:(id)a3;
@end

@implementation EDDefaultSendLaterUpdateControllerAlarmDateProvider

- (NSDate)nextDate
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  v3 = [v2 objectForKey:@"EDSendLaterUpdateControllerNextAlarmDate"];

  return (NSDate *)v3;
}

- (void)setNextDate:(id)a3
{
  id v4 = a3;
  v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  [v3 setObject:v4 forKey:@"EDSendLaterUpdateControllerNextAlarmDate"];
}

@end