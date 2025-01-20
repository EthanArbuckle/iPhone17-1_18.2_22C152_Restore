@interface RiverTodayCardBackgroundView
- (_TtC22SubscribePageExtension28RiverTodayCardBackgroundView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension28RiverTodayCardBackgroundView)initWithFrame:(CGRect)a3;
- (void)didEnterBackground:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4;
- (void)reduceMotionStatusDidChange:(id)a3;
- (void)willEnterForeground:(id)a3;
@end

@implementation RiverTodayCardBackgroundView

- (_TtC22SubscribePageExtension28RiverTodayCardBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100174DE0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100171B68();
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(RiverTodayCardBackgroundView *)&v3 didMoveToWindow];
  sub_1001719E8();
}

- (void)willEnterForeground:(id)a3
{
}

- (void)didEnterBackground:(id)a3
{
}

- (void)reduceMotionStatusDidChange:(id)a3
{
}

- (void)preferredContentSizeDidChangeWithView:(id)a3 previousTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1001719E8();
}

- (_TtC22SubscribePageExtension28RiverTodayCardBackgroundView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension28RiverTodayCardBackgroundView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_gradientBackingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_topRightGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_topLeftGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_bottomLeftGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_bottomRightGradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_leftMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_rightMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_topMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_bottomMaskLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_overlayLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_meshView));
  swift_release();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension28RiverTodayCardBackgroundView_riverViewStyling;
  uint64_t v4 = sub_10075B000();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end