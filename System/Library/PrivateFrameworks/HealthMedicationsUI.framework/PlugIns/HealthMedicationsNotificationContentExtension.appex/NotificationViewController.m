@interface NotificationViewController
- (_TtC45HealthMedicationsNotificationContentExtension26NotificationViewController)initWithCoder:(id)a3;
- (_TtC45HealthMedicationsNotificationContentExtension26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didReceiveNotification:(id)a3;
@end

@implementation NotificationViewController

- (_TtC45HealthMedicationsNotificationContentExtension26NotificationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10000A3A8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC45HealthMedicationsNotificationContentExtension26NotificationViewController *)sub_100005C2C(v5, v7, a4);
}

- (_TtC45HealthMedicationsNotificationContentExtension26NotificationViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100009A04();
}

- (void)didReceiveNotification:(id)a3
{
  id v5 = a3;
  v4 = self;
  sub_100007974(v5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___dateFormatter));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC45HealthMedicationsNotificationContentExtension26NotificationViewController____lazy_storage___scheduledForLabelStackView);
}

@end