@interface MainViewController
- (_TtC12PreviewShell18MainViewController)init;
- (_TtC12PreviewShell18MainViewController)initWithCoder:(id)a3;
- (_TtC12PreviewShell18MainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MainViewController

- (_TtC12PreviewShell18MainViewController)init
{
  return (_TtC12PreviewShell18MainViewController *)sub_100026AEC();
}

- (_TtC12PreviewShell18MainViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002A29C();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  [(MainViewController *)&v3 viewDidLoad];
  sub_10002675C(v2[OBJC_IVAR____TtC12PreviewShell18MainViewController_state], 0);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1000284B4();
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild);
  if (v2) {
    return (unint64_t)[v2 supportedInterfaceOrientations];
  }
  else {
    return 30;
  }
}

- (_TtC12PreviewShell18MainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12PreviewShell18MainViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell18MainViewController_visibleChild));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell18MainViewController_splashViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PreviewShell18MainViewController_connectViewController));
  sub_10002A668((uint64_t)self + OBJC_IVAR____TtC12PreviewShell18MainViewController_canvasObserver);
  swift_release();
  sub_10002A668((uint64_t)self + OBJC_IVAR____TtC12PreviewShell18MainViewController_previewCacheObserver);
  swift_release();

  swift_release();
}

@end