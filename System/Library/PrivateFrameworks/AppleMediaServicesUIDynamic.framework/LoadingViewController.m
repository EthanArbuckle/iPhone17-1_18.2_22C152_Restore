@interface LoadingViewController
- (UINavigationItem)navigationItem;
- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)init;
- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)initWithCoder:(id)a3;
- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation LoadingViewController

- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF429F18();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_1BF42A038();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_1BF42A0FC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF42A210();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1BF42A290();
}

- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)init
{
}

- (_TtC27AppleMediaServicesUIDynamic21LoadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1BF465FA8();
  }
  id v5 = a4;
  sub_1BF42A91C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic21LoadingViewController_activityIndicator));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic21LoadingViewController_loadingView);
}

@end