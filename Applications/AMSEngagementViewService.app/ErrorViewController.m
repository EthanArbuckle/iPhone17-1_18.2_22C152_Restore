@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC24AMSEngagementViewService19ErrorViewController)init;
- (_TtC24AMSEngagementViewService19ErrorViewController)initWithCoder:(id)a3;
- (_TtC24AMSEngagementViewService19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC24AMSEngagementViewService19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100003F04();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_100004000();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_1000040A0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004178();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_1000041F8();
}

- (_TtC24AMSEngagementViewService19ErrorViewController)init
{
}

- (_TtC24AMSEngagementViewService19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_100004854();
}

- (void).cxx_destruct
{
  swift_errorRelease();
  sub_100004A54(*(void *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction]);
  id v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView];
}

@end