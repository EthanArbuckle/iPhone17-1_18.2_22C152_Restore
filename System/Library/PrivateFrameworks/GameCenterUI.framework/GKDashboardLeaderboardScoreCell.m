@interface GKDashboardLeaderboardScoreCell
+ (CGSize)defaultSize;
+ (id)highRankNib;
+ (id)lowRankNib;
- (BOOL)linesVisible;
- (GKDashboardPlayerPhotoView)playerView;
- (GKScore)score;
- (NSLayoutConstraint)playerViewHeightConstraint;
- (UILabel)nameLabel;
- (UILabel)rankLabel;
- (UILabel)scoreLabel;
- (UIView)bottomLine;
- (UIView)monogramColorView;
- (UIView)popoverSourceView;
- (UIView)topLine;
- (void)awakeFromNib;
- (void)setBottomLine:(id)a3;
- (void)setLinesVisible:(BOOL)a3;
- (void)setMonogramColorView:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPlayerView:(id)a3;
- (void)setPlayerViewHeightConstraint:(id)a3;
- (void)setRankLabel:(id)a3;
- (void)setScore:(id)a3;
- (void)setScoreLabel:(id)a3;
- (void)setTopLine:(id)a3;
- (void)setupForScore:(id)a3;
@end

@implementation GKDashboardLeaderboardScoreCell

+ (CGSize)defaultSize
{
  double v2 = 58.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

+ (id)lowRankNib
{
  double v2 = objc_opt_class();

  return (id)[v2 _gkNibWithBaseName:@"GKDashboardLeaderboardScoreLowRankCell"];
}

+ (id)highRankNib
{
  double v2 = objc_opt_class();

  return (id)[v2 _gkNibWithBaseName:@"GKDashboardLeaderboardScoreHighRankCell"];
}

- (void)awakeFromNib
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardLeaderboardScoreCell;
  [(GKRectShadowCell *)&v3 awakeFromNib];
  [(GKDashboardPlayerPhotoView *)self->_playerView setUseDarkerPlaceholder:1];
  [(GKDashboardPlayerPhotoView *)self->_playerView setAvatarSize:0x10000];
}

- (UIView)popoverSourceView
{
  return (UIView *)self->_playerView;
}

- (void)setScore:(id)a3
{
  v5 = (GKScore *)a3;
  if (self->_score != v5)
  {
    objc_storeStrong((id *)&self->_score, a3);
    [(GKDashboardLeaderboardScoreCell *)self setupForScore:v5];
  }
}

- (void)setupForScore:(id)a3
{
  id v4 = a3;
  id v8 = [v4 player];
  [(UIView *)self->_monogramColorView setHidden:0];
  [(GKDashboardPlayerPhotoView *)self->_playerView setPlayer:v8];
  v5 = [v8 displayNameWithOptions:0];
  [(UILabel *)self->_nameLabel setText:v5];

  [v4 rank];
  v6 = GKFormattedStringWithGroupingFromInteger();
  [(UILabel *)self->_rankLabel setText:v6];

  v7 = [v4 formattedValue];

  [(UILabel *)self->_scoreLabel setText:v7];
}

- (void)setLinesVisible:(BOOL)a3
{
  BOOL v4 = !a3;
  [(UIView *)self->_topLine setHidden:v4];
  bottomLine = self->_bottomLine;

  [(UIView *)bottomLine setHidden:v4];
}

- (BOOL)linesVisible
{
  if ([(UIView *)self->_topLine isHidden]) {
    return 0;
  }
  else {
    return ![(UIView *)self->_bottomLine isHidden];
  }
}

- (GKScore)score
{
  return self->_score;
}

- (GKDashboardPlayerPhotoView)playerView
{
  return self->_playerView;
}

- (void)setPlayerView:(id)a3
{
  self->_playerView = (GKDashboardPlayerPhotoView *)a3;
}

- (NSLayoutConstraint)playerViewHeightConstraint
{
  return self->_playerViewHeightConstraint;
}

- (void)setPlayerViewHeightConstraint:(id)a3
{
}

- (UILabel)rankLabel
{
  return self->_rankLabel;
}

- (void)setRankLabel:(id)a3
{
  self->_rankLabel = (UILabel *)a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  self->_nameLabel = (UILabel *)a3;
}

- (UILabel)scoreLabel
{
  return self->_scoreLabel;
}

- (void)setScoreLabel:(id)a3
{
  self->_scoreLabel = (UILabel *)a3;
}

- (UIView)topLine
{
  return self->_topLine;
}

- (void)setTopLine:(id)a3
{
  self->_topLine = (UIView *)a3;
}

- (UIView)bottomLine
{
  return self->_bottomLine;
}

- (void)setBottomLine:(id)a3
{
  self->_bottomLine = (UIView *)a3;
}

- (UIView)monogramColorView
{
  return self->_monogramColorView;
}

- (void)setMonogramColorView:(id)a3
{
  self->_monogramColorView = (UIView *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerViewHeightConstraint, 0);

  objc_storeStrong((id *)&self->_score, 0);
}

@end