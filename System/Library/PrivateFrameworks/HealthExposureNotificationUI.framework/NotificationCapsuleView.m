@interface NotificationCapsuleView
- (CGSize)intrinsicContentSize;
- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView)initWithFrame:(CGRect)a3;
@end

@implementation NotificationCapsuleView

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[NotificationCapsuleView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_2294121C4();

  return v7;
}

- (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView)initWithCoder:(id)a3
{
  result = (_TtC28HealthExposureNotificationUIP33_3C5A5DB4CABD7B5AF1E395A3DB5E24F723NotificationCapsuleView *)sub_2294195F8();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 9.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

@end