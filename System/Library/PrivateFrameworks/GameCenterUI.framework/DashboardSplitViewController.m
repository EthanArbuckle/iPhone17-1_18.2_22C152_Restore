@interface DashboardSplitViewController
- (_TtC12GameCenterUI28DashboardSplitViewController)init;
- (_TtC12GameCenterUI28DashboardSplitViewController)initWithCoder:(id)a3;
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DashboardSplitViewController

- (_TtC12GameCenterUI28DashboardSplitViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF4B5A90();
}

- (void)viewDidLoad
{
  v2 = self;
  DashboardSplitViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  DashboardSplitViewController.viewWillAppear(_:)(a3);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  DashboardSplitViewController.splitViewController(_:willChangeTo:)(&v7->super.super, (UISplitViewControllerDisplayMode)a4);
}

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  id v6 = (UISplitViewController *)a3;
  v7 = self;
  UISplitViewControllerColumn v8 = DashboardSplitViewController.splitViewController(_:topColumnForCollapsingToProposedTopColumn:)(v6, (UISplitViewControllerColumn)a4);

  return v8;
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v6 = (UISplitViewController *)a3;
  v7 = self;
  UISplitViewControllerDisplayMode v8 = DashboardSplitViewController.splitViewController(_:displayModeForExpandingToProposedDisplayMode:)(v6, (UISplitViewControllerDisplayMode)a4);

  return v8;
}

- (_TtC12GameCenterUI28DashboardSplitViewController)init
{
}

- (void).cxx_destruct
{
  sub_1AF4B5DF0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController____lazy_storage___dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController_request));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController____lazy_storage___sidebarViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28DashboardSplitViewController____lazy_storage___primaryNavigationController));

  swift_bridgeObjectRelease();
}

@end