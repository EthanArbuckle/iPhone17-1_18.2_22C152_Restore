@interface AXTwiceWatchCrownButton
- (_TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton)initWithCoder:(id)a3;
- (_TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton)initWithFrame:(CGRect)a3;
- (void)accessibilityElementDidLoseFocus;
@end

@implementation AXTwiceWatchCrownButton

- (void)accessibilityElementDidLoseFocus
{
  v2 = self;
  sub_22C055720();
}

- (_TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval) = (Class)0x3FF0000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return -[AXTwiceWatchCrownButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchInterval) = (Class)0x3FF0000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AXTwiceWatchCrownButton();
  return [(AXTwiceWatchCrownButton *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC21AXWatchRemoteScreenUI23AXTwiceWatchCrownButton_watchCrownDirectTouchTimer));
}

@end