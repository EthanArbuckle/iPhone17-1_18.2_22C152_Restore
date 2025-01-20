@interface CameraScannerOverlayContentView
- (_TtC18HealthExperienceUI31CameraScannerOverlayContentView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31CameraScannerOverlayContentView)initWithFrame:(CGRect)a3;
@end

@implementation CameraScannerOverlayContentView

- (_TtC18HealthExperienceUI31CameraScannerOverlayContentView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView____lazy_storage___stackView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView____lazy_storage___titleLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView____lazy_storage___detailLabel) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI31CameraScannerOverlayContentView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI31CameraScannerOverlayContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI31CameraScannerOverlayContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView_headerView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerOverlayContentView____lazy_storage___detailLabel);
}

@end