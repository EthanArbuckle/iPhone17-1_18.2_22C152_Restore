@interface FlashIndicatorView
- (_TtC18CoreIDVRGBLiveness18FlashIndicatorView)initWithCoder:(id)a3;
- (_TtC18CoreIDVRGBLiveness18FlashIndicatorView)initWithFrame:(CGRect)a3;
- (void)toggleHandler;
@end

@implementation FlashIndicatorView

- (_TtC18CoreIDVRGBLiveness18FlashIndicatorView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___enabledIcon) = (Class)1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___disabledIcon) = (Class)1;
  id v4 = a3;

  result = (_TtC18CoreIDVRGBLiveness18FlashIndicatorView *)sub_21EE9B338();
  __break(1u);
  return result;
}

- (void)toggleHandler
{
  v2 = self;
  sub_21EE75F9C();
}

- (_TtC18CoreIDVRGBLiveness18FlashIndicatorView)initWithFrame:(CGRect)a3
{
  result = (_TtC18CoreIDVRGBLiveness18FlashIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21EE2E5E0(*(id *)((char *)&self->super.super.super.super.super.isa
                      + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___enabledIcon));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18CoreIDVRGBLiveness18FlashIndicatorView____lazy_storage___disabledIcon);

  sub_21EE2E5E0(v3);
}

@end