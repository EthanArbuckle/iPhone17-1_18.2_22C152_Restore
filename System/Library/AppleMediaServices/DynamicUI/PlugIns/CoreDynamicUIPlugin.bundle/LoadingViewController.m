@interface LoadingViewController
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin21LoadingViewController)init;
- (_TtC19CoreDynamicUIPlugin21LoadingViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LoadingViewController

- (_TtC19CoreDynamicUIPlugin21LoadingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_42518();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_42638();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_426FC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_42810();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_42890();
}

- (_TtC19CoreDynamicUIPlugin21LoadingViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_42F1C();
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin21LoadingViewController_loadingView];
}

@end