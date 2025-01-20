@interface MFPassthroughView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC16MagnifierSupport17MFPassthroughView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport17MFPassthroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation MFPassthroughView

- (_TtC16MagnifierSupport17MFPassthroughView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_enabled) = 1;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport17MFPassthroughView_heightOfPanAreaAboveDrawer) = (Class)0x403E000000000000;
  id v4 = a3;

  result = (_TtC16MagnifierSupport17MFPassthroughView *)sub_23594A968();
  __break(1u);
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  LOBYTE(v4) = sub_23584EA98(v4, x, y);

  return v4 & 1;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_23584ED14((uint64_t)a4, x, y);

  return v10;
}

- (_TtC16MagnifierSupport17MFPassthroughView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport17MFPassthroughView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end