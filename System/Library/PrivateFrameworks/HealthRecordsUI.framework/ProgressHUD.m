@interface ProgressHUD
- (_TtC15HealthRecordsUI11ProgressHUD)initWithCoder:(id)a3;
- (_TtC15HealthRecordsUI11ProgressHUD)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProgressHUD

- (_TtC15HealthRecordsUI11ProgressHUD)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C22866A4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1C2286070();
}

- (_TtC15HealthRecordsUI11ProgressHUD)initWithFrame:(CGRect)a3
{
  result = (_TtC15HealthRecordsUI11ProgressHUD *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI11ProgressHUD_progressIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI11ProgressHUD_progressMessageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI11ProgressHUD_backgroundEffect));
  swift_bridgeObjectRelease();
}

@end