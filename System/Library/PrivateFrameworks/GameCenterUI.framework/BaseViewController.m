@interface BaseViewController
- (_TtC12GameCenterUI18BaseViewController)init;
- (_TtC12GameCenterUI18BaseViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI18BaseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BaseViewController

- (_TtC12GameCenterUI18BaseViewController)init
{
  return (_TtC12GameCenterUI18BaseViewController *)BaseViewController.init()();
}

- (_TtC12GameCenterUI18BaseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF57E794();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF57F24C((SEL *)&selRef_viewDidLoad);
}

- (void)loadView
{
  v2 = self;
  sub_1AF57EB60();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF57EEC4(a3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF57E61C();
}

- (_TtC12GameCenterUI18BaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  BaseViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI18BaseViewController_scrollObserver));

  swift_release();
}

@end