@interface SegmentedControlComponent
- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)segmentedControlAction;
@end

@implementation SegmentedControlComponent

- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithFrame:(CGRect)a3
{
  return (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent *)sub_4F00C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19CoreDynamicUIPlugin25SegmentedControlComponent)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4F11C();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_4F338();
}

- (void)segmentedControlAction
{
  v2 = self;
  sub_4F46C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC19CoreDynamicUIPlugin25SegmentedControlComponent_underlyingSegmentedControl);
}

@end