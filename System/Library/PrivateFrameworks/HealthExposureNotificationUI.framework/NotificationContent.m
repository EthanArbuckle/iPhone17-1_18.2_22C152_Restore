@interface NotificationContent
- (CGSize)intrinsicContentSize;
- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent)initWithFrame:(CGRect)a3;
@end

@implementation NotificationContent

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v9 = OBJC_IVAR____TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent_notificationContainer;
  type metadata accessor for NotificationCapsuleView();
  id v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = ObjectType;
  v12 = -[NotificationContent initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_229412474();

  return v12;
}

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent_notificationContainer;
  type metadata accessor for NotificationCapsuleView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent *)sub_2294195F8();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  type metadata accessor for NotificationCapsuleView();
  id v3 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v4 = self;

  double v5 = *MEMORY[0x263F83C20];
  double v6 = 85.0;
  double v7 = v5;
  result.double height = v6;
  result.double width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F719NotificationContent_notificationContainer));
}

@end