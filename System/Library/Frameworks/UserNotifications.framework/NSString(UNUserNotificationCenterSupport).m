@interface NSString(UNUserNotificationCenterSupport)
+ (id)localizedUserNotificationStringForKey:()UNUserNotificationCenterSupport arguments:;
@end

@implementation NSString(UNUserNotificationCenterSupport)

+ (id)localizedUserNotificationStringForKey:()UNUserNotificationCenterSupport arguments:
{
  return +[UNLocalizedStringFactory localizedUserNotificationStringForKey:arguments:](UNLocalizedStringFactory, "localizedUserNotificationStringForKey:arguments:");
}

@end