@interface JULoadingViewController
- (_TtC5JetUI23JULoadingViewController)initWithCoder:(id)a3;
- (_TtC5JetUI23JULoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation JULoadingViewController

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1B07B57A0((uint64_t)self + OBJC_IVAR____TtC5JetUI23JULoadingViewController_presentationContext);

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  JULoadingViewController.viewDidLoad()();
}

- (_TtC5JetUI23JULoadingViewController)initWithCoder:(id)a3
{
  result = (_TtC5JetUI23JULoadingViewController *)sub_1B086A6C8();
  __break(1u);
  return result;
}

- (void)encodeWithCoder:(id)a3
{
}

- (_TtC5JetUI23JULoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5JetUI23JULoadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end