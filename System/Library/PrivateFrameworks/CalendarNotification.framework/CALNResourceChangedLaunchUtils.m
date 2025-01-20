@interface CALNResourceChangedLaunchUtils
+ (void)setResourceChangedEventURLForCalendarNotification:(id)a3 onNotificationContent:(id)a4;
@end

@implementation CALNResourceChangedLaunchUtils

+ (void)setResourceChangedEventURLForCalendarNotification:(id)a3 onNotificationContent:(id)a4
{
  id v5 = a4;
  id v9 = [a3 startDate];
  v6 = NSString;
  [v9 timeIntervalSinceReferenceDate];
  v8 = objc_msgSend(v6, "stringWithFormat:", @"calshow:%.0f", v7);
  [v5 setUserInfoValue:v8 forKey:@"kCALNResourceChangedShowEventURLKey"];
}

@end