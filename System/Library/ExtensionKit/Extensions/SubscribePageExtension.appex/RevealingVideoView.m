@interface RevealingVideoView
- (_TtC22SubscribePageExtension18RevealingVideoView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension18RevealingVideoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RevealingVideoView

- (_TtC22SubscribePageExtension18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension18RevealingVideoView *)sub_100225E30(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension18RevealingVideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100227E0C();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1002263C4((uint64_t)a3);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoView();
  id v2 = v3.receiver;
  [(RevealingVideoView *)&v3 layoutSubviews];
  sub_100226898();
  sub_100226DAC();
  sub_100226F04();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1000F89CC((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_pageGrid);
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end