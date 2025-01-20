@interface GKDashboardLeaderboardCell
- (BOOL)canBecomeFocused;
- (GKLeaderboard)leaderboard;
- (GKLeaderboardSet)leaderboardSet;
- (NSString)bundleIdentifier;
- (NSString)imageName;
- (UIColor)titleLabelColor;
- (UIImageView)iconView;
- (UILabel)countLabel;
- (UILabel)titleLabel;
- (UIView)overlayView;
- (UIView)popoverSourceView;
- (void)awakeFromNib;
- (void)setBundleIdentifier:(id)a3;
- (void)setCountLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setIconView:(id)a3;
- (void)setImageName:(id)a3;
- (void)setLeaderboard:(id)a3;
- (void)setLeaderboardSet:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleLabelColor:(id)a3;
- (void)updateImage;
- (void)updateRank;
@end

@implementation GKDashboardLeaderboardCell

- (void)awakeFromNib
{
  v4.receiver = self;
  v4.super_class = (Class)GKDashboardLeaderboardCell;
  [(GKDashboardLeaderboardCell *)&v4 awakeFromNib];
  [(GKDashboardLeaderboardCell *)self setClipsToBounds:0];
  [(UIImageView *)self->_iconView setContentMode:2];
  v3 = [(UILabel *)self->_titleLabel textColor];
  [(GKDashboardLeaderboardCell *)self setTitleLabelColor:v3];
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_iconView;
}

- (void)setLeaderboardSet:(id)a3
{
  v5 = (GKLeaderboardSet *)a3;
  p_leaderboardSet = &self->_leaderboardSet;
  if (self->_leaderboardSet != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)p_leaderboardSet, a3);
    v7 = [(GKLeaderboardSet *)v14 title];
    [(UILabel *)self->_titleLabel setText:v7];

    v8 = [(GKLeaderboardSet *)v14 leaderboardIdentifiers];
    [v8 count];
    v9 = NSString;
    v10 = GKGameCenterUIFrameworkBundle();
    v11 = GKGetLocalizedStringFromTableInBundle();

    v12 = GKFormattedStringWithGroupingFromInteger();
    v13 = objc_msgSend(v9, "stringWithFormat:", v11, v12);

    [(UILabel *)self->_countLabel setText:v13];
    p_leaderboardSet = (GKLeaderboardSet **)[(GKDashboardLeaderboardCell *)self updateImage];
    v5 = v14;
  }

  MEMORY[0x1F41817F8](p_leaderboardSet, v5);
}

- (void)setLeaderboard:(id)a3
{
  v6 = (GKLeaderboard *)a3;
  if (self->_leaderboard != v6)
  {
    objc_storeStrong((id *)&self->_leaderboard, a3);
    v5 = [(GKLeaderboard *)v6 title];
    [(UILabel *)self->_titleLabel setText:v5];

    [(GKDashboardLeaderboardCell *)self updateRank];
    [(GKDashboardLeaderboardCell *)self updateImage];
  }
}

- (void)updateRank
{
  if ([(GKLeaderboard *)self->_leaderboard overallRankCount] < 0
    || [(GKLeaderboard *)self->_leaderboard overallRank] < 1)
  {
    GKGameCenterUIFrameworkBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_super v4 = GKGetLocalizedStringFromTableInBundle();
    [(UILabel *)self->_countLabel setText:v4];
  }
  else
  {
    if ([(GKLeaderboard *)self->_leaderboard friendRank] < 1
      || [(GKLeaderboard *)self->_leaderboard friendRankCount] < 2)
    {
      v8 = NSString;
      GKGameCenterUIFrameworkBundle();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v4 = GKGetLocalizedStringFromTableInBundle();
      [(GKLeaderboard *)self->_leaderboard overallRank];
      v5 = GKFormattedStringWithGroupingFromInteger();
      v9 = objc_msgSend(v8, "stringWithFormat:", v4, v5);
      [(UILabel *)self->_countLabel setText:v9];
    }
    else
    {
      v3 = NSString;
      GKGameCenterUIFrameworkBundle();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_super v4 = GKGetLocalizedStringFromTableInBundle();
      [(GKLeaderboard *)self->_leaderboard friendRank];
      v5 = GKFormattedStringWithGroupingFromInteger();
      [(GKLeaderboard *)self->_leaderboard friendRankCount];
      v6 = GKFormattedStringWithGroupingFromInteger();
      v7 = objc_msgSend(v3, "stringWithFormat:", v4, v5, v6, -[GKLeaderboard friendRankCount](self->_leaderboard, "friendRankCount"));
      [(UILabel *)self->_countLabel setText:v7];
    }
  }
}

- (void)updateImage
{
  [(UIImageView *)self->_iconView setImage:0];
  leaderboardSet = self->_leaderboardSet;
  objc_super v4 = [MEMORY[0x1E4F63A10] sharedTheme];
  v5 = v4;
  if (leaderboardSet) {
    [v4 iconLeaderboardSetListSource];
  }
  else {
  v6 = [v4 iconLeaderboardListSource];
  }

  v7 = [(UIImageView *)self->_iconView image];

  if (!v7)
  {
    leaderboard = self->_leaderboardSet;
    if (!leaderboard) {
      leaderboard = self->_leaderboard;
    }
    v9 = [leaderboard identifier];
    id v10 = [v6 cachedImageForIdentifier:v9];
    [(UIImageView *)self->_iconView setImage:v10];
  }
  v11 = [(UIImageView *)self->_iconView image];

  if (v11)
  {
    [(GKDashboardLeaderboardCell *)self updateOverlay];
    [(GKDashboardLeaderboardCell *)self setNeedsDisplay];
  }
  else
  {
    v12 = self->_leaderboardSet;
    if (!v12) {
      v12 = self->_leaderboard;
    }
    v13 = [v12 imageURL];
    v14 = self->_leaderboardSet;
    if (!v14) {
      v14 = self->_leaderboard;
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__GKDashboardLeaderboardCell_updateImage__block_invoke;
    v15[3] = &unk_1E5F633A8;
    v15[4] = self;
    id v16 = v6;
    [v16 loadImageForURLString:v13 reference:v14 queue:MEMORY[0x1E4F14428] handler:v15];
  }
}

void __41__GKDashboardLeaderboardCell_updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  v6 = [*(id *)(a1 + 32) leaderboardSet];
  if ([v6 isEqual:v5])
  {
  }
  else
  {
    v7 = [*(id *)(a1 + 32) leaderboard];
    int v8 = [v7 isEqual:v5];

    if (!v8) {
      goto LABEL_7;
    }
  }
  uint64_t v9 = (uint64_t)v11;
  if (!v11)
  {
    uint64_t v9 = [*(id *)(a1 + 40) defaultImage];
  }
  id v11 = (id)v9;
  id v10 = [*(id *)(a1 + 32) iconView];
  [v10 setImage:v11];

  [*(id *)(a1 + 32) updateOverlay];
  [*(id *)(a1 + 32) setNeedsDisplay];
LABEL_7:
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardLeaderboardCell;
  -[GKDashboardLeaderboardCell setHighlighted:](&v7, sel_setHighlighted_);
  if (v3)
  {
    id v5 = [MEMORY[0x1E4FB1618] _gkSelectedCellBackgroundColor];
  }
  else
  {
    id v5 = 0;
  }
  v6 = [(GKDashboardLeaderboardCell *)self contentView];
  [v6 setBackgroundColor:v5];

  if (v3) {
}
  }

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardLeaderboardCell;
  -[GKDashboardLeaderboardCell setSelected:](&v8, sel_setSelected_);
  id v5 = [(GKDashboardLeaderboardCell *)self layer];
  [v5 setBackgroundColor:0];

  if (v3)
  {
    v6 = [MEMORY[0x1E4FB1618] _gkSelectedCellBackgroundColor];
  }
  else
  {
    v6 = 0;
  }
  objc_super v7 = [(GKDashboardLeaderboardCell *)self contentView];
  [v7 setBackgroundColor:v6];

  if (v3) {
}
  }

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)imageName
{
  return self->_imageName;
}

- (void)setImageName:(id)a3
{
}

- (GKLeaderboardSet)leaderboardSet
{
  return self->_leaderboardSet;
}

- (GKLeaderboard)leaderboard
{
  return self->_leaderboard;
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)countLabel
{
  return self->_countLabel;
}

- (void)setCountLabel:(id)a3
{
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIColor)titleLabelColor
{
  return self->_titleLabelColor;
}

- (void)setTitleLabelColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabelColor, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_leaderboard, 0);
  objc_storeStrong((id *)&self->_leaderboardSet, 0);
  objc_storeStrong((id *)&self->_imageName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end