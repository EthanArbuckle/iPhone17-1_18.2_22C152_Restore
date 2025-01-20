@interface ActivityPreviewHostingViewController
- (_TtC9ChronoKit36ActivityPreviewHostingViewController)initWithCoder:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ActivityPreviewHostingViewController

- (_TtC9ChronoKit36ActivityPreviewHostingViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_islandSize);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_apertureTopEdgeMetric) = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_isLuminanceReduced) = 0;
  id v5 = a3;

  result = (_TtC9ChronoKit36ActivityPreviewHostingViewController *)sub_1DA98CBB8();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1DA9252C8();
}

- (void).cxx_destruct
{
  sub_1DA926CBC((uint64_t)self + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_autoupdatingPreviewView, type metadata accessor for ActivityPreviewHostingViewController._ActivityAutoupdatingPreviewView);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_environment;
  uint64_t v4 = sub_1DA98A888();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  id v5 = (char *)self + OBJC_IVAR____TtC9ChronoKit36ActivityPreviewHostingViewController_viewKind;
  uint64_t v6 = sub_1DA98BBC8();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();

  swift_release();
}

@end