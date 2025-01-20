@interface GKLeaderboardViewController
- (GKLeaderboardTimeScope)timeScope;
- (GKLeaderboardViewController)init;
- (id)leaderboardDelegate;
- (void)notifyDelegateOnWillFinish;
- (void)setLeaderboardDelegate:(id)leaderboardDelegate;
@end

@implementation GKLeaderboardViewController

- (GKLeaderboardViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)GKLeaderboardViewController;
  v2 = [(GKGameCenterViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(GKGameCenterViewController *)v2 setViewState:0];
    v4 = [MEMORY[0x1E4F636F0] currentGame];
    v5 = [v4 defaultCategory];
    [(GKGameCenterViewController *)v3 setLeaderboardIdentifier:v5];
  }
  return v3;
}

- (GKLeaderboardTimeScope)timeScope
{
  return 2;
}

- (void)notifyDelegateOnWillFinish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leaderboardDelegate);
  v4 = [(GKGameCenterViewController *)self gameCenterDelegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = WeakRetained;
LABEL_7:
    [v5 leaderboardViewControllerDidFinish:self];
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GKLeaderboardViewController;
      [(GKGameCenterViewController *)&v6 notifyDelegateOnWillFinish];
      goto LABEL_8;
    }
    v5 = v4;
    goto LABEL_7;
  }
  [WeakRetained gameCenterViewControllerDidFinish:self];
LABEL_8:
}

- (id)leaderboardDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leaderboardDelegate);

  return WeakRetained;
}

- (void)setLeaderboardDelegate:(id)leaderboardDelegate
{
}

- (void).cxx_destruct
{
}

@end