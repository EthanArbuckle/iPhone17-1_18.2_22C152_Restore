@interface UserNotificationViewController
- (_TtC35AMSEngagementNotificationsExtension30UserNotificationViewController)initWithCoder:(id)a3;
- (_TtC35AMSEngagementNotificationsExtension30UserNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation UserNotificationViewController

- (_TtC35AMSEngagementNotificationsExtension30UserNotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100003D10();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC35AMSEngagementNotificationsExtension30UserNotificationViewController *)sub_100003B50(v5, v7, a4);
}

- (_TtC35AMSEngagementNotificationsExtension30UserNotificationViewController)initWithCoder:(id)a3
{
  return (_TtC35AMSEngagementNotificationsExtension30UserNotificationViewController *)sub_100003C30(a3);
}

@end