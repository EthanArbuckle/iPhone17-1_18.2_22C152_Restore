@interface ARGlyphView
- (_TtC8RoomPlan11ARGlyphView)initWithCoder:(id)a3;
- (_TtC8RoomPlan11ARGlyphView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ARGlyphView

- (_TtC8RoomPlan11ARGlyphView)initWithFrame:(CGRect)a3
{
  return (_TtC8RoomPlan11ARGlyphView *)sub_2346A25C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2346A2D58();
}

- (_TtC8RoomPlan11ARGlyphView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8RoomPlan11ARGlyphView_renderer) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8RoomPlan11ARGlyphView_previousAngle) = 0;
  id v4 = a3;

  result = (_TtC8RoomPlan11ARGlyphView *)sub_2347EEEA0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

@end