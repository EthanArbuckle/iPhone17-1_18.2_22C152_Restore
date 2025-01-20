@interface ControlContainerView
- (_TtC16MagnifierSupport20ControlContainerView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport20ControlContainerView)initWithFrame:(CGRect)a3;
- (void)deviceOrientationDidChange:(id)a3;
@end

@implementation ControlContainerView

- (_TtC16MagnifierSupport20ControlContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport20ControlContainerView *)sub_2357028D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport20ControlContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23570448C();
}

- (void)deviceOrientationDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_235704558();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport20ControlContainerView_primaryButtonRow));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport20ControlContainerView_featureTrayButtonRow);
}

@end