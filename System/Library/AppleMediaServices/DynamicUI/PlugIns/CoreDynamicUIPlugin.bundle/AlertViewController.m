@interface AlertViewController
- (UINavigationItem)navigationItem;
- (_TtC19CoreDynamicUIPlugin19AlertViewController)init;
- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation AlertViewController

- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_F3BC();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_F488();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_F54C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_F62C();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_F6AC();
}

- (_TtC19CoreDynamicUIPlugin19AlertViewController)init
{
}

- (_TtC19CoreDynamicUIPlugin19AlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_8F9D0();
  }
  id v5 = a4;
  sub_F94C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC19CoreDynamicUIPlugin19AlertViewController____lazy_storage___contentUnavailableView];
}

@end