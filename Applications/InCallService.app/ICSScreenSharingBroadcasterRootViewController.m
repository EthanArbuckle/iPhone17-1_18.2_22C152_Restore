@interface ICSScreenSharingBroadcasterRootViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)prefersStatusBarHidden;
- (ICSScreenSharingBroadcasterRootViewController)initWithCoder:(id)a3;
- (ICSScreenSharingBroadcasterRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ICSScreenSharingBroadcasterRootViewController

- (ICSScreenSharingBroadcasterRootViewController)initWithCoder:(id)a3
{
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10017B9AC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10017BDF8(a3);
}

- (ICSScreenSharingBroadcasterRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  sub_10017BE90();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICSScreenSharingBroadcasterRootViewController_containerViewController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICSScreenSharingBroadcasterRootViewController_bannerPresentationManager);
}

@end