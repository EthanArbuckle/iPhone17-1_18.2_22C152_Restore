@interface NavigationSplitCoordinator
- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4;
- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4;
- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4;
- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4;
@end

@implementation NavigationSplitCoordinator

- (int64_t)splitViewController:(id)a3 topColumnForCollapsingToProposedTopColumn:(int64_t)a4
{
  return 3;
}

- (void)splitViewController:(id)a3 willShowColumn:(int64_t)a4
{
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  v5 = (UISplitViewController *)a3;
  swift_retain();
  NavigationSplitCoordinator.splitViewController(_:willChangeTo:)(v5, (UISplitViewControllerDisplayMode)a4);

  swift_release();
}

- (void)splitViewController:(id)a3 willHideColumn:(int64_t)a4
{
}

- (int64_t)splitViewController:(id)a3 displayModeForExpandingToProposedDisplayMode:(int64_t)a4
{
  id v5 = a3;
  swift_retain();
  UISplitViewControllerDisplayMode v6 = specialized NavigationSplitCoordinator.splitViewController(_:displayModeForExpandingToProposedDisplayMode:)((UISplitViewControllerDisplayMode)a4);

  swift_release();
  return v6;
}

- (void)_splitViewController:(id)a3 didChangeFromDisplayMode:(int64_t)a4 toDisplayMode:(int64_t)a5
{
  id v6 = a3;
  swift_retain();
  swift_retain();
  specialized NavigationSplitSidebarStateMachine.splitViewController(_:didChangeTo:)(a5);

  swift_release();

  swift_release();
}

@end