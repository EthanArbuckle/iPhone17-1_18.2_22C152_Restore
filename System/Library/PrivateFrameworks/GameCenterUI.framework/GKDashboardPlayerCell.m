@interface GKDashboardPlayerCell
+ (CGSize)defaultSize;
+ (double)preferredCollectionHeight;
- (BOOL)canBecomeFocused;
- (BOOL)onDarkBackground;
- (GKDashboardPlayerShadowView)playerView;
- (GKPlayer)player;
- (NSLayoutConstraint)playerViewBottomToNameLabelTopConstraint;
- (UIColor)defaultContentBackgroundColor;
- (UIColor)nameColor;
- (UIColor)statusColor;
- (UILabel)nameLabel;
- (UILabel)statusLabel;
- (UIView)popoverSourceView;
- (double)playerViewBottomToNameLabelTopConstant;
- (void)awakeFromNib;
- (void)setDefaultContentBackgroundColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNameColor:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setNameText:(id)a3;
- (void)setOnDarkBackground:(BOOL)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPlayerViewBottomToNameLabelTopConstant:(double)a3;
- (void)setPlayerViewBottomToNameLabelTopConstraint:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStatusColor:(id)a3;
- (void)setStatusLabel:(id)a3;
- (void)setStatusText:(id)a3;
- (void)setStatusWithLastPlayedDate:(id)a3;
- (void)updateLabelColorForDashboard;
@end

@implementation GKDashboardPlayerCell

+ (CGSize)defaultSize
{
  double v2 = 320.0;
  double v3 = 58.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)preferredCollectionHeight
{
  return 81.0;
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)GKDashboardPlayerCell;
  [(GKFocusHighlightingCollectionViewCell *)&v5 awakeFromNib];
  double v3 = [(UILabel *)self->_nameLabel textColor];
  [(GKDashboardPlayerCell *)self setNameColor:v3];

  v4 = [(UILabel *)self->_statusLabel textColor];
  [(GKDashboardPlayerCell *)self setStatusColor:v4];

  [(NSLayoutConstraint *)self->_playerViewBottomToNameLabelTopConstraint constant];
  -[GKDashboardPlayerCell setPlayerViewBottomToNameLabelTopConstant:](self, "setPlayerViewBottomToNameLabelTopConstant:");
  [(GKDashboardPlayerCell *)self setClipsToBounds:0];
  [(GKDashboardPlayerCell *)self setDefaultContentBackgroundColor:0];
  [(UILabel *)self->_statusLabel setText:0];
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_playerView;
}

- (void)setOnDarkBackground:(BOOL)a3
{
  if (self->_onDarkBackground != a3)
  {
    self->_onDarkBackground = a3;
    if (a3)
    {
      v4 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)self->_nameLabel setTextColor:v4];

      id v7 = [MEMORY[0x1E4FB1618] whiteColor];
      [(UILabel *)self->_statusLabel setTextColor:v7];
    }
    else
    {
      [(UILabel *)self->_nameLabel setTextColor:self->_nameColor];
      statusColor = self->_statusColor;
      statusLabel = self->_statusLabel;
      [(UILabel *)statusLabel setTextColor:statusColor];
    }
  }
}

- (void)setPlayer:(id)a3
{
  v6 = (GKPlayer *)a3;
  if (self->_player != v6)
  {
    objc_storeStrong((id *)&self->_player, a3);
    [(GKDashboardPlayerShadowView *)self->_playerView setPlayer:v6];
    objc_super v5 = [(GKPlayer *)v6 displayNameWithOptions:0];
    [(GKDashboardPlayerCell *)self setNameText:v5];
  }
}

- (void)setNameText:(id)a3
{
}

- (void)setStatusText:(id)a3
{
}

- (void)setStatusWithLastPlayedDate:(id)a3
{
  id v4 = [a3 _gkFormattedWhenStringWithOptions:0];
  [(GKDashboardPlayerCell *)self setStatusText:v4];
}

- (void)updateLabelColorForDashboard
{
  double v3 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(GKDashboardPlayerCell *)self setNameColor:v3];

  if (self->_onDarkBackground || ([(GKDashboardPlayerCell *)self isFocused] & 1) != 0)
  {
    id v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UILabel *)self->_nameLabel setTextColor:v6];
  }
  else
  {
    nameColor = self->_nameColor;
    nameLabel = self->_nameLabel;
    [(UILabel *)nameLabel setTextColor:nameColor];
  }
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKDashboardPlayerCell;
  -[GKDashboardPlayerCell setHighlighted:](&v7, sel_setHighlighted_);
  if (v3) {
    [MEMORY[0x1E4FB1618] _gkSelectedCellBackgroundColor];
  }
  else {
  objc_super v5 = [(GKDashboardPlayerCell *)self defaultContentBackgroundColor];
  }
  id v6 = [(GKDashboardPlayerCell *)self contentView];
  [v6 setBackgroundColor:v5];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKDashboardPlayerCell;
  -[GKDashboardPlayerCell setSelected:](&v8, sel_setSelected_);
  objc_super v5 = [(GKDashboardPlayerCell *)self layer];
  [v5 setBackgroundColor:0];

  if (v3) {
    [MEMORY[0x1E4FB1618] _gkSelectedCellBackgroundColor];
  }
  else {
  id v6 = [(GKDashboardPlayerCell *)self defaultContentBackgroundColor];
  }
  objc_super v7 = [(GKDashboardPlayerCell *)self contentView];
  [v7 setBackgroundColor:v6];
}

- (GKPlayer)player
{
  return self->_player;
}

- (BOOL)onDarkBackground
{
  return self->_onDarkBackground;
}

- (UIColor)defaultContentBackgroundColor
{
  return self->_defaultContentBackgroundColor;
}

- (void)setDefaultContentBackgroundColor:(id)a3
{
}

- (GKDashboardPlayerShadowView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  self->_playerView = (GKDashboardPlayerShadowView *)a3;
}

- (NSLayoutConstraint)playerViewBottomToNameLabelTopConstraint
{
  return self->_playerViewBottomToNameLabelTopConstraint;
}

- (void)setPlayerViewBottomToNameLabelTopConstraint:(id)a3
{
  self->_playerViewBottomToNameLabelTopConstraint = (NSLayoutConstraint *)a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  self->_nameLabel = (UILabel *)a3;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  self->_statusLabel = (UILabel *)a3;
}

- (UIColor)nameColor
{
  return self->_nameColor;
}

- (void)setNameColor:(id)a3
{
}

- (UIColor)statusColor
{
  return self->_statusColor;
}

- (void)setStatusColor:(id)a3
{
}

- (double)playerViewBottomToNameLabelTopConstant
{
  return self->_playerViewBottomToNameLabelTopConstant;
}

- (void)setPlayerViewBottomToNameLabelTopConstant:(double)a3
{
  self->_playerViewBottomToNameLabelTopConstant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusColor, 0);
  objc_storeStrong((id *)&self->_nameColor, 0);
  objc_storeStrong((id *)&self->_defaultContentBackgroundColor, 0);

  objc_storeStrong((id *)&self->_player, 0);
}

@end