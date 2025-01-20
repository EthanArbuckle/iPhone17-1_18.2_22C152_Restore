@interface ErrorViewController
- (UINavigationItem)navigationItem;
- (_TtC26AMSEngagementViewExtension19ErrorViewController)init;
- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithCoder:(id)a3;
- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ErrorViewController

- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100004870();
}

- (UINavigationItem)navigationItem
{
  v2 = self;
  id v3 = sub_10000496C();

  return (UINavigationItem *)v3;
}

- (void)loadView
{
  v2 = self;
  sub_100004A0C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100004AE4();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_100004B64();
}

- (_TtC26AMSEngagementViewExtension19ErrorViewController)init
{
}

- (_TtC26AMSEngagementViewExtension19ErrorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_100009B78();
  }
  id v5 = a4;
  sub_1000051C0();
}

- (void).cxx_destruct
{
  swift_errorRelease();
  sub_1000054B4(*(void *)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_retryAction]);
  id v3 = *(void **)&self->AMSUICommonViewController_opaque[OBJC_IVAR____TtC26AMSEngagementViewExtension19ErrorViewController_contentUnavailableView];
}

@end