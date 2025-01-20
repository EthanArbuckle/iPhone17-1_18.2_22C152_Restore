@interface GKChallengeCreationViewController
- (GKChallengeCreationViewController)init;
- (GKChallengeCreationViewController)initWithBaseLeaderboardID:(id)a3;
- (GKChallengeCreationViewController)initWithCoder:(id)a3;
- (GKChallengeCreationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GKChallengeCreationViewController

- (GKChallengeCreationViewController)init
{
  return (GKChallengeCreationViewController *)GKChallengeCreationViewController.init()();
}

- (GKChallengeCreationViewController)initWithBaseLeaderboardID:(id)a3
{
  uint64_t v3 = sub_1AF7AE0E0();
  return (GKChallengeCreationViewController *)GKChallengeCreationViewController.init(baseLeaderboardID:)(v3, v4);
}

- (GKChallengeCreationViewController)initWithCoder:(id)a3
{
}

- (void)viewWillAppear:(BOOL)a3
{
  unint64_t v4 = self;
  GKChallengeCreationViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  unint64_t v4 = self;
  GKChallengeCreationViewController.viewWillDisappear(_:)(a3);
}

- (GKChallengeCreationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  GKChallengeCreationViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___GKChallengeCreationViewController_proxy);
}

@end