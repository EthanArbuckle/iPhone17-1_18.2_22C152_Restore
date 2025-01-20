@interface CanvasViewController
- (_TtC12PreviewShell20CanvasViewController)initWithCoder:(id)a3;
- (_TtC12PreviewShell20CanvasViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CanvasViewController

- (_TtC12PreviewShell20CanvasViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_active) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation;
  uint64_t v6 = type metadata accessor for PreviewPreferences.InterfaceOrientation();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay) = 0;
  id v7 = a3;

  result = (_TtC12PreviewShell20CanvasViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = self;
  unint64_t v3 = sub_100039388();

  return v3;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000395A4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100039774();
}

- (_TtC12PreviewShell20CanvasViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12PreviewShell20CanvasViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_activating));
  sub_100039BB8((uint64_t)self + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_forcedOrientation);
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12PreviewShell20CanvasViewController_debugOverlay);
}

@end