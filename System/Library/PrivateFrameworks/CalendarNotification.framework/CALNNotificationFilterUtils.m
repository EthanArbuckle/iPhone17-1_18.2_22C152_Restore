@interface CALNNotificationFilterUtils
+ (id)filterIdentifierForNotificationContent:(id)a3;
+ (id)filterIdentifierForNotificationRecord:(id)a3;
+ (void)setFilterIdentifier:(id)a3 onNotificationContent:(id)a4;
+ (void)setFilterIdentifierForEKCalendarNotification:(id)a3 onNotificationContent:(id)a4;
@end

@implementation CALNNotificationFilterUtils

+ (id)filterIdentifierForNotificationRecord:(id)a3
{
  id v4 = a3;
  v5 = [v4 content];
  v6 = [a1 filterIdentifierForNotificationContent:v5];

  if (!v6)
  {
    v6 = [v4 sourceClientIdentifier];
  }

  return v6;
}

+ (id)filterIdentifierForNotificationContent:(id)a3
{
  v3 = [a3 userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"DatabaseChangedFilterIdentifier"];

  return v4;
}

+ (void)setFilterIdentifier:(id)a3 onNotificationContent:(id)a4
{
}

+ (void)setFilterIdentifierForEKCalendarNotification:(id)a3 onNotificationContent:(id)a4
{
  id v8 = a4;
  v6 = [a3 objectID];
  v7 = [v6 stringRepresentation];

  if (v7) {
    [a1 setFilterIdentifier:v7 onNotificationContent:v8];
  }
}

@end