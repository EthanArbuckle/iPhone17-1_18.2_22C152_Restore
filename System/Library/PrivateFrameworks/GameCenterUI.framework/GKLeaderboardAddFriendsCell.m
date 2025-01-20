@interface GKLeaderboardAddFriendsCell
- (BOOL)lineVisible;
- (CGSize)preferredLayoutSizeFittingSize:(CGSize)a3;
- (UIView)container;
- (UIView)topLine;
- (_TtC12GameCenterUI14EmptyStateView)noFriendsView;
- (_TtC12GameCenterUI22GKAddFriendsLockupView)addFriendsLockupView;
- (int64_t)friendCount;
- (void)awakeFromNib;
- (void)clearContainer;
- (void)configureAddFriendsLockupWithMetricsPageId:(id)a3 handler:(id)a4;
- (void)configureNoFriendsViewWithHandler:(id)a3;
- (void)setAddFriendsLockupView:(id)a3;
- (void)setContainer:(id)a3;
- (void)setFriendCount:(int64_t)a3;
- (void)setLineVisible:(BOOL)a3;
- (void)setNoFriendsView:(id)a3;
- (void)setTopLine:(id)a3;
@end

@implementation GKLeaderboardAddFriendsCell

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)GKLeaderboardAddFriendsCell;
  [(GKLeaderboardAddFriendsCell *)&v2 awakeFromNib];
}

- (CGSize)preferredLayoutSizeFittingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  [(GKLeaderboardAddFriendsCell *)v5 frame];
  -[GKLeaderboardAddFriendsCell setFrame:](v5, "setFrame:");
  [(GKLeaderboardAddFriendsCell *)v5 setNeedsLayout];
  [(GKLeaderboardAddFriendsCell *)v5 layoutIfNeeded];
  v6 = [(GKLeaderboardAddFriendsCell *)v5 container];
  v7 = [v6 subviews];

  if (!v7) {
    goto LABEL_6;
  }
  v8 = [(GKLeaderboardAddFriendsCell *)v5 container];
  v9 = [v8 subviews];
  v10 = [v9 objectAtIndexedSubscript:0];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

LABEL_6:
      double v12 = *MEMORY[0x1E4F1DB30];
      double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_7;
    }
  }
  objc_msgSend(v10, "measurementsWithFitting:in:", v5, width, height);
  double v12 = v11;
  double v14 = v13;

LABEL_7:
  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (void)configureAddFriendsLockupWithMetricsPageId:(id)a3 handler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(GKLeaderboardAddFriendsCell *)self topLine];
  [v8 setHidden:0];

  [(GKLeaderboardAddFriendsCell *)self clearContainer];
  BOOL v9 = [(GKLeaderboardAddFriendsCell *)self friendCount] < 1;
  v10 = [_TtC12GameCenterUI22GKAddFriendsLockupView alloc];
  double v14 = [(GKAddFriendsLockupView *)v10 initWithFrame:v9, v7, @"leaderboard", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24) friendState metricsPageId metricsPageType];

  [(GKAddFriendsLockupView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v11 = [(GKLeaderboardAddFriendsCell *)self container];
  [v11 addSubview:v14];

  double v12 = (void *)MEMORY[0x1E4F28DC8];
  double v13 = [(GKLeaderboardAddFriendsCell *)self container];
  [v12 _gkInstallEdgeConstraintsForView:v14 containedWithinParentView:v13];

  [(GKAddFriendsLockupView *)v14 setAddFriendsHandler:v6];
}

- (void)configureNoFriendsViewWithHandler:(id)a3
{
  id v4 = a3;
  v5 = [(GKLeaderboardAddFriendsCell *)self topLine];
  [v5 setHidden:1];

  [(GKLeaderboardAddFriendsCell *)self clearContainer];
  if ([(GKLeaderboardAddFriendsCell *)self friendCount] <= 0) {
    +[EmptyStateView addFriendsEmptyStateView];
  }
  else {
  id v9 = +[EmptyStateView addAdditionalFriendsEmptyStateView];
  }
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v6 = [(GKLeaderboardAddFriendsCell *)self container];
  [v6 addSubview:v9];

  id v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = [(GKLeaderboardAddFriendsCell *)self container];
  [v7 _gkInstallEdgeConstraintsForView:v9 containedWithinParentView:v8];

  [v9 setButtonActionBlock:v4];
}

- (void)clearContainer
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v2 = [(GKLeaderboardAddFriendsCell *)self container];
  v3 = [v2 subviews];
  id v4 = (void *)[v3 copy];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "removeFromSuperview", (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)setLineVisible:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(GKLeaderboardAddFriendsCell *)self topLine];
  [v4 setHidden:v3];
}

- (BOOL)lineVisible
{
  objc_super v2 = [(GKLeaderboardAddFriendsCell *)self topLine];
  char v3 = [v2 isHidden] ^ 1;

  return v3;
}

- (int64_t)friendCount
{
  return self->_friendCount;
}

- (void)setFriendCount:(int64_t)a3
{
  self->_friendCount = a3;
}

- (_TtC12GameCenterUI22GKAddFriendsLockupView)addFriendsLockupView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addFriendsLockupView);

  return (_TtC12GameCenterUI22GKAddFriendsLockupView *)WeakRetained;
}

- (void)setAddFriendsLockupView:(id)a3
{
}

- (_TtC12GameCenterUI14EmptyStateView)noFriendsView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_noFriendsView);

  return (_TtC12GameCenterUI14EmptyStateView *)WeakRetained;
}

- (void)setNoFriendsView:(id)a3
{
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (UIView)topLine
{
  return self->_topLine;
}

- (void)setTopLine:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topLine, 0);
  objc_storeStrong((id *)&self->_container, 0);
  objc_destroyWeak((id *)&self->_noFriendsView);

  objc_destroyWeak((id *)&self->_addFriendsLockupView);
}

@end