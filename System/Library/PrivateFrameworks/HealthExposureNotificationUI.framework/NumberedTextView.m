@interface NumberedTextView
- (NSString)details;
- (NSString)title;
- (_TtC28HealthExposureNotificationUI16NumberedTextView)initWithCoder:(id)a3;
- (_TtC28HealthExposureNotificationUI16NumberedTextView)initWithFrame:(CGRect)a3;
- (int64_t)number;
@end

@implementation NumberedTextView

- (int64_t)number
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC28HealthExposureNotificationUI16NumberedTextView_number);
}

- (NSString)title
{
  if (*(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC28HealthExposureNotificationUI16NumberedTextView_title))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_229419178();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)details
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_229419178();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC28HealthExposureNotificationUI16NumberedTextView)initWithCoder:(id)a3
{
  result = (_TtC28HealthExposureNotificationUI16NumberedTextView *)sub_2294195F8();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI16NumberedTextView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end