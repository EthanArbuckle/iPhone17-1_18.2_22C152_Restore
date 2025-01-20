@interface LoadingViewController
- (UINavigationItem)navigationItem;
- (_TtC20StoreDynamicUIPlugin21LoadingViewController)init;
- (_TtC20StoreDynamicUIPlugin21LoadingViewController)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LoadingViewController

- (_TtC20StoreDynamicUIPlugin21LoadingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_A0068();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_A0188();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_A024C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_A0360();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_A03E0();
}

- (_TtC20StoreDynamicUIPlugin21LoadingViewController)init
{
}

- (_TtC20StoreDynamicUIPlugin21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_10ADB0();
  }
  id v5 = a4;
  sub_A0A6C();
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin21LoadingViewController_loadingView];
}

@end