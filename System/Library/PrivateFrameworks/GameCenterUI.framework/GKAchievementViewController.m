@interface GKAchievementViewController
- (GKAchievementViewController)init;
- (id)achievementDelegate;
- (void)dealloc;
- (void)notifyDelegateOnWillFinish;
- (void)setAchievementDelegate:(id)achievementDelegate;
@end

@implementation GKAchievementViewController

- (GKAchievementViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GKAchievementViewController;
  v2 = [(GKGameCenterViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GKGameCenterViewController *)v2 setViewState:1];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F63A10] sharedTheme];
  [v3 clearResourceCache];

  v4.receiver = self;
  v4.super_class = (Class)GKAchievementViewController;
  [(GKGameCenterViewController *)&v4 dealloc];
}

- (void)notifyDelegateOnWillFinish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementDelegate);
  objc_super v4 = [(GKGameCenterViewController *)self gameCenterDelegate];
  if (objc_opt_respondsToSelector())
  {
    objc_super v5 = WeakRetained;
LABEL_7:
    [v5 achievementViewControllerDidFinish:self];
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      v6.receiver = self;
      v6.super_class = (Class)GKAchievementViewController;
      [(GKGameCenterViewController *)&v6 notifyDelegateOnWillFinish];
      goto LABEL_8;
    }
    objc_super v5 = v4;
    goto LABEL_7;
  }
  [WeakRetained gameCenterViewControllerDidFinish:self];
LABEL_8:
}

- (id)achievementDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_achievementDelegate);

  return WeakRetained;
}

- (void)setAchievementDelegate:(id)achievementDelegate
{
}

- (void).cxx_destruct
{
}

@end