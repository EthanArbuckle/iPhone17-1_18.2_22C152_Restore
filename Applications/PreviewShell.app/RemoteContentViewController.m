@interface RemoteContentViewController
- (_TtC12PreviewShell27RemoteContentViewController)initWithCoder:(id)a3;
- (_TtC12PreviewShell27RemoteContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RemoteContentViewController

- (_TtC12PreviewShell27RemoteContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100017D24();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100016360();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100016678();
}

- (_TtC12PreviewShell27RemoteContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12PreviewShell27RemoteContentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_snapshotView));
  id v3 = (char *)self + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedStyle;
  uint64_t v4 = type metadata accessor for SceneStoppedStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_stoppedViewController));
  v5 = (char *)self + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedStyle;
  uint64_t v6 = type metadata accessor for SceneCrashedStyle();
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_crashedViewController));
  swift_release();
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PreviewShell27RemoteContentViewController_cachedSnapshotCGImage);
}

@end