@interface NotificationViewController
- (_TtC49HealthMenstrualCyclesNotificationContentExtension26NotificationViewController)initWithCoder:(id)a3;
- (_TtC49HealthMenstrualCyclesNotificationContentExtension26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveNotification:(id)a3;
- (void)viewDidLoad;
@end

@implementation NotificationViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100001DC0();
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100001F28(v4);
}

- (_TtC49HealthMenstrualCyclesNotificationContentExtension26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_100003318();
    id v6 = a4;
    NSString v7 = sub_1000032E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for NotificationViewController();
  v9 = [(NotificationViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC49HealthMenstrualCyclesNotificationContentExtension26NotificationViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NotificationViewController();
  return [(NotificationViewController *)&v5 initWithCoder:a3];
}

@end