@interface RevealingVideoMirrorView
- (_TtC22SubscribePageExtension24RevealingVideoMirrorView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension24RevealingVideoMirrorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RevealingVideoMirrorView

- (_TtC22SubscribePageExtension24RevealingVideoMirrorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005817BC();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoMirrorView();
  id v2 = v3.receiver;
  [(RevealingVideoMirrorView *)&v3 layoutSubviews];
  sub_100581138();
}

- (_TtC22SubscribePageExtension24RevealingVideoMirrorView)initWithFrame:(CGRect)a3
{
  result = (_TtC22SubscribePageExtension24RevealingVideoMirrorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension24RevealingVideoMirrorView_videoMirrorView));
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension24RevealingVideoMirrorView_pageGrid;

  sub_1000F89CC((uint64_t)v3);
}

@end