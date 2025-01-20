@interface RevealingVideoView
- (_TtC20ProductPageExtension18RevealingVideoView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension18RevealingVideoView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)willMoveToWindow:(id)a3;
@end

@implementation RevealingVideoView

- (_TtC20ProductPageExtension18RevealingVideoView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18RevealingVideoView *)sub_100565654(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18RevealingVideoView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100567484();
}

- (void)willMoveToWindow:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100565BE8((uint64_t)a3);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoView();
  id v2 = v3.receiver;
  [(RevealingVideoView *)&v3 layoutSubviews];
  sub_1005660BC();
  sub_1005665D0();
  sub_100566728();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100065A60((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_pageGrid);
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension18RevealingVideoView_mirrorDelegate);
  swift_unknownObjectWeakDestroy();

  swift_unknownObjectWeakDestroy();
}

@end